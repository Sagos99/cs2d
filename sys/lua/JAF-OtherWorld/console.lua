jaf.sv_cmtname="Server" --- name used on cmt rcon command 

addhook("parse","jaf.parse")
function jaf.parse(txt)
         local tcmd=totable(txt)
         local cmd=tostring(tcmd[1])
         local cmda=tonumber(tcmd[2])
         local cmdb=tonumber(tcmd[3])
         local cmdc=tonumber(tcmd[4])
         if cmd=="load" then
                 if player(cmda,"exists") and cmdb~=jaf.usgn[cmda] then
                             local dir=jaf.loclua.."Users/%s.txt"
                             local file = io.open(dir:format(cmdb, "r"))
                             if file then
                                     jaf.usgn[cmda]=cmdb
                                     jaf.load(cmda,jaf.usgn[cmda])
                                     jaf.svj_msg2(cmda,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[cmda],26))
                                     print(hijau2.."Load data success! system found the data!")
                             else
                                     print(merah.."ERROR: Load data failed! system couldnt found the data!")
                             end
                 end
                 return 2
         elseif cmd=="restartserver" then
                  parse("changemap "..game("sv_map"))
                  print(hijau.."Server is restarted now!")
                  return 2
         elseif cmd=="give_shell" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.give_shell(cmda,cmdb)
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."You got "..cmdb.." shell from server")
                                 print(hijau2.."Server give "..cmdb.." shell to "..player(cmda,"name"))
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the shell nominal")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="set_shell" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.shell[cmda]=cmdb
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."Server set your shell to "..cmdb.."")
                                 print(hijau2.."Server set "..player(cmda,"name").." shell to "..cmdb)
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the shell nominal")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="set_level" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.exp[cmda]=0
                                 jaf.level[cmda]=cmdb
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."Server set your level to "..cmdb.."")
                                 print(hijau2.."Server set "..player(cmda,"name").." level to "..cmdb)
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the level")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="clearitem" then
                  jaf.clearitems()
                  print(hijau.."Successfully clear item on map!")
                  return 2
         elseif cmd=="giveitem" then
                  if cmda and player(cmda,"exists") and tcmd[3] and string.lower(tcmd[3])=="all" then
                              tgit=1
                              if tonumber(cmdc) then
                                 tgit=cmdc
                              end
                              for _,i in pairs(jaf.list_items) do
                                 jaf.give_item(cmda,_,tgit)
                              end
                              print(hijau2.."Server has give "..tgit.." item(s) for every items to "..player(cmda,"name"))
                              jaf.svj_msg2(cmda,"[System] "..hijau.."Server given you "..tgit.." item(s) for every items")
                  elseif cmda and player(cmda,"exists") and jaf.list_items[cmdb] then
                              tgit=1
                              if tonumber(cmdc) then
                                 tgit=cmdc
                              end
                              jaf.give_item(cmda,cmdb,tgit)
                              print(hijau2.."Server has give "..tgit.." "..jaf.list_items[cmdb].name.." to "..player(cmda,"name"))
                              jaf.svj_msg2(cmda,"[System] "..hijau.."Server given you "..tgit.." "..jaf.list_items[cmdb].name.."(s)")
                  elseif not cmda then
                              print(merah.."ERROR: Please put the playerID")
                  elseif not player(cmda,"exists") then
                              print(merah.."ERROR: Player doesnt exists!")
                  else
                              print(merah.."ERROR: The item is not exists in item list!")
                  end
                  return 2
         elseif cmd=="inv_plus" then
                  if cmda and player(cmda,"exists") and cmdb then
                              jaf.invplus[cmda]=cmdb
                              print(hijau2.."Server has set inventory max to "..cmdb.." to "..player(cmda,"name"))
                              jaf.svj_msg2(cmda,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[cmda],102).." "..(jaf.inventory_max_default+cmdb))
                  elseif not cmda then
                              print(merah.."ERROR: Please put the playerID")
                  elseif not cmdb then
                              print(merah.."ERROR: Please put amount of inventory!")
                  else
                              print(merah.."ERROR: Player doesnt exists!")
                  end
                  return 2
         elseif cmd=="news" then
                  broadnews=txt:sub(#cmd+2)
                  jaf.broadcast(kuning,"[News] "..putih..""..broadnews)
                  return 2
         elseif cmd=="give_scs" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.crystal[cmda]=jaf.crystal[cmda]+cmdb
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."You got "..cmdb.." SCs from server")
                                 print(hijau2.."Server give "..cmdb.." SCs to "..player(cmda,"name"))
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the shell nominal")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="set_scs" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.crystal[cmda]=cmdb
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."Server set your SCs to "..cmdb.."")
                                 print(hijau2.."Server set "..player(cmda,"name").." SCs to "..cmdb)
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the shell nominal")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="item_code" then
                  ic_c=tcmd[2]
                  ic_u=tonumber(tcmd[3])
                  ic_s=tonumber(tcmd[4])
                  ic_scs=tonumber(tcmd[5])
                  ic_iid=tonumber(tcmd[6])
                  ic_ia=tonumber(tcmd[7])
                  if ic_c==nil then
                     print(merah.."ERROR: <code> <usgn> <shell> <SCs> <itemid> <item-amount>, its not valued (nill)")
                  else
                     jaf.itemcode_create(ic_c,ic_u,ic_s,ic_scs,ic_iid,ic_ia)
                  end
                  return 2
         elseif cmd=="check_active_staff" then
                  tm=(3600*24)
                  if cmda then tm=(cmda*3600) end --- in hours
                  jaf.stafftimecheck(tm)
                  return 2
        elseif cmd=="maintenance_on" then
                  jaf.sv_maintenance=true
                  print(hijau.."Server is now maintenance!")
                  return 2
        elseif cmd=="maintenance_off" then
                  jaf.sv_maintenance=false
                  print(hijau.."Server is now un-maintenance!")
                  return 2
        elseif cmd=="give_exp" then
                  if cmda and cmdb and player(cmda,"exists") then
                                 jaf.exp[cmda]=jaf.exp[cmda]+cmdb
                                 jaf.svj_msg2(cmda,"[System] "..hijau.."Server give "..cmdb.." exp to you")
                                 print(hijau2.."Server set "..player(cmda,"name").." exp+"..cmdb)
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  elseif cmdb==nil then
                                 print(merah.."ERROR: Please put the level")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="infopl" then
                  if cmda and player(cmda,"exists") then
                                 print(hijau.." -- "..player(cmda,"name").." info -- ")
                                 print(abu.."IP: "..player(cmda,"ip"))
                                 print(abu.."USGN: "..jaf.usgn[cmda])
                                 print(abu.."Level: "..jaf.level[cmda].." ("..jaf.exp[cmda].."/"..(jaf.level[cmda]*jaf.exp_perlevel)..")")
                                 print(abu.."Staff Level: "..jaf.admin[cmda])
                                 if jaf.lictag[jaf.userlicense[cmda]]~=nil then
                                    print(abu.."License: "..jaf.lictag[jaf.userlicense[cmda]][2])
                                 else
                                    print(abu.."License: None")
                                 end
                                 print(abu.."Shell: "..jaf.shell[cmda])
                                 print(abu.."SCs: "..jaf.crystal[cmda].." ~ Bank: "..jaf.bank[cmda])
                                 print(abu.."Country: "..jaf.mycountryname[cmda])
                  elseif cmda==nil then
                                 print(merah.."ERROR: Please put the ID of player")
                  else
                                 print(merah.."ERROR: Player not exists!")
                  end
                  return 2
         elseif cmd=="lc" then
                  if #jaf.inet_list[2].subnet[1].info>0 then
                     print(hijau.."---------------------")
                     for i=1,10 do
                         if jaf.inet_list[2].subnet[1].info[i]~=nil then
                            print(putih..jaf.inet_list[2].subnet[1].info[i])
                         end
                     end
                     print(hijau.."---------------------")
                     print(kuning.."Date: "..os.date(""..abu.."%d %b %Y"))
                     print(kuning.."Time: "..os.date("%I:%M %p"))
                  else
                     print(merah.."ERROR: The comment variable is nill(0)")
                  end
                  return 2
         elseif cmd=="c" then --- comment with server msg
                  if #jaf.inet_list[2].subnet[1].info>0 then
                     jaf.internet_publiccomment_input("RCon "..jaf.sv_cmtname..": "..txt:sub(3,#txt))
                     msg(hijau..""..jaf.sv_cmtname..": "..abu..txt:sub(3,#txt))
                  else
                     print(merah.."ERROR: Not Able to Comment,the comment variable is nill(0)")
                  end
                  return 2
         elseif cmd=="jc" then --- comment without server msg
                  if #jaf.inet_list[2].subnet[1].info>0 then
                     jaf.internet_publiccomment_input("RCon "..jaf.sv_cmtname..": "..txt:sub(4,#txt))
                  else
                     print(merah.."ERROR: Not Able to Comment,the comment variable is nill(0)")
                  end
                  return 2
         elseif cmd=="cname" then
                  if tostring(tcmd[2])~="nil" then
                     jaf.sv_cmtname=tostring(tcmd[2])
                     print(hijau.."Success change the name to: "..tostring(tcmd[2]))
                  else
                     print(merah.."ERROR: The name is not inputed(nil)")
                  end
                  return 2
         elseif cmd=="daycycle_on" then
                  jaf.daycycle_status=true
                  jaf.daycycle_refresh()
                  print(hijau.."System: Day-Night System is activated.")
                  return 2
         elseif cmd=="daycycle_off" then
                  jaf.daycycle_status=false
                  parse("sv_daylighttime -1")
                  print(kuning.."System: Day-Night System is Deactivated.")
                  return 2
         end
end