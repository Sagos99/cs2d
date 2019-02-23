function initArray(m,v)
local array = {}
for i = 1, m do
array[i]=0
end
return array
end
function string.split(text,b)
local cmd = {}
if b then
b = b
else
b = "%s"
end
b = "[^"..b.."]+"
for o in string.gmatch(text,b) do
table.insert(cmd,o)
end
return cmd
end
function totable(t,match)
	local cmd = {}
	if not match then match = "[^%s]+" end
	for word in string.gmatch(t, match) do
		table.insert(cmd, word)
	end 
	return cmd 
end

rv_info = {}
rv_selfinfo = 1

function savedata(id,UsgnID)
	local UsgnID = player(id,"usgn")
	file = io.output(io.open("sys/lua/big/saves/"..UsgnID..".txt","w+"))
	local text = ""
	text = tostring(level[id])
	text = text .." "..exp[id]
	text = text .." "..point[id]
	text = text .." "..credits[id]
	text = text .." "..food[id]
	text = text .." "..blood_zombie[id]
	text = text .." "..blood_human[id]
	text = text .." "..treasure_chest[id]
	text = text .." "..skill1[id]
        text = text .." "..skill2[id]
	text = text .." "..skill3[id]
	text = text .." "..skill4[id]
	text = text .." "..wood[id]
	text = text .." "..stone[id]
        text = text .." "..energy[id]
		text = text .." "..fish_rod[id]
		text = text .." "..fish[id]
		text = text .." "..worms[id]
	file:write(text)
	file:close()
end
function load(id,UsgnID)
local UsgnID = player(id,"usgn")
local filename = "sys/lua/big/saves/%s.txt"
if UsgnID~=0 then
local file = io.open(filename:format(UsgnID,"r"))
if file then
	for line in file:lines() do
	local parses = totable(line)
	local w1=tonumber(parses[1])
	local w2=tonumber(parses[2])
	local w3=tonumber(parses[3])
	local w4=tonumber(parses[4])
	local w5=tonumber(parses[5])
	local w6=tonumber(parses[6])
	local w7=tonumber(parses[7])
	local w8=tonumber(parses[8])
	local w9=tonumber(parses[9])
	local w10=tonumber(parses[10])
	local w11=tonumber(parses[11])
	local w12=tonumber(parses[12])
	local w13=tonumber(parses[13])
        local w14=tonumber(parses[14])
		local w15=tonumber(parses[15])
		local w16=tonumber(parses[16])
	   local w17=tonumber(parses[17])
	   local w18=tonumber(parses[18])
	if w1~=nil then level[id]=w1 end
	if w2~=nil then exp[id]=w2 end
	if w3~=nil then point[id]=w3 end
	if w4~=nil then credits[id]=w4 end
	if w5~=nil then food[id]=w5 end
	if w6~=nil then blood_zombie[id]=w6 end
	if w7~=nil then blood_human[id]=w7 end
	if w8~=nil then treasure_chest[id]=w8 end
	if w9~=nil then skill1[id]=w9 end
	if w10~=nil then skill2[id]=w10 end
	if w11~=nil then skill3[id]=w11 end
	if w12~=nil then skill4[id]=w12 end
	if w13~=nil then wood[id]=w13 end
	if w14~=nil then stone[id]=w14 end
if w15~=nil then energy[id]=w15 end
if w16~=nil then fish_rod[id]=w16 end
if w17~=nil then fish[id]=w17 end
if w18~=nil then worms[id]=w18 end
	end
end
end
energy[id]=maxenergy[id]
end

function holdmelee(wpn)
	if (wpn == 50) or (wpn == 69) or (wpn == 74) or (wpn == 78) or (wpn == 85) then
		return true
	else
		return false
	end
