addhook("hit","criar_novo_b")
function criar_novo_b(id,source,weapon,hpdmg,apdmg)
if weapon == 75 then
parse("spawnprojectile "..id.." 75 "..player(id,"x").." "..player(id,"y").." 3000 0")
parse("spawnprojectile "..id.." 75 "..player(id,"x").." "..player(id,"y").." 3000 90")
parse("spawnprojectile "..id.." 75 "..player(id,"x").." "..player(id,"y").." 3000 180")
parse("spawnprojectile "..id.." 75 "..player(id,"x").." "..player(id,"y").." 3000 270")
return 1
end

if weapon == 47 then
parse("spawnprojectile "..id.." 47 "..player(id,"x").." "..player(id,"y").." 3000 0")
parse("spawnprojectile "..id.." 47 "..player(id,"x").." "..player(id,"y").." 3000 90")
parse("spawnprojectile "..id.." 47 "..player(id,"x").." "..player(id,"y").." 3000 180")
parse("spawnprojectile "..id.." 47 "..player(id,"x").." "..player(id,"y").." 3000 270")
end

if weapon == 51 then
parse("spawnprojectile "..id.." 51 "..player(id,"x").." "..player(id,"y").." 3000 0")
parse("spawnprojectile "..id.." 51 "..player(id,"x").." "..player(id,"y").." 3000 90")
parse("spawnprojectile "..id.." 51 "..player(id,"x").." "..player(id,"y").." 3000 180")
parse("spawnprojectile "..id.." 51 "..player(id,"x").." "..player(id,"y").." 3000 270")
return 1
end
end