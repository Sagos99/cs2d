-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

-------------------------CONFIGURAÇÃO--------------------------------
clan   = {15431,70204}     ----(usgn do clan inteiro)----
admins = {15431}       ----(usgn  dos adms)-----
nome   = "SembrincaR"           ---(Nome do clan)---
---------------------------------------------------------------------



cf_tr              = 0
cf_ct              = 0
cf_on              = 0
cf_win             = 0
cf_lose            = 0
aaa                = 0
tempo_move         = 0
clan_do_adversario = "???"
cf_de_quantos      = 2
ativar_clan        = 0
oq                 = "CF"
nome2              = nome
lado               = 250
addhook("second","CF1")
function CF1()
if cf_on == 1 then
if aaa == 1 then
parse("hudtxt 4 \""..oq.."   "..nome.." ["..cf_win.."] x ["..cf_lose.."] "..clan_do_adversario.."\" "..lado.." 15 0")
end
end
if cf_tr == cf_de_quantos then
cf_win = cf_win+1
cf_tr = 0
end
if cf_ct == cf_de_quantos then
cf_lose = cf_lose+1
cf_ct = 0
end
if cf_on == 1 then
if tempo_move < 7 then
tempo_move = tempo_move+1
end
end
if tempo_move == 6 then
aaa = 1
end
end

addhook("say","CF2")
function CF2(id,txt)
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!cf on" then
cf_on = 1
parse("hudtxt 4 \""..oq.."   "..nome.." ["..cf_win.."] x ["..cf_lose.."] "..clan_do_adversario.."\" -100 15 0")
parse("hudtxtmove 0 4 5000 250 15")
return 1
end
end
end
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!cf off" then
cf_on   = 0
cf_win  = 0
cf_lose = 0
tempo_move = 0
aaa = 0
parse("hudtxtmove 0 4 5000 800 15")
return 1
end
end
end
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if ativar_clan == 1 then
clan_do_adversario = (""..txt)
msg2(id,"©255255255Nome Do Clan Adversário Salvo!")
ativar_clan = 0
return 1
end
end
end

for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!a-" then
cf_win = cf_win-1
return 1
end
end
end

for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!b-" then
cf_lose = cf_lose-1
return 1
end
end
end

for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!x1" then
oq = "x1"
nome = player(id,"name")
return 1
end
end
end

for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if txt == "!cf" then
oq = "CF"
nome = nome2
return 1
end
end
end

if txt == "!m" then
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
menu(id,"Configurar X e Y,Esquerda,Direita")
end
end
end
end

addhook("kill","conta")
function conta(id)
for _, usgn in ipairs(clan) do
if player(id,'usgn') == usgn then
if cf_on == 1 then
cf_tr = cf_tr+1
end
end
end
if cf_on == 1 then
cf_ct = cf_ct+1
end
for _, usgn in ipairs(clan) do
if player(id,'usgn') == usgn then
if cf_on == 1 then
cf_ct = cf_ct-1
end
end
end
end
addhook("startround","nn")
function nn()
cf_tr   = 0
cf_ct   = 0
end
addhook("serveraction","nomedoclan")
function nomedoclan(id,act)
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if act == 3 then
if ativar_clan == 0 then
ativar_clan = 1
msg2(id,"©255255255Digite o Nome do Adversário!")
else
msg2(id,"©255255255Nome do Adversário Cancelado!")
ativar_clan = 0
end
end
end
end
for _, usgn in ipairs(admins) do
if player(id,'usgn') == usgn then
if act == 2 then
menu(id,"CF De Quantos Players?,    1 x 1,    2 x 2,    3 x 3,    4 x 4,    5 x 5,    6 x 6,    7 x 7,    8 x 8,    9 x 9")
end
end
end
end
addhook("menu","CFmenu")
function CFmenu(id,title,buton)
if title=="CF De Quantos Players?" then
if buton==1 then
cf_de_quantos = 1
elseif buton==2 then
cf_de_quantos = 2
elseif buton==3 then
cf_de_quantos = 3
elseif buton==4 then
cf_de_quantos = 4
elseif buton==5 then
cf_de_quantos = 5
elseif buton==6 then
cf_de_quantos = 6
elseif buton==7 then
cf_de_quantos = 7
elseif buton==8 then
cf_de_quantos = 8
elseif buton==9 then
cf_de_quantos = 9
end
end
if title=="Configurar X e Y" then
if buton==1 then
lado = lado-10
menu(id,"Configurar X e Y,Esquerda,Direita")
elseif buton==2 then
lado = lado+10
menu(id,"Configurar X e Y,Esquerda,Direita")
end
end
end

