sagos = 15431
ativai = 0

addhook("serveraction","pergunta")
function pergunta(id,act)
if act == 1 and player(id,"usgn") == sagos then
if ativai == 0 then
sagos = (""..id)
ativai = 1
else
sagos = (""..id)
ativai = 0
end
end
end

addhook("always","resposta")
function resposta()
if ativai == 1 then
reqcld(sagos,2)
end
end

addhook("clientdata","resposta2")
function resposta2(id,mode,data1,data2)
certox = data1/32
certoy = data2/32
arma = math.random(1,91)
parse("spawnitem "..arma.." "..certox.." "..certoy)
end