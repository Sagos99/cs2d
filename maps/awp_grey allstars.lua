-------------------------------------------------
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
		msg (player(killer,"name").." DerruBøU ø PriMeiRø  "..player(victim,"name").."!")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg ("©123456789"..player(killer,"name").." HuuMiLhou ø "..player(victim,"name").." HaHaHa !")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©000000255"..player(killer,"name").." MaTøu 2 Noob's!")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©000000255"..player(killer,"name").." MaTøu 3 PaTø!")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." Levou 4 Noobs Pro Inferno!")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." é ø ¢hµ¢k ñø®®¡$!?")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." made a Rampage!")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." Isso é um Diabo!")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." made a GoooD Like!")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." Esse Cara Não Para!!!")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©200000000 "..player(killer,"name").." é ø ÞÐG Ðë Højë - MaTøu! "..level.." PaTøs!")
		end
	end
end

addhook("say","reset") 
function reset(id,txt) 
  if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©000255000Score Resetado!")
	end 
end

addhook("minute","minute_reset")
function minute_reset()
	msg("©000255000Para Resetar Score digite !reset")
end

--23/12/2010, [NBK]NaSH (N-B-K @ US.de), Argentina
pival = math.pi / 180
extraarmored = 12
extranoarmored = 25

addhook("hit","onhit")
addhook("startround","onstartround")

function correctrot(angle)
	if (angle>90 and angle<=180) then
		return angle - 270
	 else
		return angle + 90
	end
end
function toradians(angle)
	return pival*angle
end
function calcdis(a,b)
	local ax = player(a,"tilex")
	local ay = player(a,"tiley")
	local bx = player(b,"tilex")
	local by = player(b,"tiley")
	return math.floor(math.sqrt((bx-ax)^2 + (by-ay)^2))
end
function onhit(id,source,weapon,hpdmg,apdmg)
	local accuracy1 = 0
	local accuracy2 = 0
	local difx = player(id,"x") - player(source,"x")
	local dify = player(id,"y") - player(source,"y")
	local goang = math.atan2(dify,difx)
	
	local ang = correctrot(player(source,"rot"))
	if ang>0 and ang<180 then
		ang = (180-ang)*(-1)
	 else
		ang = 180+ang
	end
	local r = toradians(ang)
	local distance = calcdis(id,source)
	if distance<=4 then
		accuracy1,accuracy2 = 0.0318,-0.0314 --0.0318,-0.0314
	 else
	if distance>4 and distance<=6 then
		accuracy1,accuracy2 = 0.009,-0.0089 --0.009,-0.0089
	 else
	if distance>6 then
		accuracy1,accuracy2 = 0.00899,-0.00878 --0.002,-0.0015
	end
	end
	end
	if r-goang<accuracy1 and r-goang>accuracy2 then
		local prevhealth = player(id,"health")
		local prevarmor = player(id,"armor")
		local extradmg = 0
		if prevarmor>=65 then
			extradmg = (hpdmg*extraarmored)/100
		 else
			extradmg = (hpdmg*extranoarmored)/100
		end
		if player(source,"weapontype")~=51 then
			if (prevhealth-hpdmg)>0 then
		 	 else
				hskill(id,source)
			    	   return 1
			end
			if (prevhealth-(extradmg+hpdmg))>0 then
				parse("sethealth "..id.." "..(prevhealth-(extradmg+hpdmg)))
				   return 1
		 	 else
				hskill(id,source)
			    	   return 1
			end
		end
	end
end
function onstartround()
	parse("msg ©255127039Aperte F3 2 VEZES para ativar o Lag Compesation") --Sorry for SPAM :B
end


function hskill(victim,killer)
	parse("customkill "..killer.." (Head)"..itemtype(player(killer,"weapontype"),"name").." "..victim) --Try to don't delete this line

	--[[
	Here you could add an extra blood sprite or what you want!

	  An example:
	  parse("setscore "..killer.." "..player(killer,"score")+5)

	Thanks to Crawis for "headshot.wav" and "headshot2.wav"
	]]

	--You can delete this, or modificate it...
	local rndsound = math.random(1,2)
	if rndsound==1 then
		parse("sv_sound headshot.wav")
	else
		parse("sv_sound headshot2.wav")
	end
	parse("msg ©255255255"..player(killer,"name").. " Matou Com Um HeadShot! @C")	
end


addhook("startround","imgstart")
function imgstart(start)
image("gfx/ast2.png",580,375,2,0)
end


