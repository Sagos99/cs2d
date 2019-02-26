function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


hp=initArray(32)

parse("mp_building_limit \"gate field\" 10")
parse("mp_building_limit \"turret\" 3")
parse("mp_building_limit \"dispenser\" 1")
parse("mp_building_limit \"supply\" 1")
parse("mp_dispenser_money 8000")
parse("mp_dispenser_health 9")
parse("mp_turretdamage 2")
parse("mp_infammo 0")
parse("mp_wpndmg claw 70")
parse("mp_zombiespeedmod 4")
parse("mp_zombiedmg 0.2")
parse("mp_zombierecover 12")
parse("mp_zombiekillscore 2")
parse("mp_zombiekillequip 86")
parse("sv_gm 4")
parse("sv_fow 1")
parse("mp_roundtime 7")
parse("mp_damagefactor 1.0")

tempo = 30
escolhido = 0
arc = 0

addhook("startround","CT")
function CT()
for CTs = 1,32 do
if player(CTs,"exists") and player(CTs,"team") == 1 then
parse("makect "..CTs)
tempo = 17
escolhido = 0
end
end
end

addhook("second","escolhendo")
function escolhendo()

if tempo > -2 then
tempo = tempo-1
end

if tempo > 0 and tempo < 11 then
msg("©255255255"..tempo.."@C")
parse("sv_sound SagosWins/zumbi/"..tempo..".ogg")
end

if tempo == 14 then
msg("©255000000O Virus Esta se Espalhando...@C")
end

for arr = 1,32 do
if player(arc,"team") == 1 then
arc = arc+1
end
end
if arc > 0 and tempo > -4 and tempo < 0 then
tempo = 17
arc = 0
end
end

addhook("kill","soms")
function soms(killer,victim,weapon,x,y)

if player(killer,"team") == 1 then
morrer = math.random(1,3)
parse("sv_sound SagosWins/zumbi/Transforma"..morrer..".ogg")

--parse("customkill "..killer.." "..player(killer,"weapontype").." "..victim)
parse("maket "..victim)
parse("spawnplayer "..victim.." "..player(victim,"x").." "..player(victim,"y"))
parse("equip "..victim.." 78")

return 1

elseif player(killer,"team") == 2 then
morrer = math.random(1,5)
parse("sv_sound SagosWins/zumbi/Morrer"..morrer..".ogg")
end
end

addhook("always","inteligente")
function inteligente()

if tempo < 0 and escolhido == 0 then
zumbi = math.random(1,32)
if player(zumbi,"team") == 2 and player(zumbi,"health") > 0 and escolhido == 0 then
vira = math.random(1,3)
if vira == 1 then
escolhido = zumbi
parse("maket "..zumbi)
parse("spawnplayer "..zumbi.." "..player(zumbi,"x").." "..player(zumbi,"y"))
som = math.random(1,2)
parse("sv_sound SagosWins/zumbi/Escolhido"..som..".ogg")
msg("©255000000O "..player(zumbi,"name").." Esta Infectado!!!@C")
end
end
end
end