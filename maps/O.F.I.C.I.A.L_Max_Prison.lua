c=string.char(45)

function Array(a,b)
	local array = {}
	for i = 1, a do
		array[i]=b
	end
	return array
end
addhook("movetile","strip_all_weapons")
function strip_all_weapons(id,x,y)
	--[[msg(tostring(entity(x,y,"typename")))
	msg(tostring(entity(x,y,"type")))
	msg(tostring(entity(x,y,"name")))
	msg(tostring(entity(x,y,"trigger")))
	msg("-----")]]
	if entity(x,y,"typename")=="Trigger_Move" and entity(x,y,"name")=="strip" then
		for _,iid in ipairs(playerweapons(id)) do
			parse("strip "..id.." "..iid)
		end
		msg2(id,c.."Removed ALL WEAPONS!")
	end
end