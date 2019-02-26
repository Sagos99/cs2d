function initArray(m)
local array = {}
for i = 1, m
do array[i]=0
end
return array
end

disfarce=initArray(32)
x=initArray(32)
y=initArray(32)
inv=initArray(32)
inicio = 0
parse("mp_wpndmg awp 95")

for aaa = 1,32 do
inv[aaa] = 0
end


addhook("startround","NovaRodada")
function NovaRodada()
inicio = 1
end

addhook("drop","largar")
function largar(id,iid,tipe)
if player(id,"team") == 1 and tipe ~= 55 then
return 1
else
return 0
end
end

addhook("walkover","coletar")
function coletar(id,iid,tipe)
if player(id,"team") == 1 and tipe ~= 55 or player(id,"team") == 2 and tipe == 74 then
return 1
else
return 0
end
end

addhook("die","morrer")
function morrer(id,source)
if player(source,"team") == 1 then
return 1
else
return 0
end
end

addhook("buy","comprar")
function comprar(id)
if player(id,"team") == 1 then
return 1
else
return 0
end
end

addhook("ms100","milesecond")
function milesecond()
for jogadores = 1,32 do

if player(jogadores,"exists") and player(jogadores,"idle") >= 1 and player(jogadores,"health") > 0 and player(jogadores,"team") == 1 and inv[jogadores] == 1 then
parse("setarmor "..jogadores.." 206")
disfarce[jogadores] = image("gfx/SagosWins/Invisivel.bmp",0,0,200+jogadores)
x[jogadores] = player(jogadores,"tilex")
y[jogadores] = player(jogadores,"tiley")
x[jogadores] = x[jogadores]*32+16
y[jogadores] = y[jogadores]*32+16
parse("setpos "..jogadores.." "..x[jogadores].." "..y[jogadores])
inv[jogadores] = 0
end

if player(jogadores,"exists") and player(jogadores,"armor") == 206 and player(jogadores,"team") == 2 then
parse("setarmor "..jogadores.." 0")
end
end
end

addhook("move","mover")
function mover(id)
inv[id] = 1
parse("setarmor "..id.." 0")
freeimage(disfarce[id])
end

addhook("attack","atacar")
function atacar(id)
inv[id] = 1
parse("setarmor "..id.." 0")
freeimage(disfarce[id])
end

addhook("second","segundos")
function segundos()
for ppp = 1,32 do
if player(ppp,"exists") and player(ppp,"health") > 0 and player(ppp,"team") == 2 then
vida = player(ppp,"health")+2
parse("sethealth "..ppp.." "..vida)
end
end

if inicio == 1 then
inicio = 0
for pp = 1,32 do
if player(pp,"team") == 1 then
parse("equip "..pp.." 35")
parse("speedmod "..pp.." 5")
parse("equip "..pp.." 54")
end
end
end
end

addhook("hitzone","objeto")
function objeto(iid,pid,oid,weapon,x,y,dmg)
parse("setpos "..pid.." "..x.." "..y.."")
end