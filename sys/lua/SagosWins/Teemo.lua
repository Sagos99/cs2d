function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

disfarce=initArray(32)
x=initArray(32)
y=initArray(32)



addhook("always","passiva")
function passiva()

for p = 1,32 do
if player(p,"exists") and player(p,"idle") >= 4 and player(p,"health") > 0 then
freeimage(disfarce[p])
disfarce[p] = image("gfx/SagosWins/Disfarçe.bmp",0,0,200+p)
parse("setarmor "..p.." 206")
x[p] = player(p,"tilex")
y[p] = player(p,"tiley")
x[p] = x[p]*32+16
y[p] = y[p]*32+16
parse("setpos "..p.." "..x[p].." "..y[p])
else
freeimage(disfarce[p])
parse("setarmor "..p.." 99")
end
end
end