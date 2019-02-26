----------------------------------------------------------------------
----------------------Script By SagosWins-----------------------------
--------------------Criado No Dia 24/11/2012--------------------------
----------------------------------------------------------------------

SagosWins = 15431

ativado = 0
fimxxx = map("xsize")
fimyyy = map("xsize")
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
status = "direita_baixo"
velocidade = 8

addhook("serveraction","ativando_bola_de_fogo")
function ativando_bola_de_fogo(id,act)

if act == 1 and player(id,"usgn") == SagosWins then
if ativado == 0 then
ativado = 1
elseif ativado == 1 then
ativado = 0
end
end
end

addhook("always","movimento")
function movimento()

if status == "direita_baixo" then
x = x+velocidade
y = y+velocidade
elseif status == "esquerda_baixo" then
x = x-velocidade
y = y+velocidade
elseif status == "esquerda_cima" then
x = x-velocidade
y = y-velocidade
elseif status == "direita_cima" then
x = x+velocidade
y = y-velocidade
elseif status == "cima" then
y = y-velocidade
elseif status == "baixo" then
y = y+velocidade
elseif status == "direita" then
x = x+velocidade
elseif status == "esquerda" then
x = x-velocidade
end

tilex = x/32
tiley = y/32

if status == "direita_baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "esquerda_baixo"
elseif virar == 2 then
status = "esquerda"
end

elseif status == "esquerda_baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "esquerda_cima"
elseif virar == 2 then
status = "cima"
end

elseif status == "esquerda_cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "direita_cima"
elseif virar == 2 then
status = "direita"
end

elseif status == "direita_cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,2)
if virar == 1 then
status = "direita_baixo"
elseif virar == 2 then
status = "baixo"
end

elseif status == "cima" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "baixo"
elseif virar == 2 then
status = "esquerda_baixo"
elseif virar == 3 then
status = "direita_baixo"
end

elseif status == "baixo" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "cima"
elseif virar == 2 then
status = "direita_cima"
elseif virar == 3 then
status = "esquerda_cima"
end

elseif status == "direita" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "esquerda"
elseif virar == 2 then
status = "esquerda_cima"
elseif virar == 3 then
status = "esquerda_baixo"
end

elseif status == "esquerda" and tile(tilex,tiley,"wall") then
virar = math.random(1,3)
if virar == 1 then
status = "direita"
elseif virar == 2 then
status = "direita_cima"
elseif virar == 3 then
status = "direita_baixo"
end
end

if tilex > fimxxx or tiley > fimyyy then
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
elseif tilex < 0 or tiley < 0 then
x = fimxxx/2
y = fimyyy/2
x = x*32
y = y*32
end

if ativado == 1 then
parse("effect \"fire\" "..x.." "..y.." 10 10 0 0 0")
xx = x/32
yy = y/32
for minhoca = 1,32 do
if player(minhoca,"tilex") == xx and player(minhoca,"tiley") == yy then
parse("customkill 0 Minhoca De Fogo "..minhoca)
end
end
end
end