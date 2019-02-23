jaf.npc_x={}
jaf.npc_y={}
jaf.npc_ac={}
jaf.npc_img={}
jaf.npcsay_img={}
jaf.npcemote_img={}
jaf.npc_time=5 --- time for spawning NPC's
jaf.npc_pressedpos={}


jaf.npc_list={
           {         name="Toni Altar", -- 1
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/gman.png",
                     area={{26,13},{29,17}},
                     move=true,
                     scale=1.2,
                     emote=true,
                     say_scale={1.3,1.3},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", do you want make a friendship with me :D","The Void is come","Im are Void HighLord!"}
                     jaf.svj_msg2(id,hijau.."[Toni Altar] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.item_buymenucreate(id,{{361,0,0,0,{{365,18},{354,300},{347,10},{238,1000}}},{362,0,0,0,{{352,300}}},{351,0,1000,0},{350,0,5000,0}, {360,0,0,0,{{361,1},{362,1},{352,200}}},{355,0,0,0,{{347,50}}},{363,0,0,0,{{365,2}}} })
                     end
           },
           {         name="Guard", -- 2
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/guard2.png",
                     area={{23,28},{23,28}},
                     move=false,
                     emote=false,
                     press="23+0.26",
                     scale=1.1,
                     say_scale={1,2},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", what should i do for you?"}
                     jaf.svj_msg2(id,hijau.."[Emas the Guard] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.item_buymenucreate(id,{
                     {30,0,0,0,{{29,1},{109,50}}},{19,800000,0,0},
                     {14,120000,0,0},
                     {186,0,10500,0},{331,450000,0,0},{396,15000,0,0},
                     {398,0,4700,0},{399,500000,0,0},{400,0,12000,0},
                     {401,280000,0,0},{402,0,2000,0},{403,450000,0,0},
                     {404,0,5000,0},{405,240000,0,0},{406,0,7000,0},
                     {407,50000,0,0},{408,0,8500,0},{409,85000,0,0},
                     {302,0,0,0,{{287,2},{279,3},{321,12}}},
                     {324,0,5500,0},{359,500000,0,0},
                     {357,120000,0,0},{356,0,700,0},{174,500000,0,0},
                     {7,50000,0,0},{10,0,500,0},
                     {17,50000,0,0,},{18,80000,0,0},
                     {22,0,2000,0},{48,0,0,0,{{104,100},{107,3},{110,2}}},{60,9000,0,0},
                     {84,400000,0,0},{98,0,0,0,{{104,5},{105,1}}},
                     {62,10000,0,0},{64,150000,0,0},
                     {65,0,5000,0},{63,0,6000,0},{138,180000,0,0},                               {137,0,2000,0},{140,200000,0,0},
                     {148,0,7000,0},{79,1000000,0,0},{78,200000,0,0},
                     {80,30000,0,0},{66,8000,0,0},{152,100000,0,0},
                     {153,0,10000,0},{154,200000,0,0},{155,500000,0,0},
                     {158,100000,0,0},{159,0,10000,0},{163,100000,0,0},
                     {164,0,2017,0},{165,0,7000,0},{168,0,2000,0},
                     {170,0,500,0},{171,0,5000,0},{172,0,5000,0},
                     {173,1000000,0,0},
                     {176,0,0,0,{{109,50},{111,200},{99,1}}},
                     {177,200000,0,0},{183,10000000,0,0},
                     {184,0,2000,0},{185,0,3000,0},{188,0,5000,0},
                     {192,100000,0,0},{33,2000000,0,0},{34,2500000,0,0},{35,5000000,0,0},{26,500000,0,0},{15,3000000,0,0},{12,200000,0,0},{332,0,12000,0},{333,20000,0,0},{345,55000,0,0}, }) 
                     end
           },
           {         name="Mysterious", -- 3
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/mysterious.png",
                     area={{6,20},{10,22}},
                     move=true,
                     emote=false,
                     scale=1.1,
                     say_scale={0.3,0.3},
                     action=function(id)
                     local sqd_say={"Sssttt!! be Quiet if you want talk with me","Just wait, i want take a rest first","So . . .","I have a good item, of course its not free","if you think im so weird.. why you wanted to talk with me?!","Hmphh.. so poor","I have a friend 'joni' maybe you can get sepcial item on him","You are very destrubed, go away from me","Sorry.. but you are so strange for me","Do you really trust on me?","I have usefull books here, just buy it now"}
                     gtrnps=math.random(1,#sqd_say)
                     jaf.svj_msg2(id,hijau.."[Mr.Mysterious] "..kuning..""..sqd_say[gtrnps])
                     if gtrnps==3 then
                        jaf.item_buymenucreate(id,{{93,0,5000,0},{94,0,8000,0},
                        {96,200000,0,0},{95,5000,0,0},{99,0,10000,0},
                        {50,100000,0,0},{51,0,2000,0},{59,0,12000,0},
                        {166,0,0,0,{{169,2},{168,1}}},})
                     end
                     end
           },
           {         name="Kakek zuna", -- 4
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/tazuna.png",
                     area={{7,3},{12,6}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Excuse me sir, did you know where is this?","I was lost in here.. help me please"}
                     jaf.svj_msg2(id,hijau.."[Kakek Zuna] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Chef Juna", -- 5
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/koki.png",
                     area={{37,13},{37,13}},
                     move=false,
                     press="37+0.15",
                     scale=0.9,
                     say_scale={0,2},
                     action=function(id)
                     local sqd_say={"Welcome "..player(id,"name")..""}
                     jaf.svj_msg2(id,hijau.."[Chef Juna] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.item_buymenucreate(id,{{1,1000,0,0},{2,1500,0,0},
                     {16,15000,0,0},{3,2500,0,0},{4,200,0,0},
                     {6,5000,0,0}})
                     end
           },
           {         name="Seller", -- 6
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc1.png",
                     area={{8,77},{8,77}},
                     move=false,
                     scale=1,
                     press="10+0.77",
                     say_scale={2,0},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{107,0,0,0,{{108,10}}},{111,0,0,0,{{107,5},{106,2}}},})
                     end
           },
           {         name="Fisherman", -- 7
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{11,67},{11,67}},
                     move=false,
                     scale=1,
                     press="11+0.65",
                     say_scale={0,2},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{112,0,0,0,{{104,30},{107,10},{106,5}} },{114,0,0,0,{{104,90},{107,30},{106,15},{109,25}} },{113,0,0,0,{{104,5},{110,2},{106,1}}} })
                     end
           },
           {         name="Fisherman", -- 8
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{152,328},{152,328}},
                     move=false,
                     scale=1,
                     press="152+0.326",
                     say_scale={0,2},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{112,0,0,0,{{104,30},{107,10},{106,5}} },{114,0,0,0,{{104,90},{107,30},{106,15},{109,25}} },{113,0,0,0,{{104,5},{110,2},{106,1}}} })
                     end
           },
           {         name="Materials Seller", -- 9
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{33,31},{33,31}},
                     move=false,
                     scale=1,
                     press="33+0.29",
                     say_scale={0,2},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{104,5000,0,0},{110,6000,0,0},{111,8000,0,0},{105,0,5,0},{106,0,8,0},{109,0,500,0},{119,0,0,0,{{109,10},{116,5}}} })
                     end
           },
           {         name="Banker", -- 10
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/guard.png",
                     area={{108,45},{108,45}},
                     move=false,
                     scale=1,
                     press="108+0.43",
                     say_scale={0,2},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Bank Official] "..kuning.."Welcome to J.I.B, What can I do for you?")
                          jaf.bankcentermenu(id)
                     end
           },
           {         name="Officer Jimmy", -- 11
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/police.png",
                     area={{98,85},{104,95}},
                     move=true,
                     scale=1.2,
                     emote=false,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name").."! What you looking for?","You know, this place is make me scare","Want hear a story about this place?","Be carefull..","Uuuu.. uuuu.. aaa... something is broken, did you hear it?","Do you want know secret about this place? let me think..."}
                     local jimsaynpc=math.random(1,#sqd_say)
                     jaf.svj_msg2(id,hijau.."[Police Jimmy] "..kuning..""..sqd_say[jimsaynpc])
                     if jimsaynpc==6 and math.random(1,12)==4 then
                        jaf.svj_msg2(id,hijau.."[Police Jimmy] "..kuning.."Aa.. then okey man, listen to me.. go to the left side of chair there")
                        jaf.svj_msg2(id,kuning.."Then press E there and BOOOM! you found it, but you must level 20 or above to make it work also not for bad guy in jail")
                     elseif jimsaynpc==6 then
                         jaf.svj_msg2(id,hijau.."[Police Jimmy] "..kuning.."Umm sorry man, I think you not ready for it")
                     end
                     end
           },
           {         name="Officer Jack", -- 12
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/police.png",
                     area={{127,90},{139,95}},
                     move=true,
                     scale=1.2,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"My friend Jimmy always scared by this place :(","Be a good man boy! dont make criminal thing here ;)","You know secret of this place man? if you want know just ask to Jimmy","Jimmy is older than me, but something make him more scare than me","You must level 20 or up to able go to the secret place man"}
                     jaf.svj_msg2(id,hijau.."[Police Jack] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Beni", -- 13
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc3.png",
                     area={{135,70},{136,71}},
                     move=true,
                     scale=1.2,
                     say_scale={1,1},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Beni] "..kuning.."Hello my friend, can you help me?")
                          jaf.quest_questtakemenu(id,{3,4})
                     end
           },
           {         name="Mark", -- 14
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc1.png",
                     area={{36,31},{36,31}},
                     move=false,
                     scale=1,
                     press="36+0.29",
                     emote=true,
                     say_scale={0,2},
                     action=function(id)
                     local sqd_say={"What you looking for?","Want find a job man? Okey!"}
                     jaf.svj_msg2(id,hijau.."[mark] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     if jaf.jobid[id]>0 then
                        menu(id,"Mark - Remove Job,Yes|5000 SCs")
                     else
                        jaf.job_list(id)
                     end
                     end
           },
           {         name="Kakek zuna", -- 15
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/tazuna.png",
                     area={{70,54},{72,55}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"I found a secret place in the Black Forest, you want know about it?","There is one tree that smaller than other trees, if you go inside that tree you will be teleported","Find smallest tree at Black Forest!"}
                     jaf.svj_msg2(id,hijau.."[Kakek zuna] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Stuart", -- 16
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/stuart.png",
                     area={{198,13},{202,16}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name").."!","This area is forbidden for other, man!","Our Starship is get attacked by alien, we got scare of the happen","My friend, billy, still in starship.. i know he panicked there","Man.. please find my friend, he scare there man pleaseee!!!","Man.. listen to me, there are secret in billy's room, near air ventilation!","You must press E at secret in billy's room to go to captain room","I know you are my hero! please help our starship :D","i lost the key of the gate, but we have 1 more key on crocolight monster"}
                     jaf.svj_msg2(id,hijau.."[Stuart] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Billy", -- 17
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/billy.png",
                     area={{42,235},{44,238}},
                     move=true,
                     scale=1,
                     emote=false,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello girl!! rrrgggggrrrrttt.....","A mon... mon.. monsterr... monsterr!!! uuuuooooo !!","THe monster almost bite my head... im very scared!!!","Are you going to kill me here?? there is a monster out there brother!!","Do you want know secret of the mars? i found it man...","Did you see the monster man?? you see their canine?","Too dangerous out there, just play card with me girl","are you really a girl? i love girl.. girl is my priority","You know im scientist in here, i love chemistry.. you want learn from me? hehe","..."}
                     local jimsaynpc=math.random(1,#sqd_say)
                     jaf.svj_msg2(id,hijau.."[Billy] "..kuning..""..sqd_say[jimsaynpc])
                     if jimsaynpc==5 and math.random(1,12)==4 then
                        jaf.svj_msg2(id,hijau.."[Billy] "..kuning.."If you want know, there is blood in the mars.. you can press E there and Wuala bumm parammm basss!!")
                     elseif jimsaynpc==5 then
                         jaf.svj_msg2(id,hijau.."[Billy] "..kuning.."I think you are not people that i can believe, sorry")
                     end
                     end
           },
           {         name="Furty", -- 18
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{118,209},{118,209}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", welcome to my ship!","We are under attack by alien"}
                     jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                      jaf.quest_questtakemenu(id,{28})
                     end
           },
           {         name="Furty", -- 19
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{19,16},{19,19}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", whats up!","Want awesome class? absolutely you want right :p","Im furty im furty im furty, CALL ME FURTY!","Dis game is guud, i like it sooo much much much :*"}
                     jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Rajawali", -- 20
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc4.png",
                     area={{209,183},{209,183}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hi ._.","Im rajawali, you know me right??","Im joni's friend, dont ask me for new update okey!","Tell joni to make me more greater, i love my job :)","Who im i?"}
                     jaf.svj_msg2(id,hijau.."[Rajawali] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.rajawali(id)
                     end
           },
           {         name="Joni", -- 21
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/joni.png",
                     area={{35,25},{39,28}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello hero, how are you?","Are you enjoy play in here? it is good if you enjoy :)","go to "..biru.."www.jafweb.forumotion.asia"..kuning.." and register there","Im realy realy happy if you are happy to play here","Play here with our events :D"}
                     jaf.jonim(id)
                     jaf.svj_msg2(id,hijau.."[Joni] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Phill", -- 22
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_phill.png",
                     area={{201,192},{203,192}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                       local sqd_say={"Hello sir, I am phillips.","Sir, can you help me? I am lost here.","I am lost because of this labirinth","Help me!","I have some items for you, enjoy."}
                         jaf.item_buymenucreate(id,{{204,0,0,0,{{231,1},{232,2}}},{203,10,0,0},{213,0,0,0,{{228,10},{118,1}}},{214,0,8000,0},{223,0,9000,0},{217,0,10000,0},{224,0,10500,0},{218,0,0,0,{{233,50},{228,300}}},{226,0,5000,0},{234,2500000,0,0},{235,0,4000,0},{236,0,9500,0},{237,0,0,0,{{229,1},{230,2}}},{270,1000000,0,0},{305,0,0,0,{{220,1},{238,50},{347,2}}}, })
                       jaf.svj_msg2(id,hijau.."[Phill] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Lumberjack", -- 23
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_lumberjack.png",
                     area={{76,25},{77,27}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                       local sqd_say={"Hello sir, I am so tired of my job.","Cutting wood everyday..","Here, you can buy my items."}
                         jaf.item_buymenucreate(id,{{249,400,0,0},{248,0,0,0,{{104,2},{106,3}}},{240,0,0,0,{{238,2},{239,1}}},{241,0,0,0,{{110,2}}},{242,0,0,0,{{110,3}}},{247,15000,0,0},{244,0,0,0,{{243,5}}},{245,0,0,0,{{104,3},{240,1},{241,2},{242,2}}},{246,0,0,0,{{247,1},{248,1}}},{258,0,0,0,{{240,1},{241,2},{242,2}}},{271,1000000,0,0},{274,25000,0,0},{275,50000},{276,70000,0,0},{277,0,0,0,{{269,2},{262,3}}},{278,150000,0,0},{279,0,0,0,{{262,3},{263,1},{264,5}}},{281,0,0,0,{{268,5}}},{282,250000,0,0},{283,0,0,0,{{120,1},{265,2}}},{284,0,0,0,{{117,1},{265,2}}},{285,0,0,0,{{262,8},{233,1}}},{286,0,0,0,{{110,4},{104,8},{233,1}}},{287,1000000,0,0}})
                       jaf.svj_msg2(id,hijau.."[Lumberjack] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Bonnie", -- 24
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_bonnie.png",
                     area={{80,24},{81,25}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                       local sqd_say={"Hello sir, I am fruit seller","Hello, I have some fruits here","Here, you can buy my fruits."}
                         jaf.item_buymenucreate(id,{{268,50000,0,0},{265,70000,0,0},{212,50000,0,0},{239,0,0,0,{{106,1}}},{243,200,0,0},{250,5000,0,0},{251,8000,0,0},{252,10000,0,0},{253,16000,0,0},{254,20000,0,0},{255,30000,0,0},{256,0,0,0,{{247,1},{249,30}}},{257,50000,0,0}})
                       jaf.svj_msg2(id,hijau.."[Bonnie] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Sontoso", -- 25
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/guard.png",
                     area={{133,61},{133,61}},
                     move=false,
                     scale=1,
                     emote=true,
                     press="131+0.61",
                     say_scale={2,0},
                     action=function(id)
                         local sqd_say={"Hello "..player(id,"name")..", Want go to some place?","Im really tired here, i hope furty give me some rest"}
                          jaf.svj_msg2(id,hijau.."[Santoso] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                         jaf.item_buymenucreate(id,{{310,5000,0,0}})
                     end
           },
           {         name="Lukman", -- 26
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/guard.png",
                     area={{169,301},{169,301}},
                     move=false,
                     scale=1,
                     emote=true,
                     press="169+0.303",
                     say_scale={0,2},
                     action=function(id)
                         local sqd_say={"Lalalalalaaaaa....","I always singing when im boring","Hello "..player(id,"name")..", can i help you","Dont just say hi to me!","Where is joni? i need him to help us here for food :P","Im hungry . . ."}
                          jaf.svj_msg2(id,hijau.."[Lukman] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                         jaf.item_buymenucreate(id,{{311,5000,0,0}})
                     end
           },
           {         name="Furty", -- 27
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{133,327},{135,331}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                         local sqd_say={"Hello hero! any question?","Change your attribute color here :)"}
                         jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                         menu(id,"Change Item Color,Helm|10000 Shell,Armor|10000 Shell,Weapon|10000 Shell,(Pet|Not Enable),(Vehicle|Not Enable),Wing|10000 Shell")
                     end
           },
           {         name="Sumo", -- 28
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_sumo.png",
                     area={{79,26},{80,27}},
                     move=true,
                     scale=1,
                     say_scale={1,1},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Sumo] "..kuning.."I am so afraid..")
                          jaf.quest_questtakemenu(id,{55,56,57,58,59})
                     end
   },
           {         name="Mysterious Count", -- 29
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_mysteriouscount.png",
                     area={{31,18},{32,20}},
                     move=true,
                     scale=1,
                     say_scale={1,1},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Mysterious Count] "..kuning.."I don't have many shells but I have something awful..")
                          jaf.quest_questtakemenu(id,{60,62,63,64,65,66,67,71})
                     end
   },
           {         name="Chef Gordon", -- 30
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/koki.png",
                     area={{83,243},{85,245}},
                     move=true,
                     scale=1,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"How do you get here?","I have some secret items here.."}
                     jaf.svj_msg2(id,hijau.."[Chef Gordon] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.item_buymenucreate(id,{{309,300000,0,0},{306,0,0,0,{{250,6},{251,4},{269,1}}},{307,0,0,0,{{116,2},{200,5}}},{308,0,0,0,{{255,2},{278,1}}}})
                     end
           },
           {         name="Hawk Guard", -- 31
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/guard.png",
                     area={{189,330},{189,330}},
                     move=false,
                     scale=1,
                     say_scale={2,2},
                     action=function(id)
			if jaf.checkitem(id,316).amount>0 then
				jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."Welcome sir..")
				parse("setpos "..id.." "..(323*32+16).." "..(81*32+16))
			elseif jaf.checkitem(id,315).amount>0 then
				jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."Look your face, you're so ugly haha, get in!")
				parse("setpos "..id.." "..(325*32+16).." "..(87*32+16))
                     	elseif jaf.checkitem(id,314).amount>0 then
				jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."What do we have here? Unknown man trying to manipulate the password.")
				jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."Get away!")
			else
				local rr = math.random(1,5)
				if rr==5 then
					jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."!@#$%")
					jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."Get away!")
					parse('customkill 0 "Guard" '..id)
				else
					jaf.svj_msg2(id,hijau.."[Hawk Guard] "..kuning.."I wont repeat this, get away!")
				end
			end
                     end
           },
           {         name="Hawk Clarence", -- 32
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_sumo.png",
                     area={{323,87},{323,87}},
                     move=false,
                     scale=1,
                     say_scale={1,1},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Hawk Clarence] "..kuning.."I hate my brother Sumo, he scared anytime..")
                          jaf.quest_questtakemenu(id,{68,69,70})
                     end
   },
           {         name="Hawk Count Jeffrey", -- 33
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_mysteriouscount.png",
                     area={{323,81},{323,81}},
                     move=false,
                     scale=1.2,
                     say_scale={1,2},
                     press="323+0.83",
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Hawk Count Jeffrey] "..kuning.."Buy items only for Hawk members, welcome..")
			  jaf.item_buymenucreate(id,{{267,0,0,0,{{312,3}}},{317,0,0,0,{{104,5}}},{318,0,0,0,{{317,1},{233,7}}},{321,0,0,0,{{121,1}}},{225,0,0,0,{{299,20},{300,3}}},{220,0,0,0,{{298,3},{238,500},{300,10}}},{301,0,0,0,{{318,200},{319,1},{320,2}}}})
                     end
   },
           {         name="Chemist", -- 34
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc1.png",
                     area={{191,329},{194,330}},
                     move=true,
                     scale=1,
                     say_scale={1,1},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{315,0,0,0,{{314,1},{265,2}}}})
                     end
           },
           {         name="Dani", -- 35
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{316,20},{316,20}},
                     move=false,
                     scale=1,
                     press="316+0.22",
                     say_scale={2,2},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{322,40000,0,0}})
                     end
           },
           {         name="Irvan", -- 36
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{150,308},{150,308}},
                     move=false,
                     scale=1,
                     press="148+0.308",
                     say_scale={2,0},
                     action=function(id)
                     jaf.item_buymenucreate(id,{{326,10000,0,0}})
                     end
           },
           {         name="Indro", -- 37
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc1.png",
                     area={{315,210},{315,210}},
                     move=false,
                     scale=1,
                     press="315+0.208",
                     say_scale={0,2},
                     action=function(id)
                     menu(id,"Indro - Receptionist,Give the card")
                     end
           },
           {         name="Demian", -- 38
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc1.png",
                     area={{164,328},{164,328}},
                     move=false,
                     scale=1,
                     press="162+0.328",
                     say_scale={2,0},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Demian] "..kuning.."Whats up buddy! want join to the Club?")
                          menu(id,"Demian,Go into Club|5000 Shell")
                     end
           },
           {         name="Bonnie", -- 39
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_bonnie.png",
                     area={{145,328},{145,328}},
                     move=false,
                     scale=1,
                     press="145+0.326",
                     say_scale={0,2},
                     action=function(id)
                          jaf.svj_msg2(id,hijau.."[Bonnie] "..kuning.."Welcome to my store! what you need here?")
                          menu(id,"Weapon Point,20 Weapon Point|2K Shell,50 Weapon Point|5K Shell,100 Weapon Point|10K Shell,250 Weapon Point|25K Shell,500 Weapon Point|50K Shell,,,(Weapon Point|"..jaf.wpnpointku[id]..")")
                     end
           },
           {         name="Furty", -- 40
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{323,174},{323,174}},
                     move=false,
                     scale=1,
                     emote=false,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Im are son of The TimeWarrior","This is our house, but Shadow has destroy it","Glad to see you here, Hero.","My dad has create a portal to SAFEROOM of Planet of Magic around the mars","Press E button on black circle and you will teleported to the SAFEROOM"}
                     jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Rajawali", -- 41
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc4.png",
                     area={{168,330},{168,330}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hi ._.","Im rajawali, you know me right??","Im joni's friend, dont ask me for new update okey!","This Disco really nice right? i like it","Im boring, and i found this place so nice","Dont drug here hero.. hehe, it is forbidden here!"}
                     jaf.svj_msg2(id,hijau.."[Rajawali] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.rajawali2(id)
                     end
           },
           {         name="Joni", -- 42
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/joni.png",
                     area={{170,330},{170,330}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello hero, how are you?","Are you enjoy play in here? it is good if you enjoy :)","Enjou your party here","Im realy realy happy if you are happy to play here","Its boring out there, just enjoy here"}
                     jaf.jonim2(id)
                     jaf.svj_msg2(id,hijau.."[Joni] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Lumberjack", -- 43
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_lumberjack.png",
                     area={{182,334},{182,334}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                       local sqd_say={"Hello sir, I am so tired of my job.","Cutting wood everyday..","Here, you can buy my items.","Im tired, but in here im got my good rest"}
                         jaf.item_buymenucreate(id,{{249,400,0,0},{248,0,0,0,{{104,2},{106,3}}},{240,0,0,0,{{238,2},{239,1}}},{241,0,0,0,{{110,2}}},{242,0,0,0,{{110,3}}},{247,15000,0,0},{244,0,0,0,{{243,5}}},{245,0,0,0,{{104,3},{240,1},{241,2},{242,2}}},{246,0,0,0,{{247,1},{248,1}}},{258,0,0,0,{{240,1},{241,2},{242,2}}},{271,1000000,0,0},{274,25000,0,0},{275,50000},{276,70000,0,0},{277,0,0,0,{{269,2},{262,3}}},{278,150000,0,0},{279,0,0,0,{{262,3},{263,1},{264,5}}},{281,0,0,0,{{268,5}}},{282,250000,0,0},{283,0,0,0,{{120,1},{265,2}}},{284,0,0,0,{{117,1},{265,2}}},{285,0,0,0,{{262,8},{233,1}}},{286,0,0,0,{{110,4},{104,8},{233,1}}},{287,1000000,0,0}})
                       jaf.svj_msg2(id,hijau.."[Lumberjack] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Furty", -- 44
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{166,331},{164,331}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Ninja Life make me soooo tired, you want be mod there?? hehe no, you cant!","Didnt you see me? im really happy here :P","Do you see stairs right there? i wanna know what is there '>'","Any question?..."}
                     jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Kakek zuna", -- 45
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/tazuna.png",
                     area={{163,338},{163,338}},
                     move=false,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"What do you see? >:(","Dont thinking anything about me."}
                     jaf.svj_msg2(id,hijau.."[Kakek zuna] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Materials Seller", -- 46
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc2.png",
                     area={{182,329},{182,329}},
                     move=false,
                     press="182+0.331",
                     scale=1,
                     say_scale={0,2},
                     action=function(id)
                     jaf.svj_msg2(id,hijau.."[Seller] "..kuning.."Enjoy the party boy?")
                     jaf.item_buymenucreate(id,{{104,5000,0,0},{110,6000,0,0},{111,8000,0,0},{105,0,5,0},{106,0,8,0},{109,0,500,0},{119,0,0,0,{{109,10},{116,5}}} })
                     end
           },
           {         name="Bar Staff", -- 47
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc3.png",
                     area={{178,329},{178,329}},
                     move=false,
                     scale=1,
                     press="178+0.331",
                     say_scale={0,2},
                     action=function(id)
                     jaf.svj_msg2(id,hijau.."[Seller] "..kuning.."Dont just be silent here, go dance!")
                     jaf.item_buymenucreate(id,{{334,2000,0,0},{335,2200,0,0},{336,2500,0,0},{337,5000,0,0},{338,5000,0,0},{339,10000,0,0},{6,5000,0,0} })
                     end
           },
           {         name="Kakek zuna", -- 48
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/tazuna.png",
                     area={{114,244},{114,244}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"My son!... my son!... what happen to you!!","My son has become a monster, help help!","This is unbelieveable.. is this the reality?","I trust you hero! please kill him! kill him! before he kill all peoples in village","Dont you understand?? my heart is hurt!"}
                     jaf.svj_msg2(id,hijau.."[Kakek Zuna] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Nila Kinara", -- 49
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/nilakinara.png",
                     area={{38,27},{38,27}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", how are you?","I wanna play some of games here, do you want join?","My favorite colour is blue, its like a sky","Im crying while im alone..","He always say to me for not crying because he will be on my side forever","I love Romantic man"}
                     jaf.svj_msg2(id,violet.."[Nila Kinara] "..putih..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Goxi", -- 50
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/goxi.png",
                     area={{378,165},{378,165}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", what do you feel here?","Are you scared? HaHaHa"}
                     jaf.svj_msg2(id,hijau.."[Goxi] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.goxim(id)
                     end
           },
           {         name="Rian", -- 51
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/rian.png",
                     area={{379,167},{379,167}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello hero, whats up?","Goxi is my friend, he is good friend","You know shadow? i feel he was planning something now","Actually this area is forbidden for you"}
                     jaf.svj_msg2(id,hijau.."[Rian] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.npctalkme(id,jaf.locgfx.."npc/rian.png","Rian - Monster Slayer",{"My name is RIAN, im are monster Slayer and i has join to Warrior as my Class. I have slay soo MANY monsters,i have friend that you should call him goxi, i found him when he was fight with Jester..","I found him when he was fight with Jester. Goxi is Dark Master, he know all about dark energy. Even he is on Dark-Side but he is very nice to people, he always told me a joke when im boring and laughing together..","But now, i see Goxi is very-crazy bussy and focus to Time Void Energy, he come to here because he want learn about the Void Energy from Toni. I dont know why he doing it, as you know Toni is Void HighLord.","I've heard about Shadow and his alliance have coming to this world, i talk with Goxi about it and after that he going change and be like as now. A few days before, he tell me Shadow was plotting about stealing Void Energy.","Do something hero, do you wanna YOUR and OUR World destroyed by Shadow?! Absolutely NOT."})
                     end
           },
           {         name="Nila Kinara", -- 52
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/nilakinara.png",
                     area={{396,318},{396,318}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello "..player(id,"name")..", do you wanna swim?","Im shy, i wont swim today","good to see you here,im are newbie on swimming","I wish 'he' was here, i... i... *shy*"}
                     jaf.svj_msg2(id,violet.."[Nila Kinara] "..putih..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Bonnie", -- 53
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/npc_bonnie.png",
                     area={{383,317},{383,317}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello boy, wanna swim together?","I need refreshing my head, this place is good","Why joni dont come here? i saw Kinara right there","Well, maybe i can stay here for a day","Dont just looking me, go swim hero!"}
                     jaf.svj_msg2(id,hijau.."[Bonnie] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Stuart", -- 54
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/stuart.png",
                     area={{394,304},{394,304}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Oww boy, hi!","Dont ask me anything, dont you see me? im tired now","wat?"}
                     jaf.svj_msg2(id,hijau.."[Stuart] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Furty", -- 55
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/furty.png",
                     area={{389,304},{389,304}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"What im doing here? why im here? :/","You know me right? im furty the son of.... ummm.. The Legend TimeWarrior","Can you teach me senpai?? i wantttttt to swim good","Swimming.. Swimming.. OH YEAAAH!","Maybe we should fishing here, what kind of fish would we got? LoL","I hope joni and Rajawali are here, im.. im.. i really want fishing with them here","Ruuuuunnnnn... Im a MOOOUUNNSTAAR! HaHaHa."}
                     jaf.svj_msg2(id,hijau.."[Furty] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Kalum", -- 56
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/kalum.png",
                     area={{19,26},{19,26}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello human, is this place safe? :/","We need to talk more, but not at here!"}
                     jaf.svj_msg2(id,hijau.."[Kalum] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     jaf.kalumm(id)
                     end
           },
           {         name="Joni", -- 57
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/joni.png",
                     area={{292,199},{299,199}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Hello hero, how are you?","Weclome to my house","Dont be sad.."}
                     jaf.jonim(id)
                     jaf.svj_msg2(id,hijau.."[Joni] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Bean", -- 58
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/police.png",
                     area={{151,85},{151,85}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"What are you doing here?","This is not place for you","Keep be good people"}
                     menu(id,"Bean - Police,Go in to police office,Later")
                     jaf.svj_msg2(id,hijau.."[Bean] "..kuning..""..sqd_say[math.random(1,#sqd_say)])
                     end
           },
           {         name="Kilum", -- 59
                     nouse=false, -- false = used, true = no used
                     img=jaf.locgfx.."npc/kilum.png",
                     area={{235,20},{235,20}},
                     move=true,
                     scale=1,
                     emote=true,
                     say_scale={1,1},
                     action=function(id)
                     local sqd_say={"Nice to meet you! im sure you will dead here!","No one can stop me! I tell you to go home kid hahaha","Shadow has begin his invasion now! you all will be dead hero!","Poor kalum, he dont know what have he doing. He will be desotroyed"}
                     if jaf.shadowve[id]<25 then
                        jaf.svj_msg2(id,hijau.."[Kilum]"..kuning.." "..sqd_say[math.random(1,#sqd_say)])
                     else
                        jaf.svj_msg2(id,hijau.."[Kilum]"..kuning.." Fight me!")
                        parse("setpos "..id.." "..(348*32+16).." "..(338*32+16))
                     end
                     end
           },
}

function jaf.npc_remove(id)
          if jaf.npc_img[id]~=nil then
                  freeimage(jaf.npc_img[id])
                  jaf.npc_ac[id]=0
                  jaf.npc_img[id]=nil
          end
end

function jaf.npcsay_remove(id)
          if jaf.npcsay_img[id]~=nil then
                  freeimage(jaf.npcsay_img[id])
                  jaf.npcsay_img[id]=nil
          end
end

function jaf.npcemote_remove(id)
          if jaf.npcemote_img[id]~=nil then
                  freeimage(jaf.npcemote_img[id])
                  jaf.npcemote_img[id]=nil
          end
end

function jaf.npc_start()
         for i=1,#jaf.npc_list do
             if jaf.npc_list[i].nouse==nil or jaf.npc_list[i].nouse==false then
                jaf.npc_x[i]=jaf.npc_list[i].area[1][1]*32+16
                jaf.npc_y[i]=jaf.npc_list[i].area[1][2]*32+16
                jaf.npc_ac[i]=0
                jaf.npc_img[i]=nil
                jaf.npcsay_img[i]=nil
                jaf.npcemote_img[i]=nil
                if jaf.npc_list[i].press~=nil and jaf.npc_list[i].press then
                   jaf.npc_pressedpos[jaf.npc_list[i].press]=i
                end
                jaf.npc_spawn(i)
             end
         end
end

function jaf.npc_spawn(id)
         jaf.npc_remove(id)
         if jaf.npc_list[id] and jaf.npc_img[id]==nil then
                 jaf.npc_img[id]=image(jaf.npc_list[id].img,jaf.npc_x[id],jaf.npc_y[id],0)
                 imagepos(jaf.npc_img[id],jaf.npc_x[id],jaf.npc_y[id],0)
                 imagescale(jaf.npc_img[id],jaf.npc_list[id].scale,jaf.npc_list[id].scale)
                 ----- imagehitzone(jaf.npc_img[id],103,-32/2,-32/2,32,32)
                 ----- imghitzone should gave your server lagging
         end
end

function jaf.npc_move(id)
         if jaf.npc_list[id].nouse==nil or jaf.npc_list[id].nouse==false then
            if jaf.npc_list[id] and jaf.npc_img[id]~=nil and jaf.npc_ac[id]<1 then
                x1=jaf.npc_x[id]
                y1=jaf.npc_y[id]
                rnpcac=math.random(1,7)
                       if rnpcac==1 and jaf.npc_list[id].move==true and jaf.npcemote_img[id]==nil then
                          jaf.npcsay_remove(id)
                          jaf.npc_x[id]=math.random(jaf.npc_list[id].area[1][1],jaf.npc_list[id].area[2][1])*32+16
                          jaf.npc_y[id]=math.random(jaf.npc_list[id].area[1][2],jaf.npc_list[id].area[2][2])*32+16
                          rot = -math.deg(math.atan2((x1 - jaf.npc_x[id]), (y1 -jaf.npc_y[id])))
                          tween_rotate(jaf.npc_img[id],400,rot)
                          function jaf.npcmv(id,rot)
                             tween_move(jaf.npc_img[id],600,jaf.npc_x[id],jaf.npc_y[id],rot)
                          end
                          npcmv=timerEx(450,jaf.npcmv,1,id,rot)
                       elseif rnpcac==2 and jaf.npc_list[id].emote==true and jaf.npcemote_img[id]==nil then
                             jaf.npcemote_remove(id)
                             jaf.npcemote_img[id]=image(jaf.locgfx.."npc/emote"..math.random(1,13)..".png",x1,y1,1,0,200+id)
                             imagealpha(jaf.npcemote_img[id],0)
                             tween_alpha(jaf.npcemote_img[id],200,0.8)
                             function jaf.npcemott(id)
                                 if jaf.npcemote_img[id]~=nil then
                                    tween_alpha(jaf.npcemote_img[id],400,0)
                                 end
                                 function jaf.npcemott2(idd)
                                    jaf.npcemote_remove(idd)
                                 end
                                 npcemott2=timerEx(400,jaf.npcemott2,1,id)
                             end
                             npcemott=timerEx(2500,jaf.npcemott,1,id)
                       end
            end
         end
end

function jaf.npc_sayr(id,x, y, radiusx, radiusy)
	if not (radiusx and radiusy) then radiusx, radiusy = 320, 240 end
	local x1, y1, x2, y2 = x-radiusx, y-radiusy, x+radiusx, y+radiusy
		if player(id, 'x') >= x1 and player(id, 'x') <= x2 and player(id, 'y') >= y1 and player(id, 'y') <= y2 then
                 return true
		end
	return false
end