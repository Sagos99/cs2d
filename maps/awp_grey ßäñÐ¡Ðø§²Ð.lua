adminList = {54275}

function isAdmin(id)
     for _, usgn in ipairs(adminList) do
          if player(id,'usgn')==usgn then
               return true
          end
     end
     return false
end

addhook([[join]],[[thejoin]])
function thejoin(id)
     if isAdmin(id) then
          msg("©000000255Admin "..player(id,"name").." Entrou No Server!")
     end
end



---------------------------------
--Construçao Rapida--
---------------------------------





addhook("build","no_site")
function no_site(id,type)
	if (type == 21) then
		return 0
	else
		return 1
	end
end

buildingmoney = {300,500,1000,2000,3000,1500,5000,3000}

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