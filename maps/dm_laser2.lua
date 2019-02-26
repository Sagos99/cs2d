minutos = 30       --(ESCOLHA QUANTOS MINUTOS QUER NO SERVER)--
segundos = 60     --(NÃO MODIFIQUE AQUI)
restart = 0      --(NÃO MODIFIQUE AQUI)

--------------------------Round Restart Em ???-----------------------------
addhook("second","segundos2")
function segundos2()
if segundos > 9 then
parse("hudtxt 1 \"Round Restart Em: "..minutos..":"..segundos.."\" 245 442 0")
end
if segundos < 10 then
parse("hudtxt 1 \"Round Restart Em: "..minutos..":0"..segundos.."\" 245 442 0")
end
segundos = segundos-1
if segundos == -1 then
segundos = 59
minutos = minutos-1
end
if minutos == 0 then
if segundos == 8 then
parse("sv_restart 10")
end
end
----------------------------------------------------------------------------



--------------------------Vezes Que Deu Restart-----------------------------
if restart == 0 then
parse("hudtxt 2 \"Round Restart Nenhuma Vez\" 245 456 0")
end
if restart > 1 then
parse("hudtxt 2 \"Round Restart "..restart.." Vezes\" 245 456 0")
end
if restart < 2 and restart > 0 then
parse("hudtxt 2 \"Round Restart "..restart.." Vez\" 245 456 0")
end
end
--------------------------------------------------------------------



addhook("startround","recomecar")
function recomecar()
parse("sv_gamemode 1")
parse("mp_wpndmg knife 999999")
minutos = 2
segundos = 60
restart = restart+1
end

----------------------------------------------------------------
--LUA Lag Compensation version 1.0.1 + LaserMod 1.1.0 by FlooD -
----------------------------------------------------------------
--thx to Jermuk for his custom server, which first encouraged---
--    me to make lag compensation.------------------------------
--thx to lasthope and def3ct for initial testing.---------------
--thx to 3rr0r for ideas and suggestions for refining the code.-
-- modded by Kiffer-Opa: added colorful laser beams
----------------------------------------------------------------
--visit cs2d.nl/index.php?mod=board&action=thread&where=120 for-
--    the lastest version and information-----------------------
----------------------------------------------------------------

lm = {}		-- main table

--[[initialization, arrays, lm.reseting]]--------------------------
math.randomseed(os.time())
math.randomseed(os.time() * math.sin(os.time() * math.random()))

--[[ SETTINS ]]
lm.max_images = 100	--lower to decrease lag
lm.IOR = {1, 1.5, 0}	--index of refraction of ground, obstacle, wall. < 1 means mirror.
lm.power_threshold=0.01	--raise to decrease lag
lm.gamma = 1 / 2.2	--how bright faint lines are
lm.fade_factor = 33.333	--how long lines last
lm.meleelaser = false	--wheather melee weapons have laser physics, too or not
lm.selfhurt = false	--wheather players can hurt themselves with their mirrored shots or not
lm.spawntimer = 150	--how many frames a player gets protected after spawn (should be as long as the original CS2D spawn protection, which is 150, as of CS2D 0.1.1.9)
lm.notcompensated = {0, 46, 47, 48, 49, 77, 86, 87, 253, 254, 255}
			-- weapons whose bullets are not compensated (item IDs)
                  
--[[ END OF SETTINS ]]

lm.images = 0
lm.ping = {} --array of filtered lm.pings of living players
lm.mode = {{}, {}, {}, {}} --glock burst, famas burst, zoom, laser color
lm.spawnprotection = {} -- how many frames spawn protection are left for each player
lm.buffer = {{}, {}} --lm.buffer of current and past positions in x and y coordinates
lm.enable = {} --whether lag comp is lm.enabled for one player
lm.disabled = {} --weapons whose bullets are not compensated
for i, v in ipairs(lm.notcompensated) do
	lm.disabled[v] = true
end

