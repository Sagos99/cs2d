---- in table: noactive= false for active
jaf.achv_list={
                 [1]={title="Joining Server",
                      info="This achievement for greeting you 'New User' here and to give you 'Thanks' for your coming",
                      action=function(id)
                            jaf.svj_msg2(id,hijau..jaf.sv_lang(jaf.lang[id],136))
                      end,
                      actime=function(id)
                            if jaf.usgn[id]>0 then
                               jaf.give_shell(id,50000)
                               jaf.give_item(id,29,1)
                               jaf.give_item(id,1,3)
                            end
                            return true
                      end
                     };
                 [2]={title="Rich Player",
                      info="We believe that you can collect 10M shell and being rich-man user here",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.shell[id]>=10000000 then
                               return true
                            end
                            return false
                      end
                     };
                 [3]={title="Newbie was learn",
                      info="Good for you to reach 10 level here and i tell you thats this just begining for you",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=10 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAS REACH LEVEL 10 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [4]={title="Trying to climb?",
                      info="Come on dont surrender now, you cant stop here now.. Let us know that you can reach level 20 here",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=20 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 20 TODAY ! ! !")
                               jaf.give_shell(id,100000)
                               return true
                            end
                            return false
                      end
                     };
                 [5]={title="Put your hands down!",
                      info="Put up your hands down now and say 'I WONT GIVE UP HERE' and now you must reach level 30 today!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=30 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 30 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [6]={title="Show off time!",
                      info="After all have been you through, now is the best time to show your skill to all players here",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=40 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 40 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [7]={title="Legendary Hero",
                      info="Wood, stone, steel it's not important here.. The thing is you must reach level 50 today!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=50 then
                                 jaf.give_item(id,11,1)
                                 jaf.give_shell(id,500000)
                                 msg2(id,hijau.."Congratulations! you got Legend Ticket!")
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 50 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [8]={title="Level 60 reached",
                      info="Reach level 60 for unlock this achievement!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=60 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 60 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [9]={title="Level 70 reached",
                      info="Reach level 70 for unlock this achievement!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=70 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 70 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [10]={title="Level 80 reached",
                      info="Reach level 80 for unlock this achievement!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=80 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 80 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [11]={title="Level 90 reached",
                      info="Reach level 90 for unlock this achievement!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=90 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 90 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [12]={title="Level Master",
                      info="Reach level 100 for unlock this achievement!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.level[id]>=100 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] I HAVE REACH LEVEL 100 TODAY ! ! !")
                               return true
                            end
                            return false
                      end
                     };
                 [13]={title="Trade start",
                      info="Start your first trade for unlock this achievement!",
                      action=function(id)
                      end
                     };
                 [14]={title="Clan donate",
                      info="Donate your first Shell for clan to unlock this achievement!",
                      action=function(id)
                      end
                     };
                 [15]={title="Clan Owner",
                      info="Create your own clan to unlock this achievement!",
                      action=function(id)
                      end
                     };
                 [16]={title="User Accepted",
                      noactive=false,
                      info="You will unclock this achievement when you are member",
                      action=function(id)
                            function jaf.member_shopT(id)
                              jaf.item_buymenucreate(id,{{68,8000,0,0},{69,24000,0,0},{70,14000,0,0},{71,0,8500,0},{72,0,15000,0},{73,0,3000,0},{97,150,0,0},{74,42000,0,0},{75,0,0,0,{{109,10},{107,20},{106,10}}},{76,14000,0,0}})
                            end
                            mem_sT=timerEx(500,jaf.member_shopT,1,id)
                      end,
                      actime=function(id)
                            if (jaf.JAFmember[id]>0 or jaf.admin[id]>0) and jaf.freetrialplay[id]<=0 then
                               return true
                            elseif (jaf.JAFmember[id]>0 or jaf.admin[id]>0) and jaf.freetrialplay[id]>0 then
				jaf.give_item(id,28,-6)
				jaf.JAFmember[id]=0
				jaf.freetrialplay[id]=0
                            end
                            return false
                      end
                     };
                 [17]={title="Brilliant User",
                      info="Its good if you have clan that was 1st Rank on server and you are leader on that clan then you are level 100 too, so just look an special items here",
                      action=function(id)
                           jaf.item_buymenucreate(id,{{100,0,0,0},{304,0,0,0,{{162,1}}},{102,0,0,0},{103,2500,0,0},{87,1000000,0,0},{72,0,10000,0},{23,200000,0,0},{36,7000000,0,0}}) 
                      end,
                      actime=function(id)
                            if jaf.level[id]>=100 and jaf.clan[id]>0 and jaf.clan_leader[jaf.clan[id]]~=nil and jaf.clan_leader[jaf.clan[id]]==jaf.usgn[id] and jaf.clan_top_check(jaf.clan[id],false)==1 then
                               return true
                            end
                            return false
                      end
                     };
                 [18]={title=kuning.."MASTER OF SUPPORT",
                      info="Thanks to our ALL Developers for Support us and your effort to bring our server to the Awesome Level",
                      action=function(id)
                          jaf.item_buymenucreate(id,{{101,0,0,0},                          {160,0,0,0}})
                      end,
                      actime=function(id)
                            if jaf.admin[id]>=#jaf.admintag then
                               return true
                            end
                            return false
                      end
                     };
                 [19]={title="Police Office Secret",
                      info="We need you to be detective in police office, 'I always scared by weird noise of this Place' - Jimmy said. Find the thing that make Jimmy scare!",
                      action=function(id)
                         msg2(id,hijau.."Good job detective!")
                      end
                     };
                 [20]={title="Detective of Police Office",
                      info="Good job Mr/s.Detective, now we know who make Jimmy scare. Do more work detective!",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.achvstat[id][19]>=1 then
                               jaf.give_item(id,27,1)
                               jaf.give_item(id,31,1)
                               msg2(id,hijau.."[Police Jimmy]"..kuning.." Thank you detective! take this Pikachu Helm and Cyan Sword")
                               return true
                            end
                            return false
                      end
                     };
                 [21]={title="Police Officer",
                      info="It is good if you are police, do your work police!",
                      action=function(id)
                           msg2(id,hijau.."Be a good police.")
                      end,
                      actime=function(id)
                            if jaf.jobid[id]==2 then
                               jaf.give_item(id,131,1)
                               jaf.give_item(id,132,1)
                               jaf.give_item(id,221,1)
                               msg2(id,hijau.."Congratulations! you got Police Armor and Helm")
                               return true
                            end
                            return false
                      end
                     };
                 [22]={title="The VIP",
                      info="Welcome VIP! we have 200K shell for you",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.userlicense[id]==1 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] IM VIP NOW!")
                               jaf.give_shell(id,200000)
                               return true
                            end
                            return false
                      end
                     };
                 [23]={title="Legend User",
                      info="Congratulation for all use who has Legend Rank in their status",
                      action=function(id)
                           jaf.item_buymenucreate(id,{
                           {157,0,0,0,{{145,1},{109,100},{100,1}}},
                           {162,0,10000,0},{151,0,0,0,{{102,1},{109,500}}}, })
                      end,
                      actime=function(id)
                            if jaf.userlicense[id]==2 then
                               jaf.internet_publiccomment_input("["..player(id,"name").."] The Legend User is APPEAR!")
                               jaf.crystal[id]=jaf.crystal[id]+5000
                               return true
                            end
                            return false
                      end
                     };
                 [24]={title="What you found in mars",
                      info="Good man! you found the secret of the mars! there is water is mars?? OMG!!!",
                      action=function(id)
                      end
                     };
                 [25]={title="Legion Shadow Exsistence",
                      info="We got rumors about Legion Shadow is coming to our world, if you got some stuff or proof it will be nice to believe the rumors",
                      action=function(id)
                            jaf.item_buymenucreate(id,{
                            {178,75000,0,0},{179,0,2000,0},
                            {180,0,2000,0},{190,0,2000,0}, })
                      end,
                      actime=function(id)
                            if jaf.checkitem(id,176).amount>0 then
                               jaf.crystal[id]=jaf.crystal[id]+2000
                               msg2(id,hijau.."You got 2K SCs for the achievement")
                               return true
                            end
                      end
                     };
                 [26]={title="Labyrinth Explore",
                      info="Go to center of the labyrinth",
                      action=function(id)
                       if jaf.tradestat[id]>=1 or jaf.fishingstatus[id]>=1 or jaf.jailsel[id]>0 or jaf.bar2IMG[id][4]~=nil or jaf.up_itemid1[id]>0 then
                          jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                       else
                          jaf.freemenu2(jaf.achvmenu2,id)
                          jaf.achv_reset(id)
                          jaf.freeachvstatIMG(id)
                          parse("setpos "..id.." "..(184*32+16).." "..(213*32+16))
                       end
                      end
                     };
                 [27]={title="Deathrun survive",
                      info="You've success survive at deathrun",
                      action=function(id)
                      end
                     };
                 [28]={title="Paladin Club",
                      info="You are paladin! so lets join to Paladin Club, hero! ",
                      action=function(id)
                            jaf.item_buymenucreate(id,{
                            {211,1000000,0,0} })
                      end,
                      actime=function(id)
                            if jaf.checkitem(id,175).amount>0 then
                               jaf.crystal[id]=jaf.crystal[id]+2000
                               msg2(id,hijau.."You got 2K SCs for the achievement")
                               return true
                            end
                      end
                     };
                 [29]={title="Krusty Crab Secret Formula",
                      info="Mr Crab is hiding his secret formula, find the secret formula.",
                      action=function(id)
                       if jaf.tradestat[id]>=1 or jaf.fishingstatus[id]>=1 or jaf.jailsel[id]>0 or jaf.bar2IMG[id][4]~=nil or jaf.up_itemid1[id]>0 then
                          jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],108))
                       else
                          jaf.freemenu2(jaf.achvmenu2,id)
                          jaf.achv_reset(id)
                          jaf.freeachvstatIMG(id)
                          parse("setpos "..id.." "..(83*32+16).." "..(245*32+16))
                       end
                      end
                     };
                 [30]={title=ungu2.."Legion Access",
                      info="You found the Undead Warrior armor, that is what you need to Access to be legion.",
                      action=function(id)
			jaf.legionm(id)
                      end,
                      actime=function(id)
                            if jaf.checkitem(id,324).amount>0 then
                               return true
                            end
                      end
                     };
                 [31]={title="Doctor",
                      info="You are offcialy being doctor now, take your suit here",
                      action=function(id)
                          jaf.item_buymenucreate(id,{{327,0,0,0} })
                      end,
                      actime=function(id)
                            if jaf.jobid[id]==4 then
                               return true
                            end
                            return false
                      end
                     };
                 [32]={title="Professional Shooter",
                      info="Improve your skill of shoting by Collecting 2K of Weapon Point and we will give you a SCs",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.achvstat[id][32]<1 and jaf.wpnpointku[id]>=2000 then
                               jaf.give_scs(id,5000,nil,hijau..jaf.sv_lang(jaf.lang[id],128,"5000 Scs","Achievement"))
                               return true
                            end
                      end
                     };
                 [33]={title="Tutorial Complete",
                      info="You have complete tutorial/guide of Other World Server",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.achvstat[id][33]<1 and jaf.mytutor[id]>=#jaf.list_tutor then
                               jaf.give_scs(id,250,nil,hijau..jaf.sv_lang(jaf.lang[id],128,"250 Scs","Achievement"))
                               return true
                            end
                      end
                     };
                 [34]={title=ungu2.."Legendary Chi-Fighter",
                      info="You have found The legend armor of Chi fighter, There are 4 Legendary Fighters on Oxe Galaxy. Chi-Fighter is one of them!",
                      action=function(id)
			jaf.item_buymenucreate(id,{{139,0,0,0},{377,0,0,0},{378,0,0,0} })
                      end,
                      actime=function(id)
                            if jaf.checkitem(id,376).amount>0 then
                               jaf.give_scs(id,10000,nil,hijau..jaf.sv_lang(jaf.lang[id],128,"10000 Scs","Achievement"))
                               return true
                            end
                      end
                     };
                 [35]={title="Steam User",
                      info="You are login to server by using Steam Account",
                      action=function(id)
                      end,
                      actime=function(id)
                            if jaf.steam[id]>0 then
                               jaf.give_scs(id,5000,nil,hijau..jaf.sv_lang(jaf.lang[id],128,"5000 Scs","Achievement"))
                               return true
                            end
                            return false
                      end
                     };

              }

function jaf.achv_reset(id)
         parse('hudtxt2 '..id..' 37 "" 0 0')
         parse('hudtxt2 '..id..' 38 "" 0 0')
         parse('hudtxt2 '..id..' 39 "" 0 0')
         parse('hudtxt2 '..id..' 40 "" 0 0')
end

function jaf.achv_get(id,n)
         if tonumber(id) and tonumber(n) and jaf.achv_list[n]~=nil and jaf.achvstat[id][n]<1 and jaf.usgn[id]>0 then
             jaf.achvstat[id][n]=1
             parse('hudtxt2 '..id..' 41 "'..putih..jaf.sv_lang(jaf.lang[id],133,jaf.achv_list[n].title..putih)..'" 425 380 1')
             parse('hudtxtalphafade '..id..' 41 15000 0.0')
             if jaf.usgn[id]>0 then
                jaf.svj_msg(kuning.."[News] "..putih..player(id,"name").." have unlock '"..jaf.achv_list[n].title..""..putih.."' Achievement!")
             end
             jaf.getsound(id,"JAF/otherworld/achv_unlock.ogg")
             jaf.exp[id]=jaf.exp[id]+1500
         end
end
            