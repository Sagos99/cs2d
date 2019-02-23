adminlist = {32796,96487}
mbrlist   = {71066,95131,49725,91175,47833,80692,31882}
slist     = {84685}


addhook("say","sayr")
function sayr(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
    msg("©050255255"..player(id,"name").." [Admin*]: "..txt)
return 1
end
end
for _, usgn in ipairs(mbrlist) do
if player(id,'usgn') == usgn then
    msg("©050255000"..player(id,"name").." [Membro]:  "..txt)
return 1
end
end
for _, usgn in ipairs(slist) do
if player(id,'usgn') == usgn then
    msg("©128000128"..player(id,"name").." [Emo*]: "..txt)
return 1
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
		parse("sv_sound \"fun1/f_wickedsick.wav\"")
		msg (player(victim,"name").." Jaah morreu pro  "..player(killer,"name").."??@C")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/knife1_ultimate.wav\"")
		msg ("©123456789"..player(killer,"name").." HµM¡Lhøµ Ø "..player(victim,"name").." @C")
	else
		-- REGULAR KILL
		if (level==1) then
			parse("sv_sound \"fun/firstblood.wav\"")
			msg ("©128000128"..player(killer,"name").." Måtøµ Sëµ P®¡MëI®ø PåTø!!@C")
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"")
			msg ("©000255000"..player(killer,"name").." Måtøµ 2 Ñß§!!@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©192192192"..player(killer,"name").."  jå føram 3 påtinhøs!@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." LëVø 4 Påtøs @C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." Mlk CåGåø Jå FøRåMM 5 Nbs !@C")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." Dësl¡gå ø åim åew pøhh åf ¬¬ Ja foram 6@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").."  Ja se foram 7 ?@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." N¡NguëEMm Vå¡ MëE MåAta Ñ, LEvei 8@C")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." kkkkkkkk 9 jå e DëE Måis Seus Nb!!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©168098255 "..player(killer,"name").." estråçaâLhøµ ä fµçå de "..level.."  PåTøs NB's!@C")
		end
	end
end


addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end

addhook("startround","imgstart")
function imgstart(start)
image("gfx/cs2dclanssmk2.png",580,375,2,0)
end

addhook("say" , "say_1")
function say_1(id,message)
	if (message=="@rs") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
end
if (message=="@rr") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
end
if (message=="!rs") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
end
if (message=="!reset") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
parse ("sv_msg2 "..id.." ©000255000Score Resetado!")
end
end

addhook("say" , "tigresay1")
function tigresay1(id,message)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if (message=="!Reset") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255098255"..player(id,"name").."  Vc Resetou seu FRAG!")
end
if (message=="!rr") then
parse('restart')
end
end
end
end

addhook("minute","minute_reset")
function minute_reset()
	msg("©000255000 Frag Ruim ?  !reset")
end

addhook("join","thejoin")
function thejoin(id)
          msg("©100100100"..player(id,"name").." Entrou no Server TmN ~* ")
     end

addhook("say" , "tigrekick")
function tigrekick(id,message)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if (message=="!kick 1") then
parse ('kick 1')
end
if (message=="!kick 2") then
parse ('kick 2')
end
if (message=="!kick 3") then
parse ('kick 3')
end
if (message=="!kick 4") then
parse ('kick 4')
end
if (message=="!kick 5") then
parse ('kick 5')
end
if (message=="!kick 6") then
parse ('kick 6')
end
if (message=="!kick 7") then
parse ('kick 7')
end
if (message=="!kick 8") then
parse ('kick 8')
end
if (message=="!kick 9") then
parse ('kick 9')
end
if (message=="!kick 10") then
parse ('kick 10')
end
if (message=="!kick 11") then
parse ('kick 11')
end
if (message=="!kick 12") then
parse ('kick 12')
end
if (message=="!kick 13") then
parse ('kick 13')
end
if (message=="!kick 14") then
parse ('kick 14')
end
if (message=="!kick 15") then
parse('kick 15')
end
if (message=="!kick 16") then
parse ('kick 16')
end
if (message=="!kick 17") then
parse ('kick 17')
end
if (message=="!kick 18") then
parse ('kick 18')
end
if (message=="!kick 19") then
parse ('kick 19')
end
if (message=="!kick 20") then
parse ('kick 20')
end
if (message=="!kick 21") then
parse ('kick 21')
end
if (message=="!kick 22") then
parse ('kick 22')
end
if (message=="!kick 23") then
parse ('kick 23')
end
if (message=="!kick 24") then
parse ('kick 24')
end
if (message=="!kick 25") then
parse ('kick 25')
end
if (message=="!kick 26") then
parse ('kick 26')
end
if (message=="!kick 27") then
parse ('kick 27')
end
if (message=="!kick 28") then
parse ('kick 28')
end
if (message=="!kick 29") then
parse('kick 29')
end
if (message=="!kick 30") then
parse ('kick 30')
end
if (message=="!kick 31") then
parse ('kick 31')
end
if (message=="!kick 32") then
parse ('kick 32')
end
end
end
end