end
------cores-------
putih = "©255255255"
hitam = "©000000000"
hijau = "©000555000"
hijau2 = "©0  128  0"
merah = "©255000000"
abu = "©191191191"
emas = "©255215000"
biru = "©30 144255"
biru2 = "©0  0  255"
coklat = "©15075   0"
ungu = "©191  0255"
kuning = "©255255  0"
nila = "©111  0255"
oren = "©255127  0"
ungu2 = "©128  0128"
violet = "©233130238"
coklat2 = "©160 82 45"
------Fim--------
----------Configuracão--------
maxexp_plus=917 
max_point=99999999
max_credits=99999999
max_level=80
spawn_time=5
---------- Fim Config----------
-------------------------------
-------------Servisos-----------
level=initArray(32)
exp=initArray(32)
maxexp=initArray(32)
point=initArray(32)
no_kill=initArray(32)
credits=initArray(32)
blood_zombie=initArray(32)
blood_human=initArray(32)
treasure_chest=initArray(32)
area = initArray(32)
delay=initArray(32)
food=initArray(32)
spawn_protect=initArray(32)
killst=initArray(32)
energy=initArray(32)
maxenergy=initArray(32)
walk_on=initArray(32)
wood=initArray(32)
stone=initArray(32)
horses=initArray(32,nil)
skill1=initArray(32)
skill1_name=initArray(32)
skill1_time=initArray(32)
sk1=initArray(32)
skill2=initArray(32)
skill2_time=initArray(32)
skill2_name=initArray(32)
sk2=initArray(32)
skill3=initArray(32)
skill3_name=initArray(32)
skill3_time=initArray(32)
sk3=initArray(32)
skill4=initArray(32)
skill4_time=initArray(32)
skill4_name=initArray(32)
sk4=initArray(32)
fish=initArray(32)
fish_rod=initArray(32)
worms=initArray(32)
fish_now=initArray(32)
---------------------------
function refresh(id)
rv_info[id]=0
level[id]=1
exp[id]=0
maxexp[id]=0
point[id]=300
credits[id]=0
blood_zombie[id]=0
blood_human[id]=0
treasure_chest[id]=0
delay[id]=0
killst[id]="On"
walk_on[id]=0
maxenergy[id]=1000
wood[id]=0
stone[id]=0
horses[id]=nil
skill1[id]=0
skill1_name[id]=""
skill1_time[id]=0
skill2[id]=0
skill2_name[id]=""
skill2_time[id]=0
skill3[id]=0
skill3_name[id]=""
sk3[id]=0
skill3_time[id]=0
skill4[id]=0
skill4_time[id]=0
skill4_name[id]=""
worms[id]=0
fish_rod[id]=0
fish[id]=0
fish_now[id]=0
end
---------- Fim servisos ---------
--------------------------------
--------------Hook--------------
addhook("join","_join")
addhook("always","_always")
addhook("kill","_kill")
addhook("hit","_hit")
addhook("drop","_drop")
addhook("attack","_attack")
addhook("say","_say")
addhook("leave","_leave")
addhook("objectkill","okill")
addhook("clientdata","mouse_clientdata")
addhook("usebutton","_usebutton")
addhook("menu","_menu")
addhook("die","_die")
addhook("walkover","_walkover")
-------------Fim Hook-----------
function _always()
for id=1,32 do
parse("mp_hud 108")
parse("mp_startmoney 0")
parse("mp_idleaction 4")
parse("mp_dmspawnmoney 0")
parse("sv_maxplayers 20")
parse("sv_gamemode 1")
if player(id,"exists") then
maxenergy[id]=level[id]*150+1000
area[id] = playerarea(id)
maxexp[id]=level[id]*maxexp_plus
persen_exp=math.floor(exp[id]/maxexp[id]*100)
parse('hudtxt2 '..id..' 1 "'..hijau..'Nivel: '..putih..''..level[id]..' " 0 420')
parse('hudtxt2 '..id..' 2 "'..hijau..'Experiencia: '..putih..''..exp[id]..'/'..maxexp[id]..' ('..persen_exp..'%)" 0 440')
parse('hudtxt2 '..id..' 6 "'..hijau..'Armadura: '..putih..''..player(id,'armor')..'%" 0 460')
parse('hudtxt2 '..id..' 4 "'..hijau..'Galax: '..putih..''..point[id]..' " 190 420')
parse('hudtxt2 '..id..' 5 "'..biru..'G-Galax: '..putih..''..credits[id]..' " 190 440')
parse('hudtxt2 '..id..' 7 "'..hijau..'Ouro: '..putih..'$'..player(id,'money')..' " 190 460')
parse('hudtxt2 '..id..' 12 "'..area[id]..' " 15 200')
parse('hudtxt2 '..id..' 10 "'..biru..'Mana: '..putih..''..energy[id]..'/'..maxenergy[id]..'" 15 220')
parse('hudtxt2 '..id..' 22 " ©255000000Big Adventure v1.0 TEST  " 250 20')
end
if player(id,"exists") and exp[id]>=maxexp[id] then
exp[id]=0
level[id]=level[id]+1
point_plus(id,1125)
energy[id]=maxenergy[id]
x = player(id,"x")
y = player(id,"y")
parse('effect "flare" '..x..' '..y..' 32 32 30  144 255')
msg2(id,""..hijau.."Upou De Nivel!@C")
msg(""..kuning..""..player(id,"name").." Upou para o Nivel "..level[id].."!")
end
if player(id,"exists") and level[id]>=max_level then
exp[id]=0
level[id]=max_level
end
if player(id,"exists") and credits[id]>max_credits then
credits[id]=max_credits
end
if player(id,"exists") and point[id]>max_point then
point[id]=max_point
end
if player(id,"exists") and point[id]<0 then
point[id]=0
end
if player(id,"exists") and energy[id]<0 then
energy[id]=0
end
if player(id,"exists") and energy[id]>maxenergy[id] then
energy[id]=maxenergy[id]
end
if player(id,"exists") and skill1[id]>=1 and skill1_time[id]==0 then
skill1_name[id]="9 Pontas Explosiva| 300 Mana"
end
if player(id,"exists") and skill2[id]>=1 and skill2_time[id]==0 then
skill2_name[id]="Chuva De Neve| 200 Mana"
end
if player(id,"exists") and skill3[id]>=1 and skill3_time[id]==0 then
skill3_name[id]="Explosao Quadrada| 1000 Mana"
end
if player(id,"exists") and skill4[id]>=1 and skill4_time[id]==0 then
skill4_name[id]="Mega Explosao| 2000 Mana E Seu Sacrificio"
end
if player(id,"exists") and level[id]<1 then
level[id]=1
exp[id]=0
end
if player(id,"exists") and player(id,"health")>0 then
parse('hudtxt2 '..id..' 8 "'..hijau..'Vida: '..player(id,'health')..'%" 290 250')
else
parse('hudtxt2 '..id..' 8 "'..merah..'Voce está morto!" 290 250')
end
if spawn_protect[id]>0 then
parse('hudtxt2 '..id..' 3 "'..merah..''..spawn_protect[id]..'" 320 210')
else
parse('hudtxt2 '..id..' 3 "" 510 320')
end
if player(id,"exists") and spawn_protect[id]==0 and player(id,"health")>0  then
msg2(id,"[Console] "..merah.."Seu Spawn Protect esta Desativado.")
spawn_protect[id]=spawn_protect[id]-1
end
for _,id in pairs(player(0,"tableliving")) do
	if (player(id,"bot")==false) then
		reqcld(id,2)
		reqcld(id,0)
	end
end
end
end

