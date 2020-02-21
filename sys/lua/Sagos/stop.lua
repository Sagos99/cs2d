usgn = 15431

parar = 0

addhook("use","usar")
function usar(id)
if player(id,"usgn") == 15431 and parar == 0 then
parar = 1
parse("bot_freeze 1")
for all = 1,32 do
if player(all,"exists") and all ~= id then
parse("speedmod "..all.." -30")
end
end

elseif player(id,"usgn") == 15431 and parar == 1 then
parar = 0
parse("bot_freeze 0")
for all = 1,32 do
if player(all,"exists") and all ~= id then
parse("speedmod "..all.." 0")
end
end

end
end