lm.armor = {} --special lm.armor protection values
for i, v in ipairs({25, 50, 75, 50, 95}) do
	lm.armor[200 + i] = 1 - (v / 100)
end

function lm.reset(id)
	lm.mode[1][id] = 0
	lm.mode[2][id] = 0
	lm.mode[3][id] = 0
	lm.mode[4][id] = 0
	lm.buffer[1][id] = {}
	lm.buffer[2][id] = {}
	lm.ping[id] = nil
	lm.spawnprotection[id] = 0
end

function lm.clear(id)
	lm.reset(id)
	lm.enable[id] = 1
end

for i = 1, 32 do --initial
	lm.clear(i)
end
addhook("leave", "lm.clear")
addhook("die", "lm.reset")

function lm.updateping(id)
	local actualping = player(id, "ping")
	local lastping = lm.ping[id]
	if not lastping then lastping = 0 end
	if actualping then
		if actualping - lastping <= 30 or lastping == 0 then --regular
			lm.ping[id] = actualping
		else --spike is "damped"
			lm.ping[id] = 0.7 * lastping + 0.3 * actualping
		end
	end
end
addhook("spawn", "lm.updateping")
----------------------------------------------------------------

function lm.startspawnprotection(id)
	if (game("sv_gamemode")~="0") then
		lm.spawnprotection[id]=lm.spawntimer
	end
end
addhook("spawn","lm.startspawnprotection")


--[[periodic functions]]----------------------------------------
lm.frame = 1
lm.BUFFER_SIZE = 25
function lm.updatebuffer()
	lm.frame = lm.frame + 1
	for i in pairs(lm.ping) do
		lm.buffer[1][i][lm.frame], lm.buffer[2][i][lm.frame] = player(i, "x"), player(i, "y")
		lm.buffer[1][i][lm.frame - lm.BUFFER_SIZE], lm.buffer[2][i][lm.frame - lm.BUFFER_SIZE] = nil, nil
	end
	lm.images = 0
end
addhook("always", "lm.updatebuffer")

function lm.onsecond()
	for i in pairs(lm.ping) do
		lm.updateping(i)
	end
end
addhook("second", "lm.onsecond")
----------------------------------------------------------------


--[[new hit system]]--------------------------------------------
function lm.uselaserhitsystem(id, wpn)
	local slot=itemtype(wpn,"slot")

	--cs2d's internal hit system will be preserved in these cases
	return (lm.disabled[wpn] or lm.enable[id] ~= 1 or (slot==3 and not lm.meleelaser) or slot==4 or slot==5)
end

addhook("always","lm.reducespawnprotectiontimer")
function lm.reducespawnprotectiontimer()
	local players = player(0,"tableliving")
	for i=1,#players do
		local p = players[i]
		lm.spawnprotection[p] = lm.spawnprotection[p] - 1
	end
end


addhook("hit", "lm.onhit")
function lm.onhit(v, id, wpn)
	local slot=itemtype(wpn,"slot")
	if lm.uselaserhitsystem(id,wpn) or id == 0 then
		return 0
	end
	return 1
end

addhook("attack", "lm.onattack")
function lm.onattack(id)
	local wpn = player(id, "weapon")
	
	if lm.uselaserhitsystem(id,wpn) then
		return
	end

	local dmg = itemtype(wpn, "dmg") * game("mp_damagefactor")

	if (wpn == 2 and lm.mode[1][id] == 1) or (wpn == 39 and lm.mode[2][id] == 1) then --burst weapons
		dmg = math.floor(dmg * 0.64 + 0.5)
		local rot1 = player(id, "rot") - 6 + 12 * math.random()
		local rot2 = player(id, "rot") + 6 + 8 * math.random()
		local rot3 = player(id, "rot") - 6 - 8 * math.random()
		lm.simulate_attack(id, wpn, dmg, rot1)
		lm.simulate_attack(id, wpn, dmg, rot2)
		lm.simulate_attack(id, wpn, dmg, rot3)
		return
	elseif wpn == 10 or wpn == 11 then
		for i=1,5 do
			lm.simulate_attack(id, wpn, dmg, player(id, "rot") - 20 + 40 * math.random(), 180)
		end
		return
	end
	
	if lm.mode[3][id] == 1 then --scoped weapons
		dmg = itemtype(wpn, "dmg_z1") * game("mp_damagefactor")
	elseif lm.mode[3][id] == 2 then
		dmg = itemtype(wpn, "dmg_z2") * game("mp_damagefactor")
	end

	local rot = player(id, "rot") + itemtype(wpn, "dispersion") * (2 * math.random() - 1)
	lm.simulate_attack(id, wpn, dmg, rot)
