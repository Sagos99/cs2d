function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


zilean=initArray(32)
soraka=initArray(32)
blitzcrank=initArray(32)
ashe=initArray(32)
ezreal=initArray(32)
tristana=initArray(32)
rammus=initArray(32)
amumu=initArray(32)
drmundo=initArray(32)
katarina=initArray(32)
shaco=initArray(32)
karthus=initArray(32)
vida=initArray(32)
mana=initArray(32)
maxV=initArray(32)
maxM=initArray(32)
new=initArray(32)
recall=initArray(32)
level=initArray(32)
exp=initArray(32)
maxexp=initArray(32)
pontos=initArray(32)
primeira=initArray(32)
segunda=initArray(32)
terceira=initArray(32)
ultmate=initArray(32)
solto1=initArray(32)
solto2=initArray(32)
solto3=initArray(32)
solto4=initArray(32)
skill1=initArray(32)
skill2=initArray(32)
skill3=initArray(32)
kudal1=initArray(32)
kudal2=initArray(32)
kudal3=initArray(32)
kudal4=initArray(32)
ult=initArray(32)
explodir=initArray(32)

cinco = 0
torre = 4
parse("mp_wpndmg deagle 0")
bomba = image("gfx/SagosWins/LoL/Bomba.bmp",0,0,0)
freeimage(bomba)

for bug = 1,32 do
maxV[bug] = 1
level[bug] = 1
pontos[bug] = 1
explodir[bug] = -1
end

addhook("drop","loja")
function loja(id)
menu(id,"Loja,Dano Físico,Dano Mágico,Chance de Crítico,Velocidade de Ataque,Roubo de Vida")
return 1
end

addhook("minute","minuto")
function minuto()
cinco = cinco+1
if cinco >= 5 then
cinco = 0
torre = torre+1
parse("mp_turretdamage "..torre.."")
end
end

addhook("serveraction","acao")
function acao(id,act)
if act == 1 and player(id,"tilex") == 1 and player(id,"tiley") == 98 or act == 1 and player(id,"tilex") == 3 and player(id,"tiley") == 98 then
menu(id,"Escolha Sua Classe,Suporte,ADC,AP,Tank")
end

if act == 1 and zilean[id] == 1 then
solto1[id] = 1
msg2(id,"Escolha o alvo")
end
end

addhook("spawn","nascer")
function nascer(id)
if new[id] == 1 then
vida[id] = maxV[id]
mana[id] = maxM[id]
if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end
else
menu(id,"Escolha Sua Classe,Suporte,ADC,AP,Tank")
end
if zilean[id] == 1 then
parse("equip 1 3")
end
end

addhook("menu","menus")
function menus(id,title,button)
if title == "Escolha Sua Classe" then
if button == 1 then
menu(id,"Escolha Seu Suporte,Blitzcrank,Soraka,Zilean")
elseif button == 2 then
menu(id,"Escolha Seu ADC,Ashe,Ezreal,Tristana")
elseif button == 3 then
menu(id,"Escolha Seu AP,Katarina,Shaco,Karthus")
elseif button == 4 then
menu(id,"Escolha Seu Tank,Rammus,Amumu,Dr.Mundo")
end
end

if title == "Skills Pontos: "..pontos[id].."" then
if button == 1 then

if pontos[id] > 0 then
skill1[id] = skill1[id]+1
pontos[id] = pontos[id]-1
else
msg2(id,"©255255255Pontos Insuficente para Upar Skill")
end

elseif button == 2 then

if pontos[id] > 0 then
skill2[id] = skill2[id]+1
pontos[id] = pontos[id]-1
else
msg2(id,"©255255255Pontos Insuficente para Upar Skill")
end

elseif button == 3 then

if pontos[id] > 0 then
skill3[id] = skill3[id]+1
pontos[id] = pontos[id]-1
else
msg2(id,"©255255255Pontos Insuficente para Upar Skill")
end

elseif button == 4 then

if pontos[id] > 0 then
ult[id] = ult[id]+1
pontos[id] = pontos[id]-1
else
msg2(id,"©255255255Pontos Insuficente para Upar Skill")
end

end
end

