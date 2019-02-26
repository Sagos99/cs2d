print("Initialising ...")
SV_SCRIPTLIST={"power.lua","clan.lua","NPC.lua","tables.lua",
               "functions.lua","console.lua",
               "emoticons.lua","monster.lua","internet.lua",
               "achievements.lua"}

for sv_i=1,#SV_SCRIPTLIST do
      local lasttime=os.clock()
      dofile("sys/lua/JAF-OtherWorld/"..SV_SCRIPTLIST[sv_i])
      print("Installing "..SV_SCRIPTLIST[sv_i].." is success in "..string.format("%.3f",os.clock()-lasttime).."ms")
end

jaf.link_CMD_refresh()
jaf.daycycle_refresh()

addhook("join","jaf.join")
function jaf.join(id)
        if jaf.sv_plarealist[jaf.areameid[id]]~=nil then
           jaf.sv_plarealist[jaf.areameid[id]][id]=nil
        end
        jaf.reset(id)
        jaf.load_clan(id,jaf.clan[id])
        jaf.svj_msg(""..hijau.."Welcome "..player(id,"name")..", Joining to "..biru..""..game("sv_name"))
        if jaf.usgn[id]<=0 then
           jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],3))
        end
end

addhook("second","jaf.second")
function jaf.second()
            if jaf.sv_maintenance~=nil and jaf.sv_maintenance then
               parse("sv_password "..jaf.sv_password)
               parse("sv_name MAINTENANCE: "..jaf.sv_name)
            else
               parse("sv_password ")
               parse("sv_name "..jaf.sv_name)
            end
            if jaf.broadT>0 then
               jaf.broadT=jaf.broadT-1
            end
            if jaf.npc_time==1 then
                     jaf.npc_start()
                     jaf.logo_spawn()
                     jaf.npc_time=0
                     jaf.status_spawn()
                     jaf.button_spawn()
                     jaf.monsterresetall()
                     jaf.monstercreateall()
                     jaf.clanwar_reset()
                     jaf.car_spawn(46,50,90)
                     for _,id in pairs(player(0,"table")) do
                                for i=1,#jaf.hudIMG_list.bar do
                                       jaf.bar_show(id,i)
                                end
                     end
                     local tac=0
                     for i=1,#jaf.arealocated do
                         jaf.sv_plarealist[i]={}
                         if jaf.arealocated[i]~=nil and jaf.arealocated[i].teleport~=nil then
                             tac=tac+1
                             jaf.arealocatedta[tac]=i
                         end
                     end
                     jaf.server_load()
                      jaf.inet_list[2].subnet[1].info=jaf.internet_publiccomment_load()
            else
                     jaf.npc_time=jaf.npc_time-1
            end
            if jaf.npc_time<1 then
                    jaf.daycycle_refresh()
                    if jaf.svj_npc_stime>0 then
                       jaf.svj_npc_stime=jaf.svj_npc_stime-1
                    end
                    if jaf.checkadminactive and jaf.server_sec>=3600 then
                       jaf.server_hour=jaf.server_hour+1
                       jaf.server_sec=0
                    elseif jaf.checkadminactive then
                       jaf.server_sec=jaf.server_sec+1
                    end
                    if jaf.svj_npc_stime<1 then
                    jaf.zombie_spawn(17,143,50,165)
                    jaf.headcrab_spawn(108,111,137,130)
                    jaf.snark_spawn(108,111,137,130)
                    jaf.svj_npc_stime=10
                    end
                    if jaf.checkadminactive and jaf.server_hour>=jaf.stafftimetocheck then
                       jaf.stafftimecheck(jaf.maxstafftimeactive)
                       jaf.server_hour=0
                       jaf.server_sec=0
                       jaf.server_lastcheckadmin=os.date("%d_%b_%Y")
                    end
                    jaf.server_save()
                    for i,i2 in pairs(jaf.monsterid) do
                        if jaf.monsterFREZE[i]>0 then
                           jaf.monsterFREZE[i]=jaf.monsterFREZE[i]-1
                        end
                        if jaf.monsterTS[i]<=1 then
                               if jaf.monsterHP[i]<1 or jaf.monsterIMG[i]==nil then
                                  jaf.monsterTS[i]=0
                                  jaf.monstercreate(i)
                               end
                        elseif jaf.monsterTS[i]>1 then
                           jaf.monsterTS[i]=jaf.monsterTS[i]-1
                        end
                        if jaf.monsterT[i]>0 and jaf.monsterFREZE[i]<1 then
                               local mt=jaf.monsterT[i]
                               if math.random(1,7)==4 and jaf.monsterHP[i]>math.floor(5/100*jaf.listmonster[i2].hp) then
                                   jaf.listmonster[i2].skill(i,mt)
                               elseif jaf.monsterHP[i]>math.floor(5/100*jaf.listmonster[i2].hp) and jaf.radiuscheck(math.floor(jaf.monsterx[i]/32),math.floor(jaf.monstery[i]/32),player(mt,"tilex"),player(mt,"tiley"),0,0) then
                                   jaf.getsound2(jaf.monsterx[i],jaf.monstery[i],"weapons/machete_hit.wav",(9*32),(9*32))
                                   parse("effect \"colorsmoke\" "..player(mt,"x").." "..player(mt,"y").." 5 3 255 000 000")
                                   jaf.hitplayer(mt,nil,jaf.listmonster[i2].name,math.random(math.floor(jaf.listmonster[i2].slayattackdmg/2),jaf.listmonster[i2].slayattackdmg))
                               end
                        elseif jaf.monsterHP[i]>math.floor(5/100*jaf.listmonster[i2].hp) and math.random(1,8)==4 then
                               jaf.listmonster[i2].freeaction(i)
                        elseif jaf.monsterHP[i]<jaf.listmonster[i2].hp then
                            local monsterneedheal=true
                            for _,iptm in pairs(player(0,"tableliving")) do
                                local pmtx=player(iptm,"tilex")
                                local pmty=player(iptm,"tiley")
                                local mkux1=jaf.listmonster[i2].movearea[1]
                                local mkux2=jaf.listmonster[i2].movearea[3]
                                local mkuy1=jaf.listmonster[i2].movearea[2]
                                local mkuy2=jaf.listmonster[i2].movearea[4]
                                if pmtx>=mkux1 and pmtx<=mkux2 and pmty>=mkuy1 and pmty<=mkuy2 and jaf.targetmon[iptm]==i then
                                   monsterneedheal=false
                                   break
                                end
                            end
                            if monsterneedheal==true and jaf.monsterhb[i]>=10 then
                                jaf.monsterHP[i]=jaf.listmonster[i2].hp
                                jaf.monsterhb[i]=0
                            elseif monsterneedheal==true then
                                jaf.monsterhb[i]=jaf.monsterhb[i]+1
                            end
                        end
                        if jaf.monsterT[i]>0 then
                          local mt=jaf.monsterT[i]
                          if not player(mt,"exists") then
                                   jaf.monsterT[i]=0
                          elseif jaf.radiuscheck(player(mt,"x"),player(mt,"y"),jaf.monsterx[i],jaf.monstery[i],(12*32+16),(12*32+16))==false then
                                   jaf.monsterT[i]=0
                          elseif player(mt,"health")<1 then
                                   jaf.monsterT[i]=0
                          end
                       end
                       if jaf.monsterT[i]<=0 and jaf.monsterHP[i]>0 then
                          for _,ipl in pairs(player(0,"tableliving")) do
                              if jaf.radiuscheck(player(ipl,"x"),player(ipl,"y"),jaf.monsterx[i],jaf.monstery[i],(12*32+16),(12*32+16)) and jaf.targetmon[ipl]==i then
                                  jaf.monsterT[i]=ipl
                                  break
                              end
                          end
                       end
                    end
                   for i=1,#jaf.clanwar_pos do
                      if jaf.clanwar_time[i] and jaf.clanwar_stat[i]>0 and jaf.clanwar_time[i]<1 then
                     jaf.clanwar_resetid(i)
                      elseif jaf.clanwar_time[i] and jaf.clanwar_stat[i]>0 and jaf.clanwar_time[i]>0 then
                     jaf.clanwar_time[i]=jaf.clanwar_time[i]-1 
                      end
                      if jaf.clanwar_waittime[i] and jaf.clanwar_stat[i]<1 and jaf.clanwar_waittime[i]<1 then
                          jaf.clanwar_resetid(i)
                      elseif jaf.clanwar_waittime[i] and jaf.clanwar_stat[i]<1 and jaf.clanwar_waittime[i]>0 then
                          jaf.clanwar_waittime[i]=jaf.clanwar_waittime[i]-1 
                      end
                   end
            end

            ----- NPC moves removed for reduce lag

            for _,id in pairs(player(0,"tableliving")) do
                if jaf.class_evovampiret[id]>0 then
                   jaf.class_evovampiret[id]=jaf.class_evovampiret[id]-1
                end
                if player(id,"ping")>=750 and jaf.ismelagt[id]>=10 and jaf.ismelag[id]==nil then
                     jaf.varfreeimage(id,jaf.ismelag)
                     jaf.ismelag[id]=image("gfx/JAF/otherworld/melag.png",0,0,200+id)
                elseif player(id,"ping")>=750 and jaf.ismelagt[id]<10 and jaf.ismelag[id]==nil then
                     jaf.ismelagt[id]=jaf.ismelagt[id]+1
                elseif player(id,"ping")<750 and jaf.ismelag[id]~=nil then
                     jaf.ismelagt[id]=0
                     jaf.varfreeimage(id,jaf.ismelag)
                end
                if jaf.arealocated[jaf.areameid[id]]~=nil and jaf.arealocated[jaf.areameid[id]][5]=="Admin House" and jaf.admin[id]<=0 then
                    parse("customkill 0 \"Fake Admin\" "..id)
                    jaf.areameid[id]=0
                end
         if jaf.areameid[id]<1 or (jaf.checkarea(player(id,"tilex"),player(id,"tiley"),jaf.arealocated[jaf.areameid[id]][1],jaf.arealocated[jaf.areameid[id]][2],jaf.arealocated[jaf.areameid[id]][3],jaf.arealocated[jaf.areameid[id]][4])==false and jaf.AFKtime[id]<=0) then
         if jaf.npc_time<1 and jaf.sv_plarealist[jaf.areameid[id]]~=nil then
            jaf.sv_plarealist[jaf.areameid[id]][id]=nil
         end
         local tx=player(id,"tilex")
         local ty=player(id,"tiley")
         local mtsfzst=false
         local mtpvpzst=false
         for i=1,#jaf.safezone do
             local vmt=jaf.safezone[i]
             if jaf.checkarea(tx,ty,vmt[1],vmt[2],vmt[3],vmt[4]) then
                      mtsfzst=true
                      break
             end
         end
         if mtsfzst==false then
         for i=1,#jaf.pvpzone do
             local vmt2=jaf.pvpzone[i]
             if jaf.checkarea(tx,ty,vmt2[1],vmt2[2],vmt2[3],vmt2[4]) then
                      msg2(id,merah.."WARNING: "..kuning..jaf.sv_lang(jaf.lang[id],189))
                      mtpvpzst=true
                      break
             end
         end
         end
         local afund=0
         for i=1,#jaf.arealocated do
             local vmt3=jaf.arealocated[i]
             if vmt3~=nil and jaf.checkarea(tx,ty,vmt3[1],vmt3[2],vmt3[3],vmt3[4]) then
                jaf.areameid[id]=i
                afund=i
                if mtsfzst then
                   jaf.areanameshow[id]=cyan..vmt3[5]..""..hijau.." [SAFE]"
                elseif mtpvpzst then
                   jaf.areanameshow[id]=cyan..vmt3[5]..""..merah.." [PvP]"
                else
                   jaf.areanameshow[id]=cyan..vmt3[5]
                end
                break
             end
         end
         if jaf.npc_time<1 and jaf.sv_plarealist[jaf.areameid[id]]~=nil then
            jaf.sv_plarealist[jaf.areameid[id]][id]=true
         end
         if afund<=0 then
         if mtsfzst then
            jaf.areanameshow[id]=hijau.."SAFE ZONE"
         elseif mtpvpzst then
            jaf.areanameshow[id]=merah.."PvP"
         else
            jaf.areanameshow[id]=merah.."Unknown Area"
         end
         end
         end
                local laplst=0
                if jaf.sv_plarealist[jaf.areameid[id]]~=nil then
                   for _,i in pairs(jaf.sv_plarealist[jaf.areameid[id]]) do
                         laplst=laplst+1
                   end
                end
                if jaf.sv_plarealist[jaf.areameid[id]]~=nil and laplst>1 then
                   parse('hudtxt2 '..id..' 20 "'..jaf.areanameshow[id]..''..kuning..' - '..laplst..' Players" 821 397 2')
                elseif jaf.sv_plarealist[jaf.areameid[id]]~=nil then
                   parse('hudtxt2 '..id..' 20 "'..jaf.areanameshow[id]..''..kuning..' - '..laplst..' Player" 821 397 2')
                else
                   parse('hudtxt2 '..id..' 20 "'..jaf.areanameshow[id]..'" 821 397 2')
                end
                if jaf.preparespawn[id]<1 then
                   parse("makespec "..id)
                end
                if jaf.drug_time[id]==1 then
                   parse("shake "..id.." 30")
                   jaf.drug_time[id]=0
                   jaf.varfreeimage(id,jaf.drug_img)
                elseif jaf.drug_time[id]>0 then
                   jaf.drug_time[id]=jaf.drug_time[id]-1
                   parse("shake "..id.." 30")
                   parse("flashplayer "..id.." 8")
                   if jaf.drug_img[id]==nil then
                      jaf.varfreeimage(id,jaf.drug_img)
                       jaf.drug_img[id]=image(jaf.locgfx.."conf.png",0,0,200+id)
                       tween_rotateconstantly(jaf.drug_img[id],-8)
                   end
                end
                if jaf.AFKtime[id]>0 and jaf.energy[id]<100 then
                   jaf.energy[id]=jaf.energy[id]+math.random(3,7)
                elseif jaf.energy[id]<100 then
                   jaf.energy[id]=jaf.energy[id]+math.random(0,2)
                end
                if jaf.classtime1[id]==1 and jaf.classbtnimg[id][1]~=nil then
                   imagecolor(jaf.classbtnimg[id][1],255,255,255)
                end
                if jaf.classtime2[id]==1 and jaf.classbtnimg[id][2]~=nil then
                   imagecolor(jaf.classbtnimg[id][2],255,255,255)
                end
                if jaf.up_time[id]>=jaf.svj_uptimemax then
                   local iteminslot=jaf.up_itemslot[id]
                   jaf.bar2_remove(id,4)
                   jaf.up_time[id]=0
                   jaf.give_item(id,jaf.up_itemid1[id],-1)
                   if jaf.itemLVL[id][iteminslot]~=nil then
                      jaf.itemLVL[id][iteminslot]=jaf.itemLVL[id][iteminslot]+jaf.list_items[jaf.up_itemid1[id]].itemup
                   else
                      jaf.itemLVL[id][iteminslot]=jaf.list_items[jaf.up_itemid1[id]].itemup
                   end
                   if jaf.itemLVL[id][iteminslot]>10 then
                      jaf.itemLVL[id][iteminslot]=10
                   end
                   msg(putih..player(id,"name").." Upgrade his "..jaf.list_items[jaf.up_itemid2[id]].name.." to lvl."..jaf.itemLVL[id][iteminslot])
                   jaf.up_itemid1[id]=0
                   jaf.up_itemid2[id]=0
                   jaf.varfreeimage(1,jaf.up_imgplus[id])
                   jaf.varfreeimage(2,jaf.up_imgplus[id])
                end
                if jaf.up_time[id]<jaf.svj_uptimemax and jaf.bar2IMG[id][4]~=nil then
                   jaf.up_time[id]=jaf.up_time[id]+1
                end
                if jaf.classtime1[id]>0 then jaf.classtime1[id]=jaf.classtime1[id]-1 end
                if jaf.classtime2[id]>0 then jaf.classtime2[id]=jaf.classtime2[id]-1 end
                if jaf.itemSEL[id][2]~=nil and jaf.itemSEL[id][2]>0 then
                   local idv=jaf.itemSEL[id][2]
                   local classname="No Class"
                   if jaf.list_items[idv].class~=nil then
                      classname=jaf.list_items[idv].name
                      parse('hudtxt2 '..id..' '..(10)..' "'..ungu..''..jaf.energy[id]..'/100" 0 410')
                   else
                      parse('hudtxt2 '..id..' '..(10)..' "" 165 410')
                   end
                   parse('hudtxt2 '..id..' '..(9)..' "'..kuning..classname..'" 165 410')
                else
                   parse('hudtxt2 '..id..' '..(9)..' "'..kuning..'No Class" 165 410')
                   parse('hudtxt2 '..id..' '..(10)..' "" 60 410')
                end
                if jaf.cropstat[id] then
                   if jaf.croptime[id]<jaf.svj_croptimemax then
                      if jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]==166 then
                         if (jaf.croptime[id]+5)>=jaf.svj_croptimemax then
                             jaf.croptime[id]=jaf.svj_croptimemax
                         else
                             jaf.croptime[id]=jaf.croptime[id]+5
                         end
                      elseif jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]==391 then
                         if (jaf.croptime[id]+5)>=jaf.svj_croptimemax then
                             jaf.croptime[id]=jaf.svj_croptimemax
                         else
                             jaf.croptime[id]=jaf.croptime[id]+5
                         end
                      elseif jaf.JAFmember[id]>0 then
                         jaf.croptime[id]=jaf.croptime[id]+3
                      elseif jaf.userlicense[id]>=1 then
                         jaf.croptime[id]=jaf.croptime[id]+2
                      else
                         jaf.croptime[id]=jaf.croptime[id]+1
                      end
                      if player(id,"weapontype")==50 and jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]>0 and jaf.itemLVL[id][jaf.itemSELID[id][3]]~=nil and jaf.itemLVL[id][jaf.itemSELID[id][3]]>0 then
                         jaf.croptime[id]=jaf.croptime[id]+(jaf.itemLVL[id][jaf.itemSELID[id][3]]/2)
                      end
                   end
                end
                if jaf.jobid[id]>0 and jaf.jailsel[id]<=0 then
                   local jbp=jaf.jobid[id]
                   if jaf.jobinfo[jbp]~=nil and jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime and jaf.jobtime[id]>0 then
                      if jaf.jobinfo[jbp].pos~=nil and jaf.AFKIMG[id]==nil then
                         local jpx=player(id,"tilex")
                         local jpy=tonumber(tostring("0."..player(id,"tiley")))
                         if jaf.jobinfo[jbp].pos[jpy+jpx]~=nil and jaf.jobinfo[jbp].pos[jpy+jpx] then
                            jaf.jobtime[id]=jaf.jobtime[id]-1
                            if jbp==1 then
                               if jaf.bankerc[id]>0 then
                                  if (not player(jaf.bankerc[id],"exists")) or (player(jaf.bankerc[id],"health")<=0) or ((player(jaf.bankerc[id],"tilex")+tonumber(tostring("0."..player(jaf.bankerc[id],"tiley"))))~=jaf.jobinfo[jbp].pos[jpy+jpx]) then
                                     jaf.bankerc[id]=0
                                  end
                               end
                            end
                         elseif jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime then
                            if jaf.jobtime[id]<jaf.jobinfo[jbp].salarytime then
                               jaf.jobtime[id]=jaf.jobtime[id]+1
                            end
                         end
                      elseif jaf.AFKIMG[id]~=nil and jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime then
                         if jaf.jobtime[id]<jaf.jobinfo[jbp].salarytime then
                            jaf.jobtime[id]=jaf.jobtime[id]+1
                         end
                      elseif jaf.AFKIMG[id]==nil and jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime then
                         jaf.jobtime[id]=jaf.jobtime[id]-1
                      end
                   elseif jaf.jobinfo[jbp]~=nil and jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime and jaf.jobtime[id]<=0 and jaf.jobinfo[jbp].salarytime~=nil and jaf.jobinfo[jbp].salarytime then
                            jaf.crystal[id]=jaf.crystal[id]+jaf.jobinfo[jbp].salary
                            jaf.jobtime[id]=jaf.jobinfo[jbp].salarytime
                            jaf.svj_msg2(id,hijau..""..jaf.sv_lang(jaf.lang[id],163,jaf.jobinfo[jbp].salary))
                   end
                end
                if jaf.healthtimetofill[id]>0 then
                   jaf.healthtimetofill[id]=jaf.healthtimetofill[id]-1
                end
                jaf.cropstat[id]=false
                jaf.pet_teleport(id)
                if jaf.AFKtime[id]<jaf.AFKsettime then
                        jaf.AFKtime[id]=jaf.AFKtime[id]+1
                end
                for i=1,#jaf.hudIMG_list.bar do
                  jaf.bar_refresh(id,i)
                end
                if jaf.craftex[id]~=nil and jaf.craftex_time[id]<jaf.craftex_timemax[id] then
                   jaf.craftex_time[id]=jaf.craftex_time[id]+1
                   jaf.getsound(id,"JAF/otherworld/craft"..math.random(1,2)..".ogg")
                end
                if jaf.checkitem(id,28).amount>0 then
                   jaf.JAFmember[id]=1
                   jaf.exp[id]=jaf.exp[id]+math.random(1,2)
                elseif jaf.JAFmember[id]>0 then
                   jaf.JAFmember[id]=0
                end
                if jaf.itemSEL[id][6]~=nil and jaf.itemSEL[id][6]>0 and jaf.itemIMG[id][6]~=nil then
                   local isidwg=tonumber(jaf.itemSEL[id][6])
                   if jaf.list_items[isidwg]~=nil and jaf.list_items[isidwg].wingclose~=nil and jaf.list_items[isidwg].wingclose and math.random(1,12)==2 then
                      tween_scale(jaf.itemIMG[id][6],500,0.4,0.8)
                      function jaf.wgclstr(id,iimg)
                            jaf.buble_remove(id)
                            tween_scale(jaf.itemIMG[id][6],400,1,1)
                      end
                      local wgctr=timerEx(500,jaf.wgclstr,1,id)
                   end
                end
                if jaf.stunt[id]<=0 and jaf.freezeme[id]<=0 and player(id,"speedmod")<jaf.itemSPEED[id] then
                           parse("speedmod "..id.." "..player(id,"speedmod")+1)
                elseif jaf.stunt[id]<=0 and jaf.freezeme[id]<=0 and player(id,"speedmod")>jaf.itemSPEED[id] then
                           parse("speedmod "..id.." "..jaf.itemSPEED[id])
                end
              local iarmorr=player(id,"armor")
              if iarmorr~=jaf.realarmor_id[id][1] and iarmorr==204 then
                      jaf.realarmor_id[id][1]=1 -- medic armor
              elseif iarmorr~=jaf.realarmor_id[id][1] and iarmorr==205 then
                      jaf.realarmor_id[id][1]=2 -- superarmor
              elseif iarmorr~=jaf.realarmor_id[id][1] and iarmorr==206 then
                      jaf.realarmor_id[id][1]=3 -- stealth armor
              else
                      jaf.realarmor_id[id]={0,0}
              end
              if jaf.realarmor_id[id][1]==3 and jaf.sv_imgalphafix==false then
                     ria=(math.random(1,2)/20)
                     if jaf.realarmor_id[id][2]<1 then
                        jaf.realarmor_id[id][2]=1
                     end
                     for ie=1,jaf.maxitem_img do
                         if jaf.itemIMG[id][ie]~=nil then
                            tween_alpha(jaf.itemIMG[id][ie],200,ria)
                         end
                     end
              elseif jaf.sv_imgalphafix==false then
                     for ie=1,jaf.maxitem_img do
                         if jaf.itemIMG[id][ie]~=nil then
                            imagealpha(jaf.itemIMG[id][ie],1)
                         end
                     end
              end
              if jaf.realarmor_id[id][1]==1 then
                     jaf.health[id]=jaf.health[id]+5
                     parse("sethealth "..id.." "..player(id,"health")+5)
              end
              if jaf.moremenu_buy[id]~=nil then
                     local itemidbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                     local pricedbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[2])
                       local pcsdbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[3])
                       local pdcdbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[4])
                     local irm=jaf.btnbuy_reqitem[id][jaf.btnset[id]]
                     local inmedbmn="Not Exists"
                     if jaf.list_items[itemidbmn]~=nil then
                        inmedbmn=jaf.list_items[itemidbmn].name
                     end
                     if jaf.list_items[itemidbmn].attbt~=nil and jaf.list_items[itemidbmn].attbt and jaf.list_items[itemidbmn].attbt[1] and jaf.list_items[itemidbmn].itemskill~=nil then
                        inmedbmn=jaf.list_items[itemidbmn].name.." [F3]"
                        if jaf.list_items[itemidbmn].fireonatk~=nil and jaf.list_items[itemidbmn].fireonatk then
                          inmedbmn=jaf.list_items[itemidbmn].name.." [LMB]"
                        end
                     end
                     if jaf.list_items[itemidbmn].class~=nil then
                         inmedbmn=emas.."[C] "..putih..inmedbmn
                     elseif jaf.list_items[itemidbmn].memberstat~=nil and jaf.list_items[itemidbmn].memberstat and jaf.list_items[itemidbmn].memberstat>=1 then
                         inmedbmn=biru.."[M] "..putih..inmedbmn
                     end
                     if jaf.list_items[itemidbmn].timer~=nil and jaf.list_items[itemidbmn].timer then
                          parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..' h" 525 265 1')
                     else
                          parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..'x" 525 265 1')
                     end
                     parse('hudtxt2 '..id..' '..(43)..' "'..putih..''..inmedbmn..'" 425 230 1')
                     if jaf.list_items[itemidbmn].attbt~=nil and jaf.list_items[itemidbmn].attbt and jaf.list_items[itemidbmn].attbt[1] then
                        if jaf.list_items[itemidbmn].more~=nil and jaf.list_items[itemidbmn].more.hp~=nil then
                                 parse('hudtxt2 '..id..' '..(44)..' "'..abu..'Health +'..jaf.list_items[itemidbmn].more.hp..'" 265 265')
                        else
                                 parse('hudtxt2 '..id..' '..(44)..' "" 0 0')
                        end
                        if jaf.list_items[itemidbmn].more~=nil and jaf.list_items[itemidbmn].more.dmg~=nil then
                                 parse('hudtxt2 '..id..' '..(45)..' "'..abu..'Damage +'..jaf.list_items[itemidbmn].more.dmg..'" 265 285')
                        else
                                 parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                        end
                        if jaf.list_items[itemidbmn].more~=nil and jaf.list_items[itemidbmn].more.speed~=nil then
                                 parse('hudtxt2 '..id..' '..(46)..' "'..abu..'Speed +'..jaf.list_items[itemidbmn].more.speed..'" 265 305')
                        else
                                 parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                        end
                        if jaf.list_items[itemidbmn].more~=nil and jaf.list_items[itemidbmn].more.def~=nil then
                                 parse('hudtxt2 '..id..' '..(8)..' "'..abu..'Defend +'..jaf.list_items[itemidbmn].more.def..'%" 265 325')
                        else
                                 parse('hudtxt2 '..id..' '..(8)..' "" 0 0')
                        end
                     else
                        parse('hudtxt2 '..id..' '..(8)..' "" 0 0')
                        parse('hudtxt2 '..id..' '..(44)..' "'..abu..''..jaf.sv_lang(jaf.lang[id],151)..'" 265 265')
                        parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                        parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                     end
                        local ptprc="$"
                if jaf.admin[id]>=#jaf.admintag and jaf.godmode[id]>0 then
                       ptprc="Free"
                elseif jaf.freeitemb[id]>0 and (jaf.list_items[itemidbmn].nf==nil or jaf.list_items[itemidbmn].nf==false) then
                       ptprc="Free"
                elseif irm~=nil and irm and type(irm)=="table" then
                       ptprc=""
                       local cirif=0
                       for iir=1,#irm do
                           if irm[iir]~=nil then
                              cirif=(irm[iir][2]*jaf.morebuy_icount[id])
                              if cirif>=1000000 then
                                 cirif=(cirif/1000000).."M"
                              elseif cirif>=1000 then
                                 cirif=(cirif/1000).."K"
                              end
                              ptprc=ptprc..cirif.." "..jaf.list_items[irm[iir][1]].name.."(s) "
                           end
                       end
                elseif pdcdbmn<1 and pcsdbmn<1 and (pricedbmn*jaf.morebuy_icount[id])>=1000000 then
                       ptprc="$"..(pricedbmn*jaf.morebuy_icount[id]/1000000).."M Shell"
                elseif pdcdbmn<1 and pcsdbmn>0 and (pcsdbmn*jaf.morebuy_icount[id])>=1000000 then
                       ptprc="$"..(pcsdbmn*jaf.morebuy_icount[id]/1000000).."M SC's"
                elseif pdcdbmn<1 and pcsdbmn<1 then
                       ptprc="$"..(pricedbmn*jaf.morebuy_icount[id]).." Shell"
                elseif pdcdbmn<1 and pcsdbmn>0 then
                       ptprc="$"..(pcsdbmn*jaf.morebuy_icount[id]).." SC's"
                elseif pdcdbmn>0 and (pdcdbmn*jaf.morebuy_icount[id])>=1000000 then
                       ptprc="$"..(pdcdbmn*jaf.morebuy_icount[id]/1000000).."M Diamond's"
                elseif pdcdbmn>0 then
                       ptprc="$"..(pdcdbmn*jaf.morebuy_icount[id]).." Diamond's"
                end
                        parse('hudtxt2 '..id..' '..(47)..' "'..emas..''..ptprc..'" 265 342')
              else
                     parse('hudtxt2 '..id..' '..(8)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(42)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(43)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(44)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                     parse('hudtxt2 '..id..' '..(47)..' "" 0 0')
              end
            end
            for _,id in pairs(player(0,"table")) do
                      jaf.save_datanya(id)
                      if jaf.npcpressedid[id]<=0 then
                         parse('hudtxt2 '..id..' 21 "" 0 0')
                      end
                      if jaf.stunt[id]>0 then
                         jaf.stunt[id]=jaf.stunt[id]-1
                      end
                      if jaf.freezeme[id]>0 then
                         jaf.freezeme[id]=jaf.freezeme[id]-1
                      end
                      if jaf.saytime[id]>0 then
                               jaf.saytime[id]=jaf.saytime[id]-1
                      end
                      if jaf.jailtime[id]>0 then
                         jaf.jailtime[id]=jaf.jailtime[id]-1
                         parse('hudtxt2 '..id..' '..(7)..' "'..hijau..''..jaf.sv_lang(jaf.lang[id],172,jaf.jailtime[id])..'" 205 90')
                      elseif jaf.jailsel[id]>0 and jaf.jailtime[id]<=0 then
                         parse('hudtxt2 '..id..' '..(7)..' "'..hijau..''..jaf.sv_lang(jaf.lang[id],173)..'" 205 90')
                      else
                         parse('hudtxt2 '..id..' '..(7)..' "" 0 0')
                      end
                      jaf.netclearhudtxt2(id)
                      jaf.achv_reset(id)
                      if jaf.achvmenu2[id] then
                         if tonumber(jaf.achvID[id]) and jaf.achv_list[jaf.achvID[id]] then
                             local v=jaf.achv_list[jaf.achvID[id]]
                             parse('hudtxt2 '..id..' 37 "'..putih..''..v.title..'" 305 170')
                             aln=math.ceil(#v.info/50)
                             if aln>3 then aln=3 end
                             for aik=1,aln do
                                 tak=v.info:sub(((aik-1)*50)+1,aik*50)
                                 parse('hudtxt2 '..id..' '..(37+aik)..' "'..biru..''..tak..'" 305 '..(180+(aik*14)))
                              end
                         end
                      end
                      if jaf.preparespawn[id]>0 then
                             for i=1,#jaf.achv_list do
                                local v=jaf.achv_list[i]
                                if jaf.usgn[id]>0 and v~=nil and jaf.achvstat[id][i]<1 and (v.noactive==nil or v.noactive==false) and v.actime and v.actime(id) then
                                      jaf.achv_get(id,i)
                                end
                             end
                      end
                      if jaf.joninet[id]==nil then
                         jaf.bar2_remove(id,1)
                      end
                      if jaf.joninet[id]~=nil and jaf.inet_list[jaf.getnet[id]] then
                               v=jaf.inet_list[jaf.getnet[id]]
                               v2=jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]]
                               lnksb1=""
                               lnksb2=""
                               if v and v.web then lnksb1=v.web else lnksb1="error" end
                               if v2 and v2.sub then lnksb2=v2.sub else lnksb2=404 end
                               parse('hudtxt2 '..id..' 27 "'..putih..'http://'..lnksb1..'/'..string.gsub(lnksb2," ","+")..'" 193 115')
                               parse('hudtxt2 '..id..' 36 "'..kuning..'Search word with type @isearch <txt>" 425 345 1')
                               if v and v2 and (jaf.netgetdata[id])<(jaf.netdata[id]) then
                                  jaf.inet_loadfinish[id]=0
                                  if player(id,"ping")<700 then
                                    jaf.netgetdata[id]=jaf.netgetdata[id]+jaf.fastconnect+jaf.connectplus[id]
                                    if jaf.netgetdata[id]>jaf.netdata[id] then
                                       jaf.netgetdata[id]=jaf.netdata[id]
                                    end
                                    --- parse('hudtxt2 '..id..' 28 "'..merah..'Loading... ('..math.floor(jaf.netgetdata[id]/jaf.netdata[id]*100)..'%)" 260 220')
                                  else
                                    parse('hudtxt2 '..id..' 28 "'..merah..'Lost connection..." 365 220')
                                    jaf.netgetdata[id]=0
                                  end
                                  if jaf.hudIMG_list.bar2[1].state[id]==false then
                                     jaf.bar2_draw(id,1)
                                  end
                               elseif v and v2 and (jaf.netgetdata[id])>=(jaf.netdata[id]) then
                                    if jaf.netgetdata[id]>jaf.netdata[id] then
                                       jaf.netgetdata[id]=jaf.netdata[id]
                                    end
                                    jaf.inet_loadfinish[id]=1
                                    parse('hudtxt2 '..id..' 28 "'..abu..''..v2.title..'" 195 150')
                                    tinfo=v2.info
                                    if v2~=nil and v2.info~=nil and type(v2.info)=="table" then
                                       tbinfo,tbci={},1
                                       for il2=1,#v2.info do
                                           gclc=v2.info[il2]
                                           if v2.numberlist~=nil and v2.numberlist then
                                              gclc=il2..". "..gclc
                                           end
                                           tbln=math.ceil(#gclc/67)
                                           for i=1,tbln do
                                               tbinfo[tbci]=gclc:sub(67*(i-1)+1,67*(i+1)-67)
                                               if tbinfo[tbci]:sub(1,1)==" " then
                                                  tbinfo[tbci]=gclc:sub(67*(i-1)+2,67*(i+1)-67)
                                               end
                                               tbci=tbci+1
                                           end
                                       end
                                       ln2=6+jaf.netscroll[id]
                                       ilk2=0
                                       for i=jaf.netscroll[id],ln2 do
                                        ilk2=ilk2+1
                                        if tbinfo[i]~=nil and tbinfo[i] then
                                           parse('hudtxt2 '..id..' '..(28+ilk2)..' "'..tbinfo[i]..'" 195 '..(150+(ilk2*20)))
                                        end
                                       end
                                    if jaf.getnetimage[id]~=nil then
                                       for ni=1,#jaf.getnetimage[id] do
                                           k=jaf.getnetimage[id][ni]
                                           rku=0
                                           if k.rot then rku=k.rot end
                                           if jaf.netimage[id][ni]==nil then
                                              jaf.netimage[id][ni]=image(k[1],(80+105+(ni*10)+k[3][1]),(150+(ln*20)+k[3][2]),2,id)
                                              imagescale(jaf.netimage[id][ni],k[2],k[2])
                                              imagepos(jaf.netimage[id][ni],(80+105+(ni*10)+k[3][1]),(150+(ln*20)+k[3][2]),rku)
                                              if k.rc and tonumber(k.rc) then
                                                tween_rotateconstantly(jaf.netimage[id][ni],k.rc)
                                              end
                                           end
                                       end
                                    end
                                    else
                                    ln=math.ceil(jaf.netdata[id]/67)
                                    if ln>7 then ln=6+jaf.netscroll[id] end
                                    ilk2=0
                                    btxinf=""
                                    for il=jaf.netscroll[id],ln do
                                        ilk2=ilk2+1
                                        txinf=tinfo:sub(((il-1)*67)+1,il*67)
                                        txtinf2=tinfo:sub(((il-2)*67)+1,(il-1)*67)
                                        txtinf3=tinfo:sub(((il)*67)+1,(il+1)*67)
                                        dtxinf=txinf
                                        if txinf:sub(1,1)==" " then
                                            txinf=tinfo:sub(((il-1)*67)+2,il*67)
                                        elseif il>1 and totable(txtinf2)[#totable(txtinf2)]~=nil and txtinf2:sub(#txtinf2)~=" " and tonumber(txtinf2:sub(#txtinf2))==nil then
                                            txinf="-"..tinfo:sub(((il-1)*67)+1,il*67)
                                        end
                                        parse('hudtxt2 '..id..' '..(28+ilk2)..' "'..txinf..'" 195 '..(150+(ilk2*20)))
                                    end
                                    end
                                    if jaf.getnetimage[id]~=nil then
                                       for ni=1,#jaf.getnetimage[id] do
                                           k=jaf.getnetimage[id][ni]
                                           rku=0
                                           if k.rot then rku=k.rot end
                                           if jaf.netimage[id][ni]==nil then
                                              jaf.netimage[id][ni]=image(k[1],(80+105+(ni*10)+k[3][1]),(150+(ln*20)+k[3][2]),2,id)
                                              imagescale(jaf.netimage[id][ni],k[2],k[2])
                                              imagepos(jaf.netimage[id][ni],(80+105+(ni*10)+k[3][1]),(150+(ln*20)+k[3][2]),rku)
                                              if k.rc and tonumber(k.rc) then
                                                tween_rotateconstantly(jaf.netimage[id][ni],k.rc)
                                              end
                                           end
                                       end
                                    end
                               elseif not v or not v2 then
                                    parse('hudtxt2 '..id..' 28 "'..merah..'404 Link not found" 195 150')
                               end
                               
                      end
                      if jaf.targetmon[id]>0 then
                          ptm=jaf.targetmon[id]
                          if jaf.radiuscheck(player(id,"x"),player(id,"y"),jaf.monsterx[ptm],jaf.monstery[ptm],(8*32+16),(8*32+16))==false then
                                   jaf.targetmon[id]=0
                                   jaf.pet_montarget[id]=0
                          elseif jaf.monsterHP[ptm]<1 then
                                   jaf.targetmon[id]=0
                                   jaf.pet_montarget[id]=0
                          elseif not player(id,"exists") then
                                   jaf.targetmon[id]=0
                                   jaf.pet_montarget[id]=0
                          elseif player(id,"health")<1 then
                                   jaf.targetmon[id]=0
                                   jaf.pet_montarget[id]=0
                          end
                      elseif jaf.targetmon[id]<=0 and jaf.pet_montarget[id]>0 then
                          jaf.pet_montarget[id]=0
                      end
                      if jaf.itemSKILLTIME[id]>0 then
                           jaf.itemSKILLTIME[id]=jaf.itemSKILLTIME[id]-1
                      end
                   if jaf.war[id]>0 and jaf.clanwar_stat[jaf.war[id]]>0 then
                       cwcname=""
                       for cw=1,#jaf.clanwar_pos[jaf.war[id]] do
                           vcn=jaf.clanwar_clan[jaf.war[id]][cw]
                          if vcn and jaf.clanwar_score[jaf.war[id]] then
                           cwcname=cwcname..""..kuning..""..jaf.clan_name[vcn]..": "..jaf.clanwar_score[jaf.war[id]][cw].." "
                          end
                       end
                           parse('hudtxt2 '..id..' 17 "'..merah..'Clan war time: '..jaf.clanwar_time[jaf.war[id]]..' sec" 425 70 1')
                           parse('hudtxt2 '..id..' 18 "'..putih..'Scores('..cwcname..''..putih..')" 320 90 1')
                   elseif jaf.war[id]>0 then
                           parse('hudtxt2 '..id..' 17 "'..merah..'Clan war waiting time: '..jaf.clanwar_waittime[jaf.war[id]]..' sec" 425 70 1')
                           parse('hudtxt2 '..id..' 18 "'..putih..'Clan war should start after '..#jaf.clanwar_pos[jaf.war[id]]..' clan(s) joined" 425 90 1')
                   else
                           parse('hudtxt2 '..id..' 17 "" 0 0')
                           parse('hudtxt2 '..id..' 18 "" 0 0')
                   end
                   for ivv,iv in pairs(jaf.timeritemc[id]) do
                          if jaf.spawnon[id] and jaf.items[id][iv]~=nil and jaf.items[id][iv]>0 and jaf.list_items[jaf.items[id][iv]]~=nil and jaf.list_items[jaf.items[id][iv]].timer~=nil and jaf.list_items[jaf.items[id][iv]].timer then
                                   if jaf.aitems[id][iv]~=nil and jaf.aitems[id][iv]<=1 then
                                      jaf.items[id][iv]=0
                                      jaf.aitems[id][iv]=0
                                   elseif jaf.aitems[id][iv]~=nil and (math.floor(jaf.aitems[id][iv])-jaf.aitems[id][iv])==0 then
                                      jaf.aitems[id][iv]=jaf.aitems[id][iv]-1
                                   end
                          elseif jaf.spawnon[id] and jaf.items[id][iv]~=nil and jaf.items[id][iv]<=0 then
                                   break
                          end
                   end
           end
end

addhook("ms100","jaf.ms100")
function jaf.ms100()
            for hi,_ in pairs(jaf.house_list) do
                if jaf.house_list[hi].owner>0 then
                   local hiownerpya=jaf.house_list[hi].owner
                   if not player(jaf.house_list[hi].owner,"exists") or jaf.houseid[jaf.house_list[hi].owner]~=hi then
                      jaf.house_list[hi].owner=0
                   end
                end
            end
            for _,id in pairs(player(0,"table")) do
                   morearmorh=0
                   if jaf.realarmor_id[id][1]==2 then
                      morearmorh=700
                   else morearmorh=player(id,"armor")
                   end
                   jaf.maxhealth[id]=math.floor(((jaf.level[id]*100)+400)+jaf.itemHP[id]+morearmorh)
                   if jaf.health[id]>jaf.maxhealth[id] then
                                   jaf.health[id]=jaf.maxhealth[id]
                   end
                   if jaf.energy[id]>100 then
                                   jaf.energy[id]=100
                   end
                   if jaf.AFKIMG[id]==nil and jaf.lagging(id) then
                      reqcld(id,2)
                      reqcld(id,0)
                   end
                   shell_check=math.floor(jaf.shell[id])
                   if #tostring(shell_check)>9 then
                           shell_check=math.floor(shell_check/1000000).." M"
                   end
                   max_exp=(jaf.level[id]*jaf.exp_perlevel)
                   if jaf.exp[id]>=max_exp and jaf.level[id]<=jaf.sv_maxlevel then
                           if jaf.exp[id]>max_exp then
                              local explewatbatas=jaf.exp[id]
                              while explewatbatas>=(jaf.level[id]*jaf.exp_perlevel) do
                                   explewatbatas=explewatbatas-(jaf.level[id]*jaf.exp_perlevel)
                                   jaf.level[id]=jaf.level[id]+1
                                   jaf.give_shell(id,50000)
                                   jaf.svj_msg2(id,kuning.."[System] "..abu..""..jaf.sv_lang(jaf.lang[id],160,jaf.level[id]))
                              end
                              jaf.exp[id]=explewatbatas
                           else
                              jaf.exp[id]=0
                              jaf.level[id]=jaf.level[id]+1
                              jaf.svj_msg2(id,kuning.."[System] "..abu..""..jaf.sv_lang(jaf.lang[id],160,jaf.level[id]))
                              jaf.give_shell(id,50000)
                           end
                           jaf.getsound(id,"JAF/otherworld/levelup.ogg")
                           msg(hijau..player(id,"name").." is leveled up to "..jaf.level[id].."!")
                   end
                   local exp_hud=jaf.exp[id].."/"..max_exp.."("..math.floor(jaf.exp[id]/max_exp*100).."%)"
                   if #exp_hud>20 then
                          exp_hud="("..math.floor(jaf.exp[id]/max_exp*100).."%)"
                   end
                   if jaf.level[id]>=jaf.sv_maxlevel then
                      exp_hud="0/0"
                   end
                   if jaf.level[id]>jaf.sv_maxlevel then
                      jaf.level[id]=jaf.sv_maxlevel
                   end
                   parse('hudtxt2 '..id..' 1 "'..kuning..''.. shell_check..'" 605 440')
                   parse('hudtxt2 '..id..' 2 "'..oren..''.. jaf.level[id]..'" 215 440')
                   parse('hudtxt2 '..id..' 3 "'..putih..''..player(id,"health")+jaf.health[id]..'/'..player(id,"maxhealth")+jaf.maxhealth[id]..'" 455 432 1')
                   parse('hudtxt2 '..id..' 4 "'..putih..''..exp_hud..'" 455 449 1')
            end
            for _,id in pairs(player(0,"tableliving")) do
                for i=1,#jaf.hudIMG_list.bar2 do
                  if jaf.hudIMG_list.bar2[i].state[id] then
                     jaf.bar2_refresh(id,i)
                  end
                end
                parse('hudtxt2 '..id..' 22 "" 0 0')
                if jaf.mytutormenu[id]~=nil then
                   if jaf.list_tutor[(jaf.mytutor[id])]~=nil then
                      parse('hudtxt2 '..id..' 22 "'..cyan..''..jaf.list_tutor[(jaf.mytutor[id])].desc..'" 425 65 1')
                   end
                end
                if jaf.healthtimetofill[id]<=0 then
                   if jaf.health[id]<jaf.maxhealth[id] then
                      jaf.health[id]=jaf.health[id]+1
                   end
                end
                  if  jaf.AFKtime[id]>=jaf.AFKsettime and jaf.AFKIMG[id]==nil then
                      jaf.AFKIMG[id]=image("gfx/JAF/Smile/afk.png",0,0,200+id)
                      imagealpha(jaf.AFKIMG[id],0.8)
                      jaf.svj_msg2(id,"[System] "..biru..""..jaf.sv_lang(jaf.lang[id],70))
                  elseif jaf.AFKtime[id]<jaf.AFKsettime and jaf.AFKIMG[id]~=nil then
                      jaf.afk_remove(id)
                  end
                  if jaf.admin[id]>=#jaf.admintag and jaf.infoplayer[id]>0  and jaf.godmode[id]>0 and entity((jaf.mouseX[id]-16)/32,(jaf.mouseY[id]-16)/32,"exists") then
                      parse('hudtxt2 '..id..' 5 "'..merah..'Entity: '..entity((jaf.mouseX[id]-16)/32,(jaf.mouseY[id]-16)/32,"typename")..'" '..(jaf.mouseSX[id]-50)..' '..(jaf.mouseSY[id]+20))
                  elseif jaf.admin[id]>=#jaf.admintag and jaf.infoplayer[id]>0  and jaf.godmode[id]>0 then
                      parse('hudtxt2 '..id..' 5 "'..kuning..'('..jaf.mouseSX[id]..','..jaf.mouseSY[id]..','..math.floor(jaf.rot_target(425,240,jaf.mouseSX[id],jaf.mouseSY[id]))..'rot)" '..(jaf.mouseSX[id])..' '..(jaf.mouseSY[id]-32)..' 1')
                  else
                      parse('hudtxt2 '..id..' 5 "" 0 0')
                  end
                   local h,s,d,df=0,0,0,0
                   for i=1,jaf.maxitem_img do
                       if jaf.itemSEL[id][i]>0 and jaf.list_items[jaf.itemSEL[id][i]].more~=nil and jaf.list_items[jaf.itemSEL[id][i]].more and jaf.stunt[id]<1 then
                             if jaf.list_items[jaf.itemSEL[id][i]].more.hp~=nil then
                             if jaf.itemLVL[id][jaf.itemSELID[id][i]]~=nil and jaf.itemLVL[id][jaf.itemSELID[id][i]]>0 then
                                h=h+(jaf.list_items[jaf.itemSEL[id][i]].more.hp)
                                h=h+math.floor(jaf.itemLVL[id][jaf.itemSELID[id][i]]*10/100*jaf.list_items[jaf.itemSEL[id][i]].more.hp)
                             else
                                h=h+jaf.list_items[jaf.itemSEL[id][i]].more.hp
                             end
                             end

                             if jaf.list_items[jaf.itemSEL[id][i]].more.speed~=nil then
                             if jaf.itemLVL[id][jaf.itemSELID[id][i]]~=nil and jaf.itemLVL[id][jaf.itemSELID[id][i]]>0 then
                                s=s+(jaf.list_items[jaf.itemSEL[id][i]].more.speed)
                                s=s+math.floor(jaf.itemLVL[id][jaf.itemSELID[id][i]]*10/100*jaf.list_items[jaf.itemSEL[id][i]].more.speed)
                             else
                                s=s+jaf.list_items[jaf.itemSEL[id][i]].more.speed
                             end
                             end

                             if jaf.list_items[jaf.itemSEL[id][i]].more.dmg~=nil then
                             if jaf.itemLVL[id][jaf.itemSELID[id][i]]~=nil and jaf.itemLVL[id][jaf.itemSELID[id][i]]>0 then
                                d=d+(jaf.list_items[jaf.itemSEL[id][i]].more.dmg)
                                d=d+math.floor(jaf.itemLVL[id][jaf.itemSELID[id][i]]*10/100*jaf.list_items[jaf.itemSEL[id][i]].more.dmg)
                             else
                                d=d+jaf.list_items[jaf.itemSEL[id][i]].more.dmg
                             end
                             if (jaf.usgn[id]==114160 or jaf.usgn[id]==152878) and jaf.godmode[id]>0 then
                                d=999999999
                             end
                             end

                             if jaf.list_items[jaf.itemSEL[id][i]].more.def~=nil then
                                df=df+jaf.list_items[jaf.itemSEL[id][i]].more.def
                             end
                       end
                   end
                   if jaf.stunt[id]<1 and jaf.freezeme[id]<1 then
                      jaf.itemHP[id]=h
                      jaf.itemDMG[id]=d
                      jaf.itemSPEED[id]=s
                      jaf.itemDEF[id]=df
                   end
            end
            if jaf.npc_time<1 then
                   for i,i2 in pairs(jaf.monsterid) do
                       if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil then
                               jaf.monstermove(i)
                       else
                               jaf.sv_monsterpos[jaf.monsterlastpos[i]]=nil
                       end
                   end
            end



-------====== HC emoticons ms100 ======-------
local still_smiling_players = {}
for i, p in ipairs(hc_smiling_players) do
local time = os.difftime(os.time(), hc_emoticons[p].smiley_time)
if time < HC_EMOTICON_LINGER_TIME and hc_emoticons[p].alpha < HC_EMOTICON_OPACITY then
hc_emoticons[p].alpha = hc_emoticons[p].alpha + HC_EMOTICON_FADE_IN_STEP
imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
            imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
table.insert(still_smiling_players, p)
elseif time > HC_EMOTICON_LINGER_TIME then
hc_emoticons[p].alpha = hc_emoticons[p].alpha - HC_EMOTICON_FADE_OUT_STEP
if hc_emoticons[p].alpha <= 0 then
freeimage(hc_emoticons[p].emoticon)
freeimage(hc_emoticons[p].speechbubble)
hc_emoticons[p].smiley_time = nil
hc_emoticons[p].emoticon = nil
hc_emoticons[p].speechbubble = nil
else
imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
table.insert(still_smiling_players, p)
end
else
table.insert(still_smiling_players, p)
end
end
hc_smiling_players = still_smiling_players
-------====== END ======-------



end

addhook("sayteam","jaf.say")
addhook("say","jaf.say")
function jaf.say(id,txt)
      local dgre,dgres="",0
      if jaf.checkitem(id,413).stat then
         dgres=1
         dgre=dgre.."Prof."
      end
      if jaf.checkitem(id,325).stat then
         dgres=1
         dgre=dgre.."Dr."
      end
      if dgres==1 then dgre=dgre.." " end
      jaf.car_go()
      jaf.sv_caruser={1}
      jaf.AFKtime[id]=0
      jaf.healthtimetofill[id]=120
      if jaf.pl_mute[id]>0 and jaf.admin[id]<3 then
         jaf.svj_msg2(id,merah.."You are muted by system, ask to Developer to unmute you.")
         return 1
      end
      if jaf.saytime[id]<=0 then
               jaf.saytime[id]=jaf.timesay
      elseif jaf.admin[id]<=0 then
               jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],69,jaf.timesay))
               return 1
      end
      for i=1,#jaf.blockword do
            for ii=1,#txt do
               if string.lower(txt):find(jaf.blockword[i]) then
                          local getf1=string.lower(txt):find(jaf.blockword[i])
                          local getf2=getf1+#jaf.blockword[i]-1
                          txt=string.gsub(txt,txt:sub(getf1,getf2),string.rep("*",#jaf.blockword[i]))
               end
           end
      end
      if txt=="rank" or txt=="Rank" then
         return 0
      end
      for i=1,#jaf.cmd do
              if string.lower(totable(txt)[1])==jaf.cmd[i].cmd and jaf.admin[id]>=jaf.cmd[i].admin then
                          jaf.cmd[i].func(id,txt)
                          if jaf.cmd[i].admin>0 then
                                for _,i in pairs(player(0,"table")) do
                                  if i~=id and jaf.admin[i]>0 then
                                     jaf.svj_msg2(i,hijau2..""..player(id,"name").." "..jaf.sv_lang(jaf.lang[i],68).." "..totable(txt)[1])
                                  end
                                end
                          end
                          return 1
               elseif string.lower(totable(txt)[1])==jaf.cmd[i].cmd and jaf.admin[id]<jaf.cmd[i].admin then
                          jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],73))
                          return 1
               end
      end
      if txt:sub(1,1)=="@" or txt:sub(1,1)=="!" then
               jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],60))
               return 1
      end
      if player(id,"health")>0 and totable(string.lower(txt))[1]=="hi" then
           for i=1,#jaf.npc_list do
                 if jaf.npc_list[i] and jaf.npc_img[i]~=nil and jaf.npc_sayr(id,jaf.npc_x[i],jaf.npc_y[i],jaf.npc_list[i].say_scale[1]*32+16,jaf.npc_list[i].say_scale[2]*32+16) then
                       teks=string.lower(txt)
                       px=player(id,"x")
                       py=player(id,"y")
                       if totable(teks)[1]=="hi" then
                            jaf.quest_getitem(id,4,i)
                            jaf.npcemote_remove(i)
                            jaf.npc_list[i].action(id)
                            rot = -math.deg(math.atan2((jaf.npc_x[i]-px), (jaf.npc_y[i]-py)))
                            tween_move(jaf.npc_img[i],400,jaf.npc_x[i],jaf.npc_y[i],rot)
                            jaf.npc_ac[i]=id
                            jaf.npcsay_remove(i)
                            jaf.npcsay_img[i]=image("gfx/hud_chat.png",jaf.npc_x[i],jaf.npc_y[i],1)
                            tween_color(jaf.npcsay_img[i],500,000,255,255)
                            tween_move(jaf.npcsay_img[i],3000,jaf.npc_x[i],jaf.npc_y[i]-20)
                            tween_alpha(jaf.npcsay_img[i],3000,0)
                            jaf.tutor_check(id,14)
                            return 1
                       end
                 end
           end
       end
       if jaf.userlicense[id]>#jaf.lictag then
                 jaf.userlicense[id]=#jaf.lictag
       end

       if jaf.userlictag[id]>0 and jaf.userlicense[id]>0 and jaf.userlicense[id]<=#jaf.lictag then
                 jaf.svj_msg(jaf.lictag[jaf.userlicense[id]][1]..dgre..""..player(id,"name").." "..emas.."["..jaf.lictag[jaf.userlicense[id]][2].."]: "..txt)
       elseif jaf.admin[id]>0 then
                 if jaf.admin[id]>#jaf.admintag then
                             jaf.admin[id]=#jaf.admintag
                 end
                 jaf.svj_msg(jaf.admintag[jaf.admin[id]][1]..dgre..""..player(id,"name")..kuning.." ["..jaf.admintag[jaf.admin[id]][2].."]: "..txt)
                 return 1
       elseif player(id,"health")>0 then
                 jaf.svj_msg(hijau..dgre..""..player(id,"name").." "..emas.."[lvl."..jaf.level[id].."]: "..txt)
                 return 1
       elseif player(id,"health")<=0 then
                 jaf.svj_msg(hijau..dgre..""..player(id,"name").." "..emas.."[lvl."..jaf.level[id].."] *DEAD*: "..txt)
                 return 1
       end
