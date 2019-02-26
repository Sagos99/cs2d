-------------------------------------------------------------
----------------Script Criado por Sagoswins------------------
-------------------------------------------------------------

usgn_do_adm = 15431
velocidade_voo = 7

vookk = 0
xvookk = 0
yvookk = 0
xmkk = 0
ymkk = 0
eukk = 0

addhook("serveraction","ativarVoo")
function ativarVoo(id,act)
if player(id,"usgn") == usgn_do_adm then
if act == 2 then
reqcld(1,2)
eukk = (""..id)
xmkk = player(id,"x")
ymkk = player(id,"y")
vookk = 1
--freeimage(id)
--asa=image("gfx/minho/asas.png",10,10,200+id)
end
end
end

addhook("clientdata","recebeValor")
function recebeValor(id,mode,data1kk,data2kk)
xvookk = data1kk
yvookk = data2kk
end

addhook("always","voar")
function voar()

if (player(eukk,"exists")) then
if vookk == 1 then
if player(eukk,"x") < xvookk then
xmkk = xmkk+velocidade_voo
parse("setpos "..eukk.." "..xmkk.." "..ymkk)
end
end
end

if vookk == 1 then
if player(eukk,"x") > xvookk then
xmkk = xmkk-velocidade_voo
parse("setpos "..eukk.." "..xmkk.." "..ymkk)
end
end

if vookk == 1 then
if player(eukk,"y") > yvookk then
ymkk = ymkk-velocidade_voo
parse("setpos "..eukk.." "..xmkk.." "..ymkk)
end
end

if vookk == 1 then
if player(eukk,"y") < yvookk then
ymkk = ymkk+velocidade_voo
parse("setpos "..eukk.." "..xmkk.." "..ymkk)
end
end

for xxkk = xvookk-10,xvookk+10 do
for yykk = yvookk-10,yvookk+10 do
if player(eukk,"x") == xxkk and player(eukk,"y") == yykk then
vookk = 0
--freeimage(asa)
end
end
end
end