end

addhook("attack2", "lm.onattack2")
function lm.onattack2(id, m)
	local wpn = player(id, "weapon")
	if wpn == 50 or wpn == 69 then
		if lm.enable[id] == 1 then
			lm.simulate_attack(id, wpn, itemtype(wpn, "dmg_z1") * game("mp_damagefactor"))
		end
----------------------------------------------------------------


--[[syncs burst/zoom for each player to actual cs2d burst/zoom]]
	elseif wpn == 2 then
		lm.mode[1][id] = m
	elseif wpn == 39 then
		lm.mode[2][id] = m
	elseif wpn ~= 32 and wpn >= 31 and wpn <= 37 then
		lm.mode[3][id] = m
	elseif wpn == 45 then
		lm.mode[4][id] = m
	end
end

addhook("reload", "lm.unzoom")
addhook("select", "lm.unzoom")
function lm.unzoom(id)
	lm.mode[3][id] = 0
end

addhook("drop", "lm.ondrop")
function lm.ondrop(id,iid,wpn,ain,a,m)
	lm.mode[3][id] = 0
	if wpn == 2 then
		lm.mode[1][id] = 0
	elseif wpn == 39 then
		lm.mode[2][id] = 0
	end
end

addhook("collect", "lm.oncollect")
function lm.oncollect(id,iid,wpn,ain,a,m)
	if wpn == 2 then
		lm.mode[1][id] = m
	elseif wpn == 39 then
		lm.mode[2][id] = m
	elseif wpn == 45 then
		lm.mode[4][id] = m
	end
end
----------------------------------------------------------------

--[[bullet simulation]]-----------------------------------------