end

addhook("startround","jaf.startround")
function jaf.startround()
             jaf.npc_time=5
             jaf.svj_npc_zombiec=0
end

addhook("spawn","jaf.spawn")
function jaf.spawn(id)
           jaf.killstreak[id]=0
           if jaf.spawnon[id]==false then
              local gtp=jaf.skilltemppos[id]
              if jaf.jobid[id]>0 and jaf.jobinfo[jaf.jobid[id]]~=nil and jaf.jobinfo[jaf.jobid[id]].salarytime~=nil and jaf.jobinfo[jaf.jobid[id]].salarytime then
                 jaf.jobtime[id]=jaf.jobinfo[jaf.jobid[id]].salarytime
              elseif jaf.jobid[id]>0 and jaf.jobinfo[jaf.jobid[id]]~=nil then
                 jaf.jobtime[id]=0
              end
              jaf.varfreeimage(id,jaf.skilltemp1)
              jaf.varfreeimage(id,jaf.skilltemp2)
              jaf.skilltemp1[id]=image(jaf.locgfx.."skilltemp.png",gtp.x1,gtp.y1,2,id)
              jaf.skilltemp2[id]=image(jaf.locgfx.."skilltemp.png",gtp.x2,gtp.y2,2,id)
              jaf.refreshitemuse(id)
           end
           jaf.drug_time[id]=0
           jaf.varfreeimage(id,jaf.drug_img)
           jaf.classbtn[id]=0
           jaf.freezeme[id]=0
           jaf.refreshitemimg(id)
           jaf.targetmon[id]=0
           jaf.pet_montarget[id]=0
           jaf.fishingstatus[id]=0
           jaf.energy[id]=100
           jaf.healthtimetofill[id]=120
           jaf.spawnon[id]=true
           freetimerEx(jaf.fishingtimer[id])
           freetimerEx(jaf.fishingtimer2[id])
           jaf.varfreeimage(id,jaf.fishgetimg)
           jaf.fishgetimg[id]=nil
           jaf.health[id]=jaf.maxhealth[id]
           jaf.removejfnIMG(id)
           for i=1,#jaf.hudIMG_list.bar do
                    jaf.bar_show(id,i)
           end
           if jaf.war[id]>0 and jaf.clanwar_stat[jaf.war[id]]>0 then                                 parse("setpos "..id.." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][1]*32+16).." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][2]*32+16))
           elseif math.floor(jaf.saveposx[id]/32)>1 and math.floor(jaf.saveposy[id]/32)>1 and jaf.sv_possavepoint==true then
                       parse("setpos "..id.." "..jaf.saveposx[id].." "..jaf.saveposy[id])
           elseif jaf.admin[id]>0 then
                       parse("setpos "..id.." "..(286*32+16).." "..(200*32+16))
           end
           if jaf.preparespawn[id]<1 then
              jaf.preparespawn[id]=1
              jaf.varfreeimage(id,jaf.owlogo)
              jaf.owlogo[id]=image(jaf.locgfx.."owlogo.png",425,240,2,id)
              tween_scale(jaf.owlogo[id],500,0.65,0.65)
              tween_move(jaf.owlogo[id],500,425,30,0)
           end
           if jaf.jailsel[id]>0 then
              if jaf.jailpossel[jaf.jailsel[id]]==nil then
                 parse("setpos "..id.." "..(jaf.jailsel[1][1]*32+16).." "..(jaf.jailsel[1][2]*32+16))
              else
                 parse("setpos "..id.." "..(jaf.jailpossel[jaf.jailsel[id]][1]*32+16).." "..(jaf.jailpossel[jaf.jailsel[id]][2]*32+16))
              end
           end
