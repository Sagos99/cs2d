a = 0

addhook("always","wall")
function wall()
if a < 16 then
a = a+1
end
if a > 15 then
a = 0
end
if a == 5 then
parse("trigger w1")
end
if a == 7 then
parse("trigger w1")
end
end