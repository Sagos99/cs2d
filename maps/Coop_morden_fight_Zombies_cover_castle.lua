parse("mp_wpndmg scout 70")
parse("mp_wpndmg claw 50")
parse("mp_deathdrop 4")
parse("sv_gm 5")
parse("mp_infammo 1")
parse("mp_wpndmg sg550 40")
parse("mp_wpndmg USP 40")
parse("mp_wpndmg ak47 30")
parse("mp_wpndmg m3 45")
parse("mp_wpndmg XM1014 26")
parse("mp_wpndmg M4A1 20")
parse("mp_wpndmg AWP 500")
parse("mp_wpndmg TMP 30")
parse("mp_wpndmg Deagle 150")
parse("mp_wpndmg He 300")
parse("mp_wpndmg mp5 35")
parse("mp_wpndmg mac10 15")
parse("mp_wpndmg ump45 27")
parse("mp_wpndmg aug 32")
parse("mp_wpndmg sg552 29")
parse("mp_wpndmg galil 17")
parse("mp_wpndmg famas 20")
parse("mp_wpndmg m249 30")
parse("mp_wpndmg m134 50")
parse("mp_wpndmg g3sg1 50")
parse("mp_wpndmg p90 30")
parse("mp_wpndmg rocketlauncher 101")
parse("mp_wpndmg grenadelauncher 150")
parse("mp_wpndmg RPG 250")
parse("mp_wpndmg g3sg1 40")
parse("sv_fow 0")
parse("mp_autoteambalance 0")
parse("mp_roundlimit 99")
parse("mp_roundtime 99")
parse("mp_building_limit turret 3")

local uuu1 = 1
local u = 1
local uu = 1
local uuu = 1
local uuuu = 1
local uuuuu = 1
local uuuuuu = 1
local uuuuuuu = 1
local uuuuuuuu = 1
local uuuuuuuuu = 1
local pw = 0
local sc = 20
local sc2 = 20
local sc3 = 20
local sc4 = 30
local skill = 30
local level = 1
local min = 0
local bot = 0


function array(m)
	local array = {}
	for i = 1, m do
		array[i] = 0
	end
	return array
end

time = array(32)
boss = array(32)
local boss2 = 0
god = array(32)
addhook("startround","remake")



function remake(id)
time = array(32)
god = array(32)
boss = array(32)
min = 0
u = 1
uu = 1
uuu = 1
uuu1 = 1
uuuu = 1
uuuuu = 1
uuuuuu = 1
uuuuuuu = 1
uuuuuuuu = 1
uuuuuuuuu = 1
pw = 0
sc = 20
sc2 = 20
sc3 = 20
sc4 = 30
skill = 30
level = 1
bot = 0
parse("bot_kill")
parse("bot_remove_all")
boss2 = 0
parse("bot_add_t")
parse("bot_add_t")
parse("bot_add_t")
parse("bot_add_t")

end



addhook("die","diexx")

addhook("kill","killspawn")
function diexx(id,killer)
  if(boss[id] == 1) then
     if(player(killer,"team") == 2) then
     parse("setmoney "..killer.." "..(player(killer,"money") + 10000))
     msg2(0,"©255255255 "..player(killer,"name").." killed the Boss !!")
     msg2(0,"©255255255 "..player(killer,"name").." score + 50 !!")
     msg2(0,"©255255255 "..player(killer,"name").." money + 10000 !!")
     parse ("setscore "..killer.." "..(player(killer,"score") + 50))
         if(level == 2) then
         parse("equip "..killer.." 3")
         msg2(0,"©255255255 "..player(killer,"name").." get Deagle(dmg++) !!")
         end
         if(level == 5) then
         parse("equip "..killer.." 90")
         msg2(0,"©255255255 "..player(killer,"name").." get M134 !!")
         end
         if(level == 8) then
         parse("equip "..killer.." 90")
         parse("equip "..killer.." 83")
         msg2(0,"©255255255 "..player(killer,"name").." get Super Armor !!")
         msg2(0,"©255255255 "..player(killer,"name").." get M134 !!")
         end
         if(level == 10) then
         parse("equip "..killer.." 45")
         parse("equip "..killer.." 3")
         msg2(0,"©255255255 "..player(killer,"name").." get Deagle(dmg++) !!")
         msg2(0,"©255255255 "..player(killer,"name").." get Laser !!")
         end
         if(level == 11) then
         parse("equip "..killer.." 45")
         parse("equip "..killer.." 90")
         parse("equip "..killer.." 83")
         parse("equip "..killer.." 3")
         msg2(0,"©255255255 "..player(killer,"name").." get Deagle(dmg++) !!")
         msg2(0,"©255255255 "..player(killer,"name").." get Super Armor !!")
         msg2(0,"©255255255 "..player(killer,"name").." get M134 !!")
         msg2(0,"©255255255 "..player(killer,"name").." get Laser !!")
         end
     end
     boss2 = 60
     boss[id] = 0
   end
   god[id] = 0
   if(player(killer,"team") == 1 and player(id,"team") == 2 and not player(id,"bot")) then
   time[id] = 999999
   end
  

end
function killspawn(killer,victim,weapon,x,y)



end


addhook("spawn","spawn")
function spawn(id)
        if not player(id,"bot") and player(id,"team")==1 and time[id] == 0 then
             parse('equip '..id..' '..74)
             
             parse("makect "..id)
        end
        if not player(id,"bot") and player(id,"team")==1 and time[id] > 0 then
             parse('equip '..id..' '..74)
             time[id] = 5
        end
        if player(id,"team")==2 then
             god[id] = 6
        end
        if player(id,"bot") and player(id,"team")==2 then
             parse("maket "..id)
        end