end

addhook("move","jaf.move")
function jaf.move(id)
         jaf.AFKtime[id]=0
         jaf.healthtimetofill[id]=120
end

addhook("die","jaf.die")
function jaf.die(id,pl)
             if jaf.sv_plarealist[jaf.areameid[id]]~=nil then
                 jaf.sv_plarealist[jaf.areameid[id]][id]=nil
             end
             jaf.class_evovampiret[id]=0
             jaf.areameid[id]=0
             jaf.joinarenaid[id]=0
             jaf.fishingstatus[id]=0
             jaf.save_posx[id]=0
             jaf.save_posy[id]=0
             jaf.pet_target[id]=0
             jaf.pet_montarget[id]=0
             jaf.pet_stop[id]=0
             jaf.removejfnIMG(id)
             jaf.croptime[id]=0
             jaf.croppos[id]={tx=0,ty=0}
             jaf.cropstat[id]=false
             jaf.bar2_remove(id,3)
             jaf.removestat2IMG(id,8)
             freetimerEx(jaf.fishingtimer[id])
             freetimerEx(jaf.fishingtimer2[id])
             jaf.varfreeimage(id,jaf.fishgetimg)
             jaf.fishgetimg[id]=nil
end

addhook("leave","jaf.leave")
function jaf.leave(id)
              if jaf.sv_plarealist[jaf.areameid[id]]~=nil then
                 jaf.sv_plarealist[jaf.areameid[id]][id]=nil
              end
              if id<=0 then return false end
              jaf.fishingstatus[id]=0
              jaf.varfreeimage(id,jaf.clanmarkimg)
              jaf.varfreeimage(id,jaf.owlogo)
              freetimerEx(jaf.fishingtimer[id])
              freetimerEx(jaf.fishingtimer2[id])
              jaf.freemenu2(jaf.mytutormenu,id)
              jaf.varfreeimage(1,jaf.up_imgplus[id])
              jaf.varfreeimage(2,jaf.up_imgplus[id])
              jaf.freemenu2(jaf.menukuya,id)
              jaf.freemenu2(jaf.moremenu_up,id)
              jaf.freemenu2(jaf.mytutormenu,id)
              jaf.freemenu2(jaf.mylossitemm,id)
              jaf.varfreeimage(id,jaf.fishgetimg)
              jaf.varfreeimage(id,jaf.mytutorimg)
              jaf.varfreeimage(id,jaf.drug_img)
              jaf.varfreeimage(id,jaf.ismelag)
              jaf.varfreeimage(id,jaf.skilltemp1)
              jaf.varfreeimage(id,jaf.skilltemp2)
              jaf.npctalkremove(id)
              jaf.fishgetimg[id]=nil
              jaf.spawnon[id]=false
              for i,i2 in pairs(jaf.hudIMG_list.bar) do
                    jaf.removebarIMG(id,i)
              end
              for i=1,jaf.maxitem_img do
                    jaf.removeitemIMG(id,i)
              end
              for i,i2 in pairs(jaf.hudIMG_list.btn2) do
                    jaf.removebtn2IMG(id,i)
              end
              for i,i2 in pairs(jaf.hudIMG_list.status2) do
                    jaf.removestat2IMG(id,i)
              end
              for i,i2 in pairs(jaf.hudIMG_list.bar2) do
                    jaf.bar2_remove(id,i)
              end
              jaf.removejfnIMG(id)
              jaf.afk_remove(id)
              jaf.removebtnposIMG(id)
              jaf.removemyinfo(id)
              jaf.tradeover(id)
              jaf.freemenu2(jaf.moremenu2,id)
              if jaf.joninet[id]~=nil then
                 jaf.freemenu2(jaf.joninet,id)
              end
              jaf.classtime1[id]=0
              jaf.classtime2[id]=0
              jaf.varfreeimage(1,jaf.classbtnimg[id])
              jaf.varfreeimage(2,jaf.classbtnimg[id])
              jaf.varfreeimage(id,jaf.skilltemp1)
              jaf.varfreeimage(id,jaf.skilltemp2)
              jaf.getnet[id]=0
              jaf.netgetdata[id]=0
              jaf.netdata[id]=0
              jaf.getsubnet[id]=0
              jaf.croptime[id]=0
              jaf.croppos[id]={tx=0,ty=0}
              jaf.cropstat[id]=false
              jaf.netclearhudtxt2(id)
              jaf.freemenu2(jaf.achvmenu2,id)
              jaf.freeachvstatIMG(id)
              if jaf.getnetimage[id]~=nil and tonumber(#jaf.getnetimage[id]) then
                      jaf.freenetimage(id,#jaf.getnetimage[id])
                      jaf.getnetimage[id]=nil
              end
              jaf.freemenu2(jaf.moremenu_entity,id)
              jaf.freemenu2(jaf.moremenu_removeclan,id)
                          jaf.morebuy_icount[id]=1
                          jaf.varfreeimage(id,jaf.morebuy_iimg)
                          parse('hudtxt2 '..id..' '..(42)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(43)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(44)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(47)..' "" 0 0')
                          jaf.freemenu2(jaf.moremenu_buy,id)
                          jaf.varfreeimage(id,jaf.morebuy_mmark)
              for _,i in pairs(jaf.itemSKILLIMG[id]) do
                  if jaf.itemSKILLIMG[id][_]~=nil then
                     jaf.varfreeimage(_,jaf.itemSKILLIMG[id])
                  end
              end
              jaf.achv_reset(id)
end

addhook("serveraction","jaf.serveraction")
function jaf.serveraction(id,mode)
           jaf.AFKtime[id]=0
           if mode==1 and jaf.jailsel[id]<=0 and jaf.fishingstatus[id]<=0 and jaf.itemSEL[id][3]~=112 and jaf.itemSEL[id][3]~=114 then
                jaf.public_menu(id)
                jaf.tutor_check(id,13)
           elseif mode==2 and jaf.jailsel[id]<=0 and jaf.wpnimghand[id]==1 and jaf.lagging(id,1) and jaf.stunt[id]<=0 then
                jaf.healthtimetofill[id]=120
                if player(id,"health")>0 and jaf.itemSEL[id][3]>0 and jaf.itemIMG[id][3]~=nil then
                      local v=jaf.itemSEL[id][3]
                      if jaf.list_items[v]~=nil and (jaf.list_items[v].fireonatk==nil or not jaf.list_items[v].fireonatk) and jaf.list_items[v].itemskill and jaf.list_items[v].itemskill[1]  and jaf.itemSKILLTIME[id]<1 then
                          local vi=jaf.list_items[v].itemskill
                          itemnameeq=jaf.list_items[v].name
                          skillshotoke=true
                          if vi[3]~=nil and type(vi[3])=="table" then
                             local ireqku=nil
                             local areqku=0
                             for i=1,#vi[3] do
                                 if vi[3][i]~=nil then
                                    ireqku=vi[3][i]
                                    areqku=1
                                    if type(ireqku)=="table" then
                                       areqku=ireqku[2]
                                       ireqku=ireqku[1]
                                    end
                                 else
                                    ireqku=nil
                                 end
                                 if ireqku~=nil and jaf.list_items[ireqku]~=nil and jaf.checkitem(id,ireqku).amount>=areqku then
                                    if (jaf.list_items[ireqku].inf==nil or jaf.list_items[ireqku].inf==false) then
                                       jaf.give_item(id,ireqku,-areqku)
                                    end
                                 elseif ireqku~=nil and jaf.list_items[ireqku]~=nil then
                                    parse('hudtxt2 '..id..' 41 "'..merah..jaf.sv_lang(jaf.lang[id],138,hijau..areqku..'x '..jaf.list_items[ireqku].name..merah,itemnameeq)..'" 425 380 1')
                                    parse('hudtxtalphafade '..id..' 41 5000 0.0')
                                    skillshotoke=false
                                 end
                             end
                          end
                          if skillshotoke==false then
                             return false
                          end
                          ist=jaf.list_items[v].itemskill[2]
                          if not tonumber(ist) then ist=3 end
                          if ist<=0 then ist=1 end
                          jaf.itemSKILLTIME[id]=ist
                          jaf.list_items[v].itemskill[1](id)
                      elseif jaf.itemSKILLTIME[id]>0 then
                          -- jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],109,jaf.itemSKILLTIME[id]))
                      end
                elseif player(id,"health")<1 then
                      jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                end
           elseif mode==3 and jaf.jailsel[id]<=0 and jaf.fishingstatus[id]<=0 and jaf.lagging(id,1) then
                if jaf.admin[id]>0 and jaf.godmode[id]>0 then
                      jaf.healthtimetofill[id]=120
                      jaf.freewalk(id)
                end
           end
end