addhook("say" , "tigrespec")
function tigrespec(id,message)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if (message=="!spec 1") then
parse('makespec 1')
end
if (message=="!spec 2") then
parse('makespec 2')
end
if (message=="!spec 3") then
parse('makespec 3')
end
if (message=="!spec 4") then
parse('makespec 4')
end
if (message=="!spec 5") then
parse('makespec 5')
end
if (message=="!spec 6") then
parse('makespec 6')
end
if (message=="!spec 7") then
parse('makespec 7')
end
if (message=="!spec 8") then
parse('makespec 8')
end
if (message=="!spec 9") then
parse('makespec 9')
end
if (message=="!spec 10") then
parse('makespec 10')
end
if (message=="!spec 11") then
parse('makespec 11')
end
if (message=="!spec 12") then
parse('makespec 12')
end
if (message=="!spec 13") then
parse('makespec 13')
end
if (message=="!spec 14") then
parse('makespec 14')
end
if (message=="!spec 15") then
parse('makespec 15')
end
if (message=="!spec 16") then
parse('makespec 16')
end
if (message=="!spec 17") then
parse('makespec 17')
end
if (message=="!spec 18") then
parse('makespec 18')
end
if (message=="!spec 19") then
parse('makespec 19')
end
if (message=="!spec 20") then
parse('makespec 20')
end
if (message=="!spec 21") then
parse('makespec 21')
end
if (message=="!spec 22") then
parse('makespec 22')
end
if (message=="!spec 23") then
parse('makespec 23')
end
if (message=="!spec 24") then
parse('makespec 24')
end
if (message=="!spec 25") then
parse('makespec 25')
end
if (message=="!spec 26") then
parse('makespec 26')
end
if (message=="!spec 27") then
parse('makespec 27')
end
if (message=="!spec 28") then
parse('makespec 28')
end
if (message=="!spec 29") then
parse('makespec 29')
end
if (message=="!spec 30") then
parse('makespec 30')
end
if (message=="!spec 31") then
parse('makespec 31')
end
if (message=="!spec 32") then
parse('makespec 32')
end
if (message=="!specall") then
parse('makespec 1')
parse('makespec 2')
parse('makespec 3')
parse('makespec 4')
parse('makespec 5')
parse('makespec 6')
parse('makespec 7')
parse('makespec 8')
parse('makespec 9')
parse('makespec 10')
parse('makespec 11')
parse('makespec 12')
parse('makespec 13')
parse('makespec 14')
parse('makespec 15')
parse('makespec 16')
parse('makespec 17')
parse('makespec 18')
parse('makespec 19')
parse('makespec 20')
parse('makespec 21')
parse('makespec 22')
parse('makespec 23')
parse('makespec 24')
parse('makespec 25')
parse('makespec 26')
parse('makespec 27')
parse('makespec 28')
parse('makespec 29')
parse('makespec 30')
parse('makespec 31')
parse('makespec 32')
end
end
end
end

