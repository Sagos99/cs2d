function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


time=initArray(32)

addhook("say","falar")
function falar(id,txt)
if time[id] > 0 then
msg2(id,"©255255255Você esta Falando Rápido demais")
return 1
end

if player(id,"health") == 0 and player(id,"team") > 0 then
mortinho = " *Morto*"
else
mortinho = ""
end

if player(id,"team") == 0 and txt ~= "!rs" and time[id] == 0 then
msg("©255200000"..player(id,"name").." *Spec*: ©226226050"..txt)
time[id] = 17
return 1
elseif player(id,"team") == 1 and txt ~= "!rs" and time[id] == 0 then
msg("©255000000"..player(id,"name")..""..mortinho..": ©226226050"..txt)
time[id] = 17
return 1
elseif player(id,"team") == 2 and txt ~= "!rs" and time[id] == 0 then
msg("©000155255"..player(id,"name")..""..mortinho..": ©226226050"..txt)
time[id] = 17
return 1
end

if txt == "!rs" or txt == "!Rs" or txt == "!RS" or txt == "!rS" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Pontuação Resetada!")
return 1
end
end

addhook("ms100","flood")
function flood()
for tody = 1,32 do
if time[tody] > 0 then
time[tody] = time[tody]-1
end
end
end