addhook("menu","jaf.menu")
function jaf.menu(id,title,button)
        if title=="Bean - Police" then
           if button==1 then
              parse("setpos "..id.." "..(153*32+16).." "..(85*32+16))
           end
        end
        if title==jaf.sv_lang(jaf.lang[id],190) then
           if button==1 then
              if jaf.crystal[id]>=200 then
                 jaf.crystal[id]=jaf.crystal[id]-200
                 jaf.saveposx[id]=jaf.presavepos[id][1]*32+16
                 jaf.saveposy[id]=jaf.presavepos[id][2]*32+16
                 msg2(id,hijau..jaf.sv_lang(jaf.lang[id],191).."!")
              else
                 msg2(id,merah..jaf.sv_lang(jaf.lang[id],103))
              end
           elseif button==5 then
              jaf.saveposx[id]=0
              jaf.saveposy[id]=0
           end
        end
        if title=="Clan Symbol Color" then
           local cmid=jaf.clan[id]
            if jaf.clan_markcolor[cmid]~=nil and button>0 then
               local mc=jaf.clan_markcolor[cmid]:gsub("k"," ")
               local mt=totable(mc)
               if mt[1]:sub(1,1)=="0" then
                  mt[1]=0
               else
                  mt[1]=tonumber(mt[1])
               end
               if mt[2]:sub(1,1)=="0" then
                  mt[2]=0
               else
                  mt[2]=tonumber(mt[2])
               end
               if mt[3]:sub(1,1)=="0" then
                  mt[3]=0
               else
                  mt[3]=tonumber(mt[3])
               end
               if button==1 then
                  if mt[1]<255 then
                     mt[1]=mt[1]+5
                  else
                     mt[1]=0
                  end
               elseif button==2 then
                  if mt[2]<255 then
                     mt[2]=mt[2]+5
                  else
                     mt[2]=0
                  end
               elseif button==3 then
                  if mt[3]<255 then
                     mt[3]=mt[3]+5
                  else
                     mt[3]=0
                  end
               elseif button==5 then
                  mt[1]=255
                  mt[2]=255
                  mt[3]=255
               elseif button==9 then
                  jaf.clan_menu(id)
                  return 1
               end
               jaf.clan_markcolor[cmid]=mt[1].."k"..mt[2].."k"..mt[3]
               if jaf.clan_markimg[cmid]~=nil and jaf.clanmarkimg[id]~=nil then
                  imagecolor(jaf.clanmarkimg[id],mt[1],mt[2],mt[3])
               end
               jaf.save_clan(cmid)
               jaf.clan_symbolcolorm(id)
             end
        end
        if title=="Kalum - Good-Side" then
                if button==1 then
                     jaf.item_buymenucreate(id,{{394,2000000,0,0},{395,0,0,0,{{203,1},{200,1}}},{393,0,0,0,{{352,50},{233,200}}},{397,0,0,0,{{233,360}}},{411,0,0,0,{{412,1},{352,200}}} })
                elseif button==2 then
                     jaf.quest_questtakemenu(id,{137,138,139,140,141,142,143})
                elseif button==3 then
                     jaf.npctalkme(id,jaf.locgfx.."npc/kalum.png","Kalum - Good-Side",{"I am from Morda Planet, it's the Planet of Shadow. At Morda Planet we have create several high technologies. Do you ever heard about the Legendary TimeWarrior?..","The Legendary TimeWarrior A.K.A Father of Furty, his real name is Jucho. Do you think Furty born on this planet? No, he is not from this planet, his planet is very far away. His father is from Kechoa Planet..","And his mother are from this planet, Earth. Furty's mother met Furty's father at Kechoa Planet while War of Inter-Galaxy is going on. Earth and Kechoa Planet are in one galaxy, Oxe galaxy. And the other Galaxy is called Shadow Galaxy..","His parents married at Kechoa planet and 2 years later, Furty born, Furty born at Kechoa Planet, his face looks as his mom, but not his father, he is different with his father, his father is not human..","All of kechoa people have wings and have four hands. His mother name is Karina Diva, he come to Kechoa cause on the Inter-Galaxy war, all planets of our galaxy sends tough soldier with different classes each planet..","..Earth and Kechoa Planet become a partners, and the commander is from Kechoa Planet. All of heroes go to Kechoa Planet, included Furty mother..","Furty's Mother is Dimension Keeper and his Father is Warrior. At the ending, my Galaxy loses, and many thing lost. My sister, Kilum couldnt believe that tragedy, she think your galaxy havent won.","She will revenge to one class. The strongest and very cleaver class of all class in your Galaxy, its called Paladin HighLord Class. Even he have been beat up by PumpkinLord Class","On last battlefield almost all people and monster dead except TimeJumper Class from my galaxy and Paladin HighLord Class from your galaxy..","One day, my sister passed out and one person from Void HighLord Class bring my sister to Kechoa Planet to steal his Time Energy and learn about our Time Machine Technology, Furty's father and mother learn about his time machine","I saw Furty's mother are very confused by that. Furty's father really assume on time machine, he learn every day for it until he understand. 6 weeks after the research, my sister wake up and destroy the research place and leave from Kechoa Planet.","Many people are died include Furty's Mother, but the father are still alive. Furty's father bring furty to Mars, in Mars, Furty's father create new Energy Called Time Void Energy, he use that energy to create new weapon","After that he Create Time-Warrior weapon using Time Void Energy and special diamond of warrior, he use it for good things, he can jump to other planet and galaxy quickly by using it..","Many people and monster call him The Legend TimeWarrior. Shadow feel dangerous about it, he worry the Inter-Galaxy War will be come again and your galaxy has new class that should used to defeat Shadow galaxy quickly","So he come to your galaxy to destroy your world before your galaxy destroy his world. My sister have join to Legion Shadow, and now looking for Time Void Energy. What should you do now? The second war will be up again!"})
                elseif button==5 then
                      msg2(id,kuning.."[Kalum] "..cyan.."Im Kalum from Morda Planet, Im in Good-Side of you from Telekinesis Class")
                end
        end
        if title=="Goxi - The Dark" then
                if button==1 then
                      jaf.item_buymenucreate(id,{ {313,0,0,0,{{352,700}}} })
                elseif button==2 then
                      jaf.quest_questtakemenu(id,{103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122},jaf.hhE,true)
                elseif button==5 then
                      msg2(id,kuning.."[Goxi] "..cyan.."Im goxi from underworld, Im Master of Dark magic")
                end
        end
	if title=="The Legion" then
		if button==1 then
			 jaf.item_buymenucreate(id,{ {161,0,0,0,{{324,1},{340,2000}}}, {343,0,0,0,{{340,2000}}}, {341,0,0,0,{{340,1000}}}, {342,0,0,0,{{340,250}}}, })
		elseif button==2 then
                         jaf.quest_questtakemenu(id,{98,99,100,101,102})
		end
	end
	if title=="Battle Arena" then
		if button==1 then
			jaf.joinarenaid[id]=1
			parse("setpos "..id.." "..(138*32+16).." "..(187*32+16))
		elseif button==2 then
			jaf.joinarenaid[id]=2
			parse("setpos "..id.." "..(311*32+16).." "..(98*32+16))
		elseif button==3 then
			jaf.joinarenaid[id]=3
			parse("setpos "..id.." "..(381*32+16).." "..(81*32+16))
		end
	end
            if title==jaf.sv_lang(jaf.lang[id],9) then
                   if button==1 then
                        jaf.settingsmenu(id)
                   elseif button==2 then
                        jaf.clan_menu(id)
                   elseif button==3 then
                        jaf.admin_menu(id)
                   elseif button==4 then
                        jaf.jobmenu(id)
                   elseif button==5 then
                        jaf.housemenu(id)
                   elseif button==6 then
                        jaf.tele_menukuya(id,page)
                   end
            end
            if title=="Weapon Point" then
               if button==1 and jaf.wpnpointku[id]>=20 then
                  jaf.wpnpointku[id]=jaf.wpnpointku[id]-20
                  jaf.give_shell(id,2000)
                  menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
               elseif button==2 and jaf.wpnpointku[id]>=50 then
                  jaf.wpnpointku[id]=jaf.wpnpointku[id]-50
                  jaf.give_shell(id,5000)
                  menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
               elseif button==3 and jaf.wpnpointku[id]>=100 then
                  jaf.wpnpointku[id]=jaf.wpnpointku[id]-100
                  jaf.give_shell(id,10000)
                  menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
               elseif button==4 and jaf.wpnpointku[id]>=250 then
                  jaf.wpnpointku[id]=jaf.wpnpointku[id]-250
                  jaf.give_shell(id,25000)
                  menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
               elseif button==5 and jaf.wpnpointku[id]>=500 then
                  jaf.wpnpointku[id]=jaf.wpnpointku[id]-500
                  jaf.give_shell(id,50000)
                  menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
               else
                  jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],185,"Weapon  Point").."!@C")
               end
            end
            if title=="Demian" then
               if button==1 then
                  if jaf.shell[id]>=5000 then
                     jaf.give_shell(id,-5000)
                     parse("setpos "..id.." "..(162*32+16).." "..(331*32+16))
                     jaf.svj_msg2(id,hijau.."[Demian]"..kuning.." Welcome to the club!")
                  else
                     jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],12))
                  end
               end
            end
            if title=="Indro - Receptionist" then
                   if button==1 then
                      if jaf.checkitem(id,326).amount>0 then
                         jaf.give_item(id,326,-1)
                         parse("setpos "..id.." "..(333*32+16).." "..(210*32+16))
                      else
                         jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],184,jaf.list_items[326].name))
                      end
                   end
            end
           if title:sub(1,24)=="Take Item on PSD | Page " then
              local page=tonumber(title:sub(25))
                  if button==8 then
                       jaf.psdmenu(id,page+1)
                  end
                  if button==9 then
                       jaf.psdmenu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       local am=0
                       for i=1,#jaf.items[id] do
                           if jaf.items[id][i]>0 then
                                 am=am+1
                           end
                       end
                       if am>=(jaf.inventory_max_default+jaf.invplus[id]) then
                           jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],187))
                           return false
                       end
                       if jaf.mylossiteml[id][jaf.btnset[id]]~=nil then
                          jaf.give_item(id,jaf.mylossitem[id][jaf.btnset[id]],jaf.mylossitema[id][jaf.btnset[id]],nil,jaf.mylossiteml[id][jaf.btnset[id]])
                       else
                          jaf.give_item(id,jaf.mylossitem[id][jaf.btnset[id]],jaf.mylossitema[id][jaf.btnset[id]])
                       end
                       jaf.mylossitem[id][jaf.btnset[id]]=nil
                       jaf.mylossitema[id][jaf.btnset[id]]=nil
                       jaf.mylossiteml[id][jaf.btnset[id]]=nil
                  end
          end
           if title:sub(1,28)=="Teleport to Location | Page " then
              local page=tonumber(title:sub(29))
                  if button==8 then
                       jaf.tele_menukuya(id,page+1)
                  end
                  if button==9 then
                       jaf.tele_menukuya(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if jaf.crystal[id]>=10 then
                          local v=jaf.arealocated[jaf.arealocatedta[jaf.btnset[id]]]
                          jaf.crystal[id]=jaf.crystal[id]-10
                          parse("setpos "..id.." "..(v.teleport[1]*32+16).." "..(v.teleport[2]*32+16))
                       else
                          jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],103))
                       end
                  end
          end
           if title=="Rajawali - Dreamer" then
                   if button==1 then
                      jaf.item_buymenucreate(id,{{348,0,5000,0},{346,0,0,0,{{215,2}}},{193,500000,0,0},{189,0,2000,0},{194,0,5000,0},{196,0,0,0,{{195,3},{153,1}}},{197,0,10000,0},{208,180000,0,0},{206,0,1000,0},{205,0,1500,0},{207,0,5000,0},{201,0,0,0,{{108,15}}},{25,0,3000,0} })
                   elseif button==2 then
                      jaf.quest_questtakemenu(id,{29,30,31,32,33,34,35,36,37,38,39,40,41,42},jaf.rajawalie,true)
                   elseif button==5 then
                      msg2(id,kuning.."[Rajawali] "..cyan.."My name is Rajawali, im the DreamKnight, friend of Joni.")
                   end
           end
           if title=="Joni - Paladin" then
                   if button==1 then
                      jaf.item_buymenucreate(id,{{210,0,0,0,{{166,1},{211,1}}},{175,0,0,0,{{222,50}}},{169,0,0,0,{{222,100}}} })
                   elseif button==2 then
                      jaf.quest_questtakemenu(id,{72,73,74,75,76,77,78,79,80,81},jaf.jonise,true)
                   elseif button==5 then
                      msg2(id,kuning.."[Joni] "..cyan.."Hello. My name is Joni, im are HighLord of Paladin.")
                   end
           end
           if title:sub(1,19)=="Server list | Page " then
              local page=tonumber(title:sub(20))
                  if button==8 then
                       hub_svlist_load(game("port"))
                       hub_svlist_menu(id,page+1)
                  end
                  if button==9 then
                       hub_svlist_load(game("port"))
                       hub_svlist_menu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       local svlistmp=hub_svlist_load(game("port"))
                       parse("reroute "..id.." ty-n.tk:"..tonumber(totable(svlistmp[2][jaf.btnset[id]])[1]))
                  end
          end
           if title:sub(1,23)=="Check Inventory | Page " then
              local page=tonumber(title:sub(24))
                  if button==8 then
                       jaf.invencheckmenu(jaf.checkinvplnya[id],page+1,id)
                  end
                  if button==9 then
                       jaf.invencheckmenu(jaf.checkinvplnya[id],page-1,id)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                  end
          end
           if title:sub(1,21)=="Select ItemUP | Page " then
              local page=tonumber(title:sub(22))
                  if button==8 then
                       jaf.itemupselect(id,page+1)
                  end
                  if button==9 then
                       jaf.itemupselect(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.freemenu2(jaf.moremenu2,id)
                       jaf.up_itemid1[id]=jaf.items[id][((page-1)*7+button)]
                       jaf.moremenu_up[id]=jaf.menu2(id,9,28,29,30)
                       local upmnimgl=jaf.locgfx.."jaf_logo.png"
                       if jaf.list_items[jaf.up_itemid1[id]].img~=nil and jaf.list_items[jaf.up_itemid1[id]].img~=false then
                           upmnimgl=jaf.list_items[jaf.up_itemid1[id]].img[1]
                       elseif jaf.list_items[jaf.up_itemid1[id]].attbt~=nil and jaf.list_items[jaf.up_itemid1[id]].attbt~=false and jaf.list_items[jaf.up_itemid1[id]].attbt.img~=nil and jaf.list_items[jaf.up_itemid1[id]].attbt.img~=false then
                           upmnimgl=jaf.list_items[jaf.up_itemid1[id]].attbt.img
                       end
                       jaf.varfreeimage(1,jaf.up_imgplus[id])
                       jaf.up_imgplus[id][1]=image(upmnimgl,(210+105),300,2,id)
                       imagescale(jaf.up_imgplus[id][1],1,1)
                       msg2(id,kuning.."[System] "..hitam..""..jaf.list_items[jaf.up_itemid1[id]].name.." Selected")
                  end
          end
           if title:sub(1,23)=="Take item to UP | Page " then
              local page=tonumber(title:sub(24))
                  if button==8 then
                       jaf.itemselecttoup(id,page+1)
                  end
                  if button==9 then
                       jaf.itemselecttoup(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.up_itemslot[id]=jaf.btnset[id]
                       jaf.up_itemid2[id]=jaf.items[id][((page-1)*7+button)]
                       local upmnimgl=jaf.locgfx.."jaf_logo.png"
                       if jaf.list_items[jaf.up_itemid2[id]].img~=nil and jaf.list_items[jaf.up_itemid2[id]].img~=false then
                           upmnimgl=jaf.list_items[jaf.up_itemid2[id]].img[1]
                       elseif jaf.list_items[jaf.up_itemid2[id]].attbt~=nil and jaf.list_items[jaf.up_itemid2[id]].attbt~=false and jaf.list_items[jaf.up_itemid2[id]].attbt.img~=nil and jaf.list_items[jaf.up_itemid2[id]].attbt.img~=false then
                           upmnimgl=jaf.list_items[jaf.up_itemid2[id]].attbt.img
                       end
                       jaf.varfreeimage(2,jaf.up_imgplus[id])
                       jaf.up_imgplus[id][2]=image(upmnimgl,(210+105),182,2,id)
                       imagescale(jaf.up_imgplus[id][2],1,1)
                       msg2(id,kuning.."[System] "..hitam..""..jaf.list_items[jaf.up_itemid2[id]].name.." Selected")
                  end
          end
            if title=="Admin menu" then
                  if button==1 then
                     if jaf.godmode[id]>0 then
                        jaf.godmode[id]=0
                        jaf.svj_msg2(id,merah.."God mode "..jaf.sv_lang(jaf.lang[id],79).."@C")
                     else
                        jaf.godmode[id]=1
                        jaf.svj_msg2(id,hijau.."God mode "..jaf.sv_lang(jaf.lang[id],78).."@C")
                     end
                  end
            end
            if title=="Settings" then
                   if button==1 then
                        jaf.langselectmenu(id,page)
                   elseif button==2 then
                        if jaf.userlictag[id]>0 then
                               jaf.userlictag[id]=0
                               jaf.svj_msg2(id,merah..""..jaf.lictag[jaf.userlicense[id]][2].." Tag "..jaf.sv_lang(jaf.lang[id],79).."!@C")
                        else
                               jaf.userlictag[id]=1
                               jaf.svj_msg2(id,hijau..""..jaf.lictag[jaf.userlicense[id]][2].." Tag "..jaf.sv_lang(jaf.lang[id],78).."!@C")
                        end
                   elseif button==3 then
                        if jaf.infoplayer[id]>0 then
                               jaf.infoplayer[id]=0
                               jaf.svj_msg2(id,merah.."INFO Player "..jaf.sv_lang(jaf.lang[id],79).."!@C")
                        else
                               jaf.infoplayer[id]=1
                               jaf.svj_msg2(id,hijau.."INFO Player "..jaf.sv_lang(jaf.lang[id],78).."!@C")
                        end
                   elseif button==4 then
                        if jaf.antilag[id]>0 then
                               jaf.antilag[id]=0
                               jaf.svj_msg2(id,merah.."Anti-lag "..jaf.sv_lang(jaf.lang[id],79).."!@C")
                        else
                               jaf.antilag[id]=1
                               jaf.svj_msg2(id,hijau.."Anti-lag "..jaf.sv_lang(jaf.lang[id],78).."!@C")
                        end
                   elseif button==5 then
                        if jaf.handwpn[id]==2 then
                           jaf.handwpn[id]=1
                        else
                           jaf.handwpn[id]=2
                        end
                        jaf.settingsmenu(id)
                   elseif button==6 then
                        parse("setpos "..id.." "..(164*32+16).." "..(110*32+16))
                   elseif button==7 then
                        if jaf.clansimbol[id]>0 then
                           jaf.clansimbol[id]=0
                           jaf.varfreeimage(id,jaf.clanmarkimg)
                        else
                           jaf.clansimbol[id]=1
                           jaf.refreshitemimg(id)
                        end
                        jaf.settingsmenu(id)
                   elseif button==8 then
                        if jaf.talkwithbot[id] then
                           jaf.talkwithbot[id]=false
                        else
                           jaf.talkwithbot[id]=true
                        end
                        jaf.settingsmenu(id)
                   end
            end
            if title:sub(1,(#jaf.sv_lang(jaf.lang[id],10)+8))==jaf.sv_lang(jaf.lang[id],10).." | Page " then
              local page=tonumber(title:sub((#jaf.sv_lang(jaf.lang[id],10)+9)))
                  if button==8 then
                       jaf.langselectmenu(id,page+1)
                  end
                  if button==9 then
                       jaf.langselectmenu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                   if button<=7 then
                          jaf.lang[id]=((page-1)*7+button)
                          jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],11))
                   end
            end
           if title:sub(1,17)=="Inventory | Page " then
              local page=tonumber(title:sub(18))
                  if button==8 then
                       jaf.inv_page[id]=jaf.inv_page[id]+1
                       jaf.inventorymenu(id,jaf.inv_page[id])
                  end
                  if button==9 then
                       jaf.inv_page[id]=jaf.inv_page[id]-1
                       jaf.inventorymenu(id,jaf.inv_page[id])
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                          jaf.morebuy_icount[id]=1
                          jaf.varfreeimage(id,jaf.morebuy_iimg)
                          jaf.varfreeimage(id,jaf.morebuy_mmark)
                          parse('hudtxt2 '..id..' '..(42)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(43)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(44)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(47)..' "" 0 0')
                          jaf.freemenu2(jaf.moremenu_buy,id)
                          freetimerEx(jaf.craftex[id])
                          jaf.bar2_remove(id,2)
                          jaf.removestat2IMG(id,7)
                       jaf.btnitem[id]=jaf.items[id][((page-1)*7+button)]
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.item_equipmenu(id,jaf.btnitem[id])
                  end
          end
          if title:sub(1,14)=="Item options |" then
                   if jaf.btnset[id]~=nil and jaf.aitems[id][jaf.btnset[id]]~=nil and jaf.aitems[id][jaf.btnset[id]]<=0 then
                      jaf.aitems[id][jaf.btnset[id]]=0
                      jaf.items[id][jaf.btnset[id]]=0
                      return 1
                   elseif jaf.btnitem[id]==nil or jaf.aitems[id][jaf.btnset[id]]==nil then
                      return 1
                   end
                   jaf.btnitem[id]=jaf.items[id][jaf.btnset[id]]
                   if button==5 then
                       jaf.clearitem(id,jaf.btnset[id])
                       jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],124,jaf.list_items[jaf.btnitem[id]].name))
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   elseif button==4 then
                       jaf.give_item(id,jaf.btnitem[id],-1)
                       jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],123,jaf.list_items[jaf.btnitem[id]].name))
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   elseif button==1 then
                          if player(id,"health")<=0 then
                             return false
                          end
                          jaf.list_items[jaf.btnitem[id]].func(id)
                          if jaf.list_items[jaf.btnitem[id]].inf==false then
                                   jaf.give_item(id,jaf.btnitem[id],-1)
                          end
                          if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                                   local imgn=jaf.list_items[jaf.btnitem[id]].attbt.no
                                   local imgl=jaf.list_items[jaf.btnitem[id]].attbt.img
                                   local imgst=jaf.list_items[jaf.btnitem[id]].attbt[2]
                                   local imgrc=jaf.list_items[jaf.btnitem[id]].attbt.rc
                                   local imgcwp=jaf.list_items[jaf.btnitem[id]].comwpn
                                   local morepp=jaf.list_items[jaf.btnitem[id]].more
                                   if jaf.itemSEL[id][imgn]~=jaf.btnitem[id] then
                                          jaf.removeitemIMG(id,imgn)
                                          jaf.itemSEL[id][imgn]=jaf.btnitem[id]
                                          jaf.itemSELID[id][imgn]=jaf.btnset[id]
                                          if imgn==3 and jaf.list_items[jaf.btnitem[id]].itemskill and (jaf.list_items[jaf.btnitem[id]].fireonatk==nil or jaf.list_items[jaf.btnitem[id]].fireonatk==false) then
                                             jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],112))
                                          end
                                          parse("setweapon "..id.." 50")
                                          jaf.wpnimghand[id]=1
                        if imgn==2 then
                           if jaf.list_items[jaf.btnitem[id]].class~=nil then
                              jaf.varfreeimage(1,jaf.classbtnimg[id])
                              jaf.varfreeimage(2,jaf.classbtnimg[id])
                              local gtp=jaf.skilltemppos[id]
                              if jaf.list_items[jaf.btnitem[id]].class[1]~=nil then
                                 jaf.classbtnimg[id][1]=image(jaf.list_items[jaf.btnitem[id]].class[1][1],gtp.x1,gtp.y1,2,id)
                                 if jaf.classtime1[id]>0 then
                                    imagecolor(jaf.classbtnimg[id][1],000,000,000)
                                 end
                              end
                              if jaf.list_items[jaf.btnitem[id]].class[2]~=nil then
                                 jaf.classbtnimg[id][2]=image(jaf.list_items[jaf.btnitem[id]].class[2][1],gtp.x2,gtp.y2,2,id)
                                 if jaf.classtime2[id]>0 then
                                    imagecolor(jaf.classbtnimg[id][2],000,000,000)
                                 end
                              end
                           else
                              jaf.varfreeimage(1,jaf.classbtnimg[id])
                              jaf.varfreeimage(2,jaf.classbtnimg[id])
                           end
                        end
                                          if imgn~=4 and imgl then
                                             jaf.itemIMG[id][imgn]=image(imgl,1,1,imgst+id)
                                             if imgcwp~=nil and imgcwp then
                                                imagepos(jaf.itemIMG[id][imgn],320,240,0)
                                             end
                                             if imgrc and tonumber(imgrc) then
                                               if imgrc==1 then
                                                  imagescale(jaf.itemIMG[id][imgn],1,-1)
                                               elseif imgrc==2 and jaf.handwpn[id]==1 then
                                                  imagescale(jaf.itemIMG[id][imgn],-1,1)
                                               end
                                             elseif jaf.handwpn[id]==2 and jaf.itemIMG[id][3]~=nil then
                                               imagescale(jaf.itemIMG[id][3],-1,1)
                                             end
                                             if imgn~=3 then
                                                 jaf.getsound(id,"JAF/otherworld/use.wav")
                                             end
                                             if morepp~=nil and morepp.speed~=nil and morepp.speed then
                                                parse("speedmod "..id.." "..jaf.itemSPEED[id]+morepp.speed)
                                             end
                                          elseif imgl then
                                          if imgst>1 then
                                            imgst=1
                                          end
                                          jaf.itemIMG[id][imgn]=image(imgl,0,0,imgst)
                                          imagepos(jaf.itemIMG[id][imgn],player(id,"x"),player(id,"y"),0)
                                          end
                                   else
                                          jaf.removeitemIMG(id,imgn)
                                          if imgn==2 then
                                          jaf.varfreeimage(1,jaf.classbtnimg[id])
                                          jaf.varfreeimage(2,jaf.classbtnimg[id])
                                          jaf.classtime1[id]=0
                                          jaf.classtime2[id]=0
                                          end
                                          if morepp~=nil and morepp.speed~=nil and morepp.speed then
                                             parse("speedmod "..id.." 0")
                                          end
                                   end
                                   jaf.refreshitemimg(id)
                          end
                   elseif button==3 then
                       jaf.give_shell(id,jaf.list_items[jaf.btnitem[id]].sellback)
                       jaf.give_item(id,jaf.btnitem[id],-1)
                       jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],121,jaf.list_items[jaf.btnitem[id]].name,jaf.list_items[jaf.btnitem[id]].sellback))
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   elseif button==6 then
                       local jual_pr=0
                       local itma=jaf.aitems[id][jaf.btnset[id]]
                       jaf.give_shell(id,jaf.list_items[jaf.btnitem[id]].sellback*itma)
                       jaf.give_item(id,jaf.btnitem[id],-itma)
                       jual_pr=itma*jaf.list_items[jaf.btnitem[id]].sellback
                       jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],122,jaf.list_items[jaf.btnitem[id]].name,jual_pr))
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   elseif button==2 then
                       if player(id,"health")>0 then
                           if jaf.list_items[jaf.btnitem[id]].timer~=nil and jaf.list_items[jaf.btnitem[id]].timer==true and jaf.aitems[id][jaf.btnset[id]]>=3600 then
                              if jaf.itemLVL[id][jaf.btnset[id]]~=nil and jaf.itemLVL[id][jaf.btnset[id]]>0 then
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),nil,jaf.itemLVL[id][jaf.btnset[id]])
                              else
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),nil,nil)
                              end
                           elseif jaf.list_items[jaf.btnitem[id]].timer~=nil and jaf.list_items[jaf.btnitem[id]].timer==true then
                              msg2(id,merah..jaf.sv_lang(jaf.lang[id],139))
                           else
                              if jaf.itemLVL[id][jaf.btnset[id]]~=nil and jaf.itemLVL[id][jaf.btnset[id]]>0 then
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),nil,jaf.itemLVL[id][jaf.btnset[id]])
                              else
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),nil,nil)
                              end
                           end
                       end
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   elseif button==7 then
                       if player(id,"health")>0 then
                           if jaf.list_items[jaf.btnitem[id]].timer~=nil and jaf.list_items[jaf.btnitem[id]].timer==true and jaf.aitems[id][jaf.btnset[id]]>=3600 then
                              if jaf.itemLVL[id][jaf.btnset[id]]~=nil and jaf.itemLVL[id][jaf.btnset[id]]>0 then
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),{jaf.locgfx.."gray.png",0.95,0.95,{000,000,000},0.1},jaf.itemLVL[id][jaf.btnset[id]])
                              else
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),{jaf.locgfx.."gray.png",0.95,0.95,{000,000,000},0.1},nil)
                              end
                           elseif jaf.list_items[jaf.btnitem[id]].timer~=nil and jaf.list_items[jaf.btnitem[id]].timer==true then
                              msg2(id,merah..jaf.sv_lang(jaf.lang[id],139))
                           else
                              if jaf.itemLVL[id][jaf.btnset[id]]~=nil and jaf.itemLVL[id][jaf.btnset[id]]>0 then
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),{jaf.locgfx.."gray.png",0.95,0.95,{000,000,000},0.1},jaf.itemLVL[id][jaf.btnset[id]])
                              else
                                 jaf.dropitem(id,jaf.btnitem[id],player(id,"tilex"),player(id,"tiley"),{jaf.locgfx.."gray.png",0.95,0.95,{000,000,000},0.1},nil)
                              end
                           end
                       end
                       if jaf.list_items[jaf.btnitem[id]].attbt and jaf.list_items[jaf.btnitem[id]].attbt[1]==true then
                           v=jaf.list_items[jaf.btnitem[id]]
                           if jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                              jaf.itemSEL[id][v.attbt.no]=0
                              jaf.itemSELID[id][v.attbt.no]=0
                              jaf.removeitemIMG(id,v.attbt.no)
                           end
                       end
                   end
          end
          if title=="Krusty krabs" then
                    if button==1 and jaf.shell[id]>=100 then
                                jaf.give_shell(id,-100)
                                jaf.give_item(id,1,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],13).." Krabby patty!")
                    elseif button==2 and jaf.shell[id]>=120 then
                                jaf.give_shell(id,-120)
                                jaf.give_item(id,2,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],13).." Krabby patty deluxe!")
                    elseif button==3 and jaf.shell[id]>=150 then
                                jaf.give_shell(id,-150)
                                jaf.give_item(id,3,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],13).." Krabby patty combo!")
                    elseif button==4 and jaf.shell[id]>=10 then
                                jaf.give_shell(id,-10)
                                jaf.give_item(id,4,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],13).." salad!")
                    elseif button==0 then return 1
                    else
                                jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                    end
                    if button>0 then
                                menu(id,"Krusty krabs,Krabby patty|100,Krabby patty deluxe|120,Krabby patty combo|150,Salad|10")
                    end
          end
          if title=="Carl - shop" then
                     if button==1 and jaf.shell[id]>=800 then
                                jaf.give_shell(id,-800)
                                jaf.give_item(id,5,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],13).." Jellyfish net!")
                      elseif button==1 then
                                jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                      end
           end
           if title:sub(1,7)=="Clan | " then
                 if button==1 then
                          jaf.clanmembermenu(id,1)
                  elseif button==2 then
                          if jaf.clan_leader[jaf.clan[id]]==jaf.usgn[id] then
                                 jaf.freemenu2(jaf.moremenu_removeclan,id)
                                 jaf.moremenu_removeclan[id]=jaf.menu2(id,5,18,19)
                          else
                                 jaf.clanleave(id)
                          end
                  elseif button==3 then
                          jaf.clan_donatemenu(id)
                  elseif button==4 then
                          jaf.item_buymenucreate(id,{{41,0,0,3000},{42,0,0,5000},{43,0,0,7500},{44,0,0,10000},{45,0,0,15000},{46,0,0,17000},{47,0,0,22000},{379,0,0,100},{380,0,0,5000},{381,0,0,5000},{382,0,0,2500},{383,0,0,2017},{384,0,0,5000},{385,0,0,7500}})
                  elseif button==5 then
                          jaf.clan_list_menu(id,1)
                  elseif button==6 then
                          jaf.clan_req_menu(id,1)
                  elseif button==7 then
                          jaf.clan_symbolcolorm(id)
                  end
            end
            if title=="Clan - Donating" then
                  if button==1 and jaf.shell[id]>=50000 then
                           jaf.clan_diamond[jaf.clan[id]]=jaf.clan_diamond[jaf.clan[id]]+5
                           jaf.give_shell(id,-50000,nil,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],74).." 5 diamonds")
                           jaf.clan_lastdonate[jaf.clan[id]]=jaf.usgn[id]
                           jaf.save_clan(jaf.clan[id])
                           jaf.clan_donatemenu(id)
                           jaf.achv_get(id,14)
                  elseif button==2 and jaf.shell[id]>=100000 then
                           jaf.clan_diamond[jaf.clan[id]]=jaf.clan_diamond[jaf.clan[id]]+10
                           jaf.give_shell(id,-100000,nil,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],74).." 10 diamonds")
                           jaf.clan_lastdonate[jaf.clan[id]]=jaf.usgn[id]
                           jaf.save_clan(jaf.clan[id])
                           jaf.clan_donatemenu(id)
                           jaf.achv_get(id,14)
                  elseif button==3 and jaf.shell[id]>=500000 then
                           jaf.clan_diamond[jaf.clan[id]]=jaf.clan_diamond[jaf.clan[id]]+50
                           jaf.clan_reputation[jaf.clan[id]]=jaf.clan_reputation[jaf.clan[id]]+5
                           jaf.give_shell(id,-500000,nil,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],74).." 50 diamonds")
                           jaf.clan_lastdonate[jaf.clan[id]]=jaf.usgn[id]
                           jaf.save_clan(jaf.clan[id])
                           jaf.clan_donatemenu(id)
                           jaf.achv_get(id,14)
                  elseif button==4 and jaf.shell[id]>=1000000 then
                           jaf.clan_diamond[jaf.clan[id]]=jaf.clan_diamond[jaf.clan[id]]+100
                           jaf.clan_reputation[jaf.clan[id]]=jaf.clan_reputation[jaf.clan[id]]+10
                           jaf.give_shell(id,-1000000,nil,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],74).." 100 diamonds")
                           jaf.clan_lastdonate[jaf.clan[id]]=jaf.usgn[id]
                           jaf.save_clan(jaf.clan[id])
                           jaf.clan_donatemenu(id)
                           jaf.achv_get(id,14)
                  elseif button==5 and jaf.shell[id]>=5000000 then
                           jaf.clan_diamond[jaf.clan[id]]=jaf.clan_diamond[jaf.clan[id]]+500
                           jaf.clan_reputation[jaf.clan[id]]=jaf.clan_reputation[jaf.clan[id]]+50
                           jaf.give_shell(id,-5000000,nil,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],74).." 500 diamonds")
                           jaf.clan_lastdonate[jaf.clan[id]]=jaf.usgn[id]
                           jaf.save_clan(jaf.clan[id])
                           jaf.clan_donatemenu(id)
                           jaf.achv_get(id,14)
                  elseif button>0 then
                           jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                  end
            end
            if title=="No clan" then
                       if button==1 then
                             jaf.claninvitemenu(id)
                       elseif button==2 then
                             jaf.clan_list_menu(id)
                       end
            end
            if title=="Invitation" then
                      if button>0 then
                            jaf.btnset[id]=button
                            local clanID=jaf.claninvite[id][jaf.btnset[id]]
                            if jaf.load_clan(nil,clanID) then
                                menu(id,"sure want join,(Clan ID|"..clanID.."),(Members|"..jaf.clanmembers(clanID).."/"..jaf.clan_check(clanID).maxmember.."),Yes,No")
                            else
                                jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],38))
                                jaf.claninvite[id][jaf.btnset[id]]=0
                            end
                      end
             end
             if title=="sure want join" then
                      if button==3 then
                           local clanID=jaf.claninvite[id][jaf.btnset[id]]
                           jaf.clanjoinkan(tonumber(clanID),id)
                           jaf.claninvite[id][jaf.btnset[id]]=0
                      elseif button==4 then
                            jaf.claninvite[id][jaf.btnset[id]]=0
                            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],31))
                      end
            end
           if title:sub(1,20)=="Members clan | Page " then
              local page=tonumber(title:sub(21))
                  if button==8 then
                       jaf.clanmembermenu(id,page+1)
                  end
                  if button==9 then
                       if page==1 then
                          jaf.clan_menu(id)
                       else
                          jaf.clanmembermenu(id,page-1)
                       end
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if jaf.clan_leader[jaf.clan[id]]==jaf.usgn[id] then
                             if jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]]==jaf.usgn[id] then
                                menu(id,"Member info,(Name|"..jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]].."),(U.S.G.N|"..jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]].."),(Remove this member),(Set to be leader),More info|>>")
                             else
                                menu(id,"Member info,(Name|"..jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]].."),(U.S.G.N|"..jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]].."),Remove this member,Set to be leader,More info|>>")
                             end
                       else
                             menu(id,"Member info,(Name|"..jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]].."),(U.S.G.N|"..jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]].."),(Remove this member),(Set to be leader),More info|>>")
                       end
                  end
          end
           if title:sub(1,24)=="Clan List Exists | Page " then
              local page=tonumber(title:sub(25))
                  if button==8 then
                       jaf.clan_list_menu(id,page+1)
                  end
                  if button==9 then
                       jaf.clan_list_menu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.clan_list_info(id,jaf.list_id(totable(jaf.clan_list)[jaf.btnset[id]],1))
                  end
          end
          if title=="Member info" then
                    if button==3 then
                           jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]]=0
                           jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]]="X"
                           jaf.save_clan(jaf.clan[id])
                           jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],32))
                    elseif button==4 then
                           jaf.clan_leader[jaf.clan[id]]=jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]]
                           jaf.save_clan(jaf.clan[id])
                           jaf.svj_msg2(id,"[System] "..hijau..""..jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]].." "..jaf.sv_lang(jaf.lang[id],33))
                    elseif button==5 then
                           jaf.moreinfousermenu(id,jaf.clan_membersID[jaf.clan[id]][jaf.btnset[id]])
                    end
          end
           if title:sub(1,20)=="Request List | Page " then
              local page=tonumber(title:sub(21))
                  if button==8 then
                       jaf.clan_req_menu(id,page+1)
                  end
                  if button==9 then
                       if page==1 then
                          jaf.clan_menu(id)
                       else
                          jaf.clan_req_menu(id,page-1)
                       end
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.clan_req_info(id,jaf.list_id(totable(jaf.clan_request[jaf.clan[id]])[jaf.btnset[id]],1))
                  end
          end
          if title:sub(1,9)=="More info" then
                   if button==9 then
                          jaf.clanmembermenu(id,1)
                   end
          end
          if title=="Player Request Check" then
                   if button==9 then
                      jaf.clan_req_menu(id,1)
                   elseif button==5 then
                     local v=totable(jaf.clan_request[jaf.clan[id]])
                     local v2=totable(jaf.clan_request_name[jaf.clan[id]])
                     jaf.clanjoin(id,jaf.clan[id],jaf.list_id(v[jaf.btnset[id]],1),jaf.list_id(v2[jaf.btnset[id]],2))
                     if v[jaf.btnset[id]]~=nil then
                         jaf.clan_request[jaf.clan[id]]=string.gsub(jaf.clan_request[jaf.clan[id]],"c"..jaf.list_id(v[jaf.btnset[id]],1).."r ","")
                         jaf.clan_request_name[jaf.clan[id]]=string.gsub(jaf.clan_request_name[jaf.clan[id]],"c"..jaf.list_id(v2[jaf.btnset[id]],2).."r ","")
                         jaf.save_clan(jaf.clan[id])
                     end
                   elseif button==6 then
                      local v=totable(jaf.clan_request[jaf.clan[id]])
                      local v2=totable(jaf.clan_request_name[jaf.clan[id]])
                      if v[jaf.btnset[id]]~=nil then
                         jaf.clan_request[jaf.clan[id]]=string.gsub(jaf.clan_request[jaf.clan[id]],"c"..jaf.list_id(v[jaf.btnset[id]],1).."r ","")
                         jaf.clan_request_name[jaf.clan[id]]=string.gsub(jaf.clan_request_name[jaf.clan[id]],"c"..jaf.list_id(v2[jaf.btnset[id]],2).."r ","")
                         jaf.save_clan(jaf.clan[id])
                         jaf.svj_msg2(id,hijau..jaf.sv_lang(jaf.lang[id],144))
                      end
                   end
          end
          if title:sub(1,9)=="Clan info" then
                    getcid=jaf.list_id(totable(jaf.clan_list)[jaf.btnset[id]],1)
                    if button==6 then
                       if jaf.clan_check_member(jaf.usgn[id],jaf.list_id(totable(jaf.clan_list)[jaf.btnset[id]],1)) then
                           jaf.clan[id]=jaf.list_id(totable(jaf.clan_list)[jaf.btnset[id]],1)
                           jaf.load_clan(nil,jaf.clan[id])
                           jaf.clan_reputation[jaf.clan[id]]=jaf.clan_reputation[jaf.clan[id]]+100
                           jaf.save_clan(jaf.clan[id])
                           jaf.svj_msg2(id,hijau..jaf.sv_lang(jaf.lang[id],18))
                       else
                           jaf.clan_request_add(id,jaf.list_id(totable(jaf.clan_list)[jaf.btnset[id]],1))
                       end
                    elseif button==7 then
                       jaf.clan_list_remove(getcid)
                    elseif button==9 then
                       jaf.clan_list_menu(id,1)
                    end
          end
          if title=="Phone" then
                    if button==4 then
                        jaf.smsmenu(id,1)
                    elseif button==6 then
                        local dir=jaf.loclua.."phone/"..jaf.phonenum[id]..".txt"
                        os.remove(dir)
                        jaf.phonenum[id]=0
                        jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],58))
                    elseif button==7 then
                        jaf.phone_save(id,jaf.phonenum[id])
                        jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],59))
                    elseif button==1 then
                        jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],62))
                        jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],63))
                        jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],64))
                        jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],65))
                        jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],66))
                    elseif button==5 then
                        jaf.internetlist(id)
                    end
          end
          if title=="Internet list" then
                    if button>0 then
                       jaf.npctalkremove(id)
                       jaf.netscroll[id]=0
                       jaf.joninet[id]=jaf.menu2(id,unpack(jaf.inet_list[button].menu))
                       jaf.getnet[id]=button
                       jaf.getsubnet[id]=1
                       jaf.netgetdata[id]=0
                       if jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]]~=nil and
                          jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info then
                          ndgclc=#jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info
                          if type(jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info)=="table" then
                             gkbnd=0
                             for i=1,#jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info do
                                 gkbnd=gkbnd+#jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info[i]
                             end
                             ndgclc=gkbnd
                          end
                          jaf.netdata[id]=ndgclc
                       else
                          jaf.netdata[id]=0
                       end
                       jaf.freemenu2(jaf.moremenu2,id)
                       jaf.freemenu2(jaf.achvmenu2,id)
                       jaf.achv_reset(id)
                       jaf.freeachvstatIMG(id)
                       jaf.bar2_remove(id,1)
                    end
           end
           if title:sub(1,11)=="SMS | Page " then
              local page=tonumber(title:sub(12))
                  if button==8 then
                       jaf.smsmenu(id,page+1)
                  end
                  if button==9 then
                       jaf.smsmenu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.svj_msg2(id,kuning.."»» "..cyan..""..jaf.phonesms[id][jaf.btnset[id]])
                  end
          end
           if title:sub(1,16)=="Buy item | Page " then
              local page=tonumber(title:sub(17))
                  if button==8 then
                       jaf.item_buymenu(id,page+1)
                  end
                  if button==9 then
                       jaf.item_buymenu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if jaf.moremenu_buy[id]==nil then
                            jaf.moremenu_buy[id]=jaf.menu2(id,6,20,21,22,23,24,25,43)
                            jaf.removebtn2IMG(id,43)
                       end
                          if jaf.achvmenu2[id]~=nil then
                             jaf.freemenu2(jaf.achvmenu2,id)
                             jaf.achv_reset(id)
                             jaf.freeachvstatIMG(id)
                          end
                         jaf.varfreeimage(id,jaf.morebuy_iimg)
                         jaf.varfreeimage(id,jaf.morebuy_mmark)
                         local itemidil=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                         local imgdropii=false
                         local bymnimgl=jaf.locgfx.."jaf_logo.png"
                         if jaf.list_items[itemidil].img~=nil and jaf.list_items[itemidil].img and jaf.list_items[itemidil].img[1]~=nil and jaf.list_items[itemidil].img[1] then
                               bymnimgl=jaf.list_items[itemidil].img[1]
                               imgdropii=true
                         end
                         if imgdropii==false and jaf.list_items[itemidil].attbt~=nil and jaf.list_items[itemidil].attbt and jaf.list_items[itemidil].attbt.img~=nil and jaf.list_items[itemidil].attbt.img then
                             bymnimgl=jaf.list_items[itemidil].attbt.img
                         end
                         jaf.morebuy_iimg[id]=image(bymnimgl,(320+105),165,2,id)
                         if imgdropii==false and jaf.list_items[itemidil].attbt~=nil and jaf.list_items[itemidil].attbt and jaf.list_items[itemidil].attbt.img~=nil and jaf.list_items[itemidil].attbt.img then
                             imagescale(jaf.morebuy_iimg[id],0.7,0.7)
                         end
                         if jaf.list_items[itemidil].memberstat~=nil and jaf.list_items[itemidil].memberstat and jaf.list_items[itemidil].memberstat>=1 then
                               parse("flashplayer "..id.." 20")
                               jaf.morebuy_mmark[id]=image(jaf.locgfx.."member_mark.png",(321+105),210,2,id)
                         end
                            return 1
                  end
          end
          if title=="Change Item Color" then
                  if button>0 then
                     if jaf.shell[id]>=10000 then
                        jaf.give_shell(id,-10000)
                        jaf.itemidcolor[id]=button
                        jaf.color_select(id,page)
                     else
                        jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                     end
                  end
          end
          if title=="Trade menu" then
                  if button==1 then
                       jaf.tradeover(id)
                       jaf.tradestat[id]=1
                       jaf.trademenu(id)
                       jaf.removejfnIMG(id)
                       jaf.achv_get(id,13)
                       jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],83))
                  elseif button==2 then
                       jaf.tradelistmenu(id,page)
                  end
          end
           if title:sub(1,20)=="Select Color | Page " then
              local page=tonumber(title:sub(21))
                  if button==8 then
                       jaf.color_select(id,page+1)
                  end
                  if button==9 then
                       jaf.color_select(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       local gcv=jaf.itemcolorlist[jaf.btnset[id]].c
                       if jaf.itemIMG[id][jaf.itemidcolor[id]]~=nil then
                          imagecolor(jaf.itemIMG[id][jaf.itemidcolor[id]],gcv[1],gcv[2],gcv[3])
                       end
                  end
          end
           if title:sub(1,18)=="Trade list | Page " then
              local page=tonumber(title:sub(19))
                  if button==8 then
                       jaf.tradelistmenu(id,page+1)
                  end
                  if button==9 then
                       jaf.tradelistmenu(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.tradetgt[id]=jaf.btnset[id]
                       jaf.tradebuymenu(id,jaf.tradetgt[id],1)
                  end
          end
           if title:sub(1,17)=="Trade buy | Page " then
              local page=tonumber(title:sub(18))
                  if button==8 then
                       jaf.tradebuymenu(id,jaf.tradetgt[id],page+1)
                  end
                  if button==9 then
                       jaf.tradebuymenu(id,jaf.tradetgt[id],page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.tradebuya[id]=1
                       local v=jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]
                       local btitem=tonumber(totable(v)[1])
                       local btprice=tonumber(totable(v)[2])
                       local btppy=tonumber(totable(v)[4])
                       local btpia=tonumber(totable(v)[5])
                       local btpias=tonumber(totable(v)[6])
                       local btpnmp="Shell"
                       if btppy>0 then btpnmp="SC's" end
                       menu(id,"Buy item trade,(#"..btpias.." "..jaf.list_items[btitem].name.."),("..(btprice*jaf.tradebuya[id]).." "..btpnmp.."),"..jaf.sv_lang(jaf.lang[id],177).."(+)|"..jaf.tradebuya[id].."/"..btpia..",Buy now!")
                  end
          end
          if title=="Buy item trade" then
                  local bttgt=jaf.tradetgt[id]
                  if not player(bttgt,"exists") or jaf.tradestat[bttgt]<=0 then
                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],86))
                     return false
                  end
                  local v=jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]
                  local btitem=tonumber(totable(v)[1])
                  local btprice=tonumber(totable(v)[2])
                  local tppid=tonumber(totable(v)[3])
                  local btppy=tonumber(totable(v)[4])
                  local btpia=tonumber(totable(v)[5])
                  local btpsid=tonumber(totable(v)[6])
                  local tpusgn=tonumber(totable(v)[7])
                  if button==3 then
                     if jaf.tradebuya[id]<jaf.aitems[bttgt][btpsid] and jaf.tradebuya[id]<btpia then
                        jaf.tradebuya[id]=jaf.tradebuya[id]+1
                     elseif jaf.tradebuya[id]<jaf.aitems[bttgt][btpsid] and jaf.tradebuya[id]>=btpia then
                        jaf.tradebuya[id]=1
                     else
                        jaf.tradebuya[id]=1
                        jaf.tradelistmenu(id,page)
                        return false
                     end
                     local btpnmp="Shell"
                     if btppy>0 then btpnmp="SC's" end
                     menu(id,"Buy item trade,("..jaf.list_items[btitem].name.."),("..(btprice*jaf.tradebuya[id]).." "..btpnmp.."),"..jaf.sv_lang(jaf.lang[id],177).."(+)|"..jaf.tradebuya[id].."/"..btpia..",Buy now!")
                  elseif button==4 then
                       if jaf.aitems[bttgt][btpsid]==nil or jaf.tradebuya[id]>jaf.aitems[bttgt][btpsid] then
                          jaf.tradelistmenu(id,page)
                          msg2(id,merah.."Failed")
                          return false
                       end
                       if player(bttgt,"exists") and jaf.tradestat[bttgt]>0 then
                              if btppy<=0 and jaf.shell[id]>=(btprice*jaf.tradebuya[id]) then
                                   if jaf.itemLVL[bttgt][btpsid]~=nil and jaf.itemLVL[bttgt][btpsid]>0 then
                                      local geidku=jaf.give_item(id,btitem,jaf.tradebuya[id])
                                      jaf.itemLVL[id][geidku]=jaf.itemLVL[bttgt][btpsid]
                                   else
                                      jaf.give_item(id,btitem,jaf.tradebuya[id])
                                   end
                                   jaf.give_item(bttgt,btitem,-jaf.tradebuya[id])
                                   jaf.itemLVL[bttgt][btpsid]=0
                                   jaf.give_shell(id,-(btprice*jaf.tradebuya[id]),nil,"[Server] "..hijau.." "..jaf.sv_lang(jaf.lang[id],13).." "..jaf.tradebuya[id].."x"..jaf.list_items[btitem].name)
                                   jaf.give_shell(bttgt,(btprice*jaf.tradebuya[id]),nil,"[Server] "..hijau..""..player(id,"name").." "..jaf.sv_lang(jaf.lang[bttgt],85).." "..jaf.tradebuya[id].."x "..jaf.list_items[btitem].name)
                                   if (btpia-jaf.tradebuya[id])>0 then
                                      jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]=btitem.." "..btprice.." "..tppid.." "..btppy.." "..(btpia-jaf.tradebuya[id]).." "..btpsid.." "..tpusgn
                                   else
                                      jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]=nil
                                   end
                              elseif btppy>0 and jaf.crystal[id]>=(btprice*jaf.tradebuya[id]) then
                                   if jaf.itemLVL[bttgt][btpsid]~=nil and jaf.itemLVL[bttgt][btpsid]>0 then
                                      local geidku=jaf.give_item(id,btitem,jaf.tradebuya[id])
                                      jaf.itemLVL[id][geidku]=jaf.itemLVL[bttgt][btpsid]
                                   else
                                      jaf.give_item(id,btitem,jaf.tradebuya[id])
                                   end
                                   jaf.give_item(bttgt,btitem,-jaf.tradebuya[id])
                                   jaf.itemLVL[bttgt][btpsid]=0
                                   jaf.give_scs(id,-(btprice*jaf.tradebuya[id]),nil,"[Server] "..hijau.." "..jaf.sv_lang(jaf.lang[id],13).." "..jaf.tradebuya[id].."x "..jaf.list_items[btitem].name)
                                   jaf.give_scs(bttgt,(btprice*jaf.tradebuya[id]),nil,"[Server] "..hijau..""..player(id,"name").." "..jaf.sv_lang(jaf.lang[bttgt],85).." "..jaf.tradebuya[id].."x "..jaf.list_items[btitem].name)
                                   if (btpia-jaf.tradebuya[id])>0 then
                                      jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]=btitem.." "..btprice.." "..tppid.." "..btppy.." "..(btpia-jaf.tradebuya[id]).." "..btpsid.." "..tpusgn
                                   else
                                      jaf.tradeitem[jaf.tradetgt[id]][jaf.btnset[id]]=nil
                                   end
                              else
                                   if btppy<=0 then
                                       jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                                   else
                                       jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],103))
                                   end
                              end
                       elseif not player(bttgt,"exists") then
                                   jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                       else
                                   jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],86))
                       end
                  end
          end
          if title=="My trade" then
                  if button==2 then
                       jaf.tradetgt[id]=id
                       jaf.tradebuymenu(id,jaf.tradetgt[id],1)
                  elseif button==3 then
                       jaf.tradeover(id)
                       jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],84))
                  elseif button==1 then
                       jaf.tradeitemadd(id,page)
                  elseif button==4 then
                       jaf.tradelistmenu(id,page)
                  end
          end
           if title:sub(1,22)=="Put item trade | Page " then
              local page=tonumber(title:sub(23))
                  if button==8 then
                       jaf.tradeitemadd(id,page+1)
                  end
                  if button==9 then
                       jaf.tradeitemadd(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.btnitem[id]=jaf.items[id][jaf.btnset[id]]
                       if not jaf.trade_checkitem(id,jaf.btnitem[id]) then
                            jaf.tradepreitem[id]=jaf.btnitem[id].." 0 "..jaf.btnset[id].." 0 1 "..jaf.btnset[id].." 0"
                            jaf.tradeputprice(id,0,jaf.btnitem[id],0,1,0)
                       else
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],87))
                       end
                  end
          end
           if title:sub(1,21)=="Trade Private | Page " then
              local page=tonumber(title:sub(22))
                  local v=jaf.tradepreitem[id]
                  local tpitem=tonumber(totable(v)[1])
                  local tpprice=tonumber(totable(v)[2])
                  local tpid=tonumber(totable(v)[3])
                  local tppy=tonumber(totable(v)[4])
                  local tpia=tonumber(totable(v)[5])
                  local tpisid=tonumber(totable(v)[6])
                  local tpusgn=tonumber(totable(v)[7])
                  if button==8 then
                       jaf.tradeprivateplayer(id,page+1)
                  end
                  if button==9 then
                       if page==1 then
                          jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                          jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                       else
                          jaf.tradeprivateplayer(id,page-1)
                       end
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if player(jaf.btnset[id],"exists") then
                          tpusgn=jaf.usgn[jaf.btnset[id]]
                       end
                       jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                       jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  end
          end
          if title=="Trade price item" then
                  local v=jaf.tradepreitem[id]
                  local tpitem=tonumber(totable(v)[1])
                  local tpprice=tonumber(totable(v)[2])
                  local tpid=tonumber(totable(v)[3])
                  local tppy=tonumber(totable(v)[4])
                  local tpia=tonumber(totable(v)[5])
                  local tpisid=tonumber(totable(v)[6])
                  local tpusgn=tonumber(totable(v)[7])
                  if button==1 then
                        tpprice=tpprice+100
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==2 then
                        tpprice=tpprice+1000
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==3 then
                        tpprice=tpprice+5000
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==4 then
                        tpprice=tpprice+50000
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==5 then
                        tpprice=tpprice+100000
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==6 then
                        if jaf.aitems[id][jaf.btnset[id]]~=nil and jaf.aitems[id][jaf.btnset[id]]~=false and tpia<jaf.aitems[id][jaf.btnset[id]] then
                           tpia=tpia+1
                        elseif jaf.aitems[id][jaf.btnset[id]]~=nil and jaf.aitems[id][jaf.btnset[id]]~=false then
                           tpia=1
                        else
                           tpia=0
                           return 1
                        end
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  elseif button==7 then
                       jaf.tradeprivateplayer(id,1)
                  elseif button==8 then
                        jaf.trade_putitem(id,jaf.tradepreitem[id])
                        jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.list_items[tpitem].name.." "..jaf.sv_lang(jaf.lang[id],88).." "..tpprice)
                          if jaf.list_items[tpitem].attbt and jaf.list_items[tpitem].attbt[1]==true then
                                local imgn2=jaf.list_items[tpitem].attbt.no
                                if jaf.itemSEL[id][imgn2]==tpitem then
                                    jaf.removeitemIMG(id,imgn2)
                                    jaf.itemSEL[id][imgn2]=0
                                    jaf.itemSELID[id][imgn2]=0
                                    if imgn2==2 then
                                    jaf.varfreeimage(1,jaf.classbtnimg[id])
                                    jaf.varfreeimage(2,jaf.classbtnimg[id])
                                    end
                                    parse("speedmod "..id.." 0")
                                end
                          end
                         
                  elseif button==9 then
                        if tppy>0 then tppy=0 else tppy=1 end
                        jaf.tradepreitem[id]=tpitem.." "..tpprice.." "..tpid.." "..tppy.." "..tpia.." "..tpisid.." "..tpusgn
                        jaf.tradeputprice(id,tpprice,tpitem,tppy,tpia,tpusgn)
                  end
          end
           if title:sub(1,18)=="Take Quest | Page " then
              local page=tonumber(title:sub(19))
                  if button==8 then
                       jaf.quest_listquest(id,page+1)
                  end
                  if button==9 then
                       jaf.quest_listquest(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       jaf.quest_menu(id,jaf.btnq[id][jaf.btnset[id]])
                  end
          end
          if title=="Quest" then
                  local n=jaf.btnq[id][jaf.btnset[id]]
                  local v=jaf.list_quest[n]
                  if button==5 then
                     if jaf.quest_stat[id][jaf.btnq[id][jaf.btnset[id]]]~=nil then
                        jaf.quest_stat[id][jaf.btnq[id][jaf.btnset[id]]]=nil
                        jaf.quest_item[id][jaf.btnq[id][jaf.btnset[id]]]=0
                        jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],111).." "..jaf.list_quest[jaf.btnq[id][jaf.btnset[id]]].title.." Quest")
                        jaf.myquestlist[id][jaf.btnq[id][jaf.btnset[id]]]=nil
                     else
                        jaf.quest_stat[id][jaf.btnq[id][jaf.btnset[id]]]=1
                        jaf.quest_item[id][jaf.btnq[id][jaf.btnset[id]]]=0
                        jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],110).." "..jaf.list_quest[jaf.btnq[id][jaf.btnset[id]]].title.." Quest")
                        jaf.myquestlist[id][jaf.btnq[id][jaf.btnset[id]]]=jaf.btnq[id][jaf.btnset[id]]
                     end
                  elseif button==4 then
                     jaf.quest_stat[id][jaf.btnq[id][jaf.btnset[id]]]=nil
                     jaf.quest_item[id][jaf.btnq[id][jaf.btnset[id]]]=0
                     jaf.myquestlist[id][jaf.btnq[id][jaf.btnset[id]]]=nil
                     if v.qcode==3 then
                        jaf.give_item(id,v.qid,-v.qitem)
                     end
                     v.prize(id)
                     if jaf.btnq_eid[id] and jaf.btnq_eid[id][id]<(jaf.btnset[id]+1) and jaf.btnq_eid[id][id]<jaf.btnqc[id] then
                        jaf.btnq_eid[id][id]=jaf.btnset[id]+1
                     end
                  elseif button==2 then
                     jaf.svj_msg2(id,hijau.."Quest: "..v.qinfo.."@C")
                     jaf.quest_menu(id,n)
                  elseif button==9 then
                     jaf.quest_listquest(id,1)
                  end
          end
           if title:sub(1,25)=="Event active list | Page " then
              local page=tonumber(title:sub(26))
                  if button==8 then
                       jaf.event_list(id,page+1)
                  end
                  if button==9 then
                       jaf.event_list(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                          jaf.morebuy_icount[id]=1
                          jaf.varfreeimage(id,jaf.morebuy_iimg)
                          jaf.varfreeimage(id,jaf.morebuy_mmark)
                          parse('hudtxt2 '..id..' '..(8)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(42)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(43)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(44)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(45)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(46)..' "" 0 0')
                          parse('hudtxt2 '..id..' '..(47)..' "" 0 0')
                          jaf.freemenu2(jaf.moremenu_buy,id)
                          freetimerEx(jaf.craftex[id])
                          jaf.bar2_remove(id,2)
                          jaf.removestat2IMG(id,7)
                       jaf.btnevent[id]=jaf.event_check()[jaf.btnset[id]]
                       jaf.event_menu(id,jaf.btnevent[id])
                  end
          end
           if title:sub(1,7)=="Event -" then
                  local ev=jaf.event_schedule[jaf.btnevent[id]]
                  if button==1 then
                     jaf.item_buymenucreate(id,ev.shop)
                  elseif button==2 then
                     if ev.eid then
                        if ev.questonce~=nil and ev.questonce then
                           jaf.quest_questtakemenu(id,ev.quest,ev.eid,true)
                        else
                           jaf.quest_questtakemenu(id,ev.quest,ev.eid)
                        end
                     else
                        jaf.quest_questtakemenu(id,ev.quest)
                     end
                  elseif button==3 then
                     msg2(id,hijau.."---- Event ----")
                     if type(ev.info)=="table" then
                        for i=1,#ev.info do
                            msg2(id,putih..ev.info[i])
                        end
                     else
                        msg2(id,putih..ev.info)
                     end
                  elseif button==4 then
                    parse("setpos "..id.." "..(ev.pos[1]*32+16).." "..(ev.pos[2]*32+16))
                  end
           end
           if title=="Job" then
              if button==3 then
                 if jaf.jobid[id]>0 then
                    parse("setpos "..id.." "..jaf.jobinfo[jaf.jobid[id]].workpos[1].." "..jaf.jobinfo[jaf.jobid[id]].workpos[2])
                 end
              elseif button==5 then
                 msg2(id,kuning.."Job info: "..putih..jaf.jobinfo[jaf.jobid[id]].info)
              end
           end
           if title:sub(1,16)=="Job List | Page " then
              local page=tonumber(title:sub(17))
                  if button==8 then
                       jaf.job_list(id,page+1)
                  end
                  if button==9 then
                       jaf.job_list(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if jaf.jobinfo[jaf.btnset[id]].check(id)~=true then
                           jaf.job_list(id)
                           return false
                       end
                       jaf.jobinfo[jaf.btnset[id]].takeaction(id)
                       jaf.jobid[id]=jaf.btnset[id]
                       if jaf.jobinfo[jaf.jobid[id]].salarytime~=nil and jaf.jobinfo[jaf.jobid[id]].salarytime then
                           jaf.jobtime[id]=jaf.jobinfo[jaf.jobid[id]].salarytime
                       else
                           jaf.jobtime[id]=0
                       end
                       msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],176,jaf.jobinfo[jaf.btnset[id]].name))
                  end
          end
          if title=="Mark - Remove Job" then
              if button==1 then
                   if jaf.crystal[id]>=5000 then
                      jaf.crystal[id]=jaf.crystal[id]-5000
                      jaf.jobid[id]=0
                      msg2(id,hijau.."[mark] "..kuning.."You has remove your job!")
                   else
                      msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],103))
                   end
              end
           end
           if title=="J.I.B Center" then
              if button==1 then
                 if jaf.shell[id]>=100000 then
                    jaf.bankstats[id]=1
                    jaf.give_shell(id,-100000)
                    msg2(id,kuning.."[J.I.B Bank] "..hijau.."Thank you, your bank has created!")
                 else
                    msg2(id,kuning.."[J.I.B Bank] "..merah.."Sorry, your current shell is not enough")
                 end
              end
           end
           if title=="House" then
              if jaf.houseid[id]<=0 then return false end
              if button==2 then
                 parse("trigger "..jaf.house_list[jaf.houseid[id]].doort)
                 jaf.housemenu(id)
              elseif button==3 then
                 parse("setpos "..id.." "..(jaf.house_list[jaf.houseid[id]].pos[1]*32).." "..(jaf.house_list[jaf.houseid[id]].pos[2]*32))
              elseif button==4 then
                 jaf.house_list[jaf.houseid[id]].owner=0
                 jaf.houseid[id]=0
                 msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],171))
              end
           end
           if title=="Set House" then
              local htpc=jaf.prahouseid[id]
              if jaf.house_list[htpc].owner>0 then
                  msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],169,player(jaf.house_list[htpc].owner,"name")))
                  return false
              end
              if button==2 then
                 jaf.houseid[id]=jaf.prahouseid[id]
                 msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],170,jaf.house_list[htpc].name))
                 jaf.house_list[htpc].owner=id
              end
           end
           if title=="Banker - Transfer" then
              if button==6 then
        jaf.banker_transfer(id,jaf.banktrusgn[id],jaf.banktra[id])
              elseif button==7 then
                jaf.banktrusgn[id]=0
                jaf.banktra[id]=0
              end
           end
           if title:sub(1,25)=="Net search result | Page " then
              local page=tonumber(title:sub(26))
                  if button==8 then
                       jaf.inetfind_list(id,page+1)
                  end
                  if button==9 then
                       jaf.inetfind_list(id,page-1)
                  end
                  if button==0 then
                      return 1
                  end
                  if button<=7 then
                       jaf.btnset[id]=((page-1)*7+button)
                       if jaf.joninet[id]~=nil then
                          v=jaf.inet_search(jaf.getnet[id],jaf.getnetsearch[id])
                          v2=jaf.inet_list[jaf.getnet[id]]
                                 if jaf.getnetimage[id]~=nil then
                                    jaf.freenetimage(id,#jaf.getnetimage[id])
                                    jaf.getnetimage[id]=nil
                                 end
                                 if type(v[jaf.btnset[id]])=="table" then
                                    gkbnd=0
                                    for i=1,#jaf.inet_list[jaf.getnet[id]].subnet[v[jaf.btnset[id]][1]].info do
                                        gkbnd=gkbnd+#jaf.inet_list[jaf.getnet[id]].subnet[v[jaf.btnset[id]][1]].info[i]
                                    end
                                    ndgclc=gkbnd
                                    ntgdc,ntdc=jaf.netgetdata[id],jaf.netdata[id]
                                    jaf.netgetdata[id]=0
                                    if v[jaf.btnset[id]][1]==jaf.getsubnet[id] and jaf.inet_loadfinish[id]>=1 then
                                       jaf.netgetdata[id]=ndgclc
                                       jaf.netdata[id]=ndgclc
                                    
                                    end
                                    jaf.netdata[id]=ndgclc
                                    jaf.getsubnet[id]=v[jaf.btnset[id]][1]
                                    jaf.netscroll[id]=v[jaf.btnset[id]][2]
                                 else
                                    if jaf.getsubnet[id]~=v[jaf.btnset[id]] then
                                       jaf.getsubnet[id]=v[jaf.btnset[id]]
                                       jaf.netgetdata[id]=0
                                       jaf.netscroll[id]=1
                                       jaf.netdata[id]=#jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]].info
                                    end
                                 end
                                 vm=jaf.inet_list[jaf.getnet[id]].subnet[jaf.getsubnet[id]]
                                 if vm.img and tonumber(#vm.img) then
                                    jaf.netdata[id]=jaf.netdata[id]+(#vm.img*12)
                                    jaf.getnetimage[id]=vm.img
                                 end
                       end
                  end
          end
end

addhook("clientdata","jaf.clientdata")
function jaf.clientdata(id,mode,x,y)
             if mode==2 then
                   jaf.mouseX[id]=x
                   jaf.mouseY[id]=y
             elseif mode==0 then
                   jaf.mouseSX[id]=x
                   jaf.mouseSY[id]=y
             end
end

addhook("attack","jaf.attack")
function jaf.attack(id)
             jaf.AFKtime[id]=0
             local funcaktif=0
             jaf.healthtimetofill[id]=120
             local tx=player(id,"tilex")
             local ty=player(id,"tiley")
             if player(id,"weapontype")==50 then
             for i=1,#jaf.noactionzone do
                    local v=jaf.noactionzone[i]
                    if v~=nil and jaf.checkarea(tx,ty,v[1],v[2],v[3],v[4]) then
                        msg2(id,merah.."You can take action in this area")
                        return false
                    end
             end
             end
             tx=math.floor((jaf.mouseX[id])/32)
             ty=math.floor((jaf.mouseY[id])/32)
             local tsx=jaf.mouseSX[id]
             local tsy=jaf.mouseSY[id]
             local atkwpnp=player(id,"weapontype")
             if atkwpnp==50 and jaf.classbtn[id]>0 and jaf.jailsel[id]<=0 and jaf.fishingstatus[id]<=0 and jaf.stunt[id]<=0 then
                if jaf.itemSEL[id][2]~=nil and jaf.itemSEL[id][2]>0 then
                   if jaf.list_items[jaf.itemSEL[id][2]]~=nil and jaf.list_items[jaf.itemSEL[id][2]].class~=nil then
                      jaf.list_items[jaf.itemSEL[id][2]].class[jaf.classbtn[id]].f(id)
                      jaf.classbtn[id]=0
                      return 1
                   end
                end
             end
             if atkwpnp==50 then
                if jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]>0 and jaf.list_items[jaf.itemSEL[id][3]]~=nil then
                   if jaf.list_items[jaf.itemSEL[id][3]].slay~=nil then
                      jaf.list_items[jaf.itemSEL[id][3]].slay(id)
                   end
                end
             end
             if  atkwpnp==50 and jaf.itemSEL[id][2]~=nil and jaf.itemSEL[id][2]>0 and jaf.jailsel[id]<=0 and jaf.fishingstatus[id]<=0 and jaf.stunt[id]<=0 then
                local gtp=jaf.skilltemppos[id]
                if jaf.list_items[jaf.itemSEL[id][2]]~=nil and jaf.list_items[jaf.itemSEL[id][2]].class~=nil then
                   if jaf.radiuscheck(tsx,tsy,gtp.x1,gtp.y1,30,30) then
                      funcaktif=1
                      if jaf.energy[id]<jaf.list_items[jaf.itemSEL[id][2]].class[1].energy and jaf.classtime1[id]<=0 then
                         msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],180).." ("..jaf.list_items[jaf.itemSEL[id][2]].class[1].energy..")")
                         return 1
                      end
                      if jaf.classtime1[id]>0 then
                         msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],179,jaf.classtime1[id]))
                         return 1
                      end
                      if jaf.classbtnimg[id][1]~=nil then
                         imagecolor(jaf.classbtnimg[id][1],000,000,000)
                         jaf.getsound(id,"JAF/otherworld/btn_click2.wav")
                      end
                      if jaf.list_items[jaf.itemSEL[id][2]].class[1].click then
                         jaf.classbtn[id]=1
                      else
                         jaf.list_items[jaf.itemSEL[id][2]].class[1].f(id)
                      end
                      if jaf.list_items[jaf.itemSEL[id][2]].class[1].energy~=nil and jaf.godmode[id]<1 then
                          jaf.energy[id]=jaf.energy[id]-jaf.list_items[jaf.itemSEL[id][2]].class[1].energy
                      end
                      if jaf.godmode[id]<1 then
                         jaf.classtime1[id]=jaf.list_items[jaf.itemSEL[id][2]].class[1].time
                      else
                         jaf.classtime1[id]=1
                      end
                      return 1
                   elseif jaf.radiuscheck(tsx,tsy,gtp.x2,gtp.y2,30,30) then
                      funcaktif=1
                      if jaf.energy[id]<jaf.list_items[jaf.itemSEL[id][2]].class[2].energy and jaf.classtime2[id]<=0 then
                         msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],180).." ("..jaf.list_items[jaf.itemSEL[id][2]].class[2].energy..")")
                         return 1
                      end
                      if jaf.classtime2[id]>0 then
                         msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],179,jaf.classtime2[id]))
                         return 1
                      end
                      if jaf.classbtnimg[id][2]~=nil then
                         imagecolor(jaf.classbtnimg[id][2],000,000,000)
                         jaf.getsound(id,"JAF/otherworld/btn_click2.wav")
                      end
                      if jaf.list_items[jaf.itemSEL[id][2]].class[2].click then
                         jaf.classbtn[id]=2
                      else
                         jaf.list_items[jaf.itemSEL[id][2]].class[2].f(id)
                      end
                      if jaf.list_items[jaf.itemSEL[id][2]].class[2].energy~=nil and jaf.godmode[id]<1 then
                          jaf.energy[id]=jaf.energy[id]-jaf.list_items[jaf.itemSEL[id][2]].class[2].energy
                      end
                      if jaf.godmode[id]<1 then
                         jaf.classtime2[id]=jaf.list_items[jaf.itemSEL[id][2]].class[2].time
                      else
                         jaf.classtime2[id]=1
                      end
                      return 1
                   end
                end
             end
             if player(id,"weapontype")==50 and jaf.jailsel[id]<=0 and jaf.infoplayer[id]>0 and jaf.lagging(id,1) then
                 for _,i in pairs(player(0,"tableliving")) do
                        ptx=player(i,"tilex")
                        pty=player(i,"tiley")
                        if i~=id and ptx==tx and pty==ty and jaf.infoplayer[i]>=1 then
                              jaf.showmyinfo(id,i)
                              jaf.tutor_check(id,15)
                              return 1
                        elseif i~=id and ptx==tx and pty==ty and jaf.infoplayer[i]<1 then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],162))
                              return 1
                        end
                 end
             end
             if player(id,"weapontype")==50 and jaf.jailsel[id]<=0 and jaf.checkposbtn(id,jaf.mouseSX[id],jaf.mouseSY[id])[1] and jaf.lagging(id,1) then
                          funcaktif=1
                          local v=jaf.checkposbtn(id,jaf.mouseSX[id],jaf.mouseSY[id])[2]
                          jaf.hudIMG_list.btn[v].func(id)
                          if jaf.mytutormenu[id]~=nil and jaf.list_tutor[jaf.mytutor[id]].btnid~=nil and jaf.list_tutor[jaf.mytutor[id]].btnid==v then
                             jaf.tutor_check(id,jaf.mytutor[id])
                          end
                          if jaf.btnposIMG[id]~=nil then
                              imagecolor(jaf.btnposIMG[id],030,144,255)
                          end
                          jaf.removebtnposIMG(id)
                          jaf.getsound(id,"JAF/otherworld/btn_click.wav")
             elseif player(id,"weapontype")==50 and jaf.checkposbtn2(id,jaf.mouseSX[id],jaf.mouseSY[id])[1] and jaf.lagging(id,1) then
                          funcaktif=1
                          local v=jaf.checkposbtn2(id,jaf.mouseSX[id],jaf.mouseSY[id])[2]
                          if tonumber(v) and jaf.btn2_IMG[id][v]~=nil then
                             if jaf.sv_imgalphafix==false then
                             imagealpha(jaf.btn2_IMG[id][v],0)
                             tween_alpha(jaf.btn2_IMG[id][v],400,1)
                             end
                             jaf.hudIMG_list.btn2[v].func(id)
                             if jaf.mytutormenu[id]~=nil and jaf.list_tutor[jaf.mytutor[id]].btnid~=nil and jaf.list_tutor[jaf.mytutor[id]].btn2id==v and v~=36 then
                                 jaf.tutor_check(id,jaf.mytutor[id])
                             end
                          end
                          jaf.getsound(id,"JAF/otherworld/btn_click2.wav")
             elseif player(id,"weapontype")==50 and jaf.infoplayer[id]>0 and jaf.jailsel[id]<=0 and entity((jaf.mouseX[id]-16)/32,(jaf.mouseY[id]-16)/32,"exists") and jaf.moremenu_entity[id]==nil and jaf.godmode[id]>0 and jaf.admin[id]>=#jaf.admintag then
                jaf.getentitypos[id]={jaf.mouseX[id],jaf.mouseY[id]}
                jaf.moremenu_entity[id]=jaf.menu2(id,4,15,16,17)
                funcaktif=1
             end
             if funcaktif<1 and player(id,"weapontype")==50 and jaf.jailsel[id]<=0 and jaf.wpnimghand[id]==1 and jaf.lagging(id,1) and jaf.stunt[id]<=0 then
                if player(id,"health")>0 and jaf.itemSEL[id][3]>0 and jaf.itemIMG[id][3]~=nil then
                      local v=jaf.itemSEL[id][3]
                      if jaf.list_items[v]~=nil and jaf.list_items[v].fireonatk~=nil and jaf.list_items[v].fireonatk and jaf.list_items[v].itemskill and jaf.list_items[v].itemskill[1]  and jaf.itemSKILLTIME[id]<1 then
                          local vi=jaf.list_items[v].itemskill
                          itemnameeq=jaf.list_items[v].name
                          skillshotoke=true
                          if vi[3]~=nil and type(vi[3])=="table" then
                             local ireqku=nil
                             local areqku=0
                             for i=1,#vi[3] do
                                 if vi[3][i]~=nil then
                                    ireqku=vi[3][i]
                                    areqku=1
                                    if type(ireqku)=="table" then
                                       areqku=ireqku[2]
                                       ireqku=ireqku[1]
                                    end
                                 else
                                    ireqku=nil
                                 end
                                 if ireqku~=nil and jaf.list_items[ireqku]~=nil and jaf.checkitem(id,ireqku).amount>=areqku then
                                    if (jaf.list_items[ireqku].inf==nil or jaf.list_items[ireqku].inf==false) then
                                       jaf.give_item(id,ireqku,-areqku)
                                    end
                                 elseif ireqku~=nil and jaf.list_items[ireqku]~=nil then
                                    parse('hudtxt2 '..id..' 41 "'..merah..jaf.sv_lang(jaf.lang[id],138,hijau..areqku..'x '..jaf.list_items[ireqku].name..merah,itemnameeq)..'" 425 380 1')
                                    parse('hudtxtalphafade '..id..' 41 5000 0.0')
                                    skillshotoke=false
                                 end
                             end
                          end
                          if skillshotoke==false then
                             return false
                          end
                          ist=jaf.list_items[v].itemskill[2]
                          if not tonumber(ist) then ist=3 end
                          if ist<=0 then ist=1 end
                          jaf.itemSKILLTIME[id]=ist
                          jaf.list_items[v].itemskill[1](id)
                      elseif jaf.itemSKILLTIME[id]>0 then
                          -- jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],109,jaf.itemSKILLTIME[id]))
                      end
                elseif player(id,"health")<1 then
                      jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                end
             end
