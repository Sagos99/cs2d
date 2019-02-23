jogo_da_velha = true
status = "fora"
a11 = 0
a12 = 0
a13 = 0
a21 = 0
a22 = 0
a23 = 0
a31 = 0
a32 = 0
a33 = 0
x11 = 0
x12 = 0
x13 = 0
x21 = 0
x22 = 0
x23 = 0
x31 = 0
x32 = 0
x33 = 0
b11 = 0
b12 = 0
b13 = 0
b21 = 0
b22 = 0
b23 = 0
b31 = 0
b32 = 0
b33 = 0
xxxx = 0
bola = 0
vez = "xxxx"
fala3 = 0

if jogo_da_velha == true then
parse("trigger wall3")
end

addhook("movetile","movendo_piso")
function movendo_piso(id,x,y)
if x == 20 and y == 25 then

if xxxx == 0 then
xxxx = id
elseif bola == 0 then
bola = id
elseif bola ~= 0 then
parse("setpos "..id.." 656 752")
end

end

if x == 20 and y == 24 then

if xxxx == id then
xxxx = 0
end
if bola == id then
bola = 0
end

end
end

addhook("use","usar")
function usar(id,event,data)
xp = player(id,"tilex")*32+16
yp = player(id,"tiley")*32+16
xt = player(id,"tilex")
yt = player(id,"tiley")

if xt == 19 and yt == 29 and id == xxxx and vez == "xxxx" and a11 == 0 then
a11 = 1
x11 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 20 and yt == 29 and id == xxxx and vez == "xxxx" and a12 == 0 then
a12 = 1
x12 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end


if xt == 21 and yt == 29 and id == xxxx and vez == "xxxx" and a13 == 0 then
a13 = 1
x13 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 19 and yt == 30 and id == xxxx and vez == "xxxx" and a21 == 0 then
a21 = 1
x21 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 20 and yt == 30 and id == xxxx and vez == "xxxx" and a22 == 0 then
a22 = 1
x22 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 21 and yt == 30 and id == xxxx and vez == "xxxx" and a23 == 0 then
a23 = 1
x23 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 19 and yt == 31 and id == xxxx and vez == "xxxx" and a31 == 0 then
a31 = 1
x31 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 20 and yt == 31 and id == xxxx and vez == "xxxx" and a32 == 0 then
a32 = 1
x32 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

if xt == 21 and yt == 31 and id == xxxx and vez == "xxxx" and a33 == 0 then
a33 = 1
x33 = 1
chis = image("gfx/SagosWins/x.bmp",xp,yp,1)
vez = "bola"
end

-------------------------------------------------------------

if xt == 19 and yt == 29 and id == bola and vez == "bola" and a11 == 0 then
a11 = 1
b11 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 20 and yt == 29 and id == bola and vez == "bola" and a12 == 0 then
a12 = 1
b12 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 21 and yt == 29 and id == bola and vez == "bola" and a13 == 0 then
a13 = 1
b13 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 19 and yt == 30 and id == bola and vez == "bola" and a21 == 0 then
a21 = 1
b21 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 20 and yt == 30 and id == bola and vez == "bola" and a22 == 0 then
a22 = 1
b22 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 21 and yt == 30 and id == bola and vez == "bola" and a23 == 0 then
a23 = 1
b23 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 19 and yt == 31 and id == bola and vez == "bola" and a31 == 0 then
a31 = 1
b31 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 20 and yt == 31 and id == bola and vez == "bola" and a32 == 0 then
a32 = 1
b32 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end

if xt == 21 and yt == 31 and id == bola and vez == "bola" and a33 == 0 then
a33 = 1
b33 = 1
redondo = image("gfx/SagosWins/bola.bmp",xp,yp,1)
vez = "xxxx"
end
end

addhook("usebutton","usarBotaoooo")
function usarBotaoooo(id,x,y)
	if map("name") == "awp_grey SagosWins" then
		sorte = math.random(1,10)		
		if sorte == 1 then
			parse("spawnprojectile "..id.." 47 260 516 1000 90")
			parse("spawnprojectile "..id.." 47 260 516 1000 180")
		elseif sorte ~= 1 and sorte ~= 10 then
			parse("spawnprojectile 0 47 260 516 1000 137")
		elseif sorte == 10 then
			rota = math.random(0,360)
			parse("spawnprojectile 0 45 260 516 9999999 "..rota)
		end
	end
end

addhook("second","segundoss")
function segundoss()
if xxxx ~= 0 and bola ~= 0 and status == "fora" then
status = "pronto"
end

if status == "pronto" then
status = "dentro"
parse("trigger wall3")
parse("setpos "..xxxx.." 656 880")
parse("setpos "..bola.." 656 880")
end

if player(xxxx,"exists") and player(xxxx,"health") == 0 and status == "dentro" and player(bola,"exists") and player(bola,"health") > 0 and status == "dentro" then
status = "b"
end

if player(bola,"exists") and player(bola,"health") == 0 and status == "dentro" and player(xxxx,"exists") and player(xxxx,"health") > 0 and status == "dentro" then
status = "x"
end

if x11 == 1 and x12 == 1 and x13 == 1 and status ~= "fim" then
status = "x"

elseif x21 == 1 and x22 == 1 and x23 == 1 and status ~= "fim" then
status = "x"

