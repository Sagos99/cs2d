function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


n_tem_classe=initArray(32)
sacerdot=initArray(32)
berserker=initArray(32)
paladino=initArray(32)
sabio=initArray(32)
feiticeiro=initArray(32)
ranger=initArray(32)
lento=initArray(32)

-------Valores Iniciais------
parse("mp_wpndmg p228 40")
parse("mp_wpndmg awp 99")
parse("mp_kevlar 1")
-----------------------------


for sem_classe = 1,32 do
n_tem_classe[sem_classe] = 0
end

addhook("spawn","escolhe_classe")
function escolhe_classe(id)
if n_tem_classe[id] == 0 then
menu(id,"Escolha Sua Classe@b,Sacerdote|Cura Si mesmo e seus Aliados,Paladino|Tem Bastante HP Aguentando Varios HIT's,Berserker|Tem Muita Força,Sábio|Metade de Cada Classe,Feitiçeiro|Possui Magias Para Atrapalhar ou Matar o Adversário,Ranger|Possui Habilidades Bem Rapidas")
end

----------Spawn do Sacer------------
if sacerdot[id] == 1 then
parse("equip "..id.." 3")     --Deagle
parse("setmaxhealth "..id.." 100")
end
------------------------------------

-------Spawn do Ranger--------------
if ranger[id] == 1 then
parse("setmaxhealth "..id.." 85")
parse("speedmod "..id.." 15")
parse("equip "..id.." 69")
parse("equip "..id.." 23")
end
------------------------------------

-------Spawn do Berserker-----------
if berserker[id] == 1 then
parse("setmaxhealth "..id.." 105")
parse("equip "..id.." 35")     --awp
parse("equip "..id.." 4")      --p228
parse("speedmod "..id.." 5")
end
------------------------------------

-------Spawn do Paladino------------
if paladino[id] == 1 then
parse("setmaxhealth "..id.." 210")
parse("setarmor "..id.." 200")
parse("equip "..id.." 10")   --M3
parse("equip "..id.." 21")   --TMP
parse("speedmod "..id.." -5")
end
------------------------------------

-------Spawn do Sabio---------------
if sabio[id] == 1 then
parse("setmaxhealth "..id.." 150")
parse("setarmor "..id.." 50")
parse("speedmod "..id.." 3")
parse("equip "..id.." 76")
parse("equip "..id.." 3")  --deagle
parse("equip "..id.." 34") --Scout
end
------------------------------------

-------Spawn do feitiçeiro----------
if feiticeiro[id] == 1 then
parse("equip "..id.." 76")
parse("equip "..id.." 77")
parse("equip "..id.." 72")
parse("equip "..id.." 52")
parse("equip "..id.." 51")
parse("equip "..id.." 53")
parse("equip "..id.." 41")
parse("equip "..id.." 30")
parse("equip "..id.." 73")
parse("equip "..id.." 75")
parse("setmaxhealth "..id.." 100")
end end
------------------------------------


addhook("menu","classe_escolhida")
function classe_escolhida(id,title,buton)
if title=="Escolha Sua Classe" then
if buton==1 then

sacerdot[id] = 1
paladino[id] = 0
berserker[id] = 0
sabio[id] = 0
feiticeiro[id] = 0
ranger[id] = 0
n_tem_classe[id] = 1

---------MENU DO SACERDOTE----------
parse("equip "..id.." 3")
parse("setmaxhealth "..id.." 100")
parse("speedmod "..id.." 0")
------------------------------------

elseif buton==2 then

sacerdot[id] = 0
paladino[id] = 1
berserker[id] = 0
sabio[id] = 0
feiticeiro[id] = 0
ranger[id] = 0
n_tem_classe[id] = 1

---------MENU DO PALADINO------------
parse("setmaxhealth "..id.." 210")
parse("setarmor "..id.." 200")
parse("equip "..id.." 10")   --M3
parse("equip "..id.." 21")   --TMP
parse("speedmod "..id.." -5")
-------------------------------------

