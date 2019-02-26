parse("mp_roundtime 10")
parse("mp_zombierecover 5")
parse("mp_zombiespeedmod -10")
---------------------
wpnrank = {	[0] = 2, 1, 3, 5, 4, 6, 10, 11, 23, 20, 22, 38, 30, 33, 37, 40, 49, 46, 48, 47, 91, 90 }
plkills = { 0 }

for inx = 1,33 do
	plkills[inx] = 0
end
---------------------
addhook("kill","twds_kill") 
function twds_kill(killer, victim, weapon, x, y)

	if(player(killer, "team") == 2) then
		plkills[killer] = plkills[killer] + 1
		wpid = math.floor(tonumber(plkills[killer]/2))
		if(wpid < 21 and (wpid - (plkills[killer]/2)) == 0) then
			parse("equip "..killer.." "..wpnrank[wpid])
			if(current_wave > 10) then parse("equip "..killer.." 76") end
			msg2(killer, "©000255000You got "..itemtype(wpnrank[wpid], "name"))
		end
		if(current_wave > 20) then parse("equip "..killer.." 89") end
	end
	
end
---------------------
addhook("die","twds_die") 
function twds_die(victim, killer)

	if(player(victim, "team") == 2 and player(killer, "team") == 1) then
		timer(0,"parse","makect "..victim)
	end
	return 1
end
---------------------
-- For zombie
---------------------
ctm = 0
current_wave = 1
maxwaves = 30
wvdat = -- h, a, i, i, s --
{
	{ 100, 0  }, -- 100-250
	{ 120, 0  },
	{ 130, 0  },
	{ 140, 0  },
	{ 150, 0  },
	{ 200, 0  },
	{ 250, 0  }, 
	{ 210, 79  }, -- 262-312
	{ 220, 79  },
	{ 230, 79  },
	{ 240, 79  },
	{ 250, 79  },
	{ 220, 80  }, -- 330-375
	{ 230, 80  },
	{ 240, 80  },
	{ 250, 80  },
	{ 220, 82  }, -- ??? med armor 50%+
	{ 230, 82  },
	{ 240, 82  },
	{ 250, 82  },
	{ 220, 81  }, -- 385-437
	{ 230, 81  },
	{ 240, 81  },
	{ 250, 81  },	
	{ 230, 83  }, -- 448-487
	{ 240, 83  }, -- zr 6
	{ 250, 83  }, -- zr 7
	{ 250, 83  }, -- zr 9
	{ 250, 83  }, -- zr 10
	{ 250, 83  }  -- zr 20
}

wvdim = 
{
	[21] = { 86, 5 }, 
	[22] = { 86, 5 },
	[23] = { 86, 5 },
	[24] = { 51, 5 },	
	[25] = { 51, 6 },
	[26] = { 51, 7 },
	[27] = { 73, 8 },
	[28] = { 73, 9 },
	[29] = { 76, 10 },
	[30] = { 76, 20 }
}
---------------------
addhook("second","twds_second")
function twds_second()
	
	if(ctm > 19 and current_wave < maxwaves) then
		ctm = 0
		current_wave = current_wave + 1
		if(current_wave > 20) then	parse("mp_zombierecover "..wvdim[current_wave][2])	end
		msg("©255000000 Wave "..current_wave.." is coming!")
		parse("triggerposition 46 24")
	else
		ctm = ctm + 1;
	end

end
---------------------
addhook("spawn","twds_spawn")
function twds_spawn(id)

	if(player(id, "team") == 1) then
		parse("equip "..id.." 73")
		parse("setmaxhealth "..id.." "..wvdat[current_wave][1])
		if(wvdat[current_wave][2] > 0) then parse("equip "..id.." "..wvdat[current_wave][2]) end
		if(current_wave > 20) then	parse("equip "..id.." "..wvdim[current_wave][1]) end
		if(player(id, "bot") == true) then 
			timer(1000,"twds_zmewpn",id)
		end
	elseif(player(id, "team") == 2) then
		parse("setmaxhealth "..id.." 100")
		wpid2 = math.floor(tonumber(plkills[id]/2))
		if(wpid2 < 21) then
			parse("equip "..id.." "..wpnrank[wpid2])
		else
			parse("equip "..id.." "..wpnrank[21])
		end
		if(current_wave > 15) then parse("equip "..id.." 89") end
		
		if(current_wave > 5 and wpid2 < (current_wave-5)) then
			if(current_wave < 26) then 
				parse("equip "..id.." "..wpnrank[(current_wave-5)])
			else
				parse("equip "..id.." "..wpnrank[21])
			end
		end
		
	end
	
end
---------------------
function twds_zmewpn(id)
	ai_selectweapon(id, 73)
end
---------------------
addhook("startround_prespawn","twds_start")
function twds_start()
	ctm = 0
	current_wave = 1
	parse("mp_zombierecover 5")
	for inx = 1,33 do
	plkills[inx] = 0
	end
end
---------------------
addhook("join","twds_join")
function twds_join(id)
	plkills[id] = 0
end
---------------------
addhook("walkover","twds_walkover")
function twds_walkover(id,iid,type)

	if(type == 32 or type == 47) then
		return 1
	elseif(type == 89 and current_wave < 15) then
		return 1
	end
	
	return 0
end
---------------------