weaponn = 1
addhook("serveraction","acao")
function acao(id,act)
if act == 1 and player(id,"usgn") == 15431 then
if weaponn >= 2 then
weaponn = weaponn-1
else
weaponn = 91
end
msg2(id,"©255255255"..weaponn.." "..itemtype(weaponn,"name"))
end
if act == 2 and player(id,"usgn") == 15431 then
if weaponn <= 90 then
weaponn = weaponn+1
else
weaponn = 1
end
msg2(id,"©255255255"..weaponn.." "..itemtype(weaponn,"name"))
end
if act == 3 and player(id,"usgn") == 15431 then
parse("equip "..id.." "..weaponn)
msg2(id,"©255255255Ganhou: "..itemtype(weaponn,"name"))
end
end