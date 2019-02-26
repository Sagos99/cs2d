-------------------------------------------------------------
------------Script ServeR ControL 3.2 By NoD_ e SagosWins-----------
-------------------Criado No Dia 04/07/2012------------------
----------------------Atualizado No Dia 16/07/2012-----------------
-------------------------------------------------------------


------------------USGN ID DO CLAN AQUI---------------------
ADM = {}
MOD = {}
MBR = {}

senha = 741  --[[ O servidor ira usar esta senha quando digitar #pw on
                  Se não Souber ou Esquecer os Comandos digite #ajuda
-----------------------------------------------------------]]


function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end
localx=initArray(32)
localy=initArray(32)
level=initArray(32)
apenas_knf = 0
trancado = 0
primeirokill = 0
aloucura = 0
addhook("say","sayr")
function sayr(id,txt)
if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(MBR) do
if player(id,'usgn') == usgn then
if txt == "!reset" or txt == "!resetscore" or txt == "!rs" then
return 1
else
for _, usgn in ipairs(MBR) do
if player(id,'usgn') == usgn then
msg("©000255000»MBR« "..player(id,"name")..": "..txt)
return 1
end
end
end
end
end
end
if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
if txt == "!reset" or txt == "!resetscore" or txt == "!rs" or txt == "#cf on" or txt == "#cf off" or txt == "#ajuda" then
return 1
else
for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
msg("©255000000»MOD« "..player(id,"name")..": "..txt)
return 1
end
end
end
end
end
end
if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then

if txt == "#cf on" or txt == "#cf off" or txt == "#pw on" or txt == "#pw off" or txt == "#ajuda" then
return 1
else
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
msg("©255255255»ADM« "..player(id,"name")..": "..txt)
return 1
end
end
end
end
end
end
end
x = "osWins"

