print("Carregando hooks")
addhook("say","clanSay")
addhook("say","clan_direitos")
addhook("say", "direitos")
addhook("join","svjoin")
addhook("serveraction","adminsa")
addhook("menu","adminmenu")
addhook("ms100","placar")
addhook("menu", "plmenu")
addhook("serveraction", "playersvact")
addhook("minute","resetminute")
addhook("menu", "menuskin")
addhook("say","knf_mode")
addhook("walkover","n_collect")
addhook("menu","menucf")
addhook("say","cfsay")




FUND = {89683,70204}
ADM = {}
MOD = {}
MBR = {}
-- //
cmbr="255255000"
cmod="255100000"
cadm="255000000"
cfund="150150150"
-- //
joinmsg = "off"			
resetsys = "on"			
placarsys = "off"
sayscript = "on"		
-- //
tagadm="AÐM"
tagmod="MØÐ"
tagmbr="MßR"
tagfund="FUNÐ"
-- //
clanname="Lacostee"
scriptname="Nada a declarar"







function funFund(id)
	for _, usgn in ipairs(FUND) do
	if player(id,'usgn') == usgn then
	return true
	end
	end
	return false
end

function funAdm(id)
	for _, usgn in ipairs(ADM) do
	if player(id,'usgn') == usgn then
	return true
	end
	end
	return false
end
function funMod(id)
	for _, usgn in ipairs(MOD) do
	if player(id,'usgn') == usgn then
	return true
	end
	end
	return false
end
function funMbr(id)
	for _, usgn in ipairs(MBR) do
	if player(id,'usgn') == usgn then
	return true
	end
	end
	return false
end


addhook("say","usgnSay")
function usgnSay(id,txt)
     if string.sub(txt,1,5) == "!usgn" then
          local p = tonumber(string.sub(txt,7))
          if p and player(p,"exists") then
               msg2(id,player(p,"name").."'s USGN is "..player(p,"usgn"))
          end
          return 1
     end
end


function clanSay(id,txt)
if sayscript=="on" then
  if funFund(id) then
	msg("©"..cfund.." .:: "..player(id,"name").." ::. "..txt)
	return 1
	end
  if funAdm(id) then
	msg("©"..cadm.." ~ [ "..player(id,"name").." ] ~ "..txt)
	return 1
	end
  if funMod(id) then
	msg("©"..cmod.." » "..player(id,"name").." « "..txt)
	return 1
	end
  if funMbr(id) then
	msg("©"..cmbr.." > "..player(id,"name").." < "..txt)
	return 1
	end
end
end



function clan_direitos(id,txt)
	if funMod(id) or funAdm(id) or funFund(id) then
	if (txt=="@allspec") or (txt=="@as") then
	for todos = 1,32 do
	parse("makespec "..todos)
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) or funMbr(id) then
	if (txt=="@rr") or (txt=="@RR") then
	parse("restart")
	end
	end
end


	function direitos(id, txt)
	if funMod(id) or funAdm(id) or funFund(id) or funMbr(id) then
	if txt:lower():sub(1, 5) == "@kick" then
	local numid = tonumber(txt:sub(6))
	if player(numid, "exists") then
	parse("kick " .. numid)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 3) == "@mt" then
	local pl1 = tonumber(txt:sub(4))
	if player(pl1, "exists") then
	parse("maket " .. pl1)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 4) == "@mct" then
	local pl2 = tonumber(txt:sub(5))
	if player(pl2, "exists") then
	parse("makect " .. pl2)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 3) == "@ms" then
	local pl3 = tonumber(txt:sub(4))
	if player(pl3, "exists") then
	parse("makespec " .. pl3)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funMbr(id) or funFund(id) then
	if txt:lower():sub(1, 5) == "@kill" then
	local killid = tonumber(txt:sub(6))
	if player(killid, "exists") then
	parse("killplayer " .. killid)
	return 1
	end
	end
	end	
	end


	
	
	function svjoin(id)
	if joinmsg=="on" then
	parse("sv_msg2 "..id.." ©255159241Bem-Vindo ao servidor do clã "..clanname)
	parse("sv_msg2 "..id.." ©©255159241Este servidor usa o script "..scriptname)
	end
	end





