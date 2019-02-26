jaf.hudIMG_list={
                status={
                         {img=jaf.locgfx.."status.png",
                          pos={320+105,460},
                          scale=0.7,
                          alpha=0.8,
                         },},
                status2={
                         [1]={img=jaf.locgfx.."menu2.png",
                              pos={510+210,250},
                              scale=1
                             },
                         [2]={img=jaf.locgfx.."joninet.png",
                              pos={320+105,240},
                              scale=1
                             },
                         [3]={img=jaf.locgfx.."achv_menu.png",
                              pos={320+105,240},
                              scale=1
                             },
                         [4]={img=jaf.locgfx.."ex_menu.png",
                              pos={220+210,140},
                              scale=1
                             },
                         [5]={img=jaf.locgfx.."ex_menu_remove.png",
                              pos={420+210,140},
                              scale=1
                             },
                         [6]={img=jaf.locgfx.."buy_menu.png",
                              pos={320+105,240},
                              scale=1
                             },
                         [7]={img=jaf.locgfx.."ex_craft.png",
                              pos={320+105,50},
                              scale=1
                             },
                         [8]={img=jaf.locgfx.."cropping.png",
                              pos={270+105,280},
                              scale=1
                             },
                         [9]={img=jaf.locgfx.."upgrade_menu.png",
                             pos={320+105,240},
                             scale=1
                             },
                         [10]={img=jaf.locgfx.."menuku.png",
                              pos={510+210,280},
                              scale=1
                             },
                         [11]={img=jaf.locgfx.."tutorinfo.png",
                              pos={425,80},
                              scale=0.8
                             },
                         [12]={img=jaf.locgfx.."ex_lostitem.png",
                              pos={780,59},
                              scale=1
                             },
                         [13]={img=jaf.locgfx.."npctalk.png",
                              pos={425,240},
                              scale=1
                             },},


                bar={
                     {pos={280+105,440},
                      scale={36,0.8},
                      img="gfx/JAF/line.png",
                      color={255,000,000},
                      ua=function(id)
                            return player(id,"health")+jaf.health[id]
                      end,
                      un=function(id)
                            return player(id,"maxhealth")+jaf.maxhealth[id]
                      end
                     },
                     {pos={280+105,457},
                      scale={36,0.8},
                      img="gfx/JAF/line.png",
                      color={320,179,113},
                      ua=function(id)
                            if jaf.level[id]<jaf.sv_maxlevel then
                               return jaf.exp[id]
                            else
                               return 0
                            end
                      end,
                      un=function(id)
                            if jaf.level[id]<jaf.sv_maxlevel then
                               return (jaf.level[id]*jaf.exp_perlevel)
                            else
                               return 100
                            end
                      end
                     },},
                bar2={
                      [1]={pos={(85+105),139.7},
                           scale={117.4,0.2},
                           state=initArray(32,false),
                           img="gfx/JAF/line.png",
                           aftercolor={030,144,255},
                           color={000,255,000},
                           var={id=jaf.netgetdata,player=true},
                           varmax={id=jaf.netdata,player=true}
                      },
                      [2]={pos={216+105,60},
                           scale={51.5,1},
                           state=initArray(32,false),
                           img="gfx/JAF/line.png",
                           aftercolor={000,255,000},
                           color={000,255,000},
                           var={id=jaf.craftex_time,player=true},
                           varmax={id=jaf.craftex_timemax,player=true}
                      },
                      [3]={pos={271+105,280},
                           scale={24.5,0.8},
                           state=initArray(32,false),
                           img="gfx/JAF/line.png",
                           aftercolor={000,255,000},
                           color={255,215,000},
                           var={id=jaf.croptime,player=true},
                           varmax={id=jaf.svj_croptimemax,player=false}
                      },
                      [4]={pos={304+105,190},
                           scale={45.3,1.9},
                           state=initArray(32,false),
                           img="gfx/JAF/line.png",
                           aftercolor={000,255,000},
                           color={255,215,000},
                           var={id=jaf.up_time,player=true},
                           varmax={id=jaf.svj_uptimemax,player=false}
                      },
                     },


                btn={
                     {pos={27,122},
                      scale=0.7,
                      img={jaf.locgfx.."usgn.png..",255,255,255,32,32},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           jaf.showmyinfo(id)
                      end
                      },
                      {pos={797,445},
                       scale=1,
                      img={jaf.locgfx.."moreBTN.png..",255,255,255,60,22},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.tradestat[id]>=1 or jaf.fishingstatus[id]>=1 or jaf.jailsel[id]>0 or jaf.bar2IMG[id][4]~=nil or jaf.up_itemid1[id]>0 then
                             jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                             return 1
                          end
                          if jaf.moremenu2[id]==nil then
                             function jaf.mrmenu2(id)
                               jaf.moremenu2[id]=jaf.menu2(id,1,3,8,26,35)
                             end
                             local mrmenu2=timerEx(100,jaf.mrmenu2,1,id)
                          else
                             jaf.freemenu2(jaf.moremenu2,id)
                          end
                           jaf.freemenu2(jaf.menukuya,id)
                      end
                      },
                     {pos={34,445},
                       scale=1,
                      img={jaf.locgfx.."tradeBTN.png..",255,255,255,60,22},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           if jaf.usgn[id]<=0 then
                                  jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],15))
                                  return false
                           end
                          if jaf.fishingstatus[id]>=1 or jaf.jailsel[id]>0 or jaf.bar2IMG[id][4]~=nil or jaf.up_itemid1[id]>0 then
                             jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                             return 1
                          end
                           jaf.trademenu(id)
                      end
                      },
                      {pos={108,445},
                       scale=1,
                      img={jaf.locgfx.."phoneBTN.png..",255,255,255,60,22},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           jaf.phone_menu(id)
                      end
                      },
                     {pos={728,445},
                       scale=1,
                      img={jaf.locgfx.."inventoryBTN.png..",255,255,255,60,22},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           if jaf.tradestat[id]<1 and jaf.fishingstatus[id]<=0 and jaf.bar2IMG[id][4]==nil and jaf.up_itemid1[id]<=0 then
                                  function jaf.invmenu2(id)
                                   jaf.inventorymenu(id,jaf.inv_page[id])
                                  end
                                  local invmenu2=timerEx(100,jaf.invmenu2,1,id)
                           else
                                  jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                           end
                      end
                      },},
                btn2={
                  [1]={pos={340+210,264},
                      img={jaf.locgfx.."arrow1BTN2.png..",255,255,255,18,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.quest_info[id]=jaf.quest_info[id]+1
                      end
                      },
                  [2]={pos={340+210,190},
                      img={jaf.locgfx.."arrow2BTN2.png..",255,255,255,18,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.quest_info[id]>0 then
                             jaf.quest_info[id]=jaf.quest_info[id]-1
                          end
                      end
                      },
                  [3]={pos={510+210,140},
                      img={jaf.locgfx.."btn2_event.png..",255,255,255,193,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         jaf.event_list(id,1)
                      end
                      },
                  [4]={pos={510+210,175},
                      img={jaf.locgfx.."btn2_membershop.png..",255,255,255,193,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         if jaf.JAFmember[id]>0 or jaf.admin[id]>0 then
                            function jaf.member_shopT(id)
                              jaf.item_buymenucreate(id,{{68,8000,0,0},{69,24000,0,0},{70,14000,0,0},{71,0,8500,0},{72,0,15000,0},{73,0,3000,0},{74,42000,0,0},{75,0,200,0,{{109,10},{107,20},{106,10}}},{76,14000,0,0}})
                            end
                            mem_sT=timerEx(500,jaf.member_shopT,1,id)
                         else
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],113).."!")
                         end
                      end
                      },
                  [5]={pos={555+105,122},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.bar2_remove(id,1)
                          if jaf.joninet[id]~=nil then
                             jaf.freemenu2(jaf.joninet,id)
                          end
                          jaf.getnet[id]=0
                          jaf.netgetdata[id]=0
                          jaf.netdata[id]=0
                          jaf.getsubnet[id]=0
                          jaf.netclearhudtxt2(id)
                      end
                      },
                  [6]={pos={530+105,350},
                      img={jaf.locgfx.."btn2_arrow1.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                        if jaf.hudIMG_list.bar2[1].state[id]==false then
                           jaf.bar2_draw(id,1)
                         end
                         if jaf.joninet[id]~=nil then
                            v=jaf.inet_list[jaf.getnet[id]]
                            if v and jaf.getsubnet[id]<#v.subnet then
                                 jaf.netscroll[id]=1
                                 jaf.getnetsearch[id]=""
                                 if jaf.getnetimage[id]~=nil then
                                    jaf.freenetimage(id,#jaf.getnetimage[id])
                                    jaf.getnetimage[id]=nil
                                 end
                                 jaf.getsubnet[id]=jaf.getsubnet[id]+1
                                 jaf.netgetdata[id]=0
                                 if v.subnet[jaf.getsubnet[id]].info then
                                    ndgclc=#v.subnet[jaf.getsubnet[id]].info
                                    if type(v.subnet[jaf.getsubnet[id]].info)=="table" then
                                       gkbnd=0
                                       for i=1,#v.subnet[jaf.getsubnet[id]].info do
                                           gkbnd=gkbnd+#v.subnet[jaf.getsubnet[id]].info[i]
                                       end
                                       ndgclc=gkbnd
                                    end
                                    jaf.netdata[id]=ndgclc
                                 end
                                 vm=v.subnet[jaf.getsubnet[id]]
                                 if vm~=nil and vm.img and tonumber(#vm.img) then
                                    jaf.netdata[id]=jaf.netdata[id]+(#vm.img*42)
                                    jaf.getnetimage[id]=vm.img
                                 end
                            end
                         end
                      end
                      },
                  [7]={pos={110+105,350},
                      img={jaf.locgfx.."btn2_arrow2.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         if jaf.hudIMG_list.bar2[1].state[id]==false then
                             jaf.bar2_draw(id,1)
                         end
                         if jaf.joninet[id]~=nil then
                            v=jaf.inet_list[jaf.getnet[id]]
                            if v and jaf.getsubnet[id]-1>0 then
                                 jaf.netscroll[id]=1
                                 jaf.getnetsearch[id]=""
                                 if jaf.getnetimage[id]~=nil then
                                    jaf.freenetimage(id,#jaf.getnetimage[id])
                                    jaf.getnetimage[id]=nil
                                 end
                                 jaf.getsubnet[id]=jaf.getsubnet[id]-1
                                 jaf.netgetdata[id]=0
                                 if v.subnet[jaf.getsubnet[id]].info then
                                    ndgclc=#v.subnet[jaf.getsubnet[id]].info
                                    if type(v.subnet[jaf.getsubnet[id]].info)=="table" then
                                       gkbnd=0
                                       for i=1,#v.subnet[jaf.getsubnet[id]].info do
                                           gkbnd=gkbnd+#v.subnet[jaf.getsubnet[id]].info[i]
                                       end
                                       ndgclc=gkbnd
                                    end
                                    jaf.netdata[id]=ndgclc
                                 end
                                 vm=v.subnet[jaf.getsubnet[id]]
                                 if vm.img and tonumber(#vm.img) then
                                    jaf.netdata[id]=jaf.netdata[id]+(#vm.img*42)
                                    jaf.getnetimage[id]=vm.img
                                 end
                            end
                         end
                      end
                      },
                  [8]={pos={510+210,175},
                      img={jaf.locgfx.."btn2_achv.png..",255,255,255,193,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.achvmenu2[id]==nil then
                             if jaf.achvID[id]<1 or jaf.achvID[id]>#jaf.achv_list then
                                jaf.achvID[id]=1
                             end
                             jaf.achvmenu2[id]=jaf.menu2(id,3,9,10,11,12)
                             jaf.freemenu2(jaf.moremenu2,id)
                             jaf.freemenu2(jaf.joninet,id)
                             jaf.freeachvstatIMG(id)
                             jaf.achvstatIMG[id]=image(jaf.locgfx.."star.png",(140+105),210,2,id)
                             if jaf.achvstat[id][jaf.achvID[id]]>0 then
                                imagecolor(jaf.achvstatIMG[id],255,215,000)
                             else
                                imagecolor(jaf.achvstatIMG[id],191,191,191)
                             end
                          else
                             jaf.freemenu2(jaf.achvmenu2,id)
                             jaf.achv_reset(id)
                             jaf.freeachvstatIMG(id)
                          end
                      end
                      },
                  [9]={pos={540+105,155},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.achvmenu2[id]~=nil then
                             jaf.freemenu2(jaf.achvmenu2,id)
                             jaf.achv_reset(id)
                             jaf.freeachvstatIMG(id)
                          end
                      end
                      },
                  [10]={pos={356+105,265},
                      img={jaf.locgfx.."btn2_cachv.png..",255,255,255,135,24},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           v=jaf.achv_list[jaf.achvID[id]]
                           if v and v.action and (jaf.achvstat[id][jaf.achvID[id]]>0 or jaf.admin[id]>=#jaf.admintag) then
                                v.action(id)
                           elseif v and v.action then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],132,v.title..merah))
                           end
                      end
                      },
                  [11]={pos={490+105,260},
                      img={jaf.locgfx.."btn2_arrow1.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           if not jaf.achv_list[jaf.achvID[id]+1] then
                                  jaf.achvID[id]=1
                           else
                                  jaf.achvID[id]=jaf.achvID[id]+1
                           end
                           jaf.achv_reset(id)
                           jaf.freeachvstatIMG(id)
                           jaf.achvstatIMG[id]=image(jaf.locgfx.."star.png",(140+105),210,2,id)
                           if jaf.achvstat[id][jaf.achvID[id]]>0 then
                               imagescale(jaf.achvstatIMG[id],3,3)
                               imagecolor(jaf.achvstatIMG[id],255,215,000)
                               imagepos(jaf.achvstatIMG[id],320,20,180)
                               tween_scale(jaf.achvstatIMG[id],700,1,1)
                               tween_move(jaf.achvstatIMG[id],700,(140+105),210,0)
                                jaf.getsound(id,"JAF/Spongebob/achv_sunlock.ogg")
                           else
                                imagecolor(jaf.achvstatIMG[id],191,191,191)
                           end
                      end
                      },
                  [12]={pos={230+105,260},
                      img={jaf.locgfx.."btn2_arrow2.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           if not jaf.achv_list[jaf.achvID[id]-1] then
                                  jaf.achvID[id]=#jaf.achv_list
                           else
                                  jaf.achvID[id]=jaf.achvID[id]-1
                           end
                           jaf.achv_reset(id)
                           jaf.freeachvstatIMG(id)
                           jaf.achvstatIMG[id]=image(jaf.locgfx.."star.png",(140+105),210,2,id)
                           if jaf.achvstat[id][jaf.achvID[id]]>0 then
                               imagescale(jaf.achvstatIMG[id],3,3)
                               imagecolor(jaf.achvstatIMG[id],255,215,000)
                               imagepos(jaf.achvstatIMG[id],320,20,180)
                               tween_scale(jaf.achvstatIMG[id],700,1,1)
                               tween_move(jaf.achvstatIMG[id],700,(140+105),210,0)
                               jaf.getsound(id,"JAF/Spongebob/achv_sunlock.ogg")
                           else
                               imagecolor(jaf.achvstatIMG[id],191,191,191)
                           end
                      end
                      },
                  [13]={pos={540+105,150},
                      img={jaf.locgfx.."arrow2BTN2.png..",255,255,255,18,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.netscroll[id]>1 then
                             jaf.netscroll[id]=jaf.netscroll[id]-1
                          end
                      end
                      },
                  [14]={pos={540+105,330},
                      img={jaf.locgfx.."arrow1BTN2.png..",255,255,255,18,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.netscroll[id]=jaf.netscroll[id]+1
                      end
                      },
                  [15]={pos={220+210,150},
                      img={jaf.locgfx.."btn_getit.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          x,y=jaf.getentitypos[id][1],jaf.getentitypos[id][2]
                          tpnme=string.lower(entity((x-16)/32,(y-16)/32,"typename"))
                          if tpnme=="env_object" or tpnme=="env_sprite" or tpnme=="func_dynwall" then
                             parse("triggerposition "..math.floor(x/32).." "..math.floor(y/32))
                          else
                             msg2(id,merah..jaf.sv_lang(jaf.lang[id],137))
                          end
                      end
                      },
                  [16]={pos={220+210,170},
                      img={jaf.locgfx.."btn_close.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.moremenu_entity,id)
                      end
                      },
                  [17]={pos={220+210,130},
                      img={jaf.locgfx.."btn_info.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          x,y=jaf.getentitypos[id][1],jaf.getentitypos[id][2]
                          tpnme=string.lower(entity((x-16)/32,(y-16)/32,"typename"))
                          getiton=merah.."NO"
                          if tpnme=="env_object" or tpnme=="env_sprite" or tpnme=="func_dynwall" then
                             getiton=hijau.."YES"
                          end
                          msg2(id,putih.."~ Entity Info ~")
                          msg2(id,kuning.."Get it: "..getiton..kuning..", Type: "..entity((x-16)/32,(y-16)/32,"typename")..", ID: "..entity((x-16)/32,(y-16)/32,"type")..", Name: "..entity((x-16)/32,(y-16)/32,"name")..", Triggered: "..entity((x-16)/32,(y-16)/32,"trigger"))
                      end
                      },
                  [18]={pos={420+210,170},
                      img={jaf.locgfx.."btn_no.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.moremenu_removeclan,id)
                      end
                      },
                  [19]={pos={420+210,150},
                      img={jaf.locgfx.."btn_yes.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                                 jaf.clan_list_remove(jaf.clan[id])
                                 local filename =jaf.loclua.."clans/clan"..jaf.clan[id]..".txt"
                                 os.remove(filename) 
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],28))
                                 jaf.clan[id]=0
                                 jaf.freemenu2(jaf.moremenu_removeclan,id)
                      end
                      },
                  [20]={pos={460+105,275},
                      img={jaf.locgfx.."btn2_plus.png..",255,255,255,30,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.freeitemb[id]>0 then
                             jaf.morebuy_icount[id]=1
                             return false
                          end
                          local itemidkk=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                          jaf.morebuy_icount[id]=jaf.morebuy_icount[id]+1
                          if jaf.morebuy_icount[id]>=99 then
                             jaf.morebuy_icount[id]=1
                          end
                          if jaf.list_items[itemidkk].oncebuy~=nil and jaf.list_items[itemidkk].oncebuy then
                             jaf.morebuy_icount[id]=1
                          end
                          local itemidbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                          if jaf.list_items[itemidbmn].timer~=nil and jaf.list_items[itemidbmn].timer then
                             parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..' h" 525 265 1')
                          else
                             parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..'x" 525 265 1')
                          end
                      end
                      },
                  [21]={pos={383+105,275},
                      img={jaf.locgfx.."btn2_minus.png..",255,255,255,30,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.freeitemb[id]>0 then
                             jaf.morebuy_icount[id]=1
                             return false
                          end
                          jaf.morebuy_icount[id]=jaf.morebuy_icount[id]-1
                          if jaf.morebuy_icount[id]<1 then
                             jaf.morebuy_icount[id]=99
                          end
                          local itemidkk=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                          if jaf.list_items[itemidkk].oncebuy~=nil and jaf.list_items[itemidkk].oncebuy then
                             jaf.morebuy_icount[id]=1
                          end
                          local itemidbmn=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                          if jaf.list_items[itemidbmn].timer~=nil and jaf.list_items[itemidbmn].timer then
                             parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..' h" 525 265 1')
                          else
                             parse('hudtxt2 '..id..' '..(42)..' "'..putih..''..jaf.morebuy_icount[id]..'x" 525 265 1')
                          end
                      end
                      },
                  [22]={pos={424+105,315},
                      img={jaf.locgfx.."btn_buythis.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                       local ibuyct=jaf.morebuy_icount[id]
                       if ibuyct<1 then return false end
                       local itemid=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[1])
                       local price=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[2])
                       local pcs=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[3])
                       local pdc=tonumber(totable(jaf.btnbuy[id][jaf.btnset[id]])[4])
                       local ir=jaf.btnbuy_reqitem[id][jaf.btnset[id]]
                       if jaf.list_items[itemid] and jaf.list_items[itemid].oncebuy and jaf.checkitem(id,itemid).stat then
                               jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],131,jaf.list_items[itemid].name))
                               return 1
                       end
                       if jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                               return 1
                       end
                       if jaf.admin[id]>=#jaf.admintag and jaf.godmode[id]>0 and jaf.checkuserdata(jaf.usgn[id]).itemtotal<(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               return 1
                       elseif jaf.admin[id]>=#jaf.admintag and jaf.godmode[id]>0 and jaf.checkitem(id,itemid).stat then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               return 1
                       elseif jaf.admin[id]>=#jaf.admintag and jaf.godmode[id]>0 and jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                               return 1
                       elseif jaf.freeitemb[id]>0 and (jaf.list_items[itemid].nf==nil or jaf.list_items[itemid].nf==false) then
                               jaf.freeitemb[id]=jaf.freeitemb[id]-1
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               msg2(id,kuning.."[System] "..abu.."Free-Item Buy ticket left: "..jaf.freeitemb[id])
                               return 1
                       end
                       if ir~=nil and ir and type(ir)=="table" then
                          local irrs=true
                          local irrt={}
                          local irri=""
                          local irrc=0
                          for iirr=1,#ir do
                              if ir[iirr]~=nil then
                                 if (jaf.checkitem(id,ir[iirr][1]).stat==false or jaf.checkitem(id,ir[iirr][1]).amount<(ir[iirr][2]*ibuyct)) then
                                    irrc=irrc+1
                                    irrt[irrc]=ir[iirr][1]
                                    irrs=false
                                 end
                              end
                          end
                          if irrs==true then
                             if jaf.craftex_time[id]<jaf.craftex_timemax[id] then return 1 end
                             jaf.getsound(id,"JAF/otherworld/craftstart.ogg")
                             jaf.status2_create(id,7)
                             jaf.bar2_draw(id,2)
                             jaf.craftex_time[id]=0
                             jaf.craftex_timemax[id]=(#ir*2+ibuyct)
                             function jaf.icrfttmr(id,itemid,ir,ibuyct)
                             for iirr=1,#ir do
                                if ir[iirr]~=nil then
                                    jaf.give_item(id,ir[iirr][1],-(ir[iirr][2]*ibuyct))
                                end
                                    for i=1,jaf.maxitem_img do
                                    if i==2 and jaf.itemSEL[id][2]~=nil and jaf.itemSEL[id][2]==ir[iirr][1] then
                                    jaf.varfreeimage(1,jaf.classbtnimg[id])
                                    jaf.varfreeimage(2,jaf.classbtnimg[id])
                                    jaf.itemSEL[id][2]=0
                                    jaf.removeitemIMG(id,2)
                                    elseif jaf.itemSEL[id][i]~=nil and jaf.itemSEL[id][i]==ir[iirr][1] then
                                    jaf.itemSEL[id][i]=0
                                    jaf.removeitemIMG(id,i)
                                    end
                                    end
                             end
                             jaf.give_item(id,itemid,ibuyct)
                             parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],153,jaf.list_items[itemid].name)..'" 320 380 1')
                             parse('hudtxtalphafade '..id..' 41 5000 0.0')
                             jaf.bar2_remove(id,2)
                             jaf.removestat2IMG(id,7)
                             jaf.getsound(id,"JAF/otherworld/craftend.ogg")
                             end
                             jaf.craftex[id]=timerEx(jaf.craftex_timemax[id]*1000,jaf.icrfttmr,1,id,itemid,ir,ibuyct)
                          else
                             for irrti=1,#irrt do
                                 if irrt[irrti]~=nil then
                                    if irrti==#irrt then
                                       irri=irri..jaf.list_items[irrt[irrti]].name
                                    else
                                       irri=irri..jaf.list_items[irrt[irrti]].name..","
                                    end
                                 end
                             end
                             jaf.svj_msg2(id,"[INFO] "..merah..jaf.sv_lang(jaf.lang[id],152,hijau..irri..merah,jaf.list_items[itemid].name))
                          end
                          return 1
                       end
                       if pcs<1 and pdc<1 then
                       if jaf.shell[id]>=(price*ibuyct) and jaf.checkuserdata(jaf.usgn[id]).itemtotal<(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.give_item(id,itemid,ibuyct)
                               jaf.give_shell(id,-(price*ibuyct),nil,nil)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                       elseif jaf.shell[id]>=(price*ibuyct) and jaf.checkitem(id,itemid).stat then
                               jaf.give_item(id,itemid,ibuyct)
                               jaf.give_shell(id,-(price*ibuyct),nil,nil)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                       elseif jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                       else
                               jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                       end
                       elseif pcs>=0 and pdc<1 then
                       if jaf.crystal[id]>=(pcs*ibuyct) and jaf.checkuserdata(jaf.usgn[id]).itemtotal<(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               jaf.crystal[id]=jaf.crystal[id]-(pcs*ibuyct)
                       elseif jaf.crystal[id]>=(pcs*ibuyct) and jaf.checkitem(id,itemid).stat then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               jaf.crystal[id]=jaf.crystal[id]-(pcs*ibuyct)
                       elseif jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                       else
                               jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],103))
                       end
                       else
                       cid=jaf.clan[id]
                       if cid>0 then
                       if jaf.clan_leader[cid]==jaf.usgn[id] and jaf.clan_diamond[cid]>=(pdc*ibuyct) and jaf.checkuserdata(jaf.usgn[id]).itemtotal<(jaf.inventory_max_default+jaf.invplus[id]) then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               jaf.clan_diamond[cid]=jaf.clan_diamond[cid]-(pdc*ibuyct)
                               jaf.save_clan(cid)
                       elseif jaf.clan_leader[cid]==jaf.usgn[id] and jaf.clan_diamond[cid]>=(pdc*ibuyct) and jaf.checkitem(id,itemid).stat then
                               jaf.give_item(id,itemid,ibuyct)
                               parse('hudtxt2 '..id..' 41 "'..hijau..jaf.sv_lang(jaf.lang[id],13)..' '..jaf.list_items[itemid].name..'" 320 380 1')
                               parse('hudtxtalphafade '..id..' 41 5000 0.0')
                               jaf.clan_diamond[cid]=jaf.clan_diamond[cid]-(pdc*ibuyct)
                               jaf.save_clan(cid)
                       elseif jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                               jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],30))
                       else
                               jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],104))
                       end
                       else
                               jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],25))  
                       end
                       end
                      end
                      },
                  [23]={pos={424+105,345},
                      img={jaf.locgfx.."btn_close.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
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
                      end
                      },
                  [24]={pos={(440+105),160},
                      img={jaf.locgfx.."btn2_arrow1.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         if jaf.btn2_IMG[id][22]==nil then
                            jaf.btn2_create(id,22)
                            jaf.removebtn2IMG(id,43)
                         end
                         if jaf.btnset[id]>=jaf.btnbuyc[id] then
                            jaf.btnset[id]=1
                         else
                            jaf.btnset[id]=jaf.btnset[id]+1
                         end
                         jaf.morebuy_icount[id]=1
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
                               if jaf.JAFmember[id]<1 and jaf.admin[id]<1 then
                                  jaf.removebtn2IMG(id,22)
                                  jaf.btn2_create(id,43)
                               end
                         end
                      end
                      },
                  [25]={pos={(200+105),160},
                      img={jaf.locgfx.."btn2_arrow2.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         if jaf.btn2_IMG[id][22]==nil then
                            jaf.btn2_create(id,22)
                            jaf.removebtn2IMG(id,43)
                         end
                         if jaf.btnset[id]<=1 then
                            jaf.btnset[id]=jaf.btnbuyc[id]
                         else
                            jaf.btnset[id]=jaf.btnset[id]-1
                         end
                         jaf.morebuy_icount[id]=1
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
                               if jaf.JAFmember[id]<1 and jaf.admin[id]<1 then
                                  jaf.removebtn2IMG(id,22)
                                  jaf.btn2_create(id,43)
                               end
                         end
                      end
                      },
                  [26]={pos={510+210,210},
                      img={jaf.locgfx.."btn2_upgrade.png..",255,255,255,193,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         jaf.itemupselect(id,page)
                      end
                      },
                  [27]={pos={510+210,245},
                      img={jaf.locgfx.."trial_new.png..",255,255,255,193,30},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                         if jaf.freetrialplay[id]<=0 and jaf.usgn[id]>0 then
                            jaf.give_item(id,28,6)
                            jaf.freetrialplay[id]=1
                         elseif jaf.usgn[id]>0 then
                            msg2(id,merah..jaf.sv_lang(jaf.lang[id],181))
                         else
                            msg2(id,merah..jaf.sv_lang(jaf.lang[id],15))
                         end
                      end
                      },
                  [28]={pos={350+105,240},
                      img={jaf.locgfx.."btn2_selectitem.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.up_time[id]<=0 and jaf.bar2IMG[id][4]==nil then
                             jaf.itemselecttoup(id,page)
                          end
                      end
                      },
                  [29]={pos={440+105,240},
                      img={jaf.locgfx.."btn2_upgradenow.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.up_time[id]<=0 and jaf.up_itemid1[id]>0 and jaf.up_itemid2[id]>0 and jaf.bar2IMG[id][4]==nil then
                             jaf.bar2_draw(id,4)
                             jaf.up_time[id]=0
                          end
                      end
                      },
                  [30]={pos={482+105,142},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.moremenu_up,id)
                          jaf.up_itemid1[id]=0
                          jaf.up_itemid2[id]=0
                          jaf.bar2_remove(id,4)
                          jaf.varfreeimage(1,jaf.up_imgplus[id])
                          jaf.varfreeimage(2,jaf.up_imgplus[id])
                          jaf.up_time[id]=0
                      end
                      },
                  [35]={pos={510+210,360},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.moremenu2,id)
                      end
                      },
                  [36]={pos={628,40},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.mytutormenu,id)
                          jaf.varfreeimage(id,jaf.mytutorimg)
                          parse('hudtxt2 '..id..' '..(22)..' "" 0 0')
                      end
                      },
                  [37]={pos={425,103},
                      img={jaf.locgfx.."btn_next.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          if jaf.mytutor[id]<#jaf.list_tutor and jaf.list_tutor[(jaf.mytutor[id]+1)]~=nil then
                             jaf.mytutor[id]=jaf.mytutor[id]+1
                             jaf.list_tutor[jaf.mytutor[id]].act(id)
                          end
                      end
                      },
                  [38]={pos={780,67},
                      img={jaf.locgfx.."btn2_check.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.psdmenu(id,page)
                      end
                      },
                  [39]={pos={780,88},
                      img={jaf.locgfx.."btn_close.png..",255,255,255,82,18},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                          jaf.freemenu2(jaf.mylossitemm,id)
                      end
                      },
                  [40]={pos={642,344},
                      img={jaf.locgfx.."btn2_arrow1.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                        jaf.npctalkhudremove(id)
                        jaf.plnpctalkyouc[id]=jaf.plnpctalkyouc[id]+1
                        local tbl=jaf.plnpctalkyout[id]
                        local npcname=jaf.plnpctalkyounn[id]
                        if type(tbl)=="table" and jaf.plnpctalkyouc[id]>#tbl then
                           jaf.plnpctalkyouc[id]=1
                        elseif type(tbl)~="table" then
                           return false
                        end
                        local n=jaf.plnpctalkyouc[id]
                        if tbl[n]~=nil then
                           parse('hudtxt2 '..id..' '..(11)..' "'..hijau..''..npcname..'" 335 '..(145))
                           local mc=50
                           local ca=#tbl[n]
                           if ca>(5*mc) then
                              ca=(5*mc)
                           end
                           parse('hudtxt2 '..id..' '..(19)..' "'..putih..''..n..'/'..#tbl..'" 390 338 1')
                           local cgc=0
                           for i=1,math.ceil(ca/mc) do
                             if tbl[n]:sub((cgc*mc),(cgc*mc))==" " then
                                 parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc+1),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                             else
                                 parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                             end
                             cgc=cgc+1
                           end
                         end
                      end
                      },
                  [41]={pos={533,344},
                      img={jaf.locgfx.."btn2_arrow2.png..",255,255,255,17,17},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                        jaf.npctalkhudremove(id)
                        jaf.plnpctalkyouc[id]=jaf.plnpctalkyouc[id]-1
                        local tbl=jaf.plnpctalkyout[id]
                        local npcname=jaf.plnpctalkyounn[id]
                        if type(tbl)=="table" and jaf.plnpctalkyouc[id]<1 then
                           jaf.plnpctalkyouc[id]=1
                        elseif type(tbl)~="table" then
                           return false
                        end
                        local n=jaf.plnpctalkyouc[id]
                        if tbl[n]~=nil then
                           parse('hudtxt2 '..id..' '..(11)..' "'..hijau..''..npcname..'" 335 '..(145))
                           local mc=50
                           local ca=#tbl[n]
                           if ca>(5*mc) then
                              ca=(5*mc)
                           end
                           parse('hudtxt2 '..id..' '..(19)..' "'..putih..''..n..'/'..#tbl..'" 390 338 1')
                           local cgc=0
                           for i=1,math.ceil(ca/mc) do
                             if tbl[n]:sub((cgc*mc),(cgc*mc))==" " then
                                 parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc+1),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                             else
                                 parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                             end
                             cgc=cgc+1
                           end
                         end
                      end
                      },
                  [42]={pos={490,344},
                      img={jaf.locgfx.."btn2_close.png..",255,255,255,28,28},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id)
                           jaf.plnpctalkyout[id]={}
                           jaf.plnpctalkyouc[id]=1
                           jaf.plnpctalkyounn[id]="No Name"
                           jaf.freemenu2(jaf.plnpctalkyoum,id)
                           jaf.npctalkhudremove(id)
                           jaf.varfreeimage(id,jaf.plnpctalkyouimg)
                      end
                      },
                  [43]={pos={424+105,315},
                      img={jaf.locgfx.."btn2_notbuythis.png..",255,255,255,0,0},
                      -- {img,RRR,GGG,BBB,bigx,bigy}
                      func=function(id) end
                      },},
}

jaf.nowater_area={
                 {{133,88},{159,110}},
}

---- Attribute image code
---- 1 = helm, 2 = armor/class,3 = weapon,4 = pet, 5 = driving device, 6 = wing

---- Rotate-change mode
---- 0 = disable, 1 = change for vertical, 2 = change for horizontal

---- function item
---- petattack(id) = skill for pet to target (only attribute image code 4)
---- itemskill(id) = skill for item with attribute image code 3
---- func(id) = for put effect item (also for able the "equip button" on item options)
---- rightatk(id) = to use an action by using right-click mouse (just for attbt code 3)
---- petskill(id) = skill for pet (only attribute image code 4)
---- class={} --- class skill taken by btn2 just for attbt 2

---- item value
---- name = name of the item
---- img = used for able to drop the item (table {imglocation,scale})
---- attbt = used for the attribute item like helm,armor,etc. (table {stat(true/false),img=(true/false),no=attribute image code,rc=rotate-change mode})
---- sellback = able to sell-back item with shell
---- inf = (true = infinite item when used, false = not infinite item)
---- memberstat = (1 = only member,0 = user)
---- more = increase your condition (put in table {hp=(inc hp),dmg=(inc dmg),speed=(inc speed),def=(inc defend)})
---- oncebuy = (true = just can buy once, false = can buy more)
---- comwpn = (true = follow weapon rot, false = always constant, just for attbt)
---- ontrade = (true = allowed to trade, false = not allowed to trade)
---- timer = (true = using time, false = using unit)
---- petrot = (true = move with rot, false = just move) (only attribute image code 4 for pet)
---- wingclose = (true = enable, false = not active) just for wing attbt to open close wings
---- itemup = (false = not for upgrade item)
---- petmove= (1  = for blade) must disable petrot
---- petskillrandom = {random-range,get-random} -- just for pet 
---- nf = {true=cannot be buy free with freeitemb}
---- usgn = {true=user login only can equip}
---- fireonatk = ( true = launch weapon kill by pressing left mouse button)

jaf.list_items={
              [1]={name="Sandwich", -- 1
                  img={jaf.locgfx.."patty.png",0.6},
                  attbt={false,1,img=false,no=1,rc=0},
                  -- active,imghud,imgloc,codeimg,rotate-change
                  sellback=50,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(15,32)
                       jaf.health[id]=jaf.health[id]+50
                  end
                 },
              [2]={name="Sandwich deluxe", -- 2
                  img={jaf.locgfx.."patty.png",0.7},
                  attbt={false,1,img=false,no=1},
                  sellback=70,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(20,38)
                       jaf.health[id]=jaf.health[id]+80
                  end
                 },
              [3]={name="Sandwich combo", -- 3
                  img={jaf.locgfx.."patty.png",0.8},
                  attbt={false,1,img=false,no=1},
                  sellback=80,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(25,44)
                       jaf.health[id]=jaf.health[id]+120
                  end
                 },
              [4]={name="Salad", -- 4
                  img=false,
                  attbt={false,1,img=false,no=1},
                  sellback=2,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(10,15)
                       parse("sethealth "..id.." "..player(id,"health")+2)
                  end
                 },
              [5]={name="Salad",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  sellback=2,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(10,15)
                       parse("sethealth "..id.." "..player(id,"health")+2)
                  end
                 },
              [6]={name="Pizza", -- 6
                  img={jaf.locgfx.."item/pizza.png",0.9},
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(25,44)
                       jaf.health[id]=jaf.health[id]+200
                  end
                 },
              [7]={name="White Horse", -- 7
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/horse.png",no=5},
                  more={hp=0,dmg=0,speed=4,def=0},
                  sellback=5000,
                  inf=true,
                  func=function(id)
                  end
                 },
              [8]={name="War Horse", -- 8
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/warhorse.png",no=5},
                  more={hp=20,dmg=10,speed=5},
                  sellback=10000,
                  inf=true,
                  func=function(id)
                  end
                 },
              [9]={name="Pegasus", -- 9
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/pegasus.png",no=5},
                  more={hp=500,dmg=80,speed=10},
                  sellback=25000,
                  inf=true,
                  func=function(id)
                  end
                 },
              [10]={name="VIP Ticket", -- 10
                  img={jaf.locgfx.."item/vipticket.png",0.8},
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                            jaf.userlicense[id]=1
                            jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],81))
                  end
                 },
              [11]={name="Legend Ticket", -- 11
                  img={jaf.locgfx.."item/legendticket.png",0.8},
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                            jaf.userlicense[id]=2
                            jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],82))
                            jaf.give_item(id,20,1)
                            jaf.give_item(id,21,1)
                            jaf.give_item(id,22,1)
                            jaf.give_item(id,24,1)
                  end
                 },
              [12]={name="Light glow", -- 12
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/glow.png",no=5},
                  more={hp=0,dmg=0,speed=5},
                  sellback=20000,
                  inf=true,
                  func=function(id)
                  end
                 },
              [13]={name="Cow", -- 13
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/cow.png",no=5},
                  more={hp=800,dmg=4,speed=8},
                  sellback=80000,
                  inf=true,
                  func=function(id)
                  end
                 },
              [14]={name="Tron armor", -- 14
                  img={jaf.locgfx.."item/Atron_d.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Atron.png",no=2},
                  more={hp=100,dmg=0,speed=0},
                  sellback=30000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [15]={name="Rainbow armor", -- 15
                  img={jaf.locgfx.."item/Arainbow_d.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Arainbow.png",no=2},
                  more={hp=3000,dmg=0,speed=3},
                  sellback=300000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [16]={name="Big meat", -- 16
                  img={jaf.locgfx.."big_meat.png",1},
                  attbt={false,1,img=false,no=1},
                  sellback=500,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(25,44)
                       jaf.health[id]=jaf.health[id]+520
                  end
                 },
              [17]={name="Cowboy hat", -- 17
                  img={jaf.locgfx.."item/Hcowboy.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Hcowboy.png",no=1},
                  more={hp=100,dmg=0,speed=2},
                  sellback=35000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [18]={name="Pirate hat", -- 18
                  img={jaf.locgfx.."item/Hpirate.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Hpirate.png",no=1},
                  more={hp=500,dmg=0,speed=5},
                  sellback=70000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [19]={name="Black hair", -- 19
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Hblackhair.png",no=1},
                  more={hp=1500,dmg=300,speed=5},
                  sellback=400000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [20]={name="Red Baret", -- 20
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Hredbaret.png",no=1},
                  more={hp=1000,dmg=1800,speed=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [21]={name="Military suit", -- 21
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Acamo.png",no=2},
                  more={hp=2000,dmg=0,speed=0,def=3},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [22]={name="Weapon backpack", -- 22
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Wbackwpn.png",no=6},
                  more={hp=0,dmg=0,speed=7,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [23]={name="Troll Pet", -- 23
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/Ptroll.png",no=4},
                  more={hp=0,dmg=100,speed=0},
                  sellback=20000,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [24]={name="Army pet", -- 24
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/Parmy.png",no=4},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [25]={name="Yellow hair", -- 25
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Hyellowhair.bmp",no=1},
                  more={hp=700,dmg=0,speed=2,def=15},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [26]={name="Death knight Helm", -- 26
                  img={jaf.locgfx.."item/Hdeathknight.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Hdeathknight.png",no=1},
                  more={hp=850,dmg=80,speed=2},
                  sellback=50000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [27]={name="Pikachu Helm", -- 27
                  img={jaf.locgfx.."item/Hpikachuhelm.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Hpikachuhelm.png",no=1},
                  more={hp=10,dmg=0,speed=2},
                  sellback=5000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [28]={name="Member Sign", -- 28
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  inf=false,
                  comwpn=true,
                  ontrade=false,
                  timer=true,
                 },
              [29]={name="Platinum sword", -- 29
                  img={jaf.locgfx.."item/Wplatinum.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wplatinum.png",no=3},
                  more={hp=0,dmg=100,speed=0},
                  sellback=20000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [30]={name="Golden sword", -- 30
                  img={jaf.locgfx.."item/Wgolden.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wgolden.png",no=3},
                  more={hp=0,dmg=1800,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [31]={name="Cyan sword", -- 31
                  img={jaf.locgfx.."item/Wcyan.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wcyan.png",no=3},
                  more={hp=0,dmg=300,speed=0},
                  sellback=40000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [32]={name="Wood sword", -- 32
                  img={jaf.locgfx.."item/Wwood.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wwood.png",no=3},
                  more={hp=0,dmg=20,speed=0},
                  sellback=2000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [33]={name="Inventory+20", -- 33
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=200000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=20
                  end
                 },
              [34]={name="Inventory+25", -- 34
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=250000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=25
                  end
                 },
              [35]={name="Inventory+50", -- 35
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=500000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=50
                  end
                 },
              [36]={name="Inventory+70", -- 36
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=700000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=70
                  end
                 },
              [37]={name="Inventory+100", -- 37
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=100
                  end
                 },
              [38]={name="Inventory+120", -- 38
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=1200000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=120
                  end
                 },
              [39]={name="Inventory+220", -- 39
                  img=false,
                  attbt={false,200,img=false,no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=2200000,
                  inf=false,
                  func=function(id)
                       jaf.invplus[id]=220
                  end
                 },
              [40]={name="Antlers", -- 40
                  img={jaf.locgfx.."item/Hantlers.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/Hantlers.png",no=1},
                  more={hp=300,dmg=0,speed=5},
                  sellback=9000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [41]={name="Maximum clan members+30", -- 41
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=30
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [42]={name="Maximum clan members+50", -- 42
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=50
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [43]={name="Maximum clan members+75", -- 43
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=75
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [44]={name="Maximum clan members+100", -- 44
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=100
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [45]={name="Maximum clan members+150", -- 45
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=150
                            jaf.save_clan(cid)
                        elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                        elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [46]={name="Maximum clan members+170", -- 46
                  memberstat=1,
                  img=false,
                  ontrade=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=170
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [47]={name="Maximum clan members+220", -- 47
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_memplus[cid]=220
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [48]={name="Wooden cross bow", -- 48
                  img={jaf.locgfx.."item/Wcrossbow.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wcrossbow.png",no=3},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/flying.ogg",(9*32+16),(9*32+16))
                               jaf.skillitem1(id,math.random(200,500),"gfx/JAF/arrow.png",1000,1,{255,255,255},(12*32+16),"wall")
                             end,1, -- time
                             {98}, -- itemID required
                            }
                 },
              [49]={name="Magic fire sword",
                  img={jaf.locgfx.."item/wpn_magicfire.png",0.7},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_magicfire.png",no=3},
                  more={hp=0,dmg=100,speed=0,def=5},
                  timer=true,
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(800,1500),{"gfx/JAF/otherworld/shootfire.png",{2,1000},{255,255,255}},1300,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall")
                             end,2, -- time
                             {94,95,96}, -- itemID required
                            }
                 },
              [50]={name="Slayer sword",
                  memberstat=1,
                  img={jaf.locgfx.."item/wpn_slayer.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_slayer.png",no=3},
                  more={hp=0,dmg=800,speed=3,def=0},
                  sellback=200,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [51]={name="Laser",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=true,
                  func=function(id)
                      parse("equip "..id.." 45")
                      parse("setweapon "..id.." 45")
                  end
                 },
              [52]={name="RPG Launcher",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 47")
                      parse("setweapon "..id.." 47")
                  end
                 },
              [53]={name="M134 Machinegun",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 90")
                      parse("setweapon "..id.." 90")
                  end
                 },
              [54]={name="FN F2000",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 91")
                      parse("setweapon "..id.." 91")
                  end
                 },
              [55]={name="P90",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 22")
                      parse("setweapon "..id.." 22")
                  end
                 },
              [56]={name="Deagle",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 3")
                      parse("setweapon "..id.." 3")
                  end
                 },
              [57]={name="M3",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 10")
                      parse("setweapon "..id.." 10")
                  end
                 },
              [58]={name="AUG",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 33")
                      parse("setweapon "..id.." 33")
                  end
                 },
              [59]={name="Machete",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=true,
                  func=function(id)
                      parse("equip "..id.." 69")
                      parse("setweapon "..id.." 69")
                  end
                 },
              [60]={name="Chainsaw",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=10,speed=0},
                  sellback=150,
                  inf=false,
                  func=function(id)
                      parse("equip "..id.." 85")
                      parse("setweapon "..id.." 85")
                  end
                 },
              [61]={name="Ace sword",
                  memberstat=1,
                  img={jaf.locgfx.."item/wpn_acesword.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_acesword.png",no=3,rc=2},
                  more={hp=0,dmg=500,speed=2},
                  sellback=15000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [62]={name="Elven sword",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_elven.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_elven.png",no=3,rc=2},
                  more={hp=0,dmg=100,speed=0},
                  sellback=5000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [63]={name="Flame staff",
                  img={jaf.locgfx.."item/wpn_flamestaff.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_flamestaff.png",no=3,rc=2},
                  more={hp=0,dmg=50,speed=0,def=5},
                  sellback=90000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(300,895),{"gfx/JAF/otherworld/flame.png",{2,1000},{255,255,255}},1000,(12*32+16),nil,{"fire",{255,255,255},32,26},"wall")
                             end,2, -- time
                             {94,95}, -- itemID required
                            }
                 },
              [64]={name="Daedric Axe",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_deadricaxe.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_deadricaxe.png",no=3,rc=2},
                  more={hp=100,dmg=700,speed=0,def=2},
                  sellback=75000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [65]={name="Wooden scythe",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_woodenscythe.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_woodenscythe.png",no=3,rc=2},
                  more={hp=400,dmg=2700,speed=0,def=8},
                  sellback=0,
                  timer=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [66]={name="Ketupat",
                  img={jaf.locgfx.."item/ketupat.png",1},
                  attbt={false,200,img=false,no=3,rc=2},
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.health[id]=jaf.health[id]+800
                  end
                 },
              [67]={name="Neptune Crown",
                  img={jaf.locgfx.."item/crown.png",1},
                  attbt={false,200,img=false,no=3,rc=2},
                  more={hp=0,dmg=0,speed=0},
                  sellback=20,
                  inf=false
                 },
              [68]={name="Snowman",
                  memberstat=1,
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_snowman.png",no=4},
                  more={hp=0,dmg=0,speed=0},
                  timer=true,
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  func=function(id) end,
                  petattack=function(id)
                  end
                 },
              [69]={name="Mage hat",
                  memberstat=1,
                  img={jaf.locgfx.."item/helm_mage.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_mage.png",no=1},
                  more={hp=100,dmg=300,speed=0},
                  sellback=12000,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [70]={name="leather helmet",
                  memberstat=1,
                  img={jaf.locgfx.."item/helm_leather.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_leather.png",no=1},
                  more={hp=400,dmg=0,speed=3},
                  sellback=7000,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [71]={name="Black horse",
                  memberstat=1,
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/blackhorse.png",no=5},
                  more={hp=1000,dmg=500,speed=8},
                  sellback=1000,
                  inf=true,
                  func=function(id) end
                 },
              [72]={name="Skeleton horse",
                  memberstat=1,
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/skeletonhorse.png",no=5},
                  more={hp=3000,dmg=1500,speed=10,def=11},
                  sellback=1000,
                  inf=true,
                  ontrade=false,
                  func=function(id) end
                 },
              [73]={name="Frost staff",
                  memberstat=1,
                  img={jaf.locgfx.."item/wpn_froststaff.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_froststaff.png",no=3,rc=2},
                  more={hp=0,dmg=1200,speed=0},
                  sellback=0,
                  timer=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(500,1200),{"gfx/JAF/otherworld/frost.png",{2,1000},{255,255,255}},800,(10*32+16),nil,{"flare",{030,144,255},30,20},"wall")
                             end,1, -- time
                             {97,99}, -- itemID required
                            }
                 },
              [74]={name="Glass armor",
                  memberstat=1,
                  img={jaf.locgfx.."item/armor_glass.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/armor_glass.png",no=2},
                  more={hp=2000,dmg=0,speed=2,def=7},
                  sellback=21000,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [75]={name="Gold aura",
                  memberstat=1,
                  img={jaf.locgfx.."item/wing_goldaura.png",0.7},
                  attbt={true,200,img=jaf.locgfx.."item/wing_goldaura.png",no=6},
                  more={hp=1500,dmg=1500,speed=5,def=9},
                  sellback=5000,
                  inf=true,
                  oncebuy=true,
                  func=function(id) end
                 },
              [76]={name="Lion",
                  memberstat=1,
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/lion.png",no=5},
                  more={hp=0,dmg=0,speed=10,def=2},
                  sellback=7000,
                  inf=true,
                  func=function(id) end
                 },
              [77]={name="phoenix wing",
                  img={jaf.locgfx.."item/wing_phoenix.png",0.6},
                  attbt={true,200,img=jaf.locgfx.."item/wing_phoenix.png",no=6},
                  more={hp=800,dmg=400,speed=5,def=1},
                  sellback=74000,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [78]={name="Wizard helmet",
                  img={jaf.locgfx.."item/helm_wizard.png",0.6},
                  attbt={true,200,img=jaf.locgfx.."item/helm_wizard.png",no=1},
                  more={hp=700,dmg=0,speed=3,def=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [79]={name="Letter bird",
                  memberstat=1,
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/letterbird.png",no=5},
                  more={hp=1500,dmg=400,speed=4,def=6},
                  sellback=1000,
                  inf=true,
                  func=function(id) end
                 },
              [80]={name="Flower hat",
                  img={jaf.locgfx.."item/helm_flower.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_flower.png",no=1},
                  more={hp=300,dmg=0,speed=0,def=1},
                  comwpn=true,
                  sellback=4000,
                  inf=true,
                  func=function(id) end
                 },
              [81]={name="Inet connection+10Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=10
                  end
                 },
              [82]={name="Inet connection+75Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=75000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=75
                  end
                 },
              [83]={name="Inet connection+125Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=125000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=125
                  end
                 },
              [84]={name="Inet connection+200Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=200000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=200
                  end
                 },
              [85]={name="Inet connection+500Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=200,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=500
                  end
                 },
              [86]={name="Inet connection+700Kb/second",
                  memberstat=0,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=200,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=700
                  end
                 },
              [87]={name="Inet connection+500Kb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=500000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=500
                  end
                 },
              [88]={name="Inet connection+600Kb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=600000,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=600
                  end
                 },
              [89]={name="Inet connection+1.5Mb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=1500
                  end
                 },
              [90]={name="Inet connection+2Mb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                  inf=false,
                  func=function(id)
                      jaf.connectplus[id]=2000
                  end
                 },
              [91]={name="Inet connection+2.5Mb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                  inf=false,
                  oncebuy=true,
                  func=function(id)
                      jaf.connectplus[id]=2500
                  end
                 },
              [92]={name="Inet connection+5Mb/second",
                  memberstat=1,
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                  inf=false,
                  oncebuy=true,
                  func=function(id)
                      jaf.connectplus[id]=5000
                  end
                 },
              [93]={name="Book of Health",
                  img={jaf.locgfx.."item/book_health.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  timer=true,
                  oncebuy=true,
                  func=function(id)
                      parse("setarmor "..id.." 204")
                  end
                 },
              [94]={name="Book of Fire Energy",
                  ontrade=false,
                  img={jaf.locgfx.."item/book_flamethrower.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true
                 },
              [95]={name="Flame Burn Energy",
                  ontrade=false,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100,
                 },
              [96]={name="Fire Blaster",
                  ontrade=false,
                  img=false,
                  attbt=false,timer=true,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                 },
              [97]={name="Ice Magic Power",
                  ontrade=false,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50,
                 },
              [98]={name="Arrow",
                  ontrade=false,
                  img={"gfx/JAF/arrow.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=10,
                 },
              [99]={name="Book of Paralysis",
                  ontrade=false,
                  img={jaf.locgfx.."item/book_paralysis.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true
                 },
              [100]={name="Great Magic Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_greatmagic.png",no=6},
                  more={hp=1500,dmg=300,speed=5,def=10},
                  sellback=50,
                  comwpn=true,
                  oncebuy=true,
                  wingclose=true,
                  ontrade=false,
                  inf=true,
                  func=function(id) end
                 },
              [101]={name="Angle Wings",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_angle.png",no=6},
                  more={hp=5000,dmg=4500,speed=7,def=7},
                  sellback=0,
                  comwpn=true,
                  ontrade=false,
                  oncebuy=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [102]={name="BlueSoul Dragon Sword",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_souldragon.png",no=3,rc=2},
                  more={hp=0,dmg=2000,speed=-5,def=10},
                  sellback=0,
                  ontrade=false,
                  oncebuy=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(1200,10000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},300,(15*32+16),nil,{"flare",{030,144,255},5,30},"wall")
                             end,1, -- time
                             {99,103}, -- itemID required
                            }
                 },
              [103]={name="Mystical Power Energy",
                  ontrade=false,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=250,
                 },
              [104]={name="Wood",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=250,
                 },
              [105]={name="Stone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                 },
              [106]={name="Steel",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=400,
                 },
              [107]={name="Rope",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=200,
                 },
              [108]={name="Leaf",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false,
                 },
              [109]={name="Golden Leaf",
                  img={jaf.locgfx.."item/gleaf.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [110]={name="Paint",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100,
                 },
              [111]={name="Cable",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false,
                 },
              [112]={name="Fishing rod",
                  memberstat=0,
                  img={jaf.locgfx.."item/fishingrod.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/fishingrod.png",no=3,rc=0},
                  more={hp=0,dmg=0,speed=-1000},
                  sellback=100,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  rightatk=function(id)
                      local cckitm=jaf.checkitem(id,113)
                      if jaf.fishingstatus[id]>=1 then return 1 end
                      if cckitm.stat==false or cckitm.amount<=0 then
                         jaf.svj_msg2(id,""..merah..jaf.sv_lang(jaf.lang[id],135,jaf.list_items[113].name))
                         return 1
                      end
                      local msftx=math.floor(jaf.mouseX[id]/32)
                      local msfty=math.floor(jaf.mouseY[id]/32)
                      jaf.fishingpos[id]={jaf.mouseX[id],jaf.mouseY[id]}
                      local fishingyes=false
                      for iff=1,#jaf.fishingarea do
                        local v=jaf.fishingarea[iff]
                        if jaf.checkarea(msftx,msfty,v[1],v[2],v[3],v[4]) and tile(msftx,msfty,"frame")==160 then
                             fishingyes=true
                             break
                        end
                      end
                      if fishingyes==false then
                       jaf.svj_msg2(id,""..merah..jaf.sv_lang(jaf.lang[id],156))
                       return 1
                      end
                      jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],155).."...")
                      jaf.fishingstatus[id]=1
                      jaf.varfreeimage(id,jaf.fishgetimg)
                      function jaf.fishingt(id)
                          if player(id,"exists") and player(id,"health")>0 then
                            jaf.fishgetimg[id]=image(jaf.locgfx.."mark.png",jaf.fishingpos[id][1],jaf.fishingpos[id][2],0)
                            imagescale(jaf.fishgetimg[id],0.5,0.5)
                            tween_rotateconstantly(jaf.fishgetimg[id],7)
                            jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],157))
                            parse("shake "..id.." 20")
                            function jaf.fishingt2(id)
                                 jaf.fishingstatus[id]=0
                                 jaf.varfreeimage(id,jaf.fishgetimg)
                                 jaf.fishgetimg[id]=nil
                                 jaf.give_item(id,113,-1)
                                 jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],158,"1 "..jaf.list_items[113].name,jaf.sv_lang(jaf.lang[id],155)))
                            end
                            jaf.fishingtimer2[id]=timerEx(5*1000,jaf.fishingt2,1,id)
                          end
                      end
                      jaf.fishingtimer[id]=timerEx(10*1000,jaf.fishingt,1,id)
                  end,
                  itemskill={function(id) -- func
                             if jaf.fishgetimg[id]==nil then return false end
                             ---- freetimerEx(jaf.fishingtimer[id])
                             freetimerEx(jaf.fishingtimer2[id])
                             if jaf.fishingstatus[id]>=1 and jaf.fishgetimg[id]~=nil then
                                jaf.fishingstatus[id]=0
                                jaf.varfreeimage(id,jaf.fishgetimg)
                                jaf.fishgetimg[id]=nil
                                local getfitemid={104,104,104,115,115,104,121,104,104,116,104,104,115,104,117,104,104,104,104,121,104,116,121,104,120}
                                local rdmgf=getfitemid[math.random(1,#getfitemid)]
                                jaf.give_item(id,rdmgf,1)
                                jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,"1 "..jaf.list_items[rdmgf].name,jaf.sv_lang(jaf.lang[id],155)))
                                jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],158,"1 "..jaf.list_items[113].name,jaf.sv_lang(jaf.lang[id],155)))
                                jaf.exp[id]=jaf.exp[id]+40
                             else
                                jaf.give_item(id,113,1)
                             end
                             jaf.fishingstatus[id]=0
                             end,0, -- time
                             {113}, -- itemID required
                            }
                 },
              [113]={name="bait",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [114]={name="Super Fishing rod",
                  memberstat=0,
                  img={jaf.locgfx.."item/sfishingrod.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/sfishingrod.png",no=3,rc=0},
                  more={hp=0,dmg=0,speed=-1000},
                  sellback=false,
                  timer=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  rightatk=function(id)
                      local cckitm=jaf.checkitem(id,113)
                      if jaf.fishingstatus[id]>=1 then return 1 end
                      if cckitm.stat==false or cckitm.amount<=0 then
                         jaf.svj_msg2(id,""..merah..jaf.sv_lang(jaf.lang[id],135,jaf.list_items[113].name))
                         return 1
                      end
                      local msftx=math.floor(jaf.mouseX[id]/32)
                      local msfty=math.floor(jaf.mouseY[id]/32)
                      jaf.fishingpos[id]={jaf.mouseX[id],jaf.mouseY[id]}
                      local fishingyes=false
                      for iff=1,#jaf.fishingarea do
                        local v=jaf.fishingarea[iff]
                        if jaf.checkarea(msftx,msfty,v[1],v[2],v[3],v[4]) and tile(msftx,msfty,"frame")==160 then
                             fishingyes=true
                             break
                        end
                      end
                      if fishingyes==false then
                       jaf.svj_msg2(id,""..merah..jaf.sv_lang(jaf.lang[id],156))
                       return 1
                      end
                      jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],155).."...")
                      jaf.fishingstatus[id]=1
                      jaf.varfreeimage(id,jaf.fishgetimg)
                      function jaf.fishingt(id)
                           if player(id,"exists") and player(id,"health")>0 then
                            jaf.fishgetimg[id]=image(jaf.locgfx.."mark.png",jaf.fishingpos[id][1],jaf.fishingpos[id][2],0)
                            imagescale(jaf.fishgetimg[id],0.5,0.5)
                            tween_rotateconstantly(jaf.fishgetimg[id],7)
                            jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],157))
                            parse("shake "..id.." 20")
                            parse("flashplayer "..id.." 20")
                            function jaf.fishingt2(id)
                                 jaf.fishingstatus[id]=0
                                 jaf.varfreeimage(id,jaf.fishgetimg)
                                 jaf.fishgetimg[id]=nil
                                 jaf.give_item(id,113,-3)
                                 jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],158,"3 "..jaf.list_items[113].name,jaf.sv_lang(jaf.lang[id],155)))
                            end
                            jaf.fishingtimer2[id]=timerEx(5*1000,jaf.fishingt2,1,id)
                           end
                      end
                      jaf.fishingtimer[id]=timerEx(5*1000,jaf.fishingt,1,id)
                  end,
                  itemskill={function(id) -- func
                             if jaf.fishgetimg[id]==nil then return false end
                             ---- freetimerEx(jaf.fishingtimer[id])
                             freetimerEx(jaf.fishingtimer2[id])
                             if jaf.fishingstatus[id]>=1 and jaf.fishgetimg[id]~=nil then
                                jaf.varfreeimage(id,jaf.fishgetimg)
                                jaf.fishgetimg[id]=nil
                                jaf.fishingstatus[id]=0
                                local getfitemid={104,104,104,115,104,104,104,117,115,104,104,104,104,119,120,104,104,104,104,116,117,104,118,121,104,104,104,104,104}
                                local rdmgf=getfitemid[math.random(1,#getfitemid)]
                                if rdmgf==119 and math.random(1,15)~=5 then
                                   rdmgf=120
                                elseif rdmgf==121 and math.random(1,3)~=3 then
                                   rdmgf=104
                                end
                                jaf.give_item(id,rdmgf,3)
                                jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,"3 "..jaf.list_items[rdmgf].name,jaf.sv_lang(jaf.lang[id],155)))
                                jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],158,"3 "..jaf.list_items[113].name,jaf.sv_lang(jaf.lang[id],155)))
                                jaf.exp[id]=jaf.exp[id]+120
                             else
                                jaf.give_item(id,113,3)
                             end
                             jaf.fishingstatus[id]=0
                             end,0, -- time
                             {{113,3}}, -- itemID required
                            }
                 },
              [115]={name="Baby Salmon",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50,
                 },
              [116]={name="Salmon",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100,
                 },
              [117]={name="Big Salmon",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=200,
                 },
              [118]={name="Super Great Salmon",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [119]={name="Golden Shark",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=10000,
                 },
              [120]={name="Shark",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [121]={name="Octopus",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [130]={name="Meow Chat 0_0",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_nyancat.png",no=4},
                  more={hp=2000,dmg=0,speed=0},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=true,
                  func=function(id) end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                      if jaf.health[id]<jaf.maxhealth[id] then
                         jaf.health[id]=jaf.health[id]+math.random(200,300)
                         parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 32 32 000 555 000")
                      end 
                  end
                 },
              [131]={name="Police Armor",
                  img=false,
                  ontrade=false,
                  oncebuy=true,
                  attbt={true,200,img=jaf.locgfx.."item/armor_police.png",no=2},
                  more={hp=500,dmg=200,speed=5,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [132]={name="Police Helm", -- 26
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_police.png",no=1},
                  more={hp=1000,dmg=200,speed=-3,def=3},
                  sellback=0,
                  oncebuy=true,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [133]={name="Vexo Crystal Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_vexo.png",no=4},
                  more={hp=0,dmg=7000,speed=0,def=-5},
                  sellback=0,
                  inf=true,
                  timer=false,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [134]={name="Zombie Heart",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [135]={name="Devil Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_devil.png",no=6},
                  more={hp=3000,dmg=700,speed=5,def=4},
                  sellback=0,
                  comwpn=true,
                  ontrade=false,
                  oncebuy=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [136]={name="Burn Skull machete",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_burnskull.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_burnskull.png",no=3,rc=2},
                  more={hp=200,dmg=4000,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  ontrade=false,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [137]={name="Pencil",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_pencil.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_pencil.png",no=3},
                  more={hp=0,dmg=800,speed=4,def=11},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [138]={name="Headcrab Mask", 
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_headcrab.png",no=1},
                  more={hp=500,dmg=0,speed=-1},
                  sellback=0,
                  ontrade=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [139]={name="Strawhat",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_strawhat.png",no=1},
                  more={hp=7500,dmg=0,speed=4,def=5},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [140]={name="Tron Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_tron.png",no=6},
                  more={hp=800,dmg=400,speed=2},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [141]={name="Mecha Wing",
                  img={jaf.locgfx.."item/wing_mecha.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wing_mecha.png",no=6},
                  more={hp=1000,dmg=0,speed=4},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [142]={name="Space Wing",
                  img={jaf.locgfx.."item/wing_space.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wing_space.png",no=6},
                  more={hp=200,dmg=1200,speed=5},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [143]={name="Robot",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_robot.png",no=4},
                  more={hp=0,dmg=400,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [144]={name="Jupiter Helm",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_jupiter.png",no=1},
                  more={hp=700,dmg=0,speed=0},
                  sellback=0,
                  ontrade=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [145]={name="Demon horse",
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/horse_demon.png",no=5},
                  more={hp=50,dmg=1000,speed=12,def=8},
                  sellback=0,
                  inf=true,
                  ontrade=false,
                  func=function(id) end
                 },
              [146]={name="Predator Mask",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_predator.png",no=1},
                  more={hp=3000,dmg=2000,speed=0},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [147]={name="Lightsaber",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_lightsaber.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_lightsaber.png",no=3,rc=2},
                  more={hp=0,dmg=1000,speed=5},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [148]={name="Orcish Sword",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_orcish.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_orcish.png",no=3,rc=2},
                  more={hp=100,dmg=1800,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [149]={name="Starship Key",
                  img=false,
                  attbt=false,
                  ontrade=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [150]={name="BlueSoul Dragon Sword+",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_souldragon.png",no=3,rc=2},
                  more={hp=0,dmg=1000,speed=-5,def=14},
                  sellback=0,
                  ontrade=false,
                  oncebuy=false,
                  inf=true,
                  timer=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(500,6000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},500,(15*32+16),nil,{"flare",{030,144,255},5,30},"wall")
                               jaf.skillitem2(id,math.random(500,6000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},900,(15*32+16),nil,{"flare",{030,144,255},5,30},"wall")
                             end,1, -- time
                             {99,{103,2}}, -- itemID required
                            }
                 },
              [151]={name="Deadly BlueSoul Dragon Sword",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_dsouldragon.png",no=3,rc=2},
                  more={hp=0,dmg=3500,speed=5,def=33},
                  sellback=0,
                  ontrade=false,
                  oncebuy=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(3000,12000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},900,(12*32+16),nil,{"flare",{030,144,255},22,70},"wall",-15)
                               jaf.skillitem2(id,math.random(3000,12000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},900,(12*32+16),nil,{"flare",{030,144,255},22,70},"wall")
                               jaf.skillitem2(id,math.random(3000,12000),{"gfx/JAF/otherworld/bladehit.png",{2,1000},{255,255,255}},900,(12*32+16),nil,{"flare",{030,144,255},22,70},"wall",15)
                             end,3, -- time
                             {99,{103,3}}, -- itemID required
                            }
                 },
              [152]={name="Healer Class",
                  img={jaf.locgfx.."item/healer.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/healer.png",no=2},
                  more={hp=1000,dmg=0,speed=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."healicon.png",time=7,click=false,
                          energy=20,
                          f=function(id)
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 10 17 255 255 255")
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            jaf.health[id]=jaf.health[id]+700
                            msg2(id,ungu.."You use healing skill")
                          end},
                          {jaf.locgfx.."healicon2.png",time=15,click=false,
                          energy=22,
                          f=function(id)
                            local gethealcnt=500
                            jaf.health[id]=jaf.health[id]+gethealcnt
                            for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  parse("effect \"flare\" "..player(i,"x").." "..player(i,"y").." 10 17 255 255 255")
                                  if i~=id then
                                  jaf.health[i]=jaf.health[i]+gethealcnt
                                  msg2(i,ungu.."You've been healed by "..player(id,"name"))
                                  end
                               end
                            end
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/ice.ogg",(7*32+16),(7*32+16))
                          end},
                        }
                 },
              [153]={name="Pyromancer Class",
                  img={jaf.locgfx.."item/pyromancer.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/pyromancer.png",no=2},
                  more={hp=0,dmg=50,speed=0,def=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."healicon.png",time=7,click=false,
                           energy=20,
                          f=function(id)
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 15 30 150  075 000")
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            jaf.health[id]=jaf.health[id]+math.random(50,2700)
                            msg2(id,ungu.."You use fire healing skill")
                          end},
                          {jaf.locgfx.."burnicon.png",time=12,click=true,
                           energy=20,
                          f=function(id)
                            jaf.skillitem2(id,math.random(5000,12000),{"gfx/JAF/otherworld/shootfire.png",{5,1000},{255,255,255}},1300,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",nil,nil,nil,"Blast")
                          end},
                        }
                 },
              [154]={name="Vampire Class",
                  img={jaf.locgfx.."item/vampire.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/vampire.png",no=2},
                  more={hp=200,dmg=100,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."bloodicon.png",time=8,click=true,
                           energy=10,
                          f=function(id)
                            local adir=-20
                            for i = 1, 5 do
                                  parse("spawnprojectile "..id.." \"86\" "..player(id,"x").." "..player(id,"y").." \"1000\" "..player(id,"rot")+adir)
                                 adir=adir+4
                            end
                            parse("equip "..id.." 86")
                            msg2(id,ungu.."You use Vampire rage skill")
                          end},
                          {jaf.locgfx.."blooddaunicon.png",time=12,click=false,
                           energy=35,
                          f=function(id)
                            for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  vampirambil=math.random(100,500)
                                  if i~=id then
                                     if jaf.hitplayer(i,id,"Vampire",vampirambil)==true then
                                     jaf.health[id]=jaf.health[id]+vampirambil
                                     msg2(i,ungu.."Your blood have been taken by "..player(id,"name"))
                                     parse("effect \"colorsmoke\" "..player(i,"x").." "..player(i,"y").." 10 17 255 000 000")
                                     end
                                  end
                               end
                            end
                            msg2(id,ungu.."You use Vampire bite skill")
                          end},
                        }
                 },
              [155]={name="Ice Sorcerer Class",
                  img={jaf.locgfx.."item/icesorcerer.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/icesorcerer.png",no=2},
                  more={hp=0,dmg=50,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."iceicon.png",time=6,click=false,
                           energy=10,
                          f=function(id)
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 22 32 255  255 255")
                            jaf.health[id]=jaf.health[id]+300
                            local adir=-180
                            for i = 1, 10 do
                               parse("spawnprojectile "..id.." \"75\" "..player(id,"x").." "..player(id,"y").." \"1000\" "..player(id,"rot")+adir)
                               adir=adir+(180*2/10)
                            end
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/ice.ogg",(8*32+16),(8*32+16))
                            msg2(id,ungu.."You use Ice Magic Throw skill")
                          end},
                          {jaf.locgfx.."snowicon.png",time=12,click=true,
                           energy=15,
                          f=function(id)
                            local gtm1=jaf.skillitem2(id,math.random(500,4000),{"gfx/JAF/otherworld/frost.png",{1,700},{255,255,255}},800,(12*32+16),nil,{"flare",{255,255,255},40,20},"wall",-10,nil,nil,"Ice Magic")
                            local gtm2=jaf.skillitem2(id,math.random(500,4000),{"gfx/JAF/otherworld/frost.png",{1,700},{255,255,255}},800,(12*32+16),nil,{"flare",{255,255,255},60,40},"wall",nil,nil,nil,"Ice Magic")
                            local gtm3=jaf.skillitem2(id,math.random(500,4000),{"gfx/JAF/otherworld/frost.png",{1,700},{255,255,255}},800,(12*32+16),nil,{"flare",{255,255,255},40,20},"wall",10,nil,nil,"Ice Magic")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/ice.ogg",(8*32+16),(8*32+16))
                            if gtm1.monster>0 then
                               jaf.monsterFREZE[gtm1.monster]=7
                            elseif gtm2.monster>0 then
                               jaf.monsterFREZE[gtm2.monster]=7
                            elseif gtm3.monster>0 then
                               jaf.monsterFREZE[gtm3.monster]=7
                            end
                            msg2(id,ungu.."You use Frost snow aura skill")
                          end},
                        }
                 },
              [156]={name="Dimension Keeper Class",
                  memberstat=1,
                  img={jaf.locgfx.."item/dimensionkeeper.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/dimensionkeeper.png",no=2},
                  more={hp=0,dmg=90,speed=0,def=4},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."blightningicon.png",time=10,click=true,
                           energy=10,
                          f=function(id)
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/overtime.ogg",(9*32+16),(9*32+16))
                            local x1,y1,x2,y2=jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot")-60,2*32+16)[1],jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot")-60,2*32+16)[2],jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot")+60,2*32+16)[1],jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot")+60,2*32+16)[2]
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            local NSIA2=NSIA+1
                            while jaf.itemSKILLIMG[id][NSIA2]~=nil do
                                NSIA2=NSIA2+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."blackhole.png",x1,y1,1,0)
                            jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."blackhole.png",x2,y2,1,0)
                             tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],-30)
                             tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA2],-30)
                            local mpx,mpy=jaf.mouseX[id],jaf.mouseY[id]
                            function jaf.tclass1(id,nc1,nc2,nx1,ny1,nx2,ny2,mpx,mpy)
                                  jaf.skillitem2(id,math.random(600,4000),{"gfx/JAF/otherworld/lightning.png",{0.8,200},{255,255,255}},600,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",{jaf.rot_target(nx1,ny1,mpx,mpy)},{nx1,ny1},nil,"Lightning")
                                  jaf.skillitem2(id,math.random(600,4000),{"gfx/JAF/otherworld/lightning.png",{0.8,200},{255,255,255}},600,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",{jaf.rot_target(nx2,ny2,mpx,mpy)},{nx2,ny2},nil,"Lightning")
                                   tween_scale(jaf.itemSKILLIMG[id][nc1],800,0,0)
                                   tween_scale(jaf.itemSKILLIMG[id][nc2],800,0,0)
                                   function jaf.tclass2(id,nc3,nc4)
                                      jaf.varfreeimage(nc3,jaf.itemSKILLIMG[id])
                                      jaf.varfreeimage(nc4,jaf.itemSKILLIMG[id])
                                   end
                                   local tclass2=timerEx((800),jaf.tclass2,1,id,nc1,nc2)
                            end
                            local tclass1=timerEx((300),jaf.tclass1,1,id,NSIA,NSIA2,x1,y1,x2,y2,mpx,mpy)
                          end},
                          {jaf.locgfx.."bicon.png",time=7,click=true,
                           energy=25,
                          f=function(id)
                            local tlpgp=jaf.checkblockpos(player(id,"x"),player(id,"y"),player(id,"rot"),id,(12*32+16),{"wall",false})
                            jaf.teleportget(id,tlpgp.x,tlpgp.y,0.7,false)
                          end},
                        }
                 },
              [157]={name="Legendary LightHero Class",
                  img={jaf.locgfx.."item/lighthero.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/lighthero.png",no=2},
                  more={hp=0,dmg=500,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  oncebuy=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."flowericon.png",time=10,click=false,
                           energy=30,
                          f=function(id)
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."oval.png",0,0,100+id)
                            --- imagepos(jaf.itemSKILLIMG[id][NSIA],player(id,"x"),player(id,"y"),0)
                            imageblend(jaf.itemSKILLIMG[id][NSIA],1)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.1,0,1)
                            imagecolor(jaf.itemSKILLIMG[id][NSIA],255,255,000)
                            tween_scale(jaf.itemSKILLIMG[id][NSIA],400,1.2,1.2)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],8)
                            function jaf.tclass3(id,ns1)
                                jaf.varfreeimage(ns1,jaf.itemSKILLIMG[id])
                                parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 15 30 255 255 000")
                                jaf.getsound(id,"JAF/otherworld/ice.ogg")
                                parse("flashplayer "..id.." 50")
                                jaf.health[id]=jaf.health[id]+math.random(1000,3000)
                            end
                            local tclass3=timerEx((700),jaf.tclass3,1,id,NSIA)
                            msg2(id,ungu.."You use Light Cure skill")
                          end},
                          {jaf.locgfx.."lighticon.png",time=5,click=false,
                           energy=25,
                          f=function(id)
                            local mxs,mys=jaf.mouseX[id],jaf.mouseY[id]
                            local plmx,monmx=0,0
                            for _,iv in pairs(player(0,"tableliving")) do
                            if plmx>=3 then break end
                            if iv~=id and jaf.radiuscheck(player(iv,"x"),player(iv,"y"),player(id,"x"),player(id,"y"),(32*9),(32*9)) then
                            plmx=plmx+1
                            mxs=player(iv,"x")
                            mys=player(iv,"y")
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."oval2.png",mxs,mys,1,0)
                            imageblend(jaf.itemSKILLIMG[id][NSIA],1)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.4,0.4)
                            imagealpha(jaf.itemSKILLIMG[id][NSIA],0.7)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],-7)
                            local mxs2,mys2=mxs,(mys-(3*32+16))
                            function jaf.tclass4(id,ns1,ns2,ns3,ns4,ns5)
                                jaf.varfreeimage(ns1,jaf.itemSKILLIMG[id])
                                jaf.skillitem2(id,math.random(5000,22000),{"gfx/JAF/line.png",{12,200},{255,255,000}},700,(3*32+16),nil,{"flare",{255,255,000},10,40},"free",(-player(id,"rot")+jaf.rot_target(ns4,ns5,ns2,ns3)),{ns4,ns5},nil,"Yellow Light")
                                jaf.getsound2(ns4,ns5,"JAF/otherworld/laser.wav",(12*32+16),(12*32+16))
                            end
                            local tclass4=timerEx((200),jaf.tclass4,1,id,NSIA,mxs,mys,mxs2,mys2)
                            end
                            end

                            for i,i2 in pairs(jaf.monsterid) do
                            if monmx>=3 then break end
                            if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil and jaf.radiuscheck(jaf.monsterx[i],jaf.monstery[i],player(id,"x"),player(id,"y"),(32*9),(32*9)) then
                            monmx=monmx+1
                            mxs=jaf.monsterx[i]
                            mys=jaf.monstery[i]
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."oval2.png",mxs,mys,1,0)
                            imageblend(jaf.itemSKILLIMG[id][NSIA],1)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.4,0.4)
                            imagealpha(jaf.itemSKILLIMG[id][NSIA],0.7)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],-7)
                            local mxs2,mys2=mxs,(mys-(3*32+16))
                            function jaf.tclass4(id,ns1,ns2,ns3,ns4,ns5)
                                jaf.varfreeimage(ns1,jaf.itemSKILLIMG[id])
                                jaf.skillitem2(id,math.random(5000,22000),{"gfx/JAF/line.png",{12,200},{255,255,000}},700,(3*32+16),nil,{"flare",{255,255,000},10,40},"free",(-player(id,"rot")+jaf.rot_target(ns4,ns5,ns2,ns3)),{ns4,ns5})
                                jaf.getsound2(ns4,ns5,"JAF/otherworld/laser.wav",(12*32+16),(12*32+16))
                            end
                            local tclass4=timerEx((200),jaf.tclass4,1,id,NSIA,mxs,mys,mxs2,mys2)
                            end
                            end
                          end},
                        }
                 },
              [158]={name="Ranger Class",
                  img={jaf.locgfx.."item/ranger.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/ranger.png",no=2},
                  more={hp=0,dmg=50,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."arrowsicon.png",time=10,click=true,
                           energy=10,
                          f=function(id)
                            jaf.skillitem2(id,math.random(500,1400),{"gfx/JAF/otherworld/arrow2.png",{1,0},{255,255,255}},500,(12*32+16),nil,nil,"wall",nil,nil,nil,"Arrow")
                            jaf.skillitem2(id,math.random(500,1400),{"gfx/JAF/otherworld/arrow2.png",{1,0},{255,255,255}},700,(12*32+16),nil,nil,"wall",nil,nil,nil,"Arrow")
                          end},
                          {jaf.locgfx.."arrows2icon.png",time=12,click=true,
                           energy=15,
                          f=function(id)
                            jaf.skillitem2(id,math.random(300,1400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},700,(12*32+16),nil,nil,"wall",-5,nil,nil,"Arrow")
                            jaf.skillitem2(id,math.random(300,1400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},700,(12*32+16),nil,nil,"wall",nil,nil,nil,"Arrow")
                            jaf.skillitem2(id,math.random(300,1400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},700,(12*32+16),nil,nil,"wall",5,nil,nil,"Arrow")
                          end},
                        }
                 },
              [159]={name="Avengar Spiderboy Class",
                  memberstat=1,
                  img={jaf.locgfx.."item/spiderman.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/spiderman.png",no=2},
                  more={hp=0,dmg=50,speed=5,def=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."net2icon.png",time=5,click=true,
                           energy=7,
                          f=function(id)
                                        local x = player(id,"x")
            local y = player(id,"y")
            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
            local v=jaf.checkblockpos(x,y,player(id,"rot"),id,(12*32+16))
            local dist=v.dis/1000
            local tgt=v.player
            local timedir=(dist*400)
            jaf.itemSKILLIMG[id][ni]=image("gfx/JAF/line.png",x,y,1,0)
            imagescale(jaf.itemSKILLIMG[id][ni],0.2,0.2)
            imagepos(jaf.itemSKILLIMG[id][ni],x,y,player(id,"rot"))
            tween_scale(jaf.itemSKILLIMG[id][ni],timedir,0.4,2)
            tween_move(jaf.itemSKILLIMG[id][ni],timedir,v.x,v.y)
            function jaf.spdrtm(id,v2,n2)
                  id=tonumber(id)
                  jaf.varfreeimage(n2,jaf.itemSKILLIMG[id])
                  local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                  local disp=3
                  if v2.monster<=0 and v2.player and v2.player>0 then
                     jaf.stunt[v2.player]=5
                     parse("speedmod "..v2.player.." -30")
                     jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."net_spider.png",player(v2.player,"x"),player(v2.player,"y"),1,0)
                     imagepos(jaf.itemSKILLIMG[id][ni],player(v2.player,"x"),player(v2.player,"y"),math.random(0,360))
                     jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/yeehaw.ogg",(9*32+16),(9*32+16))
                     disp=5
                  elseif v2.monster>0 and jaf.monsterIMG[v2.monster]~=nil then
                         disp=4
                         jaf.monstermovest[v2.monster]=false
                         jaf.monsterT[v2.monster]=id
                         function jaf.spdrtm3(mid)
                            jaf.monstermovest[mid]=true
                         end
                         jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."net_spider.png",v2.x,v2.y,1,0)
                         jaf.getsound2(v2.x,v2.y,"weapons/machete_hitwall.wav",(9*32),(9*32))
                         local spdrtm3=timerEx(disp*1000,jaf.spdrtm3,1,v2.monster)
                        jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/yeehaw.ogg",(9*32+16),(9*32+16))
                  else
                     jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."net_spider.png",v2.x,v2.y,0,0)
                  end
                  function jaf.spdrtm2(id,n3)
                      id=tonumber(id)
                      jaf.varfreeimage(n3,jaf.itemSKILLIMG[id])
                  end
                  local spdrtm2=timerEx(disp*1000,jaf.spdrtm2,1,id,ni)
            end
            local spdrtm=timerEx(timedir,jaf.spdrtm,1,id,v,ni)
                          end},
                          {jaf.locgfx.."neticon.png",time=10,click=true,
                           energy=15,
                          f=function(id)
                            jaf.skillitem2(id,math.random(200,2800),{"gfx/JAF/line.png",{{0.01,5},400},{255,255,255}},700,(12*32+16),nil,nil,"wall",nil,nil,nil,"Spider net")
                          end},
                        }
                 },
              [160]={name="Funny Staff Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/owwatcher.png",no=2},
                  more={hp=0,dmg=2000,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  ontrade=false,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."owloveicon.png",time=10,click=false,
                           energy=5,
                          f=function(id)
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/owyea.ogg",(9*32+16),(9*32+16))
                            for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(9*32+16),(9*32+16)) then
                                  parse("flashplayer "..i.." 20")
                                  jaf.health[i]=jaf.health[i]+500
                                  if i~=id then
                                     msg2(i,ungu..player(id,"name").." using funny heal to you")
                                  end
                                  local getplkosong=jaf.table_check(jaf.itemSKILLIMG[i],nil).tn
                                  jaf.itemSKILLIMG[i][getplkosong]=image(jaf.locgfx.."owyeaaa!.png",0,0,200+i)
                                  function jaf.owskilnya(i,owk)
                                        tween_alpha(jaf.itemSKILLIMG[i][owk],500,0)
                                        function jaf.owskilnya2(i2,owk2)
                                             jaf.varfreeimage(owk2,jaf.itemSKILLIMG[i2])
                                        end
                                        local owskilnya2=timerEx(500,jaf.owskilnya2,1,i,owk)
                                  end
                                  local owskilnya=timerEx(5*1000,jaf.owskilnya,1,i,getplkosong)
                                end
                            end
                          end},
                          {jaf.locgfx.."light5icon.png",time=40,click=false,
                           energy=90,
                          f=function(id)
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fatality.ogg",(9*32+16),(9*32+16))
                            function jaf.funnyskill(id)
                            local adir=-180
                            for i = 1,5 do
                               parse("spawnprojectile "..id.." \"54\" "..player(id,"x").." "..player(id,"y").." \"224\" "..player(id,"rot")+adir)
                               adir=adir+(180*2/5)
                            end
                            parse("equip "..id.." 54")
                            parse("setweapon "..id.." 54")
                            end
                            local funnyskill=timerEx(1900,jaf.funnyskill,1,id)
                          end},
                        }
                 },
              [161]={name="Legion Astral Class",
                  img={jaf.locgfx.."item/astralawakener.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/astralawakener.png",no=2},
                  more={hp=0,dmg=50,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."spiritbombicon.png",time=12,click=true,
                           energy=20,
                          f=function(id)
                            jaf.skillitem2(id,math.random(1000,14000),{"gfx/JAF/otherworld/flare.bmp",{3,100},{255,255,255},nil,1},700,(12*32+16),nil,{"flare",{255,255,255},10,40},"free",nil,nil,nil,"Astral Plasma Ball")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/laser.wav",(12*32+16),(12*32+16))
                          end},
                          {jaf.locgfx.."spiriticon.png",time=20,click=false,
                           energy=35,
                          f=function(id)
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fatality.ogg",(9*32+16),(9*32+16))
                            local cekmonku=0
                            local cekmonkut={}
                            for ulang=1,4 do
                            cekmonku=jaf.checkmonsterrad2(player(id,"x"),player(id,"y"),(9*32+16),(9*32+16))
                            if cekmonku>0 and jaf.monstermovest[cekmonku]==true then
                               jaf.health[id]=jaf.health[id]+1000
                               jaf.monsterT[cekmonku]=id
                               jaf.targetmon[id]=cekmonku
                               if jaf.monsterHP[cekmonku]>3000 then
                                   jaf.monsterHP[cekmonku]=jaf.monsterHP[cekmonku]-3000
                                   jaf.enemyhealthshow(id,jaf.listmonster[math.floor(cekmonku)].name,jaf.monsterHP[cekmonku],3000)
                               else
                                      parse("effect \"colorsmoke\" "..jaf.monsterx[cekmonku].." "..jaf.monstery[cekmonku].." 52 32 255 255 255")
                                      jaf.removemonster(cekmonku)
                                      for _,ii in pairs(player(0,"tableliving")) do
                                           if jaf.targetmon[ii]==cekmonku then
                                                  jaf.listmonster[math.floor(cekmonku)].drop(ii,math.floor(cekmonku),mx,my)
                                                  jaf.targetmon[ii]=0
                                                  jaf.quest_getitem(ii,2,math.floor(cekmonku))
                                           end
                                      end
                                      parse("setscore "..id.." "..player(id,"score")+2)
                                      jaf.listmonster[math.floor(cekmonku)].dropitem(math.floor(cekmonku),mx,my)
                                      jaf.monsterTS[cekmonku]=jaf.listmonster[math.floor(cekmonku)].spawntime
                                      jaf.enemyhealthshow(id,jaf.listmonster[math.floor(cekmonku)].name,"Has died","Has killed")
                                      jaf.getsound2(jaf.monsterx[cekmonku],jaf.monstery[cekmonku],"JAF/otherworld/monster_die"..math.random(1,2)..".ogg",(9*32),(9*32))
                               end
                               jaf.monstermovest[cekmonku]=false
                               local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                               local mv=jaf.listmonster[math.floor(cekmonku)]
                               jaf.itemSKILLIMG[id][ni]=image(mv.img[1],jaf.monsterx[cekmonku],jaf.monstery[cekmonku],1,0)
                               imagealpha(jaf.itemSKILLIMG[id][ni],0)
                               imagescale(jaf.itemSKILLIMG[id][ni],mv.img[2],mv.img[2])
                               imagecolor(jaf.itemSKILLIMG[id][ni],mv.img.color[1],mv.img.color[2],mv.img.color[3])
                                tween_alpha(jaf.itemSKILLIMG[id][ni],400,0.7)
                                function jaf.astralnya(ipl,nik,cmk)
                                          if not player(ipl,"exists") or player(ipl,"health")<=0 then
                                            jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                                            jaf.monstermovest[cmk]=true
                                             return 1
                                          end
                                          tween_move(jaf.itemSKILLIMG[ipl][nik],500,player(ipl,"x"),player(ipl,"y"),0)
                                          tween_scale(jaf.itemSKILLIMG[ipl][nik],500,0.1,0.1)
                                          function jaf.astralnya2(ipl2,nik2,cmk2)
                                               jaf.varfreeimage(nik2,jaf.itemSKILLIMG[ipl2])
                                               jaf.monstermovest[cmk2]=true
                                          end
                                          local astralnya2=timerEx(700,jaf.astralnya2,1,ipl,nik,cmk)
                                end
                                local astralnya=timerEx(700,jaf.astralnya,1,id,ni,cekmonku)
                            end
                            end
                            for _,iv in pairs(player(0,"tableliving")) do
                                if iv~=id and jaf.radiuscheck(player(iv,"x"),player(iv,"y"),player(id,"x"),player(id,"y"),(9*32+16),(9*32+16)) then
                               jaf.stunt[iv]=2
                               parse("speedmod "..iv.." -10")
                               jaf.health[id]=jaf.health[id]+700
                               jaf.hitplayer(iv,id,"Astral Awaked",700)
                               local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                               parse("effect \"colorsmoke\" "..player(iv,"x").." "..player(iv,"y").." 50 32 255 255 255")
                               jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."astralbody.png",player(iv,"x"),player(iv,"y"),1,0)
                                function jaf.astralnya3(ipl,nik)
                                          if not player(ipl,"exists") or player(ipl,"health")<=0 then
                                            jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                                             return 1
                                          end
                                          tween_move(jaf.itemSKILLIMG[ipl][nik],500,player(ipl,"x"),player(ipl,"y"),0)
                                          tween_scale(jaf.itemSKILLIMG[ipl][nik],500,0.1,0.1)
                                          function jaf.astralnya4(ipl2,nik2)
                                               jaf.varfreeimage(nik2,jaf.itemSKILLIMG[ipl2])
                                          end
                                          local astralnya4=timerEx(700,jaf.astralnya4,1,ipl,nik)
                                end
                                local astralnya3=timerEx(700,jaf.astralnya3,1,id,ni)
                                end
                            end
                          end},
                        }
                 },
              [162]={name="Guardian Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/goldenguardian.png",no=2},
                  more={hp=1000,dmg=1500,speed=0,def=12},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."bloodtakeicon.png",time=5,click=false,
                          energy=0,
                          f=function(id)
                            if jaf.hitplayer(id,id,"Suicide",math.random(200,750)) then
                              local getenrgcnt=math.random(5,35)
                              jaf.energy[id]=jaf.energy[id]+getenrgcnt
                            end
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 10 17 000 255 000")
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            msg2(id,ungu.."You use Guard victim skill")
                          end},
                          {jaf.locgfx.."fireicon.png",time=15,click=true,
                          energy=45,
                          f=function(id)
                            jaf.skillitem2(id,math.random(300,3000),{"gfx/JAF/otherworld/flame.png",{1,100},{255,255,255}},700,(12*32+16),nil,{"fire",{255,255,255},40,20},"wall",-5,nil,nil,"Flame")
                            jaf.skillitem2(id,math.random(300,3000),{"gfx/JAF/otherworld/flame.png",{1,100},{255,255,255}},700,(12*32+16),nil,{"fire",{255,255,255},60,40},"wall",nil,nil,nil,"Flame")
                            jaf.skillitem2(id,math.random(300,3000),{"gfx/JAF/otherworld/flame.png",{1,100},{255,255,255}},700,(12*32+16),nil,{"fire",{255,255,255},40,20},"wall",5,nil,nil,"Flame")
                          end},
                        }
                 },
              [163]={name="Blazing hat",
                  img={jaf.locgfx.."item/helm_blazing.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_blazing.png",no=1},
                  more={hp=900,dmg=0,speed=0,def=3},
                  sellback=0,
                  comwpn=true,
                  inf=true,
                  func=function(id) end
                 },
              [164]={name="Grifon wings",
                  img={jaf.locgfx.."item/wing_grifon.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wing_grifon.png",no=6},
                  more={hp=1200,dmg=0,speed=4,def=10},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [165]={name="Yin Yang wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_yingyang.png",no=6},
                  more={hp=4000,dmg=500,speed=7,def=12},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [166]={name="BlindingLight of Destiny",
                  memberstat=0,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_blindingofdestiny.png",no=3},
                  more={hp=100,dmg=5000,speed=3,def=17},
                  sellback=0,
                  inf=true,
                  ontrade=false,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [167]={name="SoulAxe of Destiny",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_soulaxeofdestiny.png",no=3},
                  more={hp=0,dmg=14000,speed=3,def=0},
                  sellback=0,
                  inf=true,
                  nf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end,
                  slay=function(id)
                      parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 3 32 030 144 255")
                  end
                 },
              [168]={name="Stem blindingLight of destiny",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_stemblindinglight.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_stemblindinglight.png",no=3},
                  more={hp=0,dmg=200,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [169]={name="CrushedPart of Axe",
                  memberstat=0,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_crushedpartaxe.png",no=3},
                  more={hp=0,dmg=1000,speed=0},
                  sellback=0,
                  inf=true,
                  ontrade=false,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [170]={name="Pillow",
                  img={jaf.locgfx.."item/wpn_pillow.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_pillow.png",no=3},
                  more={hp=0,dmg=500,speed=0},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  inf=true,
                  func=function(id) end
                 },
              [171]={name="Susano Sword",
                  img={jaf.locgfx.."item/wpn_susano.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_susano.png",no=3},
                  more={hp=0,dmg=3500,speed=0,def=10},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  inf=true,
                  func=function(id) end
                 },
              [172]={name="Fire Blast",
                  memberstat=1,
                  img={jaf.locgfx.."item/wpn_fireblast.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_fireblast.png",no=3},
                  more={hp=400,dmg=5000,speed=0,def=2},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  inf=true,
                  func=function(id) end
                 },
              [173]={name="Spiritball",
                  img={jaf.locgfx.."item/wpn_spiritball.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_spiritball.png",no=3},
                  more={hp=0,dmg=1000,speed=0,def=13},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  inf=true,
                  func=function(id) end
                 },
              [174]={name="Magical Power Axe",
                  img={jaf.locgfx.."item/wpn_magicalaxe.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_magicalaxe.png",no=3},
                  more={hp=0,dmg=300,speed=0,def=10},
                  timer=false,
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(200,1000),{"gfx/JAF/otherworld/plasma_ball.png",{0,700},{255,255,255},1},800,(12*32+16),nil,nil,"wall")
                             end,2, -- time
                             {94}, -- itemID required
                            }
                 },
              [175]={name="Paladin Class",
                  memberstat=1,
                  img={jaf.locgfx.."item/paladin.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/paladin.png",no=2},
                  more={hp=0,dmg=0,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  nf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."boaicon.png",time=7,click=true,
                           energy=17,
                          f=function(id)
                            local v=jaf.skillitem2(id,math.random(4000,19000),{"gfx/JAF/otherworld/bod.png",{1,0},{255,255,255}},800,(12*32+16),nil,{"flare",{255,255,000},40,20},"wall",nil,nil,nil,"Magic Axe")
                            local mt=v.monster
                            jaf.monsterFREZE[mt]=5
                            jaf.health[id]=jaf.health[id]+math.random(100,400)
                          end},
                          {jaf.locgfx.."bloodtakeicon.png",time=8,click=false,
                           energy=0,
                          f=function(id)
                            if jaf.hitplayer(id,id,"Suicide",math.random(10,850)) then
                              local getenrgcnt=math.random(3,45)
                              jaf.energy[id]=jaf.energy[id]+getenrgcnt
                            end
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 5 10 255 000 000")
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."blood.png",player(id,"x"),player(id,"y"),1,0)
                            tween_move(jaf.itemSKILLIMG[id][ni],1200,player(id,"x"),player(id,"y")-(2*32+16),0)
                            tween_alpha(jaf.itemSKILLIMG[id][ni],1700,0)
                            function jaf.blooddispair(ipl,nik)
                                jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                            end
                            local blooddispair=timerEx(1700,jaf.blooddispair,1,id,ni)
                            msg2(id,ungu.."You use bloods remain skill")
                          end},
                        }
                 },
              [176]={name="Shadow Void ChainBolter",
                  img={jaf.locgfx.."item/Wpn_voidchainbolter.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wpn_voidchainbolter.png",no=3},
                  more={hp=0,dmg=0,speed=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound(id,"JAF/otherworld/laser2.wav")
                            jaf.skillitem2(id,math.random(500,1800),{"gfx/JAF/otherworld/arrow2.png",{1,100},{255,255,255}},{500,500},(12*32+16),nil,{"flare",{000,000,255},1,5},"wall",2)
                            jaf.getsound(id,"JAF/otherworld/laser2.wav")
                            jaf.skillitem2(id,math.random(500,1800),{"gfx/JAF/otherworld/arrow2.png",{1,100},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,000,255},1,5},"wall",-2)
                             end,1, -- time
                             {{98,2},177}, -- itemID required
                            }
                 },
              [177]={name="Lightning Instigator",
                  img={jaf.locgfx.."item/lightninginstigator.png",1},
                  attbt=false,
                  inf=true,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [178]={name="Spetum",
                  img={jaf.locgfx.."item/wpn_spetum.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_spetum.png",no=3},
                  more={hp=0,dmg=800,speed=0,def=2},
                  sellback=0,
                  ontrade=true,
                  oncebuy=false,
                  inf=true,
                  timer=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [179]={name="Shadow wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_shadow.png",no=6},
                  more={hp=1000,dmg=1500,speed=9,def=1},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [180]={name="Legion Shadow Dragon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_sdragon.png",no=1},
                  more={hp=1000,dmg=0,speed=0},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [181]={name="Treasure Chest",
                  img={jaf.locgfx.."item/chest.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [182]={name="TimeWarrior Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_time.png",no=2},
                  more={hp=0,dmg=0,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."timeiconfix.png",time=15,click=false,
                          energy=10,
                          f=function(id)
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            parse("flashplayer "..id.." 50")
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 5 10 255 255 255")
                            jaf.freezeme[id]=10
                            jaf.itemDEF[id]=100
                            local ni2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][ni2]=image(jaf.locgfx.."timei.png",0,0,100+id)
                            imagescale(jaf.itemSKILLIMG[id][ni2],2,2)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][ni2],-4)
                            function jaf.waktuku3(ipl,nik)
                                   tween_scale(jaf.itemSKILLIMG[ipl][nik],1000,0,0)
                            end
                            local waktuku=timerEx(9000,jaf.waktuku3,1,id,ni2)
                            function jaf.waktuku2(ipl,nik)
                                   jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                            end
                            local waktuku=timerEx(10000,jaf.waktuku2,1,id,ni2)
                            jaf.health[id]=jaf.health[id]+math.random(1000,5000)
                            parse("speedmod "..id.." 150")
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."time.png",425,240,2,id)
                            imagescale(jaf.itemSKILLIMG[id][ni],0,0)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][ni],10)
                            tween_scale(jaf.itemSKILLIMG[id][ni],200,1.5,1.5)
                            function jaf.waktuku(ipl,nik)
                                   jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                            end
                            local waktuku=timerEx(200,jaf.waktuku,1,id,ni)
                          end},
                          {jaf.locgfx.."radicon.png",time=4,click=true,
                          energy=10,
                          f=function(id)
                               local v=jaf.skillitem2(id,math.random(3000,(17000+jaf.itemDMG[id])),{"gfx/JAF/line.png",{3,200},{000,255,255}},700,(12*32+16),nil,{"flare",{000,255,255},10,40},"wall",nil,nil,nil,"Time blast")
                               jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/laser.wav",(12*32+16),(12*32+16))
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            function jaf.waktuku4(id,NSIA,gv)
                                if gv.monster>0 and jaf.monsterIMG[gv.monster]~=nil then
                                   jaf.monstermovest[gv.monster]=false
                                   jaf.monsterx[gv.monster]=gv.x
                                   jaf.monstery[gv.monster]=gv.y
                                   imagepos(jaf.monsterIMG[gv.monster],gv.x,gv.y,0)
                                end
                                jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."plasma.png",gv.x,gv.y,1,0)
                                imagescale(jaf.itemSKILLIMG[id][NSIA],0,0)
                                tween_scale(jaf.itemSKILLIMG[id][NSIA],500,3,3)
                                tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],10)
                                jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/absorb.ogg",(9*32+16),(9*32+16))
                                function jaf.waktuku5(id,NSIA,gv)
                                        jaf.varfreeimage(NSIA,jaf.itemSKILLIMG[id])
                                        jaf.monstermovest[gv.monster]=true
                                end
                                local waktuku5=timerEx(500,jaf.waktuku5,1,id,NSIA,gv)
                            end
                            local waktuku4=timerEx(v.timedir,jaf.waktuku4,1,id,NSIA,v)
                          end},
                        }
                 },
              [183]={name="Item Upgrade +1",
                  itemup=1,
                  img={jaf.locgfx.."item/up1.png",0.4},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500000,
                 },
              [184]={name="Item Upgrade +2",
                  memberstat=1,
                  itemup=2,
                  img={jaf.locgfx.."item/up2.png",0.4},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000000,
                 },
              [185]={name="Item Upgrade +3",
                  memberstat=1,
                  itemup=3,
                  img={jaf.locgfx.."item/up3.png",0.4},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1500000,
                 },
              [186]={name="Fiery Chaos Sword",
                  img={jaf.locgfx.."item/wpn_fiery_chaos.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_fiery_chaos.png",no=3},
                  more={hp=0,dmg=5300,speed=2,def=0},
                  sellback=0,
                  ontrade=true,
                  oncebuy=false,
                  inf=true,
                  timer=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [187]={name="Gauntlet Hand",
                  img={jaf.locgfx.."item/wpn_gauntlet.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_gauntlet.png",no=3},
                  more={hp=0,dmg=500,speed=0,def=30},
                  sellback=0,
                  ontrade=true,
                  oncebuy=false,
                  inf=true,
                  timer=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [188]={name="Blazing Fox Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_blazingfox.png",no=4},
                  more={hp=0,dmg=1400,speed=0,def=9},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                      if jaf.health[id]<jaf.maxhealth[id] then
                         jaf.health[id]=jaf.health[id]+math.random(100,400)
                         parse("effect \"fire\" "..player(id,"x").." "..player(id,"y").." 32 32 000 555 000")
                      end 
                  end
                 },
              [189]={name="Burned wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_burnedwing.png",no=6},
                  more={hp=1000,dmg=500,speed=7,def=20},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [190]={name="Ultimate Dark Chaotic",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_darkchaotic.png",no=3},
                  more={hp=0,dmg=3000,speed=3,def=4},
                  sellback=0,
                  ontrade=false,
                  oncebuy=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  slay=function(id)
                      jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/electric shock.ogg",(7*32+16),(7*32+16))
                      parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 8 32 000 000 255")
                  end
                 },
              [191]={name="Light Blade Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_lightblade.png",no=4},
                  more={hp=0,dmg=500,speed=5,def=15},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petmove=1,
                  petskill=function(id)
                         tween_rotateconstantly(jaf.itemIMG[id][4],20)
                  end
                 },
              [192]={name="Dragon Sword",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_dragon.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_dragon.png",no=3,rc=2},
                  more={hp=0,dmg=700,speed=-2},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [193]={name="Owl Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_bird.png",no=4},
                  more={hp=0,dmg=100,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  petrot=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [194]={name="Undead Warrior Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_undeadwarrior.png",no=4},
                  more={hp=0,dmg=1000,speed=3,def=30},
                  sellback=0,
                  inf=true,
                  petrot=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [195]={name="Blazing stone binder",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=250,
                 },
              [196]={name="BlazeMaster Class",
                  img={jaf.locgfx.."item/armor_blazemaster.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/armor_blazemaster.png",no=2},
                  more={hp=0,dmg=500,speed=4,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."healicon2.png",time=7,click=false,
                           energy=10,
                          f=function(id)
                            local gethealcnt=math.random(500,1200)
                            jaf.health[id]=jaf.health[id]+gethealcnt
                            for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  parse("effect \"flare\" "..player(i,"x").." "..player(i,"y").." 10 17 000 255 000")
                                  if i~=id then
                                  jaf.health[i]=jaf.health[i]+gethealcnt
                                  msg2(i,ungu.."You've been healed by "..player(id,"name"))
                                  end
                               end
                            end
                          end},
                          {jaf.locgfx.."fireicon.png",time=12,click=true,
                           energy=25,
                          f=function(id)
                           jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            local v1=jaf.skillitem2(id,math.random(1200,7000),{"gfx/JAF/otherworld/shootfire.png",{5,1000},{255,255,255}},700,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",10,nil,nil,"Blast")
                            local v2=jaf.skillitem2(id,math.random(1200,7000),{"gfx/JAF/otherworld/shootfire.png",{5,1000},{255,255,255}},700,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",nil,nil,nil,"Blast")
                            local v3=jaf.skillitem2(id,math.random(1200,7000),{"gfx/JAF/otherworld/shootfire.png",{5,1000},{255,255,255}},700,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",-10,nil,nil,"Blast")
                            if v1.monster>0 then
                               jaf.monsterFREZE[v1.monster]=7
                            elseif v2.monster>0 then
                               jaf.monsterFREZE[v2.monster]=7
                            elseif v3.monster>0 then
                               jaf.monsterFREZE[v3.monster]=7
                            end
                          end},
                        }
                 },
              [197]={name="Charismatic Purple Bow",
                  img={jaf.locgfx.."item/Wpn_purplebow.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/Wpn_purplebow.png",no=3},
                  more={hp=0,dmg=300,speed=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/chestopen.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(100,1200),{"gfx/JAF/otherworld/guidedarrow.png",{1,100},{255,255,255}},{500,500},(12*32+16),nil,{"flare",{191,000,255},1,5},"wall",-1)
                            jaf.skillitem2(id,math.random(100,1200),{"gfx/JAF/otherworld/guidedarrow.png",{1,100},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{191,000,255},1,5},"wall",1)
                             end,1, -- time
                             {{98,2}}, -- itemID required
                            }
                 },
              [198]={name="DreamKnight Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_dreamknight.png",no=2},
                  more={hp=0,dmg=0,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."speedicon.png",time=10,click=false,
                          energy=20,
                          f=function(id)
                            jaf.health[id]=jaf.health[id]+700
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            parse("flashplayer "..id.." 50")
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 5 10 255 255 255")
                            jaf.stunt[id]=5
                            parse("speedmod "..id.." 100")
                            msg2(id,ungu.."You use Quick Dream skill")
                          end},
                          {jaf.locgfx.."abducticon.png",time=3,click=true,
                          energy=15,
                          f=function(id)
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."deflector.png",0,0,100+id)
                            imagescale(jaf.itemSKILLIMG[id][ni],0,0)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][ni],10)
                            tween_scale(jaf.itemSKILLIMG[id][ni],700,1.5,1.5)
                           jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/absorb.ogg",(9*32+16),(9*32+16))
                            function jaf.dkngt(ipl,nik)
                                   id=ipl
                                   msg2(id,ungu.."You use Dream out skill")
                                   jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/stun.ogg",(9*32+16),(9*32+16))
                                   jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                                   jaf.skillitem2(id,9000,{"gfx/JAF/otherworld/sv.png",{1,100},{255,255,255}},500,(12*32+16),nil,{"colorsmoke",{000,000,000},5,10},"wall",nil,nil,nil,"Nightmare Shadow")
                                   jaf.skillitem2(id,9000,{"gfx/JAF/otherworld/sv.png",{1,100},{255,255,255}},500,(12*32+16),nil,{"colorsmoke",{000,000,000},5,10},"wall",-90,nil,nil,"Nightmare Shadow")
                                   jaf.skillitem2(id,9000,{"gfx/JAF/otherworld/sv.png",{1,100},{255,255,255}},500,(12*32+16),nil,{"colorsmoke",{000,000,000},5,10},"wall",90,nil,nil,"Nightmare Shadow")
                                   jaf.skillitem2(id,9000,{"gfx/JAF/otherworld/sv.png",{1,100},{255,255,255}},500,(12*32+16),nil,{"colorsmoke",{000,000,000},5,10},"wall",180,nil,nil,"Nightmare Shadow")
                            end
                            local dkngt=timerEx(700,jaf.dkngt,1,id,ni)
                          end},
                        }
                 },
              [199]={name="Treasure Chest Key",
                  img={jaf.locgfx.."item/tkey.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=10000,
                  func=function(id)
                      if jaf.checkitem(id,181).amount>0 then
                            jaf.give_shell(id,10000)
                            jaf.svj_msg2(id,""..hijau..jaf.sv_lang(jaf.lang[id],128,"10000 shell","Treasure Chest"))
                      else
                         msg2(id,merah.."You dont have Treasure Chest!")
                      end
                  end,
                 },
              [200]={name="Fragments of Magical Batu",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [201]={name="Acid Bottle",
                  img={jaf.locgfx.."snakepoison.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [202]={name="Snake Staff",
                  img={jaf.locgfx.."item/wpn_snakestaff.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_snakestaff.png",no=3},
                  more={hp=0,dmg=360,speed=3,def=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/snakepoison.ogg",(9*32+16),(9*32+16))
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            local getpk=jaf.checkmoverot(player(id,"x"),player(id,"y"),player(id,"rot"),64)
                            jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."snakepoisone.png",(getpk[1]),(getpk[2]),1,0)
                            imagepos(jaf.itemSKILLIMG[id][ni],(getpk[1]),(getpk[2]),player(id,"rot"))
                            tween_scale(jaf.itemSKILLIMG[id][ni],500,2,2)
                            tween_alpha(jaf.itemSKILLIMG[id][ni],500,0)
                            function jaf.waktukusk(ipl,nik)
                                   jaf.varfreeimage(nik,jaf.itemSKILLIMG[ipl])
                            end
                            local waktukusk=timerEx(600,jaf.waktukusk,1,id,ni)
                            if math.random(1,5)==3 then
                               jaf.skillitem2(id,math.random(3000,9600),{"gfx/JAF/otherworld/snakepoison.png",{1,100},{255,255,255}},800,(12*32+16),nil,{"colorsmoke",{000,128,000},25,35},"wall")
                            else
                               jaf.skillitem2(id,math.random(1000,3600),{"gfx/JAF/otherworld/snakepoison.png",{1,100},{255,255,255}},800,(12*32+16),nil,{"colorsmoke",{000,555,000},25,35},"wall")
                            end
                             end,2, -- time
                             {201}, -- itemID required
                            }
                 },
              [203]={name="Guitar String",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [204]={name="Guitar",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_guitar.png",no=3},
                  more={hp=0,dmg=70,speed=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/guitarsenar.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(100,1200),{"gfx/JAF/otherworld/guitarstring.png",{1,100},{255,255,255}},400,(12*32+16),nil,nil,"wall")
                             end,0, -- time
                             {203}, -- itemID required
                            }
                 },
              [205]={name="Closed Umbrella",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_closedumbrella.png",no=3},
                  more={hp=0,dmg=450,speed=5,def=15},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [206]={name="Opened Umbrella",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_openedumbrella.png",no=3},
                  more={hp=0,dmg=100,speed=3,def=20},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [207]={name="Japanese Nunchaku",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_nunchaku.png",no=3},
                  more={hp=0,dmg=2400,speed=0,def=18},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [208]={name="Chinese BlowingFan",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_fan.png",no=3},
                  more={hp=0,dmg=500,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [209]={name="Claw Beast",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_beastclaw.png",no=3},
                  more={hp=0,dmg=800,speed=0,def=3},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [210]={name="Paladin Axe Pet",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."bod.png",no=4},
                  more={hp=1000,dmg=100,speed=2,def=14},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  func=function(id)
                  end,
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            tween_scale(jaf.itemIMG[id][4],300,3,3)
                            tween_move(jaf.itemIMG[id][4],300,ptx,pty,ptr)
                            function jaf.waktukupt(ipl,ppt)
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitplayer(jaf.pet_target[ipl],ipl,"Paladin Axe Pet",math.random(100,5000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/stun.ogg",(9*32+16),(9*32+16))
                                    tween_scale(jaf.itemIMG[ipl][4],100,1,1)
                                    parse("effect \"flare\" "..player(ppt,"x").." "..player(ppt,"y").." 7 15 255 255 255")
                            end
                            local waktukupt=timerEx(300,jaf.waktukupt,1,id,pt)
                         end
                  end,
                  petskill=function(id)
                         local pt=jaf.pet_montarget[id]
                         if pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            tween_scale(jaf.itemIMG[id][4],300,3,3)
                            tween_move(jaf.itemIMG[id][4],300,ptx,pty,ptr)
                            function jaf.waktukupt2(ipl,ppt,pptx,ppty)
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitzone("xm"..ppt,ipl,oid,0,pptx,ppty,math.random(100,6000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/stun.ogg",(9*32+16),(9*32+16))
                                    tween_scale(jaf.itemIMG[ipl][4],100,1,1)
                                    parse("effect \"flare\" "..pptx.." "..ppty.." 7 15 255 255 255")
                            end
                            local waktukupt2=timerEx(300,jaf.waktukupt2,1,id,pt,ptx,pty)
                         end
                  end
                 },
              [211]={name="Paladin Legacy Key",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  ontrade=false,
                 },
              [212]={name="Sunflower",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_sunflower.png",no=3},
                  more={hp=0,dmg=400,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [213]={name="Frozen Salmon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_frozensalmon.png",no=3},
                  more={hp=0,dmg=1200,speed=-1,def=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [214]={name="Master Lance",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_masterlance.png",no=3},
                  more={hp=0,dmg=3600,speed=0,def=3},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [215]={name="Mysterious Count Sword",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_mysteriouscountsword.png",no=3},
                  more={hp=0,dmg=5000,speed=3,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [216]={name="Crimson Axe",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_crimsonaxe.png",no=3},
                  more={hp=0,dmg=5100,speed=2,def=4},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [217]={name="Legendary Pirate Flag",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_legendarypirateflag.png",no=3},
                  more={hp=0,dmg=3600,speed=4,def=10},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [218]={name="Lake Dragon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_lakedragon.png",no=3},
                  more={hp=0,dmg=7200,speed=3,def=6},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [219]={name="Surgeon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_surgeon.png",no=3},
                  more={hp=0,dmg=9000,speed=-5,def=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [220]={name="Void Blade",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_voidblade.png",no=3},
                  more={hp=0,dmg=8100,speed=0,def=3},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [221]={name="Police Sign",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/policesign.png",no=6},
                  more={hp=300,dmg=0,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  ontrade=false,
                  comwpn=true,
                  func=function(id) end
                 },
              [222]={name="Path of LightKnight Diamond",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  ontrade=false,
                 },
              [223]={name="Legendary Anchor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_legendaryanchor.png",no=3},
                  more={hp=0,dmg=3650,speed=7,def=15},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [224]={name="Wish Blade",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_wishblade.png",no=3},
                  more={hp=0,dmg=4500,speed=5,def=25},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [225]={name="Spirit Blade",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_spiritblade.png",no=3},
                  more={hp=0,dmg=9800,speed=-3,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [226]={name="Electro Wing",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_electro.png",no=6},
                  more={hp=5000,dmg=300,speed=3,def=22},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [227]={name="Two Element Wing",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_twoelement.png",no=6},
                  more={hp=3500,dmg=6000,speed=10,def=1},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [228]={name="Ice Shard",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [229]={name="Musical Platinum Trophy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [230]={name="Musical Golden Trophy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [231]={name="Musical Silver Trophy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [232]={name="Musical Bronze Trophy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [233]={name="Dead Spirit",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [234]={name="Basketball Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_basketball.png",no=4},
                  more={hp=5000,dmg=200,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  petrot=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [235]={name="Jack O Lantern Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_jackolantern.png",no=4},
                  more={hp=3000,dmg=250,speed=2,def=1},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [236]={name="Dark Witch Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_darkwitch.png",no=4},
                  more={hp=4000,dmg=1000,speed=1,def=5},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [237]={name="Legendary Drum Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_legendarydrum.png",no=4},
                  more={hp=5000,dmg=4000,speed=5,def=6},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [238]={name="Thread",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50,
                 },
              [239]={name="Needle",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100,
                 },
              [240]={name="Cloth",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=150,
                 },
              [241]={name="Red Dye",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=300,
                 },
              [242]={name="White Dye",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=400,
                 },
              [243]={name="Plastic",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=75,
                 },
              [244]={name="Aqua Bottle",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_aquabottle.png",no=3},
                  more={hp=0,dmg=120,speed=0,def=0},
                  sellback=7000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [245]={name="Indonesian Flag",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_indoflag.png",no=3},
                  more={hp=0,dmg=200,speed=0,def=1},
                  sellback=12000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [246]={name="Sharp Bamboo",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_bamboo.png",no=3},
                  more={hp=0,dmg=320,speed=0,def=2},
                  sellback=16000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [247]={name="Bamboo",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=200,
                 },
              [248]={name="Sharpening Knife",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=3000,
                 },
              [249]={name="Palm Fiber",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [250]={name="Celery",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_celery.png",no=3},
                  more={hp=0,dmg=110,speed=1,def=0},
                  sellback=3500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [251]={name="Carrot",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_carrot.png",no=3},
                  more={hp=0,dmg=125,speed=2,def=1},
                  sellback=6500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [252]={name="Eggplant",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_eggplant.png",no=3},
                  more={hp=0,dmg=150,speed=1,def=3},
                  sellback=8500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [253]={name="Ice Cream",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_icecream.png",no=3},
                  more={hp=0,dmg=180,speed=0,def=8},
                  sellback=14500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [254]={name="Grilled Corn",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_grilledcorn.png",no=3},
                  more={hp=0,dmg=225,speed=1,def=4},
                  sellback=18500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [255]={name="Watermelon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_watermelon.png",no=3},
                  more={hp=0,dmg=280,speed=0,def=9},
                  sellback=28500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [256]={name="Broom",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_broom.png",no=3},
                  more={hp=0,dmg=350,speed=2,def=3},
                  sellback=38500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [257]={name="Fragile Bottle",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_fragilebottle.png",no=3},
                  more={hp=0,dmg=400,speed=0,def=2},
                  sellback=48500,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [258]={name="Indonesian Cloak",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_indocloak.png",no=6},
                  more={hp=600,dmg=30,speed=6,def=0},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [259]={name="Joni Badge",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=20000000,
                 },
              [260]={name="Rajawali Badge",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=19000000,
                 },
              [261]={name="Furty Badge",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=18000000,
                 },
              [262]={name="Bone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [263]={name="Zombie Wrist",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=700,
                 },
              [264]={name="Zombie Finger",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=120,
                 },
              [265]={name="Mini Transformation Potion",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [266]={name="=Transformation Potion",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                 },
              [267]={name="Large Transformation Potion",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500000,
                 },
              [268]={name="Cactus",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=4000,
                 },
              [269]={name="Chicken Leg",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [270]={name="Emerald Stone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=400000,
                 },
              [271]={name="Jade Stone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=300000,
                 },
              [272]={name="Garnet Stone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [273]={name="Amber Stone",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=400000,
                 },
              [274]={name="Chocolate Banana",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_chocolatebanana.png",no=3},
                  more={hp=0,dmg=250,speed=0,def=4},
                  sellback=24000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [275]={name="Spoon",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_spoon.png",no=3},
                  more={hp=0,dmg=400,speed=0,def=5},
                  sellback=49000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [276]={name="Ice Cream Cone",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_icecreamcone.png",no=3},
                  more={hp=0,dmg=500,speed=0,def=3},
                  sellback=69000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [277]={name="Chicken",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_chicken.png",no=3},
                  more={hp=0,dmg=630,speed=3,def=8},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [278]={name="Candy Cane",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_candycane.png",no=3},
                  more={hp=0,dmg=750,speed=0,def=7},
                  sellback=149000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [279]={name="Zombie Arm",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_zombiearm.png",no=3},
                  more={hp=0,dmg=900,speed=0,def=11},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [280]={name="Pink Bouque",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_pinkbouquet.png",no=3},
                  more={hp=0,dmg=1000,speed=4,def=6},
                  sellback=199000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [281]={name="Cactus Sword",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_cactus.png",no=3},
                  more={hp=0,dmg=800,speed=0,def=13},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [282]={name="Shrimp",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_shrimp.png",no=3},
                  more={hp=0,dmg=1300,speed=0,def=4},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [283]={name="Shark Pickaxe",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_shark.png",no=3},
                  more={hp=0,dmg=1500,speed=0,def=6},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [284]={name="Swordfish",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_swordfish.png",no=3},
                  more={hp=0,dmg=1200,speed=0,def=9},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [285]={name="Cursed Bone Bat",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_bonebat.png",no=3},
                  more={hp=0,dmg=1000,speed=1,def=6},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [286]={name="Cursed Wooden Bat",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_woodenbat.png",no=3},
                  more={hp=0,dmg=1500,speed=3,def=8},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [287]={name="Katana",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_katana.png",no=3},
                  more={hp=0,dmg=3000,speed=3,def=15},
                  sellback=999000,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [288]={name="Chicken Feather",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100,
                 },
              [289]={name="UFO Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_ufo.png",no=4},
                  more={hp=1000,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                      if jaf.energy[id]<100 then
			parse("effect \"flare\" "..player(i,"x").." "..player(i,"y").." 10 17 0035 075 165")
			jaf.energy[id]=100
                        msg2(id,ungu.."UFO maximize your energy.")
			end
                  end
                 },
              [290]={name="Bag of Shells",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=10000,
                  inf=false,
                  func=function(id)
			jaf.give_shell(id,10000)
                  end
                 },
              [291]={name="Box of Shells",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                  inf=false,
                  func=function(id)
			jaf.give_shell(id,50000)
                  end
                 },
              [292]={name="Trunk of Shells",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=200000,
                  inf=false,
                  func=function(id)
			jaf.give_shell(id,200000)
                  end
                 },
              [293]={name="Truckload of Shells",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000000,
                  inf=false,
                  func=function(id)
			jaf.give_shell(id,1000000)
                  end
                 },
              [294]={name="Hand of Silver Crystals",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=10000,
                  inf=false,
                  func=function(id)
			jaf.crystal[id] = jaf.crystal[id]+1
                  end
                 },
              [295]={name="Bag of Silver Crytals",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                  inf=false,
                  func=function(id)
			jaf.crystal[id] = jaf.crystal[id]+5
                  end
                 },
              [296]={name="Box of Silver Crystals",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=200000,
                  inf=false,
                  func=function(id)
			jaf.crystal[id] = jaf.crystal[id]+20
                  end
                 },
              [297]={name="Trunk of Silver Crystals",
                  memberstat=0,
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000000,
                  inf=false,
                  func=function(id)
			jaf.crystal[id] = jaf.crystal[id]+100
                  end
                 },
              [298]={name="Fragment of Void Blade",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=700000,
                 },
              [299]={name="Fragment of Blade",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=300000,
                 },
              [300]={name="Spirit Crystal",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=100000,
                 },
              [301]={name="Book of Death",
                  img={jaf.locgfx.."item/wpn_bookofdeath.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_bookofdeath.png",no=3},
                  more={hp=0,dmg=0,speed=7,def=0},
                  timer=true,
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(30000,50000),{"gfx/JAF/otherworld/plasma_ball.png",{0,700},{0,0,0},1},800,(12*32+16),nil,nil,"wall")
                             end,0, -- time
                             {233}, -- itemID required
                            }
                 },
              [302]={name="Rock Band Record",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [303]={name="Classic Band Record",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [304]={name="Royal Guardian Class",
                  img={jaf.locgfx.."item/class_royalguardian.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/class_royalguardian.png",no=2},
                  more={hp=5000,dmg=800,speed=0,def=0},
                  sellback=0,
                  nf=true,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."skill_royalguardian_shieldblessingicon.png",time=16,click=false,
                           energy=60,
                          f=function(id)
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 22 32 255  255 255")
                            jaf.freezeme[id]=8
                            jaf.itemDEF[id]=100
                            msg2(id,ungu.."You use Shield Blessing skill")
                          end},
                          {jaf.locgfx.."skill_royalguardian_swordblessingicon.png",time=10,click=true,
                           energy=25,
                          f=function(id)
                            jaf.skillitem2(id,math.random(7000,15000),{"gfx/JAF/otherworld/skill_royalguardian_swordblessing.png",{2,1},{255,255,255}},400,(12*32+16),nil,{"flare",{255,127,000},40,20},"wall",nil,nil,nil,"Sword Blessing")
                            msg2(id,ungu.."You use Sword Blessing skill")
                          end},
                        }
                 },
              [305]={name="Evolved PumpkinLord Class",
                  img={jaf.locgfx.."item/armor_pumpkin.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/armor_pumpkin.png",no=2},
                  more={hp=500,dmg=100,speed=3,def=15},
                  sellback=0,
                  inf=true,
                  nf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."bladeicon.png",time=5,click=true,
                           energy=10,
                          f=function(id)
                           local x=jaf.mouseX[id]
                           local y=jaf.mouseY[id]
                           local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                           local pplc=jaf.checkmoverot(x,y,-30,(5*32))
                           jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."swords1.png",x,y,1,0)
                           tween_scale(jaf.itemSKILLIMG[id][ni],400,2,2)
                           tween_move(jaf.itemSKILLIMG[id][ni],400,pplc[1],pplc[2],150)
                            jaf.getsound2(x,y,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                           local ni2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                           local pplc2=jaf.checkmoverot(x,y,30,(5*32))
                           jaf.itemSKILLIMG[id][ni2]=image(jaf.locgfx.."swords2.png",x,y,1,0)
                           tween_scale(jaf.itemSKILLIMG[id][ni2],400,2,2)
                           tween_move(jaf.itemSKILLIMG[id][ni2],400,pplc2[1],pplc2[2],210)
                            jaf.getsound2(x,y,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                            function jaf.pknclass2(id,ni,ni2,xs1,ys1,xs2,ys2,xs3,ys3)
                               jaf.varfreeimage(ni,jaf.itemSKILLIMG[id])
                               jaf.varfreeimage(ni2,jaf.itemSKILLIMG[id])
                               if math.random(1,22)==8 then
                                  jaf.skillitem2(id,math.random(10000,100000),{"gfx/JAF/otherworld/swords1.png",{2,1},{255,255,255}},700,(5*32+16),nil,{"flare",{255,000,000},40,20},"free",{jaf.rot_target(xs2,ys2,xs1,ys1)},{xs2,ys2},nil,"Undentified Sword")
                                  jaf.skillitem2(id,math.random(10000,100000),{"gfx/JAF/otherworld/swords2.png",{2,1},{255,255,255}},700,(5*32+16),nil,{"flare",{255,000,000},40,20},"free",{jaf.rot_target(xs3,ys3,xs1,ys1)},{xs3,ys3},nil,"Undentified Sword")
                               parse('hudtxt2 '..id..' 24 "'..kuning..'CRITICAL!" 425 210')
                               parse('hudtxtalphafade '..id..' 24 2000 0.0')
                               parse('hudtxtmove  '..id..' 24 2000 425 170')
                            jaf.getsound(id,"JAF/otherworld/amazing.ogg")
                               else
                                  jaf.skillitem2(id,math.random(2000,4500),{"gfx/JAF/otherworld/swords1.png",{2,1},{255,255,255}},700,(5*32+16),nil,{"flare",{255,000,000},40,20},"free",{jaf.rot_target(xs2,ys2,xs1,ys1)},{xs2,ys2})
                                  jaf.skillitem2(id,math.random(2000,4500),{"gfx/JAF/otherworld/swords2.png",{2,1},{255,255,255}},700,(5*32+16),nil,{"flare",{255,000,000},40,20},"free",{jaf.rot_target(xs3,ys3,xs1,ys1)},{xs3,ys3})
                               end
                            end
                            local pknclass2=timerEx(500,jaf.pknclass2,1,id,ni,ni2,x,y,pplc[1],pplc[2],pplc2[1],pplc2[2])
                           
                          end},
                          {jaf.locgfx.."pknicon.png",time=8,click=true,
                           energy=20,
                          f=function(id)
                            local plc=jaf.skillitem2(id,math.random(100,3500),{"gfx/JAF/otherworld/hpt.png",{1,1},{255,255,255}},700,(12*32+16),nil,{"flare",{255,000,000},40,20},"wall",nil,nil,nil,"PumpkinLord Head")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            local getgk=jaf.checkblockpl(id,plc.x,plc.y)[1]
                            local gmonsta=plc.monster
                            if gmonsta~=nil and gmonsta>0 then
                               if plc.dmg<1000 then
                                  jaf.health[id]=jaf.health[id]+plc.dmg
                               else
                                  jaf.health[id]=jaf.health[id]+1000
                               end
                               jaf.monsterFREZE[gmonsta]=7
                               jaf.getsound2(plc.x,plc.y,"JAF/otherworld/go.ogg",(9*32+16),(9*32+16))
                            elseif getgk~=nil and getgk>0 then
                               if plc.dmg<100 then
                                  jaf.health[id]=jaf.health[id]+plc.dmg
                               else
                                  jaf.health[id]=jaf.health[id]+100
                               end
                               jaf.stunt[getgk]=5
                               msg2(getgk,merah.."You are stunned!")
                               jaf.getsound2(plc.x,plc.y,"JAF/otherworld/go.ogg",(9*32+16),(9*32+16))
                            end
                            function jaf.pknclass(id,gmonsta,getgk,lpx,lpy)
                            if (gmonsta~=nil and gmonsta>0) or (getgk~=nil and getgk>0) then
                            ------ 1
                              local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                              local pplc=jaf.checkmoverot((lpx),(lpy),-30,(3*32))
                              jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."pumpkin.png",(lpx),(lpy),1,0)
                              imagescale(jaf.itemSKILLIMG[id][ni],0.2,0.2)
                            tween_move(jaf.itemSKILLIMG[id][ni],400,pplc[1],pplc[2],0)
                            ------ 2
                              local ni2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                              pplc=jaf.checkmoverot((lpx),(lpy),30,(3*32))
                              jaf.itemSKILLIMG[id][ni2]=image(jaf.locgfx.."pumpkin.png",(lpx),(lpy),1,0)
                              imagescale(jaf.itemSKILLIMG[id][ni2],0.2,0.2)
                            tween_move(jaf.itemSKILLIMG[id][ni2],400,pplc[1],pplc[2],0)
                            ------ 3
                              local ni3=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                              pplc=jaf.checkmoverot((lpx),(lpy),120,(3*32))
                              jaf.itemSKILLIMG[id][ni3]=image(jaf.locgfx.."pumpkin.png",(lpx),(lpy),1,0)
                              imagescale(jaf.itemSKILLIMG[id][ni3],0.2,0.2)
                            tween_move(jaf.itemSKILLIMG[id][ni3],400,pplc[1],pplc[2],0)
                            ------ 4
                              local ni4=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                              pplc=jaf.checkmoverot((lpx),(lpy),-120,(3*32))
                              jaf.itemSKILLIMG[id][ni4]=image(jaf.locgfx.."pumpkin.png",(lpx),(lpy),1,0)
                              imagescale(jaf.itemSKILLIMG[id][ni4],0.2,0.2)
                            tween_move(jaf.itemSKILLIMG[id][ni4],400,pplc[1],pplc[2],0)
                            function jaf.pknclass2(id,ni,ni2,ni3,ni4)
                               jaf.varfreeimage(ni,jaf.itemSKILLIMG[id])
                               jaf.varfreeimage(ni2,jaf.itemSKILLIMG[id])
                               jaf.varfreeimage(ni3,jaf.itemSKILLIMG[id])
                               jaf.varfreeimage(ni4,jaf.itemSKILLIMG[id])
                            end
                            local pknclass2=timerEx(600,jaf.pknclass2,1,id,ni,ni2,ni3,ni4)
                            end
                            end
                            local pknclass=timerEx(plc.timedir,jaf.pknclass,1,id,gmonsta,getgk,plc.x,plc.y)
                          end},
                        }
                 },
              [306]={name="Chicken Soup", -- 6
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(10,20)
                       jaf.health[id]=jaf.health[id]+500
                  end
                 },
              [307]={name="Grilled Fish", -- 6
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(10,20)
                       jaf.health[id]=jaf.health[id]+800
                  end
                 },
              [308]={name="Fresh Cocktail", -- 6
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+math.random(10,20)
                       jaf.health[id]=jaf.health[id]+5000
                  end
                 },
              [309]={name="Krusty Crab Secret Recipe",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [310]={name="Condet Train Ticket",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                  oncebuy=true,
                 },
              [311]={name="Bandung Train Ticket",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                  oncebuy=true,
                 },
              [312]={name="Jester Minions",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [313]={name="Dark Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_evil.png",no=2},
                  more={hp=1000,dmg=0,speed=5,def=3},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."skill_rantai.png",time=5,click=true,
                           energy=20,
                          f=function(id)
                            if math.random(1,5)==4 then
                               jaf.energy[id]=jaf.energy[id]+35
                            end
                            local mx=jaf.mouseX[id]
                            local my=jaf.mouseY[id]
                            local obj=objectat(math.floor(mx/32),math.floor(my/32),30)
                            if obj>0 then
                               jaf.objectdamage(obj,"o"..math.random(5000,5600),id)
                            end
                            for _,iv in pairs(player(0,"tableliving")) do
                                if iv~=id and jaf.radiuscheck(player(iv,"x"),player(iv,"y"),mx,my,(32),(32)) then
                               jaf.stunt[iv]=5
                               local dmgliat=math.random(600,1800)
                               parse("speedmod "..iv.." -30")
                               jaf.hitplayer(iv,id,"Darkness Chain",dmgliat)
                               jaf.enemyhealthshow(id,player(iv,"name"),(player(iv,"health")+jaf.health[iv]),dmgliat)
                               end
                            end
                            local giid=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            local cekmonku=jaf.checkmonsterrad2(mx,my,(32),(32))
                            jaf.monsterFREZE[cekmonku]=5
                            jaf.itemSKILLIMG[id][giid]=image(jaf.locgfx.."chain.png",mx,my,1,0)
                            imagescale(jaf.itemSKILLIMG[id][giid],0.1,0.1)
                            tween_scale(jaf.itemSKILLIMG[id][giid],300,2,2)
                            function jaf.wdctmr(ipl,iid,mx,my,cmk)
                                    jaf.hitzone("xm"..cmk,ipl,oid,0,mx,my,math.random(4000,25000))
                                    jaf.getsound2(mx,my,"JAF/otherworld/hohoho.ogg",(9*32+16),(9*32+16))
                                    tween_scale(jaf.itemSKILLIMG[id][iid],100,0.7,0.7)
                                    parse("effect \"colorsmoke\" "..mx.." "..my.." 7 15 000 000 000")
                                   function jaf.wdctmr2(id,iid)
                                         jaf.varfreeimage(iid,jaf.itemSKILLIMG[id])
                                   end
                                   local wdctmr2=timerEx(800,jaf.wdctmr2,1,id,iid)
                            end
                            local wdctmr=timerEx(300,jaf.wdctmr,1,id,giid,mx,my,cekmonku)
                          end},
                          {jaf.locgfx.."skill_wing.png",time=20,click=false,
                           energy=10,
                          f=function(id)
                           local gethealcnt=math.random(700,3200)
                           jaf.health[id]=jaf.health[id]+gethealcnt
                           jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/ice.ogg",(7*32+16),(7*32+16))
                           for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  parse("effect \"flare\" "..player(i,"x").." "..player(i,"y").." 10 17 000 255 000")
                                  if i~=id then
                                  local getplkosong=jaf.table_check(jaf.itemSKILLIMG[i],nil).tn
                                  jaf.itemSKILLIMG[i][getplkosong]=image(jaf.locgfx.."hwing.png",0,0,200+i)
                                  imagescale(jaf.itemSKILLIMG[i][getplkosong],0.1,0.1)
                                  tween_scale(jaf.itemSKILLIMG[i][getplkosong],300,1,1)
                                  function jaf.kowskilnya(i,owk)
                                        tween_alpha(jaf.itemSKILLIMG[i][owk],500,0)
                                        function jaf.kowskilnya2(i2,owk2)
                                             jaf.varfreeimage(owk2,jaf.itemSKILLIMG[i2])
                                        end
                                        local kowskilnya2=timerEx(500,jaf.owskilnya2,1,i,owk)
                                  end
                                  local kowskilnya=timerEx(2*1000,jaf.kowskilnya,1,i,getplkosong)
                                  jaf.health[i]=jaf.health[i]+gethealcnt
                                  msg2(i,ungu.."You've been healed by "..player(id,"name"))
                                  end
                               end
                            end
                            msg2(id,ungu.."You are using Dark lighter skill")
                          end},
                        }
                 },
              [314]={name="Fake Hawk Secret Club Entry",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [315]={name="Hawk Secret Club Entry",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [316]={name="Premium Hawk Secret Club Entry",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [317]={name="Paper",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=500,
                 },
              [318]={name="Death Paper",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                 },
              [319]={name="Death Pen",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                 },
              [320]={name="Death Cover",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=50000,
                 },
              [321]={name="Ink",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [322]={name="Bandung Harbour Pass",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=15000,
                 },
              [323]={name="Paladin HighLord Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_upaladin.png",no=2},
                  more={hp=500,dmg=1000,speed=0,def=17},
                  sellback=0,
                  inf=true,
                  nf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."boaicon2.png",time=4,click=true,
                           energy=8,
                          f=function(id)
                            local v=jaf.skillitem2(id,math.random(15000,33000),{"gfx/JAF/otherworld/bod2.png",{1.5,100},{255,255,255},rc=50},700,(17*32+16),nil,{"flare",{030,144,255},30,20},"wall",nil,nil,nil,"BlueFlame Magic Axe")
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            local mt=v.monster
                            function jaf.gc(id,ni,v)
                              jaf.getsound2(v.x,v.y,"JAF/otherworld/waterexplode.ogg",(17*32+16),(17*32+16))
                              jaf.getsound2(v.x,v.y,"JAF/otherworld/electric shock.ogg",(17*32+16),(17*32+16))
                            local ni2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                              jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."plasma.png",v.x,v.y,1,0)
                              jaf.itemSKILLIMG[id][ni2]=image(jaf.locgfx.."flare.bmp",v.x,v.y,1,0)
                              imagescale(jaf.itemSKILLIMG[id][ni2],7,7)
                              imageblend(jaf.itemSKILLIMG[id][ni2],1)
                              tween_scale(jaf.itemSKILLIMG[id][ni],100,10,10)
                              function jaf.gc2(id,ni)
                                 jaf.varfreeimage(ni,jaf.itemSKILLIMG[id])
                              end
                              local gc2=timerEx(100,jaf.gc2,1,id,ni)
                              function jaf.gc3(id,ni2)
                                 jaf.varfreeimage(ni2,jaf.itemSKILLIMG[id])
                              end
                              local gc3=timerEx(300,jaf.gc3,1,id,ni2)
                            end
                            local gc=timerEx(v.timedir,jaf.gc,1,id,ni,v)
                            jaf.monsterFREZE[mt]=5
                          end},
                          {jaf.locgfx.."healicon2.png",time=10,click=false,
                           energy=20,
                          f=function(id)
                           local gethealcnt=math.random(1000,2000)
                           jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/ice.ogg",(7*32+16),(7*32+16))
                           for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  parse("effect \"flare\" "..player(i,"x").." "..player(i,"y").." 10 17 000 255 000")
                                  if i>0 then
                                  local getplkosong=jaf.table_check(jaf.itemSKILLIMG[i],nil).tn
                                  jaf.itemSKILLIMG[i][getplkosong]=image(jaf.locgfx.."flashing.png",0,0,200+i)
                                  imageblend(jaf.itemSKILLIMG[i][getplkosong],1)
                                  imagescale(jaf.itemSKILLIMG[i][getplkosong],0.1,0.1)
                                  tween_scale(jaf.itemSKILLIMG[i][getplkosong],300,1.5,1.5)
                                  function jaf.kowskilnyask(i,owk)
                                        tween_alpha(jaf.itemSKILLIMG[i][owk],500,0)
                                        function jaf.kowskilnya2(i2,owk2)
                                             jaf.varfreeimage(owk2,jaf.itemSKILLIMG[i2])
                                        end
                                        local kowskilnya2=timerEx(500,jaf.owskilnya2,1,i,owk)
                                  end
                                  local kowskilnyask=timerEx(2*1000,jaf.kowskilnyask,1,i,getplkosong)
                                  jaf.health[i]=jaf.health[i]+gethealcnt
                                  msg2(i,ungu.."You've been healed by "..player(id,"name"))
                                  end
                               end
                            end
                            msg2(id,ungu.."You are using Flash Cure skill")
                          end},
                        }
                 },
              [324]={name="Undead Warrior Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_undead.png",no=2},
                  more={hp=200,dmg=0,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [325]={name="Certificat of Doctor",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  inf=true,
                  sellback=false,
                  ontrade=false
                 },
              [326]={name="Hospital Card",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false
                 },
              [327]={name="Doctor Suit",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_doctor.png",no=2},
                  more={hp=1000,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [328]={name="Fire Drake Bow",
                  img={jaf.locgfx.."item/wpn_firedrakebow.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_firedrakebow.png",no=3},
                  more={hp=0,dmg=2500,speed=-3,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(1000,5000),{"gfx/JAF/otherworld/arrow2.png",{1,100},{255,127,000}},{700,500},(12*32+16),nil,{"flare",{255,127,000},1,5},"wall")
                             end,1, -- time
                             {{98,1}}, -- itemID required
                            }
                 },
              [329]={name="Hawk Bow",
                  img={jaf.locgfx.."item/wpn_rajawalibow.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_rajawalibow.png",no=3},
                  more={hp=0,dmg=3000,speed=3,def=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/flying.ogg",(9*32+16),(9*32+16))
                            local lastrot=player(id,"rot")
                            local v=jaf.skillitem2(id,math.random(100,600),{"gfx/JAF/otherworld/guidedarrow.png",{1.2,0},{255,255,255}},1200,(5*32+16),nil,{"colorsmoke",{255,255,255},1,5},"wall")
                            function jaf.bowkutr(id,v,rot)
                                if (v.dist*1000)>=(5*32+16) then
                                   jaf.skillitem2(id,math.random(500,6000),{"gfx/JAF/otherworld/arrow2.png",{1,0},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,255,255},1,5},"wall",{rot-5},{v.x,v.y})
                                   jaf.skillitem2(id,math.random(500,6000),{"gfx/JAF/otherworld/arrow2.png",{1,0},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,255,255},1,5},"wall",{rot+5},{v.x,v.y})
                                end
                             end
                             local bowkutr=timerEx(v.timedir,jaf.bowkutr,1,id,v,lastrot)
                             end,3, -- time
                             {{98,1}}, -- itemID required
                            }
                 },
              [330]={name="SoulBlade Pet",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/soulblade.png",no=4},
                  more={hp=2000,dmg=500,speed=2,def=5},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  func=function(id)
                  end,
                  petmove=1, -- 1=for blade
                  petattack=function(id)
                  end,
                  petskill=function(id)
                       if jaf.pet_montarget[id]<=0 and jaf.pet_target[id]<=0 then
                          parse('effect "colorsmoke" '..jaf.petx[id]..' '..jaf.pety[id]..' 52 22 255 255 255  ')
                          imagescale(jaf.itemIMG[id][4],0.5,0.5)
                          function jaf.sbkutr(id)
                                tween_scale(jaf.itemIMG[id][4],400,1,1)
                          end
                          local sbkutr=timerEx(3000,jaf.sbkutr,1,id)
                       end
                       if jaf.health[id]<jaf.maxhealth[id] then
                         jaf.health[id]=jaf.health[id]+math.random(1000,3000)
                         parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 32 32 000 555 000")
                       end 
                  end
                 },
              [331]={name="Golden Helm",
                  img={jaf.locgfx.."item/helm_goldenhelm.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_goldenhelm.png",no=1},
                  more={hp=1000,dmg=0,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [332]={name="Sunflare Bow",
                  img={jaf.locgfx.."item/wpn_sunflarebow.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_sunflarebow.png",no=3},
                  more={hp=0,dmg=200,speed=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/flying.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(700,3000),{"gfx/JAF/otherworld/arrow2.png",{1,100},{255,255,000}},{350,500},(17*32+16),nil,{"flare",{255,127,000},1,5},"wall")
                             end,0, -- time
                             {{98,1}}, -- itemID required
                            }
                 },
              [333]={name="Pink Dragon Helm",
                  img={jaf.locgfx.."item/helm_pinkdragon.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_pinkdragon.png",no=1},
                  more={hp=500,dmg=0,speed=0,def=2},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [334]={name="Coca Cola",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+100
                       jaf.drug_time[id]=jaf.drug_time[id]+8
                  end
                 },
              [335]={name="Sprite",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+100
                       jaf.drug_time[id]=jaf.drug_time[id]+7
                  end
                 },
              [336]={name="Fanta!",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+100
                       jaf.drug_time[id]=jaf.drug_time[id]+5
                  end
                 },
              [337]={name="Beer",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.exp[id]=jaf.exp[id]+200
                       jaf.drug_time[id]=jaf.drug_time[id]+20
                  end
                 },
              [338]={name="spaghetti",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.health[id]=jaf.health[id]+500
                  end
                 },
              [339]={name="Pancake",
                  img=false,
                  attbt={false,1,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  func=function(id)
                       jaf.health[id]=jaf.health[id]+800
                  end
                 },
              [340]={name="Legion Crystal",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false
                 },
              [341]={name="Sun Blade",
                  memberstat=1,
                  img={jaf.locgfx.."item/wpn_sunblade.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_sunblade.png",no=3},
                  more={hp=0,dmg=3000,speed=5,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [342]={name="SunBlade Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."sunblade.png",no=4},
                  more={hp=200,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  func=function(id)
                  end,
                  petmove=1, -- 1=for blade
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [343]={name="Fired Blade Pet",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."firedmachete.png",no=4},
                  more={hp=0,dmg=100,speed=3,def=24},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  func=function(id)
                  end,
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."sasu.png",ptx,pty,1,0)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.4,0.4)
                            tween_scale(jaf.itemSKILLIMG[id][NSIA],500,1,1)
                            jaf.pet_stop[id]=1
                            tween_move(jaf.itemIMG[id][4],300,ptx,pty,60)
                            function jaf.waktukuptfm(ipl,ppt,ptx,pty,nsia)
                                    jaf.varfreeimage(nsia,jaf.itemSKILLIMG[id])
                                    tween_move(jaf.itemIMG[ipl][4],300,ptx,pty,0)
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitplayer(jaf.pet_target[ipl],ipl,"Fired Blade Pet",math.random(500,5000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"fire\" "..player(ppt,"x").." "..player(ppt,"y").." 7 15 255 000 000")
                            end
                            local waktukuptfm=timerEx(500,jaf.waktukuptfm,1,id,pt,ptx,pty,NSIA)
                         end
                  end,
                  petskill=function(id)
                         if math.random(1,2)==1 then
                            if jaf.health[id]<jaf.maxhealth[id] then
                              jaf.health[id]=jaf.health[id]+math.random(1000,3000)
                              parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 32 32 000 555 000")
                            end 
                         else
                         local pt=jaf.pet_montarget[id]
                         if pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."sasu.png",ptx,pty,1,0)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.4,0.4)
                            tween_scale(jaf.itemSKILLIMG[id][NSIA],500,1,1)
                            jaf.pet_stop[id]=1
                            imagepos(jaf.itemIMG[id][4],jaf.petx[id],jaf.pety[id],90)
                            tween_move(jaf.itemIMG[id][4],300,ptx,pty,120)
                            function jaf.waktukuptfm2(ipl,ppt,pptx,ppty,nsia)
                                    jaf.varfreeimage(nsia,jaf.itemSKILLIMG[id])
                                    tween_move(jaf.itemIMG[ipl][4],300,pptx,ppty,0)
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitzone("xm"..ppt,ipl,oid,0,pptx,ppty,math.random(2000,4000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"fire\" "..pptx.." "..ppty.." 7 15 255 000 000")
                            end
                            local waktukuptfm2=timerEx(500,jaf.waktukuptfm2,1,id,pt,ptx,pty,NSIA)
                         end
                         end
                  end
                 },
              [344]={name="Blooded Butcher",
                  img={jaf.locgfx.."item/wpn_bloodedbutcher.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_bloodedbutcher.png",no=3,rc=2},
                  more={hp=0,dmg=1700,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [345]={name="Snow hat",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_snowhat.png",no=1},
                  more={hp=500,dmg=0,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [346]={name="Unidentified Bow",
                  img=false,
                  fireonatk=true,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_mysteriouscountbow.png",no=3},
                  more={hp=0,dmg=5000,speed=-3,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(5000,7000),{"gfx/JAF/otherworld/arrow2.png",{1,100},{000,000,000}},{700,500},(22*32+16),nil,{"flare",{255,000,000},1,5},"wall")
                             end,1, -- time
                             {{98,1}}, -- itemID required
                            }
                 },
              [347]={name="PumpkinLord Head",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false
                 },
              [348]={name="Magic Carpet",
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/magiccarpet.png",no=5},
                  more={hp=3000,dmg=0,speed=12,def=0},
                  sellback=0,
                  inf=true,
                  func=function(id)
                  end
                 },
              [349]={name="Battle Fiend Pet",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_battlefiend.png",no=4},
                  more={hp=-500,dmg=1000,speed=4,def=5},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  func=function(id)
                  end,
                  petskillrandom={2,1},
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local NSIA=1
                            local NSIA2=1
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."fiendblade1.png",(ptx-(1*32)),pty,1,0)
                            while jaf.itemSKILLIMG[id][NSIA2]~=nil do
                                NSIA2=NSIA2+1
                            end
                            jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."fiendblade2.png",(ptx+(1*32)),pty,1,0)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.7,0.7)
                            imagescale(jaf.itemSKILLIMG[id][NSIA2],0.7,0.7)
                            imagepos(jaf.itemSKILLIMG[id][NSIA],ptx,pty,200)
                            imagepos(jaf.itemSKILLIMG[id][NSIA2],ptx,pty,-200)
                            local cekmovex=jaf.checkmoverot(ptx,pty,-50,2*32)[1]
                            local cekmovey=jaf.checkmoverot(ptx,pty,-50,2*32)[2]
                            tween_move(jaf.itemSKILLIMG[id][NSIA],400,cekmovex,cekmovey,-200)
                            cekmovex=jaf.checkmoverot(ptx,pty,50,2*32)[1]
                            cekmovey=jaf.checkmoverot(ptx,pty,50,2*32)[2]
                            tween_move(jaf.itemSKILLIMG[id][NSIA2],400,cekmovex,cekmovey,200)
                            jaf.pet_stop[id]=1
                            imagepos(jaf.itemIMG[id][4],ptx,pty,0)
                            tween_move(jaf.itemIMG[id][4],500,ptx,(pty-4*32),0)
                            function jaf.waktukuptfm(ipl,ppt,ptx,pty,n1,n2)
                                    tween_alpha(jaf.itemSKILLIMG[ipl][n1],450,0)
                                    tween_alpha(jaf.itemSKILLIMG[ipl][n2],450,0)
                                    tween_move(jaf.itemIMG[ipl][4],300,ptx,pty,0)
                                    jaf.hitplayer(jaf.pet_target[ipl],ipl,"Fired Blade Pet",math.random(100,2000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"fire\" "..player(ppt,"x").." "..player(ppt,"y").." 7 15 255 000 000")
                                    function jaf.waktukuptfm3(ipll,nn1,nn2)
                                    jaf.varfreeimage(nn1,jaf.itemSKILLIMG[id])
                                    jaf.varfreeimage(nn2,jaf.itemSKILLIMG[id])
                                          jaf.pet_stop[ipll]=0
                                    end
                                    local waktukuptfm3=timerEx(500,jaf.waktukuptfm3,1,ipl,n1,n2)
                            end
                            local waktukuptfm=timerEx(500,jaf.waktukuptfm,1,id,pt,ptx,pty,NSIA,NSIA2)
                           end
                  end,
                  petskill=function(id)
                         local pt=jaf.pet_montarget[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local NSIA=1
                            local NSIA2=1
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."fiendblade1.png",(ptx-(1*32)),pty,1,0)
                            while jaf.itemSKILLIMG[id][NSIA2]~=nil do
                                NSIA2=NSIA2+1
                            end
                            jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."fiendblade2.png",(ptx+(1*32)),pty,1,0)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.7,0.7)
                            imagescale(jaf.itemSKILLIMG[id][NSIA2],0.7,0.7)
                            imagepos(jaf.itemSKILLIMG[id][NSIA],ptx,pty,200)
                            imagepos(jaf.itemSKILLIMG[id][NSIA2],ptx,pty,-200)
                            local cekmovex=jaf.checkmoverot(ptx,pty,-50,2*32)[1]
                            local cekmovey=jaf.checkmoverot(ptx,pty,-50,2*32)[2]
                            tween_move(jaf.itemSKILLIMG[id][NSIA],400,cekmovex,cekmovey,-200)
                            cekmovex=jaf.checkmoverot(ptx,pty,50,2*32)[1]
                            cekmovey=jaf.checkmoverot(ptx,pty,50,2*32)[2]
                            tween_move(jaf.itemSKILLIMG[id][NSIA2],400,cekmovex,cekmovey,200)
                            jaf.pet_stop[id]=1
                            imagescale(jaf.itemIMG[id][4],1,1)
                            jaf.petx[id]=ptx
                            jaf.pety[id]=pty
                            imagepos(jaf.itemIMG[id][4],jaf.petx[id],jaf.pety[id],0)
                            tween_move(jaf.itemIMG[id][4],500,ptx,(pty-4*32),0)
                            function jaf.waktukuptfm2(ipl,ppt,pptx,ppty,n1,n2)
                                    tween_alpha(jaf.itemSKILLIMG[ipl][n1],450,0)
                                    tween_alpha(jaf.itemSKILLIMG[ipl][n2],450,0)
                                    tween_move(jaf.itemIMG[ipl][4],300,pptx,ppty,0)
                                    jaf.hitzone("xm"..ppt,ipl,oid,0,pptx,ppty,math.random(5000,12000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"fire\" "..pptx.." "..ppty.." 7 15 255 000 000")
                                    function jaf.waktukuptfm3(ipll,nn1,nn2)
                                    jaf.varfreeimage(nn1,jaf.itemSKILLIMG[ipll])
                                    jaf.varfreeimage(nn2,jaf.itemSKILLIMG[ipll])
                                          jaf.pet_stop[ipll]=0
                                    end
                                    local waktukuptfm3=timerEx(500,jaf.waktukuptfm3,1,ipl,n1,n2)
                            end
                            local waktukuptfm2=timerEx(700,jaf.waktukuptfm2,1,id,pt,ptx,pty,NSIA,NSIA2)
                         end
                  end
                 },
              [350]={name="Magic SoulBlade Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/pet_magicsoulblade.png",no=4},
                  more={hp=0,dmg=1000,speed=5,def=16},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  func=function(id)
                  end,
                  petmove=1, -- 1=for blade
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [351]={name="Contract of VoidLord",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false
                 },
              [352]={name="Dark Energy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=false
                 },
              [353]={name="Void Blade Battle Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."fiendblade1.png",no=4},
                  more={hp=0,dmg=500,speed=2,def=0},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  petskillrandom={2,2},
                  func=function(id)
                  end,
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            imagepos(jaf.itemIMG[id][4],jaf.petx[id],jaf.pety[id],90)
                            tween_move(jaf.itemIMG[id][4],400,(ptx-4*32),pty,150)
                            function jaf.waktukuptfm(ipl,ppt,ptx,pty)
                                    tween_move(jaf.itemIMG[ipl][4],300,(ptx+3*32),(pty-3*32),-20)
                                    jaf.hitplayer(jaf.pet_target[ipl],ipl,"Fired Blade Pet",math.random(200,1500))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"flare\" "..player(ppt,"x").." "..player(ppt,"y").." 7 15 255 127 000")
                                    function jaf.waktukuptfm3(ipll)
                                         jaf.pet_stop[ipll]=0
                                    end
                                   local waktukuptfm3=timerEx(600,jaf.waktukuptfm3,1,ipl)
                            end
                            local waktukuptfm=timerEx(300,jaf.waktukuptfm,1,id,pt,ptx,pty)
                        end
                  end,
                  petskill=function(id)
                         local pt=jaf.pet_montarget[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            imagepos(jaf.itemIMG[id][4],jaf.petx[id],jaf.pety[id],90)
                            tween_move(jaf.itemIMG[id][4],400,(ptx-4*32),pty,150)
                            function jaf.waktukuptfm2(ipl,ppt,pptx,ppty)
                                    tween_move(jaf.itemIMG[ipl][4],300,(pptx+3*32),(ppty-2*32),-20)
                                    jaf.hitzone("xm"..ppt,ipl,oid,0,pptx,ppty,math.random(4000,8000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    parse("effect \"flare\" "..pptx.." "..ppty.." 7 15 255 127 000")
                                    function jaf.waktukuptfm3(ipll)
                                         jaf.pet_stop[ipll]=0
                                    end
                                   local waktukuptfm3=timerEx(600,jaf.waktukuptfm3,1,ipl)
                            end
                            local waktukuptfm2=timerEx(300,jaf.waktukuptfm2,1,id,pt,ptx,pty)
                         end
                  end
                 },
              [354]={name="Pumpkin",
                  img={jaf.locgfx.."item/item_pumpkin.png",1},
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [355]={name="Hallowen Staff",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_halloweenstaff.png",no=3},
                  more={hp=0,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                               jaf.skillitem2(id,math.random(1300,5000),{"gfx/JAF/otherworld/item/halloweenstaffprojectile.png",{2,1000},{255,255,255}},1000,(12*32+16),nil,{"fire",{255,255,255},32,26},"wall")
jaf.getsound2(plc.x,plc.y,"JAF/otherworld/go.ogg",(9*32+16),(9*32+16))
                             end,1, -- time
                             {354}, -- itemID required
                            }
                 },
              [356]={name="Sky Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_sky.png",no=6},
                  more={hp=0,dmg=0,speed=10,def=0},
                  sellback=5000,
                  inf=true,
                  wingclose=true,
                  oncebuy=true,
                  func=function(id) end
                 },
              [357]={name="Corruptions Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_corrupt.png",no=2},
                  more={hp=400,dmg=0,speed=0,def=8},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [358]={name="Susanoo pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_susanoo_fix.png",no=4},
                  more={hp=0,dmg=500,speed=2,def=11},
                  sellback=0,
                  inf=true,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [359]={name="Warrior Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_warrior.png",no=2},
                  more={hp=0,dmg=700,speed=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."blightningicon.png",time=2,click=true,
                          energy=7,
                          f=function(id)
                            jaf.skillitem2(id,math.random(100,5000),{"gfx/JAF/otherworld/lightning.png",{5,1000},{255,255,255}},1300,(12*32+16),{32,20},{"fire",{255,255,255},60,40},"wall")
                          end},
                          {jaf.locgfx.."arrows2icon.png",time=5,click=true,
                          energy=10,
                          f=function(id)
                            jaf.skillitem2(id,math.random(500,3400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,000,255},1,5},"wall",-5,nil,nil,"Arrow of Truth")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/chestopen.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(500,3400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,000,255},1,5},"wall",nil,nil,nil,"Arrow of Truth")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/chestopen.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(500,3400),{"gfx/JAF/otherworld/arrow2.png",{1,700},{255,255,255}},{700,500},(12*32+16),nil,{"flare",{000,000,255},1,5},"wall",5,nil,nil,"Arrow of Truth")
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/chestopen.ogg",(9*32+16),(9*32+16))
                          end},
                        }
                 },
              [360]={name="Void Highlord",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_vhl.png",no=2},
                  more={hp=1000,dmg=0,speed=8},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  nf=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."spearchainicon.png",time=3,click=false,
                          energy=14,
                          f=function(id)
                            if math.random(1,3)==2 then
                               jaf.energy[id]=jaf.energy[id]+5
                            end
                            local mx=jaf.mouseX[id]
                            local my=jaf.mouseY[id]
                            local plmx=0
                            local monmx=0
                            for _,iv in pairs(player(0,"tableliving")) do
                                if plmx>=3 then break end
                                if iv~=id and jaf.radiuscheck(player(iv,"x"),player(iv,"y"),player(id,"x"),player(id,"y"),(32*9),(32*9)) then
                                plmx=plmx+1
                                local dmgliat=math.random(50,400)
                               jaf.hitplayer(iv,id,"Spear of Void",dmgliat)
                               jaf.enemyhealthshow(id,player(iv,"name"),(player(iv,"health")+jaf.health[iv]),dmgliat)
                               mx=player(iv,"x")
                               my=player(iv,"y")
                               jaf.stunt[iv]=4
                               parse("speedmod "..iv.." -20")
                            jaf.getsound2(mx,my,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                            local giid=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][giid]=image(jaf.locgfx.."fiendspear.png",(mx),my,1,0)
                            local giid2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][giid2]=image(jaf.locgfx.."fiendspear.png",(mx),my,1,0)
                            tween_move(jaf.itemSKILLIMG[id][giid],300,(mx+10),(my-32*2),10)
                            tween_move(jaf.itemSKILLIMG[id][giid2],300,(mx-10),(my-32*2),-10)
                            function jaf.wdctmr(ipl,iid,mx,my,cmk,iid2)
                                    jaf.getsound2(mx,my,"weapons/machete_slash.wav",(9*32+16),(9*32+16))
                                    local obj=objectat(math.floor(mx/32),math.floor(my/32),30)
                                    if obj>0 then
                                      jaf.objectdamage(obj,"o"..math.random(5000,7600),ipl)
                                    end
                                    tween_move(jaf.itemSKILLIMG[ipl][iid],200,(mx+2*32),my,-30)
                                    tween_move(jaf.itemSKILLIMG[ipl][iid2],200,(mx-2*32),my,30)
                                    parse("effect \"colorsmoke\" "..mx.." "..my.." 7 15 000 000 000")
                                   function jaf.wdctmr2(id,iid,iid2)
                                         jaf.varfreeimage(iid,jaf.itemSKILLIMG[id])
                                         jaf.varfreeimage(iid2,jaf.itemSKILLIMG[id])
                                   end
                                   local wdctmr2=timerEx(800,jaf.wdctmr2,1,id,iid,iid2)
                            end
                            local wdctmr=timerEx(300,jaf.wdctmr,1,id,giid,mx,my,cekmonku,giid2)
                            end
                            end

                            for i,i2 in pairs(jaf.monsterid) do
                                if monmx>=3 then break end
                                if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil and jaf.radiuscheck(jaf.monsterx[i],jaf.monstery[i],player(id,"x"),player(id,"y"),(32*9),(32*9)) then
                                monmx=monmx+1
                               mx=jaf.monsterx[i]
                               my=jaf.monstery[i]
                            jaf.getsound2(mx,my,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                            local giid=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            local cekmonku=i
                            jaf.monsterFREZE[cekmonku]=8
                            jaf.itemSKILLIMG[id][giid]=image(jaf.locgfx.."fiendspear.png",(mx),my,1,0)
                            local giid2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][giid2]=image(jaf.locgfx.."fiendspear.png",(mx),my,1,0)
                            tween_move(jaf.itemSKILLIMG[id][giid],300,(mx+10),(my-32*2),10)
                            tween_move(jaf.itemSKILLIMG[id][giid2],300,(mx-10),(my-32*2),-10)
                            function jaf.wdctmr(ipl,iid,mx,my,cmk,iid2)
                                    jaf.hitzone("xm"..cmk,ipl,oid,0,mx,my,math.random(5000,7600))
                                    jaf.getsound2(mx,my,"weapons/machete_slash.wav",(9*32+16),(9*32+16))
                                    local obj=objectat(math.floor(mx/32),math.floor(my/32),30)
                                    if obj>0 then
                                      jaf.objectdamage(obj,"o"..math.random(5000,7600),ipl)
                                    end
                                    tween_move(jaf.itemSKILLIMG[ipl][iid],200,(mx+2*32),my,-30)
                                    tween_move(jaf.itemSKILLIMG[ipl][iid2],200,(mx-2*32),my,30)
                                    parse("effect \"colorsmoke\" "..mx.." "..my.." 7 15 000 000 000")
                                   function jaf.wdctmr2(id,iid,iid2)
                                         jaf.varfreeimage(iid,jaf.itemSKILLIMG[id])
                                         jaf.varfreeimage(iid2,jaf.itemSKILLIMG[id])
                                   end
                                   local wdctmr2=timerEx(800,jaf.wdctmr2,1,id,iid,iid2)
                            end
                            local wdctmr=timerEx(300,jaf.wdctmr,1,id,giid,mx,my,cekmonku,giid2)
                            end
                            end
                          end},
                          {jaf.locgfx.."hgicon.png",time=12,click=true,
                          energy=20,
                          f=function(id)
                            parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 10 17 255 255 255")
                            jaf.health[id]=jaf.health[id]+math.random(800,1200)
                           local NSIA=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            local ptx=jaf.mouseX[id]
                            local pty=jaf.mouseY[id]
                            jaf.getsound2(ptx,pty,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                            for _,iv in pairs(player(0,"tableliving")) do
                                if iv~=id and jaf.radiuscheck(player(iv,"x"),player(iv,"y"),ptx,pty,(32*1.5),(32*1.5)) then
                               jaf.stunt[iv]=1
                               local dmgliat=math.random(3000,5500)
                               parse("speedmod "..iv.." -10")
                               jaf.hitplayer(iv,id,"Void Blades Slash",dmgliat)
                               jaf.enemyhealthshow(id,player(iv,"name"),(player(iv,"health")+jaf.health[iv]),dmgliat)
                               end
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."voideyes.png",ptx,pty,1,0)
                           local NSIA2=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."fiendblade2.png",ptx,pty,1,0)
                           local NSIA3=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][NSIA3]=image(jaf.locgfx.."fiendblade3.png",ptx,pty,1,0)
                           local NSIA4=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][NSIA4]=image(jaf.locgfx.."fiendblade4.png",ptx,pty,1,0)
                            imagescale(jaf.itemSKILLIMG[id][NSIA],0.4,0.4)
                            imagescale(jaf.itemSKILLIMG[id][NSIA4],0.4,0.4)
                            tween_scale(jaf.itemSKILLIMG[id][NSIA],300,1.1,1.1)
                            tween_scale(jaf.itemSKILLIMG[id][NSIA4],400,1.2,1.2)
                            imagepos(jaf.itemSKILLIMG[id][NSIA4],ptx,pty,180)
                            tween_move(jaf.itemSKILLIMG[id][NSIA4],500,ptx,(pty-5*32),180)
                            imagepos(jaf.itemSKILLIMG[id][NSIA2],(ptx+3*32),pty,90)
                            tween_move(jaf.itemSKILLIMG[id][NSIA2],400,(ptx-4*32),pty,150)
                            imagepos(jaf.itemSKILLIMG[id][NSIA3],(ptx-3*32),pty,-90)
                            tween_move(jaf.itemSKILLIMG[id][NSIA3],400,(ptx+4*32),pty,-150)
                            function jaf.waktukuptfm2(ipl,pptx,ppty,nsia,NSIA2,NSIA3,NSIA4)
                            jaf.getsound2(pptx,ppty,"JAF/otherworld/go.ogg",(9*32+16),(9*32+16))
                            jaf.getsound2(pptx,ppty,"JAF/otherworld/knife_deploy.ogg",(9*32+16),(9*32+16))
                            local obj=objectat(math.floor(ptx/32),math.floor(pty/32),30)
                            if obj>0 then
                               jaf.objectdamage(obj,"o"..math.random(100,18200),ipl)
                            end
                                   jaf.varfreeimage(NSIA4,jaf.itemSKILLIMG[ipl])
                                  jaf.skillitem2(ipl,math.random(3000,11000),{"gfx/JAF/otherworld/fiendblade4.png",{1.2,1},{255,255,255}},{700,700},(5*32),nil,{"flare",{000,000,000},40,20},"free",{jaf.rot_target(pptx,(ppty-5*32),pptx,ppty)},{pptx,(ppty-5*32)},nil,"Fiend Blade")
                                    tween_scale(jaf.itemSKILLIMG[id][NSIA],300,1,1)
                                    tween_move(jaf.itemSKILLIMG[id][NSIA2],300,(pptx+3*32),(ppty-2*32),-20)
                                    tween_move(jaf.itemSKILLIMG[id][NSIA3],300,(pptx-3*32),(ppty-2*32),20)
                                    jaf.hitzone(nil,ipl,oid,0,pptx,ppty,math.random(100,18200))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                                    function jaf.waktukuptfm3(ipll,nnsia,nnsia2,nnsia3)
                                         jaf.varfreeimage(nnsia,jaf.itemSKILLIMG[id])
                                         jaf.varfreeimage(nnsia2,jaf.itemSKILLIMG[id])
                                         jaf.varfreeimage(nnsia3,jaf.itemSKILLIMG[id])
                                    end
                                   local waktukuptfm3=timerEx(800,jaf.waktukuptfm3,1,ipl,nsia,NSIA2,NSIA3)
                            end
                            local waktukuptfm2=timerEx(500,jaf.waktukuptfm2,1,id,ptx,pty,NSIA,NSIA2,NSIA3,NSIA4)
                          end},
                        }
                 },
              [361]={name="Void Crystal A",
                  img=false,
                  attbt=false,
                  nf=true,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [362]={name="Void Crystal B",
                  img=false,
                  attbt=false,
                  nf=true,
                  more={hp=0,dmg=0,speed=0},
                  sellback=5000,
                 },
              [363]={name="Shadow Spear Of Fiend",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_shadowspearoffiend.png",no=3},
                  more={hp=0,dmg=1500,speed=3,def=1},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [364]={name="Void Eyes Blade",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_voideyesblade.png",no=3},
                  more={hp=0,dmg=1500,speed=1,def=4},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [365]={name="Time Void Energy",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [366]={name="Dark ShadowMaster Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_shadow.png",no=2},
                  more={hp=200,dmg=0,speed=0,def=20},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [367]={name="Susanoo Bow",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/Wpn_susanobow.png",no=3},
                  more={hp=0,dmg=300,speed=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  fireonatk=true,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(4000,8000),{"gfx/JAF/otherworld/bigarrow.png",{0.7,0},{255,255,255}},{300,300},(20*32+16),nil,{"flare",{191,000,255},10,20},"wall")
                             end,1, -- time
                             {{98,1}}, -- itemID required
                            }
                 },
              [368]={name="Susanoo Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_susano.png",no=2},
                  more={hp=500,dmg=50,speed=0,def=10},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [369]={name="Susanoo Head",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_susano.png",no=1},
                  more={hp=0,dmg=0,speed=0,def=12},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [370]={name="Susanoo Wings",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_susano.png",no=6},
                  more={hp=500,dmg=0,speed=10,def=0},
                  sellback=5000,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id) end
                 },
              [371]={name="Black Monk Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_blackmonk.png",no=2,rc=2},
                  more={hp=400,dmg=0,speed=0,def=2},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [372]={name="Red Monk Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_redmonk.png",no=2,rc=2},
                  more={hp=500,dmg=0,speed=0,def=12},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [373]={name="Ivory Suit",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_ivory.png",no=2},
                  more={hp=10,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [374]={name="Assasin Ninja Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_lassasin.png",no=2},
                  more={hp=0,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."kunaiicon.png",time=2,click=true,
                           energy=7,
                          f=function(id)
                            jaf.skillitem2(id,math.random(1500,2500),{"gfx/JAF/otherworld/kunaibomb.png",{1,1},{255,255,255}},550,(17*32+16),{32,20},{"fire",{255,255,255},60,40},"wall",nil,nil,nil,"Kunai Bomb")
                          end},
                          {jaf.locgfx.."deficon.png",time=12,click=false,
                           energy=20,
                          f=function(id)
                            jaf.freezeme[id]=7
                            jaf.itemDEF[id]=100
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            local ni=jaf.table_check(jaf.itemSKILLIMG[id],nil).tn
                            jaf.itemSKILLIMG[id][ni]=image(jaf.locgfx.."deflector.png",0,0,100+id)
                            imagescale(jaf.itemSKILLIMG[id][ni],2,2)
                            tween_scale(jaf.itemSKILLIMG[id][ni],500,0.8,0.8)
                            tween_rotateconstantly(jaf.itemSKILLIMG[id][ni],15)
                            function jaf.sofn(id,ni)
                                 jaf.varfreeimage(ni,jaf.itemSKILLIMG[id])
                            end
                            local sofn=timerEx(7000,jaf.sofn,1,id,ni)
                          end},
                        }
                 },
              [375]={name="Free-Item Ticket",
                  img=false,
                  attbt=false,
                  sellback=0,
                  usgn=true,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       if jaf.usgn[id]>0 then
                          jaf.freeitemb[id]=jaf.freeitemb[id]+1
                       end
                  end
                 },
              [376]={name="Legendary Chi Fighter Armor",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/armor_chifighter.png",no=2},
                  more={hp=8500,dmg=4000,speed=0,def=45},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [377]={name="Black Beraniga Horse",
                  img=false,
                  attbt={true,100,img=jaf.locgfx.."item/beranigahorse.png",no=5},
                  more={hp=0,dmg=0,speed=8,def=0},
                  sellback=0,
                  inf=true,
                  func=function(id)
                  end
                 },
              [378]={name="DarkSoul hands",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_darksoul.png",no=3},
                  more={hp=0,dmg=2500,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/fire.ogg",(9*32+16),(9*32+16))
                            jaf.skillitem2(id,math.random(3000,4000),{"gfx/JAF/otherworld/flare.bmp",{1,100},{255,000,000},nil,1},500,(22*32+16),nil,{"flare",{255,000,000},8,12},"free")
                             end,1, -- time
                             {{376,1}}, -- itemID required
                            }
                 },
              [379]={name="Blue Ball - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=1
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [380]={name="Void Energy - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=2
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [381]={name="Meteor - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=3
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [382]={name="Pumpkin - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=4
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [383]={name="Love - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=5
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [384]={name="Katana - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=6
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [385]={name="Crown - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=7
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [386]={name="GameMaster Crown - Clan Symbol",
                  img=false,
                  attbt={false,200,img=false,no=1},
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                  inf=false,
                  ontrade=false,
                  func=function(id)
                       jaf.load_clan(id,jaf.clan[id])
                       local cid=jaf.clan[id]
                       if cid>0 and jaf.clan_leader[cid]==jaf.usgn[id] then
                            jaf.clan_markimg[cid]=8
                            jaf.save_clan(cid)
                       elseif cid<1 then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                       elseif jaf.clan_leader[cid]~=jaf.usgn[id] then
                            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],30))
                       end
                  end
                 },
              [387]={name="Gold",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=1000,
                 },
              [388]={name="Crystal",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=2000,
                 },
              [389]={name="SoulAxe Battle Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."bod2.png",no=4},
                  more={hp=1000,dmg=100,speed=2,def=14},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  petskillrandom={2,1},
                  func=function(id)
                  end,
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            local petmtmr=300
                            if math.random(1,2)==1 then
                               petmtmr=500
                               tween_move(jaf.itemIMG[id][4],petmtmr,ptx,pty,ptr)
                            else
                               tween_scale(jaf.itemIMG[id][4],petmtmr,3,3)
                               tween_move(jaf.itemIMG[id][4],petmtmr,ptx,pty,0)
                            end
                            function jaf.waktukupt(ipl,ppt)
                                    parse("speedmod "..jaf.pet_target[ipl].." -20")
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitplayer(jaf.pet_target[ipl],ipl,"SoulAxe Battle Pet",math.random(500,1000))
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/stun.ogg",(9*32+16),(9*32+16))
                                    tween_scale(jaf.itemIMG[ipl][4],100,1,1)
                                    parse("effect \"flare\" "..player(ppt,"x").." "..player(ppt,"y").." 7 15 255 255 255")
                            end
                            local waktukupt=timerEx(petmtmr,jaf.waktukupt,1,id,pt)
                         end
                  end,
                  petskill=function(id)
                         local pt=jaf.pet_montarget[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            local petmtmr=300
                            if math.random(1,2)==1 then
                               petmtmr=500
                               tween_move(jaf.itemIMG[id][4],petmtmr,ptx,pty,ptr)
                            else
                               tween_scale(jaf.itemIMG[id][4],petmtmr,3,3)
                               tween_move(jaf.itemIMG[id][4],petmtmr,ptx,pty,0)
                            end
                            function jaf.waktukupt2(ipl,ppt,pptx,ppty)
                                    jaf.pet_stop[ipl]=0
                                    jaf.hitzone("xm"..ppt,ipl,oid,0,pptx,ppty,math.random(4900,5200))
                                    if jaf.health[ipl]<jaf.maxhealth[ipl] then
                                       jaf.health[ipl]=jaf.health[ipl]+300
                                    end
                                    jaf.monsterFREZE[ppt]=3
                                    jaf.getsound2(jaf.petx[ipl],jaf.pety[ipl],"JAF/otherworld/stun.ogg",(9*32+16),(9*32+16))
                                    tween_scale(jaf.itemIMG[ipl][4],100,1,1)
                                    parse("effect \"flare\" "..pptx.." "..ppty.." 7 15 255 255 255")
                            end
                            local waktukupt2=timerEx(petmtmr,jaf.waktukupt2,1,id,pt,ptx,pty)
                         end
                  end
                 },
              [390]={name="Blazing DoubleAxe",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_blazingdoubleaxe.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_blazingdoubleaxe.png",no=3},
                  more={hp=0,dmg=4000,speed=0,def=5},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [391]={name="Ultimate BlazingAxe",
                  memberstat=1,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_ultimateblazingaxe.png",no=3},
                  more={hp=0,dmg=5000,speed=4,def=15},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [392]={name="BlazingAxe Pet",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."bod3.png",no=4},
                  more={hp=0,dmg=0,speed=2,def=5},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  ontrade=false,
                  petmove=1,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end,
                  petskill=function(id)
                  end
                 },
              [393]={name="DarkEvil Battle Pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_darkevil.png",no=4},
                  more={hp=1000,dmg=0,speed=1,def=0},
                  sellback=0,
                  inf=true,
                  petrot=true,
                  ontrade=false,
                  petmove=false,
                  petskillrandom={2,2},
                  func=function(id)
                  end,
                  petattack=function(id)
                         local pt=jaf.pet_target[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and player(pt,"exists") and player(pt,"health")>0 then
                            local ptx=player(pt,"x")
                            local pty=player(pt,"y")
                            jaf.petx[id]=(ptx+5*32)
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            tween_move(jaf.itemIMG[id][4],200,jaf.petx[id],jaf.pety[id],ptr)
                            function jaf.waktukupt(id,ppt,ptr)
                                   jaf.skillitem2(id,math.random(200,2200),{"gfx/JAF/otherworld/bladehit.png",{1,1},{000,000,000}},500,(12*32+16),nil,nil,"free",{ptr},{jaf.petx[id],jaf.pety[id]})
                                   function jaf.waktukupt2(ipl)
                                        jaf.pet_stop[ipl]=0
                                   end
                                   local waktukupt2=timerEx(300,jaf.waktukupt2,1,id)
                            end
                            local waktukupt=timerEx(200,jaf.waktukupt,1,id,pt,ptr)
                         end
                  end,
                  petskill=function(id)
                         local pt=jaf.pet_montarget[id]
                         if jaf.pet_stop[id]<=0 and pt>0 and jaf.monsterHP[pt]>0 and jaf.monsterIMG[pt]~=nil then
                            local ptx=jaf.monsterx[pt]
                            local pty=jaf.monstery[pt]
                            jaf.petx[id]=(ptx+5*32)
                            local ptr=jaf.rot_target(jaf.petx[id],jaf.pety[id],ptx,pty)
                            jaf.pet_stop[id]=1
                            tween_move(jaf.itemIMG[id][4],200,jaf.petx[id],jaf.pety[id],ptr)
                            function jaf.waktukupt(id,ppt,ptr)
                                   jaf.skillitem2(id,math.random(2600,4700),{"gfx/JAF/otherworld/bladehit.png",{1,1},{000,000,000}},500,(12*32+16),nil,nil,"free",{ptr},{jaf.petx[id],jaf.pety[id]})
                                   function jaf.waktukupt2(ipl)
                                        jaf.pet_stop[ipl]=0
                                   end
                                   local waktukupt2=timerEx(200,jaf.waktukupt2,1,id)
                            end
                            local waktukupt=timerEx(300,jaf.waktukupt,1,id,pt,ptr)
                         end
                  end
                 },
              [394]={name="Piano",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_piano.png",no=3},
                  more={hp=0,dmg=700,speed=-3},
                  sellback=0,
                  inf=true,
                  comwpn=false,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/pianonoise.wav",(9*32+16),(12*32+16))
                            jaf.skillitem2(id,math.random(700,2200),{"gfx/JAF/otherworld/song.png",{1,100},{255,255,255}},700,(12*32+16),nil,nil,"free",-4)
                            jaf.skillitem2(id,math.random(700,2200),{"gfx/JAF/otherworld/song.png",{1,100},{255,255,255}},700,(12*32+16),nil,nil,"free")
                            jaf.skillitem2(id,math.random(700,2200),{"gfx/JAF/otherworld/song.png",{1,100},{255,255,255}},700,(12*32+16),nil,nil,"free",4)
                             end,2, -- time
                             {395}, -- itemID required
                            }
                 },
              [395]={name="Melody",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [396]={name="Yellow Axe Toy",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_axetoy.png",0.8},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_axetoy.png",no=3},
                  more={hp=0,dmg=10,speed=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [397]={name="Devil Mace",
                  memberstat=0,
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wpn_evilmace.png",no=3},
                  more={hp=400,dmg=3500,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [398]={name="Pink Sword",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_pinksword.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_pinksword.png",no=3},
                  more={hp=0,dmg=2000,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [399]={name="StarLord Sword",
                  memberstat=0,
                  img={jaf.locgfx.."item/wpn_starlord.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/wpn_starlord.png",no=3},
                  more={hp=0,dmg=1000,speed=4,def=0},
                  sellback=0,
                  inf=true,
                  oncebuy=false,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [400]={name="Artist Barret",
                  img={jaf.locgfx.."item/helm_artist.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_artist.png",no=1},
                  more={hp=2000,dmg=0,speed=0,def=20},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [401]={name="Devil Legion helm",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_badevil.png",no=1},
                  more={hp=500,dmg=0,speed=5,def=8},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [402]={name="Phoenix helm",
                  img={jaf.locgfx.."item/helm_phoenix.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_phoenix.png",no=1},
                  more={hp=500,dmg=400,speed=0,def=5},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [403]={name="Tron helm",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_tron.png",no=1},
                  more={hp=1500,dmg=0,speed=0,def=8},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [404]={name="Fairy Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_fairy.png",no=6},
                  more={hp=1000,dmg=0,speed=7,def=2},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=true,
                  inf=true,
                  func=function(id) end
                 },
              [405]={name="Hypnosis Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_hypnosis.png",no=6},
                  more={hp=100,dmg=0,speed=6,def=0},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [406]={name="Draconican Wings",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/wing_dragon.png",no=6},
                  more={hp=50,dmg=500,speed=8,def=4},
                  sellback=0,
                  comwpn=true,
                  ontrade=true,
                  wingclose=false,
                  inf=true,
                  func=function(id) end
                 },
              [407]={name="Cow pet",
                  img=false,
                  attbt={true,0,img=jaf.locgfx.."item/pet_cowkid.png",no=4},
                  more={hp=0,dmg=0,speed=0,def=0},
                  sellback=0,
                  inf=true,
                  petrot=false,
                  func=function(id)
                  end,
                  petattack=function(id)
                  end
                 },
              [408]={name="Warrior helm",
                  img={jaf.locgfx.."item/helm_warrior.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/helm_warrior.png",no=1},
                  more={hp=2500,dmg=0,speed=4,def=5},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [409]={name="Pope face",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/helm_pope.png",no=1},
                  more={hp=220,dmg=0,speed=0,def=0},
                  sellback=0,
                  ontrade=false,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end
                 },
              [410]={name="Divine Staff",
                  img={jaf.locgfx.."item/Wpn_divinestaff.png",0.9},
                  attbt={true,200,img=jaf.locgfx.."item/Wpn_divinestaff.png",no=3},
                  more={hp=0,dmg=6000,speed=5,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  func=function(id)
                  end,
                  itemskill={function(id) -- func
                            jaf.getsound(id,"JAF/otherworld/ice.ogg")
                            jaf.skillitem2(id,math.random(3500,12000),{"gfx/JAF/otherworld/item/divinestaffprojectile.png",{1,100},{255,255,255},rc=15},700,(17*32+16),nil,{"flare",{255,255,000},12,20},"wall")
                             end,2, -- time
                             {103,99}, -- itemID required
                            }
                 },
              [411]={name="Terminator Class",
                  img={jaf.locgfx.."item/armor_shadow.png",1},
                  attbt={true,200,img=jaf.locgfx.."item/armor_shadow.png",no=2},
                  more={hp=0,dmg=500,speed=0,def=7},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  oncebuy=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."term1icon.png",time=5,click=true,
                           energy=5,
                          f=function(id)
                            local rrot=player(id,"rot")
                            local chb=jaf.checkblockpos(player(id,"x"),player(id,"y"),(rrot+30),id,(4*32+16))
                            if chb.dis>=(4*32+16) then
                            local NSIA=1
                            while jaf.itemSKILLIMG[id][NSIA]~=nil do
                                NSIA=NSIA+1
                            end
                            jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."rocket.png",player(id,"x"),player(id,"y"),1,0)
                            imagepos(jaf.itemSKILLIMG[id][NSIA],player(id,"x"),player(id,"y"),(rrot+30))
                            ---imagescale(jaf.itemSKILLIMG[id][NSIA],0.8,0,8)
                            tween_move(jaf.itemSKILLIMG[id][NSIA],200,chb.x,chb.y,(rrot+30))
                            function jaf.tclasst(id,ns1,x,y)
                                 local chb2=jaf.checkblockpos(x,y,(rrot-30),id,(4*32+16))
                                jaf.varfreeimage(ns1,jaf.itemSKILLIMG[id])
                                if chb2.dis>=(4*32+16) then
                                local NSIA2=1
                                while jaf.itemSKILLIMG[id][NSIA2]~=nil do
                                    NSIA2=NSIA2+1
                                end
                                jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."rocket.png",x,y,1,0)
                                imagepos(jaf.itemSKILLIMG[id][NSIA2],x,y,(rrot+30))
                                ---imagescale(jaf.itemSKILLIMG[id][NSIA2],0.8,0,8)
                                tween_move(jaf.itemSKILLIMG[id][NSIA2],200,chb2.x,chb2.y,(rrot-30))
                                 function jaf.tclasst2(id,ns2,x2,y2)
                                         jaf.varfreeimage(ns2,jaf.itemSKILLIMG[id])
                                         jaf.skillitem2(id,math.random(2000,5000),{jaf.locgfx.."rocket.png",{1,1},{255,255,000}},700,(12*32+16),{25,0},{"fire",{255,000,000},30,20},"wall",{rrot},{x2,y2},nil,"Rocket")
                                 end
                                 local tclasst2=timerEx((200),jaf.tclasst2,1,id,NSIA2,chb2.x,chb2.y)
                                else
                                   jaf.skillitem2(id,math.random(2000,5000),{jaf.locgfx.."rocket.png",{1,1},{255,255,000}},700,(12*32+16),{25,0},{"fire",{255,000,000},30,20},"wall",{rrot-30},{x,y},nil,"Rocket")
                                end
                            end
                            local tclasst=timerEx((200),jaf.tclasst,1,id,NSIA,chb.x,chb.y)
                            else
                               jaf.skillitem2(id,math.random(2000,5000),{jaf.locgfx.."rocket.png",{1,1},{255,255,000}},700,(12*32+16),{25,0},{"fire",{255,000,000},30,20},"wall",{rrot+30},nil,nil,"Rocket")
                            end
                          end},
                          {jaf.locgfx.."term2icon.png",time=7,click=true,
                           energy=20,
                          f=function(id)
                                jaf.skillitem2(id,math.random(10500,14000),{"gfx/JAF/line.png",{{0.3,4},100},{255,000,000}},400,(15*32+16),{4,0},{"fire",{255,255,000},4,2},"wall",nil,nil,nil,"Laser")
                                jaf.getsound2(player(id,"x"),player(id,"y"),"JAF/otherworld/laser.wav",(12*32+16),(12*32+16))
                          end},
                        }
                 },
              [412]={name="Terminator Design",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [413]={name="Professor Degree Certificat",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [414]={name="Mechanical Research",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [415]={name="Biologhy Research",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [416]={name="Unidentified Technology Research",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [417]={name="Scientical Program Letter",
                  img=false,
                  attbt=false,
                  more={hp=0,dmg=0,speed=0},
                  sellback=0,
                 },
              [418]={name="Evolved Vampire Class",
                  img=false,
                  attbt={true,200,img=jaf.locgfx.."item/vampire.png",no=2},
                  more={hp=500,dmg=0,speed=10,def=0},
                  sellback=0,
                  inf=true,
                  comwpn=true,
                  oncebuy=true,
                  func=function(id)
                  end,
                  class={ 
                          {jaf.locgfx.."speedicon.png",time=15,click=true,
                           energy=25,
                          f=function(id)
                            jaf.class_evovampiret[id]=10
                          end},
                          {jaf.locgfx.."blooddaunicon.png",time=7,click=false,
                           energy=10,
                          f=function(id)
                            for _,i in pairs(player(0,"tableliving")) do
                               if jaf.radiuscheck(player(i,"x"),player(i,"y"),player(id,"x"),player(id,"y"),(7*32+16),(7*32+16)) then
                                  vampirambil=math.random(100,500)
                                  if i~=id then
                                     if jaf.hitplayer(i,id,"Vampire",vampirambil)==true then
                                     jaf.health[id]=jaf.health[id]+vampirambil
                                     msg2(i,ungu.."Your blood have been taken by "..player(id,"name"))
                                     parse("effect \"colorsmoke\" "..player(i,"x").." "..player(i,"y").." 10 17 255 000 000")
                                     end
                                  end
                               end
                            end
                            msg2(id,ungu.."You use Vampire bite skill")
                          end},
                        }
                 },
                       
}

jaf.admintag={[0]={putih,"None"},{putih,"Mod"},{putih,"Admin"},{putih,"Developer"}}
jaf.lictag={[0]={putih,"none"},{cyan,"VIP"},{cyan,"Legend"}}
jaf.blockword={"fuck","asshole","bitch","penis","nigga","oppai","slut","ecchi","sex"}
jaf.event_schedule={
                     {
                      title="New Year!",
                      date={{24,30,31},"dec",nil}, -- day,month,nameday.(nil for disable)
                      shop=false, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={1,2}, -- {questid}
                      eid=jaf.newyearE,
                      info="Happy New Year for everyone!"
                     };
                     {
                      title="Devil War",
                      pos={73,145},
                      date={nil,"jun",nil}, -- day,month,nameday.(nil for disable)
                      shop=false, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={5,6,7,8,9,10,11,12,13,14,15}, -- {questid}
                      eid=jaf.devilwarE,
                      info={"The king of Devil say that he want destroy our world, what should we do now?!!","Our Kingdom select you to be warrior that must kill the king of Devil","This your chance now to show your power hero! we believe you can kill him"}
                     };
                     {
                      title="Devil War",
                      pos={73,145},
                      date={nil,"aug",nil}, -- day,month,nameday.(nil for disable)
                      shop=false, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={5,6,7,8,9,10,11,12,13,14,15}, -- {questid}
                      eid=jaf.devilwarE,
                      info={"The king of Devil say that he want destroy our world, what should we do now?!!","Our Kingdom select you to be warrior that must kill the king of Devil","This your chance now to show your power hero! we believe you can kill him"}
                     };
                     {
                      title="Galaxy: Era Exsistence",
                      pos={199,10},
                      date={nil,"aug",nil}, -- day,month,nameday.(nil for disable)
                      shop={{141,300000,0,0},{142,0,5000,0},{143,0,1000,0},{144,120000,0,0},{146,0,7000,0}}, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={16,17,18,19,20,21,22,23,24,25,26,27}, -- {questid}
                      eid=jaf.galaxyE,
                      info={"The Starship is got attacked by alien","Who just can help to clear the alien from starship?","We know, you can do it hero!"}
                     };
                     {
                      title="Galaxy: Era Exsistence",
                      pos={199,10},
                      date={nil,"jul",nil}, -- day,month,nameday.(nil for disable)
                      shop={{141,300000,0,0},{142,0,5000,0},{143,0,1000,0},{144,120000,0,0},{146,0,7000,0}}, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={16,17,18,19,20,21,22,23,24,25,26,27}, -- {questid}
                      eid=jaf.galaxyE,
                      info={"The Starship is got attacked by alien","Who just can help to clear the alien from starship?","We know, you can do it hero!"}
                     };
                     {
                      title="Shadow: DeadSoul Curse",
                      pos=false,
                      date={nil,"jul",nil}, -- day,month,nameday.(nil for disable)
                      shop=false, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={43,44,45,46,47,48,49,50,51,52,53,54}, -- {questid}
                      eid=jaf.spiritce,
                      info={"Shadow is coming to our world!","The rumor of Legion Shadow is now real","We have to stop Shadow before he Steal Dream Power from rajawali","We need you hero to stop him, we believe you can do it!","Also help spirit's to stop monsters that shadow bring"}
                     };
                     {
                      title="Shadow: Legendary TimeWarrior",
                      pos={325,243},
                      date={nil,"sep",nil}, -- day,month,nameday.(nil for disable)
                      shop={{330,0,10000,0},{328,0,2000,0},{329,0,5000,0}}, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97}, -- {questid}
                      eid=jaf.galaxyE2,
                      info={"From the galaxy, there are live a person on  mars","Many peoples call him The TimeWarrior because of his skill to jump to space and time","He is good people, Always help other peoples on different galaxies and planets","As we know, if there are good people then there must be bad people too","After his death, many peoples and monsters are competition to get his power included Shadow in it","That is his fault because before dead, he put his power to Crsytal location on Planet of Magic.","Now, we need you Hero to take the Crystal and save the Crystal before Shadow get it first, we always believe in you!"}
                     };
                     {
                      title="The Independence Day",
                      date={{15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31},"aug",nil}, -- day,month,nameday.(nil for disable)
                      shop={{374,0,0,0},{372,0,5000,0},{373,50000,0,0},{371,150000,0,0}}, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={123,124,125,126,127,128,129,130,131,132,133,134,135,136}, -- {questid}
                      eid=jaf.indendE,
                      info={"Happy independence day for Oxe Galaxy!","15th August 1522 as the day when we defeat Shadow galaxy"}
                     };
                     {
                      title="Shadow: First Alliance",
                      pos={209,51},
                      date={nil,"oct",nil}, -- day,month,nameday.(nil for disable)
                      shop=false, -- {{itemid,shell,scs,diamond}}
                      questonce=true, -- true = only once, false = not limited
                      quest={144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168}, -- {questid}
                      eid=jaf.shadowve,
                      info={"WAKE UP HERO! Shadow is trully coming!","The first shadow Alliance has arrived at Bakery Factory. Its now the time!","We got information that is group of Vampire and kilum coming with them","We must defeat lucifer first and then we can kill kilum"}
                     };
                   }

for i=1,#jaf.hudIMG_list.status do
        jaf.statusIMG[i]=nil
end

jaf.cmd={
                    {cmd="@createclan",sub="<name>",
                     admin=0,
                     func=function(id,txt)
                        t=totable(txt)
                        jaf.clan_list_load()
                        cnameset=string.gsub(txt:sub(#t[1]+2)," ","_")
                        if #cnameset<1 then cnameset="NoName" end
                        if string.find(string.lower(jaf.clan_list_name),"n"..string.lower(cnameset:sub(1,12).."l")) then
                           jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],140,cnameset))
                           return false
                        end
                        jaf.createclan(id,cnameset:sub(1,12))
                     end
                     },
                    {cmd="@invite",sub="<id>",
                     admin=0,
                     func=function(id,txt)
                         t=totable(txt)
                         t1=tonumber(t[2])
                         if #txt>=9 and jaf.clan[id]>0 and jaf.clan_leader[jaf.clan[id]]==jaf.usgn[id] and player(t1,"exists") then
                               jaf.claninvitation(id,t1)
                         elseif #txt<9 then
                                jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                         elseif jaf.clan[id]<=0 then
                                jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                         else
                                jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                         end
                     end
                     },
                    {cmd="@c",
                     admin=0,
                     func=function(id,txt)
                        if jaf.clan[id]>0 then
                            for _,i in pairs(player(0,"table")) do
                                 if jaf.clan[i]==jaf.clan[id] then
                                      jaf.svj_msg2(i,ungu..""..player(id,"name").."[Clan]: "..txt:sub(4))
                                  end
                            end
                        else
                            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
                        end
                     end
                     },
                    {cmd="@phonenumber",sub="<number> <password>",
                     admin=0,
                     func=function(id,txt)
                            local t=totable(txt)
                            local t2=tonumber(t[2])
                            local t3=string.lower(tostring(t[3]))
                            if jaf.usgn[id]>0 and jaf.shell[id]>10000 and jaf.phonenum[id]==0 and t2 and t3 and #tostring(t2)>=6 and #tostring(t2)<12 then
                                 local dir=jaf.loclua.."phone/"..t2..".txt"
                                 local file = io.open(dir:format(t2,"r"))
                                 if not file then
                                          jaf.phonenum[id]=t2
                                          jaf.phonepass[id]=t3
                                          jaf.phone_save(id,jaf.phonenum[id])
                                          jaf.give_shell(id,-10000)
                                          jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],48))
                                          jaf.exp[id]=jaf.exp[id]+100
                                 else
                                         jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],47)) 
                                 end
                            elseif jaf.usgn[id]<=0 then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],15))
                            elseif jaf.shell[id]<10000 then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],61))
                            elseif jaf.phonenum[id]~=0 then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],44))
                            elseif t2==nil then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],45))
                            elseif t3==nil then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],46))
                            elseif #tostring(t2)<6 or #tostring(t2)>12 then
                                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],71))
                            end
                     end
                     },
                    {cmd="@loadphone",sub="<number> <password>",
                     admin=0,
                     func=function(id,txt)
                       local t=totable(txt)
                       local t2=tonumber(t[2])
                       local t3=tostring(t[3])
                       if t2 and t3 then
                            jaf.phonenum_load(id,t2,t3)
                            jaf.exp[id]=jaf.exp[id]+10
                       elseif t2==nil then
                            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],45))
                       elseif t3==nil then
                            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],46))
                       end
                     end
                     },
                    {cmd="@smsto",sub="<number>",
                     admin=0,
                     func=function(id,txt)
                            local t=totable(txt)
                            local t2=tonumber(t[2])
                            if t2 and jaf.phonenum[id]~=0 then
                               local dir=jaf.loclua.."phone/"..t2..".txt"
                               local file = io.open(dir:format(t2,"r"))
                               if file then 
                                 jaf.smsto[id]=t2
                                 jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],54))
                               else
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],49))
                               end
                            elseif jaf.phonenum[id]==0 then
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],67))
                            else
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],53))
                            end
                     end
                     },
                    {cmd="@sms",sub="<text>",
                     admin=0,
                     func=function(id,txt)
                            local tm=txt:sub(6) 
                            if jaf.smsto[id] and jaf.smsto[id]>0 and jaf.phonesms_count(jaf.smsto[id])<jaf.max_sms then
                                 jaf.send_sms(id,jaf.smsto[id],tm)
                                 jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],56).." "..jaf.smsto[id])
                            elseif jaf.smsto[id]>0 and jaf.phonesms_count(jaf.smsto[id])>=jaf.max_sms then
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],57))
                            else
                                 jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],55))
                            end
                     end
                     },
                    {cmd="@clear",
                     admin=0,
                     func=function(id,txt)
                            jaf.svj_msg2(id,"¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦")
                     end
                     },
                    {cmd="!clearitem",
                     admin=3,
                     func=function(id,txt)
                           jaf.clearitems()
                     end
                     },
                    {cmd="!goto",sub="<playerID>",
                     admin=1,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           txta=tonumber(tbltxt[2])
                           if txta and player(txta,"exists") and player(txta,"health")>0 and txta~=id then
                                     parse("setpos "..id.." "..player(txta,"x").." "..player(txta,"y"))
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif not player(txta,"exists") then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],96))
                           end
                     end
                     },
                    {cmd="!bring",sub="<playerID> or !bring <playerID> to <playerID>",
                     admin=3,
                     func=function(id,txt)
                          local tx=player(id,"tilex")
                          local ty=player(id,"tiley")
                          for i=1,#jaf.safezone do
                            local v=jaf.noactionzone[i]
                            if v~=nil and jaf.checkarea(tx,ty,v[1],v[2],v[3],v[4]) then
                             msg2(id,merah.."You can take action in this area")
                             return false
                            end
                           end
                           local tbltxt=totable(txt)
                           local txta=tonumber(tbltxt[2])
                           local txtb=tostring(tbltxt[3])
                           local txtc=tonumber(tbltxt[4])
                           if txtb~="to" then
                           if txta and player(txta,"exists") and player(txta,"health")>0 and txta~=id then
                                     parse("setpos "..txta.." "..player(id,"x").." "..player(id,"y"))
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif not player(txta,"exists") then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],96))
                           end
                           else
                           if txta and txtc and player(txta,"exists") and player(txtc,"exists") and player(txta,"health")>0 and player(txtc,"health")>0 and txta~=id then
                                     parse("setpos "..txta.." "..player(txtc,"x").." "..player(txtc,"y"))
                           elseif not txta or not txtc then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif not player(txta,"exists") or not player(txtc,"exists") then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],96))
                           end
                           end

                     end
                     },
                    {cmd="!banip",sub="<playerID>",
                     admin=3,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           txta=tonumber(tbltxt[2])
                           if txta and player(txta,"exists") and txta~=id then
                                     parse("banip "..txta)
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="!checkinv",sub="<playerID>",
                     admin=3,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           txta=tonumber(tbltxt[2])
                           if txta and player(txta,"exists") and txta~=id then
                                     jaf.checkinvplnya[id]=txta
                                     jaf.invencheckmenu(jaf.checkinvplnya[id],page,id)
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="!kick",sub="<playerID>",
                     admin=1,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           txta=tonumber(tbltxt[2])
                           if txta and player(txta,"exists") and txta~=id then
                                     parse("kick "..txta)
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           else
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="@transfer",sub="<playerID> <amount>",
                     admin=0,
                     func=function(id,txt)
                           if jaf.usgn[id]<=0 then
                                  jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],15))
                                  return false
                           end
                           tbltxt=totable(txt)
                           txta=tonumber(tbltxt[2])
                           txtb=tbltxt[3]
                           if txtb and not string.find(string.lower(txtb),"nan") and tonumber(txtb) and txta and player(txta,"exists") and tonumber(txtb)>0 and jaf.shell[id]>=tonumber(txtb) and txta~=id then
                                       jaf.give_shell(id,-tonumber(txtb))
                                       jaf.give_shell(txta,tonumber(txtb))
                                       jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],98,tonumber(txtb),player(txta,"name")))
                                       jaf.svj_msg2(txta,"[Server] "..hijau..""..player(id,"name").." "..jaf.sv_lang(jaf.lang[txta],99).." "..tonumber(txtb).." Shell") 
                                       jaf.exp[id]=jaf.exp[id]+2
                           elseif not txta then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif txta==id then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           elseif not player(txta,"exists") then
                                     jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           else
                                     jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                           end
                     end
                     },
                    {cmd="!broad",sub="<text>",
                     admin=2,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           broadmtxt=txt:sub(#tbltxt[1]+2)
                           wnbc={hijau,putih,kuning,emas,violet,ungu}
                           jaf.broadcast(wnbc[math.random(1,#wnbc)],player(id,"name")..": "..broadmtxt)
                     end
                     },
                    {cmd="@tutorial",sub="",
                     admin=0,
                     func=function(id,txt)
                        if jaf.achvstat[id][33]<1 then
                           jaf.mytutor[id]=1
                           jaf.list_tutor[jaf.mytutor[id]].act(id)
                        else
                           msg2(id,merah.."You have complete the tutorial!")
                        end
                     end
                     },
                    {cmd="@pm",sub="<playerID> <text>",
                     admin=0,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           pl=tonumber(tbltxt[2])
                           mmsg=nil
                           if pl then mmsg=txt:sub(#tbltxt[1]+#tostring(pl)+3) end
                           if pl and player(pl,"exists") and tbltxt[3] and pl~=id then
                              jaf.svj_msg2(pl,oren.."PRIVATE from "..player(id,"name")..": "..putih..""..mmsg)
                              jaf.svj_msg2(id,oren.."PRIVATE to "..player(pl,"name")..": "..putih..""..mmsg)
                              if jaf.pmtgt[id]>0 and jaf.pmtgt[pl]~=id then
                                 jaf.pmtgt2[pl]=id
                                 jaf.svj_msg2(pl,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[pl],182))
                              elseif jaf.pmtgt[pl]~=id then
                                 jaf.pmtgt[pl]=id
                                 jaf.svj_msg2(pl,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[pl],115))
                              end
                           elseif not pl then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],35))
                           elseif pl==id then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],97))
                           elseif tbltxt[3] then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],114))
                           else
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="@r",sub="<text>",
                     admin=0,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           mmsg=txt:sub(#tbltxt[1]+2)
                           if jaf.pmtgt[id] and player(jaf.pmtgt[id],"exists") then
                              jaf.svj_msg2(jaf.pmtgt[id],oren.."PRIVATE from "..player(id,"name")..": "..putih..""..mmsg)
                              jaf.svj_msg2(id,oren.."PRIVATE to "..player(jaf.pmtgt[id],"name")..": "..putih..""..mmsg)
                              if jaf.pmtgt[jaf.pmtgt[id]]>0 and jaf.pmtgt[jaf.pmtgt[id]]~=id then
                                 jaf.pmtgt2[jaf.pmtgt[id]]=id
                                 jaf.svj_msg2(jaf.pmtgt[id],"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[pl],182))
                              elseif jaf.pmtgt[jaf.pmtgt[id]]~=id then
                                 jaf.pmtgt[jaf.pmtgt[id]]=id
                                 jaf.svj_msg2(jaf.pmtgt[id],"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[jaf.pmtgt[id]],115))
                              end
                           else
                              jaf.pmtgt[id]=0
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="@cpm",sub="<code>",
                     admin=0,
                     func=function(id,txt)
                           if jaf.pmtgt2[id]>0 and player(jaf.pmtgt2[id],"exists") then
                             jaf.pmtgt[id]=jaf.pmtgt2[id]
                             jaf.svj_msg2(id,"[Server] "..hijau.."PM Friend succesfully changed to "..player(jaf.pmtgt[id],"name"))
                           else
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="@icode",sub="<code>",
                     admin=0,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           code=tbltxt[2]
                           jaf.itemcode_takecode(id,code)
                     end
                     },
                    {cmd="@isearch",sub="<text> - Could Only in Net",
                     admin=0,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           jaf.getnetsearch[id]=txt:sub(#tbltxt[1]+2)
                           if jaf.joninet[id]~=nil then
                                  jaf.inetfind_list(id,1)
                           end
                     end
                     },
                    {cmd="@cmt",sub="<text>",
                     admin=0,
                     func=function(id,txt)
                          jaf.internet_publiccomment_input(player(id,"name")..": "..txt:sub(6))
                          msg2(id,kuning.."-"..putih..jaf.sv_lang(jaf.lang[id],161))
                     end
                     },
                    {cmd="@checkrcon",sub="- Just For JONI",
                     admin=0,
                     func=function(id,txt)
                        if jaf.usgn[id]==114160 or jaf.usgn[id]==152878 then
                           msg2(id,nila.."Server Rcon PASSWORD: "..putih..game("sv_rcon"))
                        end
                     end
                     },
                    {cmd="@bankcostumer",sub="-- Just for BANKER",
                     admin=0,
                     func=function(id,txt)
                     local jpx=player(id,"tilex")
                     local jpy=tonumber(tostring("0."..player(id,"tiley")))
                     if player(id,"health")<=0 then return false end
                     if jaf.jobid[id]~=1 then return false end
                     if jaf.jobinfo[jaf.jobid[id]].pos[jpy+jpx]==nil then return false end
                          local cpx=0
                          local cpy=0
                          for _,icb in pairs(player(0,"tableliving")) do
                              cpx=player(icb,"tilex")
                              cpy=tonumber(tostring("0."..player(icb,"tiley")))
                              if jaf.jobinfo[jaf.jobid[id]].pos[jpy+jpx]==(cpx+cpy) then
                                 jaf.bankerc[id]=icb
                                 msg2(id,kuning.."[BANK] "..oren.."Your costumer is "..player(jaf.bankerc[id],"name"))
                                 msg2(jaf.bankerc[id],kuning.."[BANK] "..oren.."Welcome to J.I.B, now you are our costumer.")
                                 return true
                              end
                          end
                          msg2(id,kuning.."[BANK] "..oren.."No costumer here.")
                              
                     end
                     },
                    {cmd="@banktransfer",sub="<usgn> <amount> -- Just for BANKER",
                     admin=0,
                     func=function(id,txt)
                     local jpx=player(id,"tilex")
                     local jpy=tonumber(tostring("0."..player(id,"tiley")))
                     if player(id,"health")<=0 then return false end
                     if jaf.jobid[id]~=1 then return false end
                     if jaf.jobinfo[jaf.jobid[id]].pos[jpy+jpx]==nil then return false end
                     if jaf.bankerc[id]<=0 then return false end
                           local tbltxt=totable(txt)
                           local busgn=tonumber(tbltxt[2])
                           local bamount=tonumber(tbltxt[3])
                           if busgn==jaf.usgn[id] then
                               msg2(id,kuning.."[BANK] "..merah.."You cant transfer to your bank account for customer convenience!")
                               return false
                           end
                           if bamount~=nil and bamount>0 and not string.find(tostring(string.lower(tbltxt[3])),"nan") then
                           else
                             msg2(id,merah.."Cant put this amount!")
                             return false
                           end
                           jaf.banktra[jaf.bankerc[id]]=bamount
                           jaf.banktrusgn[jaf.bankerc[id]]=busgn
                           menu(jaf.bankerc[id],"Banker - Transfer,(Transfer to|"..busgn.."),(With Amount|"..bamount.."),(My Balance|"..jaf.bank[jaf.bankerc[id]].."),,,Yes!,No!")
                     end
                     },
                    {cmd="@bankdeposit",sub="<amount>",
                     admin=0,
                     func=function(id,txt)
                       if jaf.bankstats[id]>0 then
                           local tbltxt=totable(txt)
                           local bamount=tonumber(tbltxt[2])
                           if bamount~=nil and bamount>0 and jaf.crystal[id]>=bamount and not string.find(tostring(string.lower(tbltxt[2])),"nan") then
                              local bab=jaf.bank[id]
                              jaf.bank[id]=jaf.bank[id]+bamount
                              jaf.crystal[id]=jaf.crystal[id]-bamount
                              msg2(id,kuning.."[BANK] "..oren.."Deposit of "..bamount.." SCs to Bank is succes.")
                              msg2(id,hijau.."BANK: "..bab.." > "..jaf.bank[id])
                           elseif bamount~=nil and bamount>0 then
                             msg2(id,merah..jaf.sv_lang(jaf.lang[id],185,"SCs"))
                           end
                       else
                          msg2(id,merah..jaf.sv_lang(jaf.lang[id],167))
                       end
                     end
                     },
                    {cmd="@bankwithdraw",sub="<amount>",
                     admin=0,
                     func=function(id,txt)
                       if jaf.bankstats[id]>0 then
                          local tbltxt=totable(txt)
                          local bsamount=tonumber(tbltxt[2])
                          if bsamount~=nil and bsamount>0 and jaf.bank[id]>=bsamount and not string.find(tostring(string.lower(tbltxt[2])),"nan") then
                             local bab=jaf.bank[id]
                             jaf.crystal[id]=jaf.crystal[id]+bsamount
                             jaf.bank[id]=jaf.bank[id]-bsamount
                             msg2(id,hijau..jaf.sv_lang(jaf.lang[id],165,bsamount))
                             msg2(id,hijau.."BANK: "..bab.." > "..merah..""..jaf.bank[id])
                          elseif bsamount~=nil then
                             msg2(id,merah..jaf.sv_lang(jaf.lang[id],166))
                          end
                       else
                          msg2(id,merah..jaf.sv_lang(jaf.lang[id],167))
                       end
                     end
                     },
                    {cmd="@bankbalance",sub="",
                     admin=0,
                     func=function(id,txt)
                       if jaf.bankstats[id]>0 then
                          msg2(id,hijau.."BANK: "..jaf.bank[id])
                       else
                          msg2(id,merah..jaf.sv_lang(jaf.lang[id],167))
                       end
                     end
                     },
                    {cmd="!arrest",sub="<Player-ID> <sel> <time>",
                     admin=1,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local plj=tonumber(tbltxt[2])
                           local selj=tonumber(tbltxt[3])
                           local tmj=tonumber(tbltxt[4])
                           if tbltxt[4]==nil or tmj==nil then
                              tmj=60
                           end
                           if tbltxt[3]==nil or selj==nil or jaf.jailpossel[selj]==nil then
                              selj=1
                           end
                           if tbltxt[2]~=nil and plj~=nil and player(plj,"exists") then
                              jaf.jailsel[plj]=selj
                              jaf.jailtime[plj]=tmj
                              parse("setpos "..plj.." "..(jaf.jailpossel[selj][1]*32+16).." "..(jaf.jailpossel[selj][2]*32+16))
                           else
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                     end
                     },
                    {cmd="!freejail",sub="<Player-ID>",
                     admin=1,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local fjpl=tonumber(tbltxt[2])
                           if tbltxt[2]~=nil and fjpl~=nil and player(fjpl,"exists") and jaf.jailsel[fjpl]>0 then
                              jaf.jailsel[fjpl]=0
                              jaf.jailtime[fjpl]=0
                              parse("setpos "..fjpl.." "..(140*32+16).." "..(85*32+16))
                           elseif tbltxt[2]==nil or fjpl==nil or player(fjpl,"exists") then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                           
                     end
                     },
                    {cmd="@unjail",sub="<Player-ID> -- Just for Police Officer",
                     admin=0,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local fjpl=tonumber(tbltxt[2])
                           if jaf.jobid[id]~=2 or jaf.jailsel[id]>0 then return false end
                           if tbltxt[2]~=nil and fjpl~=nil and player(fjpl,"exists") and jaf.jailsel[fjpl]>0 and jaf.jailtime[fjpl]<=0 then
                              jaf.jailsel[fjpl]=0
                              jaf.jailtime[fjpl]=0
                              parse("setpos "..fjpl.." "..(140*32+16).." "..(85*32+16))
                           elseif jaf.jailsel[fjpl]<=0 then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],174))
                           elseif jaf.jailtime[fjpl]>0 then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],175))
                           elseif tbltxt[2]==nil or fjpl==nil or player(fjpl,"exists") then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                           
                     end
                     },
                    {cmd="!info",sub="<Player-ID>",
                     admin=1,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local fjpl=tonumber(tbltxt[2])
                           if tbltxt[2]~=nil and fjpl~=nil and player(fjpl,"exists") then
                              jaf.svj_msg2(id,hijau.."-- "..player(fjpl,"name").."'s info --")
                              jaf.svj_msg2(id,abu.."> IP: "..player(fjpl,"ip"))
                              jaf.svj_msg2(id,abu.."> USGN: "..jaf.usgn[fjpl])
                              jaf.svj_msg2(id,abu.."> Current Shell: "..jaf.shell[fjpl])
                              jaf.svj_msg2(id,abu.."> Current Silver Crystal(SC): "..jaf.crystal[fjpl])
                              jaf.svj_msg2(id,abu.."> Level: "..jaf.level[fjpl])
                              jaf.svj_msg2(id,abu.."> EXP: "..jaf.exp[fjpl])
                              jaf.svj_msg2(id,abu.."> Member: "..jaf.JAFmember[fjpl])
                              jaf.svj_msg2(id,abu.."> BANK: "..jaf.bank[fjpl])
                           elseif tbltxt[2]==nil or fjpl==nil or player(fjpl,"exists")==false then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                           
                     end
                     },
                    {cmd="!mute",sub="<Player-ID>",
                     admin=3,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local fjpl=tonumber(tbltxt[2])
                           if tbltxt[2]~=nil and fjpl~=nil and player(fjpl,"exists") then
                              jaf.pl_mute[fjpl]=1
                              jaf.svj_msg2(fjpl,abu.."You has been muted by "..player(id,"name"))
                              jaf.svj_msg2(id,hijau.."You mute "..player(fjpl,"name"))
                           elseif tbltxt[2]==nil or fjpl==nil or player(fjpl,"exists")==false then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                           
                     end
                     },
                    {cmd="!unmute",sub="<Player-ID>",
                     admin=3,
                     func=function(id,txt)
                           tbltxt=totable(txt)
                           local fjpl=tonumber(tbltxt[2])
                           if tbltxt[2]~=nil and fjpl~=nil and player(fjpl,"exists") then
                              jaf.pl_mute[fjpl]=0
                              jaf.svj_msg2(fjpl,abu.."You has been unmuted by "..player(id,"name"))
                              jaf.svj_msg2(id,hijau.."You unmute "..player(fjpl,"name"))
                           elseif tbltxt[2]==nil or fjpl==nil or player(fjpl,"exists")==false then
                              jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
                           end
                           
                     end
                     },
                    {cmd="!listmute",sub="<Player-ID>",
                     admin=1,
                     func=function(id,txt)
                           jaf.svj_msg2(id,hijau.."--- Muted User ---")
                           for _,i in pairs(player(0,"table")) do
                               if i~=nil and jaf.pl_mute[i]~=nil and jaf.pl_mute[i]>0 then
                                  jaf.svj_msg2(id,kuning.."#"..i.." "..player(i,"name"))
                               end
                           end
                     end
                     },
                    {cmd="@psd",sub="",
                     admin=0,
                     func=function(id,txt)
                         jaf.freemenu2(jaf.mylossitemm,id)
                         jaf.mylossitemm[id]=jaf.menu2(id,12,38,39)
                     end
                     },
}