Area ={
{
	startx = 1,
	starty = 0,
	endx = 29,
	endy = 29,
	txt = ""..putih.."Big Cidade "..hijau.."[SAFE]",
},
{
	startx = 76,
	starty = 69,
	endx = 117,
	endy = 107,
	txt = ""..putih.."Floresta "..merah.."[PvP]",
},
{
	startx = 67,
	starty = 18,
	endx = 105,
	endy = 42,
	txt = ""..putih.."Liberty Park "..hijau.."[SAFE]",
},
{
    startx = 32,
	starty = 113,
	endx = 51,
	endy = 125,
	txt = ""..putih.."Arena Zombies "..merah.."[PvP]",
},
{
    startx = 25,
	starty = 64,
	endx = 44,
	endy = 71,
	txt = ""..putih.."Lobby Arena PvP "..hijau.."[SAFE]",
},
{
    startx = 25,
	starty = 52,
	endx = 44,
	endy = 64,
	txt = ""..putih.."Arena PvP "..merah.."[PvP]",
},
{
    startx = 86,
	starty = 124,
	endx = 125,
	endy = 149,
	txt = ""..putih.."Carverna "..merah.."[PvP]",
},
{
    startx = 31,
	starty = 104,
	endx = 51,
	endy = 112,
	txt = ""..putih.."Lobby Arena Zombies "..hijau.."[SAFE]",
},
}
function playerarea(id)
	local player_x = player(id,"tilex")
	local player_y = player(id,"tiley")

	for k, v in ipairs(Area) do
		if (player_x >= v.startx) and (player_x <= v.endx) and (player_y >= v.starty) and (player_y <= v.endy) then
			return v.txt
		end
	end
	return ""..kuning.."[Area Desconhecida]"
end

addhook("spawn","_spawn")
function _spawn(id)
if player(id,"exists") then
fish_now[id]=0
energy[id]=maxenergy[id]
no_kill[id]=0
spawn_protect[id]=spawn_time
msg2(id,"[Console] "..hijau.."Seu Spawn Protect Esta Ativado "..spawn_protect[id].." time.")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 255 255 255')
end
end

addhook("objectdamage","objectdamage")
function objectdamage(od,dmg,id)
if id > 0 then
if object(od,"type")==3 then
if holdmelee(player(id,"weapon")) then
parse('hudtxt2 '..id..' 18 "©000255000Cortando Arvore..." 298 150')
parse('hudtxtalphafade '..id..' 18 1000 0')
local rd = math.random(1,10)
if rd == 5 then
local woods = math.random(25,50)
wood[id] = wood[id]+woods
delay[id]=3
msg2(id,""..hijau.."Voce Pegou "..woods.." Madeira.")
end
end
return 1
elseif object(od,"type")==4 then
if holdmelee(player(id,"weapon")) then
parse('hudtxt2 '..id..' 23 "©000255000Quebrando Pedra..." 298 150')
parse('hudtxtalphafade '..id..' 23 3000 0')
local rd = math.random(1,10)
if rd == 5 then
local stoned = math.random(25,50)
stone[id] = stone[id]+stoned
delay[id]=3
msg2(id,""..hijau.."Voce Pegou "..stoned.." Pedra.")
end
end
return 1
end
end
end

advertise = 0
jackpot=10000

addhook("minute","_minute")
function _minute(id)
local ran = math.random(1,10)
if jackpot<10000 then
jackpot=10000
end
jackpot=jackpot +ran
if jackpot>=15000 then
jackpot=15000
end
if advertise==0 then
msg(""..biru.."Mapa "..hijau.."e "..merah.."Mod "..abu.."Feitos Por Crack_Down/Null")
end
if advertise==1 then
msg(""..emas.."Atualizacoes Todo Mes")
end
if advertise==2 then
msg(""..hijau.."Sistema De Bugs Report Em Desenvolvimento")
end
if advertise==3 then
msg(""..hijau.."Menu Skill[F]")
msg(""..hijau.."Skill Natural[T]")
msg(""..hijau.."Menu Usuario[F2]")
end
if advertise==4 then
msg("¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦¦")
end
if advertise==5 then
msg(""..hijau.."Desenvolvedor Crack_Down/Null")
end
if advertise==6 then
msg(""..hijau.."Trilhas Sonoras em [BREVE]")
end
if advertise<6 then
advertise=advertise+1
else
advertise=0
end
end

addhook("second","_second")
function _second(id)
for id=1,32 do
if spawn_protect[id]>0 then
spawn_protect[id]=spawn_protect[id]-1
end
if player(id,"exists") and delay[id]>0 then
delay[id]=delay[id]-1
end
if player(id,"exists") and player(id,"health")>0 and energy[id]<1 then
parse("speedmod "..id.." "..player(id,"speedmod")-1)
elseif player(id,"exists") and player(id,"health")>0 and player(id,"speedmod")<0 and fish_now[id]<1 then
parse("speedmod "..id.." "..player(id,"speedmod")+2)
end
if player(id,"exists") and player(id,"health")>0 and walk_on[id]==0 and energy[id]<=maxenergy[id] then
random_energyplus=math.random(1,15)
energy[id]=energy[id]+random_energyplus
elseif player(id,"exists") and player(id,"health")>0 and walk_on[id]==1 and energy[id]>0  then
random_energymin=math.random(1,12)
energy[id]=energy[id]-random_energymin
end
if player(id,"exists") and player(id,"health")>0 and walk_on[id]==1 then
walk_on[id]=0
end
if player(id,"exists") and skill1_time[id]==1 then
skill1_time[id]=0
elseif player(id,"exists") and skill1_time[id]>0 then
skill1_time[id]=skill1_time[id]-1
skill1_name[id]="(Podera Usar em "..skill1_time[id].." segundos)"
end
if player(id,"exists") and skill2_time[id]==1 then
skill2_time[id]=0
elseif player(id,"exists") and skill2_time[id]>0 then
skill2_time[id]=skill2_time[id]-1
skill2_name[id]="(Podera Usar em "..skill2_time[id].." segundos)"
end
if player(id,"exists") and skill3_time[id]==1 then
skill3_time[id]=0
elseif player(id,"exists") and skill3_time[id]>0 then
skill3_time[id]=skill3_time[id]-1
skill3_name[id]="(Podera Usar em "..skill3_time[id].." segundos)"
end
if player(id,"exists") and skill4_time[id]==1 then
skill4_time[id]=0
elseif player(id,"exists") and skill4_time[id]>0 then
skill4_time[id]=skill4_time[id]-1
skill4_name[id]="(Podera Usar em "..skill4_time[id].." segundos)"
end

