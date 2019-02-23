seguir = 2

addhook("serveraction","acao")
function acao(id,act)
if player(seguir,"exists") then
if act == 1 then

x2 = player(seguir,"x")
y2 = player(seguir,"y")
x1 = player(id,"x")
y1 = player(id,"y")

rota = math.deg(math.atan2(x2-x1,y1-y2))

parse("spawnprojectile "..id.." 47 "..player(id,"x").." "..player(id,"y").." 9999 "..rota)

end
end
end