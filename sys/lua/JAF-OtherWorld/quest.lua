 --- Quest code
 --- 1 = kill player(s)
 --- 2 = kill monster(s)
 --- 3 = finding item(s)
 --- 4 = talk to NPC

 --- Quest id 
 --- <item id> for quest code 3
 --- <monster id> for quest code 2, example (qid=1)

jaf.list_quest={
               [1]={
                       title="New Year Food",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 200 Exp")
                            jaf.exp[id]=jaf.exp[id]+200
                       end,
                       prizeinfo="5K Shell & 200 Exp",
                       qinfo="We need food for the New Year.. I think Salmon is good",
                       qcode=3,
                       qid=116,
                       qitem=10
                   },
               [2]={
                       title="How we can eat it??",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1K shell")
                            jaf.exp[id]=jaf.exp[id]+200
                       end,
                       prizeinfo="1K shell & 200 Exp",
                       qinfo="OMG.. how we eat the Salmon.. umm we need woods",
                       qcode=3,
                       qid=104,
                       qitem=110
                   },
               [3]={
                       title="My wife & Childrens",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 5000 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="5K shell and 5000 Exp",
                       qinfo="Help me help me hero.. my wife and children was catched by King Fire Demon",
                       qcode=2,
                       qid=2,
                       qitem=3
                   },
               [4]={
                       title="Heal Formula",
                       prize=function(id)
                            jaf.give_shell(id,3000,nil,"[Server] "..hijau.."Quest Prize: 3K Shell and 2K Exp")
                            jaf.exp[id]=jaf.exp[id]+2000
                       end,
                       prizeinfo="3K Shell & 2000 Exp",
                       qinfo="Help me to get zombie heart.. i need it for healing my childrens",
                       qcode=3,
                       qid=134,
                       qitem=12
                   },
               [5]={
                       title="Rainbow energy",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                            jaf.give_item(id,130,1)
                       end,
                       prizeinfo="5K shell and 500 Exp and Meow cat pet",
                       qinfo="We need rainbow energy from meow cat.. bring it now",
                       qcode=2,
                       qid=1,
                       qitem=7
                   },
               [6]={
                       title="Wood regeneration formula",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K Shell & 500 Exp",
                       qinfo="Hero! we need regenration formula.. bring me wood.. quickly!",
                       qcode=3,
                       qid=104,
                       qitem=500
                   },
               [7]={
                       title="A hungry problem",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K Shell & 500 Exp",
                       qinfo="The demon has stolen our food.. please hero catch salmon for us",
                       qcode=3,
                       qid=116,
                       qitem=20
                   },
               [8]={
                       title="Where we stay? - Part 1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K Shell & 500 Exp",
                       qinfo="Sooo cruel!! they have destroy and fire our houses.. now we need to rebuild by leaf",
                       qcode=3,
                       qid=108,
                       qitem=1000
                   },
               [9]={
                       title="Where we stay? - Part 2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K Shell & 500 Exp",
                       qinfo="Some people need a bed for sleep.. we just need some rope to make it",
                       qcode=3,
                       qid=107,
                       qitem=80
                   },
               [10]={
                       title="Where we stay? - Part 3",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                            jaf.give_item(id,93,1)
                       end,
                       prizeinfo="5K Shell & 500 Exp and book of health",
                       qinfo="Our house is near finished.. we need some hard material now",
                       qcode=3,
                       qid=105,
                       qitem=250
                   },
               [11]={
                       title="Runner Demon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell and 500 Exp",
                       qinfo="Someone has saw a demon in his home... i need your help to kill the demon",
                       qcode=2,
                       qid=4,
                       qitem=1
                   },
               [12]={
                       title="Weapon Create",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell and 500 Exp",
                       qinfo="We must create our own weapon now.. bring me some steel",
                       qcode=3,
                       qid=106,
                       qitem=100
                   },
               [13]={
                       title="Demon weakness",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell and 500 Exp",
                       qinfo="Someone is tell me that he has slay a devil by zombie heart",
                       qcode=3,
                       qid=134,
                       qitem=100
                   },
               [14]={
                       title="The informan",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell and 500 Exp",
                       qinfo="My soldier hear that someone telling about King of Devil with Red Demon",
                       qcode=2,
                       qid=6,
                       qitem=2
                   },
               [15]={
                       title="The IFRIT",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 2500 Exp")
                            jaf.exp[id]=jaf.exp[id]+2500
                            jaf.give_item(id,135,1)
                       end,
                       prizeinfo="5K shell and 2500 Exp and Devil Wings",
                       qinfo="Ifrit is now weak.. we must kill that evil quickly",
                       qcode=2,
                       qid=7,
                       qitem=1
                   },
               [16]={
                       title="launch preparations EPS.1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="We lost of food for us.. we need some sandwich deluxe",
                       qcode=3,
                       qid=2,
                       qitem=200
                   },
               [17]={
                       title="launch preparations EPS.2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="Sandwich is not enough.. we need big meat too",
                       qcode=3,
                       qid=16,
                       qitem=150
                   },
               [18]={
                       title="launch preparations EPS.3",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="Our weapon ammo is empty.. we need arrow to protect us",
                       qcode=3,
                       qid=98,
                       qitem=80
                   },
               [19]={
                       title="launch preparations EPS.4",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="Maybe we need some of octopus for our travel time",
                       qcode=3,
                       qid=121,
                       qitem=20
                   },
               [20]={
                       title="launch preparations EPS.5",
                       prize=function(id)
                            jaf.give_shell(id,50000,nil,"[Server] "..hijau.."Quest Prize: 50K shell and 5000 Exp and Lightsaber")
                            jaf.exp[id]=jaf.exp[id]+5000
                            jaf.give_item(id,147,1)
                       end,
                       prizeinfo="50K shell and 5000 Exp and Lightsaber",
                       qinfo="We need to hiding if there is enemy.. we can use paint",
                       qcode=3,
                       qid=110,
                       qitem=50
                   },
               [21]={
                       title="The fuel",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="What the happen?? we lost of fuel.. bring it now from King fire demon",
                       qcode=2,
                       qid=2,
                       qitem=20
                   },
               [22]={
                       title="Last thing",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="oh no man.. i forgot salmon.. go catch the salmon",
                       qcode=3,
                       qid=116,
                       qitem=10
                   },
               [23]={
                       title="Key gate",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                            jaf.give_item(id,145,1)
                       end,
                       prizeinfo="5K shell and 1000 Exp and Demon horse",
                       qinfo="No man! we dont have the key.. ask stuart for it",
                       qcode=2,
                       qid=5,
                       qitem=1
                   },
               [24]={
                       title="Alien coming",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="There are alien in the ship... we need to kill it",
                       qcode=2,
                       qid=8,
                       qitem=1
                   },
               [25]={
                       title="Make Barricade",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need wood to make barricade for us",
                       qcode=3,
                       qid=104,
                       qitem=1000
                   },
               [26]={
                       title="Key of Control room",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                            jaf.give_item(id,156,1)
                       end,
                       prizeinfo="5K Shell & 1000 Exp and Dimension Keeper Class",
                       qinfo="There is still monster in the ship but we need key to go there",
                       qcode=3,
                       qid=149,
                       qitem=1
                   },
               [27]={
                       title="Last Alien",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                            jaf.give_item(id,136,1)
                       end,
                       prizeinfo="5K shell and 1000 Exp and Burn Skull Machete",
                       qinfo="We must clear the ship.. we must slay that Evil Alien",
                       qcode=2,
                       qid=9,
                       qitem=2
                   },
               [28]={
                       title="Patch Key",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+3000
                            jaf.give_item(id,149,1)
                       end,
                       prizeinfo="5K shell and 3000 Exp and Starship Key",
                       qinfo="There are key patchs on mantislen",
                       qcode=2,
                       qid=10,
                       qitem=20
                   },
               [29]={
                       title="My Weapon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="Ohh hero! i need you to find my weapon in treasure chest",
                       qcode=3,
                       qid=181,
                       qitem=100
                   },
               [30]={
                       title="Didnt founded",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="I didnt found my weapon in the treasure chest.. i need rope :p",
                       qcode=3,
                       qid=107,
                       qitem=100
                   },
               [31]={
                       title="Create new weapon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="Okey then.. i want to make new weapon.. please find me wood",
                       qcode=3,
                       qid=104,
                       qitem=500
                   },
               [32]={
                       title="Some material",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="I need some steel to make this weapon",
                       qcode=3,
                       qid=106,
                       qitem=100
                   },
               [33]={
                       title="Tired",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="This thing is make me tired.. i want some pizza",
                       qcode=3,
                       qid=6,
                       qitem=50
                   },
               [34]={
                       title="Example weapon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="I was confused by this weapon.. i need cross bow for example",
                       qcode=3,
                       qid=48,
                       qitem=10
                   },
               [35]={
                       title="Where is my tool?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="I lost tool for make this weapon.. my chainsaw is lost!!!",
                       qcode=3,
                       qid=60,
                       qitem=30
                   },
               [36]={
                       title="Element require",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="Take the lava element from IMP! i need it",
                       qcode=2,
                       qid=12,
                       qitem=20
                   },
               [37]={
                       title="Element require Part 2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="We need dark energy from slenderman",
                       qcode=2,
                       qid=14,
                       qitem=2
                   },
               [38]={
                       title="Some sample weapon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need to  test Claw Beast weapon.. take it from ClawBeast Monster",
                       qcode=3,
                       qid=209,
                       qitem=1
                   },
               [39]={
                       title="Final Require item",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need some Acid Bottle to fit this weapon",
                       qcode=3,
                       qid=201,
                       qitem=50
                   },
               [40]={
                       title="Item Get Lost",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell and 1000 Exp",
                       qinfo="The weapon was stolen by Demon.. find it back",
                       qcode=2,
                       qid=4,
                       qitem=7
                   },
               [41]={
                       title="Where is my weapon?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp and Snake Staff")
                            jaf.exp[id]=jaf.exp[id]+1000
                            jaf.give_item(id,202,1)
                       end,
                       prizeinfo="5K shell and 1000 Exp and Snake Staff",
                       qinfo="Demon not holding our weapon.. im sure the weapon is hold by Ultra Celcius",
                       qcode=2,
                       qid=11,
                       qitem=1
                   },
               [42]={
                       title="My friend gift",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shell and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                            jaf.give_item(id,195,1)
                       end,
                       prizeinfo="500 Shell & 100 Exp & Blazing stone binder",
                       qinfo="Find some Fragments of Magical Batu for the gift",
                       qcode=3,
                       qid=200,
                       qitem=500
                   },
               [43]={
                       title="Rebuild Spirit Altar EPS 1",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Flying Diablo destroys our spirit altar. Rebuild with woods.",
                       qcode=3,
                       qid=104,
                       qitem=1000
                   },
               [44]={
                       title="Rebuild Spirit Altar EPS 2",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="We forget the most important thing to build. Find stones.",
                       qcode=3,
                       qid=105,
                       qitem=500
                   },
               [45]={
                       title="Rebuild Spirit Altar EPS 3",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Woods cannot connect themselves. Find steel to make nails.",
                       qcode=3,
                       qid=106,
                       qitem=100
                   },
               [46]={
                       title="Rebuild Spirit Altar EPS 4",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Spirits won't come unless we offer them golden sharks. Get 5 golden sharks.",
                       qcode=3,
                       qid=119,
                       qitem=5
                   },
               [47]={
                       title="Rebuild Spirit Altar EPS 5",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Spirits won't only with golden sharks.. octopus is great idea. Get 15 octopuses.",
                       qcode=3,
                       qid=121,
                       qitem=15
                   },
               [48]={
                       title="Talk to The Spirits",
                       prize=function(id)
                            jaf.give_shell(id,10000,nil,"[Server] "..hijau.."Quest Prize: 10000 shell and 5000 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="10000 Shell & 5000 Exp",
                       qinfo="Spirits never answer us with bare hands. Get 2 Sunflowers.",
                       qcode=3,
                       qid=212,
                       qitem=2
                   },
               [49]={
                       title="Answer From the Spirits EPS 1",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="A wolf has cursed by dead spirit.. kill it. Kill 1 Savage Wolf.",
                       qcode=2,
                       qid=20,
                       qitem=1
                   },
               [50]={
                       title="Answer From the Spirits EPS 2",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Spirit likes Fragment of Magical Batu. Get 200 Fragment of Magical Batu.",
                       qcode=3,
                       qid=200,
                       qitem=200
                   },
               [51]={
                       title="Answer From the Spirits EPS 3",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="1000 Shell & 500 Exp",
                       qinfo="Spirits told you to revange Diablo. Kill 1 Diablo.",
                       qcode=2,
                       qid=17,
                       qitem=1
                   },
               [52]={
                       title="Answer From the Spirits EPS 4",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell, 500 Exp and Jack O Lantern Pet")
                            jaf.exp[id]=jaf.exp[id]+500
			    jaf.give_item(id,235,1)
                       end,
                       prizeinfo="1000 Shell 500 Exp & Jack O Lantern Pet",
                       qinfo="Before Spirits release Dead Curse offer them golden sharks again.",
                       qcode=3,
                       qid=119,
                       qitem=10
                   },
               [53]={
                       title="Last Thing",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell, 500 Exp and 500 Silver Crystals")
                            jaf.exp[id]=jaf.exp[id]+500
		  	    jaf.crystal[id] = jaf.crystal[id]+500
                       end,
                       prizeinfo="1000 Shell 500 Exp & 500 SC",
                       qinfo="We need to kill cursed angel. Kill 2 Death Angel",
                       qcode=2,
                       qid=22,
                       qitem=2
                   },
               [54]={
                       title="Gift to The Spirits",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shell & 1500 Exp")
                            jaf.exp[id]=jaf.exp[id]+1500
                       end,
                       prizeinfo="5000 Shell 1500 Exp",
                       qinfo="Lets make a gift to the spirits by giving them 500 treasure chests.",
                       qcode=3,
                       qid=181,
                       qitem=500
                   },
               [55]={
                       title="Afraid of Headless People",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 8000 Exp")
                            jaf.exp[id]=jaf.exp[id]+8000
                       end,
                       prizeinfo="5K shell and 8000 Exp",
                       qinfo="Sumo afraid of headless people. Kill headless warriors many time.",
                       qcode=2,
                       qid=18,
                       qitem=4
                   },
               [56]={
                       title="Diablo Madness",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1K shell, 500 Exp, and 1 Dead Spirit")
                            jaf.exp[id]=jaf.exp[id]+500
			    jaf.give_item(id,233,1)
                       end,
                       prizeinfo="1K shell 500 Exp and 1 Dead Spirit",
                       qinfo="Sumo's friend killed by Diablo. Take his revange!",
                       qcode=2,
                       qid=17,
                       qitem=7
                   },
               [57]={
                       title="What a Though Body",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shell and 10000 Exp")
                            jaf.exp[id]=jaf.exp[id]+10000
                       end,
                       prizeinfo="500 shell and 10K EXP",
                       qinfo="Sumo's afraid of golem because it is big and horrible.",
                       qcode=2,
                       qid=16,
                       qitem=5
                   },
               [58]={
                       title="Walking Dead",
                       prize=function(id)
                            jaf.give_shell(id,50,nil,"[Server] "..hijau.."Quest Prize: 50 shell and 5000 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="50 shell and 5K EXP",
                       qinfo="Sumo's saw a dead is walking in the cave. KIll zombie 18x",
                       qcode=2,
                       qid=3,
                       qitem=18
                   },
               [59]={
                       title="Mystery Behind the Pumkin Mask",
                       prize=function(id)
                            jaf.give_shell(id,10,nil,"[Server] "..hijau.."Quest Prize: 10 shell and 13000 Exp")
                            jaf.exp[id]=jaf.exp[id]+13000
                       end,
                       prizeinfo="10 shell and 13K EXP",
                       qinfo="Sumo's belongings stealed by pumkin headed man.",
                       qcode=2,
                       qid=30,
                       qitem=7
                   },
               [60]={
                       title="Need Chiken Legs",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and UFO pet")
                            jaf.give_item(id,289,1)
                       end,
                       prizeinfo="1000 shell and UFO pet",
                       qinfo="That man needs a lot of chiken legs. Help him!",
                       qcode=3,
                       qid=269,
                       qitem=250
                   },
               [61]={
                       title="Dead Spirit Collection",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shell and Surgeon Weapon")
                            jaf.give_item(id,219,1)
                       end,
                       prizeinfo="5000 shell and Surgeon Weapon",
                       qinfo="That man have a special weapon. Exchange it with dead spirits.",
                       qcode=3,
                       qid=233,
                       qitem=180
                   },
               [62]={
                       title="Garnet Collection",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shell and Fragment of Void Blade")
                            jaf.give_item(id,298,1)
                       end,
                       prizeinfo="5000 shell and Fragment of Void Blade",
                       qinfo="That man have a special weapon's fragment. Bring what he loves: garnet stones",
                       qcode=3,
                       qid=272,
                       qitem=200
                   },
               [63]={
                       title="Dinner with Salmon",
                       prize=function(id)
                            jaf.give_shell(id,20000,nil,"[Server] "..hijau.."Quest Prize: 20000 shell and 100 baits")
                            jaf.give_item(id,113,100)
                       end,
                       prizeinfo="20000 shell and 100 baits",
                       qinfo="He wants to dinner with salmon but he's too lazy to catch them.",
                       qcode=3,
                       qid=116,
                       qitem=4
                   },
               [64]={
                       title="Yesterday was So Hot",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 1x Mysterious Count Sword")
                            jaf.give_item(id,215,1)
                       end,
                       prizeinfo="1000 shell and 1x Mysterious Count Sword",
                       qinfo="Yesterday was so hot. Bring him ice shards",
                       qcode=3,
                       qid=228,
                       qitem=360
                   },
               [65]={
                       title="Golden Shark Statues",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 2x Dead Spirits")
                            jaf.give_item(id,233,2)
                       end,
                       prizeinfo="1000 shell and 2x Dead Spirits",
                       qinfo="His castle is not fulfilled by statues yet. Give him Golden Sharks.",
                       qcode=3,
                       qid=119,
                       qitem=5
                   },
               [66]={
                       title="I am A Musical",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 1x Musical Silver Trophy")
                            jaf.give_item(id,231,1)
                       end,
                       prizeinfo="1000 shell and 1x Musical Silver Trophy",
                       qinfo="He was famous musical. Prove that you are musical too by getting guitar strings.",
                       qcode=3,
                       qid=203,
                       qitem=150
                   },
               [67]={
                       title="A Fake Musical",
                       prize=function(id)
                            jaf.give_shell(id,1000,nil,"[Server] "..hijau.."Quest Prize: 1000 shell and 1x Musical Bronze Trophy")
                            jaf.give_item(id,232,1)
                       end,
                       prizeinfo="1000 shell and 1x Musical Bronze Trophy",
                       qinfo="He will be happy if I play a rock band record.",
                       qcode=3,
                       qid=302,
                       qitem=1
                   },
               [68]={
                       title="Cursed Warrior",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shell, 10000 Exp, and 1 Spirit Crystal")
                            jaf.exp[id]=jaf.exp[id]+10000
			    jaf.give_item(id,300,1)
                       end,
                       prizeinfo="5000 shell 10000 EXP and 1 Spirit Crystal",
                       qinfo="Jester turns innocent warrior into cursed warrior Dark God.",
                       qcode=2,
                       qid=23,
                       qitem=9
                   },
               [69]={
                       title="Catching Jester Minions",
                       prize=function(id)
                            jaf.give_shell(id,15000,nil,"[Server] "..hijau.."Quest Prize: 15000 shell, 25000 Exp, and 1 Death Pen")
                            jaf.exp[id]=jaf.exp[id]+25000
			    jaf.give_item(id,319,1)
                       end,
                       prizeinfo="15000 shell 25000 EXP and 1 Death Pen",
                       qinfo="Jester summons his minions. Catch his minions by killing him.",
                       qcode=2,
                       qid=29,
                       qitem=2
                   },
               [70]={
                       title="Heart Made of Stone",
                       prize=function(id)
                            jaf.give_shell(id,15000,nil,"[Server] "..hijau.."Quest Prize: 15000 shell, 8000 Exp, and 1 Death Cover")
                            jaf.exp[id]=jaf.exp[id]+8000
			    jaf.give_item(id,320,1)
                       end,
                       prizeinfo="15000 shell 8000 EXP and 1 Death Cover",
                       qinfo="There is Titan Golem not far from garnet palace. Kill him!",
                       qcode=2,
                       qid=34,
                       qitem=32
                   },
               [71]={
                       title="Trying to Get Secret Formula",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shel, and 1000 Exp, and 1x Fake Hawk Secret Club Entry")
                            jaf.exp[id]=jaf.exp[id]+1000
			    jaf.give_item(id,314,1)
                       end,
                       prizeinfo="5K Shell 1000 Exp and Fake Hawk Secret Club Entry",
                       qinfo="This man always stand here because he wants the secret formula.",
                       qcode=3,
                       qid=309,
                       qitem=1
                   },
               [72]={
                       title="Help me!!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K Shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="I need a lot of chicken feather to create a jacket",
                       qcode=3,
                       qid=288,
                       qitem=300
                   },
               [73]={
                       title="My friend hurts",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="Oh no.. my friend is hurts.. i need acid potion for heal him",
                       qcode=3,
                       qid=201,
                       qitem=20
                   },
               [74]={
                       title="Food for My pet",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="My pet is hungry hero!! i need zombie arm.. please bring it for my pet",
                       qcode=3,
                       qid=279,
                       qitem=2
                   },
               [75]={
                       title="Now im hungry",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="You make me hungry... now you must give me chocolate banana un... un...",
                       qcode=3,
                       qid=274,
                       qitem=50
                   },
               [76]={
                       title="Trying to cooking",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="I want to try cooking something from Krusty Crab Recipe.. bring it for me and my friend",
                       qcode=3,
                       qid=309,
                       qitem=2
                   },
               [77]={
                       title="My Food!!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="Someone are steal my food.. and i saw he gave it to Golem.. bring it back please hero!",
                       qcode=2,
                       qid=16,
                       qitem=1
                   },
               [78]={
                       title="LightKnight: Part 1 ",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="We need Claw Beast to used for find the LightKnight",
                       qcode=3,
                       qid=209,
                       qitem=5
                   },
               [79]={
                       title="LightKnight: Part 2 ",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="We need sunflower to eat",
                       qcode=3,
                       qid=212,
                       qitem=45
                   },
               [80]={
                       title="Find the path: Part 1 ",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="I think the lightkingt path are Bringed by Ultra Celcius",
                       qcode=2,
                       qid=11,
                       qitem=3
                   },
               [81]={
                       title="Find the path: Final ",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                            jaf.give_item(id,222,1)
                       end,
                       prizeinfo="5K shell 1000 EXP and Path of LightKnight Diamond",
                       qinfo="We are fooled by Ultra Celcius.. the path is now in Slenderman",
                       qcode=2,
                       qid=14,
                       qitem=2
                   },
               [82]={
                       title="Medicine Material eps 1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need some of acid potion",
                       qcode=3,
                       qid=201,
                       qitem=20
                   },
               [83]={
                       title="Medicine Material eps 2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="This potion is not fit without bones",
                       qcode=3,
                       qid=262,
                       qitem=70
                   },
               [84]={
                       title="Medicine Material Final",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need some of Zombie Finger to complete this",
                       qcode=3,
                       qid=264,
                       qitem=10
                   },
               [85]={
                       title="Food Needed eps 1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="Before begin this adventure i think we need chocolate banana",
                       qcode=3,
                       qid=274,
                       qitem=10
                   },
               [86]={
                       title="Food Needed eps 2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="We need spoon to eat the chocolate banana",
                       qcode=3,
                       qid=275,
                       qitem=10
                   },
               [87]={
                       title="Food Needed eps 3",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="Chicken is really important!",
                       qcode=3,
                       qid=277,
                       qitem=20
                   },
               [88]={
                       title="Food Needed eps 4",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="How about candy cane? we can bring it on",
                       qcode=3,
                       qid=278,
                       qitem=5
                   },
               [89]={
                       title="Food Needed Final",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="Our chicken is stolen by sheep.. take back it hero",
                       qcode=2,
                       qid=24,
                       qitem=20
                   },
               [90]={
                       title="How to take the crystal eps 1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="We need 2 copies of crystal.. golem had it",
                       qcode=2,
                       qid=16,
                       qitem=2
                   },
               [91]={
                       title="How to take the crystal Final",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5K shell and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K Shell & 1000 Exp",
                       qinfo="Take clawbeast.. We cant take the crystal of Time if we just use hand",
                       qcode=3,
                       qid=209,
                       qitem=1
                   },
               [92]={
                       title="Food forgotten eps 1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="We forget to bring baby salmon",
                       qcode=3,
                       qid=115,
                       qitem=10
                   },
               [93]={
                       title="Food forgotten eps 2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="Octopus are forgotten",
                       qcode=3,
                       qid=121,
                       qitem=10
                   },
               [94]={
                       title="Food forgotten Final",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="The last thing of food we need is jelly of meow cat",
                       qcode=2,
                       qid=1,
                       qitem=10
                   },
               [95]={
                       title="Why always key?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 1000 Exp")
                            jaf.exp[id]=jaf.exp[id]+1000
                       end,
                       prizeinfo="5K shell 1000 EXP",
                       qinfo="The door is need key.. im sure croc man have it",
                       qcode=2,
                       qid=28,
                       qitem=5
                   },
               [96]={
                       title="Shadow Soldier!!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 10000 Exp")
                            jaf.exp[id]=jaf.exp[id]+10000
                            jaf.give_item(id,182,1)
                       end,
                       prizeinfo="5K shell 10000 EXP and TimeWarrior Class",
                       qinfo="Monster of Shadow has arrive to SAFEROOM.. kill him",
                       qcode=2,
                       qid=36,
                       qitem=1
                   },
               [97]={
                       title="New History!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp")
                            jaf.exp[id]=jaf.exp[id]+50
                       end,
                       prizeinfo="5K shell 50 EXP",
                       qinfo="Write our history on paper",
                       qcode=3,
                       qid=317,
                       qitem=10
                   },
               [98]={
                       title="So easy!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp and 3x legion crystals")
                            jaf.exp[id]=jaf.exp[id]+50
                            jaf.give_item(id,340,3)
                       end,
                       prizeinfo="5K shell 50 EXP and 3 legion crystals",
                       qinfo="I hear crystals of legion are in treasure chest",
                       qcode=3,
                       qid=181,
                       qitem=10
                   },
               [99]={
                       title="So surprised me",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp and 10x legion crystals")
                            jaf.exp[id]=jaf.exp[id]+50
                            jaf.give_item(id,340,10)
                       end,
                       prizeinfo="5K shell 50 EXP and 10 legion crystals",
                       qinfo="Many of legion crystals from Dead angle",
                       qcode=2,
                       qid=22,
                       qitem=1
                   },
               [100]={
                       title="Let me see",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp and 50x legion crystals")
                            jaf.exp[id]=jaf.exp[id]+50
                            jaf.give_item(id,340,50)
                       end,
                       prizeinfo="5K shell 50 EXP and 50 legion crystals",
                       qinfo="Im really interesting about dead spirit",
                       qcode=3,
                       qid=233,
                       qitem=10
                   },
               [101]={
                       title="A Zombie Legion?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp and 5x legion crystals")
                            jaf.exp[id]=jaf.exp[id]+50
                            jaf.give_item(id,340,5)
                       end,
                       prizeinfo="5K shell 50 EXP and 5 legion crystals",
                       qinfo="Bring some zombie heart to me haha!",
                       qcode=3,
                       qid=134,
                       qitem=20
                   },
               [102]={
                       title="A killer",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50 Exp and 5x legion crystals")
                            jaf.exp[id]=jaf.exp[id]+50
                            jaf.give_item(id,340,8)
                       end,
                       prizeinfo="5K shell 50 EXP and 8 legion crystals",
                       qinfo="Kill few peoples me",
                       qcode=1,
                       qid=134,
                       qitem=10
                   },
               [103]={
                       title="Friendship EPS.1",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="Talk to joni in Victory Camp to make friendship with me",
                       qcode=4,
                       qid=21,
                       qitem=1
                   },
               [104]={
                       title="Friendship EPS.2",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="Talk to Toni Altar in Victory Camp to make friendship with me",
                       qcode=4,
                       qid=1,
                       qitem=1
                   },
               [105]={
                       title="Friendship EPS.3",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="Talk to furty in Victory Camp to make friendship with me",
                       qcode=4,
                       qid=19,
                       qitem=1
                   },
               [106]={
                       title="Friendship EPS.4",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="Talk to Rajawali in Bandung City to make friendship with me",
                       qcode=4,
                       qid=41,
                       qitem=1
                   },
               [107]={
                       title="Friendship FINAL",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="Talk to Kakek Zuna in Victory Camp to make friendship with me",
                       qcode=4,
                       qid=4,
                       qitem=1
                   },
               [108]={
                       title="Hero Slayer",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Show me your skill.. kill some hero here",
                       qcode=1,
                       qid=1,
                       qitem=5
                   },
               [109]={
                       title="Sample blood",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Kill few zombies at lava cave.. i wanna some sample",
                       qcode=2,
                       qid=3,
                       qitem=15
                   },
               [110]={
                       title="Test blood",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Now the time for test the blood.. bring me walker blood",
                       qcode=2,
                       qid=38,
                       qitem=30
                   },
               [111]={
                       title="Dead potion",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="i need dead potion that you should take it from skeleton",
                       qcode=2,
                       qid=27,
                       qitem=12
                   },
               [112]={
                       title="Body Check",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="We need walker body... bring me it",
                       qcode=2,
                       qid=38,
                       qitem=10
                   },
               [113]={
                       title="The Acid",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="I will finish this research about walker virus.. i need acid potion for it",
                       qcode=3,
                       qid=201,
                       qitem=50
                   },
               [114]={
                       title="Why not working?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 500 Exp")
                            jaf.exp[id]=jaf.exp[id]+500
                       end,
                       prizeinfo="5K shell 500 EXP",
                       qinfo="This acid potions are not working to the blood.. we need few Zombie Heart to check",
                       qcode=3,
                       qid=134,
                       qitem=50
                   },
               [115]={
                       title="Ask rajawali",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="5K shell 5000 EXP",
                       qinfo="Still not working.. ask rajawali at labyrinth please",
                       qcode=4,
                       qid=20,
                       qitem=1
                   },
               [116]={
                       title="Instructions",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Find the key to control room from crocolight",
                       qcode=2,
                       qid=5,
                       qitem=1
                   },
               [117]={
                       title="Net of Spider",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Find net of spider in haunted house",
                       qcode=2,
                       qid=39,
                       qitem=15
                   },
               [118]={
                       title="Freezz!!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Bring some freeze magic potion from ice wolf",
                       qcode=2,
                       qid=19,
                       qitem=10
                   },
               [119]={
                       title="Fire Energy Catch",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 50000 Exp")
                            jaf.exp[id]=jaf.exp[id]+50000
                       end,
                       prizeinfo="5K shell 50000 EXP",
                       qinfo="Find Fire Energy from ultra celcius.. its very important",
                       qcode=2,
                       qid=11,
                       qitem=1
                   },
               [120]={
                       title="Ink?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="we need some ink.. its from hawk club at bandung city",
                       qcode=3,
                       qid=321,
                       qitem=2
                   },
               [121]={
                       title="Deadly Animal Head",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="We need 4 head of Aneha and it will finish the research",
                       qcode=2,
                       qid=41,
                       qitem=4
                   },
               [122]={
                       title="The Dark Energy",
                       prize=function(id)
                            local der=math.random(2,15)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp and "..der.." Dark Energy")
                            jaf.exp[id]=jaf.exp[id]+100
                            jaf.give_item(id,352,der)
                            local rqr=math.random(1,15)
                            if rqr==4 then
                               jaf.give_item(id,365,2)
                               svj_msg2(id,"[Server] "..hijau.."Quest Prize: Time Void Energy")
                            end
                       end,
                       prizeinfo="5K shell 100 EXP and Dark Energy and If lucky: 2x Time Void Energy",
                       qinfo="Find dark energy from Death Angle",
                       qcode=2,
                       qid=22,
                       qitem=1
                   },
               [123]={
                       title="Useless??",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="is treasure chest really useless? lets find it",
                       qcode=3,
                       qid=181,
                       qitem=20
                   },
               [124]={
                       title="That fish Really Dangerous ?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="I dont believe shark is dangerous.. i need to check it",
                       qcode=3,
                       qid=120,
                       qitem=5
                   },
               [125]={
                       title="...",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="I cant say anything for now.. but i wanna kill some people here.. so help me",
                       qcode=1,
                       qid=321,
                       qitem=20
                   },
               [126]={
                       title="Im not being bad people",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="im really sorry to ask you for kill people.. so bring me coca cola please",
                       qcode=3,
                       qid=334,
                       qitem=20
                   },
               [127]={
                       title="Lets slay a monster",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="I wanna slay ultra celcius.. that monster is strong right? so lets kill it",
                       qcode=2,
                       qid=11,
                       qitem=2
                   },
               [128]={
                       title="Tired!!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Im now so thristy.. i want ice cream cone",
                       qcode=3,
                       qid=276,
                       qitem=1
                   },
               [129]={
                       title="Wanna eat something",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Give me chicken leg.. i wanna cook it",
                       qcode=3,
                       qid=269,
                       qitem=25
                   },
               [130]={
                       title="A Dark Energy?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="What is dark energy? ask to goxi please",
                       qcode=4,
                       qid=50,
                       qitem=1
                   },
               [131]={
                       title="Who is irvan?",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Find irvan and talk to him.. he always stay at hospital",
                       qcode=4,
                       qid=36,
                       qitem=1
                   },
               [132]={
                       title="Im hungry",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Bring me many of pancake",
                       qcode=3,
                       qid=339,
                       qitem=50
                   },
               [133]={
                       title="Goxi say",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="Goxi say.. i can learn dark energy after slay slenderman",
                       qcode=2,
                       qid=14,
                       qitem=5
                   },
               [134]={
                       title="A pet for me",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="5K shell 100 EXP",
                       qinfo="I want pets a baby salmon... catch it for me",
                       qcode=3,
                       qid=115,
                       qitem=10
                   },
               [135]={
                       title="The Void Guard",
                       prize=function(id)
                            if jaf.usgn[id]>0 then
                               jaf.freeitemb[id]=jaf.freeitemb[id]+1
                               jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 10000 Exp and Free-Item Ticket")
                            end
                            jaf.exp[id]=jaf.exp[id]+10000
                       end,
                       prizeinfo="5K shell 10000 EXP and Free-Item Ticket for LOGIN user",
                       qinfo="After learn dark energy.. goxi tell me to kill sephirot at the void",
                       qcode=2,
                       qid=43,
                       qitem=1
                   },
               [136]={
                       title="Last for you",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="5K shell 5000 EXP",
                       qinfo="I want eat salmon!",
                       qcode=3,
                       qid=116,
                       qitem=20
                   },
               [137]={
                       title="Make a deal!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp and BlazingAxe pet")
                            jaf.exp[id]=jaf.exp[id]+5000
                            jaf.give_item(id,392,1)
                       end,
                       prizeinfo="5K shell 5000 EXP and BlazingAxe Pet",
                       qinfo="Find 500 Gold and bring it to me!",
                       qcode=3,
                       qid=387,
                       qitem=500
                   },
               [138]={
                       title="I need food",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 4000 Exp")
                            jaf.exp[id]=jaf.exp[id]+4000
                       end,
                       prizeinfo="5K shell 4000 EXP",
                       qinfo="Im really hungry. Please give me Chocolate banana",
                       qcode=3,
                       qid=274,
                       qitem=10
                   },
               [139]={
                       title="Im a good boy",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp and 100 Arrows")
                            jaf.exp[id]=jaf.exp[id]+500
                            jaf.give_item(id,98,100)
                       end,
                       prizeinfo="5K shell 500 EXP and 100 Arrows",
                       qinfo="Give me some treasure chests and i will give you arrows",
                       qcode=3,
                       qid=181,
                       qitem=20
                   },
               [140]={
                       title="Forgotten Monster?!",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp and Antlers")
                            jaf.exp[id]=jaf.exp[id]+500
                            jaf.give_item(id,40,1)
                       end,
                       prizeinfo="5K shell 500 EXP and Antlers",
                       qinfo="I have Antlers.. i will give it if you kill Croc Man for me",
                       qcode=2,
                       qid=28,
                       qitem=10
                   },
               [141]={
                       title="My legendary weapon",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 5000 Exp and BlazingAxe pet")
                            jaf.exp[id]=jaf.exp[id]+5000
                            jaf.give_item(id,390,1)
                       end,
                       prizeinfo="5K shell 5000 EXP and Blazing DoubleAxe",
                       qinfo="Legendary Weapon just for who can give me 2K of Crystals",
                       qcode=3,
                       qid=388,
                       qitem=2000
                   },
               [142]={
                       title="being a good human",
                       prize=function(id)
                            jaf.give_shell(id,2000,nil,"[Server] "..hijau.."Quest Prize: 2000 shells and 1500 Exp")
                            jaf.exp[id]=jaf.exp[id]+1500
                       end,
                       prizeinfo="2K shell 1500 EXP",
                       qinfo="I see pak ibnu need a help. So lets help him",
                       qcode=2,
                       qid=37,
                       qitem=1
                   },
               [143]={
                       title="Hunting",
                       prize=function(id)
                            jaf.give_shell(id,5000,nil,"[Server] "..hijau.."Quest Prize: 5000 shells and 8000 Exp")
                            jaf.exp[id]=jaf.exp[id]+8000
                       end,
                       prizeinfo="5K shell 8000 EXP",
                       qinfo="Now i need Fragments of Magical batu",
                       qcode=3,
                       qid=200,
                       qitem=20
                   },
               [144]={
                       title="Toni respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Toni that shadow is coming",
                       qcode=4,
                       qid=1,
                       qitem=1
                   },
               [145]={
                       title="Zuna respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Zuna that shadow is coming",
                       qcode=4,
                       qid=4,
                       qitem=1
                   },
               [146]={
                       title="Jack respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Officer Jack that shadow is coming",
                       qcode=4,
                       qid=12,
                       qitem=1
                   },
               [147]={
                       title="Furty respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Furty that shadow is coming",
                       qcode=4,
                       qid=19,
                       qitem=1
                   },
               [148]={
                       title="Rajawali respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Rajawli in Labyrinth that shadow is coming",
                       qcode=4,
                       qid=20,
                       qitem=1
                   },
               [149]={
                       title="Joni respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Joni that shadow is coming",
                       qcode=4,
                       qid=21,
                       qitem=1
                   },
               [150]={
                       title="Nila Kinara respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Nila Kinara in pool that shadow is coming",
                       qcode=4,
                       qid=52,
                       qitem=1
                   },
               [151]={
                       title="Kalum respect",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to Kalum that shadow is coming",
                       qcode=4,
                       qid=56,
                       qitem=1
                   },
               [152]={
                       title="First Act",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Kalum said we need Plastics to make a shield",
                       qcode=3,
                       qid=243,
                       qitem=100
                   },
               [153]={
                       title="Other Material",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Joni said we have to combine the shield with bamboo",
                       qcode=3,
                       qid=247,
                       qitem=100
                   },
               [154]={
                       title="Goxi Suggestion",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Ask goxi what we need to kill kilum",
                       qcode=4,
                       qid=50,
                       qitem=1
                   },
               [155]={
                       title="The Command",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Golden Helm should make we strong",
                       qcode=3,
                       qid=331,
                       qitem=1
                   },
               [156]={
                       title="The Rainbow Energy",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Get rainbow energy from meow cat",
                       qcode=2,
                       qid=1,
                       qitem=10
                   },
               [157]={
                       title="Flame Energy",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Take flame energy from King fire demon",
                       qcode=2,
                       qid=2,
                       qitem=1
                   },
               [158]={
                       title="Antibody",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Goxi tell us we need jade stone for make an antibody",
                       qcode=3,
                       qid=271,
                       qitem=1
                   },
               [159]={
                       title="Make Antibody Stronger",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Combine it with Acid",
                       qcode=3,
                       qid=201,
                       qitem=10
                   },
               [160]={
                       title="Make Antibody more Stronger",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Combine it with Fragments of magical batu",
                       qcode=3,
                       qid=200,
                       qitem=50
                   },
               [161]={
                       title="Save Antibody",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="We need Aqua Bottle to place the antibody",
                       qcode=3,
                       qid=244,
                       qitem=10
                   },
               [162]={
                       title="Slenderman suit",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Slenderman suit is very strong.. get it from slenderman",
                       qcode=2,
                       qid=14,
                       qitem=1
                   },
               [163]={
                       title="Combine the suit",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="We need claw beast to combine it with slenderman suit",
                       qcode=3,
                       qid=209,
                       qitem=1
                   },
               [164]={
                       title="Kill The Goblins",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="We have to kill goblins in factory",
                       qcode=2,
                       qid=44,
                       qitem=10
                   },
               [165]={
                       title="Tactic",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="We need ice shard to defeat lucifer",
                       qcode=3,
                       qid=228,
                       qitem=30
                   },
               [166]={
                       title="Lucifer Rage",
                       prize=function(id)
                            jaf.give_shell(id,50000,nil,"[Server] "..hijau.."Quest Prize: 50k shells and 7000 Exp and Evolved Vampire")
                            jaf.exp[id]=jaf.exp[id]+7000
                            jaf.give_item(id,418,1)
                       end,
                       prizeinfo="50k shell 7000 EXP and Evolved Vampire Class",
                       qinfo="Defeat Lucifer",
                       qcode=2,
                       qid=45,
                       qitem=1
                   },
               [167]={
                       title="Last warning",
                       prize=function(id)
                            jaf.give_shell(id,500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+100
                       end,
                       prizeinfo="500 shell 100 EXP",
                       qinfo="Tell to kilum this is the last warning",
                       qcode=4,
                       qid=59,
                       qitem=1
                   },
               [168]={
                       title="Kill Kilum",
                       prize=function(id)
                            jaf.give_shell(id,1500,nil,"[Server] "..hijau.."Quest Prize: 500 shells and 100 Exp")
                            jaf.exp[id]=jaf.exp[id]+5000
                       end,
                       prizeinfo="1500 shell 5000 EXP",
                       qinfo="Defeat Kilum",
                       qcode=2,
                       qid=46,
                       qitem=1
                   },
}

