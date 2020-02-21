-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

inimigo = 0
botid = 1
atirar = 100

addhook("always","bot")
function bot()

if player(botid,"exists") then
ai_selectweapon(botid,50)
ai_reload(botid)
ai_spray(botid)
inimigo = ai_findtarget(botid)
end

if player(botid,"exists") then
if player(inimigo,"exists") then
loocalx = player(inimigo,"x")
loocaly = player(inimigo,"y")
end
end

if player(botid,"exists") and player(inimigo,"exists") then
if ai_freeline(botid,loocalx,loocaly) and player(inimigo,"health") > 0 then
ai_aim(botid,loocalx,loocaly)
atirar = atirar-1


if atirar < 0 then
ai_selectweapon(botid,35)
ai_attack(botid)
ai_selectweapon(botid,50)
atirar = 100
end
end
end
end

addhook("always","teste")
function teste()

file = io.open("sys/lua/sagoswins/Fala.txt","r")
ler = file:read("*a")
sobe = tostring(ler)
file:close()

if sobe ~= "" then
ai_say(botid,""..sobe)
salvar = io.open("sys/lua/sagoswins/Fala.txt","w+")
salvar:write("")
salvar:close()
end

file = io.open("sys/lua/sagoswins/Console.txt","r")
ler = file:read("*a")
sobe = tostring(ler)
file:close()

if sobe ~= "" then
parse(sobe)
salvar = io.open("sys/lua/sagoswins/Console.txt","w+")
salvar:write("")
salvar:close()
end
end

addhook("startround","informacao")
function informacao()
print("O Round Começo!") end
addhook("endround","msg2")
function msg2()
print("O Round Terminou!") end





segundos = 0

addhook("second","bottt1")
function bottt1()

if player(botid,"exists") then
segundos = segundos+1
end

if segundos > 4 and player(botid,"exists") then
segundos = 0
x = player(botid,"tilex")
y = player(botid,"tiley")

xa = math.random(1,3)
if xa == 1 then
elseif xa == 2 then
x = x+1
elseif xa == 3 then
x = x-1
end

ya = math.random(1,3)
if ya == 1 then
elseif ya == 2 then
y = y+1
elseif ya == 3 then
y = y-1
end

buil = math.random(1,9)
ai_selectweapon(botid,74)
if player(botid,"weapontype") == 74 then
ai_build(botid,buil,x,y)
end
ai_selectweapon(botid,50)
end
end

addhook("say","resetar")
function resetar(id,txt)
if txt == "!RS" or txt =="!RESET" or txt =="!RESETSCORE" or txt =="!rs" or txt =="!reset" or txt =="!resetscore" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg(player(id,"name").." Resetou o Score!")
return 1
end
end