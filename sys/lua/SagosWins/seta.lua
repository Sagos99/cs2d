seguir = 2

x1 = 755
y1 = 485
deati = 0
seta = image("gfx/SagosWins/SETA.png",x1,y1,0)

addhook("spawn","retorna")
function retorna(id)
if deati == 1 and id == seguir then
seta = image("gfx/SagosWins/SETA.png",x1,y1,0)
end

end

addhook("always","aponta")
function aponta()

if player(seguir,"exists") then
deati = 1
else
freeimage(seta)
end

if player(seguir,"exists") and deati == 1 then

x2 = player(seguir,"x")
y2 = player(seguir,"y")

rota = math.deg(math.atan2(x2-x1,y1-y2))

imagepos(seta,x1,y1,rota)

end



end