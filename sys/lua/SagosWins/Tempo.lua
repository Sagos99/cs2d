function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


laser=initArray(32)
segundos=initArray(32)
minutos=initArray(32)
horas=initArray(32)
dias=initArray(32)
somar=initArray(32)
somar2=initArray(32)
somar3=initArray(32)
mortos=initArray(32)
morto=initArray(32)
xx=initArray(32)
yy=initArray(32)
loja=initArray(32)
custo=initArray(32)

for inicio = 1,32 do
segundos[inicio] = 5
minutos[inicio] = 5
horas[inicio] = 0
dias[inicio] = 0
somar[inicio] = 0
somar2[inicio] = 0
mortos[inicio] = 0
morto[inicio] = 0
loja[inicio] = 0
custo[inicio] = 0
end

ajuda = 0
dropar = 0

addhook("always","calcular2")
function calcular2()
for j = 1,32 do
parse("equip "..j.." 50")
if segundos[j] > 59 then
minutos[j] = minutos[j]+1
somar[j] = segundos[j]-59
segundos[j] = somar[j]
end

if minutos[j] > 59 then
horas[j] = horas[j]+1
somar2[j] = minutos[j]-59
minutos[j] = somar2[j]
end

if horas[j] > 24 then
dias[j] = dias[j2]+1
somar3[j] = horas[j2]-24
horas[j] = somar3[j2]
end

if horas[j] < 0 then
horas[j] = 0
end

if minutos[j] < 0 then
minutos[j] = 0
end

if mortos[j] == 1 then
segundos[j] = segundos[j]+1
end

if segundos[j] < 10 then
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : 0"..segundos[j].."\" 5 430 0")
else
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : "..segundos[j].."\" 5 430 0")
end

if minutos[j] == 5 and mortos[j] == 1 then
mortos[j] = 0
end

if segundos[j] < 0 then
segundos[j] = 59
minutos[j] = minutos[j]-1
end

if minutos[j] < 0 then
minutos[j] = 59
horas[j] = horas[j]-1
end

if horas[j] < 0 then
horas[j] = 24
dias[j] = dias[j]-1
end

if custo[j] > 0 and custo[j] < 100 then
segundos[j] = segundos[j]-1
custo[j] = custo[j]-1
if segundos[j] < 10 then
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : 0"..segundos[j].."\" 5 430 0")
else
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : "..segundos[j].."\" 5 430 0")
end
end

if custo[j] > 99 then
segundos[j] = segundos[j]-2
custo[j] = custo[j]-2
if segundos[j] < 10 then
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : 0"..segundos[j].."\" 5 430 0")
else
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : "..segundos[j].."\" 5 430 0")
end
end

if custo[j] < 0 then
segundos[j] = segundos[j]+1
custo[j] = custo[j]+1
if segundos[j] < 10 then
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : 0"..segundos[j].."\" 5 430 0")
else
parse("hudtxt2 "..j.." 40 \"Tempo: "..dias[j].." : "..horas[j].." : "..minutos[j].." : "..segundos[j].."\" 5 430 0")
end
end

if player(j,"team") == 3 then
morto[j] = 1
end
end
end


addhook("second","vida")
function vida()

for j2 = 1,32 do
if (player(j2,"exists")) then
if morto[j2] == 0 then
segundos[j2] = segundos[j2]-1
end
end

if segundos[j2] < 0 then
segundos[j2] = 59
minutos[j2] = minutos[j2]-1
end

if minutos[j2] < 0 then
minutos[j2] = 59
horas[j2] = horas[j2]-1
end

if horas[j2] < 0 then
horas[j2] = 24
dias[j2] = dias[j2]-1
end

if dias[j2] < 0 then
parse("killplayer "..j2.."")
msg("ฉ255255000[AVISO] O Tempo De "..player(j2,"name").." Acabou!")
loja[j2] = 0
custo[j2] = 0
dias[j2] = 0
horas[j2] = 0
minutos[j2] = 0
segundos[j2] = 1
mortos[j2] = 1
end
end

