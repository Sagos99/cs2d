-------------------------------------------------------------
------------------Script WasZay By SagosWins-----------------
-------------------Criado No Dia 09/08/2014------------------
-------------------------------------------------------------

HOST = {15431}
ADMIN = {}
MODERADOR = {}
MEMBRO = {}
VIP = {}

function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

host1=initArray(32)
admin1=initArray(32)
moderador1=initArray(32)
membro1=initArray(32)
vip1=initArray(32)
host_cor_cargo=initArray(32)
host_cor_nome=initArray(32)
host_cor_fala=initArray(32)
admin_cor_cargo=initArray(32)
admin_cor_nome=initArray(32)
admin_cor_fala=initArray(32)
moderador_cor_cargo=initArray(32)
moderador_cor_nome=initArray(32)
moderador_cor_fala=initArray(32)
membro_cor_cargo=initArray(32)
membro_cor_nome=initArray(32)
membro_cor_fala=initArray(32)
vip_cor_cargo=initArray(32)
vip_cor_nome=initArray(32)
vip_cor_fala=initArray(32)
cargo_lvl=initArray(32)

usgn = 0
tempo = 0
freeze = 32
mesg = "©128128128"
lock = 0


for inicial = 1,32 do
host1[inicial] = 0
admin1[inicial] = 0
moderador1[inicial] = 0
membro1[inicial] = 0
vip1[inicial] = 0
desligar = 40
iniciar = 0

host_cor_cargo[inicial] = "©255255255"
host_cor_nome[inicial] = "©255255255"
host_cor_fala[inicial] = "©255255255"

admin_cor_cargo[inicial] = "©255000000"
admin_cor_nome[inicial] = "©255000000"
admin_cor_fala[inicial] = "©255000000"

moderador_cor_cargo[inicial] = "©000255000"
moderador_cor_nome[inicial] = "©000255000"
moderador_cor_fala[inicial] = "©000255000"

membro_cor_cargo[inicial] = "©090070090"
membro_cor_nome[inicial] = "©090070090"
membro_cor_fala[inicial] = "©090070090"

vip_cor_cargo[inicial] = "©080000128"
vip_cor_nome[inicial] = "©080000128"
vip_cor_fala[inicial] = "©080000128"
end

addhook("join","conectar")
function conectar(id)
for _, usgn in ipairs(HOST) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 5
host1[id] = 1
msg2(id,""..mesg.."[Servidor] Você fez Login em "..host_cor_cargo[id].."»Host«")
end
end

for _, usgn in ipairs(ADMIN) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 4
admin1[id] = 1
msg2(id,""..mesg.."[Servidor] Você fez Login em "..admin_cor_cargo[id].."»Admin«")
end
end

for _, usgn in ipairs(MODERADOR) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 3
moderador1[id] = 1
msg2(id,""..mesg.."[Servidor] Você fez Login em "..moderador_cor_cargo[id].."»Moderador«")
end
end

for _, usgn in ipairs(MEMBRO) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 2
membro1[id] = 1
msg2(id,""..mesg.."[Servidor] Você fez Login em "..membro_cor_cargo[id].."»Membro«")
end
end

for _, usgn in ipairs(VIP) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 1
vip1[id] = 1
msg2(id,""..mesg.."[Servidor] Você fez Login em "..vip_cor_cargo[id].."»Vip«")
end
end
end

addhook("leave","desconectar")
function desconectar(id)
host1[id] = 0
admin1[id] = 0
moderador1[id] = 0
membro1[id] = 0
vip1[id] = 0
cargo_lvl[id] = 0

host_cor_cargo[id] = "©255255255"
host_cor_nome[id] = "©255255255"
host_cor_fala[id] = "©255255255"

admin_cor_cargo[id] = "©255000000"
admin_cor_nome[id] = "©255000000"
admin_cor_fala[id] = "©255000000"

moderador_cor_cargo[id] = "©000255000"
moderador_cor_nome[id] = "©000255000"
moderador_cor_fala[id] = "©000255000"

membro_cor_cargo[id] = "©090070090"
membro_cor_nome[id] = "©090070090"
membro_cor_fala[id] = "©090070090"

