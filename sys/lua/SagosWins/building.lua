----------------------------------------------------------------------
----------------------Script By Sagoswins-----------------------------
----------------------------------------------------------------------

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


ligar1=initArray(32)
ligar2=initArray(32)
tipo=initArray(32)
x1=initArray(32)
y1=initArray(32)
x2=initArray(32)
y2=initArray(32)

addhook("build","ativar_construcao")
function ativar_construcao(id,type,x,y)
if player(id,"usgn") == 15431 then
ligar1[id] = 1
tipo[id] = type
return 1
else
parse("spawnobject "..type.." "..x.." "..y.." 90 1 "..player(id,"team").." "..id)
return 1
end
end

addhook("serveraction","selecionar_area")
function selecionar_area(id,act)
if ligar2[id] == 1 and act == 1 then
reqcld(id,2)
ligar2[id] = 0
xx1 = x1
xxx1 = x1
yy1 = y1
while x1 < x2 do
if tile(x1,y1,"wall") or tile(x1,y1,"obstacle") then
else
parse("spawnobject "..tipo[id].." "..x1.." "..y1.." 90 1 "..player(id,"team").." "..id)
end
x1 = x1+1
end
while y1 < y2 do
if tile(xx1,y1,"wall") or tile(xx1,y1,"obstacle") then
else
parse("spawnobject "..tipo[id].." "..xx1.." "..y1.." 90 1 "..player(id,"team").." "..id)
end
y1 = y1+1
end
while yy1 < y2 do
if tile(x1,yy1,"wall") or tile(x1,yy1,"obstacle") then
else
parse("spawnobject "..tipo[id].." "..x1.." "..yy1.." 90 1 "..player(id,"team").." "..id)
end
yy1 = yy1+1
end
while xxx1 <= x2 do
if tile(xxx1,y1,"wall") or tile(xxx1,y1,"obstacle") then
else
parse("spawnobject "..tipo[id].." "..xxx1.." "..y1.." 90 1 "..player(id,"team").." "..id)
end
xxx1 = xxx1+1
end
end
if ligar1[id] == 1 and act == 1 then
reqcld(id,2)
ligar1[id] = 0
ligar2[id] = 1
end
end

addhook("clientdata","receber_valores")
function receber_valores(id,mode,data1,data2)
if ligar1[id] == 1 then
x1 = data1/32
y1 = data2/32
x1 = math.floor(x1)
y1 = math.floor(y1)
end
if ligar2[id] == 1 then
x2 = data1/32
y2 = data2/32
x2 = math.floor(x2)
y2 = math.floor(y2)
end
end

parse("mp_building_limit \"Wall I\" 9999")
parse("mp_building_limit \"Wall II\" 9999")
parse("mp_building_limit \"Wall III\" 9999")
parse("mp_building_limit \"Barricade\" 9999")
parse("mp_building_limit \"Turret\" 9999")
parse("mp_building_limit \"Dispenser\" 9999")
parse("mp_building_limit \"Supply\" 9999")
parse("mp_building_limit \"Gate field\" 9999")
parse("mp_building_limit \"teleporter entrance\" 9999")
parse("mp_building_limit \"teleporter exit\" 9999")
parse("mp_building_limit \"barbed wire\" 9999")
parse("mp_building_price \"teleporter entrance\" 0")
parse("mp_building_price \"teleporter exit\" 0")
parse("mp_building_price \"barbed wire\" 0")
parse("mp_building_price \"Wall I\" 0")
parse("mp_building_price \"Wall II\" 0")
parse("mp_building_price \"Wall III\" 0")
parse("mp_building_price \"Barricade\" 0")
parse("mp_building_price \"Turret\" 0")
parse("mp_building_price \"Dispenser\" 0")
parse("mp_building_price \"Supply\" 0")
parse("mp_building_price \"Gate field\" 0")