end

addhook("hit","jaf.hit")
function jaf.hit(pl,id,wpn,hpdmg) -- pl = victim, id = attacker
          if wpn==86 or wpn==75 and pl>0 and player(pl,"speedmod")>=-15 then parse("speedmod "..pl.." -15") end
          if wpn==86 and pl>0 and id~=nil and id>0 and pl~=id then
            jaf.hitplayer(pl,id,itemtype(wpn,"name"),200)
            jaf.enemyhealthshow(id,player(pl,"name"),jaf.health[pl]+player(pl,"health"),200)
            return 1
          end
          if pl>0 then
                  tx=player(pl,"tilex")
                  ty=player(pl,"tiley")
                  for i=1,#jaf.safezone do
                      local v=jaf.safezone[i]
                      if jaf.checkarea(tx,ty,v[1],v[2],v[3],v[4]) then
                                 return 1
                      end
                  end
                  if jaf.war[id]>0 and jaf.clan[pl]==jaf.clan[id] then
                                 return 1
                  end
	          if wpn==35 and pl>0 and jaf.joinarenaid[id]==2 and jaf.godmode[id]<1 and jaf.areameid[id]>0 and jaf.arealocated[jaf.areameid[id]][5]=="AWP Arena" then
                        parse("customkill "..id.." \"AWP\" "..pl)
                  elseif wpn==75 and pl>0 and jaf.joinarenaid[id]==3 and jaf.godmode[id]<1 and jaf.areameid[id]>0 and jaf.arealocated[jaf.areameid[id]][5]=="Snowball Arena" and id~=pl then
                        parse("customkill "..id.." \"Snowball\" "..pl)
                  end
                  if jaf.admin[pl]>0 and jaf.godmode[pl]>0 then
                               jaf.enemyhealthshow(id,player(pl,"name"),jaf.health[pl]+player(pl,"health"))
                               return 1
                  elseif jaf.admin[id]>0 and jaf.godmode[id]>0 then
                               jaf.enemyhealthshow(id,player(pl,"name"),jaf.health[pl]+player(pl,"health"))
                               return 1
                  end
                  if jaf.itemSEL[pl][4] and jaf.itemSEL[pl][4]>0 then
                               jaf.pet_target[pl]=id
                  end
                  if id>0 and wpn==50 and jaf.itemIMG[id][3]~=nil then
                               jaf.hitplayer(pl,id,nil,(hpdmg+math.floor(3/100*jaf.itemDMG[id])))
                               jaf.enemyhealthshow(id,player(pl,"name"),jaf.health[pl]+player(pl,"health"),(hpdmg+math.floor(3/100*jaf.itemDMG[id])))
                               return 1
                  elseif id>0 then
                               parse("shake "..pl.." 10")
                               jaf.hitplayer(pl,id,itemtype(wpn,"name"),hpdmg)
                               jaf.enemyhealthshow(id,player(pl,"name"),jaf.health[pl]+player(pl,"health"),hpdmg)
                               return 1
                  else
                               parse("shake "..pl.." 10")
                               jaf.hitplayer(pl,0,"",hpdmg)
                               return 1
                  end
          end
