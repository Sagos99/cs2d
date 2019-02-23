function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

hp=initArray(32)
tempinho=initArray(32)
somente = 0

addhook("ms100","regenerar")
function regenerar()
for full = 1,32 do
tempinho[full] = tempinho[full]+1
if tempinho[full] > 3 and player(full,"exists") then
hp[full] = player(full,"health")+1
parse("sethealth "..full.." "..hp[full])
tempinho[full] = 0
end
end
end

addhook("movetile","mover")
function mover(id,x,y)
if x == 50 and y == 50 then
somente = 1
end
end

addhook("startround","ini")
function ini()
somente = 0
end

addhook("bombplant","plantar")
function plantar(id,x,y)
if somente == 1 then
return 0
else
msg2(id,"©255000000[Erro]Só pode Plantar a Bomba quando o CT chegar no FIM")
return 1
end
end