vip_cor_cargo[id] = "©080000128"
vip_cor_nome[id] = "©080000128"
vip_cor_fala[id] = "©080000128"
msg2(id,""..mesg.."[Server] Você Deslogou.")
end

addhook("say","dizer")
function dizer(id,txt)

if txt == "!login" then
for _, usgn in ipairs(HOST) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 5
host1[id] = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." logou como »"..host_cor_cargo[id].."Host"..mesg.."«\"")
end
end

for _, usgn in ipairs(ADMIN) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 4
admin1[id] = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." logou como »"..admin_cor_cargo[id].."Admin"..mesg.."«\"")
end
end

for _, usgn in ipairs(MODERADOR) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 3
moderador1[id] = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." logou como »"..moderador_cor_cargo[id].."Moderador"..mesg.."«\"")
end
end

for _, usgn in ipairs(MEMBRO) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 2
membro1[id] = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." logou como »"..membro_cor_cargo[id].."Membro"..mesg.."«\"")
end
end

for _, usgn in ipairs(VIP) do
if player(id,"usgn") == usgn then
cargo_lvl[id] = 1
vip1[id] = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." logou como »"..vip_cor_cargo[id].."Vip"..mesg.."«\"")
end
end

if host1[id] == 0 and admin1[id] == 0 and moderador1[id] == 0 and membro1[id] == 0 and vip1[id] == 0 then
msg2(id,""..mesg.."[Servidor] Falha ao fazer Login.")
end

return 1
end


if txt == "!logoff" then
host1[id] = 0
admin1[id] = 0
moderador1[id] = 0
membro1[id] = 0
vip1[id] = 0
cargo_lvl[id] = 0

host_cor_cargo[id] = "©255255255"
host_cor_nome[id] = "©255255255"
host_cor_fala[id] = "©255255255"

admin_cor_cargo[id] = "©255000000"
admin_cor_nome[id] = "©255000000"
admin_cor_fala[id] = "©255000000"

moderador_cor_cargo[id] = "©000255000"
moderador_cor_nome[id] = "©000255000"
moderador_cor_fala[id] = "©000255000"

membro_cor_cargo[id] = "©090070090"
membro_cor_nome[id] = "©090070090"
membro_cor_fala[id] = "©090070090"

vip_cor_cargo[id] = "©080000128"
vip_cor_nome[id] = "©080000128"
vip_cor_fala[id] = "©080000128"
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"!logoff\"")
return 1
end

--------------------------Resetar Score---------------------------
rss = string.lower(txt)
rs = string.match(rss,"!rs")
if rs == "!rs" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,""..mesg.."[Servidor] Pontuação Resetada!")
return 1
end
------------------------------------------------------------------

