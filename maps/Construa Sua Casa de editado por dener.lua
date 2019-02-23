parse("sv_gm 3")
parse("mp_unbuildable supply")
parse("mp_unbuildable turret")
parse("mp_autoteambalance 0")
--[[
Made by teh Unrealsoftware.de User "Heavy"
Rule no 1: Do what ever you want with this script. But dont claim this as your own!

? Changelog:
[ADDED] disabling/enabling money
[FIXED] mines didn't work
[FIXED] building sometimes didn't work (if this still doesn't work ,try disabling other buildingluascripts)
[FIXED] you weren't able to see whose building it is/was
[CHANGED] code cleaned up a bit


ENABLE/DISABLE Stuff (Note: 1 means enabled and 0 means disabled ]]
fastbuild=1
unlimitedbuild=1
money=0


-- FastBuild:

addhook("build","fb")
    function fb(id,type,x,y)

		function spawnobject()		
			parse("spawnobject "..type.." "..x.." "..y.." 0 0 "..player(id,"team").." "..id);
		end

		function checkmoney(mmoney)
			if(money==1) then
				parse("setmoney "..id.." "..player(id,"money")-mmoney);
			end
		end

        if (fastbuild==1) then
			if(type==1) and (player(id,"money")>=300) then
				spawnobject()
				checkmoney(300)
			elseif(type==2) and (player(id,"money")>=500) then
				spawnobject()
				checkmoney(500)
			elseif(type==3) and (player(id,"money")>=1000) then
				spawnobject()
				checkmoney(1000)
			elseif(type==4) and (player(id,"money")>=2000) then
				spawnobject()
				checkmoney(2000)
			elseif(type==5) and (player(id,"money")>=3000) then
				spawnobject()
				checkmoney(3000)
			elseif(type==6) and (player(id,"money")>=1500) then
				spawnobject()
				checkmoney(1500)
			elseif(type==7) and (player(id,"money")>=5000) then
				spawnobject()
				checkmoney(5000)
			elseif(type==8) and (player(id,"money")>=5000) then
				spawnobject()
				checkmoney(5000)
			elseif(type==9) and (player(id,"money")>=5000) then
				spawnobject()
				checkmoney(5000)
			elseif(type==13) and (player(id,"money")>=3000) then
				spawnobject()
				checkmoney(3000)
			elseif(type==14) and (player(id,"money")>=3000) then
				spawnobject()
				checkmoney(5000)
			elseif(type==20) then -- Mines...
				spawnobject()
			end
            return 1
		else
			return 0
        end
    end

-- UnlimitedBuild:

if (unlimitedbuild==1) then
    parse('mp_building_limit "Barricade" 10000');
    parse('mp_building_limit "Barbed Wire" 10000');
    parse('mp_building_limit "Wall I" 10000');
    parse('mp_building_limit "Wall II" 10000');
    parse('mp_building_limit "Wall III" 10000');
    parse('mp_building_limit "Gate Field" 10000');
    parse('mp_building_limit "Turret" 10000');
    parse('mp_building_limit "Dispenser" 10000');
    parse('mp_building_limit "Supply" 10000');
    parse('mp_building_limit "Teleporter Entrance" 10000');
    parse('mp_building_limit "Teleporter Exit" 10000');
end
