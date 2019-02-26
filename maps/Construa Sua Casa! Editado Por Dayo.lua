function Array(size,value) 
	local array = {}
	for i = 1, size do
		array[i]=value
	end
	return array
end

ct_man = Array(32,false)
adminnokill = Array(32,false)

adminList = {15431}

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
          msg("©000000255Admin "..player(id,"name").." enters the server!")
     end
end

addhook([[team]],[[theteam]])
function theteam(id,t)
     if isAdmin(id) then
          if t==2 then
               adminnokill[id]=true
               ct_man[id]=true
          elseif t==1 then
               ct_man[id]=true
          end
     end
end

addhook([[hit]],[[thehit]])
function thehit(id,source,weapon,hpdmg,apdmg)
     if adminnokill[id]==true then
          return 1
     end
end

addhook([[serveraction]],[[servaction]])
function servaction(id,acti)
   if ct_man[id]==false then
      if acti == 3 then
         local rot = player(id,[[rot]])
         if rot < -90 then rot = rot + 360 end
         local angle = math.rad(math.abs( rot + 90 )) - math.pi
         local x = player(id,[[x]]) + math.cos(angle) * 25
         local y = player(id,[[y]]) + math.sin(angle) * 25
         if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
            parse([[setpos ]]..id..[[ ]]..x..[[ ]]..y)
         end
      end
   end
end

addhook([[serveraction]],[[servaction2]])
function servaction2(id,acti)
   if ct_man[id]==false then
      if acti == 2 then
         local rot = player(id,[[rot]])
         if rot < -90 then rot = rot + 360 end
         local angle = math.rad(math.abs( rot + 90 )) - math.pi
         local x = player(id,[[x]]) + math.cos(angle) * 75
         local y = player(id,[[y]]) + math.sin(angle) * 75
         if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
            parse([[setpos ]]..id..[[ ]]..x..[[ ]]..y)
         end
      end
   end
end

addhook("minute","dayo")
function dayo()
	msg("©000000255script criado por Dayo") end

addhook([[serveraction]],[[servaction3]])
function servaction3(id,acti)
   if ct_man[id]==false then
      if acti == 1 then
         local rot = player(id,[[rot]])
         if rot < -90 then rot = rot + 360 end
         local angle = math.rad(math.abs( rot + 90 )) - math.pi
         local x = player(id,[[x]]) + math.cos(angle) * 600
         local y = player(id,[[y]]) + math.sin(angle) * 600
         if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
            parse([[setpos ]]..id..[[ ]]..x..[[ ]]..y)
         end
      end
   end
end

addhook("hit","prisao")
function prisao(id,weapon)
    if weapon == 1 then
	parse("setpos "..id.." 4400 150") end
end

addhook("ms100","money")
function money()
	parse("setmoney 1 16000") end