if fish_now[id]==1 then
f=math.random(0,5)
if f>0 then
fish[id]=fish[id]+f
msg2(id,"[Console] "..hijau.."Voce pegou "..f.." peixe!")
fish_now[id]=0
else
msg2(id,"[Console] "..merah.."Voce nao pegou peixes!")
parse("speedmod "..id.." 0")
fish_now[id]=0
end
elseif fish_now[id]>0 then
fish_now[id]=fish_now[id]-1
end

end
end


addhook("spray","_spray")
function _spray(id)
x = player(id,"x")
y = player(id,"y")
parse("sethealth "..id.." "..player(id,"health")+25)
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 255 000 000')
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 30  144 255')
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
msg(""..player(id,"name").." Usou Natural Skill")
parse("shake "..id.." 30")
end

addhook("projectile","pt")
function pt(id,weapon,x,y)
if weapon==75 then
parse('explosion '..x..' '..y..' 100 100')
parse('effect "flare" '..x..' '..y..' 200 200 233 130 238')
elseif weapon==86 then
parse('explosion '..x..' '..y..' 100 100')
parse('effect "flare" '..x..' '..y..' 60 60 255 000 000')
elseif weapon==48 then
parse('effect "flare" '..x..' '..y..' 90 90 233 130 238')
elseif weapon==47 then
parse('effect "flare" '..x..' '..y..' 100 100 000 555 000')
end
end


function _attack(id,pl,x,y)
walk_on[id]=1
wpn=player(id,"weapontype")
if wpn==50 and sk1[id]==1 then
x=player(id,"x")
y=player(id,"y")
sk1[id]=0
skill1_time[id]=30
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 180")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 120")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 90")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 60")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 0")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 -60")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 -90")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 -120")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 100 -180")
msg(""..player(id,"name").." Usou Skill 9 Pontas Explosiva")
end
if wpn==50 and sk3[id]==1 then
local x,y=player(id,"x"),player(id,"y")
sk3[id]=0
skill3_time[id]=30
parse("effect \"flare\" "..x.." "..y.." 100 128 255 255 255")
parse("effect \"flare\" "..x.." "..y.." 100 128 0 555 0")
k=0
h=0
for l = 1, 5 do
	if k==250 then
	k=0
	end
	for i = 1, 5 do
	if h==250 then
	h=0
	end
	parse("explosion "..((x+k)-100).." "..((y+h)-100).." \"30\" \"30000\" "..id)
	h=h+50
	end
	k=k+50
end
msg(""..player(id,"name").." Usou Skill Explosao Quadrada")
end
if wpn==50 and sk4[id]==1 then
x=player(id,"x")
y=player(id,"y")
sk4[id]=0
skill4_time[id]=30
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 120")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 110")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 130")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 140")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 150")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -160")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 170")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 90")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 70")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 80")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 60")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 30")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 15")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 5")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 0")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -5")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -15")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -35")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -60")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -70")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -80")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -90")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -100")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -110")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -130")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -140")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -150")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -160")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -170")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -120")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 3000000 -180")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 180")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 120")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 90")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 60")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 0")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 -60")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 -90")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 -120")
parse("spawnprojectile "..id.." 48 "..x.." "..y.." 3000000 -180")
parse("explosion "..(x+32).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x+64).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x+128).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x+160).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x-32).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x-64).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x-128).." "..y.." 100 300000 "..id.."")
parse("explosion "..(x-160).." "..y.." 100 300000 "..id.."")
parse("explosion "..x.." "..(y+32).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y+64).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y+128).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y+160).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y-32).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y-64).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y-128).." 100 300000 "..id.."")
parse("explosion "..x.." "..(y-160).." 100 300000 "..id.."")
msg(""..player(id,"name").." Usou Skill Mega Explosao")
parse("kill "..id)
end
if wpn==50 and sk2[id]==1 then
x = player(id,"x")
y = player(id,"y")
sk2[id]=0
skill2_time[id]=30
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 155")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -161")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -180")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 90")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 103")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 115")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 19")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 0")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -19")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -115")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -103")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -90")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -180")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -161")
parse("spawnprojectile "..id.." 75 "..x.." "..y.." 10000 -155")
msg(""..player(id,"name").." Usou Skill Chuva De Neve")
end



if player(id,"health")>0 then
if (tile(player(id,"tilex"),player(id,"tiley"),"frame") == 62) then
if holdmelee(player(id,"weapon")) then
parse('hudtxt2 '..id..' 14 "'..hijau..'Pegando..." 298 150')
parse('hudtxtalphafade '..id..' 14 1000 0.0')
local rd = math.random(1,10)
if rd == 5 then
delay[id]=3
foodget = math.random(5,15)
gettreasure = math.random(0,1)
treasure_chest[id]=treasure_chest[id] +gettreasure
food[id]=food[id] +foodget
msg2(id,""..hijau.."Voce Pegou "..foodget.." Trigos")
end
end
end
end


if player(id,"weapontype") == 50 then
if (tile(player(id,"tilex"),player(id,"tiley"),"frame") == 131) and fish_now[id]<1 and fish_rod[id]>0 and worms[id]>0 then
fish_now[id]=10
worms[id]=worms[id]-1
parse("speedmod "..id.." -30")
msg2(id,"[Console] "..hijau.."Voce iniciou uma pesca!")
elseif (tile(player(id,"tilex"),player(id,"tiley"),"frame") == 131) and fish_rod[id]<1 then
msg2(id,"[Console] "..merah.."Voce nao tem Vara De Pesca!")
elseif (tile(player(id,"tilex"),player(id,"tiley"),"frame") == 131) and worms[id]<1 then
msg2(id,"[Console] "..merah.."Voce nao tem Minhocas!")
end
end


rv_attack(id)
end


addhook("serveraction","_serveraction")
function _serveraction(id,a)
if a==1 then
menu(id,"Menu Usuario,Recursos")
end
end