function jaf.quest_menu(id,n)
         local v=jaf.list_quest[n]
         if v.qcode==3 then
            jaf.quest_item[id][n]=jaf.checkamountitem(id,v.qid)
         end
         if jaf.quest_item[id][n]==nil then jaf.quest_item[id][n]=0 end
         if jaf.quest_stat[id][n]~=nil and jaf.quest_item[id][n]>=v.qitem then
            menu(id,"Quest@b,(Title|"..v.title.."),Quest info|"..v.qinfo..",(Quest prize|"..v.prizeinfo.."),Take prize,,,,,<< "..jaf.sv_lang(jaf.lang[id],80))
         elseif jaf.quest_stat[id][n]~=nil and jaf.quest_item[id][n]<v.qitem then
            menu(id,"Quest@b,(Title|"..v.title.."),Quest info|"..v.qinfo..",(Quest prize|"..v.prizeinfo.."),(Item|("..jaf.quest_item[id][n].."/"..v.qitem..")),Remove quest,,,,<< "..jaf.sv_lang(jaf.lang[id],80))
         else
            menu(id,"Quest@b,(Title|"..v.title.."),Quest info|"..v.qinfo..",(Quest prize|"..v.prizeinfo.."),(Item|("..jaf.quest_item[id][n].."/"..v.qitem..")),Take quest,,,,<< "..jaf.sv_lang(jaf.lang[id],80))
         end
