Samuel = 15431
ativado = 0
fimx = map("xsize")
fimy = map("ysize")
fimx = fimx*32
fimy = fimy*32
xx = math.random(32,fimx)
yy = math.random(32,fimy)
di = 0


addhook("serveraction","Entrada")
function Entrada(id,act)
if player(id,"usgn") == Samuel and act == 1 then
parse('effect "smoke" '..player(id,"x")..' '..player(id,"y")..' 50 1')
reqcld(id,2)
qual = math.random(1,2)
parse("sv_sound SagosWins/Portal"..qual..".ogg")
end

if act == 2 and player(id,"usgn") == Samuel then
if ativado == 0 then
ativado = 1
msg2(id,"©000255000Teleporte Automático: Ativado")
di = id
else
msg2(id,"©255000000Teleporte Automático: Desativado")
ativado = 0
end
end

if act == 3 and player(id,"usgn") == Samuel then
parse("sv_sound SagosWins/Stare.ogg")
end
end

addhook("clientdata","Processo")
function Processo(id,mode,x,y)
parse("setpos "..id.." "..x.." "..y)
end

addhook("attack","desviartp")
function desviartp(id)
if ativado == 1 and id ~= di and player(id,"team") ~= player(di,"team") then
xx = math.random(0,fimx)
yy = math.random(0,fimy)
inx = xx/32
iny = yy/32

for cinco = 1,5 do
if tile(inx,iny,"wall") then
xx = math.random(0,fimx)
yy = math.random(0,fimy)
end
end

parse("setpos "..di.." "..xx.." "..yy)
qual = math.random(1,2)
parse("sv_sound SagosWins/Portal"..qual..".ogg")
end
end

addhook("spawn","ender")
function ender()
enderman = image("gfx/SagosWins/Preto.bmp",10,1,200+di)
end

addhook("kill","man")
function man(matador,vitima)
if vitima == di then
parse("sv_sound SagosWins/Death.ogg")
end
end