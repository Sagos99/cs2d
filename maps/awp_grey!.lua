--------------------------------------------------
-- Mensagens e Kills    --
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
		msg (player(killer,"name").." FIRST BLOOD "..player(victim,"name").."!")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
         level = level+1
		msg ("©000000000"..player(killer,"name").." EXCELLENT!")
	else
		-- REGULAR KILL
		if (level==1) then
		        msg ("©255255255"..player(killer,"name").." SHADOW!")
		elseif (level==2) then
			msg ("©255170000"..player(killer,"name").." DOUBLE KILL!")
		elseif (level==3) then
			msg ("©000153071"..player(killer,"name").." TRIPLE KILL!")
		elseif (level==4) then
			msg ("©000000255"..player(killer,"name").." MEGA KILL!")
		elseif (level==5) then
			msg ("©128000128"..player(killer,"name").." ULTRA KILL!")
		elseif (level==6) then
			msg ("©255000255"..player(killer,"name").." GOOD LIKE!")
		elseif (level==7) then
			msg ("©000128255"..player(killer,"name").." RAMPAGE!")
		elseif (level==8) then
			msg ("©255255000"..player(killer,"name").." UNSTOPPABLE!")
		elseif (level==9) then
			msg ("©128000000"..player(killer,"name").." THATS THE WAY!")
		else
			msg ("©128128128 "..player(killer,"name").." DEVIL KILLED "..level.." NOOBS!")
		end
	end
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
	parse("msg ©255127039") --Sorry for SPAM :B
end


function hskill(victim,killer)
	parse("customkill "..killer.." (Head)"..itemtype(player(killer,"weapontype"),"name").." "..victim)
       msg ("©255255255"..player(killer,"name").." HEADSHOT!")
end


------By leon7070-------
------06.10.2010--------
---www.newearth.de.tt---


addhook("second","pb_thetime")
function pb_thetime()
parse('hudtxt 1 "©255255255" 10 68')
parse('hudtxt 2 "©255255255" 18 68')
parse('hudtxt 3 "©255255255" 26 68')
parse('hudtxt 4 "©255255255" 50 68')
parse('hudtxt 15 "©255255255" 59 68')
parse('hudtxt 16 "©255255255" 62 68')
parse('hudtxt 17 "©255255255" 73 68')
parse('hudtxt 9 "©000155255'..os.date("Hora: %I:%M %p")..'" 10 100')
end


