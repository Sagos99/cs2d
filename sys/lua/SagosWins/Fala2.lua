function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


htime=initArray(32)
hud=initArray(32)
onde=initArray(32)

onde[1]  = 360
onde[2]  = 345
onde[3]  = 330
onde[4]  = 315
onde[5]  = 300
onde[6]  = 285
onde[7]  = 270
onde[8]  = 255
onde[9]  = 240
onde[10] = 225
onde[11] = 210
onde[12] = 195
onde[13] = 180
onde[14] = 165
onde[15] = 150
onde[16] = 135
onde[17] = 120
onde[18] = 105
onde[19] = 90
onde[20] = 75
onde[21] = 60
onde[22] = 45
onde[23] = 30
onde[24] = 15
onde[25] = 0

idh = 1

addhook("say","falar")
function falar(id,txt)

if htime[idh] > 0 then
idh = idh+1
end

hud[idh] = 1
htime[idh] = 7

if player(id,"health") == 0 and player(id,"team") > 0 then
mortinho = " *Morto*"
else
mortinho = ""
end

if player(id,"team") == 0 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©255200000"..player(id,"name").." *Spec*: ©226226050"..txt.."\" -500 "..onde[idh].."")
parse("hudtxtmove 0 "..idh.." 500 5 "..onde[idh].."")
return 1

elseif player(id,"team") == 1 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©255000000"..player(id,"name").." "..mortinho..": ©226226050"..txt.."\" -500 "..onde[idh].."")
parse("hudtxtmove 0 "..idh.." 500 5 "..onde[idh].."")
return 1

elseif player(id,"team") == 2 and txt ~= "!rs" then
parse("hudtxt "..idh.." \"©000155255"..player(id,"name").." "..mortinho..": ©226226050"..txt.."\" -500 "..onde[idh].."")
parse("hudtxtmove 0 "..idh.." 500 5 "..onde[idh].."")
return 1
end

if txt == "!rs" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Pontuação Resetada!")
return 1
end
end

addhook("sayteam","erro")
function erro(id,txt)
msg2(id,"©255000000[Erro]@C")
msg2(id,"©255000000Desculpe, Devido a um bug o chat da equipe esta desabilitado@C")
return 1
end

addhook("second","apagar")
function apagar()
for qu = 1,32 do

if htime[qu] > 0 then
htime[qu] = htime[qu]-1
end

if htime[qu] == 0 and hud[qu] == 1 then
hud[qu] = 0
parse("hudtxtmove 0 "..qu.." 500 -500 "..onde[qu].."")
if idh > 1 then
idh = idh-1
end
end
end

if idh > 25 then
idh = 1
end
end