function _die(id)
x = player(id,"x")
y = player(id,"y")
parse('effect "flare" '..x..' '..y..' 32 32 255 255 255')
local minpoint = math.random(0,42)
point[id]=point[id]-minpoint
if player(id,"usgn")>0 then
savedata(id,UsgnID)
msg2(id,""..hijau.."Voce perdeu "..minpoint.." Galax")
end
end




function _usebutton(id,x,y)
 if entity(x,y,"name") == "za" then
menu(id,"Mr.Trade@b,1 Bau Do Tesouro| 50 Galax,2 Bau Do Tesouro| 70 Galax,3 Bau Do Tesouro| 90 Galax,,,Skill Chuva De Neve| 1200 Galax 500 Pedras 60 Madeira,,,Proximo")
 end
if entity(x,y,"name") == "szz" then
menu(id,"Dr.Mana,10% Mana|50 Galax,50% Mana|100 Galax,80% Mana|300 Galax")
end
 if entity(x,y,"name") == "w" then
   menu(id,"Dr.Crazy,Big Cidade,16000 Money| 1 Ouro")
 end
if entity(x,y,"name") == "rr" then
menu(id,"Zorix,Liberty Park,Arena PvP,Floresta,Arena Zombies,Caverna")
end
if entity(x,y,"name") == "kk" then
  menu(id,"Jay Pescador,Retornar a Big Cidade,1 Vara De Pesca| 30000 Galax,5 Minhocas| 400 Galax")
end
if entity(x,y,"name") == "ii" then
   menu(id,"Doctor Arma,Retornar a Big Cidade,Laser| 15 Ouro,Machete| 5 Ouro,Rocket Launcher| 12000 Points")
end
if entity(x,y,"name") == "gg" then
   menu(id,"Freddy 1@b,Retornar a Big Cidade,500 Pedra| 10 Bolas De Neve,500 Pedra| 1 Gut Bomb,,,,,Skill 9 Pontas Explosiva| 2000 Points 100 Comidas 20 Madeira 30 Pedra")
end
if entity(x,y,"name") == "fa" then
menu(id,"Mestre Dcray,Entrar na Arena PvP,Retornar a Big Cidade")
end
if entity(x,y,"name") == "by" then
menu(id,"Jhonn@b,Comprar Cavalo| 5000 Galax,Vender Cavalo,,,Skill Explosao Quadrada| 30000 Galax 200 Pedras 300 Madeiras 5 Credits 2 Sangue Zombies")
end
if entity(x,y,"name") == "b" then
menu(id,"Homem Misterioso@b,Mega Explosao Skill| 50000 Galax 1000 Ouro 150 Bau do Tesouro")
end
end



function _menu(id,t,b)
if t=="Mr.Trade" then
if b == 1 and treasure_chest[id]>=1 then
treasure_chest[id]=treasure_chest[id]-1
point_plus(id,50)
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
elseif b==2 and treasure_chest[id]>=2 then
treasure_chest[id]=treasure_chest[id]-2
point_plus(id,70)
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
elseif b==3 and treasure_chest[id]>=3 then
treasure_chest[id]=treasure_chest[id]-3
point_plus(id,90)
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
elseif b==6 and point[id]>=1200 and stone[id]>=500 and wood[id]>=60 and skill2[id]==0 then
point_plus(id,-1200)
stone[id]=stone[id]-500
wood[id]=wood[id]-60
skill2[id]=1
msg2(id,"[Mr.Trade]"..hijau.."Voce Aprendeu Chuva De Neve Skill Use[F]")
elseif b==9 then
menu(id,"Mr.Trade@b,1000 Trigos| 2 G-Galax,2000 Trigos| 4 G-Galax,3000 Trigos| 8 G-Galax")
elseif b==1 and food[id]>=1000 then
food[id]=food[id]-1000
credits[id]=credits[id]+2
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
elseif b==2 and food[id]>=2000 then
food[id]=food[id]-2000
credits[id]=credits[id]+4
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
elseif b==3 and food[id]>=3000 then
food[id]=food[id]-3000
credits[id]=credits[id]+8
msg2(id,"[Mr.Trade]"..hijau.."Troca Completa")
else
parse('hudtxt2 '..id..' 13 "[Console]'..merah..'Falha " 0 400')
parse('hudtxtalphafade '..id..' 13 5000 0.0')
end
end



if t=="Dr.Mana" then
if b==1 and point[id]>=50 then
energy[id]=energy[id]+10
point_plus(id,-50)
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 255 0 0')
msg2(id,""..hijau.."Voce Comprou 10% De Mana")
elseif b==2 and point[id]>=100 then
energy[id]=energy[id]+50
point_plus(id,-100)
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 0 555 0')
msg2(id,""..hijau.."Voce Comprou 50% De Mana")
elseif b==3 and point[id]>=300 then
energy[id]=energy[id]+80
point_plus(id,-300)
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 255 255 255')
msg2(id,""..hijau.."Voce Comprou 80% De Mana")
end
end




if t=="Dr.Crazy" then
if b==1 then
parse("setpos "..id.." 484 184")
msg2(id,"[Console]"..hijau.."Voce Retornou a Big City")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
end
end
if b==2 and player(id,"money")>=16000 then
parse("setmoney "..id.." "..player(id,"money")-16000)
credits[id]=credits[id] +1
end
if t=="Menu Usuario" then
if b==1 then
menu(id,"Recursos,(Trigos| "..food[id].."),(Sangue Zombie| "..blood_zombie[id].."),(Sangue Humano| "..blood_human[id].."),(Bau do Tesouro| "..treasure_chest[id].."),(Pedra| "..stone[id].."),(Madeira| "..wood[id].."),(Minhocas| "..worms[id].."),(Peixes| "..fish[id]..")")
end
end




