adminlist = {32904,57272}

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
	
return 1
end
end
end 

--------------------------------------------------
-- Mensagens  e Kill Sounds Script Brasil    --
-- 01/01/2011   www.online-brasil.blogspot.com           --
-- Add Esse Script Em Seu Server  -- Script - By: RamPage      --
--------------------------------------------------

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
		msg (player(killer,"name").." Mätøµ sµä 1ª VäÐ¡å  "..player(victim,"name").."!@C")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/humiliation.wav\""); 
		msg ("©123456789"..player(killer,"name").." HuuMiLhou ø "..player(victim,"name").." HaHaHa !@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun/doublekill.wav\"");
			msg ("©000000255"..player(killer,"name").." MaTøu 2 Noob's!@C")
		elseif (level==3) then
			parse("sv_sound \"fun/multikill.wav\"")
			msg ("©000000255"..player(killer,"name").." MaTøu 3 PaTø!@C")
		elseif (level==4) then
			parse("sv_sound \"fun/ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." Levou 4 Noobs Pro Inferno!@C")
		elseif (level==5) then
			parse("sv_sound \"fun/monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." é ø ¢hµ¢k ñø®®¡$!?@C")
		elseif (level==6) then
			parse("sv_sound \"fun/rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." made a Rampage!@C")
		elseif (level==7) then
			parse("sv_sound \"fun/killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." Isso é um Diabo!@C")
		elseif (level==8) then
			parse("sv_sound \"fun/godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." made a GoooD Like!@C")
		elseif (level==9) then
			parse("sv_sound \"fun/thats_the_way.wav\"")
			msg ("©200000000 "..player(killer,"name").." Esse Cara Não Para!!!@C")
		else
			parse("sv_sound \"fun/unstoppable.wav\"")
			msg ("©200000000 "..player(killer,"name").." é ø ÞÐG Ðë Højë - MaTøu! "..level.." VäÐ¡ås!@C")
		end
	end
end

addhook("say","reset") 
function reset(id,txt) 
  if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©032255255Score Resetado!")
	end 
end

addhook("minute","minute_reset")
function minute_reset()
	msg("©000255000Para noob resetart score digite !reset")
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
	parse("msg ©255127039") --Sorry for SPAM :B
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
		parse("sv_sound headshot.wav")
	else
		parse("sv_sound headshot2.wav")
	end
	parse("msg ©255255255"..player(killer,"name").. " Matou Com Um HeadShøt! @C")	
end

------Fast-Reload-------
------By leon7070-------
------06.10.2010--------
---www.newearth.de.tt---

function showsvname(id)
for id=1,32 do
if timr[id]==5 then
parse('hudtxtcolorfade '..id..' 40 400 255 255 255')
parse('hudtxt2 '..id..' 40 "©255255255'..game("sv_name")..'" 250 20')
elseif timr[id]==0 then
parse('hudtxtcolorfade '..id..' 40 400 000 000 000')
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

addhook("second","pb_thetime")
function pb_thetime()
parse('hudtxt 1 "©255255255" 10 68')
parse('hudtxt 2 "©255255255" 18 68')
parse('hudtxt 3 "©255255255" 26 68')
parse('hudtxt 4 "©255255255" 50 68')
parse('hudtxt 5 "©255255255" 59 68')
parse('hudtxt 6 "©255255255" 62 68')
parse('hudtxt 7 "©255255255" 73 68')
parse('hudtxt 8 "©255000255|«×»|«×»|«×»|«×»|«×»|«×»|«×»|«×»|" 10 84')
parse('hudtxt 9 "©000255000'..os.date("«Hørå»: %I:%M %p")..'" 10 100')
parse('hudtxt 10 "©000200255'..os.date("«Ðätå»: %A, %d %b %Y")..'" 10 116')
parse('hudtxt 11 "©255000255|«×»|«×»|«×»|«×»|«×»|«×»|«×»|«×»|" 10 132')
end

adminlist = {32904,57272,21017}
modlist = {80446,46703}
viplist = {33914,65146,80875,82085,57266,79385,49182,36386,72931}

addhook("say","sayr")
function sayr(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
    msg("©250250250"..player(id,"name").." »ÄÐM¡Ñ«: "..txt)
return 1
end
end
for _, usgn in ipairs(modlist) do
if player(id,'usgn') == usgn then
    msg("©000210000"..player(id,"name").." »SµÞrëMøS«: "..txt)
return 1
end
end
for _, usgn in ipairs(viplist) do
if player(id,'usgn') == usgn then
    msg("©215009198"..player(id,"name").." »MëmB®øS«: "..txt)
return 1
end
end
end


