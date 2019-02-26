--------------------------------------------------
-- UT+Quake Sounds Script by Unreal Software    --
-- 22.02.2009 - www.UnrealSoftware.de           --
-- Adds UT and Quake Sounds to your Server      --
--------------------------------------------------

if sample==nil then sample={} end
sample.ut={}

adminlist = {71066,78026,78841}

addhook("say","adminsay")
function adminsay(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
	msg("©777777777"..player(id,"name").." »AÐM¡Ñ«: "..txt)
return 1
end
end
end

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
sample.ut.fblood=0


-----------------------
-- PREPARE TO FIGHT! --
-----------------------
addhook("startround","sample.ut.startround")
function sample.ut.startround()
	parse("sv_sound \"fun/prepare1_ultimate.wav\"")
	sample.ut.fblood=0
end


-----------------------
-- KILL SOUNDS+MSGS  --
-----------------------
addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
	if (os.clock()-sample.ut.timer[killer])>3 then
		sample.ut.level[killer]=0;
	end
	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level
	sample.ut.timer[killer]=os.clock()
	-- FIRST BLOOD?
	if (sample.ut.fblood==0) then
		sample.ut.fblood=1
		parse("sv_sound \"fun/firstblood.wav\"");
		msg ("©255000000"..player(killer,"name").." cØñ§éGµ¡µ §éµ 1 Frág cøm ø (a) "..player(victim,"name").."!@C")
	end
	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/knife1_ultimate.wav\""); 
		msg ("©171130255"..player(killer,"name").." Hµm¡lhøµ ø Cø¡TádØ Do (a)  "..player(victim,"name").."!@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©024525500"..player(killer,"name").." matou 2 Nøøß'§ !@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©321781700"..player(killer,"name").." matou 3 þµRa §øRTé !@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©139101800"..player(killer,"name").." matou 4 E§§e ta z¡kaÐø !!@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©148021100"..player(killer,"name").." matou 5 Ðèµ§ §àgráÐø !!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©187255255"..player(killer,"name").." Qµé ¡§§øØøØøØ tá Ð+! "..level.." KILLS!@C")
		end
	end
end

addhook("say","reset") 
function reset(id,txt) 
  if(txt=="!rs") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©887777888Score Resetado!")
	end 
end

addhook("minute","minute_reset")
function minute_reset()
	msg("©001004545Para Resetar Score digite !rs")
end