elseif x31 == 1 and x32 == 1 and x33 == 1 and status ~= "fim"then
status = "x"

elseif x11 == 1 and x21 == 1 and x31 == 1 and status ~= "fim" then
status = "x"

elseif x12 == 1 and x22 == 1 and x32 == 1 and status ~= "fim" then
status = "x"

elseif x13 == 1 and x23 == 1 and x33 == 1 and status ~= "fim" then
status = "x"

elseif x11 == 1 and x22 == 1 and x33 == 1 and status ~= "fim" then
status = "x"

elseif x13 == 1 and x22 == 1 and x31 == 1 and status ~= "fim" then
status = "x"

elseif b11 == 1 and b12 == 1 and b13 == 1 and status ~= "fim" then
status = "b"

elseif b21 == 1 and b22 == 1 and b23 == 1 and status ~= "fim" then
status = "b"

elseif b31 == 1 and b32 == 1 and b33 == 1 and status ~= "fim" then
status = "b"

elseif b11 == 1 and b21 == 1 and b31 == 1 and status ~= "fim" then
status = "b"

elseif b12 == 1 and b22 == 1 and b32 == 1 and status ~= "fim" then
status = "b"

elseif b13 == 1 and b23 == 1 and b33 == 1 and status ~= "fim" then
status = "b"

elseif b11 == 1 and b22 == 1 and b33 == 1 and status ~= "fim" then
status = "b"

elseif b13 == 1 and b22 == 1 and b31 == 1 and status ~= "fim" then
status = "b"

elseif a11 == 1 and a12 == 1 and a13 == 1 and a21 == 1 and a22 == 1 and a23 == 1 and a31 == 1 and a32 == 1 and a33 == 1 and status ~= "fim" then
status = "v"
end

if status == "x" then
if fala3 == 0 then
msg("©255255255Vencedor do Jogo-da-Velha: ©000255000"..player(xxxx,"name"))
else
for ver = 0,24 do
if ativado[ver] == 1 then
Y[ver] = Y[ver]-15
parse("hudtxtmove 0 "..ver.." 500 5 "..Y[ver])
end
end
parse("hudtxt "..idh.." \"©255255255Vencedor do Jogo-da-Velha: ©000255000"..player(xxxx,"name"))
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
end
parse("setpos "..xxxx.." 656 752")
parse("customkill 0 \"Jogo-da-velha\" "..bola)
parse("setscore "..xxxx.." "..player(xxxx,"score")+1)
status = "fim"
end

if status == "b" then
if fala3 == 0 then
msg("©255255255Vencedor do Jogo-da-Velha: ©000255000"..player(bola,"name"))
else
for ver = 0,24 do
if ativado[ver] == 1 then
Y[ver] = Y[ver]-15
parse("hudtxtmove 0 "..ver.." 500 5 "..Y[ver])
end
end
parse("hudtxt "..idh.." \"©255255255Vencedor do Jogo-da-Velha: ©000255000"..player(bola,"name"))
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
end
parse("setpos "..bola.." 656 752")
parse("customkill 0 \"Jogo-da-velha\" "..xxxx)
parse("setscore "..bola.." "..player(xxxx,"score")+1)
status = "fim"
end

if status == "v" then
if fala3 == 0 then
msg("©255255255Vencedor do Jogo-da-Velha: ©000255000Empate")
else
for ver = 0,24 do
if ativado[ver] == 1 then
Y[ver] = Y[ver]-15
parse("hudtxtmove 0 "..ver.." 500 5 "..Y[ver])
end
end
parse("hudtxt "..idh.." \"©255255255Vencedor do Jogo-da-Velha: ©000255000Empate")
parse("hudtxtmove 0 "..idh.." 500 5 "..Y[idh])
ativado[idh] = 1
tempo[idh] = 10
idh = idh+1
end
parse("setpos "..xxxx.." 656 752")
parse("setpos "..bola.." 656 752")
status = "fim"
end
end

addhook("startround","iniciar_rodada")
function iniciar_rodada()
status = "fora"
a11 = 0
a12 = 0
a13 = 0
a21 = 0
a22 = 0
a23 = 0
a31 = 0
a32 = 0
a33 = 0
x11 = 0
x12 = 0
x13 = 0
x21 = 0
x22 = 0
x23 = 0
x31 = 0
x32 = 0
x33 = 0
b11 = 0
b12 = 0
b13 = 0
b21 = 0
b22 = 0
b23 = 0
b31 = 0
b32 = 0
b33 = 0
xxxx = 0
bola = 0
if jogo_da_velha == true then
parse("trigger wall3")
end
vez = "xxxx"
end

addhook("hit","tapa")
function tapa(id,source,weapon,hpdmg,apdmg)
if xxxx == source and status == "dentro" then
return 1
elseif bola == source and status == "dentro" then
return 1
end
end


addhook("always","mover")
function mover()
for qm = 2,32 do
if player(qm,"exists") then

if player(qm,"tilex") == 9 and player(qm,"tiley") == 12 then
parse("left")
end

if player(qm,"tilex") == 10 and player(qm,"tiley") == 12 then
parse("back")
end

if player(qm,"tilex") == 11 and player(qm,"tiley") == 12 then
parse("right")
end

if player(qm,"tilex") == 10 and player(qm,"tiley") == 11 then
parse("forward")
end

end
end
end