ajuda = ajuda+1

if ajuda > 59 then
msg("ฉ255255000[AVISO] Para Comprar Bombas, Coletes, Armas, Encher HP Digite !loja")
ajuda = 0
end
end

addhook("kill","ganhaT")
function ganhaT(killer,victim,weapon)
custo[killer] = custo[killer]-120
custo[victim] = custo[victim]+30
if player(victim,"team") == 1 then
parse("spawnplayer "..victim.." 1352 2301")  --(CT)--
parse("equip "..victim.." 1")
else
parse("spawnplayer "..victim.." 2018 1289")  --(TR)--
parse("equip "..victim.." 2")
end
end

addhook("hit","nmorreloja")
function nmorreloja(id,source,weapon,hpdmg,apdmg)
if loja[source] == 1 then
msg2(source,"ฉ255255000[Aviso] Na Loja Armas Nใo Tem Danos!")
return 1
end
end

addhook("die","nascer")
function nascer(id)
if player(id,"team") == 1 then
parse("spawnplayer "..id.." 1352 2301")  --(CT)--
else
parse("spawnplayer "..id.." 2018 1289")  --(TR)--
end
end

addhook("join","cmorto")
function cmorto(id)
morto[id] = 1
end

addhook("spawn","dvivo")
function dvivo(id)
morto[id] = 0
end

addhook("use","Menu")
function Menu(id,event,data,x,y)
if x == 51 and y == 19 then
menu(id,"Pistolas,USP|Gratis,Glock|Gratis,Deagle|45 Segundos,P228|30 Segundos,Elite|30 Segundos,Five-Seven|30 Segundos")
end

if x == 55 and y == 19 then
menu(id,"Armas,M3|1 Min & 30 Sec,Mac 10|1 Minuto,M4A1|2 Minutos,Awp|1 Min & 30 Sec,MP5|1 Min & 20 Sec,Scout|1 Min & 25 Sec,Flamethrower|5 Minutos,Laser|20 Minutos,RPG Launcher|15 Minutos")
end

if x == 51 and y == 23 then
menu(id,"Granadas,HE|45 Segundos,FlashBang|40 Segundos,Smoke Granade|20 Segundos,Air Strike|1 Minuto,Gas Granade|40 Segundos,Molotov Cocktail|30 Segundos,SnowBall|20 Segundos,Gut Bomb|25 Segundos,Satchel Charge|1 Minuto")
end

if x == 55 and y == 23 then
menu(id,"Armor,Kevlar|30 Segundos,Kevlar+Helm|40 Segundos,Light Armor|1 Min & 30 Sec,Armor|2 Minutos,Heavy Armor|3 Minutos,Stealth Suit|5 Minutos,Medic Armor|15 Minutos,Super Armor|20 Minutos")
end

if x == 53 and y == 9 then
menu(id,"Extra,Tactical Shield|1 Minuto,Gas Mask|25 Segundos,Machete|1 Minuto,Wrench|1 Minuto,Mine|40 Segundos,Chainsaw|50 Segundos,Portal Gun|1 Min & 15,HP no Max|2 Minutos")
end
end

addhook("menu","adminmenu")
function adminmenu(id,title,buton)
if title=="Pistolas" then
if buton==1 then
parse("equip "..id.." 1")
elseif buton==2 then
parse("equip "..id.." 2")

elseif buton==3 then
if segundos[id] > 44 or segundos[id] < 45 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+45
parse("strip "..id.." 1")
parse("strip "..id.." 2")
parse("strip "..id.." 3")
parse("strip "..id.." 4")
parse("strip "..id.." 5")
parse("strip "..id.." 6")
parse("equip "..id.." 3")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Deagle")
end

