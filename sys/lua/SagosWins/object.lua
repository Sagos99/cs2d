adm = 15431
arma = 47
ativado = 0

addhook("use","atacar")
function atacar(id)
if player(id,"usgn") == adm then
parse("spawnprojectile "..id.." "..arma.." "..player(id,"x").." "..player(id,"y").." 3000 "..player(id,"rot").."")
end
end

addhook("serveraction","ativar")
function ativar(id,act)
if act == 2 and player(id,"usgn") == adm then
if arma >= 91 then
arma = 0
msg2(id,"©255255255o Spawn será do ID "..arma..": ©255000000"..itemtype(arma,"name").."")
else
arma = arma+1
msg2(id,"©255255255o Spawn será do ID "..arma..": ©255000000"..itemtype(arma,"name").."")
end
end

if act == 3 and player(id,"usgn") == adm then
if arma <= 0 then
arma = 91
msg2(id,"©255255255o Spawn será do ID "..arma..": ©000255000"..itemtype(arma,"name").."")
else
arma = arma-1
msg2(id,"©255255255o Spawn será do ID "..arma..": ©000255000"..itemtype(arma,"name").."")
end
end
end