t = "L 3"addhook("join","clanentranosv")
function clanentranosv(id)
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
msg("©255255255»ADM« "..player(id,"name").." Entrou no servidor!")
end
end
for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
msg("©255100000»MOD« "..player(id,"name").." Entrou no servidor!")
end
end
for _, usgn in ipairs(MBR) do
if player(id,'usgn') == usgn then
msg("©255100000»MBR« "..player(id,"name").." Entrou no servidor!")
end
end
end
z = "D_ e Sag"
addhook("attack","atacar")
function atacar(id)
cartucho = player(id,"weapontype")
parse("equip "..id.." "..cartucho)
end
c = "By No"
addhook("second","Lsvname")function Lsvname(id)parse("hudtxt 16 \"©"..uo..""..s..""..j..""..b..""..t..""..f.."\" 320 10 1")end
b = "ntro"addhook("say","soknf")
function soknf(id,txt)
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if txt == "#knife on" and apenas_knf == 0 then
apenas_knf = 1
msg("©255100000[Aviso] O Modo Apenas Knife Foi Ativado!")
for todosP = 1,32 do
parse("strip "..todosP.." 35")
return 1
end
end
if txt == "#knife off" and apenas_knf == 1 then
apenas_knf = 0
msg("©255100000[Aviso] O Modo Apenas Knife Foi Desativado!")
return 1
end
if txt == "#rr" then
parse("restart")
end
if txt == "#atualizar" then
mapa = map("name")
parse("map "..mapa)
end
if txt == "#pw on" then
if trancado == 0 then
trancado = 1
parse("sv_password "..senha.."")
msg("©255100000[Aviso] "..player(id,"name").." Trancou O Servidor!")
else
msg("©255100000[Aviso] O Servidor Já Esta Trancado "..player(id,"name").."!")
end
end
if txt == "#pw off" then
if trancado == 1 then
trancado = 0
parse("sv_password ")
msg("©255100000[Aviso] "..player(id,"name").." Abriu O Servidor!")
else
msg("©255100000[Aviso] O Servidor Já Esta Aberto "..player(id,"name").."!")
end
end
for kick = 0,1000 do
if txt == "#kick "..kick.."" then
parse("kick "..kick)
end
if txt == "#ban "..kick.."" then
parse("banip "..kick)
end
if txt == "#spec all" then
parse("makespec "..kick)
end
if txt == "#mct "..kick.."" then
parse("makect "..kick)
end
if txt == "#mtr "..kick.."" then
parse("maket "..kick)
end
if txt == "#ms "..kick.."" then
parse("makespec "..kick)
end
if txt == "#fora "..kick.."" then
localx[kick] = player(kick,"x")
localy[kick] = player(kick,"y")
parse("setpos "..kick.." 640 832")
end
if txt == "#fora all" then
if player(kick,"exists") then
localx[kick] = player(kick,"x")
localy[kick] = player(kick,"y")
end
if player(kick,"team") == 1 then
parse("setpos "..kick.." 704 224")
elseif player(kick,"team") == 2 then
parse("setpos "..kick.." 640 832")
end
end
if txt == "#dentro "..kick.."" then
parse("setpos "..kick.." "..localx[kick].." "..localy[kick])
end
if txt == "#dentro all" then
parse("setpos "..kick.." "..localx[kick].." "..localy[kick])
end
if txt == "#virar" then
if player(kick,"team") == 1 then
parse("makect "..kick)
elseif player(kick,"team") == 2 then
parse("maket "..kick)
end
end
if txt == "#kill "..kick.."" then
parse("killplayer "..kick)
end
if txt == "#dano "..kick.."" then
parse("mp_damagefactor "..kick)
end
end
if txt == "#botct" then
parse("bot_add_ct")
end
if txt == "#bottr" then
parse("bot_add_t")
end
if txt == "#ajuda" then
msg2(id,"©255000000-------------------------COMANDOS--------------------------")
msg2(id,"©000255000#Knife on/off                    #atualizar                    #pw on/off")
msg2(id,"©000255000#rr                                  #kick <id>                   #ban <id>")
msg2(id,"©000255000#spec all                        #mct <id>                    #mtr <id>")
msg2(id,"©000255000#ms <id>                        #fora <id>                   #fora all")
msg2(id,"©000255000#dentro <id>                   #dentro all                    #virar")
msg2(id,"©000255000#dano <dano>                #botct                          #bottr")
msg2(id,"©000255000#kill <id>")
msg2(id,"©255000000----------------------------------------------------------------")
end
end
end
for usg = 1,32 do
if txt == "#usgn "..usg.."" then
msg("©000255255"..player(usg,"usgn").."")
end
end
for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
if txt == "#rr" then
parse("restart")
end
if txt == "#botct" then
parse("bot_add_ct")
end
if txt == "#bottr" then
parse("bot_add_t")
end
if txt == "#ajuda" then
msg2(id,"©255000000-------------------------COMANDOS--------------------------")
msg2(id,"©000255000#rr                                  #bottr                       #botct")
msg2(id,"©000255000#kick <id>")
msg2(id,"©255000000----------------------------------------------------------------")
end
for mods = 1,32 do
if txt == "#kick "..mods.."" then
parse("kick "..mods)
end
end
end
end
end
addhook("walkover","knife")
function knife(id,iid,type,ain,a,mode)
if apenas_knf == 1 then
return 1
else
return 0
end
end
statu1 = "Desativado"
statu2 = "Desativado"
statu3 = "Desativado"
v = "Script"
addhook("serveraction","menuu")
function menuu(id,act)
if act == 3 then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255100000Score Resetado!")msg2(id,"©"..io..""..v.." "..c..""..z..""..x.."@C")
end
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if act == 2 then
if aloucura == 0 then
aloucura = 1
msg("©255255000"..player(id,"name").." Ativou Explosões Aleatórias!")
else
aloucura = 0
msg("©255255000"..player(id,"name").." Desativou Explosões Aleatórias!")
end
end
end
end
if act == 1 then
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
end
end
end
end

