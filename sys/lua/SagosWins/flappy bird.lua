function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


sub=initArray(32)

addhook("always","sempre")
function sempre()
for j = 1,11 do

if sub[j] > 0 then
sub[j] = sub[j]-1
end


--sobe--
if player(j,"exists") and player(j,"tilex") >= 4 and player(j,"tilex") < 149 and sub[j] > 1 then
x = player(j,"x")+2
y = player(j,"y")-5
parse("setpos "..j.." "..x.." "..y)
parse("speedmod "..j.." -30")
end


--desce--
if player(j,"exists") and player(j,"tilex") >= 4 and player(j,"tilex") < 149 and sub[j] == 0 then
x = player(j,"x")+2
y = player(j,"y")+4
parse("setpos "..j.." "..x.." "..y)
parse("speedmod "..j.." -30")
end

xx = player(j,"tilex")
yy = player(j,"tiley")

if tile(xx,yy,"wall") then
if player(j,"health") > 0 then
parse("killplayer "..j)
end
end

end
end

addhook("use","usar")
function usar(id)
sub[id] = 10
end

addhook("spawn","nascer")
function nascer(id)
parse("speedmod "..id.." 0")
end