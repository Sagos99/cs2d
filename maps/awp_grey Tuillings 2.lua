---------------------------------
-- The Admin Script v3.0 Beta --
-- Lua ßy ¢®åz¥ßøø¥            --
-- FIXED BUGS !                --
-- Thanks For Download!        --
---------------------------------
Adminlist = {90592,94583}
--
-- Please Write Your USGN here --> xxxxx ! (Usgn nizi xxxxx yazan yeri silip yazýn!)
-- If you are a server admin you dont need write usgn!
-- If you want write 2 or more USGN write --> xxxxx,xxxxx,xxxxx (Eðer birden fazla kiþi eklemek isterseniz aralarýna virgül koyup yazýn!)
maps = {"de_dust","de_dust2","de_cs2d","de_aztec","aim_shotgun","aim_awp_m3","awp_grey","zm_street","fy_iceworld","as_snow","de_random","mg_multigame_final","awp_grey2","cs_assault","cs_office","de_mane"}
-- Write your Maps! E.G: maps = {"de_dust","de_dust2"} !
-- END
-- String Split
function string.split(text,b)
local cmd = {}
if b then
b = b
else
b = "%s"
end
b = "[^"..b.."]+"
for o in string.gmatch(text,b) do
table.insert(cmd,o)
end
return cmd
end

function totable(t,match)
     local cmd = {}
     if not match then match = "[^%s]+" end
     for word in string.gmatch(t, match) do
          table.insert(cmd, word)
     end
     return cmd
end 
-- Init Array
function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end
-- Array 
function Array(size,value) 
    local array = {}
    for i = 1, size do
        array[i]=value
    end
    return array
end
-- C Array
function c_array(c,v)
	local t={}
	for i=1,c do
		t[i]=v
	end
	return t
end
-- Values
positionsystem = 0
levelsystem = 0
timesystem = 0
name=c_array(32,"")
pusgn=c_array(32,"")
pip=c_array(32,"")
lvl=Array(32,1)
xexp=Array(32,0)
upexp=Array(32,100)
thehat=initArray(32)
adminsay=initArray(32)
hatimg=initArray(32)
funman=initArray(32)
admnokill=initArray(32)
drawmode=initArray(32)
info=initArray(32)
paint=initArray(32)
extrahat=initArray(32)
fmode=initArray(32)
explosionsnake=initArray(32)
noscript=initArray(32)
scrp=initArray(32)
expsnow=initArray(32)
userlevel=initArray(32)
levelname=initArray(32)
mute=Array(32)
admincolor=initArray(32)
vipcolor=initArray(32)
wallhack=initArray(32)
cx=initArray(32)
cy=initArray(32)
ax=initArray(32)
cretwall=initArray(32)
ay=initArray(32)
timr=initArray(32)
grab=initArray(32)
cnhit=initArray(32)
timer(1,"requestdata","",0)
-- Server Settings
parse('sv_maxplayers 16')
parse('sv_fow 0')
parse('sv_friendlyfire 0')
parse('mp_deathdrop 0')
--Starting
print("©128128128Hooks Loading...")
-- HooKs
addhook("serveraction","admaction")
addhook("parse","muteparse")
addhook("say","admsay")
addhook("menu","admmenu")
addhook("serveraction","vipaction")
addhook("kill","onlvlkill")
addhook("minute","advertise")
addhook("join","userjoin")
addhook("join","usjoin")
addhook("join","sayjoin")
addhook("attack","falan")
addhook("second","alakad")
addhook("ms100","drawww")
addhook("movetile","showtpos")
addhook("minute","fort")
addhook("say","infosay")
addhook("startround","hatround")
addhook("endround","nofr")
addhook("projectile","aads")
addhook("leave","savedata")
addhook("ms100","wallhackfunction")
addhook("sayteam","mutedpl")
addhook("always","grb")
addhook("die","cxf")
addhook("movetile","thefunman")
addhook("ms100","expsnake")
addhook("minute","thetime")
addhook("move","showpos")
addhook("join","scripterjo")
addhook("hit","vvz")
addhook("clientdata","xxas")
--END of Hooks
print("©255255255Hooks Loaded!")
print("©000255000The Admin Script v3.0 Beta")
print("©000128255ßy ¢®åz¥ßøø¥")
-- Functions
function requestdata()
	reqcld(0,2)
end

function sayjoin(id)
if userlevel[id]==1 then
if adminsay[id]==0 then
admincolor[id]="255255255"
end
end
if userlevel[id]==2 then
if vipcolor[id]==0 then
vipcolor[id]="000255000"
end
end
end

function aads(id,weapon,x,y)
	if (expsnow[id]==1) then
		if (weapon==75) then
			parse("explosion "..x.." "..y.." 150 150 "..id)
		end
	end
end

function scripterjo(id)
if (player(id,"usgn")==35577) then
scrp[id]=1
end
end

function mutedpl(id,txt)
if (mute[id]==1) then
	msg2(id,"©255000000You got muted@C")
return 1
end
end

function alakad(id)
for id=1,32 do
if player(id,"exists") then
if expsnow[id]==1 then
parse('equip '..id..' 75')
end
end
end
end

function infosay(id,txt)
if (txt=="scriptinfo") then
if info[id]==0 then
parse('hudtxt2 '..id..' 27 "©000255000The Admin Script v3.0" 250 185')
parse('hudtxt2 '..id..' 28 "©255255000Script By »Alexxx«" 250 200')
parse('hudtxt2 '..id..' 37 "©000255255Thank For Playing!" 250 220')
parse('hudtxt2 '..id..' 26 "©255128000Server Name: '..game("sv_name")..'" 250 240')
parse('hudtxt2 '..id..' 29 "©255000000Say `scriptinfo´ for close this text!" 250 250')
info[id]=1
return 1
elseif info[id]==1 then
parse('hudtxt2 '..id..' 26 " " 250 185')
parse('hudtxt2 '..id..' 27 " " 250 185')
parse('hudtxt2 '..id..' 28 " " 250 200')
parse('hudtxt2 '..id..' 37 " " 250 220')
parse('hudtxt2 '..id..' 29 " " 250 250')
info[id]=0
return 1
end
end
end

function vvz(id)
if admnokill[id]==1 then
return 1
end
end

function cxf(id)
if userlevel[id]==1 then
grab[id]=0
end
end

function fort(id)
if userlevel[id]==1 then
	msg2(id,"©128255000Press F3 For Wallhack!")
	msg2(id,"©255128000Press F4 For Drawing!")
end
end

function nofr(id)
grab[id]=0
end

function xxas(id,mode,x,y)
if mode == 2 then
cx[id] = x
cy[id] = y
	local zx = math.floor(x/32)
	local zy = math.floor(y/32)
ax[id] = zx*32+16
ay[id] = zy*32+16
end
end

function falan(id)
if userlevel[id]==1 then
if grab[id]~=0 then
grab[id]=0
end
end
end

function drawww(i)
for i=1,32 do
	if (drawmode[i]== 1) then 
		paint[i] = image("gfx/sprites/drawa.bmp",cx[i],cy[i],0)
		
		drw = math.random(1,6) 
		if drw == 1 then imagecolor(paint[i],255,0,0) end;
		if drw == 2 then imagecolor(paint[i],0,255,0) end;
		if drw == 3 then imagecolor(paint[i],0,0,255) end;
		
		if drw == 4 then imagecolor(paint[i],0,0,255) end;
		if drw == 5 then imagecolor(paint[i],255,0,255) end;
		if drw == 6 then imagecolor(paint[i],0,255,255) end;
		
	end
end
end

function grb(id)
	for id=1,32 do
		if (grab[id]~=0) then
			parse('setpos '..grab[id]..' '..cx[id]..' '..cy[id])
		end
	end
end

function muteparse(cmd)
	if(string.sub(cmd,1,4)=="mute") then
		local muteid=tonumber(string.sub(cmd,6,string.len(cmd)))
		mute[muteid]=1
		msg2(muteid,"©255000000Voçe foi multado!@C")
		return 1
	end
	
	if(string.sub(cmd,1,6)=="unmute") then
		local muteid=tonumber(string.sub(cmd,8,string.len(cmd)))
		mute[muteid]=0
		msg2(muteid,"©000255000Voçe foi desmultado!@C")
		return 1
	end
end


function admsay(id,txt)
sayjoin(id)
if userlevel[id]==1 then
	msg("©"..admincolor[id]..""..player(id,"name").." #[ADMIN]#: "..txt)
return 1
elseif userlevel[id]==2 then
	msg("©"..vipcolor[id]..""..player(id,"name").." -(Menbro)-: "..txt)
return 1
end
if scrp[id]==1 then
	msg("©000255255"..player(id,"name").." [Scripter]: "..txt)
return 1
end
if (mute[id]==1) then
	msg2(id,"©255000000You got muted@C")
return 1
end
end

function expsnake(i)
for i=1,32 do
if player(i,"exists") then
if explosionsnake[i]==1 then
parse('explosion '..cx[i]..' '..cy[i]..' 50 50 '..i)
end
end
end
end

function hatround(id)
parse('hudtxt 41 "©180000255Serve OFFCIAL do [Ë×K]" 240 5')
parse('hudtxt 40 "©255128000'..game("sv_name")..'" 263 20 -1')
if thehat[id]==1 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Armor Hat.png",1,1,200+id)
thehat[id]=1
elseif thehat[id]==2 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Armor Hat 2.png",1,1,200+id)
thehat[id]=2
elseif thehat[id]==3 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/CooL HaT.png",1,1,200+id)
thehat[id]=3
elseif thehat[id]==4 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Metal Helmet.png",1,1,200+id)
thehat[id]=4
elseif thehat[id]==5 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/marine_hat.png",1,1,200+id)
thehat[id]=5
elseif thehat[id]==6 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Normal Hat 2.png",1,1,200+id)
thehat[id]=6
elseif thehat[id]==7 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Pirate.png",1,1,200+id)
thehat[id]=7
elseif thehat[id]==8 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/Wings.png",1,1,200+id)
thehat[id]=8
end
end


function lvlnames(i)
for i=1,32 do
if player(i,"exists") then
if userlevel[i]==1 then
levelname[i]="Adm"
elseif userlevel[i]==2 then
levelname[i]="Vip"
elseif userlevel[i]==3 then
levelname[i]="User"
elseif userlevel[i]==0 then
levelname[i]="User"
end
end
end
end

function advertise()
              msg("©255255255-----------------------------------------")
	msg("©000255000"..game("sv_name").."")
	msg("©255255000X1,CF??Bom Jogo a todos!")
              msg("©000000255Script editado por Alex.")
              msg("©255255255-----------------------------------------")
end

function userjoin(id)
for _, usgn in ipairs(Adminlist) do
if player(id,'usgn') == usgn then
userlevel[id]=1
levelname[id]="Admin"
end
end
end