function adminsa(id,act)
if funAdm(id) or funFund(id) then
if act==1 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport,Menu de Dano")
end
return 1
end
end
function adminmenu(id,title,buton)
if title=="Admin Menu" then
if buton==1 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
menu(id,"Create NPC,Zombie,Headcrap,Snark,Back")
elseif buton==3 then
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==4 then
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==5 then
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==6 then
menu(id,"Spawn Item,Pistols,Shotguns,SMGs,Rifles,Machine Gun,Armors,Grenades,Others,Back")
elseif buton==7 then
menu(id,"Teleport Menu,Up,Down,Right,Left,Back")
elseif buton==8 then
menu(id,"Menu de Dano,Padrão, One Hit!")
end
end
if title=="Server Settings" then
if buton==1 then
menu(id,"Infammo,On,Off,Back")
elseif buton==2 then
menu(id,"Autoteambalance,On,Off,Back")
elseif buton==3 then
menu(id,"Fog Of War,On,Off,Back")
elseif buton==4 then
menu(id,"Antispeeder,On,Off,Back")
elseif buton==5 then
menu(id,"Deathdrop,On,Off,Back")
elseif buton==6 then
menu(id,"Friendlyfire,On,Off,Back")
elseif buton==7 then
menu(id,"Change Game Mode,Standart,Deathmatch,Team Deathmatch,Construction,Zombies,Back")
elseif buton==8 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,SpawnItem,Teleport")
end
end
if title=="Create NPC" then
if buton==1 then
parse('spawnnpc 1 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 180')
menu(id,"Create NPC,Zombie,Headcrap,Snark,Back")
elseif buton==2 then
parse('spawnnpc 2 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 180')
menu(id,"Create NPC,Zombie,Headcrap,Snark,Back")
elseif buton==3 then
parse('spawnnpc 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 180')
menu(id,"Create NPC,Zombie,Headcrap,Snark,Back")
elseif buton==4 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
end
if title=="Create Building" then
if buton==1 then
parse('spawnobject 8 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==2 then
parse('spawnobject 7 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==3 then
parse('spawnobject 9 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==4 then
parse('spawnobject 6 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==5 then
parse('spawnobject 2 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==6 then
parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==7 then
parse('spawnobject 4 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==8 then
parse('spawnobject 5 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
menu(id,"Create Building,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
end
if title=="Create Color Smoke" then
if buton==1 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 255 000 000')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==2 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 000 255 000')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==3 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 000 000 255')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==4 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 255 255 000')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==5 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 255 255 255')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==6 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 000 000 000')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==7 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 128 128 128')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==8 then
parse('effect "colorsmoke" '..player(id,"x")..' '..player(id,"y")..' 1 1 255 076 000')
menu(id,"Create Color Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
elseif buton==9 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
end
if title=="Infammo" then
if buton==1 then
parse('mp_infammo 1')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
parse('mp_infammo 0')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Autoteambalance" then
if buton==1 then
parse('mp_autoteambalance 1')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
parse('mp_autoteambalance 0')
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Fog Of War" then
if buton==1 then
parse('sv_fow 1')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
parse('sv_fow 0')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Antispeeder" then
if buton==1 then
parse('mp_antispeeder 1')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
parse('mp_antispeeder 0')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Deathdrop" then
if buton==1 then
parse('mp_deathdrop 0')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
parse('mp_deathdrop 4')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Friendlyfire" then
if buton==1 then
parse('sv_friendlyfire 1')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==2 then
parse('sv_friendlyfire 0')
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Server Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
end
end
if title=="Change Game Mode" then
if buton==1 then
parse('sv_gm 0')
elseif buton==2 then
parse('sv_gm 1')
elseif buton==3 then
parse('sv_gm 2')
elseif buton==4 then
parse('sv_gm 3')
elseif buton==5 then
parse('sv_gm 4')
elseif buton==6 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
end
if title=="Create Explosion" then
if buton==1 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 25 25 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==2 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 50 50 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==3 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 100 100 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==4 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 250 250 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==5 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 750 750 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Very High Explosion,Back")
elseif buton==6 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
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
if title=="Menu de Dano" then
if buton==1 then
	parse("mp_damagefactor 1.0")
	msg("©255255000Fator de dano [Damage Factor] 1.0 Padrão@C")
elseif buton==2 then
	parse("mp_damagefactor 10.0")
	msg("©255255000Fator de dano [Damage Factor] One Hit!@C")
end
end
end


cp2 = 0
cp = "K'Awp"
ca = "~ Le clã ~"
ca2 = 0
fora = 0
casa = 0
function placar(id)
if (placarsys=="on") then
     parse("hudtxt 1 \"©255000000"..ca..": "..fora.."\"  10 416")
     parse("hudtxt 2 \"©000000255"..cp..": "..casa.."\" 10 400")
end
end

min = 0
addhook("minute","res")
function res()
if (placarsys=="on") then
     min = min + 1
     end
end

addhook("ms100","ns")
function ns()
if (placarsys=="on") then
parse("hudtxt 3 \"©000255000Tempo: "..min.." Minuto(s)\" 250 416")
end
end

addhook("say","min_r")
function min_r(id,txt)
if txt=="!min reset" then
min = 0
end
end



function resetminute(id,txt)
if resetsys=="on" then
msg("©000255000Use o menu do jogador [F3] para Reset Score!")
end
end
function playersvact(id,act)
if resetsys=="on" then
if act==2 then
if funFund(id) then
menu(id, "wallkers2d» Player Menu,ResetScore|Yes!,Contato|Yes!,wallkers2d» Skins|>,CF Manager|>,wallkers2d» Tag Color|>,Status|+")
elseif funMod(id) or funAdm(id) or funMbr(id) then
menu(id, "wallkers2d» Player Menu,ResetScore |Yes!, Contato | Yes!,wallkers2d» Skins,(Somente ADM),(Somente ADM),(Somente ADM)")
else
menu(id, "wallkers2d» Player Menu,ResetScore | Yes!,Contato | Yes!,(Somente p/ Clã),(Somente p/ Clã),(Somente p/ Clã),(Somente p/ Clã)")
end
end
end
end

function plmenu(id, title, but)
if (title=="wallkers2d» Player Menu") then
if(but==1) then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©255255255SERVIDOR: Pontuação resetada.")
end
if(but==2) then
parse ("sv_msg2 "..id.." ©250095127E-Mail p/ contato: alessandrowwe@hotmail.com")
end
if(but==3) then
if funFund(id) or funMod(id) or funAdm(id) or funMbr(id) then
menu(id, "wallkers2d» Skins, Sonic | Yes!, Angel | Yes!, Devil | Yes!, Yoshi | Yes!, Wolf | Yes!, Pirate Hat | Yes!, Toad | Yes!, sZ» | Yes!,Nenhum")
end
end
if(but==4) then
if funFund(id) then
if placarsys=="on" then
menu(id, "ClanFight,(Placar ON),Clã 1,Clã 2,Resultado,Placar OFF")
else
menu(id, "ClanFight,Placar ON,(Clã 1),(Clã 2),(Resultado),(Placar OFF)")
end
end
end
if(but==5) then
if funFund(id) then
menu(id, "coL.^» Tag Color,"..tagfund..","..tagadm..","..tagmod..","..tagmbr.."")
end
end
if(but==6) then
if funFund(id) then
statusB = 1
msg2(id,"©255255255Digite o status")
end
end
end
end



addhook("reload","fastreload")
function fastreload(id,mode)
if funFund(id) or funAdm(id) or funMod(id) or funMbr(id) then
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end
end


tc1 = 0
tc2 = 0
tc3 = 0
tc4 = 0

addhook("menu","tagcm")
function tagcm(id, title, but)
if (title=="sZ» Tag Color") then
if(but==1)then
if tc1==0 then
tc1 = 1
msg2(id,"©255000000Digite o código da tag "..tagfund)
end
end
if(but==2)then
if tc2==0 then
tc2 = 1
msg2(id,"©255000000Digite o código da tag "..tagadm)
end
end
if(but==3)then
if tc3==0 then
tc3 = 1
msg2(id,"©255000000Digite o código da tag "..tagmod)
end
end
if(but==4)then
if tc4==0 then
tc4 = 1
msg2(id,"©255000000Digite o código da tag "..tagmbr)
end
end
end
end


addhook("say","ftc1")
function ftc1(id,txt)
if funFund(id) then
if tc1 == 1 then
cfund = (""..txt)
msg2(id,"©255255255Cor salva!")
tc1 = 0
return 1
end
end
end

addhook("say","ftc2")
function ftc2(id,txt)
if funFund(id) then
if tc2 == 1 then
cadm = (""..txt)
msg2(id,"©255255255Cor salva!")
tc2 = 0
return 1
end
end
end

addhook("say","ftc3")
function ftc3(id,txt)
if funFund(id) then
if tc3 == 1 then
cmod = (""..txt)
msg2(id,"©255255255Cor salva!")
tc3 = 0
return 1
end
end
end

addhook("say","ftc4")
function ftc4(id,txt)
if funFund(id) then
if tc4 == 1 then
cmbr = (""..txt)
msg2(id,"©255255255Cor salva!")
tc4 = 0
return 1
end
end
end








function menucf(id, title, but)
if (title=="ClanFight") then
if(but==1)then
placarsys = "on"
end
if(but==2) then
if cp2 == 0 then
cp2 = 1
msg2(id,"©255000000Digite o nome do clã 1.")
end
end
if(but==3) then
if ca2 == 0 then
ca2 = 1
msg2(id,"©255000000Digite o nome do clã 2.")
end
end
if(but==4) then
msg("©255051000ClanFight/X1: "..cp.." »   ["..casa.."] × ["..fora.."]   « "..ca.."@C")
end
if(but==5) then
parse('hudtxtalphafade 0 1 5000 0.0')
parse('hudtxtalphafade 0 2 5000 0.0')
parse('hudtxtalphafade 0 3 5000 0.0')
placarsys = "off"
end
end
end


function cfsay(id,txt)
if funFund(id) then
if ca2 == 1 then
ca = (""..txt)
msg2(id,"©255255255Nome do clã 2 salvo!")
ca2 = 0
return 1
end
end
end

addhook("say","cfsay2")
function cfsay2(id,txt)
if funFund(id) then
if cp2 == 1 then
cp = (""..txt)
msg2(id,"©255255255Nome do clã 2 salvo!")
cp2 = 0
return 1
end
end
end




addhook("serveraction","psva")
function psva(id,act)
if placarsys=="on" then
if act==3 then
if funFund(id) then
menu(id, "sZ» Placar,+"..cp..",+"..ca..",-"..cp..",-"..ca..",Zerar Placar|0x0,Salvar CF|+")
end
end
end
end

addhook("menu","f2000")
function f2000(id, title, but)
if (title=="sZ» Placar") then
if(but==1) then
casa = casa+1
end
if(but==2) then
fora = fora+1
end
if(but==3) then
casa = casa-1
end
if(but==4) then
fora = fora-1
end
if(but==5) then
casa = 0
fora = 0
end
if(but==6) then
SScore = io.open("ClanDados.txt", "a")
SScore:write("\nClanFight/X1: "..cp.." ("..casa..") Vs. "..ca.." ("..fora..")")
SScore:close()
end
end
end




function menuskin(id, title, but)
if (title=="sZ» Skins") then
if(but==1) then
	freeimage(id)
	id=image("gfx/skins menu/sonic.png",1,1,200+id)
end
if(but==2) then
	freeimage(id)
	id=image("gfx/skins menu/angel.png",1,1,200+id)
end
if(but==3) then
	freeimage(id)
	id=image("gfx/skins menu/devil.png",1,1,200+id)
end
if(but==4) then
	freeimage(id)
	id=image("gfx/skins menu/yoshi.png",1,1,200+id)		
end
if(but==5) then 
	freeimage(id)
	id=image("gfx/skins menu/wolf.png",1,1,200+id)
end
if(but==6) then
	freeimage(id)
	id=image("gfx/skins menu/pirate_hat.png",1,1,200+id)
end
if(but==7) then
	freeimage(id)
	id=image("gfx/skins menu/toad.png",1,1,200+id)
end
if(but==8) then
	freeimage(id)
	id=image("gfx/skins menu/smoker zone.png",1,1,200+id)
	imagealpha(id,0.9)
	imagepos(id,0,0,0)
	imageblend(id,1)
end
if(but==9) then
	freeimage(id)
end
end
end



KNFmode = 0
function knf_mode(id,txt)
if funFund(id) or funAdm(id) then
if txt == "!knife mode on" then
if KNFmode == 0 then
KNFmode = 1
for noawp = 1,32 do
parse("strip "..noawp.." 35")
msg("©255255255Knife Mode: Ativado@C")
return 1
end
end
end
end

if funFund(id) or funAdm(id) then
if txt == "!knife mode off" then
if KNFmode == 1 then
KNFmode = 0
msg("©255255255Knife Mode: Desativado@C")
return 1
end
end
end
end
function n_collect(id,iid,type,ain,a,mode)
if KNFmode == 0 then
return 0
end
if KNFmode == 1 then
if type == 35 then
return 1
end
end
end


addhook("join","contajoin")
function contajoin(id)
if funFund(id) then
msg2(id,"©255255255 Sua conta está definida como: Fundador")
elseif funAdm(id) then
msg2(id,"©255255255 Sua conta está definida como: Administrador")
elseif funMod(id) then
msg2(id,"©255255255 Sua conta está definida como: Moderador")
elseif funMbr(id) then
msg2(id,"©255255255 Sua conta está definida como: Membro")
else
msg2(id,"©255255255 Sua conta está definida como: Visitante")
end
end

print("Script fucionando com sucesso")



addhook("kill","_kill")
function _kill(killer,victim,weapon,x,y)     
     if math.abs(player(killer,"x")-x)>320 or math.abs(player(killer,"y")-y)>240 then
          msg("©230230230 "..player(killer,"name").." Filho da puta só da Pesked?!@C")
     end
end

secs = 0
addhook("second","autotext")
function autotext()
     secs = secs + 1
     if secs >= 180 then
          msg("©255255255Servidor: Vai tudo tomar no cu!")
          secs = 0
     end
end

parse("sv_password")

svpw = 0
addhook("say","pwsay")
function pwsay(id,txt)
if funFund(id) or funAdm(id) then
		if txt=="@pw on" then
		if svpw==0 then
	parse("sv_password 951")
	msg("©255159241 Senha do servidor configurada.@C")
	svpw = 1
	elseif svpw==1 then
	msg2(id,"©255000000 Servidor já está com senha, use '@pw off' para desativar@C")
		end
		end

		if txt=="@pw off" then
		if svpw==1 then
	parse("sv_password")
	msg("©255159241 Servidor Aberto ao público.@C")
	svpw = 0
	elseif svpw==0 then
	msg2(id,"©255000000 Servidor não está com senha, use '@pw on' para ativar@C")
		end
		end
end
end

addhook("say","svrestart")
function svrestart(id,txt)
if funFund(id) then
if txt=="@sv rr" then
parse("map awp_grey")
end
end
end


addhook("say","sayscriptstate")
function sayscriptstate(id,txt)
if funFund(id) then
	if txt=="@say off" then
		if sayscript=="on" then
		sayscript = "off"
		elseif sayscript=="off" then
		msg2(id,"©255255255Say Script já está desativado.@C")
		end
		end
	if txt=="@say on" then
		if sayscript=="off" then
		sayscript = "on"
		elseif sayscript=="on" then
		msg2(id,"©255255255Say Script já está ativado.@C")
		end
		end
end
end


statusB=0
addhook("say","d_status")
function d_status(id,txt)
if funFund(id) then
if statusB==1 then
svstatus = (""..txt)
msg2(id,"©255255255Sucesso!")
statusB = 0
return 1
end
end
end


svstatus = "Oficial"
addhook("second","Lsvname")
function Lsvname(id)
parse("hudtxt 16 \"©255128128Sistema de Clãs v3\" 320 10 1")
parse("hudtxt 15 \"©255255255 K'Awp :: "..svstatus.."\" 320 26 1")
end

adminList = {29309}

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
          msg("©000000255Dono "..player(id,"name").." ON! @C")
     end
end

--23/12/2010, [NBK]NaSH (N-B-K @ US.de), Argentina
pival = math.pi / 180
extraarmored = 12
extranoarmored = 25

addhook("hit","onhit")
addhook("startround","onstartround")

function correctrot(angle)
	if (angle>90 and angle<=180) then
		return angle - 270
	 else
		return angle + 90
	end
end
function toradians(angle)
	return pival*angle
end
function calcdis(a,b)
	local ax = player(a,"tilex")
	local ay = player(a,"tiley")
	local bx = player(b,"tilex")
	local by = player(b,"tiley")
	return math.floor(math.sqrt((bx-ax)^2 + (by-ay)^2))
end
function onhit(id,source,weapon,hpdmg,apdmg)
	local accuracy1 = 0
	local accuracy2 = 0
	local difx = player(id,"x") - player(source,"x")
	local dify = player(id,"y") - player(source,"y")
	local goang = math.atan2(dify,difx)
	
	local ang = correctrot(player(source,"rot"))
	if ang>0 and ang<180 then
		ang = (180-ang)*(-1)
	 else
		ang = 180+ang
	end
	local r = toradians(ang)
	local distance = calcdis(id,source)
	if distance<=4 then
		accuracy1,accuracy2 = 0.0318,-0.0314 --0.0318,-0.0314
	 else
	if distance>4 and distance<=6 then
		accuracy1,accuracy2 = 0.009,-0.0089 --0.009,-0.0089
	 else
	if distance>6 then
		accuracy1,accuracy2 = 0.00899,-0.00878 --0.002,-0.0015
	end
	end
	end
	if r-goang<accuracy1 and r-goang>accuracy2 then
		local prevhealth = player(id,"health")
		local prevarmor = player(id,"armor")
		local extradmg = 0
		if prevarmor>=65 then
			extradmg = (hpdmg*extraarmored)/100
		 else
			extradmg = (hpdmg*extranoarmored)/100
		end
		if player(source,"weapontype")~=51 then
			if (prevhealth-hpdmg)>0 then
		 	 else
				hskill(id,source)
			    	   return 1
			end
			if (prevhealth-(extradmg+hpdmg))>0 then
				parse("sethealth "..id.." "..(prevhealth-(extradmg+hpdmg)))
				   return 1
		 	 else
				hskill(id,source)
			    	   return 1
			end
		end
	end
end
function onstartround()
	parse("msg ©255127039 ") --Sorry for SPAM :B
end


function hskill(victim,killer)
	parse("customkill "..killer.." (Head)"..itemtype(player(killer,"weapontype"),"name").." "..victim) --Try to don't delete this line

	--[[
	Here you could add an extra blood sprite or what you want!

	  An example:
	  parse("setscore "..killer.." "..player(killer,"score")+5)

	Thanks to Crawis for "headshot.wav" and "headshot2.wav"
	]]

	--You can delete this, or modificate it...
	local rndsound = math.random(1,2)
	if rndsound==1 then
		parse("sv_sound memories.ogg")
	else
		parse("sv_sound sex.ogg")
	end
	parse("msg ©078122049"..player(killer,"name").. " has done a Headshot kill! @C")	
end

--------------------------------------------------
-- Simple Badwords Filter by Unreal Software    --
-- 22.02.2009 - www.UnrealSoftware.de           --
--------------------------------------------------

if sample==nil then sample={} end
sample.badwords={}

--------------------------------------
-- BADWORDS TABLE (LOWERCASE)       --
--------------------------------------
sample.badwords.words = {"porra","poha","caralho","cú","puta","fdp","tnc","vsf"}


--------------------------------------
-- HANDLE BADWORDS IN SAY MESSAGES  --
--------------------------------------
addhook("say","sample.badwords.say")
function sample.badwords.say(p,t)
	t=string.lower(t)
	for i = 1,#sample.badwords.words do
		if (string.find(t,sample.badwords.words[i])~=nil) then
			msg(player(p,"name").." Boca suja da porra!!!")
			parse("kick "..p)
			break
		end
	end
end

--------------------------------------------------
-- Simple Advertising by Unreal Software        --
-- 22.02.2009 - www.UnrealSoftware.de           --
--------------------------------------------------

if sample==nil then sample={} end
sample.ads={}

--------------------------------------
-- WELCOME MESSAGE ON JOIN          --
--------------------------------------
addhook("join","sample.ads.join")
function sample.ads.join(p)
	msg2(p," "..player(p,"name").."Entrou no Server")
end


--------------------------------------
-- ADVERTISING EVERY MINUTE         --
--------------------------------------
addhook("minute","sample.ads.minute")
function sample.ads.minute()
	msg("")
	msg("")
end