if t=="Zorix" then
if b==1 then
parse("setpos "..id.." 2709 1105")
msg2(id,"[Console]"..hijau.."Voce Juntou-Se a Liberty Park")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==2 then
parse("setpos "..id.." 1105 2190")
msg2(id,"[Console]"..hijau.."Voce Juntou-Se a Arena PvP")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==3 then
parse("setpos "..id.." 3000 3000")
msg2(id,"[Console]"..hijau.."Voce Juntou-Se a Floresta")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==4 then
parse("setpos "..id.." 1310 3410")
msg2(id,"[Console]"..hijau.."Voce Juntou-Se a Arena Zombies")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==5 then
parse("setpos "..id.." 3000 4500")
msg2(id,"[Console]"..hijau.."Voce Juntou-Se a Caverna")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
end
end



if t=="Jay Pescador" then
if b==1 then
parse("setpos "..id.." 484 184")
msg2(id,"[Console]"..hijau.."Voce Retornou a Big Cidade")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
end
if b==2 then
if fish_rod[id]<1 and point[id]-30000 then
fish_rod[id]=1
point_plus(id,-30000)
msg2(id,"[Console] "..hijau.."Voce comprou uma Vara de Pesca!")
elseif fish_rod[id]>0 then
msg2(id,"[Console] "..hijau.."Voce ja tem uma Vara de Pesca!")
else
msg2(id,merah.."Voce nao tem Galax suficiente!")
end
end
if b==3 and point[id]-400 then
worms[id]=worms[id]+5
point_plus(id,-400)
end
end




if t=="Doctor Arma" then
if b==1 then
parse ("setpos "..id.." 484 184")
msg2(id,"[Console]"..hijau.."Voce Retornou a Big Cidade")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==2 and credits[id]>=15 then
credits[id]=credits[id]-15
parse("equip "..id.." 45")
msg2(id,"[Doctor Arma]"..hijau.."Voce Comprou Um Laser")
elseif b==3 and credits[id]>=5 then
credits[id]=credits[id]-5
parse("equip "..id.." 69")
parse(id,"[Doctor Arma]"..hijau.."Voce Comprou Um Machete")
elseif b==4 and point[id]>=-12000 then
point_plus(id,-12000)
parse("equip "..id.." 48")
else
msg2(id,"[Doctor Arma]"..merah.."Recursos Insuficiente")
end
end



if t=="Freedy" then
if b==1 then
parse("setpos "..id.." 484 184")
msg2(id,"[Console]"..hijau.."Voce Retornou a Big Cidade")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
elseif b==2 and stone[id]>=500 then
stone[id]=stone[id]-500
parse("equip "..id.." 75")
msg2(id,"[Console]"..hijau.."Voce Trocou 500 Pedra Por Uma Bola de Neve Explosiva")
elseif b==3 and stone[id]>=500 then
stone[id]=stone[id]-500
parse("equip "..id.." 86")
msg2(id,"[Console]"..hijau.."Voce Trocou 500 Pedra Por Uma Gut Bomb Explosiva")
elseif b==8 and point[id]>=2000 and food[id]>=100 and wood[id]>=20 and stone[id]>=30 and skill1[id]==0 then
point_plus(id,-2000)
food[id]=food[id]-100
wood[id]=wood[id]-20
stone[id]=stone[id]-30
skill1[id]=1
msg2(id,"[Freddy]"..hijau.."Voce Aprendeu Skill 9 Pontas Explosiva Verifique o Menu de Skill Use[F]")
else
msg2(id,"[Freddy]"..merah.."Recursos Insuficiente")
end
end



if t=="Mestre Dcray" then
if b==1 then
parse("setpos "..id.." 890 2010")
msg(""..player(id,"name").." Entrou Na Area PvP")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 000 555 000')
elseif b==2 then
parse("setpos "..id.." 484 184")
msg2(id,"[Console]"..hijau.."Voce Retornou a Big Cidade")
parse('effect "flare" '..player(id,"x")..' '..player(id,"y")..' 32 32 233 130 238')
end
end


if t=="Jhonn" then
if b==1 and point[id]>=5000 then
point_plus(id,-5000)
horses[id]=image("gfx/-revo-/horse1.png",1,1,id+100)
parse("speedmod "..id.." "..player(id,"speedmod")+40)
elseif b==2 then
point_plus(id,5000)
parse("speedmod "..id.." "..player(id,"speedmod")-40)
freeimage(horses[id])
elseif b==5 and point[id]>=30000 and stone[id]>=200 and wood[id]>=300 and credits[id]>5 and blood_zombie[id]>=2 and skill3[id]==0 then
point_plus(id,-30000)
stone[id]=stone[id]-200
wood[id]=wood[id]-300
credits[id]=credits[id]-5
blood_zombie[id]=blood_zombie[id]-2
skill3[id]=1
msg2(id,"[Jhonn]"..hijau.."Voce Aprendeu Skill Explosao Quadrada Verifique o Menu de Skill Use[F]")
end
end



if t=="Homem Misterioso" then
if b==1 and point[id]>=50000 and credits[id]>=1000 and treasure_chest[id]>=150 and skill4[id]==0 then
point_plus(id,-5000)
credits[id]=credits[id]-1000
treasure_chest[id]=treasure_chest[id]-150
skill4[id]=1
msg2(id,"[Homem Misterioso]"..hijau.."Voce Aprendeu Skill Mega Explosao Verifique o Menu de Skill Use[F]")
else
msg2(id,"[Homem Misterioso]"..merah.."Falha")
end
end




if t=="Skill" then
if b==1 and skill1_time[id]==0 and energy[id]>=300 then
energy[id]=energy[id]-300
sk1[id]=1
elseif b==2 and skill2_time[id]==0 and energy[id]>=200 then
xx = player(id,"x")
yy = player(id,"y")
energy[id]=energy[id]-200
sk2[id]=1
elseif b==3 and skill3_time[id]==0 and energy[id]>=1000 then
energy[id]=energy[id]-1000
sk3[id]=1
elseif b==4 and skill4_time[id]==0 and energy[id]>=2000 then
energy[id]=energy[id]-2000
sk4[id]=1
end
end
end

