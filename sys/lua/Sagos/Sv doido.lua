----------------------------------------------------------------------
----------------------Script By SagosWins-----------------------------
----------------------------------------------------------------------

Sagoswins = 15431

des1 = 0
des2 = 0

ver1 = 0
ver2 = 0

while tile(des1,des2,"walkable") do
des1 = des1+1
des2 = des2+1
end

while tile(des1,des2,"wall") do
des1 = des1+1
des2 = des2+1
end

ver1 = des1*32+32
ver2 = des2*32+32
velocidade = 16
bolax = ver1
bolay = ver2
convx = 0
convy = 0
reflet = 0
troca1 = 0
troca2 = 0
bolaati = 0

addhook("always","minhocadefogo")
function minhocadefogo()
convx = bolax/32
convy = bolay/32

if tile(convx,convy,"wall") then
if troca1 == 0 then
troca1 = 1
else
troca1 = 0
end
end

if troca1 == 1 then
if reflet == 0 then
bolax = bolax-velocidade
reflet = 1
else
bolay = bolay+velocidade
reflet = 0
end
else
if reflet == 1 then
bolax = bolax+velocidade
else
bolay = bolay-velocidade
end
end

if bolaati == 1 then
boilax = bolax/32
boilay = bolay/32
parse("spawnnpc 4 "..boilax.." "..boilay)
end
end

addhook("serveraction","ativaraboladefogo")
function ativaraboladefogo(id,act)
if act == 1 and player(id,"usgn") == Sagoswins then
if bolaati == 0 then
bolaati = 1
else
bolaati = 0
end
end
end