end


addhook("minute","zombieadd")
function zombieadd()
   min = min + 1

   if(min == 5) then
     level = 2
     parse("trigger l2")
     parse("bot_kill")
   end
   if(min == 11) then
     level = 3
     parse("trigger l3")
     parse("bot_kill")
   end
   if(min == 18) then
     level = 4
     parse("trigger l4")
     parse("bot_kill")
   end
   
   if(min == 25) then
     level = 5
     parse("trigger l5")
     parse("bot_kill")
   end
   
   if(min == 33) then
     level = 6
     parse("trigger l6")
     parse("bot_kill")
   end
   
   if(min == 37) then
     level = 7
     parse("trigger l7")
     parse("bot_kill")
   end
   
   if(min == 43) then
     level = 8
     parse("trigger l8")
     parse("bot_kill")
   end
   
   if(min == 50) then
     level = 9
     parse("trigger l9")
     parse("bot_kill")
   end
   
   if(min == 60) then
     level = 10
     parse("trigger l10")
     parse("bot_kill")
   end
   
   if(min == 70) then
             parse("trigger win2")
     level = 11
     parse("bot_kill")
   end
   
   if(bot < 10) then
     parse("bot_add_t")
     parse("bot_add_t")
     bot = bot + 2
   end
end

addhook("spawn", "pentagon")
function pentagon(id)
if player(id,"team") == 1 then
  if(level == 1) then 
     local c=math.random(1,5)
           
           if c==1 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 90")   
           elseif c==2 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 80")   
           elseif c==3 then
                    parse("speedmod "..id.." -17")
                    parse("setmaxhealth "..id.." 250")   
           elseif c==4 then
                    parse("speedmod "..id.." -12")
                    parse("setmaxhealth "..id.." 100")   
           elseif c==5 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 120")   
           end
  elseif(level == 2)then
       parse("equip "..id.." 58")
       local c=math.random(1,5)
           if c==1 and boss2 < 1 then
                    parse("equip "..id.." 83")
                    parse("equip "..id.." 85")
                    parse("setweapon "..id.." 85")
                    parse("speedmod "..id.." -1")
                    parse("setmaxhealth "..id.." 50")    
                    boss[id] = 1
                    boss2 = 20000
                    skill = 30
                     msg2(0,"©255000000 Boss Zombie")
           elseif c==1 then
                    parse("speedmod "..id.." -11")
                    parse("setmaxhealth "..id.." 250")   
           elseif c==2 then
                    parse("speedmod "..id.." -12")
                    parse("setmaxhealth "..id.." 80")   
           elseif c==3 then
                    parse("speedmod "..id.." -13")
                    parse("setmaxhealth "..id.." 130")   
           elseif c==4 then
                    parse("speedmod "..id.." -12")
                    parse("setmaxhealth "..id.." 130")   
           elseif c==5 then
                    parse("speedmod "..id.." -11")
                    parse("setmaxhealth "..id.." 120")   

           end   
  elseif(level == 3)then
     local c=math.random(1,5)
           parse("equip "..id.." 79")
           if c==1 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 140")   
           elseif c==2 then
                    parse("speedmod "..id.." -11")
                    parse("setmaxhealth "..id.." 150")   
           elseif c==3 then
                    parse("speedmod "..id.." -11")
                    parse("setmaxhealth "..id.." 180")   
           elseif c==4 then
                    parse("speedmod "..id.." -12")
                    parse("setmaxhealth "..id.." 150")   
           elseif c==5 then
                    parse("speedmod "..id.." -11")
                    parse("setmaxhealth "..id.." 200")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")

           end   
  elseif(level == 4)then
     parse("speedmod "..id.." -11")
           parse("equip "..id.." 79")
      local c=math.random(1,5)
           if c==1 then
                    parse("setmaxhealth "..id.." 190")   
           elseif c==2 then
                    parse("setmaxhealth "..id.." 200")   
           elseif c==3 then
                    parse("setmaxhealth "..id.." 180")   
           elseif c==4 then
                    parse("setmaxhealth "..id.." 210")   
           elseif c==5 then
                    parse("speedmod "..id.." -8")
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")

           end   
  elseif(level == 5)then
      local c=math.random(1,5)
      if c==1 and boss2 < 1 then
                    parse("equip "..id.." 85")
                    parse("setweapon "..id.." 85")
                    parse("equip "..id.." 83")
                    parse("equip "..id.." 69")
                    parse("equip "..id.." 73")
                    parse("speedmod "..id.." -1")
                    parse("setmaxhealth "..id.." 250")    
                    boss[id] = 1
                    boss2 = 20000
                    skill = 30
                     msg2(0,"©255000000 BOSS zombie.")
      elseif c==1 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 80")   
                         parse("equip "..id.." 82")
           elseif c==2 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 90")   
                         parse("equip "..id.." 82")
           elseif c==3 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 80")   
                         parse("equip "..id.." 82")
           elseif c==4 then
                    parse("speedmod "..id.." -10")
                    parse("setmaxhealth "..id.." 85")   
                         parse("equip "..id.." 82")
           elseif c==5 then
                    parse("speedmod "..id.." -8")
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")
           end         
  elseif(level == 6)then
     parse("speedmod "..id.." -10")
          parse("equip "..id.." 82")
     local c=math.random(1,10)
     if c==1 then
                    parse("setmaxhealth "..id.." 90")   
                    parse("equip "..id.." 72") 
           elseif c==2 then
                    parse("setmaxhealth "..id.." 100")   
           elseif c==3 then
                    parse("setmaxhealth "..id.." 90")   
                    parse("equip "..id.." 73") 
           elseif c==4 then
                    parse("setmaxhealth "..id.." 250")   
                    msg2(0,"©255000000 mini BOSS zombie.")
           elseif c==5 then
                    parse("setmaxhealth "..id.." 90")   
           elseif c==6 then
                    parse("setmaxhealth "..id.." 90")   
                    parse("equip "..id.." 51") 
           elseif c==7 then
                    parse("setmaxhealth "..id.." 90")   
           elseif c==8 then
                    parse("equip "..id.." 51") 
                    parse("setmaxhealth "..id.." 95")   
           elseif c==9 then
                    parse("setmaxhealth "..id.." 100")   
           elseif c==10 then
                                        parse("speedmod "..id.." -7")
                    parse("setmaxhealth "..id.." 200")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")  
           end   
  elseif(level == 7)then
     parse("speedmod "..id.." -9")
     parse("equip "..id.." 51") 
     parse("setmaxhealth "..id.." 110") 
     parse("equip "..id.." 82")
  elseif(level == 8)then
     local c=math.random(1,5)
     if c==1 and boss2 < 1 then
                    parse("equip "..id.." 85")
                    parse("setweapon "..id.." 85")
                    parse("equip "..id.." 83")
                    parse("speedmod "..id.." -1")
                    parse("setmaxhealth "..id.." 250")    
                    boss[id] = 1
                    boss2 = 20000
                    skill = 30
                     msg2(0,"©255000000 BOSS zombie.")
      elseif c==1 then
                    parse("speedmod "..id.." -8")
                    parse("setmaxhealth "..id.." 90")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 51") 
           elseif c==2 then
                    parse("speedmod "..id.." -8")
                    parse("setmaxhealth "..id.." 90")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 51") 
           elseif c==3 then
                    parse("speedmod "..id.." -7")
                    parse("setmaxhealth "..id.." 90")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 73") 
           elseif c==4 then
                    parse("speedmod "..id.." -6")
                    parse("setmaxhealth "..id.." 90")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 72") 
           elseif c==5 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")   
           end   
  elseif(level == 9)then
     parse("speedmod "..id.." -6")
          parse("equip "..id.." 81")
          parse("equip "..id.." 81")
     local c=math.random(1,10)
     if c==1 then
                    parse("setmaxhealth "..id.." 110")   
                    parse("equip "..id.." 73") 
           elseif c==2 then
                    parse("setmaxhealth "..id.." 110")  
                    parse("equip "..id.." 73")  
           elseif c==3 then
                    parse("setmaxhealth "..id.." 120")   
           elseif c==4 then
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 69")
                    parse("equip "..id.." 73")
                    parse("speedmod "..id.." -7")
                    msg2(0,"©255000000 mini BOSS zombie.")
           elseif c==5 then
                    parse("setmaxhealth "..id.." 140")   
                    parse("equip "..id.." 51") 
           elseif c==6 then
                    parse("setmaxhealth "..id.." 110")   
                    parse("equip "..id.." 51") 
           elseif c==7 then
                    parse("setmaxhealth "..id.." 110")   
                    parse("equip "..id.." 51") 
           elseif c==8 then
                    parse("setmaxhealth "..id.." 90")   
                    parse("equip "..id.." 72") 
           elseif c==9 then
                    parse("setmaxhealth "..id.." 90")   
                    parse("equip "..id.." 72") 
           elseif c==10 then
                                        parse("speedmod "..id.." -4")
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")   
           end   
  elseif(level == 10)then
         local c=math.random(1,6)
     if c==1 and boss2 < 1 then
                    parse("equip "..id.." 85")
                    parse("setweapon "..id.." 85")
                    parse("equip "..id.." 83")
                    parse("equip "..id.." 69")
                    parse("equip "..id.." 73")
                                        parse("equip "..id.." 85")
                    parse("speedmod "..id.." -1")
                    parse("setmaxhealth "..id.." 250")    
                    boss[id] = 1
                    boss2 = 20000
                    skill = 30
                     msg2(0,"©255000000 BOSS zombie.")
      elseif c==1 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 140")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 51") 
           elseif c==2 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 150")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 51") 
           elseif c==3 then
                    parse("speedmod "..id.." -4")
                    parse("setmaxhealth "..id.." 100")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 51") 
           elseif c==4 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 150")   
                         parse("equip "..id.." 81")
                    parse("equip "..id.." 73") 
           elseif c==5 then
