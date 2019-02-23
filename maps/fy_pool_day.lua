addhook("movetile","pool")
function pool (id,x,y)
        if (tile(x,y, "property")==14) then
                parse("speedmod "..id.." -11")
        else
                parse("speedmod "..id.." 0")
        end
end
property14 = water

-- АЛЬТЕРНАТИВНЫЕ ТОЧКИ РЕСПАВНА
-- если их не добавлять игроки будут спавниться на обычных местах
-- использованы хуки: onSpawn
do
	local spawnT = {}
	local spawnCT = {}
	
	function addSpawnT(x,y)
		table.insert(spawnT,{x*32+16,y*32+16})
	end
	
	function addSpawnCT(x,y)
		table.insert(spawnCT,{x*32+16,y*32+16})
	end
	
	addhook("spawn","onSpawn")
	function onSpawn(id)
		local pt = player(id,"team")
		local coord
		if pt == 1 then
			coord = spawnT[math.random(1,#spawnT)]
		elseif pt == 2 then
			coord = spawnCT[math.random(1,#spawnCT)]
		end
		parse ("setpos "..id.." "..coord[1].." "..coord[2])
	end
end

-- ЗОНЫ ПОКУПКИ
-- если их не добавлять - покупка будет возможна везде
-- использованы хуки: onBuy
do
	local buyZones = {}
	
	addhook("buy","onBuy")
	function onBuy(id, weapon)
		if #buyZones == 0 then return 0 end
		local x = player(id,"x")/32
		local y = player(id,"y")/32
		for _,rect in pairs(buyZones) do
			local t = player(id,"team"); local zt = rect[5]
			if not zt or ((t == 1 and zt == "t") or (t == 2 and zt == "ct")) then
				if rect[1] < x and x < rect[3]+1 and rect[2] < y and y < rect[4]+1 then
					return 0
				end
			end
		end
		
		-- здесь можно вставить код, если покупка запрещена
		return 1
	end
	
	function addBuyZone(x1,y1,x2,y2,t)
		table.insert(buyZones,{x1,y1,x2,y2,t})
	end
end

--addBuyZone(x1,y1,x2,y2,[team])
--		x1,y1 - координаты левой верхней точки зоны в тайлах
--		x2,y2 - координаты правой верхней точки зоны в тайлах
--		team  - необязятельный параметр, "t" - зона относится к терористам, "ct" - зона относится к ментам
--addSpawnT(x,y)
--		x,y - координаты респавна терористов в тайлах
--addSpawnCT(x,y)
--		x,y - координаты респавна ментов в тайлах


addBuyZone(16,18,18,20)

addSpawnT(8,7); addSpawnT(8,9); addSpawnT(2,9)
addSpawnT(8,11); addSpawnT(4,11); addSpawnT(2,11)
addSpawnT(2,14); addSpawnT(8,16); addSpawnT(3,18)
addSpawnT(7,20); addSpawnT(3,22); addSpawnT(9,20)
addSpawnT(4,24); addSpawnT(7,24); addSpawnT(10,24)

addSpawnCT(25,6); addSpawnCT(27,6); addSpawnCT(30,9)
addSpawnCT(32,9); addSpawnCT(26,12); addSpawnCT(30,11)
addSpawnCT(32,11); addSpawnCT(31,14); addSpawnCT(31,16)
addSpawnCT(26,16); addSpawnCT(31,18); addSpawnCT(25,20)
addSpawnCT(24,24); addSpawnCT(27,24); addSpawnCT(30,24)