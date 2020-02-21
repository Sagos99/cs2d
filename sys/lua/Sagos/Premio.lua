function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


arma=initArray(32)
item=initArray(32)
armor=initArray(32)
god=initArray(32)
vezes=initArray(32)

addhook("join","entrar")
function entrar(id)
arma[id] = 35
item[id] = 0
armor[id] = 0
god[id] = 0
vezes[id] = 0
end

addhook("leave","sair")
function sair(id)
arma[id] = 35
item[id] = 0
armor[id] = 0
god[id] = 0
vezes[id] = 0
end

addhook("serveraction","acao")
function acao(id,act)
if act == 1 then
if player(id,"score") >= 5 and player(id,"deaths") == 0 then
wrench = "Wrench|5K 0D"
else
wrench = "(Wrench|5K 0D)"
end

if player(id,"score") >= 3 and player(id,"deaths") <= 1 then
stealth = "Stealth Suit|3K 1D"
else
stealth = "(Stealth Suit|3K 1D)"
end

if player(id,"score") >= 20 and player(id,"deaths") == 0 then
deus = "GOD por 5 Round|20k 0D"
else
deus = "(GOD por 5 Round|20k 0D)"
end


menu(id,"Loja,AWP|0K 0D,"..wrench..","..stealth..","..deus.."")
end
end

addhook("menu","loja")
function loja(id,tittle,button)
if tittle == "Loja" then
if button == 1 then
parse("equip "..id.." 35")
arma[id] = 35
msg2(id,"©200250200[Servidor] Você Obteve: ©000255000Awp")

elseif button == 2 then
if player(id,"score") >= 5 and player(id,"deaths") == 0 then
score = player(id,"score")-5
parse("setscore "..id.." "..score)
parse("equip "..id.." 74")
item[id] = 74
msg2(id,"©200250200[Servidor] Você Perdeu: ©2550000005 Kill")
msg2(id,"©200250200[Servidor] Você Obteve: ©000255000Wrench")
else
msg2(id,"©200250200[Servidor] Kills Insuficientes ou Deaths de mais")
end

elseif button == 3 then
if player(id,"score") >= 3 and player(id,"deaths") <= 1 then
score = player(id,"score")-3
parse("setscore "..id.." "..score)
parse("setarmor "..id.." 206")
armor[id] = 206
msg2(id,"©200250200[Servidor] Você Perdeu: ©2550000003 Kill")
msg2(id,"©200250200[Servidor] Você Obteve: ©000255000Stealth Suit")
else
msg2(id,"©200250200[Servidor] Kills Insuficientes ou Deaths de mais")
end

elseif button == 4 then
if player(id,"score") >= 20 and player(id,"deaths") == 0 then
vezes[id] = 5
god[id] = 1
score = player(id,"score")-20
parse("setscore "..id.." "..score)
msg2(id,"©200250200[Servidor] Você Perdeu: ©25500000020 Kill")
msg2(id,"©200250200[Servidor] Você Obteve: ©000255000GOD")
end

end
end
end

addhook("spawn","nascer")
function nascer(id)
if player(id,"team") == 1 then
parse("strip "..id.." 2")
elseif player(id,"team") == 2 then
parse("strip "..id.." 1")
end

if item[id] > 0 then
parse("equip "..id.." "..item[id])
end

parse("setarmor "..id.." "..armor[id])

if arma[id] > 0 then
parse("equip "..id.." "..arma[id])
end

end

addhook("say","falar")
function falar(id,txt)
if txt == "!rs" then
if player(id,"score") ~= 0 or player(id,"deaths") ~= 0 then
score = player(id,"score")
deaths = player(id,"deaths")
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")

if score > 0 then
msg2(id,"©200250200[Servidor] Você Perdeu: ©255000000"..score.." Kill")
end

if deaths > 0 then
msg2(id,"©200250200[Servidor] Você Perdeu: ©000255000"..deaths.." Deaths")
end

else
msg2(id,"©200250200[Servidor] Sua Pontuação já está Resetada")

end
return 1
end
end

addhook("kill","morte")
function morte(killer,victim)
msg2(killer,"©200250200[Servidor] Você Obteve: ©0002550001 Kill")
msg2(victim,"©200250200[Servidor] Você Obteve: ©2550000001 Death")
end

addhook("hit","tapa")
function tapa(id)
if god[id] == 1 then
return 1
end
end

addhook("startround","novarodada")
function novarodada()
for j2 = 1,32 do

if vezes[j2] > 0 then
vezes[j2] = vezes[j2]-1
end

if vezes[j2] == 0 and god[j2] == 1 then
msg2(j2,"©200250200[Servidor] Você Perdeu: ©255000000God")
god[j2] = 0
end
end
end

addhook("drop","largar")
function largar()
return 1
end

addhook("objectdamage","atualizar")
function atualizar(id,dmg,player)
return 1
end