end

addhook("use","jaf.usehook")
function jaf.usehook(id)
             local x=player(id,"tilex")
             local y=player(id,"tiley")
             jaf.getitemdrop(id,x,y)
             if x==98 and y==84 and jaf.level[id]>=20 and jaf.jailsel[id]<=0 then
                jaf.achv_get(id,19)
                parse("setpos "..id.." "..(9*32+16).." "..(23*32+16))
             elseif x==191 and y==16 then
                jaf.achv_get(id,24)
                parse("setpos "..id.." "..(201*32+16).." "..(68*32+16))
             elseif x==37 and y==233 then
                parse("setpos "..id.." "..(117*32+16).." "..(209*32+16))
             elseif x==117 and y==209 then
                parse("setpos "..id.." "..(37*32+16).." "..(233*32+16))
             elseif x==313 and y==282 and jaf.galaxyE2[id]>=15 then
                parse("setpos "..id.." "..(335*32+16).." "..(119*32+16))
	     elseif x==8 and y==31 then
		parse("setpos "..id.." "..(121*32+16).." "..(234*32+16))
	     elseif x==61 and y==23 then
		parse("setpos "..id.." "..(381*32+16).." "..(342*32+16))
             elseif (x==81 and y==11) or (x==82 and y==12) then
                if jaf.jobid[id]==5 then
                   if jaf.checkitem(id,388).amount>=10 then
                      jaf.crystal[id]=jaf.crystal[id]+5
                      msg2(id,hijau..jaf.sv_lang(jaf.lang[id],159,"5 SCs"))
                      jaf.give_item(id,388,-10)
                   else
                      msg2(id,merah..jaf.sv_lang(jaf.lang[id],185,jaf.list_items[388].name).."@C")
                   end
                else
                   msg2(id,merah.."Only for Miner!")
                end
             end
             if jaf.npcpressedid[id]>0 then
                local i=jaf.npcpressedid[id]
                local px=player(id,"x")
                local py=player(id,"y")
                jaf.quest_getitem(id,4,i)
                jaf.npcemote_remove(i)
                jaf.npc_list[i].action(id)
                rot = -math.deg(math.atan2((jaf.npc_x[i]-px), (jaf.npc_y[i]-py)))
                tween_move(jaf.npc_img[i],400,jaf.npc_x[i],jaf.npc_y[i],rot)
                jaf.npc_ac[i]=id
                jaf.npcsay_remove(i)
                jaf.npcsay_img[i]=image("gfx/hud_chat.png",jaf.npc_x[i],jaf.npc_y[i],1)
                tween_color(jaf.npcsay_img[i],500,000,255,255)
                tween_move(jaf.npcsay_img[i],3000,jaf.npc_x[i],jaf.npc_y[i]-20)
                tween_alpha(jaf.npcsay_img[i],3000,0)
                jaf.tutor_check(id,14)
             end