end

function jaf.quest_getitem(id,code,iid)
         if not tonumber(iid) then iid=0 end
         for i,_ in pairs(jaf.quest_stat[id]) do
             local v=jaf.list_quest[i]
             if code==v.qcode and v.qcode==1 and jaf.quest_stat[id][i]>0 then
                jaf.quest_item[id][i]=jaf.quest_item[id][i]+1
                jaf.svj_msg2(id,"[Server] "..hijau..""..v.title.." "..jaf.quest_item[id][i].."/"..v.qitem.."!")
             if jaf.quest_item[id][i]>=v.qitem then
                jaf.svj_msg2(id,putih.."Quest Complete! "..v.title.." Quest@C")
                jaf.getsound(id,"JAF/otherworld/questcomplete.ogg")
             end
             elseif code==v.qcode and v.qcode==4 and jaf.quest_stat[id][i]>0 and iid==v.qid then
                jaf.quest_item[id][i]=jaf.quest_item[id][i]+1
                jaf.svj_msg2(id,"[Server] "..hijau..""..v.title.." "..jaf.quest_item[id][i].."/"..v.qitem.."!")
             if jaf.quest_item[id][i]>=v.qitem then
                jaf.svj_msg2(id,putih.."Quest Complete! "..v.title.." Quest@C")
                jaf.getsound(id,"JAF/otherworld/questcomplete.ogg")
             end
             elseif code==v.qcode and v.qcode==2 and jaf.quest_stat[id][i]>0 and math.floor(iid)==v.qid then
                jaf.quest_item[id][i]=jaf.quest_item[id][i]+1
                jaf.svj_msg2(id,"[Server] "..hijau..""..v.title.." "..jaf.quest_item[id][i].."/"..v.qitem.."!")
             if jaf.quest_item[id][i]>=v.qitem then
                jaf.svj_msg2(id,putih.."Quest Complete! "..v.title.." Quest@C")
                jaf.getsound(id,"JAF/otherworld/questcomplete.ogg")
             end
             end
         end