elseif buton==4 then
if segundos[id] > 29 or segundos[id] < 30 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+30
parse("strip "..id.." 1")
parse("strip "..id.." 2")
parse("strip "..id.." 3")
parse("strip "..id.." 4")
parse("strip "..id.." 5")
parse("strip "..id.." 6")
parse("equip "..id.." 4")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar P228")
end

elseif buton==5 then
if segundos[id] > 29 or segundos[id] < 30 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+30
parse("strip "..id.." 1")
parse("strip "..id.." 2")
parse("strip "..id.." 3")
parse("strip "..id.." 4")
parse("strip "..id.." 5")
parse("strip "..id.." 6")
parse("equip "..id.." 5")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Elite")
end

elseif buton==6 then
if segundos[id] > 29 or segundos[id] < 30 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+30
parse("strip "..id.." 1")
parse("strip "..id.." 2")
parse("strip "..id.." 3")
parse("strip "..id.." 4")
parse("strip "..id.." 5")
parse("strip "..id.." 6")
parse("equip "..id.." 6")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Five-Seven")
end
end
end

if title=="Armas" then
if buton==1 then
if minutos[id] > 0 and segundos[id] > 29 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+90
parse("equip "..id.." 10")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar M3")
end

elseif buton==2 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+60
parse("equip "..id.." 23")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Mac 10")
end

elseif buton==3 then
if minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+120
parse("equip "..id.." 32")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar M4A1")
end

elseif buton==4 then
if minutos[id] > 0 and segundos[id] > 29 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+90
parse("equip "..id.." 35")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Awp")
end

elseif buton==5 then
if minutos[id] > 0 and segundos[id] > 19 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+80
parse("equip "..id.." 20")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar MP5")
end

elseif buton==6 then
if minutos[id] > 0 and segundos[id] > 24 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+85
parse("equip "..id.." 34")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Scout")
end

elseif buton==7 then
if minutos[id] > 4 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+300
parse("equip "..id.." 46")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Flamethrower")
end

elseif buton==8 then
if minutos[id] > 19 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+1200
parse("equip "..id.." 45")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Laser")
end

elseif buton==9 then
if minutos[id] > 15 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 47")
custo[id] = custo[id]+900
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar RPG Launcher")
end
end
end

if title=="Granadas" then
if buton==1 then
if segundos[id] > 44 or segundos[id] < 45 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
custo[id] = custo[id]+45
parse("equip "..id.." 51")
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar HE")
end

elseif buton==2 then
if segundos[id] > 39 or segundos[id] < 40 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 52")
custo[id] = custo[id]+40
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar FlashBang")
end

elseif buton==3 then
if segundos[id] > 19 or segundos[id] < 20 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 53")
custo[id] = custo[id]+20
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Smoke Granade")
end

elseif buton==4 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 76")
custo[id] = custo[id]+60
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Air Strike")
end

elseif buton==5 then
if segundos[id] > 39 or segundos[id] < 40 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 72")
custo[id] = custo[id]+40
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Gas Granade")
end

elseif buton==6 then
if segundos[id] > 29 or segundos[id] < 30 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 73")
custo[id] = custo[id]+30
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Molotov Cocktail")
end

elseif buton==7 then
if segundos[id] > 19 or segundos[id] < 20 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 75")
custo[id] = custo[id]+20
else
msg2(id,"ฉ255000000[ERRO ]Tempo Insuficiente Para Comprar SnowBall")
end

elseif buton==8 then
if segundos[id] > 24 or segundos[id] < 25 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 86")
custo[id] = custo[id]+25
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Gut Bomb")
end

elseif buton==9 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 89")
custo[id] = custo[id]+30
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Satchel Charge")
end
end
end

if title=="Armor" then
if buton==1 then
if segundos[id] > 29 or segundos[id] < 30 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 57")
custo[id] = custo[id]+30
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Kevlar")
end

elseif buton==2 then
if segundos[id] > 39 or segundos[id] < 40 and minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 58")
custo[id] = custo[id]+40
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Kevlar+Helm")
end