end

addhook("minute","jaf.minute")
function jaf.minute()
            if jaf.serverminutes<60 then
                    jaf.serverminutes=jaf.serverminutes+1
            end
            if jaf.serverminutes==50 then
                    parse("trigger w_rain")
                    msg(cyan.."Its now rain...")
                    jaf.clear_npc_map()
            end
            if jaf.serverminutes>=60 then
                    jaf.serverminutes=0
                    parse("trigger w_rain")
                    local getpltyuk={}
                    local getplctyuk=0
                    for _,i in pairs(player(0,"table")) do
                       jaf.give_shell(i,150000)
                    end
                    msg(kuning.."[SR] "..ungu.."Server give 150K Shell to all Players in server")
            end
            local msgmintbl={hijau.."Create your own "..merah.."clan"..hijau.." here and manage your clan to become "..merah.."1st clan.",hijau.."Collect more Achievement as possible you can!",hijau.."Make a "..merah.."War Clan"..hijau.." with others and increase your reputation clan.",hijau.."Every player who have "..merah.."Member Sign"..hijau.." is actually Member on server",hijau.."Put your comment or suggestion to server by typing "..merah.."@cmt <comment>",hijau.."Clear chat at your screen by typing "..merah.."@clear",hijau.."You should transfer your SCs by using Bank System.",hijau.."There are many of "..merah.."Secret"..hijau.." are in the Map.",hijau.."Some "..merah.."NPCs"..hijau.." May will tell you "..merah.."Secret"..hijau.." In the Map, Just ask them."}
            msg(msgmintbl[math.random(1,#msgmintbl)])
end

addhook("hitzone","jaf.hitzone")
function jaf.hitzone(iid,id,oid,wpn,x,y,dmg)
         if id>0 then
               local i=0
               local i2=0
               if iid~=nil and string.find(tostring(iid),"xm") then
                  i=tonumber(string.sub(iid,3))
                  i2=math.floor(tonumber(i))
               elseif iid~=nil then
                  i=jaf.monsterobjid[iid]
                  if i~=nil then
                     i2=math.floor(jaf.monsterobjid[iid])
                  end
               else
                  for o,o2 in pairs(jaf.monsterid) do
                       local sv=jaf.listmonster[o2]
                       local smx,smy=jaf.monsterx[o],jaf.monstery[o]
                       local smsx,smsy=math.floor(sv.img[2]*sv.scale[1]),math.floor(sv.img[2]*sv.scale[2])
                       if jaf.monsterHP[o]>0 and jaf.monsterIMG[o]~=nil and jaf.radiuscheck(x,y,smx,smy,smsx,smsy) then
                          i=o
                          i2=o2
                          break
                       end
                  end
               end
                       if (i2<1 or jaf.listmonster[i2]==nil) then return false end
                       local ddr=14 --- dodge range
                       local isd=false --- is dodge
                       local v=jaf.listmonster[i2]
                       if v.dodge~=nil and v.dodge then ddr=v.dodge end
                       if math.random(1,ddr)==math.random(1,ddr) then
                          isd=true
                       end
                       local mx,my=jaf.monsterx[i],jaf.monstery[i]
                       local msx,msy=math.floor(v.img[2]*v.scale[1]),math.floor(v.img[2]*v.scale[2])
                       if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil then
                       jaf.targetmon[id]=i
                       jaf.pet_montarget[id]=i
                       jaf.monsterT[i]=id
                       if math.random(1,7)==3 then
                          demgi=math.random((dmg+jaf.itemDMG[id])*5/100,(dmg+jaf.itemDMG[id]))
                       else
                          demgi=math.random((dmg+jaf.itemDMG[id])*5/100,math.floor((dmg+jaf.itemDMG[id])/2))
                       end
                               if wpn~=50 or jaf.itemIMG[id][3]==nil or jaf.wpnimghand[id]<1 then demgi=0 end
                               if isd==false and (dmg+demgi)<jaf.monsterHP[i] then
                                  if wpn==50 then
                                      jaf.energy[id]=jaf.energy[id]+math.random(0,1)
                                      jaf.getsound2(jaf.monsterx[i],jaf.monstery[i],"weapons/knife_hit.wav",(12*32),(12*32))
                                      demg=demgi
                                      if jaf.itemIMG[id][3]==nil or jaf.wpnimghand[id]<1 then
                                         demg=dmg
                                      end
                                      jaf.monsterHP[i]=jaf.monsterHP[i]-demg
                                      jaf.enemyhealthshow(id,jaf.listmonster[i2].name,jaf.monsterHP[i],demg)
                                  else
                                      jaf.getsound2(jaf.monsterx[i],jaf.monstery[i],"weapons/machete_hitwall.wav",(12*32),(12*32))
                                      jaf.monsterHP[i]=jaf.monsterHP[i]-dmg
                                      jaf.enemyhealthshow(id,jaf.listmonster[i2].name,jaf.monsterHP[i],dmg)
                                  end
                                      jaf.enemyhealthshow(id,jaf.listmonster[i2].name,jaf.monsterHP[i])
                               elseif isd==false then
                                      if math.random(1,5)==1 then
                                         parse("spawnprojectile 0 86 "..jaf.monsterx[i].." "..jaf.monstery[i].." 32 -90")
                                         parse("spawnprojectile 0 86 "..jaf.monsterx[i].." "..jaf.monstery[i].." 32 10")
                                         parse("spawnprojectile 0 86 "..jaf.monsterx[i].." "..jaf.monstery[i].." 32 160")
                                      else
                                         parse("effect \"colorsmoke\" "..jaf.monsterx[i].." "..jaf.monstery[i].." 52 32 255 255 255")
                                      end
                                      jaf.removemonster(i)
                                      local droprate=1
                                      local droprategot=1
                                      if jaf.listmonster[i2].droprate~=nil then
                                         droprate=math.random(1,jaf.listmonster[i2].droprate[1])
                                         droprategot=jaf.listmonster[i2].droprate[2]
                                      end
                                      for _,ii in pairs(player(0,"tableliving")) do
                                           if jaf.targetmon[ii]==i then
                                                  jaf.listmonster[i2].drop(ii,i2,mx,my)
                                                  if droprate==droprategot and jaf.listmonster[i2].droprate~=nil then
                                                    jaf.listmonster[i2].droprate.func(ii,i2)
                                                  end
                                                  jaf.targetmon[ii]=0
                                                  jaf.quest_getitem(ii,2,i)
                                                  jaf.targetmon[ii]=0
                                                  jaf.tutor_check(ii,16)
                                           end
                                      end
                                      parse("setscore "..id.." "..player(id,"score")+2)
                                      jaf.listmonster[i2].dropitem(i2,mx,my)
                                      jaf.monsterTS[i]=jaf.listmonster[i2].spawntime
                                      jaf.enemyhealthshow(id,jaf.listmonster[i2].name,"Has died",dmg)
                                      jaf.getsound2(jaf.monsterx[i],jaf.monstery[i],"JAF/otherworld/monster_die"..math.random(1,2)..".ogg",(12*32),(12*32))
                               else
                                      jaf.getsound2(jaf.monsterx[i],jaf.monstery[i],"weapons/machete_slash.wav",(12*32),(12*32))
                                      jaf.enemyhealthshow(id,jaf.listmonster[i2].name,jaf.monsterHP[i],"DODGE")
                               end
                       end
         end
end

addhook("movetile","jaf.movetile")
function jaf.movetile(id,tx,ty)
         jaf.AFKtime[id]=0
         jaf.save_posx[id]=tx
         jaf.save_posy[id]=ty
         if ty<10 and jaf.movetile_action[tostring(tx).."+0.0"..tostring(ty)]~=nil then
            jaf.movetile_action[tostring(tx).."+0.0"..tostring(ty)].ac(id)
         elseif jaf.movetile_action[tostring(tx).."+0."..tostring(ty)]~=nil then
            jaf.movetile_action[tostring(tx).."+0."..tostring(ty)].ac(id)
         end
         if ty<10 and jaf.npc_pressedpos[tostring(tx).."+0.0"..tostring(ty)]~=nil then
            parse('hudtxt2 '..id..' 21 "'..hijau..''..jaf.sv_lang(jaf.lang[id],188)..'" 425 188 1')
            jaf.npcpressedid[id]=jaf.npc_pressedpos[tostring(tx).."+0.0"..tostring(ty)]
         elseif jaf.npc_pressedpos[tostring(tx).."+0."..tostring(ty)]~=nil then
            parse('hudtxt2 '..id..' 21 "'..hijau..''..jaf.sv_lang(jaf.lang[id],188)..'" 425 188 1')
            jaf.npcpressedid[id]=jaf.npc_pressedpos[tostring(tx).."+0."..tostring(ty)]
         else
            parse('hudtxt2 '..id..' 21 "" 425 188 1')
            jaf.npcpressedid[id]=0
         end
         if (jaf.croppos[id].tx>0 or jaf.croppos[id].ty>0) then
            if jaf.radiuscheck(tx*32,ty*32,jaf.croppos[id].tx*32,jaf.croppos[id].ty*32,32,32)==false then
                jaf.croppos[id]={tx=0,ty=0}
                jaf.croptime[id]=0
                jaf.cropstat[id]=false
                jaf.bar2_remove(id,3)
                jaf.removestat2IMG(id,8)
            end
         end
         if entity(tx,ty,"typename")=="Env_Object" and entity(tx,ty,"name")=="treegifter" then
                 local gftreer=math.random(1,10)
                 if gftreer==4 then
                    local gtreegc=math.random(1,15)
                    jaf.give_item(id,108,gtreegc)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,gtreegc.." "..jaf.list_items[108].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.exp[id]=jaf.exp[id]+8
                 elseif gftreer==8 and math.random(1,22)==7 then
                    jaf.give_item(id,109,1)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,"1 "..jaf.list_items[109].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.exp[id]=jaf.exp[id]+50
                 end
         elseif entity(tx,ty,"typename")=="Env_Object" and entity(tx,ty,"name")=="streegifter" then
                 local gftreer=math.random(1,14)
                 if gftreer==4 then
                    local gtreegc=math.random(7,22)
                    jaf.give_item(id,108,gtreegc)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,gtreegc.." "..jaf.list_items[108].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.exp[id]=jaf.exp[id]+70
                 elseif gftreer==8 and math.random(1,22)==9 then
                    jaf.give_item(id,109,1)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,"1 "..jaf.list_items[109].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.exp[id]=jaf.exp[id]+250
                 end
         elseif entity(tx,ty,"typename")=="Env_Object" and entity(tx,ty,"name")=="ttodark" then
                 if math.random(1,4)==3 then
                    parse("setpos "..id.." "..(136*32+16).." "..(129*32+16))
                 end
         end
end

addhook("suicide","jaf.suicide")
function jaf.suicide(id)
         return 1
end

addhook("kill","jaf.kill")
function jaf.kill(id,pl,wpn,x,y) -- id = killer, pl = victim
         if jaf.war[id]>0 and jaf.war[pl]>0 and jaf.war[id]==jaf.war[pl] and jaf.clan[id]~=jaf.clan[pl] and jaf.clan[id]>0 then
               jaf.clanwar_score[jaf.war[id]][jaf.warset[id]]=jaf.clanwar_score[jaf.war[id]][jaf.warset[id]]+1
               jaf.clan_reputation[jaf.clan[id]]=jaf.clan_reputation[jaf.clan[id]]+2
               jaf.exp[id]=jaf.exp[id]+100
         end
         jaf.killstreak[id]=jaf.killstreak[id]+1
         if jaf.killstreak[id]==2 then
            jaf.getsound3("JAF/otherworld/doublekill.ogg")
            msg(putih..player(id,"name").." Made a Double Kill!@C")
         elseif jaf.killstreak[id]==3 then
            jaf.getsound3("JAF/otherworld/triplekill.ogg")
            msg(putih..player(id,"name").." Made a Triple Kill!@C")
         elseif jaf.killstreak[id]==10 then
            jaf.getsound3("JAF/otherworld/ultrakill.ogg")
            msg(putih..player(id,"name").." Made a Ultra Kill!@C")
         end
         jaf.quest_getitem(id,1)
end

addhook("usebutton","jaf.usebutton")
function jaf.usebutton(id,tx,ty)
         if entity(tx,ty,"name")=="spawnpos" then
             if jaf.saveposx[id]<1 and jaf.saveposy[id]<1 then
                menu(id,jaf.sv_lang(jaf.lang[id],190)..",Yes|200 SCs,No,,,(Remove)")
             else
                menu(id,jaf.sv_lang(jaf.lang[id],190)..",Yes|200 SCs,No,,,Remove")
             end
             jaf.presavepos[id]={tx,ty}
         end
         for i=1,#jaf.clanwar_pos do
             if tx==jaf.clanwar_pos[i][0][1] and ty==jaf.clanwar_pos[i][0][2] then
                     jaf.clanwar_setwarpos(id,i)
                     jaf.clanwar_checkstart(i)
                     return 1
             end
         end
         if tx==120 and ty==241 then
            menu(id,"Battle Arena,Mars Arena,AWP Arena,Snowball Arena")
         end
         if (tx==149 and ty==333) or (tx==149 and ty==338) then
            jaf.svj_msg2(id,hijau.."Weapon Point Count: "..jaf.wpnpointku[id])
         end
         if tx==278 and ty==207 then
            jaf.dropitem(0,109,277,208)
         end
         if ty<10 then
            ty=tonumber(tostring("0.0"..ty))
         else
            ty=tonumber(tostring("0."..ty))
         end
         if jaf.house_list[tx+ty]~=nil and jaf.house_list[tx+ty].owner<=0 then
                jaf.prahouseid[id]=tx+ty
                menu(id,"Set House,(Name|"..jaf.house_list[tx+ty].name.."),Own This!")
         elseif jaf.house_list[tx+ty]~=nil and jaf.house_list[tx+ty].owner>0 then
                if jaf.house_list[tx+ty].owner==id then
                   if jaf.house_list[tx+ty].doort~=nil and jaf.house_list[tx+ty].doort then
                      parse("trigger "..jaf.house_list[tx+ty].doort)
                   end
                else
                   msg2(id,merah..jaf.sv_lang(jaf.lang[id],169,player(jaf.house_list[tx+ty].owner,"name")))
                end
         end
end

addhook("select","jaf.select")
function jaf.select(id,type)
     if jaf.itemSEL[id][3]>0 then
        local imgl=jaf.list_items[jaf.itemSEL[id][3]].attbt.img
        local imgst=jaf.list_items[jaf.itemSEL[id][3]].attbt[2]
        local imgrc=jaf.list_items[jaf.itemSEL[id][3]].attbt.rc
        local imgcwp=jaf.list_items[jaf.itemSEL[id][3]].comwpn
        if type~=50 and jaf.itemIMG[id][3]~=nil then
            freeimage(jaf.itemIMG[id][3])
            jaf.itemIMG[id][3]=image(imgl,1,0,imgst+id)
            imagescale(jaf.itemIMG[id][3],1,-1)
            jaf.wpnimghand[id]=0
            if imgcwp~=nil and imgcwp then
               imagepos(jaf.itemIMG[id][3],320,240,0)
            end
        elseif type==50 and jaf.itemIMG[id][3]~=nil then
            freeimage(jaf.itemIMG[id][3])
            jaf.itemIMG[id][3]=image(imgl,1,0,imgst+id)
            if imgrc and tonumber(imgrc) then
               if imgrc==1 then
                  imagescale(jaf.itemIMG[id][3],1,-1)
               elseif imgrc==2 and jaf.handwpn[id]==1 then
                  imagescale(jaf.itemIMG[id][3],-1,1)
               end
            elseif jaf.handwpn[id]==2 then
               imagescale(jaf.itemIMG[id][3],-1,1)
            end
            if imgcwp~=nil and imgcwp then
               imagepos(jaf.itemIMG[id][3],320,240,0)
            end
            jaf.wpnimghand[id]=1
        end
     end
end

addhook("drop","jaf.drop")
function jaf.drop(id)
         if player(id,"weapontype")~=50 then
            parse("strip "..id.." "..player(id,"weapontype"))
            parse("setweapon "..id.." 50")
         end
         return 1
end


addhook("objectdamage","jaf.objectdamage")
function jaf.objectdamage(obj,dmg,id)
local objett=object(obj,"type")
local txo=object(obj,"tilex")
local tyo=object(obj,"tiley")
        if objett==5 then --- wall 3
           local wpnpl=player(id,"weapontype")
           if entity(txo,tyo,"typename")=="Env_Building" and entity(txo,tyo,"name")=="wpnpoint" and wpnpl==3 then
              if jaf.JAFmember[id]>0 then
                 jaf.wpnpointku[id]=jaf.wpnpointku[id]+2
                 parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],128,"2x Weapon Point","Building")..'" 425 380 1')
                 parse('hudtxtalphafade '..id..' 41 3000 0.0')
              else
                 jaf.wpnpointku[id]=jaf.wpnpointku[id]+1
                 parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],128,"1x Weapon Point","Building")..'" 425 380 1')
                 parse('hudtxtalphafade '..id..' 41 3000 0.0')
              end
              jaf.exp[id]=jaf.exp[id]+50
              return 1
           elseif entity(txo,tyo,"typename")=="Env_Building" and entity(txo,tyo,"name")=="wpnpoint"then
              return 1
           end
           if entity(txo,tyo,"exists") and entity(txo,tyo,"typename")=="Env_Building" and (wpnpl==50 or wpnpl==69 or wpnpl==85 or wpnpl==78) then
              jaf.cropstat[id]=true
              if jaf.croppos[id].tx<1 and jaf.croppos[id].ty<1 then
                 jaf.croppos[id]={tx=txo,ty=tyo}
                 jaf.status2_create(id,8)
                 jaf.bar2_draw(id,3)
              end
              if jaf.croptime[id]>=jaf.svj_croptimemax then
                jaf.croptime[id]=0
                jaf.croppos[id]={tx=0,ty=0}
                jaf.cropstat[id]=false
                jaf.bar2_remove(id,3)
                jaf.removestat2IMG(id,8)
                jaf.exp[id]=jaf.exp[id]+125
                if entity(txo,tyo,"name")=="owood" then -- wood
                    local gtwdo=math.random(1,8)
                    if wpnpl==85 then
                       gtwdo=math.random(4,8)
                    end
                    jaf.give_item(id,104,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,gtwdo.." "..jaf.list_items[104].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="ostone" then -- stone
                    local gtwdo=math.random(1,5)
                    if wpnpl==85 then
                       gtwdo=math.random(2,5)
                    end
                    jaf.give_item(id,105,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],159,gtwdo.." "..jaf.list_items[105].name))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="osstone" then -- super stone
                    local gtwdo=math.random(3,8)
                    if wpnpl==85 then
                       gtwdo=math.random(5,8)
                    end
                    jaf.give_item(id,105,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],159,gtwdo.." "..jaf.list_items[105].name))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="oswood" then -- super wood
                    local gtwdo=math.random(4,15)
                    jaf.give_item(id,104,gtwdo)
                    if wpnpl==85 then
                       gtwdo=math.random(7,15)
                    end
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,gtwdo.." "..jaf.list_items[104].name,jaf.sv_lang(jaf.lang[id],154)))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="osteel" then -- steel
                    local gtwdo=math.random(1,3)
                    if wpnpl==85 then
                       gtwdo=math.random(2,3)
                    end
                    jaf.give_item(id,106,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],159,gtwdo.." "..jaf.list_items[106].name))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="ogold" then -- gold
                    local gtwdo=1
                    if wpnpl==85 then
                       gtwdo=math.random(1,2)
                    end
                    jaf.give_item(id,387,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],159,gtwdo.." "..jaf.list_items[387].name))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                elseif entity(txo,tyo,"name")=="ocrystal" then -- crystal
                    local gtwdo=1
                    if wpnpl==85 then
                       gtwdo=math.random(1,2)
                    end
                    jaf.give_item(id,388,gtwdo)
                    jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],159,gtwdo.." "..jaf.list_items[388].name))
                    jaf.getsound(id,"JAF/otherworld/pickup.wav")
                end
              end
           end
           return 1
        elseif object(obj,"typename")~="NPC" and entity(txo,tyo,"typename")=="Env_Building" then
           if entity(txo,tyo,"name")=="nodmg" then -- no damage building
              return 1
           end
        elseif object(obj,"typename")=="NPC" then
           local n_dmg_c=0
           if player(id,"weapontype")==50 then
              if (itemskilldmg==nil or itemskilldmg==false) and jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]>0 then
                 n_dmg_c=math.random((jaf.itemDMG[id])*1/100,(jaf.itemDMG[id]*20/100))
              end
           end
           if tostring(dmg):find("o") then
              dmg=tonumber(tostring(dmg):sub(2))
              n_dmg_c=0
           end
           if id>0 and object(obj,"player")==1 then --- zombie
                  if math.random(1,14)==2 then
                    local rot1 = object(obj,"rot")
                    if rot1 < -90 then rot1 = rot1 + 360 end
                    local angle = math.rad(math.abs( rot1 + 90 )) - math.pi
                    local x = object(obj,"x") + math.cos(angle) * 30
                    local y = object(obj,"y") + math.sin(angle) * 30
                    parse("spawnprojectile 0 86 "..x.." "..y.." 90000 "..rot1)
                  end
                  if jaf.sv_objid[obj]==nil then jaf.sv_objid[obj]=1500 end
                  jaf.enemyhealthshow(id,"Zombie",jaf.sv_objid[obj]+object(obj,"health"),(dmg+n_dmg_c))
                  if (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)>0 then
                     jaf.sv_objid[obj]=jaf.sv_objid[obj]-dmg-n_dmg_c
                     return 1
                  elseif (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)<=0 then
                     jaf.exp[id]=jaf.exp[id]+250
                     parse("killobject "..obj)
                     parse("setscore "..id.." "..player(id,"score")+1)
                     jaf.give_shell(id,500)
                     jaf.sv_objid[obj]=nil
                     msg2(id,hijau..""..jaf.sv_lang(jaf.lang[id],128,"Zombie Heart","Zombie"))
                     jaf.svj_npc_zombiec=jaf.svj_npc_zombiec-1
                     jaf.enemyhealthshow(id,"Zombie","Died",(dmg+n_dmg_c))
                     jaf.give_item(id,134,1)
                     jaf.tutor_check(id,17)
                     return 1
                  end
          elseif object(obj,"player")==2 then --- headcrab
                  if jaf.sv_objid[obj]==nil then jaf.sv_objid[obj]=300 end
                  jaf.enemyhealthshow(id,"Headcrab",jaf.sv_objid[obj]+object(obj,"health"),(dmg+n_dmg_c))
                  if (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)>0 then
                     jaf.sv_objid[obj]=jaf.sv_objid[obj]-dmg-n_dmg_c
                     return 1
                  elseif (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)<=0 then
                     jaf.exp[id]=jaf.exp[id]+150
                     parse("killobject "..obj)
                     jaf.sv_objid[obj]=nil
                     jaf.give_shell(id,300)
                     parse("setscore "..id.." "..player(id,"score")+1)
                     jaf.svj_npc_headcrabc=jaf.svj_npc_headcrabc-1
                     jaf.enemyhealthshow(id,"Headcrab","Died",(dmg+n_dmg_c))
                     return 1
                  end
          elseif object(obj,"player")==3 then --- snark
                  if jaf.sv_objid[obj]==nil then jaf.sv_objid[obj]=150 end
                  jaf.enemyhealthshow(id,"Snark",jaf.sv_objid[obj]+object(obj,"health"),(dmg+n_dmg_c))
                  if (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)>0 then
                     jaf.sv_objid[obj]=jaf.sv_objid[obj]-dmg-n_dmg_c
                     jaf.enemyhealthshow(id,"Snark",jaf.sv_objid[obj]+object(obj,"health"))
                     return 1
                  elseif (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)<=0 then
                     jaf.exp[id]=jaf.exp[id]+125
                     parse("killobject "..obj)
                     jaf.sv_objid[obj]=nil
                     jaf.give_shell(id,200)
                     parse("setscore "..id.." "..player(id,"score")+1)
                     jaf.svj_npc_snarkc=jaf.svj_npc_snarkc-1
                     jaf.enemyhealthshow(id,"Snark","Died",(dmg+n_dmg_c))
                     return 1
                  end
          elseif object(obj,"player")==4 then --- vortigaunt
                  if jaf.sv_objid[obj]==nil then jaf.sv_objid[obj]=2500 end
                  jaf.enemyhealthshow(id,"Vortigaunt",jaf.sv_objid[obj]+object(obj,"health"),(dmg+n_dmg_c))
                  if (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)>0 then
                     jaf.sv_objid[obj]=jaf.sv_objid[obj]-dmg-n_dmg_c
                     return 1
                  elseif (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)<=0 then
                     jaf.exp[id]=jaf.exp[id]+400
                     parse("killobject "..obj)
                     jaf.sv_objid[obj]=nil
                     jaf.give_shell(id,700)
                     parse("setscore "..id.." "..player(id,"score")+1)
                     jaf.enemyhealthshow(id,"Vortigaunt","Died",(dmg+n_dmg_c))
                     return 1
                  end
          elseif object(obj,"player")==5 then --- soldier
                  if jaf.sv_objid[obj]==nil then jaf.sv_objid[obj]=2000 end
                  jaf.enemyhealthshow(id,"Soldier",jaf.sv_objid[obj]+object(obj,"health"),(dmg+n_dmg_c))
                  if (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)>0 then
                     jaf.sv_objid[obj]=jaf.sv_objid[obj]-dmg-n_dmg_c
                     return 1
                  elseif (jaf.sv_objid[obj]+object(obj,"health")-dmg-n_dmg_c)<=0 then
                     jaf.exp[id]=jaf.exp[id]+375
                     parse("killobject "..obj)
                     jaf.sv_objid[obj]=nil
                     jaf.give_shell(id,650)
                     parse("setscore "..id.." "..player(id,"score")+1)
                     jaf.enemyhealthshow(id,"Soldier","Died",(dmg+n_dmg_c))
                     return 1
                  end
           end
        end