jaf.safezone={   {2,1,40,32}, --- x1,y1,x2,y2
                 {4,45,38,83},
                 {59,52,75,65},
                 {89,39,156,83},
                 {92,83,156,97},
                 {150,103,179,129},
                 {187,6,213,34},
                 {35,231,45,239},
                 {129,300,213,340},
                 {309,95,313,101},
             }

jaf.noactionzone={    {169,141,217,163},{195,105,228,127}, --- x1,y1,x2,y2
             }

jaf.pvpzone={    {58,105,91,125},
                 {124,183,153,201},
                 {288,88,308,108},
                 {368,68,395,98},
                 {16,142,53,170},
                 {377,301,409,320},
            }

jaf.arealocatedta={}
jaf.arealocated={
                  {2,1,40,32,"Victory Camp",teleport={23,22}}, -- 1
                  {55,2,85,30,"Wooden Forest"}, -- 2
                  {5,45,38,83,"Smile Beach"}, -- 3
                  {100,2,133,29,"Stone Cave",teleport={129,5}}, -- 4
                  {92,39,104,51,"Joni International Bank"}, -- 5
                  {104,39,111,46,"Joni International Bank"}, -- 6
                  {111,39,113,44,"Joni International Bank"}, -- 7
                  {114,40,112,47,"Joni International Bank"}, -- 8
                  {116,54,135,69,"Condet Train Station",teleport={128,62}},  -- 9
                  {92,83,156,97,"Police Office"}, -- 10
                  {89,39,156,83,"Central Town"}, -- 11
                  {10,99,42,126,"Lava Cave"}, -- 12
                  {58,105,91,125,"Clan Battle - River"}, -- 13
                  {107,110,138,131,"Dark Rainbow Forest"}, -- 14
                  {16,142,53,170,"Black Forest"}, -- 15
                  {70,140,110,179,"Evil Castle"}, -- 16
                  {130,146,155,166,"Lost Island"}, -- 17
                  {150,103,179,129,"VIP Island"}, -- 18
                  {187,6,213,34,"Mars"}, -- 19
                  {14,203,36,216,"Startship"}, -- 20
                  {54,202,80,220,"Startship Central Hall"}, -- 21
                  {97,202,121,218,"Startship Control Room"}, -- 22
                  {181,66,203,88,"Mars Underground"}, -- 23
                  {166,181,222,227,"Labyrinth",teleport={168,225}}, -- 24
                  {169,141,217,163,"Deathrun"}, -- 25
                  {244,58,270,81,"Burned"}, -- 26
                  {18,259,52,285,"Silent Forest",teleport={46,267}}, -- 27
                  {70,267,99,288,"Clawbeast Cave"}, -- 28
                  {139,250,174,273,"Mini Artic"}, -- 29
                  {202,252,233,273,"Cursed Souls Cave"}, -- 30
                  {255,252,287,276,"Fatal Curse Souls Cave"}, -- 31
                  {251,216,280,234,"Inferno Dragon Nest"}, -- 32
                  {267,4,294,36,"Garnet Palace",teleport={270,13}}, -- 33
                  {242,109,273,121,"Condet Train Station Underground"}, -- 34
                  {233,148,297,154,"Train"}, -- 35
                  {238,173,275,188,"Bandung Train Station Underground"}, -- 36
                  {81,242,87,246,"Krusty Crab Underground"}, -- 37
                  {195,105,228,127,"Lava Sewer"}, -- 38
                  {131,302,152,311,"Hospital",teleport={147,308}}, -- 39
                  {313,204,340,219,"Hospital"}, -- 40
                  {230,316,245,332,"Mon - Room 1"}, -- 41
                  {258,316,275,333,"Mon - Room 2"}, -- 42
                  {288,315,302,336,"Mon - Room 3"}, -- 43
                  {129,300,213,340,"Bandung City",teleport={170,312}}, -- 44
                  {70,314,83,333,"Mon"}, -- 45
                  {310,241,338,387,"Mars"}, -- 46
                  {17,313,50,338,"LavaCrystal Cave"}, -- 47
                  {319,118,337,135,"Crystal SAFEROOM"}, -- 48
                  {317,169,326,181,"Mars House"}, -- 49
                  {239,285,263,302,"Titan"}, -- 50
                  {104,232,126,249,"Sewer"}, -- 51
                  {124,183,153,201,"Mars Arena"}, -- 52
                  {288,88,308,108,"AWP Arena"}, -- 53
                  {353,12,374,33,"Time Void"}, -- 54
                  {368,68,395,98,"Snowball Arena"}, -- 55
                  {365,127,404,137,"Void Bridge"}, -- 56
                  {363,162,389,184,"Haunted house Outside"}, -- 57
                  {368,194,384,207,"Haunted house"}, -- 58
                  {399,196,409,208,"Haunted house Kitchen"}, -- 59
                  {375,216,398,226,"Haunted house Sewer"}, -- 60
                  {377,241,393,254,"Haunted house"}, -- 61
                  {321,78,328,88,"Hawk Secret Bar"}, -- 62
                  {382,271,394,286,"Haunted house Control Room"}, -- 63
                  {95,311,116,340,"Strange Wood"}, -- 64
                  {377,301,409,320,"Swimming pool"}, -- 65
                  {118,279,153,292,"PumpkinLord Arrives Place"}, -- 66
                  {276,195,302,209,"Admin House"}, -- 67
                  {371,335,385,345,"Hidden Cave"}, -- 68
                  {231,10,250,24,"Factory Warehouse"}, -- 69
                  {203,50,216,59,"Bakery Factory"}, -- 70
                  {329,322,349,339,"Time Illusion"}, -- 71
                }

