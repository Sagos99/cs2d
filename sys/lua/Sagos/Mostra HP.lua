-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

adm = 0

addhook("serveraction","meuid")
function meuid(id,act)
if player(id,"usgn") == 15431 and act == 1 then
if adm == 0 then
adm = 1
else
adm = 0
end
end
end

addhook("always","mostraHP")
function mostraHP()

for jogador = 1,32 do

if player(jogador,"exists") then
if adm == 1 then
sep = 85+jogador*15
parse("hudtxt2 1 "..jogador.." \""..player(jogador,"name")..": ["..player(jogador,"health").." HP]   ["..player(jogador,"armor").." Armor]\" 5 "..sep.." 0")

elseif adm == 0 then
parse("hudtxtmove 0 "..jogador.." 0 -99 -99")
end
else
parse("hudtxtmove 0 "..jogador.." 0 -99 -99")
end
end
end