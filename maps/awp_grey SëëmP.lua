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

-- //

FUND = {86035}
ADM = {86035}
MOD = {xxxxx}
MBR = {xxxxx}

-- //

cmbr="000172255"
cmod="000128000"
cadm="255000000"
cfund="255255255"

-- //

joinmsg = "off"			
resetsys = "on"			
placarsys = "off"
sayscript = "on"		
-- //

tagadm="AÐM"
tagmod="MØÐ"
tagmbr="MßR"
tagfund="LïÑëUp"

-- //

joinmsg = "off"			
resetsys = "on"			
placarsys = "off"
sayscript = "on"		
-- //

tagadm="AÐM"
tagmod="MØÐ"
tagmbr="MßR"
tagfund="AÐM¡Ñ"
-- //

clanname="Legender"
scriptname="Nø ¢läñ"

-- //

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
	msg("©"..cfund..""..player(id,"name")..": "..txt)
	return 1
	end
  if funAdm(id) then
	msg("©"..cadm..""..player(id,"name")..": "..txt)
	return 1
	end
  if funMod(id) then
	msg("©"..cmod..""..player(id,"name")..": "..txt)
	return 1
	end
  if funMbr(id) then
	msg("©"..cmbr..""..player(id,"name").." //MBR: "..txt)
	return 1
end
end
end



function clan_direitos(id,txt)
	if funMod(id) or funAdm(id) or funFund(id) then
	if (txt=="!allspec") or (txt=="!as") then
	for todos = 1,32 do
	parse("makespec "..todos)
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) or funMbr(id) then
	if (txt=="!rr") or (txt=="!RR") then
	parse("restart")
	end
	end
end


	function direitos(id, txt)
	if funMod(id) or funAdm(id) or funFund(id) or funMbr(id) then
	if txt:lower():sub(1, 5) == "!kick" then
	local numid = tonumber(txt:sub(6))
	if player(numid, "exists") then
	parse("kick " .. numid)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 3) == "!mt" then
	local pl1 = tonumber(txt:sub(4))
	if player(pl1, "exists") then
	parse("maket " .. pl1)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 4) == "!mct" then
	local pl2 = tonumber(txt:sub(5))
	if player(pl2, "exists") then
	parse("makect " .. pl2)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funFund(id) then
	if txt:lower():sub(1, 3) == "!ms" then
	local pl3 = tonumber(txt:sub(4))
	if player(pl3, "exists") then
	parse("makespec " .. pl3)
	return 1
	end
	end
	end
	if funMod(id) or funAdm(id) or funMbr(id) or funFund(id) then
	if txt:lower():sub(1, 5) == "!kill" then
	local killid = tonumber(txt:sub(6))
	if player(killid, "exists") then
	parse("killplayer " .. killid)
	return 1
	end
	end
	end	
	end
	
	-- //
	
	svstatus = "Øficial"
addhook("second","Lsvname")
function Lsvname(id)
parse("hudtxt 16 \"©000255000"..svstatus.."\" 320 10 1")
parse("hudtxt 15 \"©255255255Legender Clan "..svstatus.."\" 320 26 1")
end

-- //

function svjoin(id)
	if joinmsg=="on" then
	parse("sv_msg2 "..id.." ©255159241Bem-Vindo ao Clan "..clanname)
	parse("sv_msg2 "..id.." ©255159241Bom jogo "..scrpitname)
	end
	end
	
-- //
	
addhook("say","reset")
function reset(id,txt)
  if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©000255000Score Resetado!")
          end
  end 
	
-- //

KNFmode = 0
function knf_mode(id,txt)
if funFund(id) or funAdm(id) then
if txt == "@knf on" then
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
if txt == "@knf off" then
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
-- //

ddhook("join","contajoin")
function contajoin(id)
if funFund(id) then
msg2(id,"©255255255 Sua conta está definida como: LineUp")
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

-- //

ddhook("kill","_kill")
function _kill(killer,victim,weapon,x,y)     
     if math.abs(player(killer,"x")-x)>320 or math.abs(player(killer,"y")-y)>240 then
          msg("©230230230 "..player(killer,"name").." make a Pesked!@C")
     end
end

-- //

function autotext()
     secs = secs + 1
     if secs >= 180 then
          msg("©255255255Bom jogo a todos!")
          secs = 0
     end
end

-- //

parse("sv_password")

svpw = 0
addhook("say","pwsay")
function pwsay(id,txt)
if funFund(id) or funAdm(id) then
		if txt=="!pw on" then
		if svpw==0 then
	parse("sv_password lgd")
	msg("©255159241 Servidor com senha Padrão!@C")
	svpw = 1
	elseif svpw==1 then
	msg2(id,"©255000000 Servidor já está com senha@C")
		end
		end

		if txt=="!pw off" then
		if svpw==1 then
	parse("sv_password")
	msg("©255159241 Servidor Aberto ao público.@C")
	svpw = 0
	elseif svpw==0 then
	msg2(id,"©255000000 Servidor não está com senha@C")
		end
		end
end
end

-- //

addhook("say","sayscriptstate")
function sayscriptstate(id,txt)
if funFund(id) then
	if txt=="!say off" then
		if sayscript=="on" then
		sayscript = "off"
		elseif sayscript=="off" then
		msg2(id,"©255255255Say Script já está desativado.@C")
		end
		end
	if txt=="!say on" then
		if sayscript=="off" then
		sayscript = "on"
		elseif sayscript=="on" then
		msg2(id,"©255255255Say Script já está ativado.@C")
		end
		end
end
end

--//

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
	parse("msg ©255127039    ") --Sorry for SPAM :B
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
	parse("msg ©078122049"..player(killer,"name").. " Deu um lindo HeaDShooTKiiL @C")	
end