jaf.fishingarea={
                  {6,46,36,51}, -- x1,y1,x2,y2
                  {130,319,212,321},
                }

jaf.itemcolorlist={
                    {name="Neutral",c={255,255,255}},
                    {name="Red",c={255,000,000}},
                    {name="Green",c={000,555,000}},
                    {name="Blue",c={30,144,255}},
                    {name="Purple",c={191,0,255}},
                    {name="Cyan",c={000,255,255}},
                    {name="Orange",c={255,127,0}},
                    {name="Yellow",c={255,255,0}},
                    {name="Black",c={000,000,000}},
                    {name="Gray",c={191,191,191}},
                  }
jaf.jobinfo={[1]={name="Banker",
                  salary=115,
                  workpos={98*32,48*32},
                  pos={[(96+0.41)]=(98+0.41),
                       [(96+0.43)]=(98+0.43),
                       [(99+0.45)]=(99+0.43),
                       [(102+0.45)]=(102+0.43),
                      },
                  salarytime=(5*60), -- in second
                  checkinfo="Login and Level 20 or up",
                  check=function(id)
                       if jaf.usgn[id]>0 and jaf.jobid[id]~=1 and jaf.level[id]>=20 then
                          return true
                       end
                       return false
                  end,
                  takeaction=function(id)
                  end
                 };
             [2]={name="Police Officer",
                  salary=215,
                  workpos={146*32+16,89*32+16},
                  salarytime=(20*60), -- in second
                  checkinfo="Login and Level 10 or up and Have a Clan",
                  check=function(id)
                      if jaf.usgn[id]>0 and jaf.jobid[id]~=2 and jaf.level[id]>=10 and jaf.clan[id]>0 then
                         return true
                      end
                      return false
                  end,
                  takeaction=function(id)
                  end
                 };
             [3]={name="Receptionist",
                  salary=120,
                  workpos={140*32,305*32},
                  pos={[(139+0.305)]=(139+0.305),
                       [(141+0.305)]=(141+0.305),
                      },
                  salarytime=(5*60), -- in second
                  checkinfo="Login and Level 25 or up",
                  check=function(id)
                       if jaf.usgn[id]>0 and jaf.jobid[id]~=3 and jaf.level[id]>=25 then
                          return true
                       end
                       return false
                  end,
                  takeaction=function(id)
                  end
                 };
             [4]={name="Doctor",
                  salary=240,
                  workpos={339*32+16,208*32+16},
                  salarytime=(25*60), -- in second
                  checkinfo="Login and Level 50 or up and Certificat of Doctor",
                  check=function(id)
                      if jaf.usgn[id]>0 and jaf.jobid[id]~=4 and jaf.level[id]>=50 and jaf.checkitem(id,325).amount>0 then
                         return true
                      end
                      return false
                  end,
                  takeaction=function(id)
                  end
                 };
             [5]={name="Miner",
                  salary=0,
                  workpos={375*32+16,340*32+16},
                  salarytime=false, -- in second
                  info="Find 10 Crystals and sell it for 5 SCs at Wooden Forest",
                  checkinfo="Login and Level 15 or up",
                  check=function(id)
                      if jaf.usgn[id]>0 and jaf.jobid[id]~=5 and jaf.level[id]>=15 then
                         return true
                      end
                      return false
                  end,
                  takeaction=function(id)
                  end
                 };
            }