------------------------------@Help-------------------------------
if txt == "@help" then
if cargo_lvl[id] == 5 then -- HOST
msg2(id,""..mesg.."[Servidor] ©255255255@swap"..mesg.." - quem é TR vira CT e vice-versa")
msg2(id,""..mesg.."[Servidor] ©255255255@kick"..mesg.." - expulsa um jogador do servidor")
msg2(id,""..mesg.."[Servidor] ©255255255@ban"..mesg.." - expulsa um jogador por 8 dias")
msg2(id,""..mesg.."[Servidor] ©255255255@kill"..mesg.." - mata um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255@maket"..mesg.." - Coloca um jogador em Terrorista")
msg2(id,""..mesg.."[Servidor] ©255255255@makect"..mesg.." - Coloca um jogador em Contra-Terrorista")
msg2(id,""..mesg.."[Servidor] ©255255255@makespec"..mesg.." - Coloca um jogador em Espectador")
msg2(id,""..mesg.."[Servidor] ©255255255@freezeall"..mesg.." - Congela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@unfreezeall"..mesg.." - Descongela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@setcolor"..mesg.." - escolha uma cor para seu nome, cargo e fala")
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs -"..mesg.." Reseta seus Score e suas Deaths")
elseif cargo_lvl[id] == 4 then -- ADMIN
msg2(id,""..mesg.."[Servidor] ©255255255@swap"..mesg.." - quem é TR vira CT e vice-versa")
msg2(id,""..mesg.."[Servidor] ©255255255@kick"..mesg.." - expulsa um jogador do servidor")
msg2(id,""..mesg.."[Servidor] ©255255255@ban"..mesg.." - expulsa um jogador por 8 dias")
msg2(id,""..mesg.."[Servidor] ©255255255@kill"..mesg.." - mata um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255@maket"..mesg.." - Coloca um jogador em Terrorista")
msg2(id,""..mesg.."[Servidor] ©255255255@makect"..mesg.." - Coloca um jogador em Contra-Terrorista")
msg2(id,""..mesg.."[Servidor] ©255255255@makespec"..mesg.." - Coloca um jogador em Espectador")
msg2(id,""..mesg.."[Servidor] ©255255255@freezeall"..mesg.." - Congela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@unfreezeall"..mesg.." - Descongela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@setcolor"..mesg.." - escolha uma cor para seu nome, cargo e fala")
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs"..mesg.." - Reseta seus Score e suas Deaths")
elseif cargo_lvl[id] == 3 then -- MODERADOR
msg2(id,""..mesg.."[Servidor] ©255255255@kick"..mesg.." - expulsa um jogador do servidor")
msg2(id,""..mesg.."[Servidor] ©255255255@kill"..mesg.." - mata um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255@freezeall"..mesg.." - Congela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@unfreezeall"..mesg.." - Descongela todos os Jogadores")
msg2(id,""..mesg.."[Servidor] ©255255255@setcolor"..mesg.." - escolha uma cor para seu nome, cargo e fala")
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs"..mesg.." - Reseta seus Score e suas Deaths")
elseif cargo_lvl[id] == 2 then -- MEMBRO
msg2(id,""..mesg.."[Servidor] ©255255255@setcolor"..mesg.." - escolha uma cor para seu nome, cargo e fala")
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs"..mesg.." - Reseta seus Score e suas Deaths")
elseif cargo_lvl[id] == 1 then -- VIP
msg2(id,""..mesg.."[Servidor] ©255255255@setcolor"..mesg.." - escolha uma cor para seu nome, cargo e fala")
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs"..mesg.." - Reseta seus Score e suas Deaths")
elseif cargo_lvl[id] == 0 then -- Jogador Comum
msg2(id,""..mesg.."[Servidor] ©255255255!usgn <jogador>"..mesg.." - ver a USGN de um jogador")
msg2(id,""..mesg.."[Servidor] ©255255255!rs"..mesg.." - Reseta seus Score e suas Deaths")
end
return 1
end
------------------------------------------------------------------

for todos = 1,32 do
if txt == "!usgn "..todos.."" then
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"!usgn "..todos.."\"")
tempo = 2
usgn = todos
return 1
end

if txt == "@kick "..todos.."" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 then
if id ~= todos then
if cargo_lvl[id] >= cargo_lvl[todos] then
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@kick\" em "..player(todos,"name").."")
parse("kick "..todos.."")
else
msg2(id,""..mesg.."[Servidor] Você não pode kikar alguem com o Cargo maior que o Seu")
end
else
msg2(id,""..mesg.."[Servidor] Você não pode kikar a si mesmo")
end
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@kick\"")
end
return 1
end

if txt == "@kill "..todos.."" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 then
if cargo_lvl[id] >= cargo_lvl[todos] then
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@kill\" em "..player(todos,"name").."")
parse("killplayer "..todos.."")
else
msg2(id,""..mesg.."[Servidor] Você não pode matar alguem com o Cargo maior que o Seu")
end
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@kill\"")
end
return 1
end

if txt == "@ban "..todos.."" then
if host1[id] == 1 or admin1[id] == 1 then
if id ~= todos then
if cargo_lvl[id] >= cargo_lvl[todos] then
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@ban\" em "..player(todos,"name").."")
parse("banip "..player(todos,"ip").." 11520 \"Você está Banido por 8 dias\"")
else
msg2(id,""..mesg.."[Servidor] Você não pode banir um alguem com o Cargo maior que o Seu")
end
else
msg2(id,""..mesg.."[Servidor] Você não pode banir a si mesmo")
end
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@ban\"")
end
return 1
end
end