parse("speedmod "..id.." -3")
                    parse("setmaxhealth "..id.." 250")   
                    parse("equip "..id.." 84") 
                    msg2(0,"©255000000 Ghost zombie.")   
           elseif c==6 then
                    parse("speedmod "..id.." -7")
                    parse("setmaxhealth "..id.." 250")   
                    msg2(0,"©255000000 mini BOSS zombie.")
                         parse("equip "..id.." 81")
                        parse("equip "..id.." 73")
           end   
  elseif(level == 11)then
         local c=math.random(1,6)
     if c==1 and boss2 < 1 then
                    parse("equip "..id.." 85")
                    parse("setweapon "..id.." 85")
                    parse("equip "..id.." 83")
                    parse("equip "..id.." 69")
                    parse("equip "..id.." 73")
                                        parse("equip "..id.." 85")
                    parse("speedmod "..id.." -0")
                    parse("setmaxhealth "..id.." 250")    
                    boss[id] = 1
                    boss2 = 20000
                    skill = 30
                     msg2(0,"©255000000 Tank BOSS zombie.")
      elseif c==1 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 210")  
                    parse("equip "..id.." 51") 
                         parse("equip "..id.." 81")
           elseif c==2 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 220")   
                         parse("equip "..id.." 81")
           elseif c==3 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 230")   
                         parse("equip "..id.." 81")
           elseif c==4 then
                    parse("speedmod "..id.." -5")
                    parse("setmaxhealth "..id.." 220")   
                         parse("equip "..id.." 81")
           elseif c==5 then
                    parse("speedmod "..id.." -6")
                    parse("setmaxhealth "..id.." 240")   
                         parse("equip "..id.." 81")
           elseif c==6 then
                    parse("speedmod "..id.." -7")
                    parse("setmaxhealth "..id.." 250")   
                    msg2(0,"©255000000 mini BOSS zombie.")
                         parse("equip "..id.." 73")
                         parse("equip "..id.." 81")
           end   
  end
