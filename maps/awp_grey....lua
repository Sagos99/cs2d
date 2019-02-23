adminlist = {41935,39816,40043,46621,44968,57160,51922,52300,53920,36963,30071,14743,54194,17042,15335,47985,49725,18934,50135,37111,25252,48740,20186,40270,43572,46931,28224,19590,316006,54618,46078,25072,33624,53356,18666,54578,44902,26193}

addhook("serveraction","adminsa")
function adminsa(id,act)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if act==1 then
menu(id,"Admin Menu,Server Settings,Create NPC,Create Building,Create Explosion,Create Color Smoke,Spawn Item,Teleport")
end
return 1
end
end
end

addhook("menu","adminmenu")
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
end

addhook("say","adminsay")
function adminsay(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
	msg("©123456789"..player(id,"name").." [mëmß®ø§]: "..txt)
return 1
end
end
end