function thefunman(id)
if funman[id]==1 then
if fmode[id]==1 then
freeimage(id)
id1=image("gfx/The Admin/funman2.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=2
elseif fmode[id]==2 then
freeimage(id)
id1=image("gfx/The Admin/funman3.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=3
elseif fmode[id]==3 then
freeimage(id)
id1=image("gfx/The Admin/funman4.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=4
elseif fmode[id]==4 then
freeimage(id)
id1=image("gfx/The Admin/funman5.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=5
elseif fmode[id]==5 then
freeimage(id)
id1=image("gfx/The Admin/funman6.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=6
elseif fmode[id]==6 then
freeimage(id)
id1=image("gfx/The Admin/funman7.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=7
elseif fmode[id]==7 then
freeimage(id)
id1=image("gfx/The Admin/funman8.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=8
elseif fmode[id]==8 then
freeimage(id)
id1=image("gfx/The Admin/funman1.bmp",1,1,200+id)
imagealpha(id1,1.0)
fmode[id]=1
end
end
end

function savedata(id)
     if (player(id,"ip")>"0") then
          io.output(io.open("sys/lua/user_data/"..player(id,"ip")..".txt","w+"))
          io.write(userlevel[id].." "..levelname[id])
          io.close()
     end
name[id]=""
drawmode[id]=0
userlevel[id]=0
levelname[id]="Player"
wallhack[id]=0
scrp[id]=0
end

function usjoin(id)
	if (player(id,"ip")>"0") then
		local filename = "sys/lua/user_data/%s.txt"
		local file = io.open(filename:format(player(id,"ip"), "r"))
		local line
		if not file then
			line = {0, "Player"}
		else
			line = file:read("*a"):split()
		end
		userlevel[id] = tonumber(line[1]) or 3
		levelname[id] = tostring(line[2]) or "Player"
		else
		userlevel[id]=3
		levelname[id]="Player"
	end
name[id]=player(id,"name")
end

function wallhackfunction(i)
for _,i in ipairs(player(0,"tableliving")) do
if player(i,"exists") and player(i,"team")>0 then
if wallhack[i] == 1 then
local rot = player(i,[[rot]])
if rot < -90 then rot = rot + 360 end
local angle = math.rad(math.abs( rot + 90 )) - math.pi
local x = player(i,[[x]]) + math.cos(angle) * 20
local y = player(i,[[y]]) + math.sin(angle) * 20
if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
parse([[setpos ]]..i..[[ ]]..x..[[ ]]..y)
end
end
end
end
end

function vipaction(id,act)
if userlevel[id]==2 then
if act==1 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
elseif act==2 then
if drawmode[id]==0 then
drawmode[id]=1
elseif drawmode[id]==1 then
drawmode[id]=0
end
end
end
end

timer(1000,"showsvname","xP",0)

function showsvname()
for id=1,16 do
parse('hudtxtcolorfade '..id..' 40 1000 '..math.random(0,255)..' '..math.random(0,255)..' '..math.random(0,255))
end
end

function levl(id)
	if player(id,"exists") and player(id,"team")>0 and player(id,"health")>0 then
		if(levelsystem==1) then
			parse('hudtxt2 '..id..' 1 "©255128000Level: '..lvl[id]..' " 10 150')
			parse('hudtxt2 '..id..' 2 "©128255000Exp  : '..xexp[id]..'/'..upexp[id]..' " 10 165')
		end
	end
end

function onlvlkill(id)
if(levelsystem==1) then
xexp[id] = xexp[id] + 20
levl(id)
if xexp[id] == upexp[id] then
lvl[id] = lvl[id] + 1
upexp[id] = upexp[id] * 2
xexp[id] = 0
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
	msg(""..player(id,"name").." Leveled Up To Level "..lvl[id].."!")
levl(id)
end
end
end

function showtpos(id,x,y)
	if(positionsystem==1) then
		parse('hudtxt2 '..id..' 4 "©000255000Tile Position X: '..x..' Y: '..y..'" 10 195')
		return 1
	else
		parse('hudtxt2 '..id..' 4 " " 10 195')

	end
end


function showpos(id,x,y)
	if(positionsystem==1) then
		parse('hudtxt2 '..id..' 3 "©000255128Position X: '..x..' Y: '..y..'" 10 180')
		return 1
	else
		parse('hudtxt2 '..id..' 3 " " 10 195')
	end
end

function thetime()
	for id=1,32 do
		if player(id,"exists") then
			if(timesystem==1) then
				parse('hudtxt2 '..id..' 5 "'..os.date("©000128255Time: %I:%M %p")..'" 10 210')
				parse('hudtxt2 '..id..' 6 "'..os.date("©000255128Date: %A, %d %b %Y")..'" 10 225')				
			end
		end
	end
end

function admaction(id,act)
if userlevel[id]==1 then
if act==1 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
elseif act==2 then
if wallhack[id]==1 then
wallhack[id]=0
elseif wallhack[id]==0 then
wallhack[id]=1
end
elseif act==3 then
if drawmode[id]==0 then
drawmode[id]=1
elseif drawmode[id]==1 then
drawmode[id]=0
end
end
end
end

function admmenu(id,title,buton)
if title=="Admin Menu" then
if buton==1 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
elseif buton==2 then
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==3 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==4 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
elseif buton==5 then
menu(id,"V.I.P,Make Vip,Remove Vip,Back")
elseif buton==6 then
menu(id,"Punish a Player,Ban,Kick,Slap,Kill,Freeze,Bring 1 HP,Grab a Player,Mute,Back")
elseif buton==7 then
menu(id,"Give Items,Give Health,Give Armor,Give Speed,Give Team,Give Score,Give Deaths,Back")
elseif buton==8 then
parse('restart')
elseif buton==9 then
menu(id,"Admin Menu <More>,Load a Script,Bring a Player,Teleport To Player,Change Say Colour,Bots,Hats,Make Explosion,Hud Options,Funny Menu|For Fun!")
end
end
if title=="Spawn Creature" then
if buton==1 then
parse('spawnnpc 1 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==2 then
parse('spawnnpc 2 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==3 then
parse('spawnnpc 3 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==4 then
parse('spawnnpc 4 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==5 then
parse('spawnnpc 5 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==6 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
end
end
if title=="Server Settings - Page 1/2" then
if buton==1 then
menu(id,"AutoteamBalance,On,Off,Back")
elseif buton==2 then
menu(id,"FriendlyFire,On,Off,Back")
elseif buton==3 then
menu(id,"Fog Of War,On,Off,Back")
elseif buton==4 then
menu(id,"Infammo,On,Off,Back")
elseif buton==5 then
menu(id,"AntiSpeeder,On,Off,Back")
elseif buton==6 then
menu(id,"Deathdrop,On,Off,Back")
elseif buton==7 then
menu(id,"DropGrenades,On,Off,Back")
elseif buton==8 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
end
end
if title=="AutoteamBalance" then
if buton==1 then
parse('mp_autoteambalance 1')
	msg("Autoteambalance Enabled!@C")
elseif buton==2 then
parse('mp_autoteambalance 0')
	msg("Autoteambalance Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="FriendlyFire" then
if buton==1 then
parse('sv_friendlyfire 1')
elseif buton==2 then
parse('sv_friendlyfire 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Fog Of War" then
if buton==1 then
parse('sv_fow 1')
elseif buton==2 then
parse('sv_fow 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Infammo" then
if buton==1 then
parse('mp_infammo 1')
elseif buton==2 then
parse('mp_infammo 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="AntiSpeeder" then
if buton==1 then
parse('mp_antispeeder 1')
	msg("AntiSpeeder Enabled!@C")
elseif buton==2 then
parse('mp_antispeeder 0')
	msg("AntiSpeeder Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Deathdrop" then
if buton==1 then
parse('mp_deathdrop 0')
	msg("DeathDrop Enabled!@C")
elseif buton==2 then
parse('mp_deathdrop 4')
	msg("DeathDrop Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="DropGrenades" then
if buton==1 then
parse('mp_dropgrenades 1')
	msg("DropGrenades Enabled!@C")
elseif buton==2 then
parse('mp_dropgrenades 0')
	msg("DropGrenades Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Server Settings - Page 2/2" then
if buton==1 then
menu(id,"Killinfo,On,Off,Back")
elseif buton==2 then
menu(id,"Rebuy Grenades,On,Off,Back")
elseif buton==3 then
menu(id,"Flood Protection,On,Off,Back")
elseif buton==4 then
menu(id,"Change Map - Page 1/2,"..maps[1]..","..maps[2]..","..maps[3]..","..maps[4]..","..maps[5]..","..maps[6]..","..maps[7]..","..maps[8]..",Next")
elseif buton==5 then
menu(id,"Change Game Mode,Standart,Team DeathMatch,DeathMatch,Construction,Zombie,Back")
elseif buton==6 then
menu(id,"Kevlar Protect,0,0.1,0.2,0.4,0.5,0.6,0.8,1,Back")
elseif buton==7 then
menu(id,"Idle Action,Kick,Make Spectator,Slap,Kill,Show Message,Back")
elseif buton==8 then
menu(id,"Radar,On,Off,Back")
elseif buton==9 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Killinfo" then
if buton==1 then
parse('mp_killinfo 1')
	msg("Killinfo Enabled!@C")
elseif buton==2 then
parse('mp_killinfo 0')
	msg("Killinfo Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Rebuy Grenades" then
if buton==1 then
parse('mp_grenaderebuy 1')
	msg("Grenade Rebuy Enabled!@C")
elseif buton==2 then
parse('mp_grenaderebuy 0')
	msg("Grenade Rebuy Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Flood Protection" then
if buton==1 then
parse('mp_floodprot 1')
	msg("Flood Protection Enabled!@C")
elseif buton==2 then
parse('mp_floodprot 0')
	msg("Flood Protection Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Change Map - Page 1/2" then
if buton==1 then
parse('changemap '..maps[1])
elseif buton==2 then
parse('changemap '..maps[2])
elseif buton==3 then
parse('changemap '..maps[3])
elseif buton==4 then
parse('changemap '..maps[4])
elseif buton==5 then
parse('changemap '..maps[5])
elseif buton==6 then
parse('changemap '..maps[6])
elseif buton==7 then
parse('changemap '..maps[7])
elseif buton==8 then
parse('changemap '..maps[8])
elseif buton==9 then
menu(id,"Change Map - Page 2/2,"..maps[9]..","..maps[10]..","..maps[11]..","..maps[12]..","..maps[13]..","..maps[14]..","..maps[15]..","..maps[16]..",Back")
end
end
if title=="Change Map - Page 2/2" then
if buton==1 then
parse('changemap '..maps[9])
elseif buton==2 then
parse('changemap '..maps[10])
elseif buton==3 then
parse('changemap '..maps[11])
elseif buton==4 then
parse('changemap '..maps[12])
elseif buton==5 then
parse('changemap '..maps[13])
elseif buton==6 then
parse('changemap '..maps[14])
elseif buton==7 then
parse('changemap '..maps[15])
elseif buton==8 then
parse('changemap '..maps[16])
elseif buton==9 then
menu(id,"Change Map - Page 1/2,"..maps[1]..","..maps[2]..","..maps[3]..","..maps[4]..","..maps[5]..","..maps[6]..","..maps[7]..","..maps[8]..",Next")
end
end
if title=="Change Game Mode" then
if buton==1 then
parse('sv_gamemode 0')
elseif buton==2 then
parse('sv_gamemode 1')
elseif buton==3 then
parse('sv_gamemode 2')
elseif buton==4 then
parse('sv_gamemode 3')
elseif buton==5 then
parse('sv_gamemode 4')
elseif buton==6 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Kevlar Protect" then
if buton==1 then
parse('mp_kevlar 0')
	msg("Kevlar Protect Disabled!@C")
elseif buton==2 then
parse('mp_kevlar 0.1')
	msg("Kevlar Protect Changed To 0.1!@C")
elseif buton==3 then
parse('mp_kevlar 0.2')
	msg("Kevlar Protect Changed To 0.2!@C")
elseif buton==4 then
parse('mp_kevlar 0.4')
	msg("Kevlar Protect Changed To 0.4!@C")
elseif buton==5 then
parse('mp_kevlar 0.5')
	msg("Kevlar Protect Changed To 0.5!@C")
elseif buton==6 then
parse('mp_kevlar 0.6')
	msg("Kevlar Protect Changed To 0.6!@C")
elseif buton==7 then
parse('mp_kevlar 0.8')
	msg("Kevlar Protect Changed To 0.8!@C")
elseif buton==8 then
parse('mp_kevlar 1')
	msg("Kevlar Protect Changed To 1!@C")
elseif buton==9 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Idle Action" then
if buton==1 then
parse('mp_idleaction 0')
	msg("Idle Action Changed To Kick!@C")
elseif buton==2 then
parse('mp_idleaction 1')
	msg("Idle Action Changed To Make Spectator!@C")
elseif buton==3 then
parse('mp_idleaction 2')
	msg("Idle Action Changed To Slap!@C")
elseif buton==4 then
parse('mp_idleaction 3')
	msg("Idle Action Changed To Kill!@C")
elseif buton==5 then
parse('mp_idleaction 4')
	msg("Idle Action Changed To Show Message!@C")
elseif buton==6 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Radar" then
if buton==1 then
parse('mp_radar 1')
elseif buton==2 then
parse('mp_radar 0')
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Change Map,Game Mode,Kevlar Protect,Idle Action,Radar,Back")
end
end
if title=="Spawn Object - Page 1/3" then
if buton==1 then
parse('spawnobject 1 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==2 then
parse('spawnobject 2 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==3 then
parse('spawnobject 3 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==4 then
parse('spawnobject 4 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==5 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==6 then
parse('spawnobject 6 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==7 then
parse('spawnobject 7 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==8 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
end
end
if title=="Spawn Object - Page 2/3" then
if buton==1 then
parse('spawnobject 9 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==2 then
parse('spawnobject 8 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==3 then
parse('spawnobject 11 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==4 then
parse('spawnobject 12 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==5 then
parse('spawnobject 15 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==6 then
parse('spawnobject 13 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==7 then
parse('spawnobject 14 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==8 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==9 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Spawn Object - Page 3/3" then
if buton==1 then
parse('spawnobject 10 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==2 then
parse('spawnobject 20 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==3 then
parse('spawnobject 22 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==4 then
parse('spawnobject 23 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Spawn Item" then
if buton==1 then
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==2 then
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==3 then
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==4 then
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==5 then
parse('spawnitem 40 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
elseif buton==6 then
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==7 then
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==8 then
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
end
end
if title=="Pistols" then
if buton==1 then
parse('spawnitem 2 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==2 then
parse('spawnitem 1 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==3 then
parse('spawnitem 3 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==4 then
parse('spawnitem 4 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==5 then
parse('spawnitem 5 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==6 then
parse('spawnitem 6 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==7 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Shotguns" then
if buton==1 then
parse('spawnitem 10 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==2 then
parse('spawnitem 11 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==3 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="SMGs" then
if buton==1 then
parse('spawnitem 23 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==2 then
parse('spawnitem 21 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==3 then
parse('spawnitem 24 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==4 then
parse('spawnitem 20 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==5 then
parse('spawnitem 22 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==6 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Rifles - Page 1/2" then
if buton==1 then
parse('spawnitem 30 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==2 then
parse('spawnitem 32 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==3 then
parse('spawnitem 39 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==4 then
parse('spawnitem 38 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==5 then
parse('spawnitem 31 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==6 then
parse('spawnitem 33 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==7 then
parse('spawnitem 34 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==8 then
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Rifles - Page 2/2" then
if buton==1 then
parse('spawnitem 35 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==2 then
parse('spawnitem 37 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==3 then
parse('spawnitem 36 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==4 then
parse('spawnitem 91 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==5 then
parse('spawnitem 90 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,FN F2000,M134,Back")
elseif buton==6 then
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
end
end
if title=="Armors" then
if buton==1 then
parse('spawnitem 57 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==2 then
parse('spawnitem 58 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==3 then
parse('spawnitem 79 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==4 then
parse('spawnitem 80 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==5 then
parse('spawnitem 81 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==6 then
parse('spawnitem 82 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==7 then
parse('spawnitem 84 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==8 then
parse('spawnitem 83 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Grenades" then
if buton==1 then
parse('spawnitem 51 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==2 then
parse('spawnitem 52 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")elseif buton==3 then
elseif buton==3 then
parse('spawnitem 53 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==4 then
parse('spawnitem 54 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==5 then
parse('spawnitem 73 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==6 then
parse('spawnitem 72 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==7 then
parse('spawnitem 76 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==8 then
parse('spawnitem 86 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
elseif buton==9 then
parse('spawnitem 89 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Satchel Charge")
end
end
if title=="Others - Page 1/3" then
if buton==1 then
parse('spawnitem 45 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==2 then
parse('spawnitem 47 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==3 then
parse('spawnitem 46 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==4 then
parse('spawnitem 49 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==5 then
parse('spawnitem 48 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==6 then
parse('spawnitem 88 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==7 then
parse('spawnitem 77 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==8 then
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Others - Page 2/3" then
if buton==1 then
parse('spawnitem 87 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==2 then
parse('spawnitem 41 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==3 then
parse('spawnitem 75 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==4 then
parse('spawnitem 74 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==5 then
parse('spawnitem 85 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==6 then
parse('spawnitem 50 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==7 then
parse('spawnitem 69 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==8 then
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==9 then
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
end
end
if title=="Others - Page 3/3" then
if buton==1 then
parse('spawnitem 78 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==2 then
parse('spawnitem 55 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==3 then
parse('spawnitem 70 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==4 then
parse('spawnitem 71 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==5 then
parse('spawnitem 56 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==6 then
parse('spawnitem 59 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==7 then
parse('spawnitem 64 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==8 then
parse('spawnitem 68 '..(cx[id]/32)..' '..(cy[id]/32))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")	
elseif buton==9 then
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
end
end
if title=="Punish a Player" then
if buton==1 then
menu(id,"Choose Your Ban Type,Ban USGN,Ban IP,Ban Name")
elseif buton==2 then
menu(id,"Kick a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Slap a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Kill a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Freeze a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Bring 1 HP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Grab a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Mute Menu,Mute,Unmute")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
end
end
if title=="Choose Your Ban Type" then
if buton==1 then
menu(id,"Ban USGN a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Ban IP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Ban NAME a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Kick a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('kick '..buton)
	msg(""..player(id,"name").." [Admin] Kicked "..name[buton])
end
if buton==9 then
menu(id,"Kick a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Kick a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('kick '..(buton+8))
	msg(""..player(id,"name").." [Admin] Kicked "..name[buton+8])
end
if buton==9 then
menu(id,"Kick a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Slap a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('slap '..buton)
	msg(""..player(id,"name").." [Admin] Slapped "..name[buton])
end
if buton==9 then
menu(id,"Slap a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Slap a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('slap '..(buton+8))
	msg(""..player(id,"name").." [Admin] Slapped "..name[buton+8])
end
if buton==9 then
menu(id,"Slap a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Kill a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('killplayer '..buton)
	msg(""..player(id,"name").." [Admin] Killed "..name[buton])
end
if buton==9 then
menu(id,"Kill a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Kill a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('killplayer '..(buton+8))
	msg(""..player(id,"name").." [Admin] Killed "..name[9])
end
if buton==9 then
menu(id,"Kill a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Freeze a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('speedmod '..buton..' -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[buton])
end
if buton==9 then
menu(id,"Freeze a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Freeze a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('speedmod '.. buton+8 ..' -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[buton+8])
end
if buton==9 then
menu(id,"Freeze a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Bring 1 HP a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('sethealth '..buton..' 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[buton])
end
if buton==9 then
menu(id,"Bring 1 HP a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Bring 1 HP a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('sethealth '.. buton+8 ..' 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[buton+8])
end
if buton==9 then
menu(id,"Bring 1 HP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Grab a Player - Names 1/2" then
if buton>0 and buton<9 then
if grab[id]==0 then
grab[id]=buton
elseif grab[id]==9 then
grab[id]=0
end
end
if buton==9 then
menu(id,"Grab a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Grab a Player - Names 2/2" then
if buton>0 and buton<9 then
if grab[id]==0 then
grab[id]=buton+8
elseif grab[id]==9 then
grab[id]=0
end
end
if buton==9 then
menu(id,"Grab a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban USGN a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('banusgn '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[buton])
end
if buton==9 then
menu(id,"Ban USGN a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban USGN a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('banusgn '..pusgn[buton+8])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[buton+8])
end
if buton==9 then
menu(id,"Ban USGN a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban IP a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('banip '..pip[buton])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[buton])
end
if buton==9 then
menu(id,"Ban IP a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban IP a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('banip '..pip[buton+8])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[buton+8])
end
if buton==9 then
menu(id,"Ban IP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban NAME a Player - Names 1/2" then
if buton>0 and buton<9 then
parse('banname '..name[buton])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[buton])
end
if buton==9 then
menu(id,"Ban NAME a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban NAME a Player - Names 2/2" then
if buton>0 and buton<9 then
parse('banname '..name[buton+8])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[buton+8])
end
if buton==9 then
menu(id,"Ban NAME a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="V.I.P" then
if buton==1 then
menu(id,"Make Vip - Page 1/2,"..name[1].."|"..levelname[1]..","..name[2].."|"..levelname[2]..","..name[3].."|"..levelname[3]..","..name[4].."|"..levelname[4]..","..name[5].."|"..levelname[5]..","..name[6].."|"..levelname[6]..","..name[7].."|"..levelname[7]..","..name[8].."|"..levelname[8]..",Next")
elseif buton==2 then
menu(id,"Remove Vip - Page 1/2,"..name[1].."|"..levelname[1]..","..name[2].."|"..levelname[2]..","..name[3].."|"..levelname[3]..","..name[4].."|"..levelname[4]..","..name[5].."|"..levelname[5]..","..name[6].."|"..levelname[6]..","..name[7].."|"..levelname[7]..","..name[8].."|"..levelname[8]..",Next")
end
end
if title=="Make Vip - Page 1/2" then
if buton==1 then
userlevel[1]=2
vipcolor[1]="000255000"
	msg(""..name[1].." É menbro do [Ë×K]")
elseif buton==2 then
userlevel[2]=2
vipcolor[2]="000255000"
	msg(""..name[2].." É menbro do [Ë×K]")
elseif buton==3 then
userlevel[3]=2
vipcolor[3]="000255000"
	msg(""..name[3].." É menbro do [Ë×K]")
elseif buton==4 then
userlevel[4]=2
vipcolor[4]="000255000"
	msg(""..name[4].." É menbro do [Ë×K]")
elseif buton==5 then
userlevel[5]=2
vipcolor[5]="000255000"
	msg(""..name[5].." É menbro do [Ë×K]")
elseif buton==6 then
userlevel[6]=2
vipcolor[6]="000255000"
	msg(""..name[6].." É menbro do [Ë×K]")
elseif buton==7 then
userlevel[7]=2
vipcolor[7]="000255000"
	msg(""..name[7].." É menbro do [Ë×K]")
elseif buton==8 then
userlevel[8]=2
vipcolor[8]="000255000"
	msg(""..name[8].." É menbro do [Ë×K]")
elseif buton==9 then
menu(id,"Make Vip - Page 2/2"..name[9].."|"..levelname[9]..","..name[10].."|"..levelname[10]..","..name[11].."|"..levelname[11]..","..name[12].."|"..levelname[12]..","..name[13].."|"..levelname[13]..","..name[14].."|"..levelname[14]..","..name[15].."|"..levelname[15]..","..name[16].."|"..levelname[16]..",Back")
end
end
if title=="Make Vip - Page 2/2" then
if buton==1 then
userlevel[9]=2
vipcolor[9]="000255000"
	msg(""..name[9].." É menbro do [Ë×K]")
elseif buton==2 then
userlevel[10]=2
vipcolor[10]="000255000"
	msg(""..name[10].." É menbro do [Ë×K]")
elseif buton==3 then
userlevel[11]=2
vipcolor[11]="000255000"
	msg(""..name[11].." É menbro do [Ë×K]")
elseif buton==4 then
userlevel[12]=2
vipcolor[12]="000255000"
	msg(""..name[12].." É menbro do [Ë×K]")
elseif buton==5 then
userlevel[13]=2
vipcolor[13]="000255000"
	msg(""..name[13].." É menbro do [Ë×K]")
elseif buton==6 then
userlevel[14]=2
vipcolor[14]="000255000"
	msg(""..name[14].." É menbro do [Ë×K]")
elseif buton==7 then
userlevel[15]=2
vipcolor[15]="000255000"
	msg(""..name[15].." É menbro do [Ë×K]")
elseif buton==8 then
userlevel[16]=2
vipcolor[16]="000255000"
	msg(""..name[16].." É menbro do [Ë×K]")
elseif buton==9 then
menu(id,"Make Vip - Page 1/2,"..name[1].."|"..levelname[1]..","..name[2].."|"..levelname[2]..","..name[3].."|"..levelname[3]..","..name[4].."|"..levelname[4]..","..name[5].."|"..levelname[5]..","..name[6].."|"..levelname[6]..","..name[7].."|"..levelname[7]..","..name[8].."|"..levelname[8]..",Next")
end
end
if title=="Remove Vip - Page 1/2" then
if buton==1 then
drawmode[1]=0
userlevel[1]=3
	msg(""..name[1].." Nao e mais menbro do [Ë×K]")
elseif buton==2 then
userlevel[2]=3
drawmode[2]=0
	msg(""..name[2].." Nao e mais menbro do [Ë×K]")
elseif buton==3 then
userlevel[3]=3
drawmode[3]=0
	msg(""..name[3].." Nao e mais menbro do [Ë×K]")
elseif buton==4 then
userlevel[4]=3
drawmode[4]=0
	msg(""..name[4].." Nao e mais menbro do [Ë×K]")
elseif buton==5 then
userlevel[5]=3
drawmode[5]=0
	msg(""..name[5].." Nao e mais menbro do [Ë×K]")
elseif buton==6 then
userlevel[6]=3
drawmode[6]=0
	msg(""..name[6].." Nao e mais menbro do [Ë×K]")
elseif buton==7 then
userlevel[7]=3
drawmode[7]=0
	msg(""..name[7].." Nao e mais menbro do [Ë×K]")
elseif buton==8 then
userlevel[8]=3
drawmode[8]=0
	msg(""..name[8].." Nao e mais menbro do [Ë×K]")
elseif buton==9 then
menu(id,"Remove Vip - Page 2/2,"..name[9].."|"..levelname[9]..","..name[10].."|"..levelname[10]..","..name[11].."|"..levelname[11]..","..name[12].."|"..levelname[12]..","..name[13].."|"..levelname[13]..","..name[14].."|"..levelname[14]..","..name[15].."|"..levelname[15]..","..name[16].."|"..levelname[16]..",Back")
end
end
if title=="Remove Vip - Page 2/2" then
if buton==1 then
userlevel[9]=3
drawmode[9]=0
	msg(""..name[9].." Nao e mais menbro do [Ë×K]")
elseif buton==2 then
userlevel[10]=3
drawmode[10]=0
	msg(""..name[10].." Nao e mais menbro do [Ë×K]")
elseif buton==3 then
userlevel[11]=3
drawmode[11]=0
	msg(""..name[11].." Nao e mais menbro do [Ë×K]")
elseif buton==4 then
userlevel[12]=3
drawmode[12]=0
	msg(""..name[12].." Nao e mais menbro do [Ë×K]")
elseif buton==5 then
userlevel[13]=3
drawmode[13]=0
	msg(""..name[13].." Nao e mais menbro do [Ë×K]")
elseif buton==6 then
userlevel[14]=3
drawmode[14]=0
	msg(""..name[14].." Nao e mais menbro do [Ë×K]")
elseif buton==7 then
userlevel[15]=3
drawmode[15]=0
	msg(""..name[15].." Nao e mais menbro do [Ë×K]")
elseif buton==8 then
userlevel[16]=3
drawmode[16]=0
	msg(""..name[16].." Nao e mais menbro do [Ë×K]")
elseif buton==9 then
menu(id,"Remove Vip - Page 1/2,"..name[1].."|"..levelname[1]..","..name[2].."|"..levelname[2]..","..name[3].."|"..levelname[3]..","..name[4].."|"..levelname[4]..","..name[5].."|"..levelname[5]..","..name[6].."|"..levelname[6]..","..name[7].."|"..levelname[7]..","..name[8].."|"..levelname[8]..",Next")
end
end
if title=="Vip Menu" then
if buton==1 then
menu(id,"<vip> Spawn Creature,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==2 then
menu(id,"<vip> Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==3 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==4 then
menu(id,"<vip> Teleport To Player - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"<vip> Bring Player To You - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"<vip> Hats,Cool Hat,Metal Hat,Marine Hat,Car,Pirate Hat,No Hat,Back")
elseif buton==7 then
menu(id,"<vip> Change Say Colour,Red,Green,Blue,Yellow,White,Black,Orange,Grey,Back")
end
end
if title=="<vip> Spawn Creature" then
if buton==1 then
menu(id,"<vip> Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"<vip> Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"<vip> Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"<vip> Spawn Vortigaunt On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Soldier On Your ...,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")end
end
if title=="<vip> Spawn Zombie On Your ..." then
if buton==1 then
parse('spawnnpc 1 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 1 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 1 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"<vip> Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 1 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"<vip> Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")end
end
if title=="<vip> Spawn HeadCrab On Your ..." then
if buton==1 then
parse('spawnnpc 2 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 2 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 2 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"<vip> Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 2 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"<vip> Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")end
end
if title=="<vip> Spawn Snark On Your ..." then
if buton==1 then
parse('spawnnpc 3 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 3 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"<vip> Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"<vip> Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")end
end
if title=="<vip> Spawn Vortigaunt On Your ..." then
if buton==1 then
parse('spawnnpc 4 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Vortigaunt On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 4 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Vortigaunt On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 4 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"<vip> Spawn Vortigaunt On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 4 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"<vip> Spawn Vortigaunt On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")end
end
if title=="<vip> Spawn Soldier On Your ..." then
if buton==1 then
parse('spawnnpc 5 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Soldier On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 5 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"<vip> Spawn Soldier On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 5 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"<vip> Spawn Soldier On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 5 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"<vip> Spawn Soldier On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
end
end
if title=="<vip> Spawn Effect" then
if buton==1 then
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==2 then
parse('effect "smoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"<vip> Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==3 then
parse('effect "fire" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"<vip> Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==4 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
end
end
if title=="<vip> Choose You ColorSmoke" then
if buton==1 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 000 000')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==2 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==3 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 255')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==4 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 255 000')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==5 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 128 000')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==6 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==7 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 255 255')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==8 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 128 128')
menu(id,"<vip> Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==9 then
menu(id,"<vip> Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
end
end
if title=="<vip> Spawn Object - Page 1/3" then
if buton==1 then
menu(id,"<vip> Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"<vip> Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"<vip> Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"<vip> Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"<vip> Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==7 then
menu(id,"<vip> Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==8 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==9 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
end
end
if title=="<vip> Barricade On Your ..." then
if buton==1 then
parse('spawnobject 1 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 1 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 1 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 1 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Barbed Wire On Your ..." then
if buton==1 then
parse('spawnobject 2 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 2 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 2 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 2 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Wall I On Your ..." then
if buton==1 then
parse('spawnobject 3 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Wall II On Your ..." then
if buton==1 then
parse('spawnobject 4 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 4 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 4 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 4 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Wall III On Your ..." then
if buton==1 then
parse('spawnobject 5 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 5 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 5 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 5 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Gate Field On Your ..." then
if buton==1 then
parse('spawnobject 6 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 6 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 6 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 6 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Dispenser On Your ..." then
if buton==1 then
parse('spawnobject 7 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 7 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 7 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 7 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Spawn Object - Page 2/3" then
if buton==1 then
menu(id,"<vip> Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"<vip> Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"<vip> Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"<vip> Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"<vip> Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==7 then
menu(id,"<vip> Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==8 then
menu(id,"<vip> Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==9 then
menu(id,"<vip> Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="<vip> Supply On Your ..." then
if buton==1 then
parse('spawnobject 9 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 9 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 9 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 9 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Turret On Your ..." then
if buton==1 then
parse('spawnobject 8 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 8 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 8 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 8 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Dual Turret On Your ..." then
if buton==1 then
parse('spawnobject 11 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 11 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 11 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 11 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Triple Turret On Your ..." then
if buton==1 then
parse('spawnobject 12 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 12 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 12 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 12 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Super Supply On Your ..." then
if buton==1 then
parse('spawnobject 15 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 15 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 15 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 15 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Teleporter Entrance On Your ..." then
if buton==1 then
parse('spawnobject 13 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 13 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 13 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 13 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Teleporter Exit On Your ..." then
if buton==1 then
parse('spawnobject 14 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 14 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 14 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 14 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Spawn Object - Page 3/3" then
if buton==1 then
menu(id,"<vip> Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"<vip> Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"<vip> Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"<vip> Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="<vip> Construction Site On Your ..." then
if buton==1 then
parse('spawnobject 10 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 10 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 10 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 10 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="<vip> Mine On Your ..." then
if buton==1 then
parse('spawnobject 20 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 20 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 20 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 20 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="<vip> Orange Portal On Your ..." then
if buton==1 then
parse('spawnobject 22 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 22 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 22 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 22 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="<vip> Blue Portal On Your ..." then
if buton==1 then
parse('spawnobject 23 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 23 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 23 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 23 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"<vip> Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"<vip> Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="<vip> Teleport To Player - Page 1/2" then
if buton==1 then
parse('setpos '..id..' '..player(1,"x")..' '..player(1,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==2 then
parse('setpos '..id..' '..player(2,"x")..' '..player(2,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[2])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==3 then
parse('setpos '..id..' '..player(3,"x")..' '..player(3,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[3])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==4 then
parse('setpos '..id..' '..player(4,"x")..' '..player(4,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[4])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==5 then
parse('setpos '..id..' '..player(5,"x")..' '..player(5,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[5])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==6 then
parse('setpos '..id..' '..player(6,"x")..' '..player(6,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[6])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==7 then
parse('setpos '..id..' '..player(7,"x")..' '..player(7,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[7])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==8 then
parse('setpos '..id..' '..player(8,"x")..' '..player(8,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[8])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==9 then
menu(id,"<vip> Teleport To Player - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="<vip> Teleport To Player - Page 2/2" then
if buton==1 then
parse('setpos '..id..' '..player(9,"x")..' '..player(9,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[9])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==2 then
parse('setpos '..id..' '..player(10,"x")..' '..player(10,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==3 then
parse('setpos '..id..' '..player(11,"x")..' '..player(11,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[11])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==4 then
parse('setpos '..id..' '..player(12,"x")..' '..player(12,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[12])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==5 then
parse('setpos '..id..' '..player(13,"x")..' '..player(13,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[13])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==6 then
parse('setpos '..id..' '..player(14,"x")..' '..player(14,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[14])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==7 then
parse('setpos '..id..' '..player(15,"x")..' '..player(15,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[15])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==8 then
parse('setpos '..id..' '..player(16,"x")..' '..player(16,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[16])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==9 then
menu(id,"<vip> Teleport To Player - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="<vip> Bring Player To You - Page 1/2" then
if buton==1 then
parse('setpos 1 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==2 then
parse('setpos 2 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[2])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==3 then
parse('setpos 3 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[3])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==4 then
parse('setpos 4 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[4])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==5 then
parse('setpos 5 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[5])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==6 then
parse('setpos 6 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[6])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==7 then
parse('setpos 7 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[7])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==8 then
parse('setpos 8 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[8])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==9 then
menu(id,"<vip> Bring Player To You - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="<vip> Bring Player To You - Page 2/2" then
if buton==1 then
parse('setpos 9 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[9])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==2 then
parse('setpos 10 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[10])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==3 then
parse('setpos 11 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[11])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==4 then
parse('setpos 12 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[12])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==5 then
parse('setpos 13 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[13])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==6 then
parse('setpos 14 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[14])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==7 then
parse('setpos 15 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[15])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==8 then
parse('setpos 16 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[16])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==9 then
menu(id,"<vip> Bring Player To You - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="<vip> Hats" then
if buton==1 then
freeimage(id)
id1=image("gfx/The Admin/CooL HaT.png",1,1,200+id)
imagealpha(id1,1.0)
elseif buton==2 then
freeimage(id)
id1=image("gfx/The Admin/Metal Helmet.png",1,1,200+id)
imagealpha(id1,1.0)
elseif buton==3 then
freeimage(id)
id1=image("gfx/The Admin/marine_hat.png",1,1,200+id)
imagealpha(id1,1.0)
elseif buton==4 then
freeimage(id)
id1=image("gfx/The Admin/Normal Hat 2.png",1,1,200+id)
imagealpha(id1,1.0)
elseif buton==5 then
freeimage(id)
id1=image("gfx/The Admin/Pirate.png",1,1,200+id)
imagealpha(id1,1.0)
elseif buton==6 then
freeimage(id)
elseif buton==7 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
end
end
if title=="Admin Menu <More>" then
if buton==1 then
menu(id,"Load a Script,Level and Exp,Time System,Position,Admin of God,Explosive Snowballs,Back")
elseif buton==2 then
menu(id,"Bring Player To You - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Teleport To Player - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Change Say Colour,Red,Green,Blue,Yellow,Black,White,Orange,Cyan,Back")
elseif buton==5 then
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==6 then
menu(id,"Hats,Armor Hat,Armor Hat 2,Cool Hat,Metal Hat,Marine Hat,Car,Pirate Hat,Wings,No Hat")
elseif buton==7 then
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==8 then
menu(id,"Hud Options,No Hud,Only Health,Only Armor,Only Health and Armor,Only Time (Clock),Only Health and Clock,Only Armor and Clock,Health Armor and Clock,Load All Huds")
elseif buton==9 then
menu(id,"Funny Menu,Funny Man,ButterFly|Extra,Pelerine|Extra,Explosion Snake,Smile|Extra,Bring All Players,Create Floor&Object,3x3 Creatures")
end
end
if title=="Teleport To Player - Page 1/2" then
if buton==1 then
parse('setpos '..id..' '..player(1,"x")..' '..player(1,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==2 then
parse('setpos '..id..' '..player(2,"x")..' '..player(2,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[2])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==3 then
parse('setpos '..id..' '..player(3,"x")..' '..player(3,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[3])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==4 then
parse('setpos '..id..' '..player(4,"x")..' '..player(4,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[4])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==5 then
parse('setpos '..id..' '..player(5,"x")..' '..player(5,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[5])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==6 then
parse('setpos '..id..' '..player(6,"x")..' '..player(6,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[6])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==7 then
parse('setpos '..id..' '..player(7,"x")..' '..player(7,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[7])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==8 then
parse('setpos '..id..' '..player(8,"x")..' '..player(8,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[8])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==9 then
menu(id,"Teleport To Player - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Teleport To Player - Page 2/2" then
if buton==1 then
parse('setpos '..id..' '..player(9,"x")..' '..player(9,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[9])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==2 then
parse('setpos '..id..' '..player(10,"x")..' '..player(10,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==3 then
parse('setpos '..id..' '..player(11,"x")..' '..player(11,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[11])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==4 then
parse('setpos '..id..' '..player(12,"x")..' '..player(12,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[12])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==5 then
parse('setpos '..id..' '..player(13,"x")..' '..player(13,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[13])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==6 then
parse('setpos '..id..' '..player(14,"x")..' '..player(14,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[14])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==7 then
parse('setpos '..id..' '..player(15,"x")..' '..player(15,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[15])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==8 then
parse('setpos '..id..' '..player(16,"x")..' '..player(16,"y"))
	msg("©000255000"..player(id,"name").." Teleported To "..name[16])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
elseif buton==9 then
menu(id,"Teleport To Player - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Bring Player To You - Page 1/2" then
if buton==1 then
parse('spawnplayer 1 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[1])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==2 then
parse('spawnplayer 2 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[2])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==3 then
parse('spawnplayer 3 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[3])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==4 then
parse('spawnplayer 4 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[4])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==5 then
parse('spawnplayer 5 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[5])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==6 then
parse('spawnplayer 6 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[6])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==7 then
parse('spawnplayer 7 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[7])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==8 then
parse('spawnplayer 8 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[8])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==9 then
menu(id,"Bring Player To You - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Bring Player To You - Page 2/2" then
if buton==1 then
parse('spawnplayer 9 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[9])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==2 then
parse('spawnplayer 10 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[10])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==3 then
parse('spawnplayer 11 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[11])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==4 then
parse('spawnplayer 12 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[12])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==5 then
parse('spawnplayer 13 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[13])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==6 then
parse('spawnplayer 14 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[14])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==7 then
parse('spawnplayer 15 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[15])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==8 then
parse('spawnplayer 16 '..player(id,"x")..' '..player(id,"y"))
	msg("©000255000"..player(id,"name").." Bring "..name[16])
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 255 000')
elseif buton==9 then
menu(id,"Bring Player To You - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Hats" then
if buton>0 then
funman[id]=0
end
if buton==1 then
freeimage(id)
id1=image("gfx/The Admin/Armor Hat.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=1
elseif buton==2 then
freeimage(id)
id1=image("gfx/The Admin/Armor Hat 2.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=2
elseif buton==3 then
freeimage(id)
id1=image("gfx/The Admin/CooL HaT.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=3
elseif buton==4 then
freeimage(id)
id1=image("gfx/The Admin/Metal Helmet.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=4
elseif buton==5 then
freeimage(id)
id1=image("gfx/The Admin/marine_hat.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=5
elseif buton==6 then
freeimage(id)
id1=image("gfx/The Admin/Normal Hat 2.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=6
elseif buton==7 then
freeimage(id)
id1=image("gfx/The Admin/Pirate.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=7
elseif buton==8 then
freeimage(id)
id1=image("gfx/The Admin/Wings.png",1,1,200+id)
imagealpha(id1,1.0)
thehat[id]=8
elseif buton==9 then
freeimage(id)
thehat[id]=0
end
end
if title=="Bot Menu" then
if buton==1 then
parse('bot_add_t')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==2 then
parse('bot_add_ct')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==3 then
parse('bot_remove_t')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==4 then
parse('bot_remove_ct')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==5 then
parse('bot_remove_all')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==6 then
parse('bot_kill')
menu(id,"Bot Menu,Add Bot T,Add Bot CT,Remove Bot T,Remove Bot CT,Remove All Bots,Kill All Bots,Back")
elseif buton==7 then
menu(id,"Admin Menu <More>,Load a Script,Bring a Player,Teleport To Player,Change Say Colour,Bots,Hats,Make Explosion,Hud Options,Funny Menu|For Fun!")
end
end
if title=="Hud Options" then
if buton>0 and buton<9 then
parse('mp_hud '.. buton-1)
end
if buton==9 then
parse('mp_hud -1')
end
if buton>0 then
msg("©000255000Huds Changed!")
end
end
if title=="Choose You ColorSmoke" then
if buton==1 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 255 000 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==2 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 000 255 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==3 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 000 000 255')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==4 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 255 255 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==5 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 255 128 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==6 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 000 000 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==7 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 255 255 255')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==8 then
parse('effect "colorsmoke" '..cx[id]..' '..cy[id]..' 0 0 128 128 128')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==9 then
menu(id,"Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
end
end
if title=="Make Explosion" then
if buton==1 then
parse('explosion '..cx[id]..' '..cy[id]..' 50 50 '..id)
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==2 then
parse('explosion '..cx[id]..' '..cy[id]..' 100 100 '..id)
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==3 then
parse('explosion '..cx[id]..' '..cy[id]..' 250 250 '..id)
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==4 then
parse('explosion '..cx[id]..' '..cy[id]..' 500 500 '..id)
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==5 then
parse('explosion '..cx[id]..' '..cy[id]..' 1000 1000 '..id)
menu(id,"Make Explosion,Explosion 1|R:50,Explosion 2|R:100,Explosion 3|R:250,Explosion 4|R:500,Explosion 5|R:1000,Back")
elseif buton==6 then
menu(id,"Admin Menu <More>,Load a Script,Bring a Player,Teleport To Player,Change Say Colour,Bots,Hats,Make Explosion,Hud Options,Funny Menu|For Fun!")
end
end
if title=="Give Items" then
if buton==1 then
menu(id,"Give Health,0 HP|Die!,1 HP,10 HP,50 HP,75 HP,100 HP|Normal,150 HP,200 HP,250 HP|Max,Back")
elseif buton==2 then
menu(id,"Give Armor,No Armor,100 Kevlar,200 Kevlar,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Super Armor,Shealth Suit")
elseif buton==3 then
menu(id,"Give Speed,-100 Speed|Min.,-20 Speed,-10 Speed,0 Speed|Normal,10 Speed,20 Speed,50 Speed,100 Speed|Max.")
elseif buton==4 then
menu(id,"Give Team - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give Score,-50,-20,-10,0,10,20,50,100")
elseif buton==6 then
menu(id,"Give Deaths,0,10,20,50,100,250,500,1000")
elseif buton==7 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,V.I.P,Punish,Give Items,Restart,More -->")
end
end
if title=="Give Health" then
if buton==1 then
menu(id,"Give 0 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Give 1 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Give 10 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Give 50 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give 75 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Give 100 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Give 150 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Give 200 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==9 then
menu(id,"Give 250 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 0 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 0 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 0 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 0')
	msg(""..player(id,"name").." [Admin] Gave 0 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 0 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 1 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 1 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 1 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 1')
	msg(""..player(id,"name").." [Admin] Gave 1 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 1 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 10 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 10 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 10 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 10')
	msg(""..player(id,"name").." [Admin] Gave 10 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 10 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Funny Menu" then
if buton==1 then
if funman[id]==0 then
funman[id]=1
fmode[id]=1
	msg2(id,"You Are Funman :)")
elseif funman[id]==1 then
freeimage(id)
funman[id]=0
	msg2(id,"You Are Not Funman (:")
end
elseif buton==2 then
if extrahat[id]==0 then
hatimg[id]=image("gfx/The Admin/ButterFly.png",1,1,200+id)
extrahat[id]=1
elseif extrahat[id]==1 then
freeimaeg(hatimg[id])
extrahat[id]=0
end
elseif buton==3 then
hatimg[id]=image("gfx/The Admin/hero.png",1,1,200+id)
elseif buton==4 then
if explosionsnake[id]==0 then
explosionsnake[id]=1
	msg2(id,"Explosion Snake Activated!")
elseif explosionsnake[id]==1 then
explosionsnake[id]=0
	msg2(id,"Explosion Snake Deactivated!")
end
elseif buton==5 then
freeimage(hatimg[id])
hatimg[id]=image("gfx/The Admin/smile.png",1,1,200+id)
elseif buton==6 then
for i =1,32 do
if i~=id then
parse('spawnplayer '..i..' '..player(id,"x")..' '..player(id,"y"))
end
end
	msg2(id,"All Players Has Been Brought!")
elseif buton==7 then
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==8 then
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
end
end
if title=="Give 50 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 50 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 50 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 50')
	msg(""..player(id,"name").." [Admin] Gave 50 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 50 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Change Say Colour" then
if buton==1 then
admincolor[id] = "255000000"
adminsay[id]=1
elseif buton==2 then
admincolor[id] = "000255000"
adminsay[id]=2
elseif buton==3 then
admincolor[id] = "000000255"
adminsay[id]=3
elseif buton==4 then
admincolor[id] = "255255000"
adminsay[id]=4
elseif buton==5 then
admincolor[id] = "000000000"
adminsay[id]=5
elseif buton==6 then
admincolor[id] = "255255255"
adminsay[id]=6
elseif buton==7 then
admincolor[id] = "255128000"
adminsay[id]=7
elseif buton==8 then
admincolor[id] = "000255255"
adminsay[id]=8
elseif buton==9 then
menu(id,"Admin Menu <More>,Load a Script,Bring a Player,Teleport To Player,Change Say Colour,Bots,Hats,Make Explosion,Hud Options,Funny Menu|For Fun!")
end
end
if title=="Load a Script" then
if buton==1 then
if(levelsystem==0) then
levelsystem = 1
for i=1,16 do
levl(i)
end
	msg("Level System Activated!")
elseif(levelsystem==1) then
levelsystem = 0
for i=1,16 do
parse('hudtxt2 '..i..' 1 " " 10 150')
parse('hudtxt2 '..i..' 2 " " 10 165')
end
msg("Level System Deactivated!")
end
elseif buton==2 then
if(timesystem==0) then
timesystem = 1
for i=1,16 do
parse('hudtxt2 '..i..' 5 "'..os.date("©000128255Time: %I:%M %p")..'" 10 210')
parse('hudtxt2 '..i..' 6 "'..os.date("©000255128Date: %A, %d %b %Y")..'" 10 225')	
end
	msg("Time System Activated!")
elseif(timesystem==1) then
timesystem = 0
	msg("Time System Deactivated!")
for i=1,32 do
parse('hudtxt2 '..i..' 5 " " 10 210')
parse('hudtxt2 '..i..' 6 " " 10 225')
end
end
elseif buton==3 then
if(positionsystem==0) then
positionsystem = 1
	msg("Show Position System Activated!")
elseif(positionsystem==1) then
positionsystem = 0
	msg("Show Position System Deactivated!")
parse('hudtxt2 '..id..' 3 " " 10 195')
parse('hudtxt2 '..id..' 4 " " 10 195')
end
elseif buton==4 then
if admnokill[id]==0 then
admnokill[id]=1
	msg2(id,"Admin No Kill Activated!")
elseif admnokill[id]==1 then
admnokill[id]=0
	msg2(id,"Admin No Kill Deactivated!")
end
elseif buton==5 then
if expsnow[id]==0 then
expsnow[id]=1
	msg("Explosive Snowball Mode Activated!")
parse('equip '..id..' 75')
parse('setweapon '..id..' 75')
elseif expsnow[id]==1 then
expsnow[id]=0
	msg("Explosive Snowball Mode Deactivated!")
end
end
end
if title=="Give 75 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 75 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 75 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 75')
	msg(""..player(id,"name").." [Admin] Gave 75 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 75 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 100 HP - Page 1/2" then
if buton==1 then
parse('sethealth 1 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[1])
elseif buton==2 then
parse('sethealth 2 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[2])
elseif buton==3 then
parse('sethealth 3 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[3])
elseif buton==4 then
parse('sethealth 4 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[4])
elseif buton==5 then
parse('sethealth 5 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[5])
elseif buton==6 then
parse('sethealth 6 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[6])
elseif buton==7 then
parse('sethealth 7 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[7])
elseif buton==8 then
parse('sethealth 8 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 100 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 HP - Page 2/2" then
if buton==1 then
parse('sethealth 9 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[9])
elseif buton==2 then
parse('sethealth 10 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[10])
elseif buton==3 then
parse('sethealth 11 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[11])
elseif buton==4 then
parse('sethealth 12 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[12])
elseif buton==5 then
parse('sethealth 13 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[13])
elseif buton==6 then
parse('sethealth 14 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[14])
elseif buton==7 then
parse('sethealth 15 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[15])
elseif buton==8 then
parse('sethealth 16 100')
	msg(""..player(id,"name").." [Admin] Gave 100 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 100 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Create Floor&Object - Page 1/3" then
if buton==1 then
image("gfx/The Admin/grass.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==2 then
image("gfx/The Admin/sand.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==3 then
image("gfx/The Admin/snow.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==4 then
image("gfx/The Admin/water.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==5 then
image("gfx/The Admin/tilewater.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==6 then
image("gfx/The Admin/tilewood.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==7 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/metalwall.bmp",ax[id],ay[id],1)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==8 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/glass.bmp",ax[id],ay[id],1)
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
elseif buton==9 then
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
end
end
if title=="Create Floor&Object - Page 2/3" then
if buton==1 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/wall.bmp",ax[id],ay[id],1)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==2 then
image("gfx/The Admin/road.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==3 then
image("gfx/The Admin/roadleft.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==4 then
image("gfx/The Admin/roadup.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==5 then
image("gfx/The Admin/floor.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==6 then
image("gfx/The Admin/tree.bmp",cx[id],cy[id],1)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==7 then
image("gfx/The Admin/Normal Hat 2.png",cx[id],cy[id],1)
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
elseif buton==8 then
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
elseif buton==9 then
menu(id,"Create Floor&Object - Page 1/3,Grass,Sand,Snow,Water,Tile Water,Tile Wood,Metal Wall,Glass,Next")
end
end
if title=="Create Floor&Object - Page 3/3" then
if buton==1 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
parse('spawnobject 5 '..((cx[id]/32)+1)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
parse('spawnobject 5 '..(cx[id]/32)..' '..((cy[id]/32)+1)..' 1 1 '..player(id,"team")..' '..id)
parse('spawnobject 5 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/lb1.bmp",ax[id],ay[id],1)
image("gfx/The Admin/lb2.bmp",(ax[id]+32),ay[id],1)
image("gfx/The Admin/lb3.bmp",ax[id],(ay[id]+32),1)
image("gfx/The Admin/lb4.bmp",(ax[id]+32),(ay[id]+32),1)
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Plane,Portal Tile,Back")
elseif buton==2 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/box.bmp",ax[id],ay[id],1)
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
elseif buton==3 then
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==4 then
menu(id,"Chair,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Toilet,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"Sink,Left,Right,Up,Down,Back")
elseif buton==7 then
parse('spawnobject 5 '..(cx[id]/32)..' '..(cy[id]/32)..' 1 1 '..player(id,"team")..' '..id)
image("gfx/The Admin/table.bmp",ax[id],ay[id],1)
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
elseif buton==8 then
image("gfx/The Admin/portaltile.bmp",ax[id],ay[id],0)
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
elseif buton==9 then
menu(id,"Create Floor&Object - Page 2/3,Wall,Road,Road -,Road I,Floor,Tree,Car,Next,Back")
end
end
if title=="Flare" then
if buton==1 then
f1=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f1,1)
imagecolor(f1,255,0,0)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==2 then
f2=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f2,1)
imagecolor(f2,0,255,0)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==3 then
f3=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f3,1)
imagecolor(f3,0,0,255)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==4 then
f4=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f4,1)
imagecolor(f4,255,255,0)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==5 then
f5=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f5,1)
imagecolor(f5,255,255,255)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==6 then
f6=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f6,1)
imagecolor(f6,128,128,128)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==7 then
f7=image("gfx/sprites/flare2.bmp",cx[id],cy[id],1)
imageblend(f7,1)
imagecolor(f7,255,128,0)
menu(id,"Flare,Red,Green,Blue,Yellow,White,Grey,Orange,Back")
elseif buton==8 then
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
end
end
if title=="Chair" then
if buton==1 then
cr=image("gfx/The Admin/chair-left.bmp",ax[id],ay[id],0)
menu(id,"Chair,Left,Right,Up,Down,Back")
elseif buton==2 then
image("gfx/The Admin/chair-right.bmp",ax[id],ay[id],0)
menu(id,"Chair,Left,Right,Up,Down,Back")
elseif buton==3 then
image("gfx/The Admin/chair-up.bmp",ax[id],ay[id],0)
menu(id,"Chair,Left,Right,Up,Down,Back")
elseif buton==4 then
image("gfx/The Admin/chair-down.bmp",ax[id],ay[id],0)
menu(id,"Chair,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
end
end
if title=="Toilet" then
if buton==1 then
image("gfx/The Admin/toilet_left.bmp",ax[id],ay[id],0)
menu(id,"Toilet,Left,Right,Up,Down,Back")
elseif buton==2 then
image("gfx/The Admin/toilet_right.bmp",ax[id],ay[id],0)
menu(id,"Toilet,Left,Right,Up,Down,Back")
elseif buton==3 then
image("gfx/The Admin/toilet_up.bmp",ax[id],ay[id],0)
menu(id,"Toilet,Left,Right,Up,Down,Back")
elseif buton==4 then
image("gfx/The Admin/toilet_down.bmp",ax[id],ay[id],0)
menu(id,"Toilet,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
end
end
if title=="Sink" then
if buton==1 then
image("gfx/The Admin/sink_left.bmp",ax[id],ay[id],0)
menu(id,"Sink,Left,Right,Up,Down,Back")
elseif buton==2 then
image("gfx/The Admin/sink_right.bmp",ax[id],ay[id],0)
menu(id,"Sink,Left,Right,Up,Down,Back")
elseif buton==3 then
image("gfx/The Admin/sink_up.bmp",ax[id],ay[id],0)
menu(id,"Sink,Left,Right,Up,Down,Back")
elseif buton==4 then
image("gfx/The Admin/sink_down.bmp",ax[id],ay[id],0)
menu(id,"Sink,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Create Floor&Object - Page 3/3,Large Box,Small Box,Flare,Chair,Toilet,Sink,Table,Portal Tile,Back")
end
end
if title=="3x3 Creatures" then
if buton==1 then
parse('spawnnpc 1 '..(cx[id]/32)..' '..(cy[id]/32))
parse('spawnnpc 1 '..((cx[id]/32)+1)..' '..(cy[id]/32))
parse('spawnnpc 1 '..((cx[id]/32)-1)..' '..(cy[id]/32))
parse('spawnnpc 1 '..(cx[id]/32)..' '..((cy[id]/32)+1))
parse('spawnnpc 1 '..(cx[id]/32)..' '..((cy[id]/32)-1))
parse('spawnnpc 1 '..((cx[id]/32)-1)..' '..((cy[id]/32)-1))
parse('spawnnpc 1 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1))
parse('spawnnpc 1 '..((cx[id]/32)-1)..' '..((cy[id]/32)+1))
parse('spawnnpc 1 '..((cx[id]/32)+1)..' '..((cy[id]/32)-1))
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==2 then
parse('spawnnpc 2 '..(cx[id]/32)..' '..(cy[id]/32))
parse('spawnnpc 2 '..((cx[id]/32)+1)..' '..(cy[id]/32))
parse('spawnnpc 2 '..((cx[id]/32)-1)..' '..(cy[id]/32))
parse('spawnnpc 2 '..(cx[id]/32)..' '..((cy[id]/32)+1))
parse('spawnnpc 2 '..(cx[id]/32)..' '..((cy[id]/32)-1))
parse('spawnnpc 2 '..((cx[id]/32)-1)..' '..((cy[id]/32)-1))
parse('spawnnpc 2 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1))
parse('spawnnpc 2 '..((cx[id]/32)-1)..' '..((cy[id]/32)+1))
parse('spawnnpc 2 '..((cx[id]/32)+1)..' '..((cy[id]/32)-1))
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==3 then
parse('spawnnpc 3 '..(cx[id]/32)..' '..(cy[id]/32))
parse('spawnnpc 3 '..((cx[id]/32)+1)..' '..(cy[id]/32))
parse('spawnnpc 3 '..((cx[id]/32)-1)..' '..(cy[id]/32))
parse('spawnnpc 3 '..(cx[id]/32)..' '..((cy[id]/32)+1))
parse('spawnnpc 3 '..(cx[id]/32)..' '..((cy[id]/32)-1))
parse('spawnnpc 3 '..((cx[id]/32)-1)..' '..((cy[id]/32)-1))
parse('spawnnpc 3 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1))
parse('spawnnpc 3 '..((cx[id]/32)-1)..' '..((cy[id]/32)+1))
parse('spawnnpc 3 '..((cx[id]/32)+1)..' '..((cy[id]/32)-1))
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==4 then
parse('spawnnpc 4 '..(cx[id]/32)..' '..(cy[id]/32))
parse('spawnnpc 4 '..((cx[id]/32)+1)..' '..(cy[id]/32))
parse('spawnnpc 4 '..((cx[id]/32)-1)..' '..(cy[id]/32))
parse('spawnnpc 4 '..(cx[id]/32)..' '..((cy[id]/32)+1))
parse('spawnnpc 4 '..(cx[id]/32)..' '..((cy[id]/32)-1))
parse('spawnnpc 4 '..((cx[id]/32)-1)..' '..((cy[id]/32)-1))
parse('spawnnpc 4 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1))
parse('spawnnpc 4 '..((cx[id]/32)-1)..' '..((cy[id]/32)+1))
parse('spawnnpc 4 '..((cx[id]/32)+1)..' '..((cy[id]/32)-1))
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==5 then
parse('spawnnpc 5 '..(cx[id]/32)..' '..(cy[id]/32))
parse('spawnnpc 5 '..((cx[id]/32)+1)..' '..(cy[id]/32))
parse('spawnnpc 5 '..((cx[id]/32)-1)..' '..(cy[id]/32))
parse('spawnnpc 5 '..(cx[id]/32)..' '..((cy[id]/32)+1))
parse('spawnnpc 5 '..(cx[id]/32)..' '..((cy[id]/32)-1))
parse('spawnnpc 5 '..((cx[id]/32)-1)..' '..((cy[id]/32)-1))
parse('spawnnpc 5 '..((cx[id]/32)+1)..' '..((cy[id]/32)+1))
parse('spawnnpc 5 '..((cx[id]/32)-1)..' '..((cy[id]/32)+1))
parse('spawnnpc 5 '..((cx[id]/32)+1)..' '..((cy[id]/32)-1))
menu(id,"3x3 Creatures,Zombie,Headcrab,Snark,Vortigaunt,Soldier,Back")
elseif buton==6 then
menu(id,"Funny Menu,Funny Man,ButterFly|Extra,Pelerine|Extra,Explosion Snake,Smile|Extra,Bring All Players,Create Floor&Object,3x3 Creatures")
end
end
if title=="Give 150 HP - Page 1/2" then
if buton==1 then
parse('setmaxhealth 1 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[1])
elseif buton==2 then
parse('setmaxhealth 2 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[2])
elseif buton==3 then
parse('setmaxhealth 3 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[3])
elseif buton==4 then
parse('setmaxhealth 4 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[4])
elseif buton==5 then
parse('setmaxhealth 5 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[5])
elseif buton==6 then
parse('setmaxhealth 6 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[6])
elseif buton==7 then
parse('setmaxhealth 7 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[7])
elseif buton==8 then
parse('setmaxhealth 8 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 150 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 150 HP - Page 2/2" then
if buton==1 then
parse('setmaxhealth 9 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[9])
elseif buton==2 then
parse('setmaxhealth 10 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[10])
elseif buton==3 then
parse('setmaxhealth 11 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[11])
elseif buton==4 then
parse('setmaxhealth 12 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[12])
elseif buton==5 then
parse('setmaxhealth 13 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[13])
elseif buton==6 then
parse('setmaxhealth 14 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[14])
elseif buton==7 then
parse('setmaxhealth 15 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[15])
elseif buton==8 then
parse('setmaxhealth 16 150')
	msg(""..player(id,"name").." [Admin] Gave 150 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 150 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 200 HP - Page 1/2" then
if buton==1 then
parse('setmaxhealth 1 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[1])
elseif buton==2 then
parse('setmaxhealth 2 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[2])
elseif buton==3 then
parse('setmaxhealth 3 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[3])
elseif buton==4 then
parse('setmaxhealth 4 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[4])
elseif buton==5 then
parse('setmaxhealth 5 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[5])
elseif buton==6 then
parse('setmaxhealth 6 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[6])
elseif buton==7 then
parse('setmaxhealth 7 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[7])
elseif buton==8 then
parse('setmaxhealth 8 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 200 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 200 HP - Page 2/2" then
if buton==1 then
parse('setmaxhealth 9 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[9])
elseif buton==2 then
parse('setmaxhealth 10 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[10])
elseif buton==3 then
parse('setmaxhealth 11 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[11])
elseif buton==4 then
parse('setmaxhealth 12 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[12])
elseif buton==5 then
parse('setmaxhealth 13 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[13])
elseif buton==6 then
parse('setmaxhealth 14 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[14])
elseif buton==7 then
parse('setmaxhealth 15 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[15])
elseif buton==8 then
parse('setmaxhealth 16 200')
	msg(""..player(id,"name").." [Admin] Gave 200 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 200 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 250 HP - Page 1/2" then
if buton==1 then
parse('setmaxhealth 1 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[1])
elseif buton==2 then
parse('setmaxhealth 2 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[2])
elseif buton==3 then
parse('setmaxhealth 3 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[3])
elseif buton==4 then
parse('setmaxhealth 4 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[4])
elseif buton==5 then
parse('setmaxhealth 5 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[5])
elseif buton==6 then
parse('setmaxhealth 6 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[6])
elseif buton==7 then
parse('setmaxhealth 7 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[7])
elseif buton==8 then
parse('setmaxhealth 8 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[8])
elseif buton==9 then
menu(id,"Give 250 HP - Page 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 250 HP - Page 2/2" then
if buton==1 then
parse('setmaxhealth 9 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[9])
elseif buton==2 then
parse('setmaxhealth 10 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[10])
elseif buton==3 then
parse('setmaxhealth 11 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[11])
elseif buton==4 then
parse('setmaxhealth 12 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[12])
elseif buton==5 then
parse('setmaxhealth 13 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[13])
elseif buton==6 then
parse('setmaxhealth 14 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[14])
elseif buton==7 then
parse('setmaxhealth 15 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[15])
elseif buton==8 then
parse('setmaxhealth 16 250')
	msg(""..player(id,"name").." [Admin] Gave 250 HP to "..name[16])
elseif buton==9 then
menu(id,"Give 250 HP - Page 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Back")
end
end
if title=="<vip> Change Say Colour" then
if buton==1 then
vipcolor[id]="255000000"
elseif buton==2 then
vipcolor[id]="000255000"
elseif buton==3 then
vipcolor[id]="000000255"
elseif buton==4 then
vipcolor[id]="255255000"
elseif buton==5 then
vipcolor[id]="255255255"
elseif buton==6 then
vipcolor[id]="000000000"
elseif buton==7 then
vipcolor[id]="255128000"
elseif buton==8 then
vipcolor[id]="128128128"
elseif buton==9 then
menu(id,"Vip Menu,Spawn Creature,Spawn Effect,Spawn Object,Teleport To Player,Bring Player To You,Hats,Change Say Colour")
end
end
if title=="Mute Menu" then
if buton==1 then
menu(id,"Mute a Player- Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Unmute a Player- Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Mute a Player- Names 1/2" then
if buton==1 then
parse('mute 1')
	msg(""..player(id,"name").." [Admin] Muted "..name[1].."!")
elseif buton==2 then
parse('mute 2')
	msg(""..player(id,"name").." [Admin] Muted "..name[2].."!")
elseif buton==3 then
parse('mute 3')
	msg(""..player(id,"name").." [Admin] Muted "..name[3].."!")
elseif buton==4 then
parse('mute 4')
	msg(""..player(id,"name").." [Admin] Muted "..name[4].."!")
elseif buton==5 then
parse('mute 5')
	msg(""..player(id,"name").." [Admin] Muted "..name[5].."!")
elseif buton==6 then
parse('mute 6')
	msg(""..player(id,"name").." [Admin] Muted "..name[6].."!")
elseif buton==7 then
parse('mute 7')
	msg(""..player(id,"name").." [Admin] Muted "..name[7].."!")
elseif buton==8 then
parse('mute 8')
	msg(""..player(id,"name").." [Admin] Muted "..name[8].."!")
elseif buton==9 then
menu(id,"Mute a Player- Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Mute a Player- Names 2/2" then
if buton==1 then
parse('mute 9')
	msg(""..player(id,"name").." [Admin] Muted "..name[9].."!")
elseif buton==2 then
parse('mute 10')
	msg(""..player(id,"name").." [Admin] Muted "..name[10].."!")
elseif buton==3 then
parse('mute 11')
	msg(""..player(id,"name").." [Admin] Muted "..name[11].."!")
elseif buton==4 then
parse('mute 12')
	msg(""..player(id,"name").." [Admin] Muted "..name[12].."!")
elseif buton==5 then
parse('mute 13')
	msg(""..player(id,"name").." [Admin] Muted "..name[13].."!")
elseif buton==6 then
parse('mute 14')
	msg(""..player(id,"name").." [Admin] Muted "..name[14].."!")
elseif buton==7 then
parse('mute 15')
	msg(""..player(id,"name").." [Admin] Muted "..name[15].."!")
elseif buton==8 then
parse('mute 16')
	msg(""..player(id,"name").." [Admin] Muted "..name[16].."!")
elseif buton==9 then
menu(id,"Mute a Player- Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Unmute a Player- Names 1/2" then
if buton==1 then
parse('unmute 1')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[1].."!")
elseif buton==2 then
parse('unmute 2')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[2].."!")
elseif buton==3 then
parse('unmute 3')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[3].."!")
elseif buton==4 then
parse('unmute 4')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[4].."!")
elseif buton==5 then
parse('unmute 5')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[5].."!")
elseif buton==6 then
parse('unmute 6')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[6].."!")
elseif buton==7 then
parse('unmute 7')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[7].."!")
elseif buton==8 then
parse('unmute 8')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[8].."!")
elseif buton==9 then
menu(id,"Unmute a Player- Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Unmute a Player- Names 2/2" then
if buton==1 then
parse('unmute 9')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[9].."!")
elseif buton==2 then
parse('unmute 10')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[10].."!")
elseif buton==3 then
parse('unmute 11')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[11].."!")
elseif buton==4 then
parse('unmute 12')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[12].."!")
elseif buton==5 then
parse('unmute 13')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[13].."!")
elseif buton==6 then
parse('unmute 14')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[14].."!")
elseif buton==7 then
parse('unmute 15')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[15].."!")
elseif buton==8 then
parse('unmute 16')
	msg(""..player(id,"name").." [Admin] Unmuted "..name[16].."!")
elseif buton==9 then
menu(id,"Unmute a Player- Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Armor" then
if buton==1 then
menu(id,"Give No Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Give 100 Kevlar - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Give 200 Kevlar - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Give Light Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give Medium Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Give Heavy Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Give Medic Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Give Super Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==9 then
menu(id,"Give Shealth Suit - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give No Armor - Names 1/2" then
if buton==1 then
parse('equip 1 58')
parse('setarmor 1 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[1])
elseif buton==2 then
parse('equip 2 58')
parse('setarmor 2 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[2])
elseif buton==3 then
parse('equip 3 58')
parse('setarmor 3 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[3])
elseif buton==4 then
parse('equip 4 58')
parse('setarmor 4 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[4])
elseif buton==5 then
parse('equip 5 58')
parse('setarmor 5 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[5])
elseif buton==6 then
parse('equip 6 58')
parse('setarmor 6 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[6])
elseif buton==7 then
parse('equip 7 58')
parse('setarmor 7 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[7])
elseif buton==8 then
parse('equip 8 58')
parse('setarmor 8 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[8])
elseif buton==9 then
menu(id,"Give No Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give No Armor - Names 2/2" then
if buton==1 then
parse('equip 9 58')
parse('setarmor 9 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[9])
elseif buton==2 then
parse('equip 10 58')
parse('setarmor 10 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[10])
elseif buton==3 then
parse('equip 11 58')
parse('setarmor 11 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[11])
elseif buton==4 then
parse('equip 12 58')
parse('setarmor 12 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[12])
elseif buton==5 then
parse('equip 13 58')
parse('setarmor 13 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[13])
elseif buton==6 then
parse('equip 14 58')
parse('setarmor 14 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[14])
elseif buton==7 then
parse('equip 15 58')
parse('setarmor 15 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[15])
elseif buton==8 then
parse('equip 16 58')
parse('setarmor 16 0')
	msg(""..player(id,"name").." [Admin] Take Armor From "..name[16])
elseif buton==9 then
menu(id,"Give No Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 100 Kevlar - Names 1/2" then
if buton==1 then
parse('equip 1 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[1])
elseif buton==2 then
parse('equip 2 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[2])
elseif buton==3 then
parse('equip 3 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[3])
elseif buton==4 then
parse('equip 4 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[4])
elseif buton==5 then
parse('equip 5 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[5])
elseif buton==6 then
parse('equip 6 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[6])
elseif buton==7 then
parse('equip 7 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[7])
elseif buton==8 then
parse('equip 8 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[8])
elseif buton==9 then
menu(id,"Give 100 Kevlar - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 Kevlar - Names 2/2" then
if buton==1 then
parse('equip 9 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[9])
elseif buton==2 then
parse('equip 10 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[10])
elseif buton==3 then
parse('equip 11 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[11])
elseif buton==4 then
parse('equip 12 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[12])
elseif buton==5 then
parse('equip 13 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[13])
elseif buton==6 then
parse('equip 14 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[14])
elseif buton==7 then
parse('equip 15 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[15])
elseif buton==8 then
parse('equip 16 58')
	msg(""..player(id,"name").." [Admin] Gave 100 Kevlar to "..name[16])
elseif buton==9 then
menu(id,"Give 100 Kevlar - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 200 Kevlar - Names 1/2" then
if buton==1 then
parse('equip 1 58')
parse('setarmor 1 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[1])
elseif buton==2 then
parse('equip 2 58')
parse('setarmor 2 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[2])
elseif buton==3 then
parse('equip 3 58')
parse('setarmor 3 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[3])
elseif buton==4 then
parse('equip 4 58')
parse('setarmor 4 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[4])
elseif buton==5 then
parse('equip 5 58')
parse('setarmor 5 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[5])
elseif buton==6 then
parse('equip 6 58')
parse('setarmor 6 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[6])
elseif buton==7 then
parse('equip 7 58')
parse('setarmor 7 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[7])
elseif buton==8 then
parse('equip 8 58')
parse('setarmor 8 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[8])
elseif buton==9 then
menu(id,"Give 200 Kevlar - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 200 Kevlar - Names 2/2" then
if buton==1 then
parse('equip 9 58')
parse('setarmor 9 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[9])
elseif buton==2 then
parse('equip 10 58')
parse('setarmor 10 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[10])
elseif buton==3 then
parse('equip 11 58')
parse('setarmor 11 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[11])
elseif buton==4 then
parse('equip 12 58')
parse('setarmor 12 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[12])
elseif buton==5 then
parse('equip 13 58')
parse('setarmor 13 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[13])
elseif buton==6 then
parse('equip 14 58')
parse('setarmor 14 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[14])
elseif buton==7 then
parse('equip 15 58')
parse('setarmor 15 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[15])
elseif buton==8 then
parse('equip 16 58')
parse('setarmor 16 200')
	msg(""..player(id,"name").." [Admin] Gave 200 Kevlar to "..name[16])
elseif buton==9 then
menu(id,"Give 200 Kevlar - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Light Armor - Names 1/2" then
if buton==1 then
parse('equip 1 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[1])
elseif buton==2 then
parse('equip 2 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[2])
elseif buton==3 then
parse('equip 3 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[3])
elseif buton==4 then
parse('equip 4 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[4])
elseif buton==5 then
parse('equip 5 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[5])
elseif buton==6 then
parse('equip 6 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[6])
elseif buton==7 then
parse('equip 7 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[7])
elseif buton==8 then
parse('equip 8 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[8])
elseif buton==9 then
menu(id,"Give Light Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Light Armor - Names 2/2" then
if buton==1 then
parse('equip 9 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[9])
elseif buton==2 then
parse('equip 10 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[10])
elseif buton==3 then
parse('equip 11 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[11])
elseif buton==4 then
parse('equip 12 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[12])
elseif buton==5 then
parse('equip 13 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[13])
elseif buton==6 then
parse('equip 14 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[14])
elseif buton==7 then
parse('equip 15 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[15])
elseif buton==8 then
parse('equip 16 79')
	msg(""..player(id,"name").." [Admin] Gave Light Armor to "..name[16])
elseif buton==9 then
menu(id,"Give Light Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Medium Armor - Names 1/2" then
if buton==1 then
parse('equip 1 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[1])
elseif buton==2 then
parse('equip 2 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[2])
elseif buton==3 then
parse('equip 3 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[3])
elseif buton==4 then
parse('equip 4 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[4])
elseif buton==5 then
parse('equip 5 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[5])
elseif buton==6 then
parse('equip 6 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[6])
elseif buton==7 then
parse('equip 7 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[7])
elseif buton==8 then
parse('equip 8 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[8])
elseif buton==9 then
menu(id,"Give Medium Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Medium Armor - Names 2/2" then
if buton==1 then
parse('equip 9 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[9])
elseif buton==2 then
parse('equip 10 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[10])
elseif buton==3 then
parse('equip 11 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[11])
elseif buton==4 then
parse('equip 12 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[12])
elseif buton==5 then
parse('equip 13 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[13])
elseif buton==6 then
parse('equip 14 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[14])
elseif buton==7 then
parse('equip 15 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[15])
elseif buton==8 then
parse('equip 16 80')
	msg(""..player(id,"name").." [Admin] Gave Medium Armor to "..name[16])
elseif buton==9 then
menu(id,"Give Medium Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Heavy Armor - Names 1/2" then
if buton==1 then
parse('equip 1 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[1])
elseif buton==2 then
parse('equip 2 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[2])
elseif buton==3 then
parse('equip 3 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[3])
elseif buton==4 then
parse('equip 4 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[4])
elseif buton==5 then
parse('equip 5 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[5])
elseif buton==6 then
parse('equip 6 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[6])
elseif buton==7 then
parse('equip 7 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[7])
elseif buton==8 then
parse('equip 8 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[8])
elseif buton==9 then
menu(id,"Give Heavy Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Heavy Armor - Names 2/2" then
if buton==1 then
parse('equip 9 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[9])
elseif buton==2 then
parse('equip 10 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[10])
elseif buton==3 then
parse('equip 11 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[11])
elseif buton==4 then
parse('equip 12 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[12])
elseif buton==5 then
parse('equip 13 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[13])
elseif buton==6 then
parse('equip 14 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[14])
elseif buton==7 then
parse('equip 15 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[15])
elseif buton==8 then
parse('equip 16 81')
	msg(""..player(id,"name").." [Admin] Gave Heavy Armor to "..name[16])
elseif buton==9 then
menu(id,"Give Heavy Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Medic Armor - Names 1/2" then
if buton==1 then
parse('equip 1 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[1])
elseif buton==2 then
parse('equip 2 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[2])
elseif buton==3 then
parse('equip 3 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[3])
elseif buton==4 then
parse('equip 4 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[4])
elseif buton==5 then
parse('equip 5 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[5])
elseif buton==6 then
parse('equip 6 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[6])
elseif buton==7 then
parse('equip 7 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[7])
elseif buton==8 then
parse('equip 8 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[8])
elseif buton==9 then
menu(id,"Give Medic Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Medic Armor - Names 2/2" then
if buton==1 then
parse('equip 9 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[9])
elseif buton==2 then
parse('equip 10 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[10])
elseif buton==3 then
parse('equip 11 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[11])
elseif buton==4 then
parse('equip 12 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[12])
elseif buton==5 then
parse('equip 13 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[13])
elseif buton==6 then
parse('equip 14 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[14])
elseif buton==7 then
parse('equip 15 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[15])
elseif buton==8 then
parse('equip 16 82')
	msg(""..player(id,"name").." [Admin] Gave Medic Armor to "..name[16])
elseif buton==9 then
menu(id,"Give Medic Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Super Armor - Names 1/2" then
if buton==1 then
parse('equip 1 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[1])
elseif buton==2 then
parse('equip 2 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[2])
elseif buton==3 then
parse('equip 3 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[3])
elseif buton==4 then
parse('equip 4 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[4])
elseif buton==5 then
parse('equip 5 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[5])
elseif buton==6 then
parse('equip 6 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[6])
elseif buton==7 then
parse('equip 7 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[7])
elseif buton==8 then
parse('equip 8 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[8])
elseif buton==9 then
menu(id,"Give Super Armor - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Super Armor - Names 2/2" then
if buton==1 then
parse('equip 9 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[9])
elseif buton==2 then
parse('equip 10 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[10])
elseif buton==3 then
parse('equip 11 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[11])
elseif buton==4 then
parse('equip 12 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[12])
elseif buton==5 then
parse('equip 13 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[13])
elseif buton==6 then
parse('equip 14 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[14])
elseif buton==7 then
parse('equip 15 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[15])
elseif buton==8 then
parse('equip 16 83')
	msg(""..player(id,"name").." [Admin] Gave Super Armor to "..name[16])
elseif buton==9 then
menu(id,"Give Super Armor - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Shealth Suit - Names 1/2" then
if buton==1 then
parse('equip 1 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[1])
elseif buton==2 then
parse('equip 2 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[2])
elseif buton==3 then
parse('equip 3 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[3])
elseif buton==4 then
parse('equip 4 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[4])
elseif buton==5 then
parse('equip 5 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[5])
elseif buton==6 then
parse('equip 6 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[6])
elseif buton==7 then
parse('equip 7 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[7])
elseif buton==8 then
parse('equip 8 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[8])
elseif buton==9 then
menu(id,"Give Shealth Suit - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Shealth Suit - Names 2/2" then
if buton==1 then
parse('equip 9 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[9])
elseif buton==2 then
parse('equip 10 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[10])
elseif buton==3 then
parse('equip 11 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[11])
elseif buton==4 then
parse('equip 12 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[12])
elseif buton==5 then
parse('equip 13 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[13])
elseif buton==6 then
parse('equip 14 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[14])
elseif buton==7 then
parse('equip 15 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[15])
elseif buton==8 then
parse('equip 16 84')
	msg(""..player(id,"name").." [Admin] Gave Shealth Suit to "..name[16])
elseif buton==9 then
menu(id,"Give Shealth Suit - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Speed" then
if buton==1 then
menu(id,"Give -100 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Give -20 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Give -10 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Give Normal Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give 10 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Give 20 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Give 50 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Give 100 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -100 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give -100 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -100 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 -100')
	msg(""..player(id,"name").." [Admin] Gave -100 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give -100 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -20 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give -20 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -20 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 -20')
	msg(""..player(id,"name").." [Admin] Gave -20 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give -20 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -10 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give -10 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -10 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 -10')
	msg(""..player(id,"name").." [Admin] Gave -10 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give -10 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Normal Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[8])
elseif buton==9 then
menu(id,"Give Normal Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Normal Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 0')
	msg(""..player(id,"name").." [Admin] Gave Normal Speed to "..name[16])
elseif buton==9 then
menu(id,"Give Normal Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 10 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give 10 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 10 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 10')
	msg(""..player(id,"name").." [Admin] Gave 10 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give 10 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 20 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give 20 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 20 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 20')
	msg(""..player(id,"name").." [Admin] Gave 20 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give 20 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 50 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give 50 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 50 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 50')
	msg(""..player(id,"name").." [Admin] Gave 50 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give 50 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 100 Speed - Names 1/2" then
if buton==1 then
parse('speedmod 1 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[1])
elseif buton==2 then
parse('speedmod 2 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[2])
elseif buton==3 then
parse('speedmod 3 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[3])
elseif buton==4 then
parse('speedmod 4 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[4])
elseif buton==5 then
parse('speedmod 5 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[5])
elseif buton==6 then
parse('speedmod 6 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[6])
elseif buton==7 then
parse('speedmod 7 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[7])
elseif buton==8 then
parse('speedmod 8 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[8])
elseif buton==9 then
menu(id,"Give 100 Speed - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 Speed - Names 2/2" then
if buton==1 then
parse('speedmod 9 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[9])
elseif buton==2 then
parse('speedmod 10 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[10])
elseif buton==3 then
parse('speedmod 11 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[11])
elseif buton==4 then
parse('speedmod 12 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[12])
elseif buton==5 then
parse('speedmod 13 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[13])
elseif buton==6 then
parse('speedmod 14 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[14])
elseif buton==7 then
parse('speedmod 15 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[15])
elseif buton==8 then
parse('speedmod 16 100')
	msg(""..player(id,"name").." [Admin] Gave 100 Speed to "..name[16])
elseif buton==9 then
menu(id,"Give 100 Speed - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Team - Names 1/2" then
if buton==1 then
menu(id,"Give Team <id 1>,Counter-Terorist,Terorist,Spectator")
elseif buton==2 then
menu(id,"Give Team <id 2>,Counter-Terorist,Terorist,Spectator")
elseif buton==3 then
menu(id,"Give Team <id 3>,Counter-Terorist,Terorist,Spectator")
elseif buton==4 then
menu(id,"Give Team <id 4>,Counter-Terorist,Terorist,Spectator")
elseif buton==5 then
menu(id,"Give Team <id 5>,Counter-Terorist,Terorist,Spectator")
elseif buton==6 then
menu(id,"Give Team <id 6>,Counter-Terorist,Terorist,Spectator")
elseif buton==7 then
menu(id,"Give Team <id 7>,Counter-Terorist,Terorist,Spectator")
elseif buton==8 then
menu(id,"Give Team <id 8>,Counter-Terorist,Terorist,Spectator")
elseif buton==9 then
menu(id,"Give Team - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give Team - Names 2/2" then
if buton==1 then
menu(id,"Give Team <id 9>,Counter-Terorist,Terorist,Spectator")
elseif buton==2 then
menu(id,"Give Team <id 10>,Counter-Terorist,Terorist,Spectator")
elseif buton==3 then
menu(id,"Give Team <id 11>,Counter-Terorist,Terorist,Spectator")
elseif buton==4 then
menu(id,"Give Team <id 12>,Counter-Terorist,Terorist,Spectator")
elseif buton==5 then
menu(id,"Give Team <id 13>,Counter-Terorist,Terorist,Spectator")
elseif buton==6 then
menu(id,"Give Team <id 14>,Counter-Terorist,Terorist,Spectator")
elseif buton==7 then
menu(id,"Give Team <id 15>,Counter-Terorist,Terorist,Spectator")
elseif buton==8 then
menu(id,"Give Team <id 16>,Counter-Terorist,Terorist,Spectator")
elseif buton==9 then
menu(id,"Give Team - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Team <id 1>" then
if buton==1 then
parse('makect 1')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[1])
elseif buton==2 then
parse('maket 1')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[1])
elseif buton==3 then
parse('makespec 1')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[1])
end
end
if title=="Give Team <id 2>" then
if buton==1 then
parse('makect 2')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[2])
elseif buton==2 then
parse('maket 2')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[2])
elseif buton==3 then
parse('makespec 2')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[2])
end
end
if title=="Give Team <id 3>" then
if buton==1 then
parse('makect 3')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[3])
elseif buton==2 then
parse('maket 3')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[3])
elseif buton==3 then
parse('makespec 3')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[3])
end
end
if title=="Give Team <id 4>" then
if buton==1 then
parse('makect 4')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[4])
elseif buton==2 then
parse('maket 4')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[4])
elseif buton==3 then
parse('makespec 4')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[4])
end
end
if title=="Give Team <id 5>" then
if buton==1 then
parse('makect 5')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[5])
elseif buton==2 then
parse('maket 5')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[5])
elseif buton==3 then
parse('makespec 5')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[5])
end
end
if title=="Give Team <id 6>" then
if buton==1 then
parse('makect 6')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[6])
elseif buton==2 then
parse('maket 6')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[6])
elseif buton==3 then
parse('makespec 6')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[6])
end
end
if title=="Give Team <id 7>" then
if buton==1 then
parse('makect 7')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[7])
elseif buton==2 then
parse('maket 7')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[7])
elseif buton==3 then
parse('makespec 7')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[7])
end
end
if title=="Give Team <id 8>" then
if buton==1 then
parse('makect 8')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[8])
elseif buton==2 then
parse('maket 8')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[8])
elseif buton==3 then
parse('makespec 8')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[8])
end
end
if title=="Give Team <id 9>" then
if buton==1 then
parse('makect 9')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[9])
elseif buton==2 then
parse('maket 9')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[9])
elseif buton==3 then
parse('makespec 9')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[9])
end
end
if title=="Give Team <id 10>" then
if buton==1 then
parse('makect 10')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[10])
elseif buton==2 then
parse('maket 10')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[10])
elseif buton==3 then
parse('makespec 10')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[10])
end
end
if title=="Give Team <id 11>" then
if buton==1 then
parse('makect 11')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[11])
elseif buton==2 then
parse('maket 11')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[11])
elseif buton==3 then
parse('makespec 11')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[11])
end
end
if title=="Give Team <id 12>" then
if buton==1 then
parse('makect 12')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[12])
elseif buton==2 then
parse('maket 12')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[12])
elseif buton==3 then
parse('makespec 12')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[12])
end
end
if title=="Give Team <id 13>" then
if buton==1 then
parse('makect 13')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[13])
elseif buton==2 then
parse('maket 13')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[13])
elseif buton==3 then
parse('makespec 13')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[13])
end
end
if title=="Give Team <id 14>" then
if buton==1 then
parse('makect 14')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[14])
elseif buton==2 then
parse('maket 14')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[14])
elseif buton==3 then
parse('makespec 14')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[14])
end
end
if title=="Give Team <id 15>" then
if buton==1 then
parse('makect 15')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[15])
elseif buton==2 then
parse('maket 15')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[15])
elseif buton==3 then
parse('makespec 15')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[15])
end
end
if title=="Give Team <id 16>" then
if buton==1 then
parse('makect 16')
	msg(""..player(id,"name").." [Admin] Make Counter-Terorist "..name[16])
elseif buton==2 then
parse('maket 16')
	msg(""..player(id,"name").." [Admin] Make Terorist "..name[16])
elseif buton==3 then
parse('makespec 16')
	msg(""..player(id,"name").." [Admin] Make Spectator "..name[16])
end
end
if title=="Give Score" then
if buton==1 then
menu(id,"Give -50 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Give -20 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Give -10 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Give 0 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give 10 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Give 20 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Give 50 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Give 100 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -50 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(1,"score")-50))
	msg(""..player(id,"name").." [Admin] Gave -50 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give -50 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -50 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")-50))
	msg(""..player(id,"name").." [Admin] Gave -50 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give -50 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -20 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")-20))
	msg(""..player(id,"name").." [Admin] Gave -20 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give -20 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -20 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")-20))
	msg(""..player(id,"name").." [Admin] Gave -20 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give -20 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give -10 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")-10))
	msg(""..player(id,"name").." [Admin] Gave -10 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give -10 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give -10 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")-10))
	msg(""..player(id,"name").." [Admin] Gave -10 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give -10 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 0 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' 0')
	msg(""..player(id,"name").." [Admin] Sets 0 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give 0 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 0 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' 0')
	msg(""..player(id,"name").." [Admin] Gave 0 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 0 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 10 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")+10))
	msg(""..player(id,"name").." [Admin] Gave 10 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give 10 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 10 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")+10))
	msg(""..player(id,"name").." [Admin] Gave 10 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 10 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 20 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")+20))
	msg(""..player(id,"name").." [Admin] Gave 20 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give 20 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 20 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")+20))
	msg(""..player(id,"name").." [Admin] Gave 20 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 20 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 50 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")+50))
	msg(""..player(id,"name").." [Admin] Gave 50 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give 50 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 50 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")+50))
	msg(""..player(id,"name").." [Admin] Gave 50 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 50 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 100 Score - Names 1/2" then
if buton>0 and buton<9 then
parse('setscore '..buton..' '..(player(buton,"score")+100))
	msg(""..player(id,"name").." [Admin] Gave 100 Score to "..name[buton])
end
if buton==9 then
menu(id,"Give 100 Score - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 Score - Names 2/2" then
if buton>0 and buton<9 then
parse('setscore '.. buton+8 ..' '..(player(buton+8,"score")+100))
	msg(""..player(id,"name").." [Admin] Gave 100 Score to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 100 Score - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give Deaths" then
if buton==1 then
menu(id,"Give 0 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
menu(id,"Give 10 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
menu(id,"Give 20 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
menu(id,"Give 50 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
menu(id,"Give 100 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
menu(id,"Give 250 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Give 500 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==8 then
menu(id,"Give 1000 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 0 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' 0')
	msg(""..player(id,"name").." [Admin] Gave 0 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 0 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 0 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' 0')
	msg(""..player(id,"name").." [Admin] Gave 0 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 0 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 10 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+10))
	msg(""..player(id,"name").." [Admin] Gave 10 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 10 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 10 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+10))
	msg(""..player(id,"name").." [Admin] Gave 10 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 10 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 20 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+20))
	msg(""..player(id,"name").." [Admin] Gave 20 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 20 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 20 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+20))
	msg(""..player(id,"name").." [Admin] Gave 20 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 20 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 50 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+50))
	msg(""..player(id,"name").." [Admin] Gave 50 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 50 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 50 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+50))
	msg(""..player(id,"name").." [Admin] Gave 50 Deaths to "..name[buton+8])
end
if buton == 9 then
menu(id,"Give 50 Deaths - Names 1/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+100))
	msg(""..player(id,"name").." [Admin] Gave 100 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 100 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 100 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+100))
	msg(""..player(id,"name").." [Admin] Gave 100 Deaths to "..name[buton+8])
end
menu(id,"Give 100 Deaths - Names 1/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 250 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+250))
	msg(""..player(id,"name").." [Admin] Gave 250 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 250 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 250 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+250))
	msg(""..player(id,"name").." [Admin] Gave 250 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 250 Deaths - Names 1/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 500 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+500))
	msg(""..player(id,"name").." [Admin] Gave 500 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 500 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 500 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+500))
	msg(""..player(id,"name").." [Admin] Gave 500 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 500 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Give 1000 Deaths - Names 1/2" then
if buton>0 and buton<9 then
parse('setdeaths '..buton..' '..(player(buton,"deaths")+1000))
	msg(""..player(id,"name").." [Admin] Gave 1000 Deaths to "..name[buton])
end
if buton==9 then
menu(id,"Give 1000 Deaths - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Give 1000 Deaths - Names 2/2" then
if buton>0 and buton<9 then
parse('setdeaths '.. buton+8 ..' '..(player(buton+8,"deaths")+1000))
	msg(""..player(id,"name").." [Admin] Gave 1000 Deaths to "..name[buton+8])
end
if buton==9 then
menu(id,"Give 1000 Deaths - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end

--------------------------------------------------
-- Mensagens  e Kill Sounds Script Brasil    --
-- 01/01/2011   www.online-brasil.blogspot.com           --
-- Add Esse Script Em Seu Server  -- Script - By: RamPage      --
--------------------------------------------------

if sample==nil then sample={} end
sample.ut={}

-----------------------
-- INITIAL SETUP     --
-----------------------
function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end
sample.ut.timer=initArray(32)
sample.ut.level=initArray(32)
sample.ut.fblood=


-----------------------
-- PREPARE TO FIGHT! --
-----------------------
addhook("startround","sample.ut.startround")
function sample.ut.startround()
	parse("sv_sound \"fun/prepare.wav\"")
	sample.ut.fblood=0
end


-----------------------
-- KILL SOUNDS+MSGS  --
-----------------------
addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
	if (os.clock()-sample.ut.timer[killer])>30 then
		sample.ut.level[killer]=0;
	end
	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level
	sample.ut.timer[killer]=os.clock()
	-- FIRST BLOOD?
	if (sample.ut.fblood==1) then
		sample.ut.fblood=1
		parse("sv_sound \"fun/firstblood.wav\"");
		msg (player(killer,"name").."/MATOU O "..player(victim,"name").." O PRIMEIRO A MORRER DO ROUND!!")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg ("©123456789"..player(killer,"name").." HUMILHOU "..player(victim,"name").."!@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©000070255"..player(killer,"name").." MaTøu 2 Noob's!@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©166255001"..player(killer,"name").." MaTøu 3 PaTø!@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©255000055"..player(killer,"name").." Levou 4 Noobs Pro Inferno!@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000255255"..player(killer,"name").." Menino mal mata 5 noob ..!!!@C")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©255000215"..player(killer,"name").." NOSS... Bixa má !@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©000255000"..player(killer,"name").." Isso é um Diabo!@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©255255255"..player(killer,"name").." Ekaa esse é viciado ..!@C")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." Ta ficando bom que nem o DIABOO!!!!@C")
		elseif (level==10) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©172000255 "..player(killer,"name").." Ta ficando bom que nem o DEMONHOOO!!!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©255085000 CARALHO"..player(killer,"name").." Ja Matou "..level.." Nubs,PUTA MERDA !!@C")
		end
	end
end

------Fast-Reload-------
------By leon7070-------
------06.10.2010--------
---www.newearth.de.tt---

addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end

addhook("say","reset") 
function reset(id,txt) 
if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©887777888 Voçe resetou seu Score! ")
	end 
end

addhook("join","thejoin")
function thejoin(id)
          msg("©150130255"..player(id,"name").." Entrou No Server!@C")
     end

addhook("minute","minute_reset")
function minute_reset()
        msg("©255105000Para resetar o score escreva !reset ") 
end

parse("mp_autoteambalance 0")
parse("mp_damagefactor 999")
parse("sv_rconusers 90592")
parse("sv_rcon abc")







