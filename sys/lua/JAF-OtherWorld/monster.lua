jaf.monsterHP={} -- monster health
jaf.monsterIMG={} -- monster image
jaf.monsterx={} -- monster y pos
jaf.monstery={} -- monster x pos
jaf.monsterT={} -- monster target
jaf.monsterTS={} -- monster times spawn
jaf.monsterRot={} -- monster rotation
jaf.monstergetRot={}
jaf.monsterskillIMG={}
jaf.monstermovest={}
jaf.monsterFREZE={}
jaf.monsterid={}
jaf.monsterhb={}
jaf.monstergetpos={}
jaf.monsterobjid={}
jaf.monstermb={} --- monster move rot to target when face block
jaf.monsterlastpos={}
jaf.sv_monsterpos={}

------ Note/Catatan ------
--- multi = <amount> to duplicate the monster to be many
--- multi = <jumlah> untuk menduplikat monster menjadi banyak
--- dodge = <amount> more little the amount is make the monster dodged
--- droprate = {maxrange,getpoint,func=function(id,i)}
--- plcatk = (area id for monster to hunting a people)
--- speed = give more speed

jaf.listmonster={
                [1]={name="Meow Cat",
                     hp=5000,
                     rot=0,
                     img={jaf.locgfx.."item/pet_nyancat.png",1.7,color={255,255,255}}, -- loc,scale,color
                     scale={47,20},  -- x,y
                     spawntime=15,
                     slayattackdmg=10,
                     spawnpos={109,17}, --- x,y or {x1,x2},{y1,y2}
                     movearea={101,3,132,28}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+800
                          jaf.give_shell(id,700)
                          local rdimg=math.random(1,3)
                          jaf.give_item(id,110,rdimg)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..rdimg.."x "..jaf.list_items[110].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(5,400)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 17 15 255 255 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [2]={name="King Fire Demon",
                     hp=20000,
                     rot=0,
                     img={jaf.locgfx.."monster/kingdemonfire.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={140,160},  -- x,y
                     spawntime=25,
                     slayattackdmg=90,
                     spawnpos={24,111}, --- x,y or {x1,x2},{y1,y2}
                     movearea={13,102,41,125}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1000
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(5*32),(5*32)) then
                           local mdmg=math.random(100,1000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 32 255 255 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [3]={name="Zombie",
                     hp=7000,
                     rot=false,
                     img={jaf.locgfx.."monster/zombie.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={40,44},  -- x,y
                     spawntime=10,
                     slayattackdmg=80,
                     spawnpos={24,122}, --- x,y or {x1,x2},{y1,y2}
                     movearea={13,102,41,125}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+800
                          jaf.give_shell(id,800)
                          jaf.give_item(id,181,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." "..jaf.list_items[181].name..hijau,jaf.listmonster[math.floor(i)].name))
			  local rr = math.random(1,4)
			if rr==1 then
			  jaf.give_item(id,263,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[263].name..hijau,jaf.listmonster[math.floor(i)].name))
			elseif rr==4 then
			  jaf.give_item(id,264,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[264].name..hijau,jaf.listmonster[math.floor(i)].name))
			  end
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(2*32),(2*32)) then
                           local mdmg=math.random(40,500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 18 18 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [4]={name="Demon",
                     hp=20000,
                     rot=false,
                     img={jaf.locgfx.."monster/demon.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={78,37},  -- x,y
                     spawntime=25,
                     slayattackdmg=80,
                     spawnpos={122,115}, --- x,y or {x1,x2},{y1,y2}
                     movearea={108,111,137,130}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+800
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(200,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [5]={name="Crocolight",
                     hp=125000,
                     rot=0,
                     img={jaf.locgfx.."monster/crocolight.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={300,234},  -- x,y
                     spawntime=35,
                     slayattackdmg=150,
                     spawnpos={142,157}, --- x,y or {x1,x2},{y1,y2}
                     movearea={131,147,154,165}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+3000
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                         local ccidp=math.random(1,20)
                         if ccidp==5 then
                            jaf.dropitem(0,61,math.floor(x/32),math.floor(y/32))
                         elseif ccidp==7 then
                           jaf.dropitem(0,74,math.floor(x/32),math.floor(y/32))
                         end
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(200,3500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."lightning.png",jaf.monsterx[id],jaf.monstery[id],0)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              tween_move(jaf.monsterskillIMG[id],200,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 70 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(4*32),(4*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(200,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [6]={name="Red Demon",
                     hp=10000,
                     rot=0,
                     img={jaf.locgfx.."monster/red_demon.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={130,130},  -- x,y
                     spawntime=20,
                     slayattackdmg=50,
                     spawnpos={101,147}, --- x,y or {x1,x2},{y1,y2}
                     movearea={88,140,107,178}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+600
                          jaf.give_shell(id,500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(200,800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [7]={name="Ifrit",
                     hp=70000,
                     rot=0,
                     img={jaf.locgfx.."monster/ifrit.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={143,157},  -- x,y
                     spawntime=20,
                     slayattackdmg=50,
                     spawnpos={78,172}, --- x,y or {x1,x2},{y1,y2}
                     movearea={71,165,80,177}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2100
                          jaf.give_shell(id,1500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(400,3800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [8]={name="Alien",
                     hp=30000,
                     rot=0,
                     img={jaf.locgfx.."monster/alien.png",0.7,color={255,255,255}}, -- loc,scale,color
                     scale={218,231},  -- x,y
                     spawntime=35,
                     slayattackdmg=70,
                     spawnpos={64,211}, --- x,y or {x1,x2},{y1,y2}
                     movearea={55,204,79,218}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1100
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(300,1700)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 191 191 191")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [9]={name="Evil Alien",
                     hp=80000,
                     rot=0,
                     img={jaf.locgfx.."monster/evil_alien_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={120,148},  -- x,y
                     spawntime=20,
                     slayattackdmg=120,
                     spawnpos={106,210}, --- x,y or {x1,x2},{y1,y2}
                     movearea={98,205,113,215}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1500
                          jaf.give_shell(id,5000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(500,3800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 191 191 191")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [10]={name="Mantislen",
                     hp=20000,
                     rot=0,
                     img={jaf.locgfx.."monster/mantislen_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={120,135},  -- x,y
                     spawntime=10,
                     slayattackdmg=40,
                     spawnpos={191,75}, --- x,y or {x1,x2},{y1,y2}
                     movearea={182,67,202,87}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1700
                          jaf.give_shell(id,1000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(5*32),(5*32)) then
                           local mdmg=math.random(200,1200)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 15 32 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [11]={name="Ultra Celcius",
                     hp=1000000,
                     rot=0,
                     img={jaf.locgfx.."monster/celcius_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,159},  -- x,y
                     spawntime=25,
                     slayattackdmg=70,
                     spawnpos={195,208}, --- x,y or {x1,x2},{y1,y2}
                     movearea={188,203,202,213}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+9000
                          jaf.give_shell(id,3000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(600,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 40 70 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [12]={name="Fire Imp",
                     hp=5000,
                     rot=0,
                     img={jaf.locgfx.."monster/imp.png",0.7,color={255,255,255}}, -- loc,scale,color
                     scale={134,134},  -- x,y
                     spawntime=10,
                     slayattackdmg=20,
                     spawnpos={120,26}, --- x,y or {x1,x2},{y1,y2}
                     movearea={101,3,132,28}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+400
                          jaf.give_shell(id,800)
                          jaf.give_item(id,200,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.."1x "..jaf.list_items[200].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(100,700)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 17 15 255 255 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [13]={name="Minion Blaze",
                     hp=170000,
                     rot=0,
                     img={jaf.locgfx.."monster/minion_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,170},  -- x,y
                     spawntime=20,
                     slayattackdmg=50,
                     spawnpos={256,69}, --- x,y or {x1,x2},{y1,y2}
                     movearea={245,59,269,80}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+4000
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(100,800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 40 70 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [14]={name="Slenderman",
                     plcatk=27,
                     hp=250000,
                     rot=false,
                     img={jaf.locgfx.."monster/slender.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={88,88},  -- x,y
                     spawntime=60,
                     slayattackdmg=20,
                     spawnpos={21,275}, --- x,y or {x1,x2},{y1,y2}
                     movearea={19,260,51,284}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+5700
                          jaf.give_shell(id,1500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(100,2800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/horror3.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [15]={name="Clawbeast",
                     hp=500000,
                     rot=0,
                     img={jaf.locgfx.."monster/clawbeast_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={120,164},  -- x,y
                     spawntime=30,
                     slayattackdmg=70,
                     spawnpos={75,272}, --- x,y or {x1,x2},{y1,y2}
                     movearea={70,267,84,278}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+5000
                          jaf.give_shell(id,2000)
                          if math.random(1,2)==1 then
                             jaf.give_item(id,209,1)
                             jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[209].name..hijau,jaf.listmonster[math.floor(i)].name))
                          end
                     end,
                     dropitem=function(i,x,y)
                         local ccidp=math.random(1,20)
                         if ccidp==5 then
                            jaf.dropitem(0,61,math.floor(x/32),math.floor(y/32))
                         elseif ccidp==7 then
                           jaf.dropitem(0,74,math.floor(x/32),math.floor(y/32))
                         end
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(100,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."shootfire.png",jaf.monsterx[id],jaf.monstery[id],0)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              tween_move(jaf.monsterskillIMG[id],200,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 70 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(4*32),(4*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(200,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [16]={name="Golem",
                     hp=280000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_golem_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=80,
                     slayattackdmg=50,
                     spawnpos={32,323}, --- x,y or {x1,x2},{y1,y2}
                     movearea={18,314,48,337}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+3800
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(4*32),(4*32)) then
                           local mdmg=math.random(350,500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 255 155 055")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [17]={name="Diablo",
                     hp=300000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_diablo_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=50,
                     slayattackdmg=50,
                     spawnpos={246,60}, --- x,y or {x1,x2},{y1,y2}
                     movearea={245,59,269,80}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+4700
                          jaf.give_shell(id,2200)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(4*32),(4*32)) then
                           local mdmg=math.random(1000,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 255 055 055")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [18]={name="Headless Warrior",
                     hp=150000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_headlesswarrior_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=120,
                     slayattackdmg=50,
                     spawnpos={22,265}, --- x,y or {x1,x2},{y1,y2}
                     movearea={19,260,51,284}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2000
                          jaf.give_shell(id,3500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(2900,3500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [19]={name="Ice Wolf",
                     hp=60000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_icewolf_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=4,
                     slayattackdmg=50,
                     spawnpos={160,260}, --- x,y or {x1,x2},{y1,y2}
                     movearea={140,252,171,270}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1500
                          jaf.give_shell(id,1500)
			  jaf.give_item(id,228,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[228].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(400,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           parse("speedmod "..tgt.." -20")
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 055 025 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [20]={name="Savage Wolf",
                     hp=100000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_savagewolf_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=60,
                     slayattackdmg=75,
                     spawnpos={211,263}, --- x,y or {x1,x2},{y1,y2}
                     movearea={205,254,218,271}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1800
                          jaf.give_shell(id,2400)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(1750,2500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [21]={name="Soul Destroyer",
                     hp=1200000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_souldestroyer_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=3,
                     slayattackdmg=55,
                     spawnpos={224,261},--- x,y or {x1,x2},{y1,y2}
                     movearea={205,254,232,272}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2300
                          jaf.give_shell(id,7000)
		 	  jaf.give_item(id,233,3)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 3x "..jaf.list_items[233].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(6*32),(6*32)) then
                           local mdmg=math.random(4500,5000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 105 095 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [22]={name="Death Angel",
                     hp=700000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_deathangel_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=3,
                     slayattackdmg=35,
                     spawnpos={262,263}, --- x,y or {x1,x2},{y1,y2}
                     movearea={255,252,287,276}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+6700
                          jaf.give_shell(id,5000)
		 	  jaf.give_item(id,233,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[233].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(5*32),(5*32)) then
                           local mdmg=math.random(4750,5000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 255 200 200")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [23]={name="Dark God",
                     hp=3000000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_darkgod_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=5,
                     slayattackdmg=120,
                     spawnpos={280,263}, --- x,y or {x1,x2},{y1,y2}
                     movearea={255,252,287,276}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+5000
                          jaf.give_shell(id,18000)
		 	  jaf.give_item(id,233,8)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 8x "..jaf.list_items[233].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(6*32),(6*32)) then
                           local mdmg=math.random(7500,8500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [24]={name="Sheep",
                     hp=20,
                     rot=0,
                     multi=2,
                     img={jaf.locgfx.."monster/monster_sheep2.png",0.9,color={255,255,255}}, -- loc,scale,color
                     scale={72,65},  -- x,y
                     spawntime=12,
                     slayattackdmg=50,
                     spawnpos={{75,83},{9,17}}, --- x,y or {x1,x2},{y1,y2}
                     movearea={57,4,83,25}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+25
                          jaf.give_shell(id,10)
			  jaf.give_item(id,238,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[238].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                     end,
                     freeaction=function(id)
                     end
                     };
                [25]={name="Chicken",
                     hp=10,
                     rot=0,
                     multi=2,
                     img={jaf.locgfx.."monster/monster_chicken.png",0.9,color={255,255,255}}, -- loc,scale,color
                     scale={48,67},  -- x,y
                     spawntime=8,
                     slayattackdmg=50,
                     spawnpos={{59,70},{22,25}}, --- x,y or {x1,x2},{y1,y2}
                     movearea={57,4,83,25}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+25
                          jaf.give_shell(id,10)
			  local rr = math.random(1,5)
                          local rs=math.random(1,3)
			if rs==1 then
			  jaf.give_item(id,269,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[269].name..hijau,jaf.listmonster[math.floor(i)].name))
			elseif rs==3 then
			  jaf.give_item(id,288,rr)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..rr.."x "..jaf.list_items[288].name..hijau,jaf.listmonster[math.floor(i)].name))
			end
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                     end,
                     freeaction=function(id)
                     end
                     };
                [26]={name="Artic Warrior",
                     hp=200000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_articwarrior_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=20,
                     slayattackdmg=70,
                     spawnpos={160,260}, --- x,y or {x1,x2},{y1,y2}
                     movearea={140,252,171,270}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2550
                          jaf.give_shell(id,1800)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(900,1800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 055 025 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [27]={name="Skeleton",
                     hp=20000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_skeleton.png",0.7,color={255,255,255}}, -- loc,scale,color
                     scale={240,240},  -- x,y
                     spawntime=30,
                     slayattackdmg=100,
                     spawnpos={146,285}, --- x,y or {x1,x2},{y1,y2}
                     movearea={134,279,153,292}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1300
                          jaf.give_shell(id,800)
			  jaf.give_item(id,262,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[262].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     droprate={3,2,func=function(id,i)
                                    local rgi=math.random(2,30)
                                    jaf.give_item(id,113,rgi)
                                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..rgi.."x "..jaf.list_items[113].name..hijau,jaf.listmonster[math.floor(i)].name))
                               end},
                     dropitem=function(i,x,y)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(100,300)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 005 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [28]={name="Croc Man",
                     plcatk=14,
                     hp=5000,
                     rot=0,
                     multi=2,
                     img={jaf.locgfx.."monster/monster_crocman_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={120,120},  -- x,y
                     spawntime=30,
                     slayattackdmg=300,
                     spawnpos={111,127}, --- x,y or {x1,x2},{y1,y2}
                     movearea={108,111,137,130}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+700
                          jaf.give_shell(id,1600)
                          local rdimg=math.random(1,3)
                          jaf.give_item(id,98,rdimg)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..rdimg.."x "..jaf.list_items[98].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(400,500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 005 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [29]={name="Dead Spirit Summoner Jester",
                     hp=800000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_jester_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=20,
                     slayattackdmg=100,
                     spawnpos={363,23}, --- x,y or {x1,x2},{y1,y2}
                     movearea={353,12,374,33}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+20000
                          jaf.give_shell(id,45000)
			  jaf.give_item(id,233,21)
			  jaf.give_item(id,312,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 21x "..jaf.list_items[233].name..hijau,jaf.listmonster[math.floor(i)].name))
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 1x "..jaf.list_items[312].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(500,25000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 64 120 015 015 015")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [30]={name="Jack Hallow",
                     hp=100000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_jackhallow_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=10,
                     slayattackdmg=50,
                     spawnpos={122,286}, --- x,y or {x1,x2},{y1,y2}
                     movearea={118,279,140,292}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          local rrwi=math.random(1,5)
                          jaf.exp[id]=jaf.exp[id]+1800
                          jaf.give_shell(id,1800)
			  jaf.give_item(id,354,rrwi)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." "..rrwi.."x "..jaf.list_items[354].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(500,900)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 005 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [31]={name="Garnet Prince",
                     hp=100000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_garnetprince_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=100,
                     slayattackdmg=30,
                     spawnpos={282,13}, --- x,y or {x1,x2},{y1,y2}
                     movearea={267,4,294,36}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1700
                          jaf.give_shell(id,3200)
			  jaf.give_item(id,272,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 1x "..jaf.list_items[272].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(1400,1800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 255 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [32]={name="Garnet King",
                     hp=250000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_garnetking_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=100,
                     slayattackdmg=75,
                     spawnpos={279,30}, --- x,y or {x1,x2},{y1,y2}
                     movearea={267,4,294,36}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2100
                          jaf.give_shell(id,4800)
			  jaf.give_item(id,272,3)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." 3x "..jaf.list_items[272].name..hijau,jaf.listmonster[math.floor(i)].name))
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(2500,2900)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 255 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [33]={name="Inferno Dragon",
                     hp=800000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_infernodragon_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=60,
                     slayattackdmg=20,
                     spawnpos={257,224}, --- x,y or {x1,x2},{y1,y2}
                     movearea={251,216,280,234}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+4000
                          jaf.give_shell(id,8000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(800,4300)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 39 66 255 210 175")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [34]={name="Titan Golem",
                     hp=350000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_titangolem_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={240,240},  -- x,y
                     spawntime=55,
                     slayattackdmg=12,
                     spawnpos={244,290}, --- x,y or {x1,x2},{y1,y2}
                     movearea={240,286,262,301}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2800
                          jaf.give_shell(id,7500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(400,900)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 005 005 005")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [35]={name="Tarask",
                     hp=200000,
                     rot=0,
                     img={jaf.locgfx.."monster/tarask.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={160,145},  -- x,y
                     spawntime=40,
                     slayattackdmg=45,
                     spawnpos={313,262},
                     movearea={310,251,338,284},
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1600
                          jaf.give_shell(id,1500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(400,3800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [36]={name="Seres",
                     hp=1500000,
                     rot=0,
                     img={jaf.locgfx.."monster/seres.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={124,220},  -- x,y
                     spawntime=80,
                     slayattackdmg=100,
                     spawnpos={328,126},
                     movearea={319,118,337,135},
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+4000
                          jaf.give_shell(id,2500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(600,7000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 030 144 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [37]={name="Werewolf",
                     hp=10000,
                     rot=0,
                     img={jaf.locgfx.."monster/wirewolf.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={63,56},  -- x,y
                     spawntime=3,
                     dodge=3,
                     slayattackdmg=30,
                     spawnpos={111,235}, --- x,y or {x1,x2},{y1,y2}
                     movearea={105,233,116,243}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1100
                          jaf.give_shell(id,1000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(8*32),(8*32)) then
                           local mdmg=math.random(200,2500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           local lastmx=jaf.monsterx[id]
                           local lastmy=jaf.monstery[id]
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],jaf.rot_target(lastmx,lastmy,jaf.monsterx[id],jaf.monstery[id]))
                           parse("effect \"fire\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 32 60 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [38]={name="Walker",
                     plcatk=59,
                     hp=7000,
                     rot=false,
                     multi=2,
                     img={jaf.locgfx.."monster/walkingdead.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={32,32},  -- x,y
                     spawntime=5,
                     slayattackdmg=60,
                     spawnpos={407,202}, --- x,y or {x1,x2},{y1,y2}
                     movearea={400,201,409,208}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+900
                          jaf.give_shell(id,800)
                          jaf.give_item(id,181,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2.." "..jaf.list_items[181].name..hijau,jaf.listmonster[math.floor(i)].name))
			  local rr = math.random(1,4)
			if rr==1 then
			  jaf.give_item(id,263,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[263].name..hijau,jaf.listmonster[math.floor(i)].name))
			elseif rr==4 then
			  jaf.give_item(id,264,1)
                          jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[264].name..hijau,jaf.listmonster[math.floor(i)].name))
			  end
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(2*32),(2*32)) then
                           local mdmg=math.random(40,500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 8 8 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [39]={name="Dead Spider",
                     hp=35000,
                     rot=false,
                     img={jaf.locgfx.."monster/deadspider.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={64,64},  -- x,y
                     spawntime=15,
                     slayattackdmg=60,
                     spawnpos={389,225}, --- x,y or {x1,x2},{y1,y2}
                     movearea={385,216,393,226}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+800
                          jaf.give_shell(id,500)
                     end,
                     droprate={10,4,func=function(id,i)
                                    jaf.give_item(id,344,1)
                                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[344].name..hijau,jaf.listmonster[math.floor(i)].name))
                               end},
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(2*32),(2*32)) then
                           local mdmg=math.random(240,3500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 12 12 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [40]={name="Argnot",
                     hp=7000,
                     rot=false,
                     multi=2,
                     img={jaf.locgfx.."monster/argnot.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={80,134},  -- x,y
                     spawntime=10,
                     slayattackdmg=40,
                     spawnpos={388,245}, --- x,y or {x1,x2},{y1,y2}
                     movearea={378,242,392,253}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+300
                          jaf.give_shell(id,500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(2*32),(2*32)) then
                           local mdmg=math.random(500,1500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 22 22 000 555 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [41]={name="Aneha",
                     plcatk=61,
                     hp=80000,
                     rot=false,
                     img={jaf.locgfx.."monster/aneha.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={80,210},  -- x,y
                     spawntime=20,
                     slayattackdmg=250,
                     spawnpos={392,277}, --- x,y or {x1,x2},{y1,y2}
                     movearea={382,272,394,284}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+1000
                          jaf.give_shell(id,1500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(2*32),(2*32)) then
                           local mdmg=math.random(1500,4500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 22 22 255 000 000")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [42]={name="Pumpkin Lord",
                     hp=300000,
                     rot=0,
                     img={jaf.locgfx.."monster/pumpkinlord.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={100,182},  -- x,y
                     spawntime=3,
                     slayattackdmg=80,
                     spawnpos={105,319}, --- x,y or {x1,x2},{y1,y2}
                     movearea={95,311,116,340}, --- x1,y1,x2,y2
                     droprate={15,4,func=function(id,i)
                                    jaf.give_item(id,347,1)
                                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[347].name..hijau,jaf.listmonster[math.floor(i)].name))
                               end},
                     dropitem=function(i,x,y)
                     end,
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+12000
                          jaf.give_shell(id,15000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(500,8500)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."hpt.png",jaf.monsterx[id],jaf.monstery[id],0)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              imagescale(jaf.monsterskillIMG[id],1.4,1.4)
                              tween_move(jaf.monsterskillIMG[id],500,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 70 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(4*32),(4*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(500,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [43]={name="Sephirot",
                     hp=320000,
                     rot=0,
                     img={jaf.locgfx.."monster/sephirot.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={200,171},  -- x,y
                     spawntime=20,
                     dodge=3,
                     slayattackdmg=10,
                     spawnpos={390,132}, --- x,y or {x1,x2},{y1,y2}
                     movearea={367,127,402,137}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2000
                          jaf.give_shell(id,2000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     droprate={52,2,func=function(id,i)
                                    jaf.give_item(id,376,1)
                                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[376].name..hijau,jaf.listmonster[math.floor(i)].name))
                               end},
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(800,1800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."flare.bmp",jaf.monsterx[id],jaf.monstery[id],0)
                              imagescale(jaf.monsterskillIMG[id],2,2)
                              imageblend(jaf.monsterskillIMG[id],1)
                              imagecolor(jaf.monsterskillIMG[id],255,000,000)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              tween_move(jaf.monsterskillIMG[id],500,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 100 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(5*32),(5*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(500,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [44]={name="Croco Goblin",
                     hp=8000,
                     rot=0,
                     plcatk=70,
                     multi=2,
                     img={jaf.locgfx.."monster/monster_goblin_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={150,150},  -- x,y
                     spawntime=10,
                     slayattackdmg=50,
                     spawnpos={206,54}, --- x,y or {x1,x2},{y1,y2}
                     movearea={204,51,215,58}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+850
                          jaf.give_shell(id,500)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(3*32),(3*32)) then
                           local mdmg=math.random(300,800)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                           jaf.monsterx[id]=player(tgt,"x")
                           jaf.monstery[id]=player(tgt,"y")
                           tween_move(jaf.monsterIMG[id],300,jaf.monsterx[id],jaf.monstery[id],0)
                           parse("effect \"colorsmoke\" "..jaf.monsterx[id].." "..jaf.monstery[id].." 17 15 255 255 255")
                           jaf.getsound2(jaf.monsterx[id],jaf.monstery[id],"JAF/otherworld/waterexplode.ogg",(9*32),(9*32))
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [45]={name="Lucifer",
                     hp=500000,
                     rot=0,
                     img={jaf.locgfx.."monster/monster_lucifer_fix.png",1,color={255,255,255}}, -- loc,scale,color
                     scale={160,160},  -- x,y
                     spawntime=30,
                     dodge=2,
                     slayattackdmg=200,
                     spawnpos={238,20}, --- x,y or {x1,x2},{y1,y2}
                     movearea={232,11,244,20}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+2000
                          jaf.give_shell(id,5000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     droprate={52,2,func=function(id,i)
                               end},
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(200,2000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."flare.bmp",jaf.monsterx[id],jaf.monstery[id],0)
                              imagescale(jaf.monsterskillIMG[id],2,2)
                              imageblend(jaf.monsterskillIMG[id],1)
                              imagecolor(jaf.monsterskillIMG[id],255,000,000)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              tween_move(jaf.monsterskillIMG[id],200,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 100 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(5*32),(5*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(200,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
                [46]={name="Kilum",
                     hp=1500000,
                     rot=false,
                     img={jaf.locgfx.."npc/kilum.png",1.2,color={255,255,255}}, -- loc,scale,color
                     scale={50,52},  -- x,y
                     spawntime=60,
                     dodge=5,
                     slayattackdmg=500,
                     spawnpos={339,326}, --- x,y or {x1,x2},{y1,y2}
                     movearea={330,323,348,338}, --- x1,y1,x2,y2
                     drop=function(id,i,x,y)
                          jaf.exp[id]=jaf.exp[id]+7000
                          jaf.give_shell(id,5000)
                     end,
                     dropitem=function(i,x,y)
                     end,
                     droprate={40,9,func=function(id,i)
                                    jaf.give_item(id,412,1)
                                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,hijau2..""..jaf.list_items[412].name..hijau,jaf.listmonster[math.floor(i)].name))
                               end},
                     skill=function(id,tgt)
                         if jaf.radiuscheck(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"),(10*32),(10*32)) then
                           local mdmg=math.random(200,4000)
                           jaf.hitplayer(tgt,nil,jaf.listmonster[math.floor(id)].name,mdmg)
                          local getrotmk=jaf.rot_target(jaf.monsterx[id],jaf.monstery[id],player(tgt,"x"),player(tgt,"y"))
                          imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],0)
                           if jaf.monsterskillIMG[id]==nil then
                              jaf.monstermovest[id]=false
                              jaf.varfreeimage(id,jaf.monsterskillIMG)
                              jaf.monsterskillIMG[id]=image(jaf.locgfx.."flare.bmp",jaf.monsterx[id],jaf.monstery[id],0)
                              imagescale(jaf.monsterskillIMG[id],2,2)
                              imageblend(jaf.monsterskillIMG[id],1)
                              imagecolor(jaf.monsterskillIMG[id],255,000,000)
                              imagepos(jaf.monsterskillIMG[id],jaf.monsterx[id],jaf.monstery[id],getrotmk)
                              tween_move(jaf.monsterskillIMG[id],200,player(tgt,"x"),player(tgt,"y"),getrotmk)
                              local tgxlst=player(tgt,"x")
                              local tgylst=player(tgt,"y")
                              function jaf.monsterstx(id,tg,rotm,dmg,trdsx,trdsy)
                                  jaf.varfreeimage(id,jaf.monsterskillIMG)
                                  parse("explosion "..player(tg,"x").." "..player(tg,"y").." 100 5 0")
                                  for _,i in pairs(player(0,"tableliving")) do
                                     if jaf.radiuscheck(trdsx,trdsy,player(i,"x"),player(i,"y"),(5*32),(5*32)) then
                                        jaf.hitplayer(i,nil,jaf.listmonster[math.floor(id)].name,dmg)
                                     end
                                  end
                                  jaf.monstermovest[id]=true
                             end
                             local mnstrtx=timerEx(200,jaf.monsterstx,1,id,tgt,getrotmk,mdmg,tgxlst,tgylst)
                           end
                         end
                     end,
                     freeaction=function(id)
                     end
                     };
}

function jaf.removemonster(id)
     if jaf.monsterIMG[id]~=nil then
             freeimage(jaf.monsterIMG[id])
             jaf.monsterIMG[id]=nil
             jaf.monsterHP[id]=0
             jaf.monsterT[id]=0
             jaf.monsterRot[id]=0
             jaf.monstergetRot[id]=0
             jaf.monsterFREZE[id]=0
             jaf.monsterhb[id]=0
     end
end

function jaf.monstercreate(id)
       local v=jaf.listmonster[math.floor(id)]
       local id2=id
       if v.img and v.img[1] then
             jaf.varfreeimage(id2,jaf.monsterskillIMG)
             jaf.removemonster(id2)
             jaf.monsterHP[id2]=v.hp
             jaf.monstermovest[id2]=true
             jaf.monsterT[id2]=0
             jaf.monstermb[id2]=0
             jaf.monsterTS[id2]=0
             jaf.monsterRot[id2]=0
             jaf.monstergetRot[id2]=0
             jaf.monsterFREZE[id2]=0
             jaf.monsterhb[id2]=0
             jaf.monsterlastpos[id2]=tostring(0).."+0."..tostring(0)
             if type(v.spawnpos[1])=="table" and type(v.spawnpos[2])=="table" then
                jaf.monsterx[id2]=math.random(v.spawnpos[1][1],v.spawnpos[1][2])*32+16
                jaf.monstery[id2]=math.random(v.spawnpos[2][1],v.spawnpos[2][2])*32+16
             else
                jaf.monsterx[id2]=v.spawnpos[1]*32+16
                jaf.monstery[id2]=v.spawnpos[2]*32+16
             end
             jaf.monsterIMG[id2]=image(v.img[1],jaf.monsterx[id2],jaf.monstery[id2],0)
             jaf.monsterobjid[tonumber(jaf.monsterIMG[id2])]=id
             imagescale(jaf.monsterIMG[id2],v.img[2],v.img[2])
             imagecolor(jaf.monsterIMG[id2],v.img.color[1],v.img.color[2],v.img.color[3])
             local msx=math.floor(v.img[2]/1*v.scale[1])
             local msy=math.floor(v.img[2]/1*v.scale[2])
             imagehitzone(jaf.monsterIMG[id2],104,-msx/2,-msy/2,msx,msy)
       end
end

function jaf.monstercreateall()
        for i=1,#jaf.listmonster do
                if jaf.listmonster[i].multi~=nil and jaf.listmonster[i].multi then
                   for ii=1,jaf.listmonster[i].multi do
                       jaf.monsterid[(i+(ii/10))]=i
                       jaf.monstercreate((i+(ii/10)))
                   end
                else
                       jaf.monsterid[i]=i
                       jaf.monstercreate(i)
                end
        end
end

function jaf.monsterresetall()
        for i=1,#jaf.listmonster do
                if jaf.listmonster[i].multi~=nil and jaf.listmonster[i].multi then
                   for ii=1,jaf.listmonster[i].multi do
                         jaf.monsterHP[(i+(ii/10))]=0
                         jaf.monsterIMG[(i+(ii/10))]=nil
                         jaf.monsterx[(i+(ii/10))]=0
                         jaf.monstery[(i+(ii/10))]=0
                         jaf.monsterT[(i+(ii/10))]=0
                         jaf.monsterTS[(i+(ii/10))]=0
                         jaf.monsterid[(i+(ii/10))]=i
                   end
                 else
                   jaf.monsterHP[i]=0
                   jaf.monsterIMG[i]=nil
                   jaf.monsterx[i]=0
                   jaf.monstery[i]=0
                   jaf.monsterT[i]=0
                   jaf.monsterTS[i]=0
                   jaf.monsterid[i]=i
                 end
        end
end

function jaf.checkmonsterpos(id,rot,dis)
         v=jaf.listmonster[math.floor(id)]
         local mxs=jaf.monsterx[id]
         local mys=jaf.monstery[id]
         local x=jaf.checkmoverot(mxs,mys,rot,dis)[1]
         local y=jaf.checkmoverot(mxs,mys,rot,dis)[2]
         local mx1,my1,mx2,my2=v.movearea[1],v.movearea[2],v.movearea[3],v.movearea[4]
         local tilex,tiley=math.floor(x/32),math.floor(y/32)
         if tile(tilex,tiley,"walkable") and tilex>=mx1 and tiley>=my1 and tilex<=mx2 and tiley<=my2  then
                return true
         end
         return false
end

function jaf.monstermove(id)
      local v=jaf.listmonster[math.floor(id)]
      local movetmbh=0
      if v.speed~=nil and v.speed then
         movetmbh=v.speed
      end
      if jaf.monsterT[id]<=0 and v.plcatk~=nil and jaf.sv_plarealist[v.plcatk]~=nil then
         for pli,_ in pairs(jaf.sv_plarealist[v.plcatk]) do
             if pli~=nil and player(pli,"exists") and player(pli,"health")>0 then
                jaf.monsterT[id]=pli
                break
             end
         end
      end
      if jaf.monsterHP[id]>0 and jaf.monstermovest[id] then
         jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=nil
         local mxs=jaf.monsterx[id]
         local mys=jaf.monstery[id]
         local mx1,my1,mx2,my2=v.movearea[1],v.movearea[2],v.movearea[3],v.movearea[4]
         local tilex,tiley=math.floor((jaf.monsterx[id])/32),math.floor((jaf.monstery[id])/32)
         if jaf.monsterT[id]>0 and player(jaf.monsterT[id],"exists") then
               iim=jaf.monsterT[id]
               if not jaf.checkarea(player(iim,"tilex"),player(iim,"tiley"),mx1,my1,mx2,my2) or player(iim,"health")<=0 then
                  jaf.monsterT[id]=0
               end
         elseif jaf.monsterT[id]>0 then
                  jaf.monsterT[id]=0
         end
         if jaf.monsterT[id]>0 and player(jaf.monsterT[id],"exists") and jaf.monsterHP[id]>math.floor(5/100*jaf.listmonster[math.floor(id)].hp) then
           xmp=player(jaf.monsterT[id],"x")
           ymp=player(jaf.monsterT[id],"y")
           jaf.monsterRot[id]=-math.deg(math.atan2(mxs-xmp,mys-ymp))
           rot=jaf.monsterRot[id]
           local spedplusg=0
           if not tile(tilex,tiley,"walkable") then
              local rotgantitbl={-90,90}
              rot=jaf.monsterRot[id]-rotgantitbl[math.random(1,2)]
           end
           speed=math.floor(12,25)
              if jaf.monstergetRot[id]==0 then jaf.monstergetRot[id]=10
              elseif jaf.monstergetRot[id]==10 then jaf.monstergetRot[id]=-10
              elseif jaf.monstergetRot[id]==-10 then jaf.monstergetRot[id]=10 end
           jaf.monsterx[id]=jaf.checkmoverot(mxs,mys,rot,speed+spedplusg+movetmbh)[1]
           jaf.monstery[id]=jaf.checkmoverot(mxs,mys,rot,speed+spedplusg+movetmbh)[2]
           jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
              rots=jaf.monsterRot[id]+jaf.monstergetRot[id] if v.rot and v.rot==0 then rots=jaf.monstergetRot[id] end
           if not tile(tilex,tiley,"walkable") and (v.rot==nil or v.rot==false) then
              rots=rot
           end
           local tilex,tiley=math.floor((jaf.monsterx[id])/32),math.floor((jaf.monstery[id])/32)
           local acmv=jaf.checkmoverot(mxs,mys,rot,32) -- accurate move
           local acmtx,acmty=math.floor(acmv[1]/32),math.floor(acmv[2]/32)
           if tile(acmtx,acmty,"walkable") and tilex>=mx1 and tiley>=my1 and tilex<=mx2 and tiley<=my2  then
                imagepos(jaf.monsterIMG[id],mxs,mys,rots)
           elseif not tile(acmtx,acmty,"walkable") then
                local nmv=jaf.checkmoverot(mxs,mys,rot,math.random(-1,1))
                imagepos(jaf.monsterIMG[id],nmv[1],nmv[2],rots)
                jaf.monsterT[id]=0
           else
                jaf.monsterT[id]=0
           end
         elseif jaf.monsterT[id]>0 and player(jaf.monsterT[id],"exists") then
           jaf.monsterRot[id]=jaf.rot_target(player(jaf.monsterT[id],"x"),player(jaf.monsterT[id],"y"),jaf.monsterx[id],jaf.monstery[id])
           if jaf.checkmonsterpos(id,jaf.monsterRot[id],9) then
              local vmv=jaf.checkmoverot(mxs,mys,jaf.monsterRot[id],9+movetmbh)
              jaf.monsterx[id]=vmv[1]
              jaf.monstery[id]=vmv[2]
              jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
              if jaf.monstergetRot[id]==0 then jaf.monstergetRot[id]=10
              elseif jaf.monstergetRot[id]==10 then jaf.monstergetRot[id]=-10
              elseif jaf.monstergetRot[id]==-10 then jaf.monstergetRot[id]=10 end
              rots=jaf.monsterRot[id]+jaf.monstergetRot[id] if v.rot and v.rot==0 then rots=jaf.monstergetRot[id] end
              imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
           else
                jaf.monsterT[id]=0
                rdmm={-90,90}
                jaf.monsterRot[id]=jaf.monsterRot[id]-rdmm[math.random(1,#rdmm)]
                 local tilex,tiley=math.floor((jaf.monsterx[id])/32),math.floor((jaf.monstery[id])/32)
                if  jaf.monsterRot[id]<-90 then  jaf.monsterRot[id]=jaf.monsterRot[id]+360 end
                if tile(tilex,tiley,"walkable") and tilex>=mx1 and tiley>=my1 and tilex<=mx2 and tiley<=my2  then
                elseif not tile(tilex,tiley,"walkable") then
                   jaf.monsterx[id]=mxs
                   jaf.monstery[id]=mys
                   jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
                else
                   if type(v.spawnpos[1])=="table" and type(v.spawnpos[2])=="table" then
                        jaf.monsterx[id]=v.spawnpos[1][1]*32
                        jaf.monstery[id]=v.spawnpos[2][1]*32
                        jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   else
                        jaf.monsterx[id]=v.spawnpos[1]*32
                        jaf.monstery[id]=v.spawnpos[2]*32
                        jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   end
                   imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
                end
           end
         else
           if math.random(1,20)==5 and jaf.checkmonsterpos(id,jaf.monsterRot[id],7) then jaf.monsterRot[id]=math.random(0,360) end
           if jaf.checkmonsterpos(id,jaf.monsterRot[id],7)  then
              jaf.monsterx[id]=jaf.checkmoverot(mxs,mys,jaf.monsterRot[id],7+movetmbh)[1]
              jaf.monstery[id]=jaf.checkmoverot(mxs,mys,jaf.monsterRot[id],7+movetmbh)[2]
              jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
              if jaf.monstergetRot[id]==0 then jaf.monstergetRot[id]=10
              elseif jaf.monstergetRot[id]==10 then jaf.monstergetRot[id]=-10
              elseif jaf.monstergetRot[id]==-10 then jaf.monstergetRot[id]=10 end
              rots=jaf.monsterRot[id]+jaf.monstergetRot[id] if v.rot and v.rot==0 then rots=jaf.monstergetRot[id] end
              imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
           else
                rdmm={-90,90}
                local rotbmtr=jaf.monsterRot[id]
                jaf.monsterRot[id]=jaf.monsterRot[id]-rdmm[math.random(1,#rdmm)]
                if  jaf.monsterRot[id]<-90 then  jaf.monsterRot[id]=jaf.monsterRot[id]+360 end
                if tile(tilex,tiley,"walkable") and tilex>=mx1 and tiley>=my1 and tilex<=mx2 and tiley<=my2  then
                elseif not tile(tilex,tiley,"walkable") then
                   jaf.monsterRot[id]=rotbmtr
                   jaf.monsterx[id]=jaf.checkmoverot(mxs,mys,-rotbmtr,7+movetmbh)[1]
                   jaf.monstery[id]=jaf.checkmoverot(mxs,mys,-rotbmtr,7+movetmbh)[2]
                   jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
                else
                   if type(v.spawnpos[1])=="table" and type(v.spawnpos[2])=="table" then
                        jaf.monsterx[id]=v.spawnpos[1][1]*32
                        jaf.monstery[id]=v.spawnpos[2][1]*32
                        jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   else
                        jaf.monsterx[id]=v.spawnpos[1]*32
                        jaf.monstery[id]=v.spawnpos[2]*32
                        jaf.monstergetpos[math.floor(jaf.monsterx[id]/32)+tonumber(tostring("0.0"..math.floor(jaf.monstery[id]/32)))]=id
                   end
                   imagepos(jaf.monsterIMG[id],jaf.monsterx[id],jaf.monstery[id],rots)
                end
           end
         end
       end
       if jaf.monstery[id]<10 then
          jaf.sv_monsterpos[jaf.monsterlastpos[id]]=nil
          jaf.monsterlastpos[id]=tostring(math.floor(jaf.monsterx[id]/32)).."+0.0"..tostring(math.floor(jaf.monstery[id]/32))
          jaf.sv_monsterpos[jaf.monsterlastpos[id]]=id
       else
          jaf.sv_monsterpos[jaf.monsterlastpos[id]]=nil
          jaf.monsterlastpos[id]=tostring(math.floor(jaf.monsterx[id]/32)).."+0."..tostring(math.floor(jaf.monstery[id]/32))
          jaf.sv_monsterpos[jaf.monsterlastpos[id]]=id
       end
end

function jaf.checkpos_monster(tilex,tiley)
       if tiley<10 and jaf.sv_monsterpos[tostring(tilex).."+0.0"..tostring(tiley)]~=nil then
          return jaf.sv_monsterpos[tostring(tilex).."+0.0"..tostring(tiley)]
       elseif jaf.sv_monsterpos[tostring(tilex).."+0."..tostring(tiley)]~=nil then
          return jaf.sv_monsterpos[tostring(tilex).."+0.0"..tostring(tiley)]
       else
          return false
       end
end