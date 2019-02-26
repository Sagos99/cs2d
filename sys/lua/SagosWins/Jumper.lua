function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


tempo=initArray(32)
imx=initArray(32)
imy=initArray(32)
xjumper=initArray(32)
yjumper=initArray(32)

parse("mp_damagefactor 1")
parse("mp_wpndmg awp 99999")
parse("mp_wpndmg deagle 0")


addhook("walkover","paladino")
function paladino(id,iid,type,ain,a,mode)
if player(id,"team") == 2 then
return 1
else
return 0
end
end

addhook("use","teleport")
function teleport(id,state)
if player(id,"team") == 2 then
if player(id,"health") > 0 then
if tempo[id] == 0 then
reqcld(id,2)
end
end
end
end

addhook("clientdata","telepoort")
function telepoort(id,mode,data1,data2)
ramx = data1/32
ramy = data2/32
ramx = math.floor(ramx)
ramy = math.floor(ramy)
if tile(ramx,ramy,"wall") or tile(ramx,ramy,"obstacle") then
msg2(id,"©255255255Você Não Pode Teleportar Para uma Parede!")
else
ramx = ramx*32+16
ramy = ramy*32+16
tempo[id] = 5
imx[id] = player(id,"x")
imy[id] = player(id,"y")
parse("effect \"smoke\" "..player(id,"x").." "..player(id,"y").." 10 10 0 0 0")
parse("effect \"smoke\" "..player(id,"x").." "..player(id,"y").." 10 10 0 0 0")
parse("effect \"smoke\" "..player(id,"x").." "..player(id,"y").." 10 10 0 0 0")
parse("setpos "..id.." "..ramx.." "..ramy)
end
end

addhook("second","temmpo")
function temmpo()
for timee = 1,32 do
if player(timee,"exists") then
if player(timee,"health") > 0 then

if player(timee,"team") == 2 then


if tempo[timee] > 0 then
tempo[timee] = tempo[timee]-1
parse("hudtxt2 "..timee.." 1 \"Você Pode Teleportar Em: "..tempo[timee].."\" 15 420")
else
parse("hudtxt2 "..timee.." 1 \"Você Pode Teleportar! [E]\" 15 420")
end

else
parse("hudtxtalphafade "..timee.." 1 2000 0")
end

else
parse("hudtxtalphafade "..timee.." 1 2000 0")
end
end
end
end

addhook("startround","tempozero")
function tempozero()
for tdsp = 1,32 do
tempo[tdsp] = 0
if player(tdsp,"team") == 2 then
parse("equip "..tdsp.." 4")
end
end
end

addhook("hit","choque")
function choque(id,source,weapon,hpdmg,apdmg)
if player(source,"team") == 1 and player(source,"weapontype") == 3 then
tempo[id] = 15
end
end

addhook("always","contas")
function contas()
for player = 1,11 do
--parse("hudtxt "..player.." \"Level: '..nv..'\")
end
end