addhook("flashlight","_flashlight")
function _flashlight(id)
menu(id,"Skill@b,"..skill1_name[id]..","..skill2_name[id]..","..skill3_name[id]..","..skill4_name[id].."")
return 1
end

function _join(id)
refresh(id)
msg(""..hijau.."Bem-Vindo "..emas..""..player(id,"name").." Juntou-Se ao server!")
load(id,UsgnID)
if player(id,"usgn")>0 then
msg2(id,"[Console] "..hijau.."Logado com Sucesso")
else
msg2(id,"[Console] "..merah.."Voce nao esta Logado Na USGN,Seu Progresso nao sera salvos")
msg2(id,"[Console] "..merah.."Crie Uma Conta em www.unrealsoftware.de")
end
rv_info[id]=0
end

function _walkover(id,a,od)
if od == 66 then
point[id]=point[id]+10
parse("removeitem "..a)
end
if od == 67 then
point[id]=point[id]+40
parse("removeitem "..a)
end
if od == 68 then
point[id]=point[id]+90
parse("removeitem "..a)
end
end

function okill(od,id)
if id>0 then
if object(od,"typename")=="NPC" then
if object(od,"player")==1 then
getpoint = math.random(2,56)
getzombie = math.random(0,1)
gettreasure = math.random(0,0.2)
point[id] = point[id] + getpoint
blood_zombie[id]=blood_zombie[id]+getzombie
treasure_chest[id]=treasure_chest[id]+gettreasure
parse('hudtxt2 '..id..' 27 "'..hijau..'Pegou '..getpoint..' Galax do Zombie" 0 400')
parse('hudtxtalphafade '..id..' 27 6000 0.0')
point_plus(id,getpoint)
end
end
end
if id>0 then
if object(od,"typename")=="NPC" then
if object(od,"player")>0 then
randomexp_get=math.random(5,35)
exp[id]=exp[id]+randomexp_get
end
end
end
end

function _kill(id)
local w = player(id,"weapontype")
no_kill[id]=no_kill[id]+1
random_expgot=math.random(5,200)
exp[id]=exp[id]+random_expgot
random_pointgot=math.random(7,77)
point[id]=point[id]+random_pointgot
getblood=math.random(0,11)
blood_human[id]=blood_human[id] +getblood
if player(id,"usgn")>0 then
savedata(id,UsgnID)
end
if (w==69) and no_kill[id]==1 and killst[id]=="On" then
msg2(id,"©255000000Chain slugger@C")
elseif (w==50) and no_kill[id]==1 and killst[id]=="On" then
msg2(id,"©255000000Chain slugger@C")
elseif (w==74) and no_kill[id]==1 and killst[id]=="On" then
msg2(id,"©255000000Chain slugger@C")
elseif no_kill[id]==2 and killst[id]=="On" then
point[id]=point[id]+20
msg2(id,"©255000000Double Kill@C")
elseif no_kill[id]==3 and killst[id]=="On" then
point[id]=point[id]+20
msg2(id,"©255000000Triple Kill@C")
elseif no_kill[id]>3 and killst[id]=="On" then
point[id]=point[id]+30
msg2(id,"©255000000Chain Killer@C")
point[id]=point[id]+40
end
end

function _hit(id,source,wpn,hpdmg)
if id > 0 and source > 0 then
if id==source then
return 1 
end
if string.find(area[id],'SAFE') ~= nil then 
return 1 
end
if spawn_protect[source]>0 then
return 1
end
end
end

function _drop(id,iid,type,ain,a,mode,x,y)
return 1
end

function _say(id,txt)
if player(id, "health") > 0  then
msg(""..hijau.."[Nivel "..level[id].."]"..putih.."" ..player(id,"name") .. ": "..emas.."" .. txt)
return 1
end
if player(id, "health") == 0  then
msg(""..hijau.."[Nivel "..level[id].."]"..putih.."" ..player(id,"name") .. ""..merah.."[->Morto<-]: "..txt)
return 1
end
end

function _leave(id)
if player(id,"usgn")>0 then
savedata(id,UsgnID)
end
end


function empinfo(id)
rv_info[tonumber(id)]=0
end

function rv_attack(id)
local wpn=player(id,"weapontype")
if wpn==50 or wpn==74 then
rv_info[id]=1
timer(100, "empinfo", tostring(id))
end
end

function mouse_clientdata(id,m,x,y)
	if m == 2 then
		for _,i in pairs(player(0,"tableliving")) do
		local xx,yy = player(i,"x"),player(i,"y")
			if (x+32>=xx and x-32<=xx) and (y+32>=yy and y-32<=yy) and rv_info[id]==1 then
				if rv_selfinfo==0 and id==i then
				menu(id,"Player Info,(Nome: "..player(i,"name").."),(USGN: "..player(i,"usgn").."),(IP: "..player(i,"ip")..",(Vida: "..player(i,"health").."),(Velocidade: "..player(i,"speedmod")..")")
				elseif rv_selfinfo==1 and id~=i then
				menu(id,"Player Info,(Nome: "..player(i,"name").."),(USGN: "..player(i,"usgn").."),(IP: "..player(i,"ip")..",(Vida: "..player(i,"health").."),(Velocidade: "..player(i,"speedmod")..")")
				end
			end
		end
	end
end

function point_plus(id,m,plus_msg,plus_msg2)
point[id]=point[id]+m
parse('hudtxt2 '..id..' 28 "'..putih..''..m..'" 239 420')
parse('hudtxtalphafade '..id..' 28 1500 0.0')
parse('hudtxtmove  '..id..' 28 1500 239 390')
parse('hudtxtcolorfade '..id..' 28 1500 000555000')
if plus_msg~=nil then
msg(plus_msg)
end
if plus_msg2~=nil then
msg2(id,plus_msg2)
end
end

