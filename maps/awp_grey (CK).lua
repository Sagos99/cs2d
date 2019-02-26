
--------------------------------------------------
-- Mensagens  e Kill Sounds Script Brasil    --
-- 01/01/2011   www.online-brasil.blogspot.com           --
-- Add Esse Script Em Seu Server  -- Script - By: RamPage edited Lucas_SWAT      --
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
		msg ("©123456789"..player(killer,"name").."Olha a FAKA "..player(victim,"name").." HaHaHa !@C")
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
			msg ("©123456789"..player(killer,"name").." U.U Ta facil ne!@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." Serial Killer!!!@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." Continue assim!!!@C")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." Esse Cara Não Para!!!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©200000000 "..player(killer,"name").." Esse mlk e o CAPETA!!! - MaTøu! "..level.."@C")
end
end
end
end
