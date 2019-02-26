

addhook("second","pb_thetime")
function pb_thetime()
if (time==1) then
	parse('hudtxt 0 "The time" 10 68')
	parse('hudtxt 1 "------------------------" 10 84')
	parse('hudtxt 2 "'..os.date("Time: %I:%M %p")..'" 10 100')
	parse('hudtxt 3 "'..os.date("Date: %A, %d %b %Y")..'" 10 116')
	parse('hudtxt 4 "---------Pr¡ñCë---------" 10 132')
else
	if (time==0) then
		parse('hudtxt 0 "" 10 68')
		parse('hudtxt 1 "" 10 84')
		parse('hudtxt 2 "" 10 100')
		parse('hudtxt 3 "" 10 116')
		parse('hudtxt 4 "" 10 132')
		end
	end
end

admin = {80691}
siyah = {}
kirmizi = {}
yesil = {}
mavi = {}
acikmavi = {}
pembe = { 14561}
acikyesil = { 19125}
koyuyesil = { 75714}
koyumavi = {}
koyukirmizi = {}



addhook("say","resetci")
function resetci(id,txt)
if txt == "!rs" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Skorunuz Resetou @C")
return 1
end
if txt == "!resetscore" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Skorunuz Resetou @C")
return 1
end
if player(id,"usgn") == admin[id] then
if string.sub(txt, 1, 5) == "!spec" then
local adam = string.sub(txt, 7, 8)
parse("makespec "..adam)
return 1
elseif string.sub(txt, 1, 5) == "!kick" then
local adam = string.sub(txt, 7, 8)
parse("kick "..adam.." Admin Kickledi")
return 1
elseif string.sub(txt, 1, 4) == "!ban" then
local adam = string.sub(txt, 6, 7)
parse("banname "..adam)
return 1
elseif string.sub(txt, 1, 8) == "!restart" then
parse("restart")
return 1
elseif string.sub(txt, 1, 3) == "!ct" then
local adam = string.sub(txt, 5, 6)
parse("makect "..adam)
return 1
elseif string.sub(txt, 1, 2) == "!t" then
local adam = string.sub(txt, 4, 5)
parse("maket "..adam)
return 1
end
end
if player(id,"usgn") == admin[id] then
     msg("©255255255"..player(id,"name").." [Admin] : "..txt)