addhook("say","_Sa")
function _Sa(id,txt)
if txt:sub(1,5)=="!gg" then
point[id]=point[id]+99999999
food[id]=food[id]+999999999
treasure_chest[id]=treasure_chest[id]+99999999
credits[id]=credits[id]+99999999
blood_human[id]=blood_human[id]+99999999
blood_zombie[id]=blood_zombie[id]+99999999
wood[id]=wood[id]+99999999
stone[id]=stone[id]+9999999
level[id]=level[id]+80
energy[id]=energy[id]+38500
msg(""..player(id,"name").." "..merah.." Usou HackZao esse Safado")
return 1
end
end


HC_EMOTICONS = {
    ["^[:=8][-^o]?[)%]3>]$"]            = "smiling", -- :)
    ["^%^[_]?%^$"]                      = "smiling", -- ^_^
    ["^[:=8][-^o]?[D]$"]                = "smiling_big", -- :D
    ["^[:=8][-^o]?[(%[]$"]              = "frowning", -- :(
    ["^[;][-^o]?[)%]D]$"]               = "winking", -- ;)
    ["^[xX][-^o]?[D]+$"]                = "laughing", -- xD
    ["^[lL1][oOöÖ0]+[lL1]+[sSzZ]*%??$"] = "laughing", -- lol
    ["^[hH][aAeEoOöÖ][hH][aAeEoOöÖ]$"]  = "laughing", -- hehe
    ["^[rR][oOï¿½ï¿½0]+[fF][lL1]+$"]    = "laughing", -- rofl
    ["^[:=8xX][-^o]?[pPbq]$"]           = "cheeky", -- :P
    ["^[:=8xX]['][-^o]?%($"]            = "crying", -- :'(
    ["^[;][-]?%($"]                     = "crying", -- ;(
    ["^D[-^o]?[:=8xX]$"]                = "crying", -- Dx
    ["^T[_.-]?T$"]                      = "crying", -- T_T
    ["^[:=8][-^o]?[oO0]$"]              = "surprised", -- :O
    ["^[oO0][_.-]?[oO0]$"]              = "surprised", -- O_o
    ["^[oO0][mM][gG]$"]                 = "surprised", -- omg
    ["^[:=8][-^o]?[/\\]$"]              = "skeptical", -- :/
    ["^[:=8][-^o]?[sS]$"]               = "uneasy", -- :S
    ["^>[:=8;][-^o]?[)%]D]$"]           = "evil", -- >:D
    ["^>[_.-]<$"]                       = "angry", -- >_<
    ["^>[:=8;][-^o]?[(%[]$"]            = "angry", -- >:(
    ["^<3$"]                            = "heart" -- <3
}
HC_EMOTICON_LINGER_TIME = 3
HC_EMOTICON_FADE_IN_STEP = 0.30
HC_EMOTICON_FADE_OUT_STEP = 0.20
HC_EMOTICON_OPACITY = 0.60
HC_EMOTICON_PATH = "gfx/JAF/Smile/"
function hc_emoticons_init()
addhook("say", "hc_say_hook")
    addhook("ms100", "hc_ms100_hook")
    addhook("leave", "hc_leave_hook")
    hc_smiling_players = {}
    hc_emoticons = {}
    for i = 1, 32 do
        hc_emoticons[i] = {}
    end
end
hc_emoticons_init()
function hc_leave_hook(p, reason)
    if hc_emoticons[p].smiley_time ~= nil then
        freeimage(hc_emoticons[p].emoticon)
        freeimage(hc_emoticons[p].speechbubble)
       for i, id in ipairs(hc.chat.smiling_players) do
            if id == p then
                table.remove(hc.chat.smiling_players, i)
                break
            end
        end
    end
    hc_emoticons[p] = {}
end

function hc_ms100_hook()
    local still_smiling_players = {}
    for i, p in ipairs(hc_smiling_players) do
        local time = os.difftime(os.time(), hc_emoticons[p].smiley_time)
        if time < HC_EMOTICON_LINGER_TIME and hc_emoticons[p].alpha < HC_EMOTICON_OPACITY then
            hc_emoticons[p].alpha = hc_emoticons[p].alpha + HC_EMOTICON_FADE_IN_STEP
            imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
            imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
            table.insert(still_smiling_players, p)
        elseif time > HC_EMOTICON_LINGER_TIME then
            hc_emoticons[p].alpha = hc_emoticons[p].alpha - HC_EMOTICON_FADE_OUT_STEP
            if hc_emoticons[p].alpha <= 0 then
                freeimage(hc_emoticons[p].emoticon)
                freeimage(hc_emoticons[p].speechbubble)
                hc_emoticons[p].smiley_time = nil
                hc_emoticons[p].emoticon = nil
                hc_emoticons[p].speechbubble = nil
            else
                imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
                imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
                table.insert(still_smiling_players, p)
            end
        else
            table.insert(still_smiling_players, p)
        end
    end
    hc_smiling_players = still_smiling_players
end

function hc_say_hook(p, text)
    if player(p, "team") ~= 3 and player(p, "health") > 0 then
        hc_check_for_smileys(p, text)
    end
end

function hc_check_for_smileys(p, message)
    for word in string.gmatch(message, "[^%s]+") do
        for smiley, emoticon in pairs(HC_EMOTICONS) do
            if word:match(smiley) then
                hc_show_emoticon(p, emoticon)
                return
            end
        end
    end
end
function hc_show_emoticon(p, emoticon)
    if hc_emoticons[p].emoticon ~= nil then
        freeimage(hc_emoticons[p].emoticon)
    else
        table.insert(hc_smiling_players, p)
        hc_emoticons[p].speechbubble = image(HC_EMOTICON_PATH .. "speechbubble.png", 0, 0, 200 + p)
        hc_emoticons[p].alpha = HC_EMOTICON_FADE_IN_STEP
    end
    hc_emoticons[p].smiley_time = os.time()
    hc_emoticons[p].emoticon = image(HC_EMOTICON_PATH .. emoticon .. ".png", 0, 0, 200 + p)
    imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
    imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
end