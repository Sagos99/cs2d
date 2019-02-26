adm = 15431


function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


tela=initArray(32)
tela[32] = image("gfx/SagosWins/Slow/slow.PNG",0,0,3)
freeimage(tela[32])

congelar = 0
movimento = 0
slow = 0
transp = 0.0


addhook("serveraction","server_acao")
function server_acao(id,act)
if player(id,"usgn") == adm and act == 2 then
if congelar == 0 then
parse("sv_sound SagosWins/Slow/Congelando.ogg")
congelar = 1
msg2(id,"©255255255Slow Motion: Ativado")
msg2(id,"foi")
else
parse("sv_sound SagosWins/Slow/Descongelando.ogg")
congelar = -15
msg2(id,"©255255255Slow Motion: Desativado")
msg2(id,"foi2")
end
end
end


addhook("ms100","acada100")
function acada100(id,act)
if congelar < 0 then
congelar = congelar+1
end

for hir = 1,11 do
if player(hir,"weapontype") == 35 then
if slow == 1 then
corri = movimento+10
else
corri = movimento
end
parse("speedmod "..hir.." "..corri)
else
parse("speedmod "..hir.." "..movimento)
end

if player(hir,"exists") then
if player(hir,"health") > 0 then
freeimage(tela[hir])
tela[hir] = image("gfx/SagosWins/Slow/slow.PNG",player(hir,"x"),player(hir,"y"),3,""..hir.."")
imagealpha(tela[hir],transp)
else
freeimage(tela[hir])
end
end
end

if congelar == 1 then
slow = 1

if movimento > -20 then
movimento = movimento-1
end
end

if congelar == 0 then
slow = 0

if movimento < 0 then
movimento = movimento+1
end
end
end

addhook("second","seconds")
function seconds()
if congelar == 1 then
if transp < 0.2 then
transp = transp+0.1
end
end

if congelar == 0 then

if transp > 0 then
transp = transp-0.2
end
end
end


addhook("attack","atacando")
function atacando(id)
if slow == 1 then
if player(id,"weapon") == 35 then
parse("sv_sound SagosWins/Slow/awp slow.wav")
end
end
end