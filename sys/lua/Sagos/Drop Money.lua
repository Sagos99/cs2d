addhook("say","open")
function open(id,txt)
if txt == "!money" or txt == "!MONEY" then
if player(id,"health") > 0 then
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
end
end
end

addhook("menu","funcao")
function funcao(id,titulo,botao)
if titulo == "Quanto Money Quer Dropar?" then
if botao == 1 then
if player(id,"money") > 99 then
parse("spawnitem 66 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-100
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end

elseif botao == 2 then
if player(id,"money") > 499 then
parse("spawnitem 67 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-500
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end

elseif botao == 3 then
if player(id,"money") > 999 then
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-1000
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end

elseif botao == 4 then
if player(id,"money") > 4999 then
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-5000
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end

elseif botao == 5 then
if player(id,"money") > 9999 then
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-10000
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end

elseif botao == 6 then
if player(id,"money") > 15999 then
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
money = player(id,"money")-16000
parse("setmoney "..id.." "..money)
menu(id,"Quanto Money Quer Dropar?,100,500,1.000,5.000,10.000,16.000")
else
msg2(id,"©255000255Money Insuficiente Para Dropar Esta Quantia!")
end
end
end
end