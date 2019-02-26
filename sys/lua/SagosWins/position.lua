-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------


addhook("say","meulocal")
function meulocal(id,txt)
if txt == "!meu local" then
msg2(id,"Seu Local Em Tile: "..player(id,"tilex").." "..player(id,"tiley"))
msg2(id,"Seu Local Em Pixels: "..player(id,"x").." "..player(id,"y"))
return 1
end
end