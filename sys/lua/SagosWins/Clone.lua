addhook("serveraction","teste")
function teste(id,act)
if player(id,"usgn") == 15431 and act == 1 then
reqcld(id,2)
end
if player(id,"usgn") == 15431 and act == 2 then
freeimage(disfarce)
freeimage(disfarce2)
end
end
addhook("clientdata","receber")
function receber(id,mode,data1,data2)
x = player(id,"x")
y = player(id,"y")
disfarce = image("gfx/SagosWins/ct.bmp",x,y,0)
rota = player(id,"rot")
imagepos(disfarce,x,y,rota)
x = data1
y = data2
x = x/32
y = y/32
x = math.floor(x)
y = math.floor(y)
x = x*32+16
y = y*32+16
parse("setpos "..id.." "..x.." "..y)
disfarce2 = image("gfx/SagosWins/parede.bmp",0,1,200+id)
end