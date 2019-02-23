-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

function initArray(m)
local array = {}
for i = 1, m 
do array[i]=0
end
return array
end
afk=initArray(32)
addhook("second","coletando")
function coletando()
for qq = 1,32 do
if player(qq,"idle") == 30 and player(qq,"health") > 0 then
msg("©000255000"..player(qq,"name").." Esta Ausente!")
afk[qq] = 1
end
if afk[qq] == 1 and player(qq,"idle") == 0 then
msg("©000255000"..player(qq,"name").." Voltou a Jogar!")
afk[qq] = 0
end
end
end