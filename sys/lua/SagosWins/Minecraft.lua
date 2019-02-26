function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


buildx=initArray(32)
buildy=initArray(32)

terra=initArray(32)
pedra=initArray(32)
pedregulho=initArray(32)
madeira=initArray(32)
tabuas=initArray(32)
areia=initArray(32)
vidro=initArray(32)
la=initArray(32)

parse("sv_gm 1")
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
spawnx = math.random(656,4752)
spawny = math.random(656,4752)
tempo = 0

terra = image("gfx/SagosWins/Minecraft/Terra.bmp",0,0,0)
freeimage(terra)




addhook("second","criar_mundo")
function criar_mundo()
tempo = tempo+1
if tempo == 2 then
for criandox = 3,28 do
for criandoy = 3,31 do

onde = math.random(1,8)

if onde == 1 then
parse("spawnobject 1 "..criandox.." "..criandoy)
imgx = criandox*32+16
imgy = criandoy*32+16
terra = image("gfx/SagosWins/Minecraft/Terra.bmp",imgx,imgy,1)
end
end
end
msg("©255255255O Mundo Foi Criado, Divirta-se!")
freehook("second","criar_mundo")
end
end


addhook("spawn","nascer")
function nascer(id)
parse("setpos "..id.." "..spawnx.." "..spawny)
parse("strip "..id.." 50")
return 74
end

addhook("buildattempt","construir")
function construir(id,type,x,y)
menu(id,"Criando 01/03,Blocos de Construção,Blocos Decorativos,Redstone,Transportes,Miscelãnea,Alimentação,Ferramentas,Combate,Próximo")
buildx[id] = x
buildy[id] = y
return 1
end

addhook("menu","craft")
function craft(id,title,botao)
if title == "Criando 01/03" then
if botao == 1 then
menu(id,"Blocos de Construção 01/05,Terra|x"..terra[id]..",Pedra|x"..pedra[id]..",Pedregulho|x"..pedregulho[id]..",Madeira|x"..madeira[id]..",Tábuas|x"..tabuas[id]..",Areia|x"..areia[id]..",Vidro|x"..vidro[id]..",Lã|x"..la[id]..",Próximo")
end
end

if title == "Blocos de Construção 01/05" then
if botao == 1 then
if terra[id] > 0 then
end
end
end
end