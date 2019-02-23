function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end


kami=initArray(32)
kami_id=initArray(32)
kami_tempo=initArray(32)
for variavel = 1,32 do
kami_tempo[variavel] = 30
end

addhook("say","kamikaze")
function kamikaze(id,txt)	
if txt == "!kamikaze" or txt == "!KAMIKAZE" then
if player(id,"health") > 0 then
kami[id] = 1
parse("speedmod "..id.." 10")
msg("©000255255"..player(id,"name").." Virou um Homem-Bomba!")
end
return 1
end
end

addhook("ms100","pegandofogo")
function pegandofogo()
for jogo = 1,32 do
if kami[jogo] == 1 then
parse('effect "fire" '..player(jogo,"x")..' '..player(jogo,"y")..' 15 15 15 15 0')
kami_tempo[jogo] = kami_tempo[jogo]-1
end

if kami_tempo[jogo] < 1 then
kami[jogo] = 0
kami_tempo[jogo] = 30
parse("customkill 0 Kamikaze "..jogo)
parse("explosion "..player(jogo,"x").." "..player(jogo,"y").." 130 9999999 "..jogo)
end
if player(jogo,"exists") and player(jogo,"health") > 0 then
else
kami[jogo] = 0
kami_tempo[jogo] = 30
end
end
end

min2 = 0
addhook("minute","minutos2")
function minutos2()
min2 = min2+1
if min2 == 2 then
min2 = 0
msg("©000255255Para Ser um Homem-Bomba Digite !kamikaze")
end
end