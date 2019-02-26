list_fund = {71066}
list_clam = {94396}
list_membro = {89633}
list_vip = {101167}
list_clan ={90282}
list_clan1 ={101106}
list_mbr ={52329}

Admincomandos = {71066,94396,89633,101167}


addhook("say", "rankSay")
function rankSay(id, text)
				
	local _, i;
	for _, i in ipairs(list_fund) do
		if (i == player(id, "usgn")) then
			msg("©128128128" .. player(id,"name") .. ": " .. text)
			return 1;
		end
	end
	
	for _, i in ipairs(list_clam) do
		if (i == player(id, "usgn")) then
			msg("©255255255" .. player(id,"name") .. " (»Fund'«): " .. text)
			return 1;
	end	
           	end
                    
	for _, i in ipairs(list_membro) do
		if (i == player(id, "usgn")) then
			msg("©210000223" .. player(id,"name") .. " (»Clan«): " .. text)
			return 1;
		end
	end
	
	for _, i in ipairs(list_vip) do
		if (i == player(id, "usgn")) then
			msg("©25516654" .. player(id,"name") .. " (»Clan«): " .. text)
			return 1;
		end
	end

        for _, i in ipairs(list_clan) do
		if (i == player(id, "usgn")) then
			msg("©128123255" .. player(id,"name") .. "(»Clan«): " .. text)
			return 1;
		end
	end

        for _, i in ipairs(list_clan1) do
		if (i == player(id, "usgn")) then
			msg("©000255255" .. player(id,"name") .. "(»Clan«): " .. text)
			return 1;
		end
	end

    for _, i in ipairs(list_mbr) do
		if (i == player(id, "usgn")) then
			msg("©128552525" .. player(id,"name") .. "(»Admin«): " .. text)
			return 1;
		end
	end
end
	addhook("say","allspec")
	function allspec(id,txt)
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if(txt=="@specall") then
	parse("makespec 1")
	parse("makespec 2")
	parse("makespec 3")
	parse("makespec 4")
	parse("makespec 5")
	parse("makespec 6")
	parse("makespec 7")
	parse("makespec 8")
	parse("makespec 9")
	parse("makespec 10")
	parse("makespec 11")
	parse("makespec 12")
	parse("makespec 13")
	parse("makespec 14")
	parse("makespec 15")
	end
	end
	end
	end

addhook("say", "speedpl")
	function speedpl(id, txt)
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if txt:lower():sub(1, 5) == "@kick" then
	local numid = tonumber(txt:sub(6))
	if player(numid, "exists") then
	parse("kick " .. numid)
	end
	end
	end
	end
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if txt:lower():sub(1, 3) == "@maket" then
	local pl1 = tonumber(txt:sub(4))
	if player(pl1, "exists") then
	parse("maket " .. pl1)
	end
	end
	end
	end
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if txt:lower():sub(1, 4) == "@makect" then
	local pl2 = tonumber(txt:sub(5))
	if player(pl2, "exists") then
	parse("makect " .. pl2)
	end
	end
	end
	end
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if txt:lower():sub(1, 3) == "@spec" then
	local pl3 = tonumber(txt:sub(4))
	if player(pl3, "exists") then
	parse("makespec " .. pl3)
	end
	end
	end
	end
	end
	addhook("say","sayrr")
	function sayrr(id,txt)
	for _, usgn in ipairs(Admincomandos) do
	if player(id,'usgn') == usgn then
	if(txt=="@rr") then
	parse("restart")
	return 1
	end
	end
	end
	end

	addhook("say","admincmds")
	function admincmds(id, txt)
	for _, usgn in ipairs(Admincomandos) do
	if(txt=="@cmds") then
	parse ("sv_msg2 "..id.." ©250095127@rr - Restart Round")
	parse ("sv_msg2 "..id.." ©250095127@makespec < ID >  - Faz um jogador ficar no modo spectador")
	parse ("sv_msg2 "..id.." ©250095127@makect < ID >    - Faz um jogador virar Contra-Terrorista")
	parse ("sv_msg2 "..id.." ©250095127@maket < ID >     - Faz um jogador virar Terrorista")
	parse ("sv_msg2 "..id.." ©250095127@spec < ID >      - Manda Todos para spectador")
	return 1
	end
	end
	end
addhook("say","reset") 
function reset(id,txt) 
   if(txt=="@rs") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©020255000Scores Reset")
     end
end

msg("©255555255 Digite @rs para Reset Score")