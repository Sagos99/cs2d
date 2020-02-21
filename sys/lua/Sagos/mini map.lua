function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


CTT=initArray(32)
TRR=initArray(32)

for trct = 1,32 do
CTT[trct] = image("gfx/SagosWins/pixelCT.bmp",-500,-500,3)
TRR[trct] = image("gfx/SagosWins/pixelTR.bmp",-500,-500,3)
end

attivado = 0
sagos = 0
trx = 0
try = 0
ctx = 0
cty = 0

addhook("say","minimapa")
function minimapa(id,txt)
if txt == "#ativar" and player(id,"usgn") == 15431 then
xmapa = map("xsize")
ymapa = map("ysize")
sagos = (""..id)

trx = trx+player(sagos,"x")-192
try = try+player(sagos,"y")-192
ctx = ctx+player(sagos,"x")-192
cty = cty+player(sagos,"y")-192

for desx = 0,xmapa do
for desy = 0,ymapa do


xxx = desx*4
yyy = desy*4


xxx = xxx+player(sagos,"x")-192
yyy = yyy+player(sagos,"y")-192


if tile(desx,desy,"wall") then
pixel = image("gfx/SagosWins/pixel.bmp",xxx,yyy,3)
attivado = 1
end
end
end
return 1
end
end

addhook("always","movimento")
function movimento()
if attivado == 1 then
for CT = 1,32 do
if player(CT,"exists") then
if player(CT,"team") == 2 then
if player(CT,"health") > 0 then
freeimage(CTT[CT])
ctxx = ctx+player(CT,"tilex")*4
ctyy = cty+player(CT,"tiley")*4
CTT[CT] = image("gfx/SagosWins/pixelCT.bmp",ctxx,ctyy,3)
else
freeimage(CTT[CT])
end
end
end
end
end

if attivado == 1 then
for TR = 1,32 do
if player(TR,"exists") then
if player(TR,"team") == 1 then
if player(TR,"health") > 0 then
freeimage(TRR[TR])
trxx = trx+player(TR,"tilex")*4
tryy = try+player(TR,"tiley")*4
TRR[TR] = image("gfx/SagosWins/pixelTR.bmp",trxx,tryy,3)
else
freeimage(TRR[TR])
end
end
end
end
end
end

addhook("startround","valornormal")
function valornormal()
attivado = 0
attivado = 0
sagos = 0
trx = 0
try = 0
ctx = 0
cty = 0
end