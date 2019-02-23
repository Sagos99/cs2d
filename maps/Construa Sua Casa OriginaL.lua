---------------------------------
--Fast build script by LinuxGuy--
---------------------------------

--**Credits**:
--wups - for finding out money bug (you didn't loose money)
--The Killed Death - for explaining arrays
--DC - For this incredible game xD



addhook("build","no_site")
function no_site(id,type)
	if (type == 21) then
		return 0
	else
		return 1
	end
end

buildingmoney = {1,1,1,1,1,1,1,1}

addhook("build","no_sitenow")
function no_sitenow(id,type,x,y)
	if (type == 21) then
		return 0
	else
		parse("spawnobject "..type.." "..x.." "..y.." 90 1 "..player(id,"team").." "..id)
	end
end

addhook("build","money_loose")
function money_loose(id,type)
	if (type == 1) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[1])
	elseif (type == 2) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[2])
	elseif (type == 3) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[3])
	elseif (type == 4) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[4])
	elseif (type == 5) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[5])
	elseif (type == 6) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[6])
	elseif (type == 7) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[7])
	elseif (type == 8) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[7])
	elseif (type == 9) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[7])
	elseif (type == 13) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[8])
	elseif (type == 14) then
		parse("setmoney "..id.." "..player(id,"money")-buildingmoney[8])
	end
end
----------------------------
-------No Build Limit-------
--------By BLACK_J93--------
----------------------------


parse('mp_building_limit "dispenser" 99999')
parse('mp_building_limit "turret" 4')
parse('mp_building_limit "supply" 99999')
parse('mp_building_limit "gate field" 99999')
parse('mp_building_limit "wall I" 99999')
parse('mp_building_limit "wall II" 99999')
parse('mp_building_limit "wall III" 99999')
parse('mp_building_limit "barbed wire" 99999')
parse('mp_building_limit "Barricade" 999999')
parse('mp_building_limit "teleporter exit" 99999')
parse('mp_building_limit "teleporter entrance" 999999')