if title == "Escolha Seu ADC" then
if button == 1 then
maxV[id] = 395
maxM[id] = 173
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/ashe.ogg")
new[id] = 1
ashe[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 2 then
maxV[id] = 350
maxM[id] = 235
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Ezreal.ogg")
new[id] = 1
ezreal[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 3 then
maxV[id] = 415
maxM[id] = 193
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/tristana.ogg")
new[id] = 1
tristana[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end
end
end


if title == "Escolha Seu AP" then
if button == 1 then
maxV[id] = 425
maxM[id] = 0
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Katarina.ogg")
new[id] = 1
katarina[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 2 then
maxV[id] = 441
maxM[id] = 230
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Shaco.ogg")
new[id] = 1
shaco[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 3 then
maxV[id] = 390
maxM[id] = 290
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Karthus.ogg")
new[id] = 1
karthus[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end
end
end

if title == "Escolha Seu Tank" then
if button == 1 then
maxV[id] = 420
maxM[id] = 255
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Rammus.ogg")
new[id] = 1
rammus[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 2 then
maxV[id] = 472
maxM[id] = 220
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Amumu.ogg")
new[id] = 1
amumu[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 3 then
maxV[id] = 433
maxM[id] = 0
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/drmundo.ogg")
new[id] = 1
drmundo[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end
end
end

if title == "Escolha Seu Suporte" then
if button == 1 then
maxV[id] = 423
maxM[id] = 200
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/BlitzCrank.ogg")
new[id] = 1
blitzcrank[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 2 then
maxV[id] = 375
maxM[id] = 240
vida[id] = maxV[id]
mana[id] = maxM[id]
parse("sv_sound2 "..id.." SagosWins/LoL/Soraka.ogg")
new[id] = 1
soraka[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

elseif button == 3 then
maxV[id] = 380
maxM[id] = 260
vida[id] = maxV[id]
mana[id] = maxM[id]
zilean[id] = 1
parse("equip "..id.." 3")
parse("sv_sound2 "..id.." SagosWins/LoL/Zilean.ogg")
new[id] = 1

if player(id,"team") == 2 then
parse("setpos "..id.." 928 2688")
else
parse("setpos "..id.." 2432 768")
end

end
end
end

addhook("hit","dano")
function dano(id,source,arma,hpdmg,armadura)
vida[id] = vida[id]-hpdmg
recall[id] = -1
if zilean[source] == 1 and solto1[id] == 1 and arma == 3 then
if kudal1[source] == 0 then
explodir[id] = 4
bomba = image("gfx/SagosWins/LoL/Bomba.bmp",1,1,200+id)
solto1[source] = 0
kudal1[source] = 10
end
end
if vida[id] < 100 then
return 0
else
return 1
end
end

addhook("always","sempre")
function sempre()
for jogadores = 1,32 do

if maxV[jogadores] < vida[jogadores] then
vida[jogadores] = maxV[jogadores]
end

parse("hudtxt2 "..jogadores.." 1 \"Vida: "..vida[jogadores].." / "..maxV[jogadores].."\" 15 400")
parse("hudtxt2 "..jogadores.." 2 \"Mana: "..mana[jogadores].." / "..maxM[jogadores].."\" 15 415")
parse("hudtxt2 "..jogadores.." 4 \"Level: "..level[jogadores].."\" 15 430")
parse("hudtxt2 "..jogadores.." 5 \"Exp: "..exp[jogadores].." / "..maxexp[jogadores].."\" 75 430")
parse("sethealth "..jogadores.." "..vida[jogadores])
end
end

addhook("second","segundos")
function segundos()
for jogador = 1,32 do

if recall[jogador] == 0 then
if player(jogador,"team") == 2 then
parse("setpos "..jogador.." 928 2688")
else
parse("setpos "..jogador.." 2432 768")
end
end

if vida[jogador] < maxV[jogador] then
vida[jogador] = vida[jogador]+2
end

if recall[jogador] > -1 then
recall[jogador] = recall[jogador]-1
end


for xxct = 28,34 do
for yyct = 78,85 do
if player(jogador,"tilex") == xxct and player(jogador,"tiley") == yyct and vida[jogador] < maxV[jogador] and player(jogador,"team") == 2 then
vida[jogador] = vida[jogador]+50
end
end
end

for xxtr = 71,77 do
for yytr = 23,30 do
if player(jogador,"tilex") == xxtr and player(jogador,"tiley") == yytr and vida[jogador] < maxV[jogador] and player(jogador,"team") == 1 then
vida[jogador] = vida[jogador]+50
end
end
end

if recall[jogador] == -1 then
parse("hudtxtalphafade "..jogador.." 3 1500 0")
end

if recall[jogador] > -1 then
parse("hudtxt2 "..jogador.." 3 \"Recall: "..recall[jogador].."\" 300 400")
end

end
end


addhook("say","retornando")
function retornando(id,txt)
if txt == "!recall" then
recall[id] = 7
return 1
end
end

addhook("sayteam","retornando2")
function retornando2(id,txt)
if txt == "!recall" then
recall[id] = 7
return 1
end
end

addhook("move","movimento")
function movimento(id)
recall[id] = -1
end

addhook("use","usar")
function usar(id)
if zilean[id] == 1 then

if level[id] > 5 then
ultmate[id] = "Alteração Temporal"
else
ultmate[id] = "(Alteração Temporal)"
end

if level[id] == 1 then
segunda[id] = "(Retroceder)"
elseif level[id] > 1 then
segunda[id] = "Retroceder"
end

menu(id,"Skills Pontos: "..pontos[id]..",Bomba Relógio|lvl: "..skill1[id]..","..segunda[id].."|lvl: "..skill2[id]..",Distorção no Tempo|lvl: "..skill3[id]..","..ultmate[id].."|lvl: "..ult[id])
end
end

addhook("select","skill")
function skill(id,type)
if zilean[id] == 1 then
if type == 50 then
if ult[id] > 0 then
if kudal4[id] == 0 then
msg2(id,"Alteração Temporal")
else
msg2(id,"Aguarde o Resfriamento do Feitiço")
end
else
msg2(id,"Você Ainda não Aprendeu este Feitiço")
end
end
end
end

addhook("attack","atacar")
function atacar(id)
recall[id] = -1
end