end
if player(id,"team") == 2 then
parse("setmaxhealth "..id.." 100")
parse("setmoney "..id.." 800")
parse("speedmod "..id.." 1")
end

end



function sh_explosion(id,dmg,x,y)
	parse('explosion '..x..' '..y..' '..dmg..' '..dmg..' '..id)
end

function sh_diablo(id,x,y)
	sh_msg(3,player(id,"name")..' Used Evil Wrath!')
	sh_explosion(id,135,x,y)
	sh_explosion(id,195,x + 120,y + 120)
	sh_explosion(id,195,x + 120,y - 120)
	sh_explosion(id,195,x - 120,y - 120)
	sh_explosion(id,195,x - 120,y + 120)
	sh_explosion(id,195,x,y + 120)
	sh_explosion(id,195,x,y - 120)
	sh_explosion(id,195,x - 120,y)
	sh_explosion(id,195,x + 120,y)
end

addhook("second", "uk")

function uk()
    if (sc > 0 and uu == 0 ) then
                if (sc > 0) then
				
	        end
			sc = sc - 1
		elseif (sc == 0) then
			sc = sc - 1    
                        uu = 1
                        sc = 20
    end
    if (sc2 > 0 and uuuu == 0) then
                if (sc2 > 0) then
				
	        end
			sc2 = sc2 - 1
		elseif (sc2 == 0) then
			sc2 = sc2 - 1    
                        uuuu = 1
                        sc2 = 20
    end
    if (sc3 > 0 and uuuuuuu == 0) then
                if (sc3 > 0) then
				
	        end
			sc3 = sc3 - 1
		elseif (sc3 == 0) then
			sc3 = sc3 - 1    
                        uuuuuuu = 1
                        sc3 = 20
    end    
    if (sc4 > 0 and uuuuuuuu == 0) then
                if (sc4 > 0) then
				
	        end
			sc4 = sc4 - 1
		elseif (sc4 == 0) then
			sc4 = sc4 - 1    
                        uuuuuuuu = 1
                        sc4 = 30
    end






local xx

  for id=1,32 do
    if(player(id,"team") == 2)then
         if player(id,"exists") then
            if(level < 5)then
            parse("sethealth "..id.." "..player(id,"health")+15)
            end
         end
    end


    if (boss[id] == 1) then
                if player(id,"exists") then
                if(skill>0) then
                  if(level == 2)then
                    skill = skill - 1
                    if(skill==5) then
                    parse("speedmod "..id.." 10")
                    end
                    if(skill==4) then
                    msg2(0,"©255255255 BOSS SKILL!!!!!!!!!!")
                    parse("speedmod "..id.." -100")
                    end
                    if(skill==3) then
                    xx = 35
                    parse("equip "..id.." 73")
                    sh_explosion(id,100,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,30,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,30,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==2) then
                    xx = 55
                    parse("equip "..id.." 73")
                    sh_explosion(id,30,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,30,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,30,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==1) then
                    xx = 75
                    parse("equip "..id.." 73")
                    sh_explosion(id,30,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,30,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,30,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,30,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,30,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==0) then
                    parse("setweapon "..id.." 85")
                    parse("speedmod "..id.." -1")
                    skill = 30
                    end
                 end
                    if(level == 5)then
                         parse("sethealth "..id.." "..player(id,"health")+10)
                         skill = skill - 1
                    if(skill==6) then
                    parse("speedmod "..id.." 10")
                    end
                    if(skill==5) then
                    msg2(0,"©255255255 BOSS SKILL!!!!!!!!!!")
                    parse("speedmod "..id.." -100")
                    end
                    if(skill==4) then
                    xx = 35
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,40,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==3) then
                    xx = 55
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,40,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==2) then
                    xx = 75
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,40,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==1) then
                    xx = 95
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,40,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,40,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,40,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,40,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==0) then
                    parse("speedmod "..id.." -1")
                    skill = 30
                    end
                 end
                    if(level == 8)then
                         parse("sethealth "..id.." "..player(id,"health")+20)