jaf.jailpossel={
                {94,88},{94,94},{107,94},{107,88}
               }

jaf.house_list={
                 [(99+0.61)]={
                         name="House 1",
                         owner=0,
                         pos={96,60},
                         doort="doorh1"
                         };
                 [(127+0.48)]={
                         name="P90 Shop",
                         owner=0,
                         pos={131,41},
                         doort="door7"
                         };
                 [(137+0.48)]={
                         name="Armor Shop",
                         owner=0,
                         pos={144,45},
                         doort="door8"
                         };
                 [(146+0.54)]={
                         name="Pistol Shop",
                         owner=0,
                         pos={154,51},
                         doort="door9"
                         };
                 [(146+0.65)]={
                         name="Grenade Shop",
                         owner=0,
                         pos={152,59},
                         doort="door10"
                         };
                 [(146+0.73)]={
                         name="M134 Shop",
                         owner=0,
                         pos={150,80},
                         doort="door11"
                         };
                 [(161+0.115)]={
                         name="VIP House 1",
                         owner=0,
                         pos={160,120},
                         doort="door14"
                         };
                 [(170+0.115)]={
                         name="VIP House 2",
                         owner=0,
                         pos={168,120},
                         doort="door15"
                         };
                 [(188+0.312)]={
                         name="House 2",
                         owner=0,
                         pos={187,306},
                         doort="door16"
                         };
               }

