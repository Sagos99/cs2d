-------------------------------------------------------------
------------Script ServeR ControL 4.5 By SagosWins-----------
-------------------Criado No Dia 04/07/2012------------------
-----------------Atualizado No Dia 27/11/2012----------------
-------------------------------------------------------------


--=================USGN ID DO CLAN AQUI====================--
ADM = {15431}
VIP = {}
MOD = {}
MBR = {}
--=========================================================--



--===================Sua Configuração======================--
limite_do_ping = 600                --jogador sera kikado caso ultrapasse este ping
maxplayer = 11                      --máximo de jogadores permitido em seu servidor
--=========================================================--



--[[=======================AJUDA===========================--
Se não Souber ou Esquecer os Comandos digite #ajuda
POR FAVOR NÃO EDITE ESTE SCRIPT
--=======================================================--]]

print("©000255000Carregando Script ServeR ControL 4.5 Aguarde...")
function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

localx=initArray(32)
localy=initArray(32)
cor=initArray(32)
contagemm=initArray(32)
bloqueio=initArray(32)
aaleatorio=initArray(32)
reset=initArray(32)
afk=initArray(32)
invulneravel=initArray(32)
lvl=initArray(32)
lvlsec=initArray(32)

for adms = 1,32 do
cor[adms] = 5
end

nucleo = 0
tempu = 10
tempu2 = 100
apenas_knf = 0
trancado = 0
primeirokill = 0
yym = 0
path = image("gfx/SagosWins/laser.bmp",500,yym,3)
parse("sv_maxplayers "..maxplayer)
freeimage(path)
laser = 0
aloucura = 0
balainf = 0
ativado = 0
fimxxx = map("xsize")
fimyyy = map("xsize")
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
status = "direita_baixo"
velocidade = 8
rpg = 1
antilagger = 1
antihack = 1
lockx = 0
locky = 0
if map("name") == "awp_grey SagosWins" or map("name") == "awp_grey Natal by SagosWins" then
mymap = "Trancar RPG"
else
mymap = "(Só No Mapa do SagosWins)"
end

fimx = map("xsize")*32
fimy = map("ysize")*32

parse("mp_pinglimit 0")



senha_do_servidor = 0

addhook("say","senha")
function senha(id,txt)

for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then

if trancado == 2 then
senha_do_servidor = (""..txt)
parse("sv_password "..senha_do_servidor)
msg("©255100000[Aviso] "..player(id,"name").." Trancou O Servidor com a Senha: "..senha_do_servidor)
trancado = 0
return 1
end
if trancado == 1 then
trancado = trancado+1
return 1
end
return 1
end
end

for _, usgn in ipairs(VIP) do
if player(id,'usgn') == usgn then
return 1
end
end

for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
return 1
end
end

for _, usgn in ipairs(MBR) do
if player(id,'usgn') == usgn then
return 1
end
end
end


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
msg("©000255000»MBR« "..player(id,"name")..": "..txt)
return 1
end
end
end
end

if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(MOD) do
if player(id,'usgn') == usgn then
if txt == "!reset" or txt == "!resetscore" or txt == "!rs" or txt == "#ajuda" then
return 1
else
msg("©255000000»MOD« "..player(id,"name")..": "..txt)
return 1
end
end
end
end

if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(VIP) do
if player(id,'usgn') == usgn then
if txt == "!reset" or txt == "!resetscore" or txt == "!rs" or txt == "#ajuda" or txt == "#virar" or txt == "#cor" then
return 1
else
msg("©000255255»VIP« "..player(id,"name")..": "..txt)
return 1
end
end
end
end

if txt == "rank" or txt == "RANK" then
return 0
else
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if txt == "#pw on" or txt == "#pw off" or txt == "#ajuda" or txt == "#arma" or txt == "#cor" or txt == "#cor aleatório" or txt == "#cor aleatorio" then
return 1
else

