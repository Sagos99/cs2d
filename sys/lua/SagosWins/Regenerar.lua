function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end
hp=initArray(32)
tempo=initArray(32)
addhook("ms100","regenerar")
function regenerar()
for full = 1,32 do
tempo[full] = tempo[full]+1
if tempo[full] > 3 and player(full,"exists") then
hp[full] = player(full,"health")+1
parse("sethealth "..full.." "..hp[full])
tempo[full] = 0
end
end
end