--[[simulates the shooting of a bullet of damage (dmg) from
(wpn) by (id) with angle (rot) and range (range). it has two
parts. part 1 finds bullet's path before hitting a wall; part 2
calculates hits on other players (with lag compensation).]]
function lm.simulate_attack(id, wpn, dmg, rot, range)
	if not wpn then wpn = player(id, "weapon") end
	if not dmg then dmg = itemtype(wpn, "dmg") * game("mp_damagefactor") end
	if not rot then rot = player(id, "rot") end
	if not range then range = itemtype(wpn, "range") end
	
	local start_x = player(id, "x") + math.sin(math.rad(rot))*lm.muzzledistance(wpn) + 1
	local start_y = player(id, "y") - math.cos(math.rad(rot))*lm.muzzledistance(wpn) - 1
	local color, scale
	if wpn==45 then				-- laser
		color = lm.mode[4][id]
		scale = 0.25
	elseif itemtype(wpn,"slot")==3 then	-- meelee weapons
		color = 4
		scale = 0.1
	else
		color = 5
		scale = 0.1
	end
	local duration = math.floor(itemtype(wpn,"rate") * lm.fade_factor)

	local tilex = math.floor(start_x/32)
	local tiley = math.floor(start_y/32)
	
	-- part 1: check if beam starts inside a wall
	local beams
	if tile(tilex,tiley,"wall") == true then
		-- if so, do not shoot any beams
		beams = {}
	else
		-- else calculate the beams
		beams = lm.flattenbeam(lm.get_rays(start_x, start_y, rot, 3 * range, 1, color, scale, duration))
	end

	--part 2 - detect hits
	local frames = math.floor(lm.ping[id] / 20)
	if frames > (lm.BUFFER_SIZE - 1) then
		frames = (lm.BUFFER_SIZE - 1)
	end

	local victims = {}
	if game("sv_friendlyfire") == "0" and game("sv_gamemode") ~= "1" then
		for i in pairs(lm.ping) do
			if player(i, "team") ~= player(id, "team") then
				if lm.spawnprotection[i]<=0 then
					victims[i] = true
				end
			end
		end
	else
		for i in pairs(lm.ping) do
			if lm.spawnprotection[i]<=0 then
				victims[i] = true
			end
		end
		if lm.selfhurt==false or lm.spawnprotection[id]>0 then
			victims[id] = nil
		end
	end
	local olddmg = dmg
	for _, beam in ipairs(beams) do
		dmg = olddmg * (beam[5] or 1)
		for i in pairs(victims) do
			if lm.intersect(beam[1], beam[2], beam[3], beam[4], lm.buffer[1][i][lm.frame - frames], lm.buffer[2][i][lm.frame - frames], 12) then
				parse("sv_sound2 "..id.." player/hit"..math.ceil(3 * math.random())..".wav")
				parse("sv_sound2 "..i.." player/hit"..math.ceil(3 * math.random())..".wav")
				local newhealth
				local newarmor = player(i, "armor")

				if newarmor <= 200 then
					newarmor = newarmor - dmg
					if newarmor < 0 then
						newarmor = 0
					end
					newhealth = player(i, "health") - (dmg - math.floor(game("mp_kevlar") * (player(i, "armor") - newarmor)))
					parse("setarmor "..i.." "..newarmor)
				else --special lm.armor values
					newhealth = player(i, "health") - math.floor((dmg * (lm.armor[newarmor] or 1)))
				end

				if newhealth > 0 then
					parse("sethealth "..i.." "..newhealth)
				else
					parse("customkill "..id.." \""..itemtype(wpn, "name").."\" "..i)
				end
			end
		end
	end
end

