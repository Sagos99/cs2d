modlist = {74155}

addhook("serveraction","modsa")
function modsa(id,act)
for _, usgn in ipairs(modlist) do
if player(id,'usgn') == usgn then
if act==1 then
menu(id,"Mod Menu,Server  Settings,Create  Buildings,Explosion,Create  Color  Smoke")
end
return 1
end
end
end

addhook("menu","modmenu")
function modmenu(id,title,buton)
if title=="Mod Menu" then
if buton==1 then
menu(id,"Server  Settings,Infammo on/off,Autoteambalance on/off,Fog Of War on/off,Antispeeder on/off,Deathdrop on/off,FriendlyFire on/off,Game Mode,Back")
elseif buton==3 then
menu(id,"Create  Buildings,Turret,Dispenser,Supply,Gate Field,Barbed Wire,Wall I,Wall II,Wall III,Back")
elseif buton==4 then
menu(id,"Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Back")
elseif buton==5 then
menu(id,"Create  Color  Smoke,Red,Green,Blue,Yellow,White,Black,Grey,Orange,Back")
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
menu(id,"Mod Menu,Server  Settings,Create  Buildings,Explosion,Create  Color  Smoke")
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
menu(id,"Mod Menu,Server  Settings,Create  Buildings,Explosion,Create  Color  Smoke")
end
end
if title=="Explosion" then
if buton==1 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 25 25 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Back")
elseif buton==2 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 50 50 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Back")
elseif buton==3 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 100 100 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Back")
elseif buton==4 then
parse('explosion '..player(id,"x")..' '..player(id,"y")..' 250 250 '..id)
menu(id,"Create Explosion,Very Small Explosion,Small Explosion,Normal Explosion,High Explosion,Back")
elseif buton==5 then
menu(id,"Mod Menu,Server  Settings,Create  Buildings,Explosion,Create  Color  Smoke")
end
end