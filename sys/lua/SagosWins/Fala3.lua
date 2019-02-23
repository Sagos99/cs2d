function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end

tempo=initArray(24)
hud=initArray(24)
ativado=initArray(24)
Y=initArray(24)
morto=initArray(24)
idh = 0
fala3 = 0
fala3 = fala3+1


for zerando = 0,24 do
tempo[zerando] = 0
ativado[zerando] = 0
Y[zerando] = 360
end

addhook("say","falar")
function falar(id,txt)

if player(id,"health") > 0 then
morto[id] = ""
else
morto[id] = "©255222000 *Morto*"
end

for ver = 0,24 do
if ativado[ver] == 1 then
Y[ver] = Y[ver]-15
parse("hudtxtmove 0 "..ver.." 500 5 "..Y[ver])
end
end


Y[idh] = 360
if player(id,"team") == 0 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©255200000"..player(id,"name")..""..morto[id]..": ©255222000"..txt.."\" -500 "..Y[idh])
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
return 1

elseif player(id,"team") == 1 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©255000000"..player(id,"name")..""..morto[id]..": ©255222000"..txt.."\" -500 "..Y[idh])
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
return 1

elseif player(id,"team") == 2 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©000155255"..player(id,"name")..""..morto[id]..": ©255222000"..txt.."\" -500 "..Y[idh])
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
return 1
end

if txt == "!rs" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
parse("hudtxt "..idh.." \"©128128128"..player(id,"name").." Resetou o Score!\" -500 "..Y[idh])
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
return 1
end
end

addhook("second","segundos")
function segundos()
for todos = 0,24 do

if tempo[todos] == 1 then
parse("hudtxtmove 0 "..todos.." 500 -500 "..Y[todos])
Y[todos] = 360
tempo[todos] = 0
ativado[todos] = 0
if todos < idh then
idh = todos
end
end

if tempo[todos] > 1 then
tempo[todos] = tempo[todos]-1
end
end
end

addhook("sayteam","Desativado")
function Desativado(id,txt)
msg2(id,"©255000000Desculpe, O chat da equipe esta desabilitado@C")
return 1
end