elseif buton==3 then

sacerdot[id] = 0
paladino[id] = 0
berserker[id] = 1
sabio[id] = 0
feiticeiro[id] = 0
ranger[id] = 0
n_tem_classe[id] = 1

-----------MENU DO BERSERKER----------
parse("setmaxhealth "..id.." 105")
parse("equip "..id.." 35")
parse("equip "..id.." 4")
parse("speedmod "..id.." 5")
--------------------------------------

elseif buton==4 then

sacerdot[id] = 0
paladino[id] = 0
berserker[id] = 0
sabio[id] = 1
feiticeiro[id] = 0
ranger[id] = 0
n_tem_classe[id] = 1

----------MENU DO SÁBIO------------
parse("setmaxhealth "..id.." 150")
parse("setarmor "..id.." 50")
parse("speedmod "..id.." 3")
parse("equip "..id.." 76")
parse("equip "..id.." 3")  --deagle
parse("equip "..id.." 34") --Scout
--------------------------------------

elseif buton==5 then

sacerdot[id] = 0
paladino[id] = 0
berserker[id] = 0
sabio[id] = 0
feiticeiro[id] = 1
ranger[id] = 0
n_tem_classe[id] = 1

------------MENU DO FEITIÇEIRO--------
parse("equip "..id.." 76")
parse("equip "..id.." 77")
parse("equip "..id.." 72")
parse("equip "..id.." 52")
parse("equip "..id.." 51")
parse("equip "..id.." 53")
parse("equip "..id.." 41")
parse("equip "..id.." 30")
parse("equip "..id.." 73")
parse("equip "..id.." 75")
parse("setmaxhealth "..id.." 100")
--------------------------------------

elseif buton==6 then
sacerdot[id] = 0
paladino[id] = 0
berserker[id] = 0
sabio[id] = 0
feiticeiro[id] = 0
ranger[id] = 1
n_tem_classe[id] = 1

------------MENU DO RANGER------------
parse("setmaxhealth "..id.." 35")
parse("speedmod "..id.." 15")
parse("equip "..id.." 69")
parse("equip "..id.." 23")
--------------------------------------
end
end
end

addhook("hit","cura")
function cura(id,source,weapon,hpdmg,apdmg)

----------------sacerdote cura aliados-----------------
if hpdmg < 1 and sacerdot[source] == 1 and weapon == 3 then
curar = player(id,"health")+14
parse("sethealth "..id.." "..curar)
msg2(source,""..player(id,"name")..": "..player(id,"health").." HP")
end
-------------------------------------------------------

----------------Sabio Cura Aliados---------------------
if hpdmg < 1 and sabio[source] == 1 and weapon == 3 then
curar = player(id,"health")+7
parse("sethealth "..id.." "..curar)
msg2(source,""..player(id,"name")..": "..player(id,"health").." HP")
end
-------------------------------------------------------

------------------Feitiçeiro deicha lento--------------
if weapon == 75 then
parse("speedmod "..id.." -10")
lento[id] = 1
end end
-------------------------------------------------------


-------------------------------------------------------
addhook("projectile","teleport")
function teleport(id,weapon,x,y)

------------------Feitiçeiro teleporta-----------------
if weapon == 53 and feiticeiro[id] == 1 then
parse("setpos "..id.." "..x.." "..y)
end end
-------------------------------------------------------


addhook("say","zerar")
function zerar(id,txt)
if txt == "!zerar" then
sacerdot[id] = 0
paladino[id] = 0
berserker[id] = 0
sabio[id] = 0
feiticeiro[id] = 0
ranger[id] = 0
n_tem_classe[id] = 0
msg2(id,"©255255255Voçe Pode Escolher Uma Nova Classe quando Nascer Novamente!")
return 1
end
end

addhook("drop","ndropa")
addhook("die","ndrop2")
addhook("minute","ajuda")
function ndropa()
return 1
end
function ndrop2()
return 1
end
function ajuda()
msg("©255255255Para Escolher Outra Classe Digite !zerar")
end