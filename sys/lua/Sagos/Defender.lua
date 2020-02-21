parse("mp_damagefactor 1")
parse("mp_deathdrop 4")
parse("mp_radar 0")
parse("mp_roundtime 100")
parse("sv_gamemode 2")


dano = 10

tempo = 60
ct = -1
score = -1
quantidade = 0
dinheiro = 0
trs = 0
portaAberta = false
scoreTR = 0
wave = 1

addhook("die","morrer")
function morrer(victim,killer,weapon,x,y)
if weapon ~= 0 then
dinheiro = dinheiro+20
end
if victim == ct and killer > 0 then
parse("endround 1")
end
end

addhook("movetile","mover")
function mover(id,x,y)
if y == 75 then
if player(ct,"health") > dano then
parse("setscore "..id.." "..player(id,"score")+5)
parse("setpos "..id.." 1360 1488")
parse("sethealth "..ct.." "..player(ct,"health")-dano)
msg2(id,"©255255255[Servidor] Você tirou "..dano.." HP do CT e ganhou 5 de Score")
else
parse("setscore "..id.." "..player(id,"score")+11)
parse("setpos "..id.." 1360 1488")
parse("customkill "..id.." \"Derrotou\" "..ct)
msg2(id,"©255255255[Servidor] Você matou o CT e ganhou 11 de Score")
end
end
end

addhook("usebutton","usar_botao")
function usar_botao(id,x,y)

	if x == 45 and y == 49 then
		portaAberta = true
	else
		--Preguiça de continuar =/
			if dinheiro >= 50 then
				parse("spawnobject 8 "..x.." "..y.." 0 0 2 0")
				dinheiro = dinheiro-50
			else
				msg2(ct,"©255255255[Servidor] Dinheiro Insuficiente")
			end
		--end
	end

--------------Botões de teleport---------------
if x == 49 and y == 48 then
parse("setpos "..id.." 1584 1392")
elseif x == 49 and y == 44 then
parse("setpos "..id.." 1584 1584")
elseif x == 53 and y == 52 then
parse("setpos "..id.." 1872 1680")
elseif x == 57 and y == 52 then
parse("setpos "..id.." 1680 1680")
elseif x == 48 and y == 64 then
parse("setpos "..id.." 1776 2000")
elseif x == 55 and y == 61 then
parse("setpos "..id.." 1520 2064")
elseif x == 58 and y == 70 then
parse("setpos "..id.." 2032 2256")
elseif x == 62 and y == 70 then
parse("setpos "..id.." 1840 2256")
end
-----------------------------------------------
end


addhook("endround","fimDaRodada")
function fimDaRodada(mode)

if player(ct,"exists") then
parse("maket "..ct)
dinheiro = dinheiro-50
end

ct = -1
score = -1
for jogador = 1,32 do
if player(jogador,"exists") and player(jogador,"score") > score and player(jogador,"team") == 1 then
ct = jogador
score = player(ct,"score")
end
end
liberadoTroca = true
parse("makect "..ct)
msg2(ct,"©255255255[Servidor] Você é o jogador com maior Score e foi para CT")
parse("setscore "..ct.." 0")
parse("setdeaths "..ct.." 0")
end


addhook("startround","InicioDaRodada")
function InicioDaRodada(mode)
tempo = 60
dinheiro = 0
trs = 0
wave = 1
for jogador = 1,32 do
if player(jogador,"team") == 2 and jogador ~= ct and player(jogador,"exists") then
parse("maket "..jogador)
end

if player(jogador,"exists") and player(jogador,"team") == 1 then
trs = trs+1
end
end

dinheiro = dinheiro+(trs*50)
end


addhook("spawn","Nascer")
function Nascer(id)
if id == ct then
parse("speedmod "..ct.." 25")
end
end


addhook("team","equipe")
function equipe(id,team,look)
if team == 1 then
if player(id,"team") == 1 then
msg2(id,"©255255255[Servidor] Você já está no time Terrorista")
return 1
else
dinheiro = dinheiro+50
end
end

if team == 2 then
if liberadoTroca == true then
liberadoTroca = false
return 0
else

quantidade = 0
for jogador = 1,32 do
if player(jogador,"exists") and player(jogador,"team") == 2 then
quantidade = quantidade+1
end
end

if quantidade > 0 then
msg2(id,"©255255255[Servidor] Só é possível 1 CT neste servidor")
return 1
else
return 0
end
end
end
end

addhook("second","segundos")
function segundos()
if portaAberta == true then
dinheiro = dinheiro+3
tempo = tempo-1
parse("hudtxt 1 \"Tempo: "..tempo.."\" 250 425")
parse("hudtxt 2 \" Wave: "..wave.."\" 250 440")
end

if tempo == 0 then
portaAberta = false
tempo = 60
wave = wave+1
parse("sethealth "..ct.." 100")
end

if player(ct,"exists") then
parse("setmoney "..ct.." "..dinheiro)
end
end