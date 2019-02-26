--------------------------------------------------------
--------------------------------------------------------
--             OFFICIAL CLAN PANEL v1.0               --                
--              BY CS2D Script's [NoD_]               --          
--       ACESSE: www.cs2dscripts.blogspot.com         --
--                  Apoio: CS2DOT                     --
--            ACESSE: www.cs2dot.com.br               --
--              AGUARDE ATUALIZAÇÕES!                 --
--------------------------------------------------------
--------------------------------------------------------


-- [[ Atenção ]] : Todo o conteúdo aqui presente é de totalmente autoria do player NoD_ (#80692) ~> www.cs2dscripts.blogspot.com .
-- Qualquer modificação e/ou copia de algum fragmento sem a autorização do mesmo está sujeito a ser punido pela lei e também sofrerá punições impostas pela UnrealSoftware.
-- O script está legalmente protegido pela CC (Creative Commons) e pela UnrealSoftware.

-- [[ This work is licensed under the Creative Commons Atribuição - NãoComercial - SemDerivados 3.0 Não Adaptada License.
-- To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/3.0/. ]]


--------------------------------------------
--          DEFINIÇÕES DO SERVER          --
--------------------------------------------

-- nome do clan:
clan_name = '4ever Team!'

-- usgn dos membros e admins do clan:
list_adm = {38235,19603,66706,54787,75905,44209,18908,76584,13711,65710} -- substitua os numeros pela usgn dos ADMs --
lis_mbr = {00000,00000,00000} -- substitua os numeros pela usgn dos MBRs --

-- senha do server:
senha = 157


--------------------------------------------
--              INIT ARRAY                --
--------------------------------------------

function initArray(m)
local array = {}
	for i = 1, m do array[i]=0
	end
return array
end


--------------------------------------------
--               HOOKS                    --
--------------------------------------------

addhook('say','says')
addhook("serveraction","rs")
addhook("say","cmds")
addhook("minute","help")
addhook("say","ver")
addhook("team","lol")
addhook("walkover","knife")
addhook("join","welc")
addhook("startround","ofclan")
addhook("movetile","antihack")
addhook("second","contagem")
addhook("hit","onhit")
addhook("startround","onstartround")


--------------------------------------------
--                CONFIG                  --
--------------------------------------------

-- sv config
sayscript = 'on'
apenas_knf = 0
lock_ct = {}
lock_tt = {}
showtime = {}
level=initArray(32)
primeirokill = 0
doistile=initArray(32)
tempoa=initArray(32)

-- cores say do cargos
adm_color = '999999999'
mbr_color = '000222000'


--------------------------------------------
--        LOCK TEAMS FUNCTION             --
--------------------------------------------

function lol(id,team)
if team == 1 then
if lock_tt == 1 then
msg2(id,"©255000000Ninguem pode ir TR!")
return 1
end 
elseif team == 2 then
if lock_ct == 1 then
msg2(id,"©255000000Ninguem pode ir CT!")
return 1
end
end
end


---------------------------------------------
--                WALKOVER                 --
---------------------------------------------

function knife(id,iid,type,ain,a,mode)
if apenas_knf == 1 then
return 1
else
return 0
end
end



	
---------------------------------------------
--              RESET SCORE                --
---------------------------------------------

function rs(p,act)
     if act == 3 then
          if player(p,'deaths')>0 then
               parse("setscore "..p.." 0")
               parse("setdeaths "..p.." 0")
               msg(player(p,"name").." resetou o score")
			   msg2(p,"©"..io..""..i..""..o..""..x..""..k..""..q.."@C")
			   msg2(p,'©255000255Acesse: www.cs2dscripts.blogspot.com')
			   msg2(p,'©170000255Acesse: www.cs2dot.com.br')
          else
               msg2(p,'Você precisa ter 1 morte para resetar seu score!')
          end
          return 1
     end
end


---------------------------------------------
--            WELCOME MESSAGE              --
---------------------------------------------

function welc(id)
if list_adm[id] then
msg2(id,"©255000255Bem Vindo ao » "..game("sv_name").."")
msg2(id,"©255255255 Sua conta está definida como:")
msg2(id,"©000255000                                              Administrador")
elseif list_mbr[id] then
msg2(id,"©255000255Bem Vindo ao » "..game("sv_name").."")
msg2(id,"©255255255 Sua conta está definida como:")
msg2(id,"©000255000                                              Membro")
else
msg2(id,"©255000255Bem Vindo ao » "..game("sv_name").."")
msg2(id,"©255255255 Sua conta está definida como:")
msg2(id,"©000255000                                              Visitante")
end
end


---------------------------------------------
--                 COMANDOS                --
---------------------------------------------


function cmds(id,txt)

for _, usgn in ipairs(list_adm) do
	if player(id,'usgn') == usgn then
		
		if txt == "@rr" then
			parse("restart")
				return 0
				end
				
		if txt == "@bot ct" then
			parse("bot_add_ct")
				end
				
		if txt == "@bot tr" then
			parse("bot_add_t")
				end
				
		if txt == "@txt" then
			parse("hudtxt 41 \"©000255000www.cs2dot.com.br\" 320 10 1")
			parse("hudtxt 40 \"©000128255Registre-se na CS2DOT!\" 320 26 1")
			end
						
		if txt == "@atualizar" then
			mapa = map("name")
				parse("map "..mapa)		
				end
		
		if txt == "@pw on" then
			parse("sv_password "..senha.."")
				msg("©255100000[Aviso] "..player(id,"name").." Trancou O Servidor com a Senha: "..senha)
				end
		
		if txt == "@pw off" then
			parse("sv_password ")
				msg("©255100000[Aviso] "..player(id,"name").." Destrancou O Servidor!")
				end
		
		if txt == "@ajuda" then
			msg2(id,"©255000000-------------------------AJUDA-----------------------------")
		    msg2(id,"©255100000                                 >> Comandos:")
			msg2(id,"©000255000@rr                                @mct <id>            @lockct")
			msg2(id,"©000255000@bot ct                          @mtr <id>            @locktr")
			msg2(id,"©000255000@bot tr                           @ms <id>            @lockall")
			msg2(id,"©000255000@atualizar                     @speed             @unlockall")
			msg2(id,"©000255000@kick <id>                     @virar                 @say on / off")
			msg2(id,"©000255000@ban <id>                     @dano <dano>          @knf on / off")
			msg2(id,"©000255000@msall                         @pw on / off")
			msg2(id,"©255100000                                 >> Punições:")
			msg2(id,"©000255000@slap <id>                     @freeze all          @normal all")
			msg2(id,"©000255000@shake <id>                   @wall <id>          @kill all")
			msg2(id,"©000255000@slow <id>                     @flash <id>         @kill <id>")
			msg2(id,"©000255000@freeze <id>                  @normal <id>       @preso <id>")
			msg2(id,"©255000000----------------------------------------------------------------")
				end    
			  
		if txt == "@4fun" then 
			parse("sv_fow 0 ")
			parse("sv_friendlyfire 0 ")
            parse("mp_roundtime 2 ")
            parse("mp_freezetime 0 ")
            parse("sv_password ")
            parse("sv_specmode 1 ")
            parse("mp_timelimit 30 ")
            parse("mp_roundtime 2 ")
            parse("mp_buytime 0.25 ")
            parse("mp_dmgfactor 9999 ")
            parse("mp_startmoney 16000 ")
            parse("mp_roundtime 2 ")
            parse("mp_tkpunish 1 ")
            parse("mp_idlekick 01")
            parse("mp_autoteambalance 1 ")
            parse("stats 1 ")
            parse("stats_rank 1 ")
            parse("sv_restart 2 ")
  					end	
			  
		if txt == "@flare" then 
			parse("equip 1 54")
			parse("equip 2 54")
            parse("equip 3 54")
            parse("equip 4 54")
            parse("equip 5 54")
            parse("equip 6 54")
            parse("equip 7 54")
            parse("equip 8 54")
            parse("equip 9 54")
            parse("equip 10 54")
            parse("equip 11 54")
            parse("equip 12 54")
            parse("equip 13 54")
            parse("equip 14 54")
            parse("equip 15 54")
            parse("equip 16 54")
            parse("equip 17 54")
  					end	
			  
		if txt == "@md3" then 
			parse("equip 1 54")
			parse("equip 2 54")
            parse("equip 3 54")
            parse("equip 4 54")
            parse("equip 5 54")
            parse("equip 6 54")
            parse("equip 7 54")
            parse("equip 8 54")
            parse("equip 9 54")
            parse("equip 10 54")
            parse("equip 11 54")
            parse("equip 12 54")
            parse("equip 13 54")
            parse("equip 14 54")
            parse("equip 15 54")
            parse("equip 16 54")
            parse("equip 17 54")
			parse("equip 1 3")
			parse("equip 2 3")
            parse("equip 3 3")
            parse("equip 4 3")
            parse("equip 5 3")
            parse("equip 6 3")
            parse("equip 7 3")
            parse("equip 8 3")
            parse("equip 9 3")
            parse("equip 10 3")
            parse("equip 11 3")
            parse("equip 12 3")
            parse("equip 13 3")
            parse("equip 14 3")
            parse("equip 15 3")
            parse("equip 16 3")
            parse("equip 17 3")
            parse("sv_msg MD3 SÓ USAR DEAGLE E FLARE, USAR AWP = GG@C")
            parse("sv_msg MD3 SÓ USAR DEAGLE E FLARE, USAR AWP = GG@C")
            parse("sv_msg MD3 SÓ USAR DEAGLE E FLARE, USAR AWP = GG@C")
			end	
																				
		if txt == '@lockct' then
			lock_ct=1
				msg("©255000000Ninguém pode ir CT!")
				end
				
		if txt == '@locktr' then
			lock_tt=1
				msg("©255000000Ninguém pode ir TR!")
				end
				
		if txt == '@lockall' then
			lock_ct=1
			lock_tt=1
				msg("©255000000Ninguém pode trocar de Time!")
				end
				
		if txt == '@unlockall' then
			lock_ct=0
			lock_tt=0
				msg("©255000000Troca de Time Liberado!")
				end			
				
		if txt == '@say off' then
			if sayscript == 'on' then
				sayscript = 'off'
			elseif sayscript == 'off' then
					end
						end
						
		if txt == '@say on' then
			if sayscript == 'off' then
				sayscript = 'on'
			elseif sayscript == 'on' then
					end
						end					
						
		if txt == "@knf on" and apenas_knf == 0 then
			apenas_knf = 1
				msg("©000255000"..player(id,"name").." Ativou o Modo Apenas Knife!")
				msg("©255255255Knife Mode: Ativado@C")
			for todosP = 1,32 do
				parse("strip "..todosP.." ")
					return 1
						end
							end

		if txt == "@knf off" and apenas_knf == 1 then
			apenas_knf = 0
				msg("©255000000"..player(id,"name").." Desativou o Modo Apenas Knife!")
					return 1
						end
						
	for id = 0,1000 do
	
			if txt == "@mix" then 
			parse("sv_fow 1 ")
			parse("sv_friendlyfire 1 ")
            parse("mp_roundtime 2 ")
            parse("mp_freezetime 7 ")
            parse("sv_password mix")
            parse("sv_specmode 2 ")
            parse("mp_timelimit 0 ")
            parse("mp_damagefactor 1.0 ")
            parse("mp_roundtime 2 ")
            parse("mp_buytime 0.25 ")
            parse("mp_startmoney 800 ")
            parse("mp_roundtime 2 ")
            parse("mp_tkpunish 10 ")
            parse("mp_idlekick 0 ")
            parse("mp_autoteambalance 0 ")
            parse("stats 0 ")
            parse("stats_rank 0 ")
            parse("sv_restart 2 ")
            parse("makespec "..id)
  					end			
	
		if txt == "@kick "..id.."" then
			parse("kick "..id)
				end
				
		if txt == "@ban "..id.."" then
			parse("banip "..id)
			parse("banname "..id)
			parse("banusgn "..id)
				end
				
		if txt == "@msall" then
			if player(id,"exists") then
			parse("makespec "..id)
				end
				end
				
		if txt == "@mct "..id.."" then
			parse("makect "..id)
				end
		
		if txt == "@mtr "..id.."" then
			parse("maket "..id)
				end	
				
		if txt == "@ms "..id..""then
			parse("makespec "..id)
				end
				     		
		if txt == "@virar" then
			if player(id,"team") == 1 then
				parse("makect "..id)
			elseif player(id,"team") == 2 then
				parse("maket "..id)
					end
						end		
				
		if txt == "@dano "..id.."" then
			parse("mp_damagefactor "..id)
				end		
				
		if txt == "@speed "..id.."" then
			parse("speedmod "..id.." " ..100)
				end
					
		-- puniçoes:
		
		if txt == "@slap "..id.."" then
			parse("slap "..id.."")
				end
				
		if txt == "@shake "..id.."" then
			parse("shake "..id.." "..1000)
				end
				
		if txt == "@slow "..id.."" then	
			parse("speedmod "..id.." -20")
				end
				
		if txt == "@freeze "..id.."" then
			parse("speedmod "..id.." -30")
				end
				
		if txt == "@freeze all" then
			parse("speedmod "..id.." -30") 
				end
								
		if txt == "@wall "..id.."" then
			parse('spawnobject 5 '..player(id,"tilex")..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
				end
				
		if txt == "@flash "..id.."" then
			parse('flashplayer '..id..' 100')
				end
				
		if txt == "@normal all" then
			parse("speedmod "..id.." 1")
				end
				
		if txt == "@normal "..id.."" then
			parse('speedmod '..id..' 1')
				end
			
		if txt == "@kill all" then
			parse('customkill 0 Infarto '..id..'')
				end
				
		if txt == "@kill "..id.."" then
			parse("killplayer "..id)
				end		
				
		if txt == "@preso "..id.."" then
				showtime[id] = 60
			parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..player(id,"tilex")..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")-1)..' '..player(id,"tiley")..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")-1)..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..(player(id,"tiley")-1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")-1)..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
			parse('spawnobject 3 '..(player(id,"tilex")+1)..' '..(player(id,"tiley")+1)..' 1 1 '..player(id,"team")..' '..id)
				end
					
					end -- for id --
					
	end -- if player --
	end -- for _, usgn --
	end -- function --
	

----------------------------------------------
--            MENSAGEM AJUDA                --
----------------------------------------------

function help()
msg("©111222111Para Resetar Score Aperte [F4] !")
msg("©255100000Para Ver a USGN de um Jogador Digite !usgn <id>")
msg("©255100000Esqueceu seus comandos ADM? Digite @ajuda")
end


----------------------------------------------
--           VERIFICADOR DE USGNs           --
----------------------------------------------


	function ver(id,txt)

for usg = 1,32 do
	if txt == "@usgn "..usg.."" then
		if player(usg,"usgn") > 0 then
	msg("©000255255"..player(usg,"name").." = "..player(usg,"usgn").."")
		else
	msg("©000255255"..player(usg,"name").." Não Esta Logado Em Nenhuma Conta!")
		end -- if player --
			end -- if txt --
				end -- for usg --
	end -- function --

parse("hudtxt 41 \"©000255000www.cs2dot.com.br\" 320 10 1")
parse("hudtxt 40 \"©000128255"..clan_name.."\" 320 26 1")



----------------------------------------------
--        KILL SOUNDS + NORMAL MSGs         --
----------------------------------------------

if sample==nil then sample={} end
sample.ut={}

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


addhook("startround","sample.ut.startround")
function sample.ut.startround()
	sample.ut.fblood=0
end
q = "pt's"
addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
	if (os.clock()-sample.ut.timer[killer])>16 then
		sample.ut.level[killer]=0;
	end

	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level

	sample.ut.timer[killer]=os.clock()

	if (sample.ut.fblood==0) then
		sample.ut.fblood=1
		parse("sv_sound2 "..killer.." NoD/FIRSTKILL.wav");
	end

		if (level==1) then

		elseif (level==2) then
			parse("sv_sound2 "..killer.." NoD/DOUBLEKILL.wav");

		elseif (level==3) then
			parse("sv_sound2 "..killer.." NoD/MULTIKILL.wav")

		elseif (level==4) then
			parse("sv_sound2 "..killer.." NoD/ULTRAKILL.wav")

		elseif (level==5) then
			parse("sv_sound2 "..killer.." NoD/FANTASTIC.wav")
		else
			parse("sv_sound2 "..killer.." NoD/UNBELIEVABLE.wav")
		end
	end

pival = math.pi / 180
extraarmored = 12
extranoarmored = 25



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
end


function hskill(victim,killer)
	parse("customkill "..killer.." (Headshot)"..itemtype(player(killer,"weapontype"),"name").." "..victim)
	parse("sv_sound2 "..killer.." NoD/HEADSHOT.wav")
end


addhook("minute","save_minute")
function save_minute()
	msg("©000255000Registre-se na CS2DOT!")
	msg("©000255000www.cs2dot.com.br")
	msg("©000255000Visite nossos servidores!")
end