--the following functions are used in lm.simulate_attack.
function lm.get_rays(start_x, start_y, rot, range, power, color, scale, duration)
	if range <= 0 then return end
	if power <= lm.power_threshold then return end
	if not rot then return end
	local end_x = start_x + (range) * math.sin(math.rad(rot))
	local end_y = start_y - (range) * math.cos(math.rad(rot))

	local inc_x, inc_y
	if rot < 0 then
		inc_x = -1
	elseif rot > 0 and rot ~= 180 then
		inc_x = 1
	end
	if math.abs(rot) > 90 then
		inc_y = 1
	elseif math.abs(rot) < 90 then
		inc_y = -1
	end

	local tile_x = math.floor(start_x / 32)
	local tile_y = math.floor(start_y / 32)
	if (inc_x or 0) == -1 and start_x % 32 == 0 then tile_x = tile_x - 1 end
	if (inc_y or 0) == -1 and start_y % 32 == 0 then tile_y = tile_y - 1 end

	local beams = {}
	local n2 = lm.tileIOR(tile_x, tile_y)
	while true do
		n1 = n2
		n2 = lm.tileIOR(tile_x, tile_y)
		if n2 < 1 then --mirror, 100% reflection.
			local i
			end_x, end_y, i = lm.intersect(start_x, start_y, end_x, end_y, lm.topixel(tile_x), lm.topixel(tile_y), 16)
			if i == 1 then --vertical reflection
				rot = -rot
			elseif i == 0 then --horizontal reflection
				rot = ((1 + (inc_x or 1)) * 180 - rot) % 360 - 180
			else
				--msg("wtf")
				break
			end
			range = range - math.sqrt((end_x - start_x) ^ 2 + (end_y - start_y) ^ 2)
			beams[#beams + 1] = {start_x, start_y, end_x, end_y, power, color, scale, duration} --incident
			beams[#beams + 1] = lm.get_rays(end_x, end_y, rot, range, power, color, scale, duration) --reflected
			break
		elseif n1 ~= n2 then --interface. fresnel + snell.
			local i
			end_x, end_y, i = lm.intersect(start_x, start_y, end_x, end_y, lm.topixel(tile_x), lm.topixel(tile_y), 16)
			
			local rot_r, rot_t --reflection and transmission angles
			local R --fraction of power reflected. T = 1 - R by conservation of energy.
			local a, b --helpers
			if i == 1 then
				rot_r = -rot
				local something = n1 / n2 * math.sin(math.rad(rot - (inc_x or 1) * 90))
				if math.abs(something) <=1 then
					rot_t = (inc_x or 1) * 90 + math.deg(math.asin(something)) --snell's law
				end
				a = rot_t and n1 * math.cos(math.rad(rot - (inc_x or 1) * 90)) or 1
				b = rot_t and n2 * math.cos(math.rad(rot_t - (inc_x or 1) * 90)) or 0
			elseif i == 0 then
				rot_r = (inc_x or 1) * 180 - rot
				local something = n1 / n2 * math.sin(math.rad(90 * (1 + (inc_y or 1)) - rot))
				if math.abs(something) <= 1 then
					rot_t = (90 * (3 + (inc_y or 1)) - math.deg(math.asin(something))) % 360 - 180
				end
				a = rot_t and n1 * math.cos(math.rad(90 * (1 + (inc_y or 1)) - rot)) or 1
				b = rot_t and n2 * math.cos(math.rad(90 * (1 + (inc_y or 1)) - rot_t)) or 0
			else
				--msg("debug: wtf")
				break
			end
			R = ((a - b) / (a + b)) ^ 2 -- fresnel's equation
			range = range - math.sqrt((end_x - start_x) ^ 2 + (end_y - start_y) ^ 2)
			beams[#beams + 1] = {start_x, start_y, end_x, end_y, power, color, scale, duration} --incident
			if R < 0.5 then --this makes sure beam is sorted by power
				rot_r, rot_t = rot_t, rot_r
				R = 1 - R
			end
			beams[#beams + 1] = lm.get_rays(end_x, end_y, rot_r, range, power * R, color, scale, duration)
			beams[#beams + 1] = lm.get_rays(end_x, end_y, rot_t, range, power * (1 - R), color, scale, duration)
			break
		end
		local temp_x, temp_y = tile_x, tile_y
		if inc_x and lm.intersect(start_x, start_y, end_x, end_y, lm.topixel(temp_x + inc_x), lm.topixel(temp_y), 16) then
			tile_x = temp_x + inc_x
		end
		if inc_y and lm.intersect(start_x, start_y, end_x, end_y, lm.topixel(temp_x), lm.topixel(temp_y + inc_y), 16) then
			tile_y = temp_y + inc_y
		end
		if tile_x == temp_x and tile_y == temp_y then
			--msg("range")
			beams[#beams + 1] = {start_x, start_y, end_x, end_y, power, color, scale, duration}
			break
		end
	end
	return beams
end

function lm.tileIOR(tile_x, tile_y)
	if tile(tile_x, tile_y, "wall") then
		return lm.IOR[3]
	elseif tile(tile_x, tile_y, "obstacle") then
		return lm.IOR[2]
	else
		return lm.IOR[1]
	end
end

function lm.isbeam(tab)
	if type(tab) ~= "table" or #tab ~= 8 then return false end
	for i, v in ipairs(tab) do
		if type(v) == "table" then return false end
	end
	return true
end

function lm.flattenbeam(tab) --also draws them :D
	local flat = {}
	for i, v in ipairs(tab) do
		if lm.isbeam(v) then
			lm.drawbeam(v)
			flat[#flat + 1] = {}
			for a, b in ipairs(v) do
				flat[#flat][a] = b
			end
		else
			for c, d in ipairs(lm.flattenbeam(v)) do
				flat[#flat + 1] = {}
				for e, f in ipairs(d) do
					flat[#flat][e] = f
				end
			end
		end
	end
	return flat
end

function lm.drawbeam(beam)
	if lm.images <= lm.max_images then
		lm.images = lm.images + 1
		local x, y = (beam[1] + beam[3]) / 2, (beam[2] + beam[4]) / 2
		local id = image("gfx/sprites/laserbeam1.bmp", x, y, 1)
		imagealpha(id, beam[5] ^ lm.gamma) --crude srgb lm.gamma correction
		if(beam[6]==0) then			
			imagecolor(id,   0, 255,   0)	-- green
		elseif(beam[6]==1) then			
			imagecolor(id, 255,  25,   0)	-- red
		elseif(beam[6]==2) then			
			imagecolor(id, 255, 255,   0)	-- yellow
		elseif(beam[6]==3) then			
			imagecolor(id,  50, 150, 255)	-- blue
		elseif(beam[6]==4) then	
			imagecolor(id, 255, 255, 255)	-- white
		elseif(beam[6]==5) then
			imagecolor(id, 255, 255, 63)	-- light yellow
		end
		imagescale(id, beam[7], math.sqrt((beam[4] - beam[2]) ^ 2 + (beam[3] - beam[1]) ^ 2) / 32)
		imagepos(id, x, y, 90 + math.deg(math.atan2((beam[4] - beam[2]) , (beam[3] - beam[1]))))
		tween_alpha(id, beam[8], 0)
		timer(beam[8], "freeimage", id)
	end
end

--converts a tile number to the tile's center pixel.
function lm.topixel(tile)
	return (tile * 32) + 16
end 

-- takes a weapon ID as input and returns the pixel distance of the muzzle of this weapon from the center player position, in pixels
function lm.muzzledistance(wpntype)
	-- TODO: enter more weapon types...
	if wpntype==45 then
	-- laser
		return 20
	else
	-- all other weapons have 16; this is just a "best bet" and may not perfectly fit
		return 16
	end
end

--quick test to see if i is in between s and e. used in lm.intersect().
function lm.isinorder(s, i, e)
	return (e >= i and i >= s) or (e <= i and i <= s)
end

--[[returns the first point of intersection between a box centered at (bx, by) with
half side length (bl) and a line segment starting from (sx, sy) and ending at (ex, ey).
if the line segment is enclosed by the box, (ex, ey) is returned.]]
function lm.intersect(sx, sy, ex, ey, bx, by, bl)
	if not (bx and by) then return end --fixes rare lua error

	if math.abs(sx - bx) <= bl and math.abs(sy - by) <= bl then
		if math.abs(ex - bx) <= bl and math.abs(ey - by) <= bl then
			if math.abs(ey - by) == bl then
				return ex, ey, 0
			end
			return ex, ey, 1
		else
			sx, sy, ex, ey = ex, ey, sx, sy
		end
	end

	local i_x, i_y

	if ey > sy then
		i_y = by - bl
	elseif ey < sy then
		i_y = by + bl
	end
	if i_y and lm.isinorder(sy, i_y, ey) then
		i_x = ((ex - sx) * i_y + (sx * ey - sy * ex)) / (ey - sy)
		if math.abs(i_x - bx) <= bl and lm.isinorder(sx, i_x, ex) then
			return i_x, i_y, 0 -- collision with horizontal edge
		end
	end

	if ex > sx then
		i_x = bx - bl
	elseif ex < sx then
		i_x = bx + bl
	end
	if i_x and lm.isinorder(sx, i_x, ex) then
		i_y = ((ey - sy) * i_x + (sy * ex - sx * ey)) / (ex - sx)
		if math.abs(i_y - by) <= bl and lm.isinorder(sy, i_y, ey) then
			return i_x, i_y, 1 -- collision with vertical edge
		end
	end
end
----------------------------------------------------------------