end

function jaf.quest_questtakemenu(id,iid,eid,isonce) -- iid={<quest id>,...,<quest id-n>}
         --- eid = event-id
         if eid~=nil then jaf.btnq_eid[id]=eid else jaf.btnq_eid[id]=nil end
         if eid~=nil and tonumber(eid[id]) and eid[id]<1 then eid[id]=1 end
         jaf.btnq[id]={}
         for i=1,jaf.btnqc[id] do
             jaf.btnq[id][i]=0
         end
         jaf.questoncela[id]=0
         if isonce~=nil and eid~=nil and isonce then jaf.questoncela[id]=1 end
         jaf.btnqc[id]=#iid
         if iid then
            for i=1,#iid do
                      jaf.btnq[id][i]=iid[i]
            end
        end
        jaf.quest_listquest(id,1)
end

function jaf.quest_listquest(id,page)
if jaf.btnqc[id]>0 then
local page=page or 1
local pages=math.ceil(jaf.btnqc[id]/7)
local m='Take Quest | Page '..page
    for i=7*page-6, 7*page do
         if jaf.btnq[id][i]~=nil and jaf.btnq[id][i] then
                local v=jaf.btnq[id][i]
                local v2,prcti,prct=nil,"",0
                if jaf.btnq_eid[id]~=nil and jaf.btnq_eid[id] then
                  v2=jaf.btnq_eid[id][id]
                end
                local v3qo=false
                if jaf.questoncela[id]>0 then
                    v3qo=true
                end
                if jaf.quest_stat[id]~=nil and jaf.quest_stat[id][v]~=nil and jaf.quest_stat[id][v]>0 then
                   if jaf.list_quest[v].qcode==3 then
                     jaf.quest_item[id][v]=jaf.checkamountitem(id,jaf.list_quest[v].qid)
                   end
                   prct=jaf.quest_item[id][v]
                   if prct>jaf.list_quest[v].qitem then
                      prct=jaf.list_quest[v].qitem
                   end
                   prcti=" ("..math.floor(prct/jaf.list_quest[v].qitem*100).."%)"
                end
                if jaf.list_quest[v]~=nil and tonumber(v2) and (v2>=i or jaf.admin[id]>=3) then
                   if v3qo==false then
                      m=m..','..jaf.list_quest[v].title..prcti
                   elseif v3qo and (v2==i or jaf.admin[id]>=3) then
                      m=m..','..jaf.list_quest[v].title..prcti
                   elseif v3qo then
                      m=m..',('..jaf.list_quest[v].title..')'
                   end
                elseif jaf.list_quest[v]~=nil and tonumber(v2) then
                   m=m..',('..jaf.list_quest[v].title..')'
                elseif jaf.list_quest[v]~=nil and v>0 then
                   m=m..','..jaf.list_quest[v].title..prcti
                else
                   m=m..','
                end
                   
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id, m)
end
end

function jaf.quest_checkactive(id)
         qa,qc={},0
         for i=1,#jaf.list_quest do
             if jaf.quest_stat[id][i]>0 then
                    qc=qc+1
                    qa[qc]=i
             end
        end
        return {count=qc,quest=qa}
end