if txt == "@freezeall" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 then
parse("speedmod 1 -30")
parse("speedmod 2 -30")
parse("speedmod 3 -30")
parse("speedmod 4 -30")
parse("speedmod 5 -30")
parse("speedmod 6 -30")
parse("speedmod 7 -30")
parse("speedmod 8 -30")
parse("speedmod 9 -30")
parse("speedmod 10 -30")
parse("speedmod 11 -30")
parse("speedmod 12 -30")
parse("speedmod 13 -30")
parse("speedmod 14 -30")
parse("speedmod 15 -30")
parse("speedmod 16 -30")
parse("speedmod 17 -30")
parse("speedmod 18 -30")
parse("speedmod 19 -30")
parse("speedmod 20 -30")
parse("speedmod 21 -30")
parse("speedmod 22 -30")
parse("speedmod 23 -30")
parse("speedmod 24 -30")
parse("speedmod 25 -30")
parse("speedmod 26 -30")
parse("speedmod 27 -30")
parse("speedmod 28 -30")
parse("speedmod 29 -30")
parse("speedmod 30 -30")
parse("speedmod 31 -30")
parse("speedmod 32 -30")
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@freezeall\"")
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@freezeall\"")
end
return 1
end

if txt == "@unfreezeall" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 then
parse("speedmod 1 0")
parse("speedmod 2 0")
parse("speedmod 3 0")
parse("speedmod 4 0")
parse("speedmod 5 0")
parse("speedmod 6 0")
parse("speedmod 7 0")
parse("speedmod 8 0")
parse("speedmod 9 0")
parse("speedmod 10 0")
parse("speedmod 11 0")
parse("speedmod 12 0")
parse("speedmod 13 0")
parse("speedmod 14 0")
parse("speedmod 15 0")
parse("speedmod 16 0")
parse("speedmod 17 0")
parse("speedmod 18 0")
parse("speedmod 19 0")
parse("speedmod 20 0")
parse("speedmod 21 0")
parse("speedmod 22 0")
parse("speedmod 23 0")
parse("speedmod 24 0")
parse("speedmod 25 0")
parse("speedmod 26 0")
parse("speedmod 27 0")
parse("speedmod 28 0")
parse("speedmod 29 0")
parse("speedmod 30 0")
parse("speedmod 31 0")
parse("speedmod 32 0")
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@unfreezeall\"")
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@unfreezeall\"")
end
return 1
end

if txt == "@desligar" then
if host1[id] == 1 or admin1[id] == 1 then
iniciar = 1
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@desligar\"")
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@desligar\"")
end
return 1
end

if txt == "@cancelar" then
if host1[id] == 1 or admin1[id] == 1 then
desligar = 40
iniciar = 0
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@cancelar\"")
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@desligar\"")
end
return 1
end

if txt == "@rr" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 then
if player(id,"health") > 0 then
parse("restart")
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@rr\"")
else
msg2(id,""..mesg.."[Servidor] Você precisa estar vivo parar usar \"@rr\"")
end
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@rr\"")
end
return 1
end

if txt == "@setcolor" then
if host1[id] == 1 or admin1[id] == 1 or moderador1[id] == 1 or membro1[id] == 1 or vip1[id] == 1 then
menu(id,"Mudança de Cor,Cargo,Nome,Fala")
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@setcolor\"")
else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@setcolor\"")
end
return 1
end

if txt == "@swap" then
if host1[id] == 1 or admin1[id] == 1 then
msg(""..mesg.."[Servidor] "..player(id,"name").." usou \"@swap\"")

for todos = 1,32 do
if player(todos,"team") == 1 then
parse("makect "..todos)
elseif player(todos,"team") == 2 then
parse("maket "..todos)
end
end

else
msg2(id,""..mesg.."[Servidor] Você não tem permissão parar usar \"@swap\"")
end
return 1
end


if host1[id] == 1 and txt == "!atualizar" then
dofile("sys/lua/server.lua")
return 1
end

if host1[id] == 1 then
if txt ~= "rank" or txt ~= "RANK" then
msg(host_cor_cargo[id].."»Host« "..host_cor_nome[id]..""..player(id,"name")..": "..host_cor_fala[id]..""..txt.."")
return 1
else
return 0
end
end


