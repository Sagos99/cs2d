function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

privado=initArray(32)
lk=initArray(32)
lk2=initArray(32)
lktempo=initArray(32)


jogador1  = "(Jogador Não Existe)"
jogador2  = "(Jogador Não Existe)"
jogador3  = "(Jogador Não Existe)"
jogador4  = "(Jogador Não Existe)"
jogador5  = "(Jogador Não Existe)"
jogador6  = "(Jogador Não Existe)"
jogador7  = "(Jogador Não Existe)"
jogador8  = "(Jogador Não Existe)"
jogador9  = "(Jogador Não Existe)"
jogador10 = "(Jogador Não Existe)"
jogador11 = "(Jogador Não Existe)"
jogador12 = "(Jogador Não Existe)"
jogador13 = "(Jogador Não Existe)"
jogador14 = "(Jogador Não Existe)"
jogador15 = "(Jogador Não Existe)"
jogador16 = "(Jogador Não Existe)"
jogador17 = "(Jogador Não Existe)"
jogador18 = "(Jogador Não Existe)"
jogador19 = "(Jogador Não Existe)"
jogador20 = "(Jogador Não Existe)"
correio = ""

parse("sv_maxplayers 20")
firstblood = 0
som = ""

addhook("say","vayne")
function vayne(id,txt)
if privado[id] > 0 then
msg2(privado[id],"©000255000"..player(id,"name").." [Privado]: ©255255255"..txt)
msg2(id,"©255255255Sua Menssagem: ©255000000"..txt.."©255255255 Foi Enviada")
privado[id] = 0
return 1
end

if txt == "!rs" or txt == "!reset" or txt == "!resetscore" or txt == "!RS" or txt == "!RESET" or txt == "!RESETSCORE" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©128000000Resetado com Sucesso")
return 1
end

if txt == "!atualizar" and player(id,"usgn") == 15431 then
dofile("sys/lua/testes.lua")
end
end

addhook("serveraction","shaco")
function shaco(id,act)
if act == 1 then
menu(id,"Menu Principal,Menssagem Privada")

if player(1,"exists") then
jogador1 = (player(1,"name"))
else
jogador1 = "(Jogador Não Existe)"
end

if player(2,"exists") then
jogador2 = (player(2,"name"))
else
jogador2 = "(Jogador Não Existe)"
end

if player(3,"exists") then
jogador3 = (player(3,"name"))
else
jogador3 = "(Jogador Não Existe)"
end

if player(4,"exists") then
jogador4 = (player(4,"name"))
else
jogador4 = "(Jogador Não Existe)"
end

if player(5,"exists") then
jogador5 = (player(5,"name"))
else
jogador5 = "(Jogador Não Existe)"
end

if player(6,"exists") then
jogador6 = (player(6,"name"))
else
jogador6 = "(Jogador Não Existe)"
end

if player(7,"exists") then
jogador7 = (player(7,"name"))
else
jogador7 = "(Jogador Não Existe)"
end

if player(8,"exists") then
jogador8 = (player(8,"name"))
else
jogador8 = "(Jogador Não Existe)"
end

if player(9,"exists") then
jogador9 = (player(9,"name"))
else
jogador9 = "(Jogador Não Existe)"
end

if player(10,"exists") then
jogador10 = (player(10,"name"))
else
jogador10 = "(Jogador Não Existe)"
end

if player(11,"exists") then
jogador11 = (player(11,"name"))
else
jogador11 = "(Jogador Não Existe)"
end

if player(12,"exists") then
jogador12 = (player(12,"name"))
else
jogador12 = "(Jogador Não Existe)"
end

if player(13,"exists") then
jogador13 = (player(13,"name"))
else
jogador13 = "(Jogador Não Existe)"
end

if player(14,"exists") then
jogador14 = (player(14,"name"))
else
jogador14 = "(Jogador Não Existe)"
end

if player(15,"exists") then
jogador15 = (player(15,"name"))
else
jogador15 = "(Jogador Não Existe)"
end

if player(16,"exists") then
jogador16 = (player(16,"name"))
else
jogador16 = "(Jogador Não Existe)"
end

if player(17,"exists") then
jogador17 = (player(17,"name"))
else
jogador17 = "(Jogador Não Existe)"
end

