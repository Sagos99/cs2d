function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end
doistile=initArray(32)
tempoa=initArray(32)
addhook("movetile","antihack")
function antihack(id,x,y)
doistile[id] = doistile[id]+1
if doistile[id] > 22 then
if tempoa[id] > 1 then
tempoa[id] = 0
doistile[id] = 0
elseif player(id,"ping") < 215 then
msg("©100100255O Script Detectou Que "..player(id,"name").." Usou Speed-Hacker! (Kikado)")
parse("kick "..id.." \"O Script do SagosWins Detectou Que Voçe Estava Usando Speed-Hacker!\"")
end
end
end
addhook("second","contagem")
function contagem()
for allid = 1,32 do
tempoa[allid] = tempoa[allid]+1
end
end






