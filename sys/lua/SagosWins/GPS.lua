eu = 0
x = 0
y = 0
xkra = 0
ykra = 0
gpsx = 0
gpsy = 0
inicio = 0
direcao = ""
actived = 0
guia = image("gfx/SagosWins/guia.bmp",x,y,0)
freeimage(guia)

addhook("say","dizer")
function dizer(id,txt)
for k = 1,32 do
if txt == "!gps '..k..'" and player(id,"usgn") == 0 then
actived = 1

xkra = player(k,"tilex")
ykra = player(k,"tiley")

eu = id
x = player(id,"tilex")
y = player(id,"tiley")
gpsx = x
gpsy = y

end
end

if y < ykra then
direcao = "cima"
elseif y > ykra then
direcao = "baixo"
elseif x > xkra then
direcao = "esquerdo"
elseif x < ykra then
direcao = "direito"
end

if txt == "!parar" and player(id,"usgn") == 0 then
direcao = ""
end
end

addhook("second","indo")
function indo()
if direcao == "cima" then
y = y-1
end

if tile(x,y,"wall") then
y = y+1
inicio = math.random(1,3)

if inicio == 1 then
direcao = "baixo"
elseif inicio == 2 then
direcao = "esquerdo"
elseif inicio == 3 then
direcao = "direito"
else
guia = image("gfx/SagosWins/guia.bmp",x*32,y*32,0)
end
end

if direcao == "baixo" then
y = y+1
end

if tile(x,y,"wall") then
y = y-1
inicio = math.random(1,3)
if inicio == 1 then
direcao = "cima"
elseif inicio == 2 then
direcao = "esquero"
elseif inicio == 3 then
direcao = "direito"
else
guia = image("gfx/SagosWins/guia.bmp",x*32,y*32,0)
end
end

if direcao == "esquerdo" then
x = x-1
end

if tile(x,y,"wall") then
x = x+1
inicio = math.random(1,3)
if inicio == 1 then
direcao = "cima"
elseif inicio == 2 then
direcao = "baixo"
elseif inicio == 3 then
direcao = "direito"
else
guia = image("gfx/SagosWins/guia.bmp",x*32,y*32,0)
end
end

if direcao == "direito" then
x = x+1
end

if tile(x,y,"wall") then
x = x-1
inicio = math.random(1,4)
if inicio == 1 then
direcao = "cima"
elseif inicio == 2 then
direcao = "baixo"
elseif inicio == 3 then
direcao = "esquerdo"
else
guia = image("gfx/SagosWins/guia.bmp",x*32,y*32,0)
end
end
end