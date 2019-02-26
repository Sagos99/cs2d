function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


ativado=initArray(32)
laserx=initArray(32)
lasery=initArray(32)

for inicio = 1,32 do
ativado[inicio] = 0
end

caminho = "gfx/laser1.bmp"

img = image(caminho,0,0,1)
freeimage(img)

addhook("flashlight","on_off")
function on_off(id,state)
if state == 1 then
laserx[id] = player(id,"x")
lasery[id] = player(id,"y")
ativado[id] = 1
img = image(caminho,1,0,id+100)
imagehitzone(img,102)
--msg2(id,"©000255000Laser Ligado")
elseif state == 0 then
ativado[id] = 0
--msg2(id,"©255000000Laser Desligado")
freeimage(img)
end
end


--[[
addhook("always","way")
function way()
for j = 1,32 do

if ativado[j] == 1 then
x = laserx[j]/32
y = lasery[j]/32
x = math.floor(x)
y = math.floor(y)
if tile(x,y,"wall") then

else
laserx[j] = laserx[j]+4
img = image(caminho,laserx[j],lasery[j],j+132)

end
end
end
end
--]]