skill = skill - 1
                    if(skill==7) then
                    parse("speedmod "..id.." 10")
                    end
                    if(skill==6) then
                    msg2(0,"©255255255 BOSS SKILL!!!!!!!!!!")
                    parse("speedmod "..id.." -100")
                    end
                    if(skill==5) then
                    xx = 35
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==4) then
                    xx = 55
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==3) then
                    xx = 75
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==2) then
                    xx = 95
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==1) then
                    xx = 115
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==0) then
                    parse("speedmod "..id.." -1")
                    skill = 30
                    end
                 end
                   if(level == 10)then
                         parse("sethealth "..id.." "..player(id,"health")+25)
skill = skill - 1
                    
                    if(skill==8) then
                    parse("speedmod "..id.." 10")
                    end
                    if(skill==7) then
                    msg2(0,"©255255255 BOSS SKILL!!!!!!!!!!")
                    parse("speedmod "..id.." -100")
                    end
                    if(skill==6) then
                    xx = 150
                    parse("equip "..id.." 73")
                    sh_explosion(id,80,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,80,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,80,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,80,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,80,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==5) then
                    xx = 35
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==4) then
                    parse("equip "..id.." 73")
                    xx = 55
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==3) then
                    xx = 75
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==2) then
                    xx = 95
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==1) then
                    xx = 105
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==0) then
                    parse("speedmod "..id.." -1")
                    skill = 30
                    end
                  end
                    if(level == 11)then
                         parse("sethealth "..id.." "..player(id,"health")+40)
                        skill = skill - 1
                    if(skill==8) then
                    parse("speedmod "..id.." 10")
                    end
                    if(skill==7) then
                    msg2(0,"©255255255 BOSS SKILL!!!!!!!!!!")
                    end
                    if(skill==6) then
                    xx = 75
                    parse("equip "..id.." 73")
                    sh_explosion(id,80,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,80,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,80,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,80,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,80,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,80,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==5) then
                    xx = 35
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==4) then
                    xx = 45
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==3) then
                    xx = 55
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==2) then
                    xx = 65
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==1) then
                    xx = 75
                    parse("equip "..id.." 73")
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") + xx)
                    sh_explosion(id,50,player(id,"x") + xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") + xx)
	sh_explosion(id,50,player(id,"x"),player(id,"y") - xx)
	sh_explosion(id,50,player(id,"x") - xx,player(id,"y"))
	sh_explosion(id,50,player(id,"x") + xx,player(id,"y"))
                    end
                    if(skill==0) then
                    parse("speedmod "..id.." 0")
                    skill = 30
                    end
                  end
               end
          end
    end
    if(boss2 > 0)then
         if (boss2 > 0) then
				
	        end
			boss2 = boss2 - 1
    end
  end
  local i
  for i = 1, 32 do
  if(time[i] > 0 and player(i,"team")==1)then
         if (time[i] > 0 and player(i,"team")==1) then
				
	        end
			time[i] = time[i] - 1
         if (time[i] == 0 and player(i,"team")==1) then
                 parse("killplayer "..i)
         end
    end
    if(god[i] > 0)then
         if (god[i] > 0) then
				
	        end
			god[i] = god[i] - 1
    end
  end
end

addhook("hit","_hit")


function _hit(id)
     if god[id] > 0 then
          return 1
     end
end






function initArray2(f,v)
local cmd={}
for c=1,f do
cmd[c]=v
end
return cmd
end

upgraded=initArray2(32,false)
upgradedw=initArray2(32,0)

addhook("usebutton","packapunchp")
function packapunchp(id,x,y)
     if (x==8 and y==47) then
        if(pw == 1) then
          if (player(id,"money")>=4999) then
               parse("setmoney "..id.." "..(player(id,"money")-5000))
               upgradedw[id]=player(id,"weapon")
               upgraded[id]=true
               msg2(id,"You have upgraded your "..itemtype(upgradedw[id],"name")..".")
          else
               msg2(id,"You need 5000 money to upgrade, "..player(id,"name").."!")
          end
        else
          msg("you need to find and open power!!")
        end
     end
     if (x==47 and y==81) then
        if(pw == 1) then
          if (player(id,"money")>=4999) then
               parse("setmoney "..id.." "..(player(id,"money")-5000))
               upgradedw[id]=player(id,"weapon")
               upgraded[id]=true
               msg2(id,"You have upgraded your "..itemtype(upgradedw[id],"name")..".")
          else
               msg2(id,"You need 5000 money to upgrade, "..player(id,"name").."!")
          end
        else
          msg("you need to find and open power!!")
        end
     end
end




wn={}


wn.weapon_names={
                      ["1"]="USP-v2",
                      ["2"]="Glock-v2",
["3"]="White-killer",
["4"]="P228-v2",
["5"]="Elite-v2",
["6"]="Five-Seven-v2",
["10"]="Striker",
["11"]="Guerrilla",
["20"]="Charger",
["21"]="Speeder",
["22"]="P90-DG2",
["23"]="Mac10-x2",
["24"]="Supporters",
["30"]="Kill-God",
["31"]="Sniper",
["32"]="Hider",
["33"]="Police-Sniper",
["34"]="Spiker",
["35"]="Spike-master",
["36"]="Backuper",
["37"]="Fire-Dragon",
["38"]="Rapidlyer",
["39"]="Ranger",
["40"]="rager",
["45"]="DG-X2",
["46"]="Fire-killer",
["47"]="Rocket-X2",
["48"]="RPG-v2",
["49"]="Grenade-x2",
["51"]="HE-V2",
["69"]="Knife-Master",
["72"]="Gas-room",
["73"]="Fire-Place",
["74"]="Wrench-v2",
["75"]="Snowball-v2",
["76"]="Hell-Fire",
["77"]="Trap-Master",
["78"]="Zombie-Hand",
["87"]="Laser-X2",
["85"]="Keep-killer",
["86"]="infect-Master",
["90"]="Heavy",
["91"]="Speeder"
               }

addhook("hit","packapunchh")
function packapunchh(id,src,w,hp,ap)
     if (upgraded[src]) then
          if (w==upgradedw[src]) then
             if(player(id,"team") == 1) then

               if(player(id,"health")-(hp*1.5) > 0)then
               parse("sethealth "..id.." "..(player(id,"health")-(hp*1.5)))
               end

               if(player(id,"health")-(hp*2) > 0)then
               parse("sethealth "..id.." "..(player(id,"health")-(hp*2)))
               end
               
               if(player(id,"health")-(hp*3) > 0)then
               parse("sethealth "..id.." "..(player(id,"health")-(hp*3)))
               end
              
               if(player(id,"health")-(hp*4) > 0)then
               parse("sethealth "..id.." "..(player(id,"health")-(hp*4)))
               end

                    parse("setarmor "..id.." "..(player(id,"armor")-(ap*4)))
               if(player(id,"health")-hp<= 0) then
                  if wn.weapon_names[tostring(w)]~=nil then
                  parse("customkill "..src.." "..wn.weapon_names[tostring(w)].." "..id.."")
                  return 1
                  end

               
               end
             end
          end
     end
end

addhook("die","packapunchf")
function packapunchf(id)


     if (upgraded[id]) then
          upgraded[id]=false
          upgradedw[id]=0
     end
end


addhook("use","gunbuy")
function gunbuy(id,event,data,x,y)
     if (x == 27 and y == 23) then
          menu(id,"mp5 Menu,Buy|600 Pts.")
     end
     if (x == 31 and y == 9) then
          menu(id,"scout Menu,Buy|800 Pts.")
     end
     if (x == 20 and y == 14) then
          menu(id,"m4a1 Menu,Buy|1000 Pts.")
     end
     if (x == 35 and y == 18) then
          menu(id,"p90 Menu,Buy|700 Pts.")
     end
     if (x == 35 and y == 28) then
          if (player(id,"money")>949) then
               parse("setmoney "..id.." "..(player(id,"money") - 950))
               local c=math.random(1,20)
               if c==1 then
                    parse("equip "..id.." 33")
               elseif c==2 then
                    
                    parse("equip "..id.." 23")
               elseif c==3 then
                    
                    parse("equip "..id.." 24")
               elseif c==4 then
                    
                    parse("equip "..id.." 34")
               elseif c==5 then
                    
                    parse("equip "..id.." 20")
               elseif c==6 then
                    
                    parse("equip "..id.." 21")
               elseif c==7 then
                    
                    parse("equip "..id.." 37")
               elseif c==8 then
                    
                    parse("equip "..id.." 45")
               elseif c==9 then
                    
                    parse("equip "..id.." 48")
               elseif c==10 then
                    
                    parse("equip "..id.." 3")
               elseif c==11 then
                    
                    parse("equip "..id.." 49")
               elseif c==12 then
                    
                    parse("equip "..id.." 30")
               elseif c==13 then
                    
                    parse("equip "..id.." 38")
               elseif c==14 then
                    
                    parse("equip "..id.." 11")
               elseif c==15 then
                    
                    parse("equip "..id.." 39")
               elseif c==16 then
                    
                    parse("equip "..id.." 32")
               elseif c==17 then
                    
                    parse("equip "..id.." 22")
               elseif c==18 then
                    
                    parse("equip "..id.." 31")
               elseif c==19 then
                    
                    parse("equip "..id.." 10")
               elseif c==20 then
                    
                    parse("equip "..id.." 35") 
              
               end
          else
              msg2(id,"You Not have enough money, "..player(id,"name").."!")
          end
     end
     if (x == 26 and y == 15) then
          if (player(id,"money")>949) then
               parse("setmoney "..id.." "..(player(id,"money") - 950))
               local c=math.random(1,20)
               if c==1 then
                    parse("equip "..id.." 33")
               elseif c==2 then
                    
                    parse("equip "..id.." 23")
               elseif c==3 then
                    
                    parse("equip "..id.." 24")
               elseif c==4 then
                    
                    parse("equip "..id.." 34")
               elseif c==5 then
                    
                    parse("equip "..id.." 20")
               elseif c==6 then
                    
                    parse("equip "..id.." 21")
               elseif c==7 then
                    
                    parse("equip "..id.." 37")
               elseif c==8 then
                    
                    parse("equip "..id.." 45")
               elseif c==9 then
                    
                    parse("equip "..id.." 48")
               elseif c==10 then
                    
                    parse("equip "..id.." 3")
               elseif c==11 then
                    
                    parse("equip "..id.." 49")
               elseif c==12 then
                    
                    parse("equip "..id.." 30")
               elseif c==13 then
                    
                    parse("equip "..id.." 38")
               elseif c==14 then
                    
                    parse("equip "..id.." 11")
               elseif c==15 then
                    
                    parse("equip "..id.." 39")
               elseif c==16 then
                    
                    parse("equip "..id.." 32")
               elseif c==17 then
                    
                    parse("equip "..id.." 22")
               elseif c==18 then
                    
                    parse("equip "..id.." 31")
               elseif c==19 then
                    
                    parse("equip "..id.." 10")
               elseif c==20 then
                    
                    parse("equip "..id.." 35") 
              
               end
          else
              msg2(id,"You Not have enough money, "..player(id,"name").."!")
          end
     end
          if (x == 11 and y == 45) then
          if (player(id,"money")>949) then
               parse("setmoney "..id.." "..(player(id,"money") - 950))
               local c=math.random(1,20)
               if c==1 then
                    parse("equip "..id.." 33")
               elseif c==2 then
                    
                    parse("equip "..id.." 23")
               elseif c==3 then
                    
                    parse("equip "..id.." 24")
               elseif c==4 then
                    
                    parse("equip "..id.." 34")
               elseif c==5 then
                    
                    parse("equip "..id.." 20")
               elseif c==6 then
                    
                    parse("equip "..id.." 21")
               elseif c==7 then
                    
                    parse("equip "..id.." 37")
               elseif c==8 then
                    
                    parse("equip "..id.." 45")
               elseif c==9 then
                    
                    parse("equip "..id.." 48")
               elseif c==10 then
                    
                    parse("equip "..id.." 3")
               elseif c==11 then
                    
                    parse("equip "..id.." 49")
               elseif c==12 then
                    
                    parse("equip "..id.." 30")
               elseif c==13 then
                    
                    parse("equip "..id.." 38")
               elseif c==14 then
                    
                    parse("equip "..id.." 11")
               elseif c==15 then
                    
                    parse("equip "..id.." 39")
               elseif c==16 then
                    
                    parse("equip "..id.." 32")
               elseif c==17 then
                    
                    parse("equip "..id.." 22")
               elseif c==18 then
                    
                    parse("equip "..id.." 31")
               elseif c==19 then
                    
                    parse("equip "..id.." 10")
               elseif c==20 then
                    
                    parse("equip "..id.." 35") 
              
               end
          else
              msg2(id,"You Not have enough money, "..player(id,"name").."!")
          end
     end
     if (x == 31 and y == 16 and u == 1) then
          local money = player(id,"money")
          if money>2999 then
               u = 0
               parse("setmoney "..id.." "..(player(id,"money") - 3000))
               parse("trigger ww1")
          else
          msg("Need 3000 money enough!!")
          end
     end
     
     if (x == 29 and y == 23 and uuu == 1) then
          local money = player(id,"money")
          if money>4999 then
               uuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 5000))
               parse("trigger ww2")
          else
          msg("Need 5000 money enough!!")
          end
     end

     if (x == 16 and y == 52 and uuu1 == 1) then
          local money = player(id,"money")
          if money>9999 then
               uuu1 = 0
               parse("setmoney "..id.." "..(player(id,"money") - 10000))
               parse("trigger ww5")
          else
          msg("Need 10000 money enough!!")
          end
     end

     if (x == 25 and y == 32 and uuuuu == 1) then
          local money = player(id,"money")
          if money>4999 then
               uuuuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 5000))
               parse("trigger ww3")
          else
          msg("Need 5000 money enough!!")
          end
     end

     if (x == 22 and y == 44 and uuuuuu == 1) then
          local money = player(id,"money")
          if money>6999 then
               uuuuuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 7000))
               parse("trigger ww4")
          else
          msg("Need 7000 money enough!!")
          end
     end

     if (x == 34 and y == 21 and uu == 1) then
          local money = player(id,"money")
        if(pw == 1)then
          if money>1499 then
               uu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 1500))
               parse("trigger k1")
               parse("trigger kk1")
          else
          msg("Need 1500 money enough!!")
          end
        else
          msg("you need to find and open power!!")
        end
     end
     if (x == 38 and y == 32 and uuuu == 1) then
          local money = player(id,"money")
        if(pw == 1) then
          if money>1499 then
               uuuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 1500))
               parse("trigger k2")
               parse("trigger kk2")
          else
          msg("Need 1500 money enough!!")
          end
        else
          msg("you need to find and open power!!")
        end
     end

     if (x == 12 and y == 39 and uuuuuuu == 1) then
          local money = player(id,"money")
        if(pw == 1) then
          if money>1499 then
               uuuuuuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 1500))
               parse("trigger k3")
               parse("trigger kk3")
          else
          msg("Need 1500 money enough!!")
          end
        else
          msg("you need to find and open power!!")
        end
     end

     if (x == 28 and y == 27 and uuuuuuuu == 1) then
          local money = player(id,"money")
        if(pw == 1) then
          if money>4999 then
               uuuuuuuu = 0
               parse("setmoney "..id.." "..(player(id,"money") - 5000))
               parse("trigger k4")
               parse("trigger kk4")
          else
          msg("Need 5000 money enough!!")
          end
        else
          msg("you need to find and open power!!")
        end
     end

     if (x == 23 and y == 32) then
          menu(id,"mine Menu,Buy|250 Pts.")
     end
     if (x == 25 and y == 27) then
          menu(id,"wrench Menu,Buy|2000 Pts.")
     end
     if (x == 37 and y == 32) then
          menu(id,"Flamethrower Menu,Buy|1500 Pts.")
     end
     if (x == 35 and y == 32) then
          menu(id,"RPG Menu,Buy|2000 Pts.")
     end
     if (x == 20 and y == 57 and pw == 0) then
          pw = 1
          msg("POWER OPEN!!!!!!!!")
     end

     if (x == 25 and y == 44) then
          menu(id,"fnf2000 Menu,Buy|2000 Pts.")
     end
     if (x == 27 and y == 44) then
          menu(id,"super armor Menu,Buy|5000 Pts.")
     end
     if (x == 29 and y == 44) then
          menu(id,"m249 Menu,Buy|3000 Pts.")
     end
     if (x == 32 and y == 43) then
        if(pw == 1) then
          if (player(id,"money")>4999) then
               if (player(id,"speedmod") < 22) then
               parse("setmoney "..id.." "..(player(id,"money") -  5000))
               parse("speedmod "..id.." "..(player(id,"speedmod") +  7))
               msg2(0,"©000255000"..player(id,"name").." buy speed cola~")
               msg2(id,"©000255000You buy the speed cola, "..player(id,"name").."~~")
               msg2(id,"©000255000Your speed is, "..player(id,"speedmod").." max speed is 22")
               else
                 msg2(id,"You already having max speed, "..player(id,"name").."!!")
               end
          else
               msg2(id,"You need 5000 money to buy speed cola, "..player(id,"name").."!")
          end
        else

          msg("you need to find and open power!!")
        end
     end


     if (x == 47 and y == 87) then
        if(pw == 1) then
          if (player(id,"money")>4999) then
               if (player(id,"speedmod") < 22) then
               parse("setmoney "..id.." "..(player(id,"money") -  5000))
               parse("speedmod "..id.." "..(player(id,"speedmod") +  7))
               msg2(0,"©000255000"..player(id,"name").." buy speed cola~")
               msg2(id,"©000255000You buy the speed cola, "..player(id,"name").."~~")
               msg2(id,"©000255000Your speed is, "..player(id,"speedmod").." max speed is 22")
               else
                 msg2(id,"You already having max speed, "..player(id,"name").."!!")
               end
          else
               msg2(id,"You need 5000 money to buy speed cola, "..player(id,"name").."!")
          end
        else

          msg("you need to find and open power!!")
        end
     end

     if (x == 34 and y == 10) then
        if(pw == 1) then
          if (player(id,"money")>4999) then
               if (player(id,"maxhealth") < 250) then
               parse("setmoney "..id.." "..(player(id,"money") -  5000))
               parse("setmaxhealth "..id.." "..(player(id,"maxhealth") +  30))
               msg2(0,"©000255000"..player(id,"name").." buy health cola~")
               msg2(id,"©000255000You buy the health cola, "..player(id,"name").."~~")
               msg2(id,"©000255000Your health  is, "..player(id,"maxhealth").." max health is 250")
               else
                 msg2(id,"You already having max health, "..player(id,"name").."!!")
               end
          else
               msg2(id,"You need 5000 money to buy health cola, "..player(id,"name").."!")
          end
        else

          msg("you need to find and open power!!")
        end
     end
