----------------------------------------------------------------------
----------------------Script By SagosWins-----------------------------
----------------------------------------------------------------------

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


ativa=initArray(32)
hp=initArray(32)
time=initArray(32)
time2=initArray(32)

addhook("hit","flamethrower")
function flamethrower(id,victim,weapon)
if weapon == 46 then
ativa[id] = 1
time[id] = 10
end
end

addhook("always","queimar")
function queimar()

for oi = 1,32 do

if ativa[oi] == 1 and player(oi,"exists") then
time2[oi] = time2[oi]+1
end

if time2[oi] > 14 then
time2[oi] = 0
hp[oi] = player(oi,"health")-2
parse("sethealth "..oi.." "..hp[oi].."")
time[oi] = time[oi]-1
parse('effect "fire" '..player(oi,"x")..' '..player(oi,"y")..' 15 15 15 15 0')
end

if time[oi] < 1 then
ativa[oi] = 0
time[oi] = 10
end

end
end