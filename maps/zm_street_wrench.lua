------------------------------------
-- Bot Server by FastLine Advance --
------------------------------------
-- Number of bots on empty server
bots = 1

addhook('ms100','bot_ms100')
function bot_ms100()
humans = 0
bot_count = 0
	for i = 1,32, 1 do
		if (player(i,'exists')) and (player(i,'bot') == false) then
			humans = humans + 1
		end
	end
	
	for l = 1,32, 1 do
		if (player(l,'exists')) and (player(l,'bot') == true) then
			bot_count = bot_count + 1
		end
	end
		
	if (humans < 2) and (bot_count < bots) then
		for j = 1,bots, 1 do
			parse('bot_add_ct')
		end
	end
	
	if (humans >= 3) then 
	parse('bot_remove')
	end
end
parse('sv_fow "on"')
-------------------------------------------------------
-- Zombie Plague (1.15b) By Blazzingxx
--------------------------------------------------------
-- Version: 1.15(Beta)
-- Release: 2010/04/14
-- Author: Blazzingxx
--------------------------------------------------------
-- Dofiles --
zp_dir = 'sys/lua/zombieplague/zp_'
snd_dir = 'zombieplague/zp_'
dofile(zp_dir..'config.cfg')
dofile(zp_dir..'values.lua')
dofile(zp_dir..'func_up.lua')
dofile(zp_dir..'console.lua')
dofile(zp_dir..'filter.lua')
dofile(zp_dir..'func_m.lua')
dofile(zp_dir..'func.lua')
dofile(zp_dir..'settings.cfg')

-- Hooks --
addhook("team","zp_team")
addhook("join","zp_join")
addhook("spawn","zp_spawn")
addhook("kill","zp_kill")
addhook("menu","zp_menu")
addhook("serveraction","zp_serveraction")
addhook("minute","zp_minute")
addhook("projectile","zp_projectile")
addhook("second","zp_second")
addhook("startround","zp_startround")
addhook("endround","zp_endround")
addhook("die","zp_die")
addhook("parse","zp_parse")
addhook("buy","zp_buy")
addhook("leave","zp_leave")
addhook("say","zp_say")