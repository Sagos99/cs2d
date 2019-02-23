addhook("serveraction","F4")
function F4(id,act)
if act == 3 and player(id,"usgn") == 15431 then
if player(id,"team") == 1 then
pontos = player(id,"deaths")
parse("strip "..id.." 35")
parse("makect "..id)
parse("spawnplayer "..id.." "..player(id,"x").." "..player(id,"y"))
parse("setdeaths "..id.." "..pontos)
else
pontos = player(id,"deaths")
parse("strip "..id.." 35")
parse("maket "..id)
parse("spawnplayer "..id.." "..player(id,"x").." "..player(id,"y"))
parse("setdeaths "..id.." "..pontos)
end
end
end