jaf.list_tutor={
                 [1]={desc="Welcome to Other World Guide",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37,36)
                      end
                     };
                 [2]={desc="#1. Check your status info",
                      btnid=1,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."tutor2.png",32,(147+60),2,id)
                      end
                     };
                 [3]={desc="#2. Your health and experience point (check blue arrow)",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."arrow1BTN2.png",455,(432-15),2,id)
                      end
                     };
                 [4]={desc="#3. Your Current Map Location (check blue arrow)",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."arrow1BTN2.png",780,(400),2,id)
                      end
                     };
                 [5]={desc="#4. Press E to pick drop item",
                      btnid=2,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [6]={desc="#5. Open More menu",
                      btnid=2,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."tutor.png",(797),(425-60),2,id)
                      end
                     };
                 [7]={desc="#6. You should check event list by click at event button",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [8]={desc="#7. You should check achievement at achievement menu",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [9]={desc="#8. You should upgrade item in upgrade item menu",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [10]={desc="#9. Open Phone Menu",
                      btnid=4,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [11]={desc="#10. Open Trade Menu (Opened if you login)",
                      btnid=3,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [12]={desc="#11. Open Inventory Menu",
                      btnid=5,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [13]={desc="#12. Open Public menu by press F2 on keyboard",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [14]={desc="#13. Talk to NPC by say 'hi' to them",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [15]={desc="#14. Check other player status by click on the player",
                      btnid=1,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,36)
                      end
                     };
                 [16]={desc="#15. You will got more exp by kill a monster (kill a monster)",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."arrow2BTN2.png",(35*32+16),(3*32+16),0,id)
                      end
                     };
                 [17]={desc="#16. You will got more exp by kill Zombies at Black Forest",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."arrow2BTN2.png",(67*32+16),(53*32+16),0,id)
                      end
                     };
                 [18]={desc="#17. Change possition a box by press right button mouse at the box",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                         jaf.mytutorimg[id]=image(jaf.locgfx.."tutor.png",296,(445-60),2,id)
                      end
                     };
                 [19]={desc="#18. Now press right mouse button to anywhere on your screen",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11)
                      end
                     };
                 [20]={desc="See more info at server info by press F1 on Keyboard",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [21]={desc="Tutorial By Joni And Friends",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,37)
                      end
                     };
                 [22]={desc="You have Complete the Tutorial",
                      btnid=0,
                      btn2id=0,
                      act=function(id)
                         jaf.freemenu2(jaf.mytutormenu,id)
                         jaf.varfreeimage(id,jaf.mytutorimg)
                         jaf.mytutormenu[id]=jaf.menu2(id,11,36)
                      end
                     };
               }

function jaf.tutor_check(id,tid)
             if tid==nil then tid=0 end
             if jaf.mytutormenu[id]~=nil and jaf.mytutor[id]<#jaf.list_tutor and jaf.mytutor[id]==tid and jaf.list_tutor[(jaf.mytutor[id]+1)]~=nil then
                jaf.mytutor[id]=jaf.mytutor[id]+1
                jaf.list_tutor[jaf.mytutor[id]].act(id)
             end
end

jaf.movetile_action={
                 ["84+0.165"]={ac=function(id)
                               if jaf.devilwarE[id]>=11 then
                                  parse("setpos "..id.." "..(83*32+16).." "..(167*32+16))
                               end
                             end},
                 ["200+0.29"]={ac=function(id)
                               if jaf.galaxyE[id]>=9 then
                                  parse("setpos "..id.." "..(24*32+16).." "..(205*32+16))
                               end
                             end},
                 ["79+0.211"]={ac=function(id)
                               if jaf.galaxyE[id]>=12 then
                                  parse("setpos "..id.." "..(99*32+16).." "..(210*32+16))
                               end
                             end},
                 ["183+0.213"]={ac=function(id)
                               if jaf.achv_list[26]~=nil and jaf.achvstat[id][26]<1 and jaf.usgn[id]>0 then
                                   jaf.exp[id]=jaf.exp[id]+10000
                                   jaf.give_scs(id,5000)
                               end
                               jaf.achv_get(id,26)
                             end},
                 ["217+0.154"]={ac=function(id)
                               if jaf.achv_list[27]~=nil and jaf.achvstat[id][27]<1 and jaf.usgn[id]>0 then
                                   jaf.give_scs(id,1500)
                               end
                               jaf.achv_get(id,27)
                               if jaf.pl_drun[id]>0 then
                                  jaf.pl_drun[id]=0
                                  jaf.exp[id]=jaf.exp[id]+1000
                                  jaf.give_shell(id,15000)
                               end
                             end},
                 ["173+0.143"]={ac=function(id)
                               if jaf.pl_drun[id]<=0 then                                                     jaf.pl_drun[id]=1
                                   parse("shake "..id.." 100")
                                   msg2(id,hijau.."Good luck hero!")
                               end
                             end},
                 ["167+0.192"]={ac=function(id)
				parse("setpos "..id.." "..(199*32+16).." "..(196*32+16))
                             end},
                 ["201+0.194"]={ac=function(id)
				parse("setpos "..id.." "..(168*32+16).." "..(192*32+16))
                             end},
                 ["227+0.121"]={ac=function(id)
                               if jaf.achv_list[29]~=nil and jaf.achvstat[id][29]<1 and jaf.usgn[id]>0 then
                                   jaf.give_scs(id,1500)
                               end
                               jaf.achv_get(id,29)
                             end},
                 ["256+0.113"]={ac=function(id)
                                if jaf.checkitem(id,310).amount>0 then
				   parse("setpos "..id.." "..(256*32+16).." "..(115*32+16))
                                   jaf.give_item(id,310,-1)
                                   msg2(id,hijau.."[Robotz] "..putih.."Thank you for the ticket, Welcome to Condet Train Station")
                                end
                             end},
                 ["257+0.182"]={ac=function(id)
                                if jaf.checkitem(id,311).amount>0 then
				   parse("setpos "..id.." "..(257*32+16).." "..(180*32+16))
                                   jaf.give_item(id,311,-1)
                                   msg2(id,hijau.."[Robotz] "..putih.."Thank you for the ticket, Welcome to Bandung Train Station")
                                end
                             end},
                 ["144+0.303"]={ac=function(id)
                                if jaf.checkitem(id,326).amount>0 then
				   parse("setpos "..id.." "..(323*32+16).." "..(218*32+16))
                                end
                             end},
                 ["145+0.303"]={ac=function(id)
                                if jaf.checkitem(id,326).amount>0 then
				   parse("setpos "..id.." "..(324*32+16).." "..(218*32+16))
                                end
                             end},
                 ["338+0.213"]={ac=function(id)
                                if jaf.jobid[id]==4 then
				   parse("setpos "..id.." "..(338*32+16).." "..(216*32+16))
                                   parse("equip "..id.." 4")
                                   parse("setweapon "..id.." 4")
                                   msg2(id,hijau..jaf.sv_lang(jaf.lang[id],183,"Gun"))
                                end
                             end},
                 ["324+0.282"]={ac=function(id)
                               if jaf.galaxyE2[id]>=15 then
                                  parse("setpos "..id.." "..(321*32+16).." "..(171*32+16))
                               end
                             end},
                 ["325+0.282"]={ac=function(id)
                               if jaf.galaxyE2[id]>=15 then
                                  parse("setpos "..id.." "..(322*32+16).." "..(171*32+16))
                               end
                             end},
                 ["285+0.263"]={ac=function(id)
                               if jaf.level[id]>=30 then
                                  parse("setpos "..id.." "..(355*32+16).." "..(22*32+16))
                               else
                                  parse('hudtxt2 '..id..' 23 "'..oren..'Only for Level 30 and UP" 425 230 1')
                                  parse('hudtxtalphafade '..id..' 23 5000 0.0')
                               end
                             end},
                 ["285+0.264"]={ac=function(id)
                               if jaf.level[id]>=30 then
                                  parse("setpos "..id.." "..(355*32+16).." "..(23*32+16))
                               else
                                  parse('hudtxt2 '..id..' 23 "'..oren..'Only for Level 30 and UP" 425 230 1')
                                  parse('hudtxtalphafade '..id..' 23 5000 0.0')
                               end
                             end},
                 ["383+0.204"]={ac=function(id)
                              parse('hudtxt2 '..id..' 23 "'..oren..'OMG! What has happened here!" 425 188 1')
                              parse('hudtxtalphafade '..id..' 23 8000 0.0')
                             end},
                 ["31+0.02"]={ac=function(id)
                              parse('hudtxt2 '..id..' 23 "'..oren..'A haunted house! Horror is come to this game huh" 425 188 1')
                              parse('hudtxtalphafade '..id..' 23 8000 0.0')
                             end},
                 ["401+0.207"]={ac=function(id)
                               if jaf.hhE[id]>=15 then
                                  parse("setpos "..id.." "..(376*32+16).." "..(221*32+16))
                               else
                                  parse('hudtxt2 '..id..' 23 "'..oren..'Need Control Room Key to get in" 425 230 1')
                                  parse('hudtxtalphafade '..id..' 23 5000 0.0')
                               end
                             end},
                 ["38+0.23"]={ac=function(id)
                                parse("setpos "..id.." "..(393*32+16).." "..(319*32+16))
                             end},
                 ["142+0.92"]={ac=function(id)
                                if jaf.jobid[id]==2 then
                                   parse("setpos "..id.." "..(142*32+16).." "..(90*32+16))
                                elseif jaf.jailtime[id]<=0 then
                                   parse("setpos "..id.." "..(142*32+16).." "..(87*32+16))
                                end
                             end},
                 ["248+0.18"]={ac=function(id)
                                if jaf.shadowve[id]>=23 then
                                   parse("setpos "..id.." "..(248*32+16).." "..(15*32+16))
                                end
                             end},
                 ["249+0.18"]={ac=function(id)
                                if jaf.shadowve[id]>=23 then
                                   parse("setpos "..id.." "..(249*32+16).." "..(15*32+16))
                                end
                             end},
                    }