return 1
elseif player(id,"usgn") == siyah[id] then
     msg("©000000000"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == kirmizi[id] then
     msg("©255000000"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == yesil[id] then
     msg("©000255000"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == mavi[id] then
     msg("©000000255"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == acikmavi[id] then
     msg("©000255255"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == pembe[id] then
     msg("©255150150"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == acikyesil[id] then
     msg("©100255100"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == koyumavi[id] then
     msg("©000000155"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == koyukirmizi[id] then
     msg("©155000000"..player(id,"name")..": "..txt)
return 1
elseif player(id,"usgn") == koyuyesil[id] then
     msg("©000155000"..player(id,"name")..": "..txt)
return 1
end
end

--..:: PUBLIC SERVER ::.--

parse('hudtxt 5 "©158158158server do Pr¡ñCë" 322 13 1')

parse('mp_building_limit "dispenser" 99999')
parse('mp_building_limit "turret" 99999')
parse('mp_building_limit "supply" 99999')
parse('mp_building_limit "gate field" 99999')
parse('mp_building_limit "wall I" 99999')
parse('mp_building_limit "wall II" 99999')
parse('mp_building_limit "wall III" 99999')
parse('mp_building_limit "barbed wire" 99999')
parse('mp_building_limit "Barricade" 99999')
parse('mp_building_limit "teleporter exit" 1')
parse('mp_building_limit "teleporter entrance" 99999')

pb_words = {"hitler","fuck","bitch","cunt","ass","cyka","cy_ka","cyk@","noob","n00b","noo6","6l9","punk","hitler","asshole","butt","homosexua","idiot","cock","penis","jerk","vagina","fag","gay","jackass","lesbian","tits","wtf","fyck","4mo","l-o-x","lox","Jlox","gabno","gaBHo","raBho",">=(kill","lolka","JloJlka","qpura","fira","4ypko","chypka","4ypka","cocu","nudap","nudp","nudapac,"}


function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end

function string.split(t, b)
local cmd = {}
local match = "[^%s]+"
if type(b) == "string" then match = "[^"..b.."]+" end
for word in string.gmatch(t, match) do table.insert(cmd, word) end
return cmd
end

addhook("second","pb_thetime")
function pb_thetime()
if (time==1) then
	parse('hudtxt 0 "The time" 10 68')
	parse('hudtxt 1 "------------------------" 10 84')
	parse('hudtxt 2 "'..os.date("Time: %I:%M %p")..'" 10 100')
	parse('hudtxt 3 "'..os.date("Date: %A, %d %b %Y")..'" 10 116')
	parse('hudtxt 4 "---------Pr¡ñCë---------" 10 132')
else
	if (time==0) then
		parse('hudtxt 0 "" 10 68')
		parse('hudtxt 1 "" 10 84')
		parse('hudtxt 2 "" 10 100')
		parse('hudtxt 3 "" 10 116')
		parse('hudtxt 4 "" 10 132')
		end
	end
end

addhook("say","sayfuncs")
function sayfuncs(p,txt)
    if (txt=="timeleft") then
        
        if _G["mtime1"]==nil then
            local tleft = game("mp_timelimit")
            msg("©000255000Time Left: "..tleft.." ")
        else
            local tsec = os.time() - _G["mtime1"]       
            msg("©000255000Time Left: "..tsec.." ")
        end         
    end
if (txt=="ff") then
if (game("sv_friendlyfire") == "1")then
msg2(p, "Friendly Fire is ON!")
end
if (game("sv_friendlyfire") == "0") then
msg2(p, "Friendly Fire is OFF!")
end
end
end



addhook("minute","pb_minute")
function pb_minute()
	msg("©255255255Boa Morte A Todos!!!")
	msg("©240000240script criado por Pr¡ñCë Of PërS¡ä ")
	parse("sv_sound \"public/min.wav\"")
end

addhook("say","pb_say")
function pb_say(p,t)
	t=string.lower(t)
	for i = 1,#pb_words do
		if (string.find(t,pb_words[i])~=nil) then
			msg(player(p,"name").." has ban slayed!")
			msg(player(p,"name").." said a bad word!")
			parse("sv_sound \"public/bad.wav\"")
			parse("kill "..p)
			break
		end
	end
end

addhook("say","say_pos")
function say_pos(id,txt)
	if (txt=="!pos") then
	msg2(id,"©000255000TileX:"..player(id,"tilex").." TileY:"..player(id,"tiley").."@C")
	msg2(id,"©000255000X:"..player(id,"x").."    Y:"..player(id,"y").."@C")
	end
end

addhook("parse","commands")
function commands(cmd,text)
  if (cmd=="thetime 1") then
     time = 1
     print("©000255000THE TIME {ON}!")
	else
  if (cmd=="thetime 0") then
     time = 0
     print("©000255000THE TIME {OFF}!")
 end
 end
end

addhook("team","pb_team")
function pb_team(id,team)
pb_tmh[id]=team
end

addhook("startround","pb_startround")
function pb_startround()
local i
for i=1,32 do
twin=game("winrow_t")
ctwin=game("winrow_ct")
if ctwin>0 then
if pb_tmh[i]==1 then parse("sv_sound2 "..i.." \"EIC/eic_lose_rnd2.wav\"");end
if pb_tmh[i]==2 then parse("sv_sound2 "..i.." \"EIC/eic_win_rnd.wav\"");end
end
if twin>0 then
if pb_tmh[i]==2 then parse("sv_sound2 "..i.." \"EIC/eic_lose_rnd.wav\"");end
if pb_tmh[i]==1 then parse("sv_sound2 "..i.." \"EIC/eic_win_rnd2.wav\"");end
end
end
end

function pb_startround()
parse("sv_sound \"public/prepare.wav\"")
pb_fblood=0
end

addhook("leave","pb_leave")
function pb_leave(id,reason)
	if not player(id,"bot") then
		msg("©255255255Notice: "..player(id,"name").." has left the game!")
		if reason==0 then 
		end
	end
end

pb_timer=initArray(32)
pb_level=initArray(32)
pb_tmh=initArray(32)
pb_fblood=0

addhook("kill","pb_kill")
function pb_kill(killer,victim,weapon)
	if (os.clock()-pb_timer[killer])>30 then
		pb_level[killer]=0;
	end
	level=pb_level[killer]
	level=level+1
	pb_level[killer]=level
	pb_timer[killer]=os.clock()
	if (pb_fblood==0) then
		pb_fblood=1
		parse("sv_sound \"public/firstblood.wav\"");
		msg ("©255255255"..player(killer,"name").." sheds FIRST BLOOD by killing "..player(victim,"name").."!@C")
	end
	if (weapon==51) then
		parse("sv_sound \"public/nade.wav\""); 
		msg ("©255255255"..player(killer,"name").." NADE "..player(victim,"name").."!@C")
	end
	if (weapon==50) then
		parse("sv_sound \"public/knife.wav\""); 
		msg ("©255255255"..player(killer,"name").." HUMILIATED "..player(victim,"name").."!@C")
	else
		if (level==1) then

		elseif (level==2) then
			parse("sv_sound \"public/doublekill.wav\"");
			msg ("©255255255"..player(killer,"name").." made a Doublekill!@C")
		elseif (level==3) then
			parse("sv_sound \"public/triplekill.wav\"")
			msg ("©255255255"..player(killer,"name").." made a Triplekill!@C")
		elseif (level==4) then
			parse("sv_sound \"public/multikill.wav\"")
			msg ("©255255255"..player(killer,"name").." made an MULTIKILL!@C")
		elseif (level==5) then
			parse("sv_sound \"public/ultrakill.wav\"")
			msg ("©255255255"..player(killer,"name").." made a ULTRAKILL!@C")
		elseif (level==6) then
			parse("sv_sound \"public/monsterkill.wav\"")
			msg ("©255255255"..player(killer,"name").." made a MO-O-O-O-ONSTERKILL-ILL-ILL!@C")
		elseif (level==7) then
			parse("sv_sound \"public/unstoppable.wav\"")
			msg ("©255255255"..player(killer,"name").." made a UNSTOPPABLE!@C")
		else
			parse("sv_sound \"public/godlike.wav\"")
			msg ("©175174173"..player(killer,"name").." is GODLIKE! "..level.." KILLS!@C")
		end
	end
end




addhook("startround","imgstart")
function imgstart(start)
image("gfx/cs2dclanssmk2.png",300,75,3,0)
end


addhook("join","thejoin")
function thejoin(id)
          msg("©150130255"..player(id,"name").." Entrou No Server!")
     end