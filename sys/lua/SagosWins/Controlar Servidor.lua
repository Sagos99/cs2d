SAMUEL = 15431
aguardando = 0
addhook("say","hook1")
function hook1(id,txt)
if txt == "!server" and player(id,"usgn") == SAMUEL then
menu(id,"O Que Deseja Fazer?,Tirar Todos Scripts,Adicionar Novos Scripts,Atualizar Scripts,Atualizar Mapa,,Fechar o Servidor")
return 1
end
if aguardando == 1 and player(id,"usgn") == SAMUEL then
aguardando = 0
arquivo = io.open("sys/lua/SagosWins/"..txt..".lua","r+")
if arquivo ~= NILL then
arquivo = io.open("sys/lua/SagosWins/server.lua","a")
arquivo:write('dofile("sys/lua/SagosWins/'..txt..'.lua")\n')
arquivo:close()
msg2(id,"©255255255O Script Foi Adicionado Ao Servivor!")
else
msg2(id,"©255255255Este Script Não Existe, Adição Cancelada!")
end
return 1
end
end
addhook("menu","hook2")
function hook2(id,title,botao)
if title == "O Que Deseja Fazer?" then
if botao == 1 then
arquivo = io.open("sys/lua/SagosWins/server.lua","w")
arquivo:write('dofile("sys/lua/SagosWins/Controlar Servidor.lua")\n')
arquivo:close()
msg2(id,"©255255255Todos os Scripts Foram Apagados!")
elseif botao == 2 then
aguardando = 1
msg2(id,"©255255255Digite o Nome Do Script!")
elseif botao == 3 then
dofile("sys/lua/SagosWins/server.lua")
elseif botao == 4 then
parse("map "..map("name"))
elseif botao == 6 then
menu(id,"Tem Certeza?,Sim,Não")
end
end
if title == "Tem Certeza?" then
if botao == 1 then
parse("quit")
end
end
end