end

addhook("menu","gunbuymenu")
function gunbuymenu(id,title,key)
if (title == "mp5 Menu") then
if (key == 1) then
local money = player(id,"money")
if money>599 then
parse("setmoney "..id.." "..(player(id,"money") - 600))

parse("equip "..id.." 20")
end
end
end


if (title == "scout Menu") then
if (key == 1) then
local money = player(id,"money")
if money>799 then
parse("setmoney "..id.." "..(player(id,"money") - 800))

parse("equip "..id.." 34")
end
end
end

if (title == "p90 Menu") then
if (key == 1) then
local money = player(id,"money")
if money>699 then
parse("setmoney "..id.." "..(player(id,"money") - 700))

parse("equip "..id.." 22")
end
end
end


if (title == "m4a1 Menu") then
if (key == 1) then
local money = player(id,"money")
if money>999 then
parse("setmoney "..id.." "..(player(id,"money") - 1000))

parse("equip "..id.." 32")
end
end
end




if (title == "mine Menu") then
if (key == 1) then
local money = player(id,"money")
if money>249 then
parse("setmoney "..id.." "..(player(id,"money") - 250))

parse("equip "..id.." 77")
end
end
end
if (title == "wrench Menu") then
if (key == 1) then
local money = player(id,"money")
if money>1999 then
parse("setmoney "..id.." "..(player(id,"money") - 2000))

