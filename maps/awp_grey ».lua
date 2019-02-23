admins = {35014,78439,84034,61003,80424}
adminlist = {35014,78439,84034,61003,80424}

addhook("say","adminsay")
function adminsay(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
	msg("©255255255"..player(id,"name").." »Ãdmin: "..txt)
return 1
end
end
end

addhook("serveraction","menuac")
addhook("menu","men")
function menuac(id,ac)
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if ac==1 then
menu(id,"Legend,Ekipmanlar,Restart,Yapimci | Legend")
end
function men(id,title,sel)
if (title=="Legend") then
if (sel==1) then
menu(id,"menü2,Full Ekipman")
elseif (sel==2) then
parse([[restartround 5]])
end
function men(id,title,sel)
if (title=="menü2") then
if (sel==1) then
parse("equip "..id.." 45")
parse("equip "..id.." 83")
parse("equip "..id.." 88")
parse("equip "..id.." 78")
parse("equip "..id.." 85")

end
end
end
end
end
end
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
		msg (player(killer,"name").." Mätøµ sµä 1ª VäÐ¡å  "..player(victim,"name").."!@C")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg ("©123456789"..player(killer,"name").." HuuMiLhou ø "..player(victim,"name").." HaHaHa !@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©000000255"..player(killer,"name").." MaTøu 2 Noob's!@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©000000255"..player(killer,"name").." MaTøu 3 PaTø!@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." Levou 4 Noobs Pro Inferno!@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." é ø ¢hµ¢k ñø®®¡$!?@C")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." made a Rampage!@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." Isso é um Diabo!@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." made a GoooD Like!@C")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." Esse Cara Não Para!!!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©200000000 "..player(killer,"name").." é ø ÞÐG Ðë Højë - MaTøu! "..level.." VäÐ¡ås!@C")
		end
	end
end

addhook("say","reset") 
function reset(id,txt) 
  if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©032255255Score Resetado!")
	end 
end

addhook("minute","minute_reset")
function minute_reset()
	msg("©000255000Para resetar score digite !reset")
end