if player(18,"exists") then
jogador18 = (player(18,"name"))
else
jogador18 = "(Jogador Não Existe)"
end

if player(19,"exists") then
jogador19 = (player(19,"name"))
else
jogador19 = "(Jogador Não Existe)"
end

if player(20,"exists") then
jogador20 = (player(20,"name"))
else
jogador20 = "(Jogador Não Existe)"
end
end
end

addhook("menu","syndra")
function syndra(id,title,button)
if title == "Menu Principal" then
if button == 1 then
menu(id,"Selecione o Jogador [1/3],"..jogador1..","..jogador2..","..jogador3..","..jogador4..","..jogador5..","..jogador6..","..jogador7..","..jogador8..",Proximo")
end
end

if title == "Selecione o Jogador [1/3]" then
if button == 1 then
privado[id] = 1
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 2 then
privado[id] = 2
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 3 then
privado[id] = 3
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 4 then
privado[id] = 4
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 5 then
privado[id] = 5
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 6 then
privado[id] = 6
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 7 then
privado[id] = 7
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 8 then
privado[id] = 8
msg2(id,"©255255255Digite sua Menssagem")
elseif button == 9 then
menu(id,"Selecione o Jogador [2/3],"..jogador9..","..jogador10..","..jogador11..","..jogador12..","..jogador13..","..jogador14..","..jogador15..",Proximo,Voltar")
end
end

if title == "Selecione o Jogador [2/3]" then
if button == 1 then
privado[id] = 9
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 2 then
privado[id] = 10
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 3 then
privado[id] = 11
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 4 then
privado[id] = 12
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 5 then
privado[id] = 13
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 6 then
privado[id] = 14
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 7 then
privado[id] = 15
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 8 then
menu(id,"Selecione o Jogador [3/3],"..jogador16..","..jogador17..","..jogador18..","..jogador19..","..jogador20..",Voltar")

elseif button == 9 then
menu(id,"Selecione o Jogador [1/3],"..jogador1..","..jogador2..","..jogador3..","..jogador4..","..jogador5..","..jogador6..","..jogador7..","..jogador8..",Proximo")
end
end

if title == "Selecione o Jogador [3/3]" then
if button == 1 then
privado[id] = 16
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 2 then
privado[id] = 17
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 3 then
privado[id] = 18
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 4 then
privado[id] = 19
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 5 then
privado[id] = 20
msg2(id,"©255255255Digite sua Menssagem")

elseif button == 6 then
menu(id,"Selecione o Jogador [2/3],"..jogador9..","..jogador10..","..jogador11..","..jogador12..","..jogador13..","..jogador14..","..jogador15..",Proximo,Voltar")
end
end
end

addhook("join","ashe")
function ashe(id)
parse("sv_sound2 "..id.." league of legends/bem-vindo.ogg")
end

addhook("startround","blitzcrank")
function blitzcrank()
firstblood = 0
end

addhook("always","brand")
function brand()
if som ~= "" then
parse("sv_sound league of legends/"..som..".ogg")
som = ""
end
end

addhook("second","leblanc")
function leblanc()
for jogadores = 1,20 do

if lktempo[jogadores] > 0 then
lktempo[jogadores] = lktempo[jogadores]-1
end

if lktempo[jogadores] == 0 then
lk[jogadores] = 0
end
end
end

addhook("kill","annie")
function annie(killer,victim,weapon,x,y)
lktempo[killer] = 10
lk[killer] = lk[killer]+1
lk2[killer] = lk2[killer]+1

if lk2[victim] > 2 and killer > 0 then
som = "neutralizado"
lk2[victim] = 0
lk[victim] = 0
end
if killer == 0 then
som = "executado"
end

if lk2[killer] == 3 then
som = "killingspree"
end

if lk2[killer] == 4 then
som = "enfurecido"
end

if firstblood == 0 then
som = "first blood"
firstblood = 1
end

if lk[killer] == 2 then
som = "doublekill"
end

if lk[killer] == 3 then
som = "triplekill"
end

if lk[killer] == 4 then
som = "quadrakill"
end

if lk[killer] == 5 then
som = "pentakill"
end

if lk[killer] == 6 then
som = "morte lendaria"
end

if lk[killer] > 6 then
som = "lendario"
end
end