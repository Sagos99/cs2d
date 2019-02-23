admins = {36963,73431,82064,80881,39486,78581,54512,81542,66125}
vip = {18645,78913}
adminlist = {36963,73431,82064,80881,39486,78581,54512,81542,66125}


addhook("say","adminsay")
function adminsay(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
	msg("©255255255"..player(id,"name").." »ÄÐ¡M¡Ñ«: "..txt)
return 1
end
end
end

addhook("say","adminsayv")
function adminsayv(id,txts)
for _, usgn in ipairs(vip) do
if player(id,'usgn') == usgn then
	msg("©1234567"..player(id,"name").." »V¡Þ«: "..txts)
return 1
end
end
end

addhook("serveraction","menuac")
addhook("menu","men")
function menuac(id,ac)
for _, usgn in ipairs(admins,vip) do
if player(id,'usgn') == usgn then
if ac==1 then
menu(id,"Legend,Ekipmanlar,Restart,Yapimci | Legend")
end
function men(id,title,sel)
if (title=="Legend") then
if (sel==1) then
menu(id,"menü2,Full Ekipman")
elseif (sel==2) then
parse([[restart]])
end
function men(id,title,sel)
if (title=="menü2") then
if (sel==1) then
parse("equip "..id.." 45")
parse("equip "..id.." 83")
parse("equip "..id.." 88")
parse("equip "..id.." 78")
parse("equip "..id.." 85")
parse("equip "..id.." 48")
parse("equip "..id.." 49")
parse("equip "..id.." 47")
parse("equip "..id.." 46")
parse("equip "..id.." 45")
parse("equip "..id.." 44")
parse("equip "..id.." 43")
parse("equip "..id.." 42")
parse("equip "..id.." 41")



end
end
end
end
end
end
end
end

if sample==nil then sample={} end
sample.ut={}

-----------------------
-- INITIAL SETUP     --
-----------------------
function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end
sample.ut.timer=initArray(32)
sample.ut.level=initArray(32)
sample.ut.fblood=


-----------------------
-- PREPARE TO FIGHT! --
-----------------------
addhook("startround","sample.ut.startround")
function sample.ut.startround()
	parse("sv_sound \"fun/prepare.wav\"")
	sample.ut.fblood=0
end


-----------------------
-- KILL SOUNDS+MSGS  --
-----------------------
addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
	if (os.clock()-sample.ut.timer[killer])>30 then
		sample.ut.level[killer]=0;
	end
	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level
	sample.ut.timer[killer]=os.clock()
	-- FIRST BLOOD?
	if (sample.ut.fblood==1) then
		sample.ut.fblood=1
		parse("sv_sound \"fun/firstblood.wav\"");
		msg (player(killer,"name").." FIRSTBLOOD  "..player(victim,"name").."!@C")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg ("©123456789"..player(killer,"name").." HUMILHOU O NOOB OTÁRIO KKKKKKKK! "..player(victim,"name").."!@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©000000255"..player(killer,"name").." MATOU 1 NOOB SHAUSHAASHAU DOUBLEKILL @C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©000000255"..player(killer,"name").." MATOU 2 LIXÕES DOS PORRA MULTIKILKILKIL @C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." ESSE CARA NAO PARA!! AGORA FOI UM ULTRAKILL@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." O CARA É UM MONSTRO!! PELO MONSTERKILL@C")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." DIABOO NAO MORRE! E AGORA FAZ UM RAMPAGE LOL!@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." CARALHO É O MATA MATA! E COMEÇA COM O KILLINGSPREE@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." PERFECT PORRA! COM GODLIKE@C")
		elseif (level==9) then
			parse("sv_sound \"sfx/SOU FODA AVASSALADORES.MP3\"")
			msg ("©200000000 "..player(killer,"name").." É O Fodaaa! TERRORIST OU COUNTER-TERRORIST WIN!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©200000000 "..player(killer,"name").." UNSTOPPABLE "..level.." KILLS O PORRA!! É O DIABO LEVA ELE CHESUIS TAH TAH TAH TAH!@C")
		end
	end
end