parse("equip "..id.." 74")
end
end
end
if (title == "Flamethrower Menu") then
if (key == 1) then
local money = player(id,"money")
if money>1499 then
parse("setmoney "..id.." "..(player(id,"money") - 1500))

parse("equip "..id.." 46")
end
end
end
if (title == "RPG Menu") then
if (key == 1) then
local money = player(id,"money")
if money>1999 then
parse("setmoney "..id.." "..(player(id,"money") - 2000))

parse("equip "..id.." 47")
end
end
end

if (title == "wrench Menu") then
if (key == 1) then
local money = player(id,"money")
if money>1999 then
parse("setmoney "..id.." "..(player(id,"money") - 2000))

parse("equip "..id.." 74")
end
end
end


if (title == "fnf2000 Menu") then
if (key == 1) then
local money = player(id,"money")
if money>1999 then
parse("setmoney "..id.." "..(player(id,"money") - 2000))

parse("equip "..id.." 91")
end
end
end
if (title == "super armor Menu") then
if (key == 1) then
local money = player(id,"money")
if money>2999 then
parse("setmoney "..id.." "..(player(id,"money") - 3000))

parse("equip "..id.." 83")
end
end
end

if (title == "m249 Menu") then
if (key == 1) then
local money = player(id,"money")
if money>2999 then
parse("setmoney "..id.." "..(player(id,"money") - 3000))

parse("equip "..id.." 40")
end
end
end
end


addhook("kill","no_money")
function no_money(id)
parse("setmoney "..id.." "..(player(id,"money")-130))
end