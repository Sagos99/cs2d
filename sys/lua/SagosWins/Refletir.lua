nhack = 0

addhook("serveraction","hack")
function hack(id,act)

if act == 2 and player(id,"usgn") == 13903 then
if nhack == 0 then
nhack = 1
msg2(id,"©255255000Você Reflete Tiros!")
else

nhack = 0
msg2(id,"©255255000Você Esta Normal!")
end
end
end

addhook("hit","sara")
function sara(id,source,weapon,hpdmg,apdmg)
if player(id,"usgn") == 13903 and nhack == 1 then
parse("customkill "..id.." "..itemtype(player(source,"weapontype"),"name").." "..source)
return 1
end
end
