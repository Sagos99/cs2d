----------------------------------------------------------------------
----------------------Script By Sagoswins-----------------------------
----------------------------------------------------------------------

--==============Limit Dos Building====================--
parse("mp_building_limit \"Wall I\" 9999")
parse("mp_building_limit \"Wall II\" 9999")
parse("mp_building_limit \"Wall III\" 9999")
parse("mp_building_limit \"Barricade\" 9999")
parse("mp_building_limit \"Turret\" 9999")
parse("mp_building_limit \"Dispenser\" 9999")
parse("mp_building_limit \"Supply\" 9999")
parse("mp_building_limit \"Gate field\" 9999")
parse("mp_building_limit \"teleporter entrance\" 9999")
parse("mp_building_limit \"teleporter exit\" 9999")
parse("mp_building_limit \"barbed wire\" 9999")
--=====================================================--

addhook("build","rapido")
function rapido(id,type,x,y)
parse("spawnobject "..type.." "..x.." "..y.." 90 1 "..player(id,"team").." "..id)	
return 1
end

--===============Preço Dos Building====================--
parse("mp_building_price \"teleporter entrance\" 0")
parse("mp_building_price \"teleporter exit\" 0")
parse("mp_building_price \"barbed wire\" 0")
parse("mp_building_price \"Wall I\" 0")
parse("mp_building_price \"Wall II\" 0")
parse("mp_building_price \"Wall III\" 0")
parse("mp_building_price \"Barricade\" 0")
parse("mp_building_price \"Turret\" 0")
parse("mp_building_price \"Dispenser\" 0")
parse("mp_building_price \"Supply\" 0")
parse("mp_building_price \"Gate field\" 0")
--=====================================================--