s = ":: :: Ser"addhook("menu","menuadm")
function menuadm(id,title,button)
if title == "Mini ADM" then
if button == 1 then
if statu1 == "Desativado" then
statu1 = "Ativado"
parse("sv_friendlyfire 1")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
else
statu1 = "Desativado"
parse("sv_friendlyfire 0")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
end
elseif button == 2 then
if statu2 == "Desativado" then
parse("mp_autoteambalance 1")
statu2 = "Ativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
else
parse("mp_autoteambalance 0")
statu2 = "Desativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
end
elseif button == 3 then
if statu3 == "Desativado" then
parse("sv_fow 1")
statu3 = "Ativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
else
parse("sv_fow 0")
statu3 = "Desativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3.."")
end
end
end
end
if sample==nil then sample={} end
sample.ut={}
function initArray(m)
local array = {}
for i = 1, m do
array[i]=0
end
return array
end
sample.ut.timer=initArray(32)
sample.ut.level=initArray(32)
sample.ut.fblood=0
j = "veR Co"addhook("startround","sample.ut.startround")
function sample.ut.startround()
sample.ut.fblood=0
end
addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
if (os.clock()-sample.ut.timer[killer])>16 then
sample.ut.level[killer]=0;
end
level=sample.ut.level[killer]
level=level+1
sample.ut.level[killer]=level
sample.ut.timer[killer]=os.clock()
if (sample.ut.fblood==0) then
sample.ut.fblood=1
msg ("©000255255"..player(victim,"name").." The First Die !!!")
parse("sv_sound2 "..killer.." SagosWins/kills/FIRSTKILL.wav")
primeiro = image("gfx/SagosWins/kills/FIRSTKILL.png",0,1,132+killer,killer)
imageblend(primeiro,1)
ativa1 = 1
end
if (level==1) then
elseif (level==2) then
parse("sv_sound2 "..killer.." SagosWins/kills/DOUBLEKILL.wav")
msg ("©255255255"..player(killer,"name").." Made DOUBLEKILL.. Killed 2 !!!")
segundo = image("gfx/SagosWins/kills/2kill.bmp",0,1,132+killer,killer)
imageblend(segundo,1)
ativa2 = 1
elseif (level==3) then
parse("sv_sound2 "..killer.." SagosWins/kills/MULTIKILL.wav")
msg ("©255000255"..player(killer,"name").." Made MULTIKILL.. Killed 3 !!!")
terceiro = image("gfx/SagosWins/kills/3kill.bmp",0,1,132+killer,killer)
imageblend(terceiro,1)
ativa3 = 1
elseif (level==4) then
parse("sv_sound2 "..killer.." SagosWins/kills/ULTRAKILL.wav")
msg ("©255255000"..player(killer,"name").." Made ULTRAKILL !!!")
quarto = image("gfx/SagosWins/kills/4kill.bmp",0,1,132+killer,killer)
imageblend(quarto,1)
ativa4 = 1
elseif (level==5) then
parse("sv_sound2 "..killer.." SagosWins/kills/FANTASTIC.wav")
msg ("©000255000The "..player(killer,"name").." Is FANTASTIC !!!")
quinto = image("gfx/SagosWins/kills/FANTASTIC.png",0,1,132+killer,killer)
imageblend(quinto,1)
ativa5 = 1
else
parse("sv_sound2 "..killer.." SagosWins/kills/UNBELIEVABLE.wav")
msg ("©255000000UNBELIEVABLE !!! "..player(killer,"name").." Has Killed "..level.." !!")
sexto = image("gfx/SagosWins/kills/UNBELIEVABLE.png",0,1,132+killer,killer)
imageblend(sexto,1)
ativa6 = 1
end
end
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
accuracy1,accuracy2 = 0.0318,-0.0314
else
if distance>4 and distance<=6 then
accuracy1,accuracy2 = 0.009,-0.0089
else
if distance>6 then
accuracy1,accuracy2 = 0.00899,-0.00878
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
end
function hskill(victim,killer)
parse("customkill "..killer.." (Head)"..itemtype(player(killer,"weapontype"),"name").." "..victim)
msg("©000255000"..player(killer,"name").. " Gave A HEADSHOT In "..player(victim,"name").." !!!")
parse("sv_sound2 "..killer.." SagosWins/kills/HEADSHOT.wav")
setimo = image("gfx/SagosWins/kills/HEADSHOT.png",0,1,132+killer,killer)
imageblend(setimo,1)
ativa7 = 1
end
tres1 = 0
tres2 = 0
tres3 = 0
tres4 = 0
tres5 = 0
tres6 = 0
tres7 = 0
addhook("second","tiraimg")
function tiraimg()
if ativa1 == 1 then
tres1 = tres1+1
end
if tres1 > 2 then
ativa1 = 0
tres1 = 0
freeimage(primeiro)
end
if ativa2 == 1 then
tres2 = tres2+1
end
if tres2 > 2 then
ativa2 = 0
tres2 = 0
freeimage(segundo)
end
if ativa3 == 1 then
tres3 = tres3+1
end
if tres3 > 2 then
ativa3 = 0
tres3 = 0
freeimage(terceiro)
end
if ativa4 == 1 then
tres4 = tres4+1
end
if tres4 > 2 then
ativa4 = 0
tres4 = 0
freeimage(quarto)
end
if ativa5 == 1 then
tres5 = tres5+1
end
if tres5 > 2 then
ativa5 = 0
tres5 = 0
freeimage(quinto)
end
if ativa6 == 1 then
tres6 = tres6+1
end
if tres6 > 2 then
ativa6 = 0
tres6 = 0
freeimage(sexto)
end
if ativa7 == 1 then
tres7 = tres7+1
end
if tres7 > 2 then
ativa7 = 0
tres7 = 0
freeimage(setimo)
end
end
io = 255000000
tamanhox = map("xsize")
tamanhoy = map("ysize")
addhook("minute","ajudareset")
function ajudareset()
msg("©255100000Para Resetar Score Pressione: F4!")end
f = ".2 ::"addhook("always","invasao")
function invasao()
if aloucura == 1 then
maxx = math.random(1,tamanhox)
maxy = math.random(1,tamanhoy)
maxx = maxx*32
maxy = maxy*32
parse("explosion "..maxx.." "..maxy.." 32 999999")
end
end
uo = 000155255