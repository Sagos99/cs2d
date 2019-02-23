if not flacko then flacko={} end
flacko.sjam={}

ball = 75
knife = 50

function hudtext2(id,tid,color,txt,x,y)
     local toprint = ("©"..color.." "..txt)
     parse('hudtxt2 '..id..' '..tid..' "'..toprint..'" '..x.." "..y)
end

addhook("spawn","flacko.sjam.spawn")
function flacko.sjam.spawn(id)
     flacko.sjam.updatehud(id)
     return "x"
end

function flacko.sjam.updatehud(id)
     if(player(id,"exists")) then
          hudtext2(id,1,"255000000",flacko.sjam.tscore,13,179)
          hudtext2(id,2,"000128255",flacko.sjam.ctscore,13,194)
          hudtext2(id,3,"255255000","-",320,20)
          if(flacko.sjam.playerwball>0 and flacko.sjam.ballinair==false) then
               if(player(flacko.sjam.playerwball,"exists"))then
                    hudtext2(id,4,"255255000",player(flacko.sjam.playerwball,"name"),13,209)
               else
                    hudtext2(id,4,"255255000","",13,209)
               end
          else
               hudtext2(id,4,"255000000","No one's got the ball...",13,209)
          end
     end
end

addhook("die","flacko.sjam.die")
function flacko.sjam.die(victim,killer,weapon,x,y)
     if(flacko.sjam.playerwball == victim) then
          parse("spawnitem "..ball.." "..pixtotile(x).." "..pixtotile(y))
          flacko.sjam.playerwball = 0
     end
     return 1
end

addhook("leave","flacko.sjam.leave")
function flacko.sjam.leave(id)
     local xplayer = player(id,"xtile")
     local yplayer = player(id,"ytile")
     if(flacko.sjam.playerwball==id) then
          parse("spawnitem "..ball.." "..xplayer.." "..yplayer)
          flacko.sjam.playerwball = 0
     end
end

addhook("buy","flacko.sjam.buy")
function flacko.sjam.buy()
     return 1
end

addhook("drop","flacko.sjam.drop")
function flacko.sjam.drop(id)
     if(flacko.sjam.ballinair==false) then
          flacko.sjam.playerwball = 0
          flacko.sjam.ballinair = false
     else
          return 1
     end
end

addhook("startround","flacko.sjam.startround")
function flacko.sjam.startround()
     flacko.sjam.playerwball = 0
     parse("spawnitem "..ball.." 17 13")
end

addhook("minute","flacko.sjam.minute")
function flacko.sjam.minute()
     if(flacko.sjam.playerwball==0) then
          tab = item(0,"table")
          if(#tab==0) then
               parse("spawnitem "..ball.." 17 13")
          end
     end
end

function pixtotile(pix)
     ret = math.floor(pix/32)
     return ret
end
function tiletopix(til)
     ret = til*32
     return ret
end

function flacko.sjam.checkwep(id,wep) --Returns 0 if finds weapon, otherwise it returns 1
     local weapons = playerweapons(id)
     for i = 1, #weapons do
          if weapons[i] == wep then
               return 0
          end
     end
     return 1
end

flacko.sjam.ctscore = 0
flacko.sjam.tscore = 0
flacko.sjam.playerwball = 0
flacko.sjam.ballinair = false

addhook("collect","flacko.sjam.collect")
function flacko.sjam.collect(id,iid,typ)
     if(typ==ball and flacko.sjam.playerwball == 0) then
          giveball(id)
     else
          return 1
     end
end

addhook("walkover","flacko.sjam.walkover")
function flacko.sjam.walkover(id,iid,typ)
     if(typ~=ball or flacko.sjam.playerwball~=0)then
          return 1
     end
end

function giveball(id)
     parse("equip "..id.." "..ball)
     parse("setweapon "..id.." "..ball)
     parse("strip "..id.." "..knife)
     flacko.sjam.playerwball = id
     for i=1,32 do
          if(player(i,"exists")) then
               flacko.sjam.updatehud(i)
          end
     end
     flacko.sjam.ballinair = false
end

function stripball(id)
     parse("equip "..id.." "..knife)
     parse("strip "..id.." "..ball)
     flacko.sjam.playerwball = 0
end

addhook("hit","flacko.sjam.hit")
function flacko.sjam.hit(id,src,wep)
     if(wep==knife) then
          if(flacko.sjam.playerwball==id) then
               if(flacko.sjam.ballinair==false) then
                    stripball(id)
                    giveball(src)
               end
          end
     elseif(wep==ball) then
          if(flacko.sjam.playerwball==src) then
               if(flacko.sjam.ballinair==false) then
                    stripball(src)
                    giveball(id)
               end
          end
     end
     return 1
end


function check_boundbox(id,x,tx,y,ty,ptx,pty)
     if(ptx<player(id,"x")) then --If moves to left
          if(ptx<tx) then --If enters bounding box
               parse("setpos "..id.." "..(player(id,"x")+3.6).." "..(player(id,"y"))+3.6)
          end
     end
end

addhook("attack","flacko.sjam.attack")
function flacko.sjam.attack(id)
     if(flacko.sjam.playerwball==id) then
          if(player(id,"weapontype")==ball) then
               flacko.sjam.ballinair = true
          end
     end
end

addhook("projectile","flacko.sjam.projectile")
function flacko.sjam.projectile(id,wep,x,y)
     if(flacko.sjam.playerwball==id) then
          if(wep==ball) then
               local xplayer = player(id,"x")
               local yplayer = player(id,"y")
               if(xplayer<x) then x=x-1 elseif (xplayer>x) then x=x+1 end
               if(yplayer<y) then y=y-1 elseif (yplayer>y) then y=y+1 end
               x = pixtotile(x)
               y = pixtotile(y)
               if(y>=12 and y<=14) then
                    if(x==3) then
                         flacko.sjam.ctscore = flacko.sjam.ctscore + 1
                         parse("msg ©000128255"..player(id,"name").." Scores for CT!@C")
                         if(player(id,"team")==2) then parse("setscore "..id.." "..(player(id,"score")+1))
                         elseif(player(id,"team")==1) then parse("setscore "..id.." "..(player(id,"score")-3)) end
                    elseif(x==32) then
                         flacko.sjam.tscore = flacko.sjam.tscore + 1
                         parse("msg ©255000000"..player(id,"name").." Scores for T!@C")
                         if(player(id,"team")==2) then parse("setscore "..id.." "..(player(id,"score")-3))
                         elseif(player(id,"team")==1) then parse("setscore "..id.." "..(player(id,"score")+1)) end
                    end
               end
          parse("spawnitem "..ball.." "..x.." "..y)
          stripball(id)
          flacko.sjam.ballinair = false
          for i=1,32 do flacko.sjam.updatehud(i) end
          end
     end
end