if cor[id] == 1 then					-- amarelo
msg("©255255000»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 2 then				-- rosa
msg("©255000255»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 3 then				-- azul escuro
msg("©000000255»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 4 then				-- azul claro
msg("©000255255»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 5 then				-- branco
msg("©255255255»ADM« "..player(id,"name")..": "..txt)
return 1


elseif cor[id] == 6 then				-- verde
msg("©000255000»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 7 then			-- laranja
msg("©255120000»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 8 then			-- vermelho
msg("©255000000»ADM« "..player(id,"name")..": "..txt)
return 1

elseif cor[id] == 9 then				-- roxo
msg("©120000255»ADM« "..player(id,"name")..": "..txt)
return 1
end
end
end
end
end
end

addhook("say","aleatorio")
function aleatorio(id,txt)

for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if txt == "#arma" then
armaale = math.random(1,91)
while itemtype(armaale,"name") == "" do
armaale = math.random(1,91)
end
for tds = 1,32 do
parse("equip "..tds.." "..armaale)
msg("Todos Jogadores Ganhou "..itemtype(armaale,"name").."@C")
end
end
end
end
end

xo = "osWins"
t = "L 4"

addhook("join","clanentranosv")
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

z = "Sag"

addhook("attack","atacar")
function atacar(id)
if balainf == 1 then
cartucho = player(id,"weapontype")
parse("equip "..id.." "..cartucho)
end
end

c = "By "
red = 0
green = 0
blue = 0
lynn = 0
auto = 0

addhook("second","Lsvname")
function Lsvname(id)
red = math.random(0,255)
green = math.random(0,255)
blue = math.random(0,255)
parse("hudtxtcolorfade 0 16 800 "..red.." "..green.." "..blue)

lynn = lynn+1

if lynn > 300 then
parse("hudtxt 16 \"Criado Por SagosWins\" 320 10 1")
parse("hudtxtcolorfade 0 16 800 "..red.." "..green.." "..blue)
end

if lynn > 310 then
parse("hudtxt 16 \""..s..""..j..""..b..""..t..""..f.."\" 320 10 1")
lynn = 0
end


if nucleo == 1 then
parse("hudtxt 40 \"Esplosão Nuclear: "..tempu.."\" 245 420")
tempu = tempu-1
end

if tempu < 1 then
parse("hudtxtalphafade 0 40 5000 0")
end
if antilagger == 1 then
for will = 1,32 do

if player(will,"exists") then


if contagemm[will] > 2 then
msg("©000255000"..player(will,"name").." Foi Kikado, Pois Seu Ping Esta "..player(will,"ping"))
parse("kick "..will.." \"O Sistema Anti-Lagger do ServeR ControL Kikou Você Por Seu Ping Estar Maior do Que 600\"")
end

if player(will,"ping") >= limite_do_ping then
if contagemm[will] <= 2 and bloqueio[will] == 0 then
contagemm[will] = contagemm[will]+1
bloqueio[will] = 30
msg("©000255000"..player(will,"name").." Seu Ping Esta "..player(will,"ping").." Feche Todos os Programas Ou Sera Kikado!")
end
end
end

if bloqueio[will] > 0 then
bloqueio[will] = bloqueio[will]-1
end
end
end
end

addhook("leave","zerar_contagem")
function zerar_contagem(id)
contagemm[id] = 0
reset[id] = 0
end

b = "ntro"

addhook("say","soknf")
function soknf(id,txt)

for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if txt == "#knife on" and apenas_knf == 0 then
apenas_knf = 1
msg("©255100000[Aviso] O Modo Apenas Knife Foi Ativado!")

for todosP = 1,32 do

parse("strip "..todosP.." ")
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

if txt == "#anti-lagger on"then
antilagger = 1
msg2(id,"©255255255O Sistema Anti-Lagger Esta Ativado!")
elseif txt == "#anti-lagger off" then
antilagger = 0
msg2(id,"©255255255O Sistema Anti-Lagger Esta Desativado!")
end

if txt == "#anti-hack on" then
antihack = 1
msg2(id,"©255255255O Sistema Anti-Hacker Esta Ativado!")
elseif txt == "#anti-hack off" then
antihack = 0
msg2(id,"©255255255O Sistema Anti-Hacker Esta Desativado!")
end

if txt == "#atualizar" then
mapa = map("name")
parse("map "..mapa)
end

if txt == "#pw on" then
trancado = 1
msg2(id,"©255255255Digite a Senha Para Trancar o Servidor!")
end

if txt == "#laser on" then
laser = 1
end

if txt == "#minhoca on" then
ativado = 1
elseif txt == "#minhoca off" then
ativado = 0
end

if txt == "#pw off" then
parse("sv_password ")
msg("©255100000[Aviso] "..player(id,"name").." Destrancou O Servidor!")
end

for kick = 1,32 do
if txt == "#kick "..kick.."" then
parse("kick "..kick)
end

if txt == "#ban "..kick.."" then
parse("banip "..kick)
end

for shot = 1,91 do
if txt == "#arma "..shot.."" then
if player(kick,"exists") then
parse("equip "..kick.." "..shot)
msg("Todos Jogadores Ganhou "..itemtype(shot,"name").."@C")
end
end
end

if txt == "#spec all" then
if player(kick,"exists") then
parse("makespec "..kick)
end
end

for rr = 1,10 do
if txt == "#rr "..rr.."" then
parse("restart "..rr)
end
end

if txt == "#reviver "..kick.."" then
if player(kick,"health") < 1 then
parse("spawnplayer "..kick.." "..player(kick,"x").." "..player(kick,"y"))
end
end

if txt == "congelar "..kick.."" then
parse("speedmod "..kick.." -30")
end

if txt == "descongelar "..kick.."" then
parse("speedmod "..kick.." 0")
end

if txt == "#ct "..kick.."" then
parse("makect "..kick)
end

if txt == "#sv_auto on" then
auto = 1
msg("©000255000O Servidor Esta Em Modo Automatico!@C")
end

if txt == "#sv_auto off" then
auto = 0
msg("©000255000O Modo Automatico Foi Desligado!@C")
end

if txt == "#tr "..kick.."" then
parse("maket "..kick)
end

if txt == "#spec "..kick.."" then
parse("makespec "..kick)
end

if txt == "#invu on" then
invulneravel[id] = 1
elseif txt == "#invu off" then
invulneravel[id] = 0
end

if txt == "#maxplayer "..kick.."" then
parse("sv_maxplayers "..kick)
maxplayer = kick
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
if player(kick,"exists") then
parse("setpos "..kick.." "..localx[kick].." "..localy[kick])
end
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
end

for danos = 0,1000 do
if txt == "#dano "..danos.."" then
parse("mp_damagefactor "..danos)
end
end

if txt == "#botct" then
parse("bot_add_ct")
end

if txt == "#bottr" then
parse("bot_add_t")
end

if txt == "#cor" then
menu(id,"Cor de Sua Fala,Amarelo,Rosa,Azul|Escuro,Azul|Claro,Branco,Verde,Laranja,Vermelho,Roxo")
end

if txt == "#cor aleatório" or txt == "#cor aleatorio" then
aaleatorio[id] = 1
end

if txt == "#ajuda" then
msg2(id,"©255000000-------------------------COMANDOS--------------------------")
msg2(id,"©000255000#Knife on/off                    #atualizar                    #pw on/off")
msg2(id,"©000255000#rr                                  #kick <id>                   #ban <id>")
msg2(id,"©000255000#spec all                        #ct <id>                      #tr <id>")
msg2(id,"©000255000#spec <id>                     #fora <id>                   #fora all")
msg2(id,"©000255000#dentro <id>                   #dentro all                   #virar")
msg2(id,"©000255000#dano <dano>                #botct                         #bottr")
msg2(id,"©000255000#kill <id>                        #arma                         #reviver <id>")
msg2(id,"©000255000#cor                               #cor aleatório               #maxplayer <máximo de jogadores>")
msg2(id,"©000255000#arma <id da arma>      #sv_auto on/off             #invu on/off")
msg2(id,"©000255000#anti-hack on/off             #anti-lagger on/off        #minhoca on/off")
msg2(id,"©000255000#laser on")
msg2(id,"©255000000----------------------------------------------------------------")
end
end
end

for usg = 1,32 do
if txt == "!usgn "..usg.."" then
if player(usg,"name") == "- xL' × »SåGøsW¡nS«" then
msg("©000255255"..player(usg,"name").." = 2")
else
if player(usg,"usgn") > 0 then
msg("©000255255"..player(usg,"name").." = "..player(usg,"usgn").."")
else
msg("©000255255"..player(usg,"name").." Não Esta Logado Em Nenhuma Conta!")
end
end
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

j = "veR Co"

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
statu4 = "Desativado"
statu6 = "Desativado"
statu7 = "Desativado"
v = "Script"

addhook("serveraction","menuu")
function menuu(id,act)
if act == 3 then
menu(id,"Resetar Score Automaticamente?,Sim,Não,,,Ajuda Com Auto-Reset")
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
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end
end
end
end

s = ".::.:: Ser"

addhook("menu","menuadm")
function menuadm(id,title,button)

if title == "Resetar Score Automaticamente?" then
if button == 1 then
reset[id] = 1
elseif button == 2 then
reset[id] = 0
elseif button == 5 then
msg2(id,"©000255255Se Suas Mortes For Maior Que Seu Score Então é Resetado!")
end
end

if title == "Mini ADM" then
if button == 1 then
if statu1 == "Desativado" then
statu1 = "Ativado"
parse("sv_friendlyfire 1")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
else
statu1 = "Desativado"
parse("sv_friendlyfire 0")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end

elseif button == 2 then
if statu2 == "Desativado" then
parse("mp_autoteambalance 1")
statu2 = "Ativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
else
parse("mp_autoteambalance 0")
statu2 = "Desativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end

elseif button == 3 then
if statu3 == "Desativado" then

parse("sv_fow 1")
statu3 = "Ativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
else
parse("sv_fow 0")
statu3 = "Desativado"
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end

elseif button == 4 then
if statu4 == "Desativado" then
statu4 = "Ativado"
balainf = 1
msg("©255100000[Aviso] Balas Infinitas Ativado!")
parse("mp_infammo 1")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
else
balainf = 0
statu4 = "Desativado"
parse("mp_infammo 0")
msg("©255100000[Aviso] Balas Infinitas Desativado!")
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end

elseif button == 8 then
if statu7 == "Desativado" then
statu7 = "Ativado"
else
statu7 = "Desativado"
end
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")

elseif button == 9 then
dofile("sys/lua/server.lua")

elseif button == 5 then
if nucleo == 0 then
nucleo = 1
else
nucleo = 0
end

elseif button == 6 then
if rpg == 0 then
rpg = 1
statu6 = "Desativado"
msg("©255100000[Aviso] No Próximo Round Pode Pegar a RPG!")
else
rpg = 0
statu6 = "Ativado"
msg("©255100000[Aviso] No Próximo Round não Pode Pegar a RPG!")
end
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")


elseif button == 7 then
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
end
end

if title == "Cor de Sua Fala" then
if button == 1 then
cor[id] = 1
aaleatorio[id] = 0
elseif button == 2 then
cor[id] = 2
aaleatorio[id] = 0
elseif button == 3 then
cor[id] = 3
aaleatorio[id] = 0
elseif button == 4 then
cor[id] = 4
aaleatorio[id] = 0
elseif button == 5 then
cor[id] = 5
aaleatorio[id] = 0
elseif button == 6 then
cor[id] = 6
aaleatorio[id] = 0
elseif button == 7 then
cor[id] = 7
aaleatorio[id] = 0
elseif button == 8 then
cor[id] = 8
aaleatorio[id] = 0
elseif button == 9 then
cor[id] = 9
aaleatorio[id] = 0
end
end


if title == "Criar NPC's" then
if button == 1 then
modo = 1
reqcld(id,2)
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
elseif button == 2 then
modo = 2
reqcld(id,2)
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
elseif button == 3 then
modo = 3
reqcld(id,2)
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
elseif button == 4 then
modo = 4
reqcld(id,2)
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
elseif button == 5 then
modo = 5
reqcld(id,2)
menu(id,"Criar NPC's,Zombie,HeadCrab,Snark,Vortigaunt,Soldier,Voltar")
elseif button == 6 then
menu(id,"Mini ADM,Matar Amigo |"..statu1..",Equipe Balanceada|"..statu2..",Fog of War|"..statu3..",Bala Infinita|"..statu4..",Explosão Nuclear,"..mymap.."|"..statu6..",Criar NPC's,Itens No Mapa|"..statu7..",Atualizar Scripts")
end
end
end

io = 255000000
tamanhox = map("xsize")
tamanhoy = map("ysize")

addhook("minute","ajudareset")
function ajudareset()
msg("©255100000Para Ver a USGN de um Jogador Digite !usgn <id>")
end

f = ".5 ::."

addhook("always","explosao")
function explosao()

if aloucura == 1 then
maxx = math.random(1,tamanhox)
maxy = math.random(1,tamanhoy)
maxx = maxx*32
maxy = maxy*32
parse("explosion "..maxx.." "..maxy.." 32 999999")
end

if tempu < 0 then
tempu2 = tempu2-1

kkkx = math.random(0,fimx)
kkky = math.random(0,fimy)
parse("explosion "..kkkx.." "..kkky.." 480 9999999")
nucleo = 0
end
if tempu2 < 0 then
tempu = 10
tempu2 = 100
end


for hulk = 1,32 do
if aaleatorio[hulk] == 1 then
cor[hulk] = math.random(1,9)
end
end

if statu7 == "Ativado" then
certoxx = map("xsize")
certoyy = map("ysize")
arme = math.random(1,91)
certox = math.random(1,certoxx)
certoy = math.random(1,certoyy)
parse("spawnitem "..arme.." "..certox.." "..certoy)
end

for resetando = 1,32 do
if reset[resetando] == 1 then
if player(resetando,"score") < player(resetando,"deaths") then
parse("setscore "..resetando.." 0")
parse("setdeaths "..resetando.." 0")
msg("©255000255"..player(resetando,"name").." Resetou o  Score Automaticamente!")
end
end
end
if laser == 1 then
freeimage(path)
path = image("gfx/SagosWins/laser.bmp",500,yym,3)
yym = yym+1
end

for mortos = 1,32 do
if player(mortos,"exists") then
if player(mortos,"y") < yym then
parse("customkill 0 Laser "..mortos)
end
end
end

if status == "direita_baixo" then
x = x+velocidade
y = y+velocidade
elseif status == "esquerda_baixo" then
x = x-velocidade
y = y+velocidade
elseif status == "esquerda_cima" then
x = x-velocidade
y = y-velocidade
elseif status == "direita_cima" then
x = x+velocidade
y = y-velocidade
elseif status == "cima" then
y = y-velocidade
elseif status == "baixo" then
y = y+velocidade
elseif status == "direita" then
x = x+velocidade
elseif status == "esquerda" then
x = x-velocidade
end

tilex = x/32
tiley = y/32

if status == "direita_baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "esquerda_baixo"
elseif virar == 2 then
status = "esquerda"
end

elseif status == "esquerda_baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "esquerda_cima"
elseif virar == 2 then
status = "cima"
end

elseif status == "esquerda_cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "direita_cima"
elseif virar == 2 then
status = "direita"
end

elseif status == "direita_cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "direita_baixo"
elseif virar == 2 then
status = "baixo"
end

elseif status == "cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "baixo"
elseif virar == 2 then
status = "esquerda_baixo"
elseif virar == 3 then
status = "direita_baixo"
end

elseif status == "baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "cima"
elseif virar == 2 then
status = "direita_cima"
elseif virar == 3 then
status = "esquerda_cima"
end

elseif status == "direita" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "esquerda"
elseif virar == 2 then
status = "esquerda_cima"
elseif virar == 3 then
status = "esquerda_baixo"
end

elseif status == "esquerda" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "direita"
elseif virar == 2 then
status = "direita_cima"
elseif virar == 3 then
status = "direita_baixo"
end
end

if tilex > fimxxx or tiley > fimyyy then
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
elseif tilex < 0 or tiley < 0 then
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
end

if ativado == 1 then
parse("effect \"fire\" "..x.." "..y.." 10 10 0 0 0")
xx = x/32
yy = y/32
for minhoca = 1,32 do
if player(minhoca,"tilex") == xx and player(minhoca,"tiley") == yy then
parse("customkill 0 Minhoca De Fogo "..minhoca)
end
end
end
end



uo = 000155255
doistile=initArray(32)
tempoa=initArray(32)

addhook("movetile","antikhack")
function antikhack(id,x,y)
if antihack == 1 then
doistile[id] = doistile[id]+1
if doistile[id] > 22 then
if tempoa[id] > 1 then
tempoa[id] = 0
doistile[id] = 0
elseif player(id,"ping") < 215 then
msg("©100100255O Script ServeR ControL Detectou Que "..player(id,"name").." Usou Speed-Hacker! (Kikado)")
parse("kick "..id.." \"O Script ServeR ControL Detectou Que Voçe Estava Usando Speed-Hacker!\"")
end
end
end
end

addhook("second","contagemmm")
function contagemmm()
for allid = 1,32 do
tempoa[allid] = tempoa[allid]+1
end

if auto == 1 then
chel = math.random(1,150)
if chel == 5 then
statu7 = "Ativado"
arminha = 6
pranbug = 1
end
end

if pranbug == 1 and arminha > 0 then
arminha = arminha-1
end
if pranbug == 1 and arminha == 0 then
pranbug = 0
statu7 = "Desativado"
end
end

addhook("startround","matematicaaaa")
function matematicaaaa()
primeirokill = 0
parse("hudtxt 16 \"©"..uo..""..s..""..j..""..b..""..t..""..f.."\" 320 10 1")

if rpg == 1 then
parse("trigger wall1")
end

if auto == 1 then
estrela = math.random(1,3)
if estrela == 1 then
armaale = math.random(1,91)
while itemtype(armaale,"name") == "" do
armaale = math.random(1,91)
end
for tds = 1,32 do
parse("equip "..tds.." "..armaale)
msg("Todos Jogadores Ganhou "..itemtype(armaale,"name").."@C")
end
end
end
laser = 0
yym = 0
end

addhook("clientdata","Criaturas")
function Criaturas(id,mode,data1,data2)
lockx = data1/32
locky = data2/32

if modo == 1 then
parse("spawnnpc 1 "..lockx.." "..locky)

elseif modo == 2 then
parse("spawnnpc 2 "..lockx.." "..locky)

elseif modo == 3 then
parse("spawnnpc 3 "..lockx.." "..locky)

elseif modo == 4 then
parse("spawnnpc 4 "..lockx.." "..locky)

elseif modo == 5 then
parse("spawnnpc 5 "..lockx.." "..locky)
end
end

teempo = 5
addhook("minute","credito")
function credito()
teempo = teempo-1
if teempo < 0 then
teempo = 5
msg("©"..io..""..v.." "..c..""..z..""..xo.."@C")
end
end

addhook("say","resetarscore")
function resetarscore(id,txt)
if txt == "!rs" or txt == "!reset" or txt == "!resetscore" or txt == "!RS" or txt == "!RESET" or txt == "!RESETSCORE" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg("©255000255"..player(id,"name").." Resetou o Score!")
return 1
end
end



if map("name") == "awp_grey SagosWins" or map("name") == "awp_grey Natal by SagosWins" then
tempo_de_resposta = 10
numero = 11
fala = 0
tempo = tempo_de_resposta
addhook("movetile","ativar")
function ativar(id,x,y)
if x == 10 and y == 33 then
parse("strip "..id.." 35")
primeiro = math.random(0,numero)
segundo = math.random(0,numero)
terceiro = math.random(0,numero)
quarto = math.random(0,numero)
quinto = math.random(1,7)
if quinto == 1 then
result = primeiro*segundo
result = result+terceiro-quarto
msg("©255000255Quanto é "..primeiro.." x "..segundo.." + "..terceiro.." - "..quarto.." = ???")
elseif quinto == 2 then
result = primeiro+segundo
result = result*terceiro-quarto
msg("©255000255Quanto é "..primeiro.." + "..segundo.." x "..terceiro.." - "..quarto.." = ???")
elseif quinto == 3 then
result = primeiro-segundo
result = result*terceiro+quarto
msg("©255000255Quanto é "..primeiro.." - "..segundo.." x "..terceiro.." + "..quarto.." = ???")
elseif quinto == 4 then
result = primeiro-segundo
result = result+terceiro*quarto
msg("©255000255Quanto é "..primeiro.." - "..segundo.." + "..terceiro.." x "..quarto.." = ???")
elseif quinto == 5 then
result = primeiro*segundo
result = result-terceiro+quarto
msg("©255000255Quanto é "..primeiro.." x "..segundo.." - "..terceiro.." + "..quarto.." = ???")
elseif quinto == 6 then
result = "sagoswins"
msg("©255000255Quem é o Criador Deste Script???")
elseif quinto == 7 then
result = 0
msg("©255000255Quanto é 1+1+1+1+1+1+1*0 == ???")
end
resultado = tostring(result)
print(result)
cid = id
fala = 1
end
if x == 10 and y == 35 then
parse("setpos "..id.." 288 960")
end
end
addhook("say","resultadoo")
function resultadoo(id,txt)
if cid == id and fala == 1 then
if txt == resultado then
fala = 0
tempo = tempo_de_resposta
parse("trigger wall2")
msg("©255000255Correto o Resultado é "..result)
return 1
elseif txt ~= resultado and fala == 1 and cid == id then
parse("customkill 0 Errou a Conta "..id)
fala = 0
tempo = tempo_de_resposta
msg("©255000255O Resultado Não é "..txt.." e Sim "..result)
return 1
end
end
end


addhook("startround","valor_normal")
function valor_normal()
fala = 0
tempo = tempo_de_resposta
end



addhook("second","tempoo")
function tempoo()
for jajaja = 1,maxplayer do
if lvlsec[jajaja] > 0 then
lvlsec[jajaja] = lvlsec[jajaja]-1
end

if lvlsec[jajaja] == 0 then
lvl[jajaja] = 0
end
end

if fala == 1 then
msg(tempo.."@C")
tempo = tempo-1
end
if tempo < 1 then
fala = 0
msg(tempo.."@C")
tempo = tempo_de_resposta
parse("customkill 0 O Tempo Acabou "..cid)
msg("©255000255O Resultado era "..result)
end
end
end
addhook("second","coletando")
function coletando()
for qq = 1,32 do
if player(qq,"idle") == 30 and player(qq,"health") > 0 then
msg("©000255000"..player(qq,"name").." Esta Ausente!")
afk[qq] = 1
end
if afk[qq] == 1 and player(qq,"idle") == 0 then
msg("©000255000"..player(qq,"name").." Voltou a Jogar!")
afk[qq] = 0
end
end
end

addhook("hit","admnmorre")
function admnmorre(id,source,weapon,hpdmg,apdmg)
for _, usgn in ipairs(ADM) do
if player(id,'usgn') == usgn then
if invulneravel[id] == 1 then
return 1
else
return 0
end
end
end
end

addhook("kill","matanca")
function matanca(killer,victim,weapon,x,y)
lvlsec[killer] = 6
lvl[killer] = lvl[killer]+1
lvl[victim] = 0

if primeirokill ~= 1 then
primeirokill = 1

parse("sv_sound SagosWins/kills/FIRSTKILL.WAV")
lvlsec[killer] = lvlsec[killer]+6
end

if lvl[killer] == 2 then
parse("sv_sound SagosWins/kills/DOUBLEKILL.WAV")
lvlsec[killer] = lvlsec[killer]+6

elseif lvl[killer] == 3 then
parse("sv_sound SagosWins/kills/MULTIKILL.WAV")
lvlsec[killer] = lvlsec[killer]+6

elseif lvl[killer] == 4 then
parse("sv_sound SagosWins/kills/ULTRAKILL.WAV")
lvlsec[killer] = lvlsec[killer]+6

elseif lvl[killer] == 5 then
parse("sv_sound SagosWins/kills/FANTASTIC.WAV")
lvlsec[killer] = lvlsec[killer]+6

elseif lvl[killer] >= 6 then
parse("sv_sound SagosWins/kills/UNBELIEVABLE.WAV")
lvlsec[killer] = lvlsec[killer]+12
end
end


print("©000255000O Script ServeR ControL 4.5 Esta Pronto Para Uso!")