-------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------Lua By SheeeL------------------------------------------------------------
-----------------------------------------------------------Enjoy my script!----------------------------------------------------------
----------------------------------------------------------No Stolen my script--------------------------------------------------------
----------------------------------------------------------                   --------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------04/05/2012-------------------------------------------------------------

--[[
Start Parameters-- (I recommend you to don't change them)
--]]

bannedusgns = {71902,44104,2555,76747,74985,16991,68953,30633,68953,6720,13824,16880,16978,40451,16862,16679,17835,18915,41056,17530,16639,39353,77143,17952,6742,14702,16962,16505,26667,24127,52329,81934,21152,78199,51932}

local FRAGS = {}
colors = {}
red = {}
green = {}
colorss = {} -- checker say color 2
maplike = 0 -- like maps
mapnolike = 0 -- no like maps
atb = 0 -- Autoteambalance
ia = 0 --Inf Ammo
fastbuild = 0 --Fast Build
db = 0 --Disable Bots
ou = 0 --Only U.S.G.N
as = 0 --Anti Speeder
fog = 0 --Fog of War
d = 0 --DeathDrop

addhook("serveraction","panel")
function panel(id,act)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
if act == 1 then
menu(id,"Admin Settings,Config Color|-->,Punish/Discipline|-->,Grab Player|-->,Paint System|-->,Fun Mode|-->,My Status|-->,Rat Map|-->,Help?|-->,More|-->")
end
end
end

addhook("serveraction","panelvip")
function panelvip(id,ac)
if fileExists("sys/lua/user_data_vip/"..player(id,"usgn")..".txt") then
if ac == 2 then
menu(id,"VIP Settings,Config Color|-->,Paint System|-->,Fun Mode|-->,My Status|-->,Rat Map|-->,Help?|-->,Punish|-->")
end
end
end

addhook("menu","tittlesv")
function tittlesv(id,tittle,button)
if tittle == "VIP Settings" then
if button == 1 then
msg2(id,"й255255255Desculpe, Esta Funчуo VIP Estс Desabilitada Temporariamente por BUGS Nуo Relatados")
elseif button == 2 then
menu(id,"Open Menu,Open")
elseif button == 3 then
menu(id,"Hat, Yellow, Red, Et, None,UNDEFINED,, clicle")
elseif button == 4 then
menu(id,"Status,Frag|"..player(id,"score")..",Deaths|"..player(id,"deaths").."")
elseif button == 5 then
menu(id,"Map Rat,Map Likes :| "..maplike..",Map No Likes :| "..mapnolike.."")
elseif button == 6 then
msg2(id,"й255255255 Lua Created By SheeL")
msg2(id,"й255255255 Bugs ? , Contact : Unreal Software USER NAME : SheeL ")
elseif button == 7 then
menu(id,"Punish Page,Kill,Kick,Slap|-10 HP")
end
end
end


addhook("menu","all")
function all(id,tittle,button)
if tittle == "Admin Settings" then
if button == 1 then
menu(id,"Color,Red Color,Orange color,Blue Color,Green Color,Black Color,White Color,Cyan Color,Desativar")
elseif button == 2 then
menu(id,"Punish Page,Kill,Kick,Slap|-10 HP,Slow,UN-Slow")
elseif button == 3 then
menu(id,"Grab,Turn Grab ON,Turn Grab OFF")
elseif button == 4 then
menu(id,"Open Menu,Open")
elseif button == 5 then
menu(id,"Hat, Yellow, Red, Et, None, Morred, Laser, clicle")
elseif button == 6 then
menu(id,"Status,Frag|"..player(id,"score")..",Deaths|"..player(id,"deaths").."")
elseif button == 7 then
menu(id,"Map Rat,Map Likes :| "..maplike..",Map No Likes :| "..mapnolike.."")
elseif button == 8 then
msg2(id,"й255255255 Lua Created By SheeL")
msg2(id,"й255255255 Bugs ? , Contact : Unreal Software USER NAME : SheeL ")
elseif button == 9 then
menu(id,"Admin Settings-2,Nuke Set|>,Give Weapon|>,Make Admin|>,Make VIP|>,Set Speed|>,Settings|>,Building Type")
end
end
end



addhook("menu","rat")
function rat(id,t,b)
if t == "Map Rat" then
if b == 1 then
maplike=maplike+1
elseif b == 2 then
mapnolike=mapnolike-1
end
end
end

addhook("minute","sec")
function sec()
msg("й255000255 Welcome !")
end

addhook("menu","tittles")
function tittles(id,tittle,button)
if tittle == "Grab" then
if button == 1 then
grabstate[id] = 1
elseif button == 2 then
grabstate[id] = 0
end
end
end

addhook("menu","action3")
function action3(id,a,b)
if a == "Color" then
if b == 1 then
colors[id]=1
elseif b ==2 then
colors[id]=2
elseif b==3 then
colors[id]=3
elseif b==4 then
colors[id]=4
elseif b==5 then
colors[id]=5
elseif b==6 then
colors[id]=6
elseif b==7 then
colors[id]=7
elseif b==8 then
colors[id]=0
end
end
end

addhook("menu","action3444")
function action3444(id,a,b)
if a == "Color" then
if b == 1 then
colorss[id]=1
elseif b ==2 then
colorss[id]=2
elseif b==3 then
colorss[id]=3
elseif b==4 then
colorss[id]=4
elseif b==5 then
colorss[id]=5
elseif b==6 then
colorss[id]=6
elseif b==7 then
colorss[id]=7
elseif b==8 then
colorss[id]=0
end
end
end


addhook("say","action7",400)
function action7(id,t)
if txt ~= "rank" then
if colors[id]==1 then
msg("й255000000"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==2 then
msg("й255100000"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==3 then
msg("й000000255"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==4 then
msg("й000255000"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==5 then
msg("й000000000"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==6 then
msg("й255255255"..player(id,"name").." /Admin/: "..t)
return 1
elseif colors[id]==7 then
msg("й000255255"..player(id,"name").." /Admin/: "..t)
return 1
elseif colorss[id]==1 then
msg("й255000000"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==2 then
msg("й255100000"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==3 then
msg("й000000255"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==4 then
msg("й000255000"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==5 then
msg("й000000000"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==6 then
msg("й255255255"..player(id,"name").." /VIP/: "..t)
return 1
elseif colorss[id]==7 then
msg("й000255255"..player(id,"name").." /VIP/: "..t)
return 1
end
end
end


addhook("join","cor") function cor(id) colorss[id]=0 end
addhook("vote","danger") function danger(id,mode,param) if mode == 1 then msg2(id,"й255255255 Why Kick?") end end

function k(pl)
     parse("killplayer "..pl)
end
function ki(pl)
     parse("kick "..pl.." '-'")
end
function ak(pl)
     parse("slap "..pl)
end
function sl(pl)
     parse("speedmod "..pl.." -100")
end
function un(pl)
     parse("speedmod "..pl.." 0")
end

function exist(a)
     if player(a,"exists") then
          return player(a,"name")
     else
          return "(None)"
     end
end

addhook("menu","adminmenu")
function adminmenu(id,t,b)
     if t=="Punish Page" then
          if b==1 then
               menu(id,"Kill Page 1@b,"..exist(1)..","..exist(2)..","..exist(3)..","..exist(4)..","..exist(5)..","..exist(6)..","..exist(7)..","..exist(8)..",Next")
          elseif b==2 then
               menu(id,"Kick Page 1@b,"..exist(1)..","..exist(2)..","..exist(3)..","..exist(4)..","..exist(5)..","..exist(6)..","..exist(7)..","..exist(8)..",Next")
          elseif b==3 then
               menu(id,"Slap Page 1@b,"..exist(1)..","..exist(2)..","..exist(3)..","..exist(4)..","..exist(5)..","..exist(6)..","..exist(7)..","..exist(8)..",Next")
          elseif b==4 then
               menu(id,"Slow Page 1@b,"..exist(1)..","..exist(2)..","..exist(3)..","..exist(4)..","..exist(5)..","..exist(6)..","..exist(7)..","..exist(8)..",Next")
          elseif b==5 then
               menu(id,"UN-Slow Page 1@b,"..exist(1)..","..exist(2)..","..exist(3)..","..exist(4)..","..exist(5)..","..exist(6)..","..exist(7)..","..exist(8)..",Next")
          end
     elseif t=="UN-Slow Page 1" then
	  if b==9 then
	   menu(id,"UN-Slow Page 2@b,"..exist(9)..","..exist(10)..","..exist(11)..","..exist(12)..","..exist(13)..","..exist(14)..","..exist(15)..","..exist(16)..",Next")
	   elseif b~=0 then
	   un(b)
	   end
	 elseif t=="UN-Slow Page 2" then
	 if b==9 then
	  menu(id,"UN-Slow Page 3@b,"..exist(17)..","..exist(18)..","..exist(19)..","..exist(20)..","..exist(21)..","..exist(22)..","..exist(23)..","..exist(24)..",Next")
	  elseif b~=0 then
	  un(b+8)
	  end
	  elseif t=="UN-Slow Page 3" then
	  if b==9 then
	   menu(id,"Slow Page 4@b,"..exist(25)..","..exist(26)..","..exist(27)..","..exist(28)..","..exist(29)..","..exist(30)..","..exist(31)..","..exist(32))
	   un(b+24)
	   end
     elseif t=="Kill Page 1" then
          if b==9 then
               menu(id,"Kill Page 2@b,"..exist(9)..","..exist(10)..","..exist(11)..","..exist(12)..","..exist(13)..","..exist(14)..","..exist(15)..","..exist(16)..",Next")
          elseif b~=0 then
               k(b)
          end
     elseif t=="Kill Page 2" then
          if b==9 then
               menu(id,"Kill Page 3@b,"..exist(17)..","..exist(18)..","..exist(19)..","..exist(20)..","..exist(21)..","..exist(22)..","..exist(23)..","..exist(24)..",Next")
          elseif b~=0 then
               k(b+8)
          end
     elseif t=="Slow Page 1" then
          if b==9 then
               menu(id,"Slow Page 2@b,"..exist(9)..","..exist(10)..","..exist(11)..","..exist(12)..","..exist(13)..","..exist(14)..","..exist(15)..","..exist(16)..",Next")
          elseif b~=0 then
               sl(b)
          end
     elseif t=="Slow Page 2" then
          if b==9 then
              menu(id,"Slow Page 3@b,"..exist(17)..","..exist(18)..","..exist(19)..","..exist(20)..","..exist(21)..","..exist(22)..","..exist(23)..","..exist(24)..",Next")
          elseif b~=0 then
               sl(b+8)
           end
     elseif t=="Slow Page 3" then
          if b==9 then
               menu(id,"Slow Page 4@b,"..exist(25)..","..exist(26)..","..exist(27)..","..exist(28)..","..exist(29)..","..exist(30)..","..exist(31)..","..exist(32))
          elseif b~=0 then
              sl(b+16)
          end
     elseif t=="Kill Page 3" then
          if b==9 then
               menu(id,"Kill Page 4@b,"..exist(25)..","..exist(26)..","..exist(27)..","..exist(28)..","..exist(29)..","..exist(30)..","..exist(31)..","..exist(32))
          elseif b~=0 then
               k(b+16)
          end
     elseif t=="Kill Page 4" then
          if b~=0 then
               k(b+24)
          end
     elseif t=="Kick Page 1" then
          if b==9 then
               menu(id,"Kick Page 2@b,"..exist(9)..","..exist(10)..","..exist(11)..","..exist(12)..","..exist(13)..","..exist(14)..","..exist(15)..","..exist(16)..",Next")
          elseif b~=0 then
               ki(b)
          end
     elseif t=="Kick Page 2" then
          if b==9 then
               menu(id,"Kick Page 3@b,"..exist(17)..","..exist(18)..","..exist(19)..","..exist(20)..","..exist(21)..","..exist(22)..","..exist(23)..","..exist(24)..",Next")
          elseif b~=0 then
               ki(b+8)
          end
     elseif t=="Kick Page 3" then
          if b==9 then
               menu(id,"Kick Page 4@b,"..exist(25)..","..exist(26)..","..exist(27)..","..exist(28)..","..exist(29)..","..exist(30)..","..exist(31)..","..exist(32))
          elseif b~=0 then
               ki(b+16)
          end
     elseif t=="Kick Page 4" then
          if b~=0 then
               ki(b+24)
          end
     elseif t=="Slap Page 1" then
          if b==9 then
               menu(id,"Slap Page 2@b,"..exist(9)..","..exist(10)..","..exist(11)..","..exist(12)..","..exist(13)..","..exist(14)..","..exist(15)..","..exist(16)..",Next")
          elseif b~=0 then
               ak(b)
          end
     elseif t=="Slap Page 2" then
          if b==9 then
               menu(id,"Slap Page 3@b,"..exist(17)..","..exist(18)..","..exist(19)..","..exist(20)..","..exist(21)..","..exist(22)..","..exist(23)..","..exist(24)..",Next")
          elseif b~=0 then
               ak(b+8)
          end
     elseif t=="Slap Page 3" then
          if b==9 then
               menu(id,"Slap Page 4@b,"..exist(25)..","..exist(26)..","..exist(27)..","..exist(28)..","..exist(29)..","..exist(30)..","..exist(31)..","..exist(32))
          elseif b~=0 then
               ak(b+16)
          end
     elseif t=="Slap Page 4" then
          if b~=0 then
               ak(b+24)
          end
     end
end

--Array function
function array(m, d)
	local a = {}
	for id = 1, m do
		a[id] = d
	end
	return a
end

--arrays
mousex = array(32, 0)
mousey = array(32, 0)
grabstate = array(32, 0)
grabbedby = array(32, 0)
grabbedvictim = array(32, 0)
reason = array(32, 0)


function sendClientData(id)
	if grabbedvictim[id] ~= 0 then
		parse('speedmod '.. grabbedvictim[id] ..' 0')
		grabbedby[grabbedvictim[id]] = 0
		grabbedvictim[id] = 0
	elseif grabbedvictim[id] == 0 and grabstate[id] == 1 then
		reason[id] = 1
		reqcld(id, 2)
	end
end

function getGrab(id, mode, data1, data2)
	if grabstate[id] == 1 and mode == 2 then
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
		if reason[id] == 1 then
			mousex[id] = math.floor(data1/32)
			mousey[id] = math.floor(data2/32)
			for p = 1, 32 do
				if player(p, 'tilex') == mousex[id] and player(p, 'tiley') == mousey[id] then
					if grabbedvictim[id] == 0 then
						if grabbedvictim[p] == 0 then
							grabbedvictim[id] = p
							grabbedby[p] = id
						else
							msg2('й255000000You cant grab him, he already grab someone!')
					end
				end
			end
		end
	end
end
		if reason[id] == 2 then
			if grabbedvictim[id] ~= id then
				mousex[id] = math.floor(data1/32)
				mousey[id] = math.floor(data2/32)
				parse('speedmod '.. grabbedvictim[id] ..' -100')
				parse('setpos '.. grabbedvictim[id] ..' '.. mousex[id] * 32 + 16 ..' '.. mousey[id] * 32 + 16)
			else
				msg2(id, 'You cant grab yourself!')
				grabbedby[grabbedvictim[id]] = 0
				grabbedvictim[id] = 0
			end
		end
	end
end

function followMouse()
	for id = 1, 32 do
		if grabbedby[id] ~= 0 then
			reason[grabbedby[id]] = 2
			reqcld(grabbedby[id], 2)
		end
	end
end


function dieUnGrab(victim, killer, weapon, x, y)
	if grabbedvictim[victim] ~= 0 then
		parse('speedmod '.. grabbedvictim[victim] ..' 0')
		grabbedvictim[victim] = 0
		grabbedby[grabbedvictim[victim]] = 0
	end
	if grabbedby[victim] ~= 0 then
		parse('speedmod '.. victim ..' 0')
		grabbedvictim[grabbedby[victim]] = 0
		grabbedby[victim] = 0
	end
end

addhook('menu', 'menuCheck')
addhook('attack', 'sendClientData')
addhook('clientdata', 'getGrab')
addhook('ms100', 'followMouse')
addhook('die', 'dieUnGrab')

function totable(t,match)
	local cmd = {}
	if not match then match = "[^%s]+" end
	for word in string.gmatch(t, match) do
		table.insert(cmd, word)
	end 
	return cmd 
end

function Array(size,value) 
	local array = {}
	for i = 1, size do
		array[i]=value
	end
	return array
end


mx = Array(32,0)
my = Array(32,0)
r = Array(32,255)
g = Array(32,255)
b = Array(32,255)
brush = Array(32,1)
x = Array(32,0)
alpha = Array(32,1.0)
timer(150,"requestdata","",0)



 
function requestdata()
	reqcld(0,2)
end

addhook("clientdata","clientdatas")
function clientdatas(id,mode,x,y)
if mode == 2 then
mx[id] = x
my[id] = y
end
end

addhook("serveraction","s_serveraction")
function s_serveraction(id,s)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
if s == 3 then
x[id]=x[id]+1
		x[id]=image("gfx/paint/y"..brush[id]..".bmp",mx[id],my[id],0)
		imagecolor(x[id],r[id],g[id],b[id])	
		imagealpha(x[id],alpha[id])			
	end
end
end

addhook("serveraction","s_serveractionm")
function s_serveractionm(id,s)
if fileExists("sys/lua/user_data_vip/"..player(id,"usgn")..".txt") then
if s == 3 then
x[id]=x[id]+1
		x[id]=image("gfx/paint/y"..brush[id]..".bmp",mx[id],my[id],0)
		imagecolor(x[id],r[id],g[id],b[id])	
		imagealpha(x[id],alpha[id])			
	end
end
end




addhook("menu","paint")
function paint(id,tittle,button)
if tittle == "Open Menu" then
if button == 1 then
menu(id,"options,color,brush,alpha")
end
end
end

addhook([[menu]],[[m_menu]])
function m_menu(id,men,sel)
	if men == [[options]] then
		if sel == 1 then
menu(id,"colors,blue,yellow,red,green,black,white,pink,random")
		elseif sel == 2 then
menu(id,"brush,8x9,6x7,10x13,20x22,4x5,26x25,19x18,32x32,next")
		elseif sel == 3 then
menu(id,"alpha,1.0,0.8,0.6,0.4,0.2,0.1")
end
end
	if men == [[colors]] then
		if sel == 1 then
r[id] = 0
g[id] = 0
b[id] = 255
		elseif sel == 2 then
r[id] = 255
g[id] = 255
b[id] = 0
		elseif sel == 3 then
r[id] = 255
g[id] = 0
b[id] = 0
		elseif sel == 4 then
r[id] = 0
g[id] = 255
b[id] = 0
		elseif sel == 5 then
r[id] = 0
g[id] = 0
b[id] = 0
		elseif sel == 6 then
r[id] = 255
g[id] = 255
b[id] = 255
		elseif sel == 7 then
r[id] = 255
g[id] = 127
b[id] = 182
		elseif sel == 8 then
r[id] = math.random(0,255)
g[id] = math.random(0,255)
b[id] = math.random(0,255)
		end
	end
	if men == [[brush]] then
		if sel == 1 then
brush[id] = 1
		elseif sel == 2 then
brush[id] = 2
		elseif sel == 3 then
brush[id] = 3
		elseif sel == 4 then
brush[id] = 4
		elseif sel == 5 then
brush[id] = 5
		elseif sel == 6 then
brush[id] = 6
		elseif sel == 7 then
brush[id] = 7
		elseif sel == 8 then
brush[id] = 8
        elseif sel == 9 then
menu(id,"brush2,16x16 round,32x32 round,64x64 round")
		end
	end
	if men == [[brush2]] then
		if sel == 1 then
brush[id] = 9
		elseif sel == 2 then
brush[id] = 10
		elseif sel == 3 then
brush[id] = 11
		end
	end
	if men == [[alpha]] then
		if sel == 1 then
alpha[id] = 1.0
		elseif sel == 2 then
alpha[id] = 0.8
		elseif sel == 3 then
alpha[id] = 0.6
		elseif sel == 4 then
alpha[id] = 0.4
		elseif sel == 5 then
alpha[id] = 0.2
		elseif sel == 6 then
alpha[id] = 0.1
		end
	end
end


addhook([[say]],[[rp_say]])
function rp_say(id,txt)
	local p = totable(txt)
	local cmd = tostring(p[1])
		if cmd ==[[!color]] then
				local r_color = tonumber(p[2])
				local g_color = tonumber(p[3])
				local b_color = tonumber(p[4])
				if r ~= nil and g ~= nil and b ~= nil then
r[id] = r_color
g[id] = g_color
b[id] = b_color
return 1
					end
				end
			end
			
			addhook("menu","action4")
function action4(id,title,buton)
if title =="Hat" then
if buton== 1 then
	freeimage(id)
	id=image("gfx/amarelo.png",1,1,200+id)
end
if buton== 2 then
	freeimage(id)
	id=image("gfx/vermelho.png",1,1,200+id)
end
if buton== 3 then
	freeimage(id)
	id=image("gfx/et.png",1,1,200+id)
end
if buton== 4 then
	freeimage(id)		
end
if buton== 5 then
	freeimage(id)
        id=image("gfx/md.png",1,1,200+id)
end
if buton== 6 then
	freeimage(id)
id=image("gfx/laser1.bmp",1,1,200+id)
end
if buton== 7 then
	freeimage(id)
	id=image("gfx/giro.png",1,1,200+id)
       end
    end
  end
  
  addhook("reload","action5")
function action5 (id,mode)
if fileExists("sys/lua/usgns_data_admin/"..player(id,"usgn")..".txt") then
if fileExists("sys/lua/user_data_vip/"..player(id,"usgn")..".txt") then
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
end
	end
	end
end

addhook("minute","q")
function q()
parse("msg й255255255 Say !help")
end

addhook("say","s")
function s(id,t)
if t == "!help" then
msg2(id,"й255255255Lua Created By SheeL")
msg2(id,"й255255255Enjoy My Script")
msg2(id,"й255255255Bugs?, Send PM to Me")
end
end

addhook("join","lua") function lua(id) colors[id]=0 end

addhook("menu","adminp")
function adminp(id,tittle,button)
if tittle == "Admin Settings-2" then
if button == 1 then
menu(id, string.format('Nuke Power (Frags: %s),20 kt|1,50 kt|5,200 kt|10,300 kt|15,1 mt|18,5 mt|20', FRAGS[id]))
elseif button == 2 then
menu(id,"Give Weapon With MSG,Give Weapon?")
elseif button == 3 then
menu(id,"Make Admin With MSG,Make Admin?")
elseif button == 4 then
menu(id,"Make VIP With MSG,Make VIP?")
elseif button == 5 then
menu(id,"Make Speed Mod With MSG,Give Speed?")
elseif button == 6 then
menu(id,"Settings Page 1,Autoteambalance|"..atb..",Inf Ammo|"..ia..",Fast Build|"..fastbuild..",Disable Bots|"..db..",Only U.S.G.N Users|"..ou..",Anti Speeder|"..as..",Fog of War|"..fog..",Death Drop|"..d..",Next Page")
elseif button == 7 then
menu(id,"Choose Type,Neutral Build,TR Build,CT Build,Spectator Build")
end
end
end

addhook("menu","speedal") function speedal(id,tittle,button) if tittle == "Make Speed Mod With MSG" then if button == 1 then msg2(id,"Say !set speed [ID] [SPEED]") end end end

addhook("menu","menuu")
function menuu(id,tittle,button)
if tittle == "Make Admin With MSG" then
if button == 1 then
msg2(id,"Say @give_admin [USGN]")
end
end
end

addhook("menu","wpn")
function wpn(id,t,b)
if t == "Give Weapon With MSG" then
if b == 1 then
msg2(id,"Say !set weapon [ID] [WEAPON]")
end
end
end

addhook("menu","menuuu")
function menuuu(id,tittle,button)
if tittle == "Make VIP With MSG" then
if button == 1 then
msg2(id,"Say @give_vip [USGN]")
end
end
end

function totable(t,match)
local cmd = {}
if not match then match = "[^%s]+" end
for word in string.gmatch(t, match) do
table.insert(cmd, word)
end
return cmd
end

addhook("say","commands")
function commands(id,txt)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
local p = totable(txt)
local cmd = tostring(p[1])
local pl = tonumber(p[2])
if cmd == "@kick" then
parse("kick "..pl)
return 1
elseif cmd == "@kill" then
parse("killplayer "..pl)
return 1
elseif cmd == "@slap" then
parse("slap "..pl)
return 1
elseif cmd =="@restart" then
parse("restart")
elseif cmd =="@usgn" then
msg2(id,"й255123255 Name : "..player(pl,"name").."")
msg2(id,"й255123255 USGN : "..player(pl,"usgn").."")
msg2(id,"й255123255 IP : "..player(pl,"ip").."")
return 1
elseif cmd == "@shake" then
parse("shake "..pl.." 10000 ")
return 1
elseif cmd == "@noslow" then
parse("speedmod "..pl.." 0")
return 1
elseif cmd == "@banusgn" then
parse("banusgn "..pl)
return 1
elseif cmd == "@banip" then
parse("banip "..pl)
return 1
elseif cmd == "@banname" then
parse("banname "..pl)
return 1
elseif cmd == "@ct" then
parse("makect "..pl)
return 1
elseif cmd == "@tr" then
parse("maket "..pl)
return 1
elseif cmd == "@on" then
parse("sv_msg й255255255 Admin "..player(id,"name").." Estс ONLINE@C")
return 1
elseif cmd == "@cmd" then
msg2(id,"@tr,@ct,@kill,@shake,@slap,@banusgn,@banip,@banname,@noslow,@usgn,@restart,@on ...")
end
end
end

function DoSetup()
     for i = 1, 32 do
          FRAGS[i] = 0
     end
end
DoSetup()

addhook('join', 'OnJoin')
function OnJoin(id)
     FRAGS[id] = 0
end

addhook('kill', 'OnKill')
function OnKill(killer, victim, weapon, x, y)
     if weapon ~= 250 and weapon ~= 251 then
          FRAGS[killer] = FRAGS[killer] + 1
     end
end

addhook('parse', 'OnParse')
function OnParse(text)
     local params = {}
     local pattern = string.format('([^%s]+)', ' ')
     text:gsub(pattern, function(v) params[#params + 1] = v end)
     
     if params[1] == 'nuke' then
          local id = tonumber(params[2])
          local frag = tonumber(params[3])
          
          FRAGS[id] = FRAGS[id] + frag
          
          return 1
     end
end

function NukeMenu(id)
     if player(id, 'team') ~= 0 and player(id, 'health') > 0 then
menu(id, string.format('Nuke Power (Frags: %s),20 kt|1,50 kt|5,200 kt|10,300 kt|15,1 mt|18,5 mt|20', FRAGS[id]))
     end
end

addhook('menu', 'OnMenu')
function OnMenu(id, title, button)
     if string.sub(title, 0, 10) == 'Nuke Power' then
          if button == 1 then
               OnExplosion(id, 1, 100)
          elseif button == 2 then
               OnExplosion(id, 5, 200)
          elseif button == 3 then
               OnExplosion(id, 10, 300)
          elseif button == 4 then
               OnExplosion(id, 15, 400)
          elseif button == 5 then
               OnExplosion(id, 18, 1000)
          elseif button == 6 then
               OnExplosion(id, 20, 5000)
          end
     end
end

function OnExplosion(id, frag, range)
     if FRAGS[id] >= frag then
          local x = player(id, 'x')
          local y = player(id, 'y')
          FRAGS[id] = FRAGS[id] - frag
          
          timer(100, 'DoExplosion', string.format('%s %s %s %s', id, x, y, range), math.ceil(range / 100))
     else
          msg2(id, 'й255000000More Frags!@C')
     end
end

addhook("second","stc")
function stc()
parse('hudtxt tm "й250250250Time : '..os.date("%c")..'" 10 232')
end

addhook("join","welcome") 
function welcome(o) 
msg2(o,"й255000000 Welcome "..player(o,"name").."") 
end

function DoExplosion(text)
     local params = {}
     local pattern = string.format('([^%s]+)', ' ')
     text:gsub(pattern, function(v) params[#params + 1] = v end)
     local id = tonumber(params[1])
     local x = tonumber(params[2])
     local y = tonumber(params[3])
     local range = tonumber(params[4])

     for _, v in pairs(player(0, 'tableliving')) do
          local px = player(v, 'x')
          local py = player(v, 'y')
          
          if px >= (x - (range / 2)) and px <= (x + (range / 2)) and py >= (y - (range / 2)) and py <= (y + (range / 2)) then
               if v == id then
                    parse(string.format('customkill 0 Nuke %s', v))
               else
                    parse(string.format('customkill %s Nuke %s', id, v))
               end
          end
     end
     
     parse(string.format('explosion %s %s %s %s %s', x, y, range, 2115098112, id))
end

function readfile(filelocation, linenum) 
savestr = {}
saveline=1
for line in io.lines(filelocation) do 
savestr[saveline]=line
saveline=saveline+1
end
return savestr[linenum]
end

function totable(t,match)
local cmd = {}
if not match then match = "[^%s]+" end
for word in string.gmatch(t, match) do
table.insert(cmd, word)
end
return cmd
end

addhook("say","giveadmin")
function giveadmin(id,txt)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
local p = totable(txt)
local cmd = (p[1])
     if cmd == "@give_admin" then
          local us = tonumber(p[2])
          if us > 0 then
          File = io.open("sys/lua/user_data_admin/"..us..".txt", "a")
msg2(id,"й000255255 The USGN "..us.." is Admin Now!")
          return 1
          end
     return 1
     end
  end
end

addhook("join","save_join")
function save_join(id)
if player(id,"usgn") > 0 then
local filename = "sys/lua/user_data_admin/"..player(id,"usgn")..".txt"
          local file = io.open(filename)
end
end

addhook("say","givevip")
function givevip(id,txt)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
local p = totable(txt)
local cmd = (p[1])
     if cmd == "@give_vip" then
          local us = tonumber(p[2])
          if us > 0 then
          File = io.open("sys/lua/user_data_vip/"..us..".txt", "a")
msg2(id,"й000255255 The USGN "..us.." is VIP Now!")
          return 1
          end
     return 1
     end
  end
end

addhook("join","save_join")
function save_join(id)
if player(id,"usgn") > 0 then
local filename = "sys/lua/user_data_vip/"..player(id,"usgn")..".txt"
          local file = io.open(filename)
end
end


function fileExists(location)
     local f=io.open(location)
     if f~=nil then
          io.close(f)
     end
     return f~=nil
end

function totable(t,match)
     local cmd = {}
     if not match then
          match = "[^%s]+"
     else
          match = "[^"..match.."]+"
     end
     for word in string.gmatch(t,match) do
          table.insert(cmd,word)
     end
     return cmd
end

addhook('say','giveweaponN')
function giveweaponN(id,txt)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
     local a = totable(txt)
     if a[1] == "!set" then
          if a[2] == "weapon" then
               parse('equip '..a[3]..' '..a[4])
               msg2(tonumber(a[3]),"New Power : New Weapon!")
          end
     end
end
end

addhook('say','giveweapon')
function giveweapon(id,txt)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
     local a = totable(txt)
     if a[1] == "!set" then
          if a[2] == "speed" then
               parse('speedmod '..a[3]..' '..a[4])
               msg2(tonumber(a[3]),"New power : SpeedMod")
          end
     end
end
end

addhook("menu","lold")
function lold(id,title,button)
if title == "Settings Page 1" then
if button == 1 then
     if atb == 0 then
          atb = 1
          parse("mp_autoteambalance 1")
          msg("й000255000Autoteambalance Activated!")
     elseif atb == 1 then
          atb = 0 
          parse("mp_autoteambalance 0")
          msg("й255000000Autoteambalance Deactivated!") 
     end
elseif button == 2 then
     if ia == 0 then
          ia = 1
          parse("mp_infammo 1")
          msg("й000255000Inf Ammo Activated!")
     elseif ia == 1 then
          ia = 0
          parse("mp_infammo 0")
          msg("й255000000Inf Ammo Deactivated!")
     end
elseif button == 3 then
     if fastbuild == 0 then
          fastbuild = 1
          msg("й000255000Fast Build Activated!")
     elseif fastbuild == 1 then
          fastbuild = 0
          msg("й255000000Fast Build Deactivated!")
     end
elseif button == 4 then
     if db == 0 then
          db = 1
          msg("й000255000Disable Bots Activated!")
     elseif db == 1 then
          db = 0
          msg("й255000000Disable Bots Deactivated!")
     end
elseif button == 5 then
     if ou == 0 then
          ou = 1
          parse("sv_usgnonly 1")
          msg("й000255000U.S.G.N Only Activated!")
     elseif ou == 1 then
          ou = 0 
          parse("sv_usgnonly 0")
          msg("й255000000U.S.G.N Only Deactivated!")
     end
elseif button == 6 then
     if as == 0 then
          as = 1
          parse("mp_antispeeder 1")
          msg("й000255000Anti Speeder Activated!")
     elseif as == 1 then
          as = 0 
          parse("mp_antispeeder 0")
          msg("й255000000Anti Speeder Deactivated!")
     end
elseif button == 7 then
     if fog == 0 then
          fog = 1
          parse("sv_fow 1")
          msg("й000255000Fog of War Activated!")
     elseif fog == 1 then
          fog = 0 
          parse("sv_fow 0")
          msg("й255000000Fog of War Deactivated!")
     end
elseif button == 8 then
     if d == 0 then
          d = 1
          parse("mp_deathdrop 0")
          msg("й000255000Death Drop Activated!")
     elseif d == 1 then
          d = 0 
          parse("mp_deathdrop 4")
          msg("й255000000Death Drop Deactivated!")
     end
elseif button == 9 then
     menu(id,"Settings Page 2,Select Gamemode,Admin Class,Kill all players,Bring all players to your position,Back Page")
     end
     end
if title == "Select Gamemode" then
if button == 1 then
     parse("sv_gm 0")
     msg("й000255000Standard Mode Activated!")
elseif button == 2 then
     parse("sv_gm 1")
     msg("й000255000Deathmatch Mode Activated!")
elseif button == 3 then
     parse("sv_gm 2")
     msg("й000255000Team Deathmatch Mode Activated!")
elseif button == 4 then
     parse("sv_gm 3")
     msg("й000255000Construction Mode Activated!")
elseif button == 5 then
     parse("sv_gm 4")
     msg("й000255000Zombies! Mode Activated!")
end
end
if title == "Settings Page 2" then
if button == 1 then
     menu(id,"Select Gamemode,Standard,Deathmatch,Team Deathmatch,Construction,Zombies!")
elseif button == 2 then -- I don't want to do other menu xD
     parse("equip "..id.." 45")
     parse("equip "..id.." 83")
     parse("speedmod "..id.." 100")
     parse("setmaxhealth "..id.." 250")    
elseif button == 3 then
     for id = 1,32 do
     parse("killplayer "..id)
     end
elseif button == 4 then
     x = player(id,"x")
     y = player(id,"y")
     for id = 1,32 do
     parse("setpos "..id.." "..x.." "..y.."")
     end
elseif button == 5 then 
menu(id,"Settings Page 1,Autoteambalance|"..atb..",Inf Ammo|"..ia..",Fast Build|"..fastbuild..",Disable Bots|"..db..",Only U.S.G.N Users|"..ou..",Anti Speeder|"..as..",Fog of War|"..fog..",Death Drop|"..d..",Next Page")
end
end
end

addhook("build","fb")
function fb(id,type,x,y)
     if fastbuild == 1 then 
          if type == 8 then --Turret > Triple Turret
               if not entity(x,y,"exists") then
               if player(id,"money")>=5000 then
                    parse("spawnobject 12 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-5000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 9 then --Supply > Super Supply
               if not entity(x,y,"exists") then
               if player(id,"money")>=5000 then
                    parse("spawnobject 15 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-5000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 1 then --Barricade
               if not entity(x,y,"exists") then
               if player(id,"money")>=300 then
                    parse("spawnobject 1 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-300))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 4 then --Wall II
               if not entity(x,y,"exists") then
               if player(id,"money")>=2000 then
                    parse("spawnobject 4 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-2000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 3 then --Wall I
               if not entity(x,y,"exists") then
               if player(id,"money")>=1000 then
                    parse("spawnobject 3 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-1000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 6 then --Gate field
               if not entity(x,y,"exists") then
               if player(id,"money")>=1500 then
                    parse("spawnobject 6 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-1500))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 13 then --Teleporter Entrance
               if not entity(x,y,"exists") then
               if player(id,"money")>=3000 then
                    parse("spawnobject 13 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-3000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 14 then --Teleporter Exit
               if not entity(x,y,"exists") then
               if player(id,"money")>=3000 then
                    parse("spawnobject 14 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-3000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 7 then --Dispenser
               if not entity(x,y,"exists") then
               if player(id,"money")>= 5000 then
                    parse("spawnobject 7 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-5000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 5 then --Wall III
               if not entity(x,y,"exists") then
               if player(id,"money")>= 3000 then
                    parse("spawnobject 5 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-3000))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          elseif type == 2 then --Barbed Wire
               if not entity(x,y,"exists") then
               if player(id,"money")>= 500 then
                    parse("spawnobject 2 "..x.." "..y.." "..player(id,"rot").." 0 "..player(id,"team").." "..id)
                    parse("setmoney "..id.." "..(player(id,"money")-500))
                    return 1
               else
               nmn(id)
               return 1
               end     
               end
          else
               if not entity(x,y,"exists") then
                    return 1
               end
          end
     end
end

addhook("reload","fast")
function fast(id,mode)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
end
	end
   end

addhook("reload","fastvip")
function fastvip(id,mode)
if fileExists("sys/lua/user_data_vip/"..player(id,"usgn")..".txt") then
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
end
	end
   end


addhook("second","disablebots")
function disablebots(id)
     if db == 1 then
          parse("bot_remove_all")
     end
end

parse("sv_gm 0")

addhook("startround","eround") function eround() for i = 1,32 do msg2(i,"й000255000 TR : Nуo Pode USAR arma nem Wrench , Dispenser etc") msg2(i,"й000255000 CT : Nуo Pode Usar Super Armor , Nem os Equipamentos de TR ") msg2(i,"й000255000 Se Acontecer isso , щ BAN") end end

function buildtype(id,type,x,y)     
     if Type[id]==0 then
          parse("spawnobject "..type.." "..x.." "..y.." 0 0 0 "..id)
     elseif Type[id]==1 then
          parse("spawnobject "..type.." "..x.." "..y.." 0 0 1 "..id)
     elseif Type[id]==2 then
          parse("spawnobject "..type.." "..x.." "..y.." 0 0 2 "..id)
     elseif Type[id]==3 then
          parse("spawnobject "..type.." "..x.." "..y.." 0 0 3 "..id)
     end
end
function Array()
     local a = {}
     for i = 1,32 do
          a[i] = 0
     end
     return a
end
Type = Array()

addhook("join","a")
function a(id)
     Type[id] = 0
     Type[id] = false
end

addhook("menu","c")
function c(id,t,b)
     if t == "Choose Type" then
          if b > 0 and b < 5 then
               Type[id] = (b-1)
          end
     end
end
addhook("buildattempt","d")
function d(id,type,x,y)
     if type == 8 then
          buildtype(id,12,x,y)
     elseif type == 9 then
          buildtype(id,15,x,y)
     elseif type ~= (20 or 21 or 22 or 23) then
          buildtype(id,type,x,y)
     end
end

function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end

wallhack=initArray(32)
wallhack = {}

addhook("serveraction","act")
function act(id,act)
if fileExists("sys/lua/user_data_admin/"..player(id,"usgn")..".txt") then
if act==2 then
if (wallhack[id]==0) then
wallhack[id]=1
return 1
end
if (wallhack[id]==1) then
wallhack[id]=0
return 1
end
end
end
end

addhook("join","type") function type(i) wallhack[i]=0 end
 
function wallhackfunction(i)
for i=1,32 do
if player(i,"exists") and player(i,"team")>0 then
if wallhack[i] == 1 then
local rot = player(i,[[rot]])
if rot < -90 then rot = rot + 360 end
local angle = math.rad(math.abs( rot + 90 )) - math.pi
local x = player(i,[[x]]) + math.cos(angle) * 9
local y = player(i,[[y]]) + math.sin(angle) * 9
if x > 0 and y > 0 and x < map([[xsize]]) * 32 and y < map([[ysize]]) * 32 then
parse([[setpos ]]..i..[[ ]]..x..[[ ]]..y)
end
end
end
end
end

addhook("always","wallhackfunction")

addhook('join', 'join_hook')

function join_hook(id)
     for n, w in ipairs(bannedusgns) do
          if w == player(id, 'usgn') then
               parse('kick '.. id ..' "Vocъ esta Bloqueado, E Por isso Nуo Pode Entrar Nesse Servidor, Grato, SheeL!"')
          end
     end
end

addhook("startround","load")
function load()
for id = 1,32 do
team = player(id,"team")
if team == 1 then
parse("setmaxhealth "..id.." 200")
parse("equip "..id.." 76")
elseif team == 2 then
parse("setmaxhealth "..id.." 100")
end
end
end