elseif buton==3 then
if minutos[id] > 0 and segundos[id] > 29 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 79")
custo[id] = custo[id]+90
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Light Armor")
end

elseif buton==4 then
if minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 80")
custo[id] = custo[id]+120
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Armor")
end

elseif buton==5 then
if minutos[id] > 2 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 81")
custo[id] = custo[id]+180
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Reavy Armor")
end

elseif buton==6 then
if minutos[id] > 4 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 84")
custo[id] = custo[id]+300
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Stealth Suit")
end

elseif buton==7 then
if minutos[id] > 14 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 82")
custo[id] = custo[id]+900
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Medic Armor")
end

elseif buton==8 then
if minutos[id] > 20 or horas[id] > 0 or dias[id] > 0 then
parse("setarmor "..id.." 0")
parse("equip "..id.." 83")
custo[id] = custo[id]+1200
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Super Armor")
end
end
end

if title=="Extra" then
if buton==1 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 41")
custo[id] = custo[id]+60
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Tactical Shield")
end

elseif buton==2 then
if segundos[id] > 24 or segundos[id] < 25 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 60")
custo[id] = custo[id]+90
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Gas Mask")
end

elseif buton==3 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 69")
custo[id] = custo[id]+60
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Machete")
end

elseif buton==4 then
if minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 74")
custo[id] = custo[id]+60
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Wrench")
end

elseif buton==5 then
if segundos[id] > 39 or segundos[id] < 40 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 77")
custo[id] = custo[id]+40
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Mine")
end

elseif buton==6 then
if segundos[id] > 49 or segundos[id] < 50 and minutos[id] > 0 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 85")
custo[id] = custo[id]+50
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Chainsaw")
end

elseif buton==7 then
if minutos[id] > 0 and segundos[id] > 29 or horas[id] > 0 or dias[id] > 0 then
parse("equip "..id.." 88")
custo[id] = custo[id]+75
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Comprar Portal Gun")
end

elseif buton==8 then
if minutos[id] > 1 or horas[id] > 0 or dias[id] > 0 then
parse("sethealth "..id.." 250")
custo[id] = custo[id]+120
else
msg2(id,"ฉ255000000[ERRO] Tempo Insuficiente Para Encher HP no Max")
end
end
end
end

addhook("build","nconstroi")
function nconstroi(id,type,x,y,mode,objectid)
for lX2 = 43,57 do
for lY2 = 4,25 do
if player(id,"tilex") == lX2 and player(id,"tiley") == lY2 then
msg2(id,"ฉ255000000[ERRO] Nใo Pode Construir Na Loja!")
return 1
end
end
end
end

addhook("say","iraloja")
function iraloja(id,txt)
if txt == "!loja" or txt == "!LOJA" or txt == "!Loja" then
if loja[id] == 0 then
msg2(id,"ฉ000255000[ATENวรO] Para Sair Da Loja, Digite !sair loja")
xx[id] = player(id,"x")
yy[id] = player(id,"y")
parse("setpos "..id.." 1713.7156982422 836.72796630859")
loja[id] = 1
msg("ฉ255255000[AVISO] "..player(id,"name").." Foi Para a !Loja")
return 1
else
msg2(id,"ฉ255000000[ERRO] Vo็๊ Ja Esta Na Loja!")
msg2(id,"ฉ000255000[ATENวรO] Para Sair Da Loja, Digite !sair loja")
end
end

if txt == "!sair loja" or txt == "!SAIR LOJA" or txt == "!Sair loja" or txt == "!sair Loja" or txt == "!Sair Loja" then
if loja[id] == 1 then
loja[id] = 0
parse("setpos "..id.." "..xx[id].." "..yy[id].."")
return 1
end
end
end

addhook("drop","sumir")
function sumir(id,iid,type,ain,a,mode,x,y)
parse("strip "..id.." "..type)
return 1
end