if admin1[id] == 1 then
if txt ~= "rank" or txt ~= "RANK" then
msg(admin_cor_cargo[id].."»Admin« "..admin_cor_nome[id]..""..player(id,"name")..": "..admin_cor_fala[id]..""..txt.."")
return 1
else
return 0
end
end


if moderador1[id] == 1 then
if txt ~= "rank" or txt ~= "RANK" then
msg(moderador_cor_cargo[id].."»Moderador« "..moderador_cor_nome[id]..""..player(id,"name")..": "..moderador_cor_fala[id]..""..txt.."")
return 1
else
return 0
end
end

if membro1[id] == 1 then
if txt ~= "rank" or txt ~= "RANK" then
msg(membro_cor_cargo[id].."»Membro« "..membro_cor_nome[id]..""..player(id,"name")..": "..membro_cor_fala[id]..""..txt.."")
return 1
else
return 0
end
end

if vip1[id] == 1 then
if txt ~= "rank" or txt ~= "RANK" then
msg(vip_cor_cargo[id].."»Vip« "..vip_cor_nome[id]..""..player(id,"name")..": "..vip_cor_fala[id]..""..txt.."")
return 1
else
return 0
end
end
end

addhook("menu","menus")
function menus(id,title,button)
if title == "Mudança de Cor" then
if button == 1 then
menu(id,"Escolha a cor do Cargo 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
elseif button == 2 then
menu(id,"Escolha a cor do Nome 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
elseif button == 3 then
menu(id,"Escolha a cor da Fala 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
end
end

if title == "Escolha a cor do Cargo 1/2" then
if button == 1 then
host_cor_cargo[id] = "©255255255"
admin_cor_cargo[id] = "©255255255"
moderador_cor_cargo[id] = "©255255255"
membro_cor_cargo[id] = "©255255255"
vip_cor_cargo[id] = "©255255255"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©255255255Branco"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_cargo[id] = "©000000000"
admin_cor_cargo[id] = "©000000000"
moderador_cor_cargo[id] = "©000000000"
membro_cor_cargo[id] = "©000000000"
vip_cor_cargo[id] = "©000000000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000000000Preto"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_cargo[id] = "©192192192"
admin_cor_cargo[id] = "©192192192"
moderador_cor_cargo[id] = "©192192192"
membro_cor_cargo[id] = "©192192192"
vip_cor_cargo[id] = "©192192192"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©192192192Cinza Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_cargo[id] = "©128128128"
admin_cor_cargo[id] = "©128128128"
moderador_cor_cargo[id] = "©128128128"
membro_cor_cargo[id] = "©128128128"
vip_cor_cargo[id] = "©128128128"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©128128128Cinza Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_cargo[id] = "©255000000"
admin_cor_cargo[id] = "©255000000"
moderador_cor_cargo[id] = "©255000000"
membro_cor_cargo[id] = "©255000000"
vip_cor_cargo[id] = "©255000000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©255000000Vermelho Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_cargo[id] = "©128000000"
admin_cor_cargo[id] = "©128000000"
moderador_cor_cargo[id] = "©128000000"
membro_cor_cargo[id] = "©128000000"
vip_cor_cargo[id] = "©128000000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©128000000Vermelho Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_cargo[id] = "©255255000"
admin_cor_cargo[id] = "©255255000"
moderador_cor_cargo[id] = "©255255000"
membro_cor_cargo[id] = "©255255000"
vip_cor_cargo[id] = "©255255000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©255255000Amarelo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_cargo[id] = "©128128000"
admin_cor_cargo[id] = "©128128000"
moderador_cor_cargo[id] = "©128128000"
membro_cor_cargo[id] = "©128128000"
vip_cor_cargo[id] = "©128128000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©128128000Amarelo Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor do Cargo 2/2,Verde|Claro,Verde|Escuro,Ciano|Escuro,Azul|Claro,Azul|Escuro,Rosa|Claro,Rosa|Escuro,Roxo|Claro,Voltar")
end
end


if title == "Escolha a cor do Cargo 2/2" then
if button == 1 then
host_cor_cargo[id] = "©000255000"
admin_cor_cargo[id] = "©000255000"
moderador_cor_cargo[id] = "©000255000"
membro_cor_cargo[id] = "©000255000"
vip_cor_cargo[id] = "©000255000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000255000Verde Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_cargo[id] = "©000128000"
admin_cor_cargo[id] = "©000128000"
moderador_cor_cargo[id] = "©000128000"
membro_cor_cargo[id] = "©000128000"
vip_cor_cargo[id] = "©000128000"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000128000Verde Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_cargo[id] = "©000128128"
admin_cor_cargo[id] = "©000128128"
moderador_cor_cargo[id] = "©000128128"
membro_cor_cargo[id] = "©000128128"
vip_cor_cargo[id] = "©000128128"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000128128Ciano Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_cargo[id] = "©000000255"
admin_cor_cargo[id] = "©000000255"
moderador_cor_cargo[id] = "©000000255"
membro_cor_cargo[id] = "©000000255"
vip_cor_cargo[id] = "©000000255"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000000255Azul Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_cargo[id] = "©000000128"
admin_cor_cargo[id] = "©000000128"
moderador_cor_cargo[id] = "©000000128"
membro_cor_cargo[id] = "©000000128"
vip_cor_cargo[id] = "©000000128"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©000000128Azul Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_cargo[id] = "©255000255"
admin_cor_cargo[id] = "©255000255"
moderador_cor_cargo[id] = "©255000255"
membro_cor_cargo[id] = "©255000255"
vip_cor_cargo[id] = "©255000255"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©255000255Rosa Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_cargo[id] = "©128000128"
admin_cor_cargo[id] = "©128000128"
moderador_cor_cargo[id] = "©128000128"
membro_cor_cargo[id] = "©128000128"
vip_cor_cargo[id] = "©128000128"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©128000128Rosa Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_cargo[id] = "©080000150"
admin_cor_cargo[id] = "©080000150"
moderador_cor_cargo[id] = "©080000150"
membro_cor_cargo[id] = "©080000150"
vip_cor_cargo[id] = "©080000150"
msg2(id,""..mesg.."[Servidor] Cor do cargo mudado para »©080000150Roxo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor do Cargo 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
end
end

if title == "Escolha a cor do Nome 1/2" then
if button == 1 then
host_cor_nome[id] = "©255255255"
admin_cor_nome[id] = "©255255255"
moderador_cor_nome[id] = "©255255255"
membro_cor_nome[id] = "©255255255"
vip_cor_nome[id] = "©255255255"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©255255255Branco"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_nome[id] = "©000000000"
admin_cor_nome[id] = "©000000000"
moderador_cor_nome[id] = "©000000000"
membro_cor_nome[id] = "©000000000"
vip_cor_nome[id] = "©000000000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000000000Preto"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_nome[id] = "©192192192"
admin_cor_nome[id] = "©192192192"
moderador_cor_nome[id] = "©192192192"
membro_cor_nome[id] = "©192192192"
vip_cor_nome[id] = "©192192192"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©192192192Cinza Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_nome[id] = "©128128128"
admin_cor_nome[id] = "©128128128"
moderador_cor_nome[id] = "©128128128"
membro_cor_nome[id] = "©128128128"
vip_cor_nome[id] = "©128128128"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©128128128Cinza Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_nome[id] = "©255000000"
admin_cor_nome[id] = "©255000000"
moderador_cor_nome[id] = "©255000000"
membro_cor_nome[id] = "©255000000"
vip_cor_nome[id] = "©255000000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©255000000Vermelho Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_nome[id] = "©128000000"
admin_cor_nome[id] = "©128000000"
moderador_cor_nome[id] = "©128000000"
membro_cor_nome[id] = "©128000000"
vip_cor_nome[id] = "©128000000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©128000000Vermelho Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_nome[id] = "©255255000"
admin_cor_nome[id] = "©255255000"
moderador_cor_nome[id] = "©255255000"
membro_cor_nome[id] = "©255255000"
vip_cor_nome[id] = "©255255000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©255255000Amarelo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_nome[id] = "©128128000"
admin_cor_nome[id] = "©128128000"
moderador_cor_nome[id] = "©128128000"
membro_cor_nome[id] = "©128128000"
vip_cor_nome[id] = "©128128000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©128128000Amarelo Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor do Nome 2/2,Verde|Claro,Verde|Escuro,Ciano|Escuro,Azul|Claro,Azul|Escuro,Rosa|Claro,Rosa|Escuro,Roxo|Claro,Voltar")
end
end

if title == "Escolha a cor do Nome 2/2" then
if button == 1 then
host_cor_nome[id] = "©000255000"
admin_cor_nome[id] = "©000255000"
moderador_cor_nome[id] = "©000255000"
membro_cor_nome[id] = "©000255000"
vip_cor_nome[id] = "©000255000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000255000Verde Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_nome[id] = "©000128000"
admin_cor_nome[id] = "©000128000"
moderador_cor_nome[id] = "©000128000"
membro_cor_nome[id] = "©000128000"
vip_cor_nome[id] = "©000128000"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000128000Verde Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_nome[id] = "©000128128"
admin_cor_nome[id] = "©000128128"
moderador_cor_nome[id] = "©000128128"
membro_cor_nome[id] = "©000128128"
vip_cor_nome[id] = "©000128128"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000128128Ciano Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_nome[id] = "©000000255"
admin_cor_nome[id] = "©000000255"
moderador_cor_nome[id] = "©000000255"
membro_cor_nome[id] = "©000000255"
vip_cor_nome[id] = "©000000255"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000000255Azul Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_nome[id] = "©000000128"
admin_cor_nome[id] = "©000000128"
moderador_cor_nome[id] = "©000000128"
membro_cor_nome[id] = "©000000128"
vip_cor_nome[id] = "©000000128"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©000000128Azul Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_nome[id] = "©255000255"
admin_cor_nome[id] = "©255000255"
moderador_cor_nome[id] = "©255000255"
membro_cor_nome[id] = "©255000255"
vip_cor_nome[id] = "©255000255"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©255000255Rosa Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_nome[id] = "©128000128"
admin_cor_nome[id] = "©128000128"
moderador_cor_nome[id] = "©128000128"
membro_cor_nome[id] = "©128000128"
vip_cor_nome[id] = "©128000128"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©128000128Rosa Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_nome[id] = "©080000150"
admin_cor_nome[id] = "©080000150"
moderador_cor_nome[id] = "©080000150"
membro_cor_nome[id] = "©080000150"
vip_cor_nome[id] = "©080000150"
msg2(id,""..mesg.."[Servidor] Cor do nome mudado para »©080000150Roxo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor do Nome 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
end
end

if title == "Escolha a cor da Fala 1/2" then
if button == 1 then
host_cor_fala[id] = "©255255255"
admin_cor_fala[id] = "©255255255"
moderador_cor_fala[id] = "©255255255"
membro_cor_fala[id] = "©255255255"
vip_cor_fala[id] = "©255255255"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©255255255Branco"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_fala[id] = "©000000000"
admin_cor_fala[id] = "©000000000"
moderador_cor_fala[id] = "©000000000"
membro_cor_fala[id] = "©000000000"
vip_cor_fala[id] = "©000000000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000000000Preto"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_fala[id] = "©192192192"
admin_cor_fala[id] = "©192192192"
moderador_cor_fala[id] = "©192192192"
membro_cor_fala[id] = "©192192192"
vip_cor_fala[id] = "©192192192"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©192192192Cinza Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_fala[id] = "©128128128"
admin_cor_fala[id] = "©128128128"
moderador_cor_fala[id] = "©128128128"
membro_cor_fala[id] = "©128128128"
vip_cor_fala[id] = "©128128128"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©128128128Cinza Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_fala[id] = "©255000000"
admin_cor_fala[id] = "©255000000"
moderador_cor_fala[id] = "©255000000"
membro_cor_fala[id] = "©255000000"
vip_cor_fala[id] = "©255000000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©255000000Vermelho Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_fala[id] = "©128000000"
admin_cor_fala[id] = "©128000000"
moderador_cor_fala[id] = "©128000000"
membro_cor_fala[id] = "©128000000"
vip_cor_fala[id] = "©128000000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©128000000Vermelho Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_fala[id] = "©255255000"
admin_cor_fala[id] = "©255255000"
moderador_cor_fala[id] = "©255255000"
membro_cor_fala[id] = "©255255000"
vip_cor_fala[id] = "©255255000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©255255000Amarelo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_fala[id] = "©128128000"
admin_cor_fala[id] = "©128128000"
moderador_cor_fala[id] = "©128128000"
membro_cor_fala[id] = "©128128000"
vip_cor_fala[id] = "©128128000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©128128000Amarelo Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor da Fala 2/2,Verde|Claro,Verde|Escuro,Ciano|Escuro,Azul|Claro,Azul|Escuro,Rosa|Claro,Rosa|Escuro,Roxo|Claro,Voltar")
end
end

if title == "Escolha a cor da Fala 2/2" then
if button == 1 then
host_cor_fala[id] = "©000255000"
admin_cor_fala[id] = "©000255000"
moderador_cor_fala[id] = "©000255000"
membro_cor_fala[id] = "©000255000"
vip_cor_fala[id] = "©000255000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000255000Verde Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 2 then
host_cor_fala[id] = "©000128000"
admin_cor_fala[id] = "©000128000"
moderador_cor_fala[id] = "©000128000"
membro_cor_fala[id] = "©000128000"
vip_cor_fala[id] = "©000128000"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000128000Verde Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 3 then
host_cor_fala[id] = "©000128128"
admin_cor_fala[id] = "©000128128"
moderador_cor_fala[id] = "©000128128"
membro_cor_fala[id] = "©000128128"
vip_cor_fala[id] = "©000128128"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000128128Ciano Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 4 then
host_cor_fala[id] = "©000000255"
admin_cor_fala[id] = "©000000255"
moderador_cor_fala[id] = "©000000255"
membro_cor_fala[id] = "©000000255"
vip_cor_fala[id] = "©000000255"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000000255Azul Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 5 then
host_cor_fala[id] = "©000000128"
admin_cor_fala[id] = "©000000128"
moderador_cor_fala[id] = "©000000128"
membro_cor_fala[id] = "©000000128"
vip_cor_fala[id] = "©000000128"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©000000128Azul Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 6 then
host_cor_fala[id] = "©255000255"
admin_cor_fala[id] = "©255000255"
moderador_cor_fala[id] = "©255000255"
membro_cor_fala[id] = "©255000255"
vip_cor_fala[id] = "©255000255"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©255000255Rosa Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 7 then
host_cor_fala[id] = "©128000128"
admin_cor_fala[id] = "©128000128"
moderador_cor_fala[id] = "©128000128"
membro_cor_fala[id] = "©128000128"
vip_cor_fala[id] = "©128000128"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©128000128Rosa Escuro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 8 then
host_cor_fala[id] = "©080000150"
admin_cor_fala[id] = "©080000150"
moderador_cor_fala[id] = "©080000150"
membro_cor_fala[id] = "©080000150"
vip_cor_fala[id] = "©080000150"
msg2(id,""..mesg.."[Servidor] Cor da fala mudado para »©080000150Roxo Claro"..mesg.."«")
menu(id,"Mudança de Cor,Cargo,Nome,Fala")

elseif button == 9 then
menu(id,"Escolha a cor da Fala 1/2,Branco,Preto,Cinza|Claro,Cinza|Escuro,Vermelho|Claro,Vermelho|Escuro,Amarelo|Claro,Amarelo|Escuro,Proximo")
end
end

end

addhook("second","segundos")
function segundos()
tempo = tempo-1
if usgn ~= 0 and tempo == 0 then
if player(usgn,"usgn") ~= 0 then
msg(""..mesg.."[Servidor] USGN do(a) "..player(usgn,"name")..": "..player(usgn,"usgn").."")
else
msg(""..mesg.."[Servidor] "..player(usgn,"name").." não possuí USGN")
end
usgn = 0
end

if iniciar == 1 then
desligar = desligar-1
end


if desligar == 30 then
msg(""..mesg.."[Servidor] "..desligar.." segundos para desligar o servidor")
end

if desligar == 15 then
msg(""..mesg.."[Servidor] "..desligar.." segundos para desligar o servidor")
end

if desligar <= 10 and desligar > 0 then
msg(""..mesg.."[Servidor] "..desligar.." segundos para desligar o servidor")
end

if desligar == 0 then
parse("quit")
end
end

addhook("team","EscolherTime")
function EscolherTime(id,team,look)
if lock == 1 then
return 1
else
return 0
end
end