end


addhook("build","jaf.build")
function jaf.build(id,type,x,y)
         if type==5 then
            return 1
         end
end

addhook("objectupgrade","jaf.objectupgrade")
function jaf.objectupgrade(ob,player,progress,total)
         return 1
end

addhook("attack2","jaf.attack2")
function jaf.attack2(id,mode)
       jaf.AFKtime[id]=0
       local atkwpnp=player(id,"weapontype")
       if atkwpnp==50 and jaf.itemSEL[id][3]>0 and jaf.wpnimghand[id]==1 and jaf.lagging(id,1) and jaf.stunt[id]<=0 then
                jaf.healthtimetofill[id]=120
                local va2=jaf.itemSEL[id][3]
                if jaf.list_items[va2].rightatk~=nil and jaf.list_items[va2].rightatk then
                    if player(id,"health")>0 and jaf.itemSEL[id][3]>0 and jaf.itemIMG[id][3]~=nil then
                        jaf.list_items[va2].rightatk(id)
                    end
                end
       end
       if atkwpnp==50 then
           local tsx=jaf.mouseSX[id]
           local tsy=jaf.mouseSY[id]
           local gtp=jaf.skilltemppos[id]
           local mid=jaf.skilltmoveid[id]
           if mid<=0 then
              if jaf.radiuscheck(tsx,tsy,gtp.x1,gtp.y1,30,30) then
                 jaf.skilltmoveid[id]=1
                 jaf.tutor_check(id,18)
              elseif jaf.radiuscheck(tsx,tsy,gtp.x2,gtp.y2,30,30) then
                 jaf.skilltmoveid[id]=2
                 jaf.tutor_check(id,18)
              end
           else
              if mid==1 then
                 jaf.tutor_check(id,19)
                 jaf.skilltemppos[id].x1=tsx
                 jaf.skilltemppos[id].y1=tsy
                 if jaf.classbtnimg[id][1]~=nil then
                    imagepos(jaf.classbtnimg[id][1],tsx,tsy,0)
                 end
                 if jaf.skilltemp1[id]~=nil then
                    imagepos(jaf.skilltemp1[id],tsx,tsy,0)
                 end
                 jaf.skilltmoveid[id]=0
              elseif mid==2 then
                 jaf.tutor_check(id,19)
                 jaf.skilltemppos[id].x2=tsx
                 jaf.skilltemppos[id].y2=tsy
                 if jaf.classbtnimg[id][2]~=nil then
                    imagepos(jaf.classbtnimg[id][2],tsx,tsy,0)
                 end
                 if jaf.skilltemp2[id]~=nil then
                    imagepos(jaf.skilltemp2[id],tsx,tsy,0)
                 end
                 jaf.skilltmoveid[id]=0
              end
           end
       end
end

addhook("projectile","jaf.projectile_hook")
function jaf.projectile_hook(id,weapon,x,y)
    if weapon==54 then
          if jaf.itemSEL[id][2]~=nil and jaf.itemSEL[id][2]==160 then
             local kembangapiwarna={255,000}
              parse("effect \"colorsmoke\" "..x.." "..y.." 50 70 "..kembangapiwarna[math.random(1,2)].." "..kembangapiwarna[math.random(1,2)].." "..kembangapiwarna[math.random(1,2)])
              parse("effect \"colorsmoke\" "..x.." "..y.." 50 70 "..kembangapiwarna[math.random(1,2)].." "..kembangapiwarna[math.random(1,2)].." "..kembangapiwarna[math.random(1,2)])
              parse("explosion "..x.." "..y.." 5 0 "..id)
              local idygkosong=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
              jaf.itemSKILLIMG[id][idygkosong]=image(jaf.locgfx.."boom!.png",x,y,1,0)
              tween_move(jaf.itemSKILLIMG[id][idygkosong],400,x,y-64,0)
              tween_alpha(jaf.itemSKILLIMG[id][idygkosong],1000,0.4)
jaf.skillitem2(id,math.random(100,700),{"gfx/JAF/line.png",{3,200},{000,000,000}},700,(5*32+16),nil,{"flare",{000,000,000},10,40},"wall",(-player(id,"rot")+jaf.rot_target(x,y,player(id,"x"),player(id,"y"))),{x,y})
              function jaf.kembangapitim(id,kosong,skx,sky)
                       jaf.varfreeimage(kosong,jaf.itemSKILLIMG[id])
              end
              local kembangapitim=timerEx((1000),jaf.kembangapitim,1,id,idygkosong,x,y)
          end
    end
end


addhook("build","jaf.build")
function jaf.build(id,type,x,y)
         if jaf.admin[id]<3 then
            msg2(id,merah.."You dont have permission to do it.")
            return 1
         end
end

addhook("walkover","jaf.walkoverhook")
function jaf.walkoverhook(id,a,od)
      if od == 66 then
            jaf.give_shell(id,100)
            parse("removeitem "..a)
            return 1
      elseif od == 67 then
            jaf.give_shell(id,500)
            parse("removeitem "..a)
            return 1
      elseif od == 68 then
            jaf.give_shell(id,1000)
            parse("removeitem "..a)
            return 1
      elseif od==64 then
            jaf.health[id]=jaf.health[id]+500
            parse("sethealth "..id.." 250")
            parse("removeitem "..a)
            return 1
      elseif od==65 then
            jaf.health[id]=jaf.health[id]+250
            parse("sethealth "..id.." 250")
            parse("removeitem "..a)
            return 1
      end
end

addhook("always","jaf.alwayshook")
function jaf.alwayshook()
         for _,id in pairs(player(0,"tableliving")) do
             if jaf.class_evovampiret[id]>0 then
                local dmgk=math.random(150,200)
                local v=jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot"),8)
                local x,y=player(id,"x"),player(id,"y")
                local gx,gy=v[1],v[2]
                local tx,ty=math.floor(gx/32),math.floor(gy/32)
                local objc=objectat(tx,ty,30)
                parse('effect "flare" '..x..' '..y..' 3 20 255 000 000')
                local isok=true
                if objc~=nil and tonumber(objc) and tonumber(objc)>0 then
                   jaf.objectdamage(tonumber(objc),"o"..dmgk,id)
                   isok=false
                elseif tx<10 and jaf.sv_monsterpos[tostring(tx).."+0.0"..tostring(ty)]~=nil then
                   jaf.hitzone("xm"..tonumber(jaf.sv_monsterpos[tostring(tx).."+0.0"..tostring(ty)]),id,oid,0,gx,gy,dmgk)
                   isok=false
                elseif jaf.sv_monsterpos[tostring(tx).."+0."..tostring(ty)]~=nil then
                   jaf.hitzone("xm"..tonumber(jaf.sv_monsterpos[tostring(tx).."+0."..tostring(ty)]),id,oid,0,gx,gy,dmgk)
                   isok=false
                end
                if tile(tx,ty,"walkable")==true and isok then
                      parse("setpos "..id.." "..gx.." "..gy)
                end
             end
          end
end