addhook("say" , "tigreequip")
function tigreequip(id,message)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if (message=="!equip 1") then
parse("equip "..id.." 1 ")
end
if (message=="!equip 2") then
parse("equip "..id.." 2 ")
end
if (message=="!equip 3") then
parse("equip "..id.." 3 ")
end
if (message=="!equip 4") then
parse("equip "..id.." 4 ")
end
if (message=="!equip 5") then
parse("equip "..id.." 5 ")
end
if (message=="!equip 6") then
parse("equip "..id.." 6 ")
end
if (message=="!equip 7") then
parse("equip "..id.." 7 ")
end
if (message=="!equip 8") then
parse("equip "..id.." 8 ")
end
if (message=="!equip 9") then
parse("equip "..id.." 9 ")
end
if (message=="!equip 10") then
parse("equip "..id.." 10 ")
end
if (message=="!equip 11") then
parse("equip "..id.." 11 ")
end
if (message=="!equip 12") then
parse("equip "..id.." 12 ")
end
if (message=="!equip 13") then
parse("equip "..id.." 13 ")
end
if (message=="!equip 14") then
parse("equip "..id.." 14 ")
end
if (message=="!equip 15") then
parse("equip "..id.." 15 ")
end
if (message=="!equip 16") then
parse("equip "..id.." 16 ")
end
if (message=="!equip 17") then
parse("equip "..id.." 17 ")
end
if (message=="!equip 18") then
parse("equip "..id.." 18 ")
end
if (message=="!equip 19") then
parse("equip "..id.." 19 ")
end
if (message=="!equip 20") then
parse("equip "..id.." 20 ")
end
if (message=="!equip 21") then
parse("equip "..id.." 21 ")
end
if (message=="!equip 22") then
parse("equip "..id.." 22 ")
end
if (message=="!equip 23") then
parse("equip "..id.." 23 ")
end
if (message=="!equip 24") then
parse("equip "..id.." 24 ")
end
if (message=="!equip 25") then
parse("equip "..id.." 25 ")
end
if (message=="!equip 26") then
parse("equip "..id.." 26 ")
end
if (message=="!equip 27") then
parse("equip "..id.." 27 ")
end
if (message=="!equip 28") then
parse("equip "..id.." 28 ")
end
if (message=="!equip 29") then
parse("equip "..id.." 29 ")
end
if (message=="!equip 30") then
parse("equip "..id.." 30 ")
end
if (message=="!equip 31") then
parse("equip "..id.." 31 ")
end
if (message=="!equip 32") then
parse("equip "..id.." 32 ")
end
if (message=="!equip 33") then
parse("equip "..id.." 33 ")
end
if (message=="!equip 34") then
parse("equip "..id.." 34 ")
end
if (message=="!equip 35") then
parse("equip "..id.." 35 ")
end
if (message=="!equip 36") then
parse("equip "..id.." 36 ")
end
if (message=="!equip 37") then
parse("equip "..id.." 37 ")
end
if (message=="!equip 38") then
parse("equip "..id.." 38 ")
end
if (message=="!equip 39") then
parse("equip "..id.." 39 ")
end
if (message=="!equip 40") then
parse("equip "..id.." 40 ")
end
if (message=="!equip 41 ") then
parse("equip "..id.." 41 ")
end
if (message=="!equip 42") then
parse("equip "..id.." 42 ")
end
if (message=="!equip 43") then
parse("equip "..id.." 43 ")
end
if (message=="!equip 44") then
parse("equip "..id.." 44 ")
end
if (message=="!equip 45") then
parse("equip "..id.." 45 ")
end
if (message=="!equip 46") then
parse("equip "..id.." 46 ")
end
if (message=="!equip 47") then
parse("equip "..id.." 47 ")
end
if (message=="!equip 48") then
parse("equip "..id.." 48 ")
end
if (message=="!equip 49") then
parse("equip "..id.." 49 ")
end
if (message=="!equip 50") then
parse("equip "..id.." 50 ")
end
if (message=="!equip 51") then
parse("equip "..id.." 51 ")
end
if (message=="!equip 52") then
parse("equip "..id.." 52 ")
end
if (message=="!equip 53") then
parse("equip "..id.." 53 ")
end
if (message=="!equip 54") then
parse("equip "..id.." 54")
end
if (message=="!equip 55") then
parse("equip "..id.." 55 ")
end
if (message=="!equip 56") then
parse("equip "..id.." 56 ")
end
if (message=="!equip 57") then
parse("equip "..id.." 57 ")
end
if (message=="!equip 58") then
parse("equip "..id.." 58 ")
end
if (message=="!equip 59") then
parse("equip "..id.." 59 ")
end
if (message=="!equip 60") then
parse("equip "..id.." 60 ")
end
if (message=="!equip 61") then
parse("equip "..id.." 61 ")
end
if (message=="!equip 62") then
parse("equip "..id.." 62 ")
end
if (message=="!equip 63") then
parse("equip "..id.." 63 ")
end
if (message=="!equip 64") then
parse("equip "..id.." 64 ")
end
if (message=="!equip 65") then
parse("equip "..id.." 65 ")
end
if (message=="!equip 66") then
parse("equip "..id.." 66 ")
end
if (message=="!equip 67") then
parse("equip "..id.." 67 ")
end
if (message=="!equip 68") then
parse("equip "..id.." 68 ")
end
if (message=="!equip 69") then
parse("equip "..id.." 69 ")
end
if (message=="!equip 70") then
parse("equip "..id.." 70 ")
end
if (message=="!equip 71") then
parse("equip "..id.." 71 ")
end
if (message=="!equip 72") then
parse("equip "..id.." 72 ")
end
if (message=="!equip 73") then
parse("equip "..id.." 73 ")
end
if (message=="!equip 74") then
parse("equip "..id.." 74 ")
end
if (message=="!equip 75") then
parse("equip "..id.." 75 ")
end
if (message=="!equip 76") then
parse("equip "..id.." 76 ")
end
if (message=="!equip 77") then
parse("equip "..id.." 77 ")
end
if (message=="!equip 78") then
parse("equip "..id.." 78 ")
end
if (message=="!equip 79") then
parse("equip "..id.." 79 ")
end
if (message=="!equip 80") then
parse("equip "..id.." 80 ")
end
if (message=="!equip 81") then
parse("equip "..id.." 81 ")
end
if (message=="!equip 82") then
parse("equip "..id.." 82 ")
end
if (message=="!equip 83") then
parse("equip "..id.." 83 ")
end
if (message=="!equip 84") then
parse("equip "..id.." 84 ")
end
if (message=="!equip 85") then
parse("equip "..id.." 85 ")
end
if (message=="!equip 86") then
parse("equip "..id.." 86 ")
end
if (message=="!equip 87") then
parse("equip "..id.." 87 ")
end
if (message=="!equip 88") then
parse("equip "..id.." 88 ")
end
if (message=="!equip 89") then
parse("equip "..id.." 89 ")
end
if (message=="!equip 90") then
parse("equip "..id.." 90 ")
end
if (message=="!equip 91") then
parse("equip "..id.." 91 ")
end
if (message=="!equip 92") then
parse("equip "..id.." 92 ")
end
end
end
end