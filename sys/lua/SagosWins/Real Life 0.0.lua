-------------------------------------------------------------
---------------Script Real Life 0.0 By SagosWins-------------
-------------------Criado No Dia 08/07/2013------------------
-----------------Atualizado No Dia ??/??/????----------------
-------------------------------------------------------------

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


casa1=initArray(32)
money=initArray(32)


arquivo = io.open("sys/lua/sagoswins/Data Base/Casas/Casa1.txt","r")
lendo = arquivo:read("*a")
casa1dono = tostring(lendo)
arquivo:close()
money[1] = 31647


addhook("always","sempre")
function sempre()
for jogadores = 1,32 do
parse("hudtxt2 "..jogadores.." 1 \"Dinheiro: "..money[jogadores].."\" 5 180")
end
end

addhook("use","usar")
function usar(id,event,data,x,y)
if x == 54 and y == 58 then
menu(id,"Casa1 de "..casa1dono..",Comprar Casa|30.000")
end
end

addhook("menu","menus")
function menus(id,title,button)
if title == "Casa1 de "..casa1dono.."" then
if button == 1 then
if money[id] >= 30000 then
Gravando = io.open("sys/lua/sagoswins/Data Base/Casas/Casa1.txt","w+")
Gravando:write(""..player(id,"name"))
Gravando:close()
casa1[id] = 1
money[id] = money[id]-30000
msg2(id,"©000255000Propriedade Adquirida.")
else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente.")
end
end
end

if title == "Menu" then
if button == 1 then
menu(id,"Minha Casa,Abrir Porta")
end

addhook("serveraction","acao")
function acao(id,act)
if act == 1 then
menu(id,"Menu,Minha Casa")
end
end