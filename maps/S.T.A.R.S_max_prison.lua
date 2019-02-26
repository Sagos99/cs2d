adon = {28833,45813} --[[adicionador de usgn para sline ]]--
sline = {28833,89067,45813,88946,89367} -- [[ Aqui , Colocar a USGN dos Sline e Script Sejeito a Modificiaçoes ]] --


prison = {}
prison.tazer = {}
prison.tazer.onehit = {}
prison.tazer.noenergyshot = {}
prison.tazer.len = 10
prison.tazer.left = {}
prison.teazed = {}
prison.teaz_time = 5
prison.temp_weapon = {}
prison.strip_search = {}
prison.strip_search.timer = {}
prison.VERSION = "0.0.0.1"

parse("mp_wpndmg elite 15")

addhook("spawn","prison_mode_spawn")
function prison_mode_spawn(id)
prison.tazer.onehit[id] = true
prison.tazer.noenergyshot[id] = false
prison.teazed[id] = 0
prison.tazer.left[id] = 5
prison.strip_search.timer[id] = 3
parse("hudtxt2 "..id.." 0 \"tazer power: "..prison.tazer.left[id].."%\" 10 125 0")
end

addhook("second","prison_mode_second")
function prison_mode_second()
i = 0
while (i < 32) do
i = i + 1
if player(i,"exists") and player(i,"health") > 0 then
if prison.tazer.left[i] < 100 then
prison.tazer.left[i] = prison.tazer.left[i] + 5
parse("hudtxt2 "..i.." 0 \"tazer power: "..prison.tazer.left[i].."%\" 10 125 0")
end
prison.strip_search.timer[i] = prison.strip_search.timer[i] - 1
if prison.teazed[i] > 0 then
prison.teazed[i] = prison.teazed[i] - 1
if prison.teazed[i] == 0 then
parse("speedmod "..i.." 0")

temp_wep = prison.temp_weapon[i]
ii = 0
while (ii < #temp_wep) do
ii = ii + 1
parse("equip "..i.." "..temp_wep[ii].."")
end

msg2(i,"the teazer affect disappered")

end
end
end
end
end

addhook("hit","prison_mode_hit")
function prison_mode_hit(id,source,weapon,hpdmg,apdmg)
if weapon == 5 then
if (player(id,"team") == player(source,"team")) == false then
if prison.tazer.onehit[source] == true then
prison.tazer.onehit[source] = false
if prison.teazed[id] == 0 then prison.temp_weapon[id] = playerweapons(id); end
prison.teazed[id] = prison.teaz_time
parse("speedmod "..id.." -100")
parse("strip "..id.." 0")
msg2(id,"you got tazed by "..player(source,"name").."")
msg2(source,"you tazed "..player(id,"name").."")
parse("effect \"flare\" "..player(id,"x").." "..player(id,"y").." 1 1 0 50 255")
end
if prison.tazer.noenergyshot[source] then
return 0
else
return 1
end
end
return 1
end
end

addhook("attack","prison_mode_attack",1)
function prison_mode_attack(id)
if player(id,"weapon") == 5 then
if prison.tazer.left[id] >= 25 then
prison.tazer.onehit[id] = true
prison.tazer.noenergyshot[id] = false
prison.tazer.left[id] = prison.tazer.left[id] - 25
parse("hudtxt2 "..id.." 0 \"tazer power: "..prison.tazer.left[id].."%\" 10 125 0")
else
msg2(id,"not enough power")
prison.tazer.noenergyshot[id] = true
end
end
end

addhook("serveraction","prison_mode_serveraction")
function prison_mode_serveraction(id,action)
if action == 1 then
if player(id,"team") == 2 then
if prison.strip_search.timer[id] <= 0 then
prison.strip_search.timer[id] = 3
id_scan = 0
dist = 32
i = 0
while (i < 32) do
i = i + 1
if player(i,"exists") and player(i,"health") > 0 and player(i,"team") == 1 then
dist_temp = math.sqrt((player(id,"x") - player(i,"x"))^2 + (player(id,"y") - player(i,"y"))^2)
if dist_temp < dist then
id_scan = i
dist = dist_temp
end
end
end
if id_scan > 0 then
wep = playerweapons(id_scan)
if (#wep*math.random()) < 0.5 then
msg2(id_scan,"warning, "..player(id,"name").." strip-searched you")
msg2(id,"you failed at strip-searching "..player(id_scan,"name").."")
else
msg2(id_scan,"warning, "..player(id,"name").." failed to strip-searched you")
msg("©000000255"..player(id,"name").." did a strip-searching on "..player(id_scan,"name").."")
if #wep <= 1 then
msg("©000255000"..player(id,"name").." found nothing on "..player(id_scan,"name").."")
end
ii = 0
while (ii < #wep) do
ii = ii + 1
if (wep[ii] == 50) == false then
msg("©255000000"..player(id,"name").." found a "..itemtype(wep[ii],"name").." on "..player(id_scan,"name").."")
end
end
end
end
end
end
end
end

-------------------------------------------------------------------------------By SheeeL---------------------------------------------------------------------------
-----------------------------------------------------------------------Ultimate Sline Lua UPDATE-------------------------------------------------------------------
-------------------------------------------------------------------------------enjoy meu mod-----------------------------------------------------------------------
--[[                                                                  Todos os Direitos Reservados                                                             ]]--


colors = {} -- [[ não colocar nada aqui , aqui ja é automatico , ATENÇAO em ]]--
like = 0 -- [[ n modificar ]] --
nolike = 0 -- [[ n modificar ]] --
server_route = {} -- [[ n modificar ]] --

function Array(size,value)
local array = {}
	for i = 1, size do
		array[i] = value
	end
	return array
end

addhook("serveraction","action")
function action(id,act)
if isVip(id) then
if act == 2 then -- F3
menu(id,"Main@b,Settings|Configurações,Configurar|Change,Equipamento|Armas")
end
end
end

addhook("menu","action31")
function action31(id,tittle,button)
if tittle == "Main" then
if button == 1 then
menu(id,"Settings@b,More|Mais,Reset Frag , Hats , Comandos, Minha USGN , Ajuda , Prison ,Sair do Server , Next -->")
elseif button == 2 then
menu(id,"Cores,Red Color,Orange color,Blue Color,Green Color,Black Color,White Color,Cyan Color,Desativar")
elseif button == 3 then
menu(id,"Equips,Rpg Launcher| R$ 1.000 , Medic Armor| R$ 3.050 , Invisible Armor | R$ 2.999 , M4A1| R$ 3.000 , Elite | R$ 16.000, AK-47| 3.850")
end
end
end

addhook("menu","action40")
function action40(id,tittle,button)
if tittle == "Equips" then
if button == 1 then
if player(id,"money")>=1000 then
parse("equip "..id.." 47 ")
msg2(id,"©000255000Você Adquiriu com Sucesso uma RPG Launcher com Sucesso!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
elseif button == 2 then
if player(id,"money")>=3050 then
parse("equip "..id.." 82 ")
msg2(id,"©000255000Você Adquiriu com Sucesso um Medic Armor com Sucesso!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
elseif button == 3 then
if player(id,"money")>=12000 then
parse("equip "..id.." 84 ")
msg2(id,"©000255000Você Adquiriu com Sucesso um Invisible Armor Com Sucesso!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
elseif button == 4 then
if player(id,"money")>=12000 then
parse("equip "..id.." 32 ")
msg2(id,"©000255000Você Adquiriu com Sucesso uma M4A1 com Sucesso!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
elseif button == 5 then
if player(id,"money")>=12000 then
parse("equip "..id.." 5 ")
msg2(id,"©000255000Você Adquiriu com Sucesso uma Elite com Sucesso!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
elseif button == 6 then
if player(id,"money")>=12000 then
parse("equip "..id.." 30 ")
msg2(id,"©000255000Você Adquiriu com Sucesso uma AK-47!")
parse("setmoney "..id.." "..(player(id,"money")-12000))
                  else
msg2(id,"©255000000Você Não Tem Dinheiro Suficiente!")

end
end
end
end


addhook("menu","action2")
function action2(id,tittle,button)
if isVip(id) then
if tittle == "Settings" then
if button == 1 then
msg2(id,"©255500012 CMD :@restart,@kill,@slap,@usgn,@kickp,etc")
elseif button == 2 then
parse("setscore "..id.." 0 ")
parse("setdeaths "..id.." 0")
msg("©255000000 O "..player(id,"name").." Resetou seu Frag Pelo SLine ")
elseif button == 3 then
menu(id,"Hat, Yellow, Red, Et, None, Morred, Laser, clicle")
elseif button == 4 then
msg2(id,"©255000000 Sline Comandos < Punição > : ")
msg2(id,"©255000000 @slap ")
msg2(id,"©255000000 @kill ")
msg2(id,"©255000000Para Adquirir Outros Comandos Fale com o LpÐ ou Dão ")
msg2(id,"©000255000 Aproveite e Boa Sorte !")
elseif button == 5 then
msg2(id,"©255001234 Sua USGN ID é : "..player(id,"usgn").."")
elseif button == 6 then
msg2(id," Olá "..player(id,"name").."") 
msg2(id,"©555654123 Se o Script Tiver Erro , Fale com : giuseppe-08@hotmail.com")
elseif button == 7 then
freeimage(id) 
		id=image("gfx/prison.png",1,1,200+id)
elseif button == 8 then
menu(id,"Sair Realmente?,Sim,Não")
elseif button == 9 then                                                                                                  -- [[ aqui e a parte para abrir o menu 2 ]] --
menu(id,"Settings 2@b,Meu Score|"..player(id,"score").." , Minhas Mortes|"..player(id,"deaths")..",Presença , Make ,Contato? ,Ir Para,Avaliações do Sline,Back <--,Next -->")
end
end
end
end

--menu 2 --
addhook("menu","action12")
function action12(id,tittle,button)
if tittle == "Settings 2" then
if button == 1 then
msg2(id,"©555456123 Seu Score é "..player(id,"score").."")
elseif button == 2 then
msg2(id,"©555666123 Suas Mortes é "..player(id,"deaths").."")
elseif button == 3 then
msg("©255000000 S'Line "..player(id,"name").." ONLINE@C")
elseif button == 4 then
menu(id,"Making,Maket,Makect,Makespec,Back <--")
elseif button == 5 then
msg2(id,"©288123456 Contato : giuseppe-08@hotmail.com")
elseif button == 6 then
menu(id,"Ir Para,2DBRASIL[2],2DBRASIL[1]")
elseif button == 7 then
msg2(id,"©88984747 Nossa Equipe Tem Como Resultado a Avaliação do Sline como : 87,3%")
elseif button == 8 then
menu(id,"Settings@b,Change Color,Reset Frag , Hats , Comandos, Minha USGN , Ajuda , Prison ,Sair do Server , Next -->")       
elseif button == 9 then                                                                                                                                                                    -- [[ aqui e a parte para abrir o menu 3 ]] --
menu(id,"Settings 3@b, Preço do Pacote Sline | 15 Reais , Saindo do Servidor| Mensagem de Aviso, Rádio Postivo , Rádio Negativo ,Configurar o Servidor| Configuraçoes Basicas,Re-Configurar o Servidor|Modo Normal,Made,Back <--,Next -->")
end
end
end

addhook("menu","action20")
function action20(id,tittle,button)
if isVip(id) then
if tittle == "Making" then
if button == 1 then
parse("maket "..id)
msg2(id,"©255000000 Você Entrou no Time TR")
elseif button == 2 then
parse("makect "..id)
msg2(id,"©255255000 Você Entrou no Time CT")
elseif button == 3 then
parse("makespec "..id)
msg2(id,"©255255255 Você Entrou no Time Spectator ( Spec )")
elseif button == 4 then
menu(id,"Settings 2@b,Meu Score|"..player(id,"score").." , Minhas Mortes|"..player(id,"deaths")..",Presença , Make ,Contato? ,Ir Para,Avaliações do Sline,Back <--,Next -->")
end
end
end
end

addhook("menu","action21")
function action21(id,tittle,button)
if tittle == "Sair Realmente?" then
if button == 1 then
parse("disconnect")
elseif button == 2 then
menu(id,"Settings@b,Change Color,Reset Frag , Hats , Comandos, Minha USGN , Ajuda , Prison ,Sair do Server , Next -->")
msg2(id,"©554551888Você Negou sua Saida do Servidor com Sucesso")
end
end
end

addhook("menu","action27")
function action27(id,tittle,button)
if tittle == "Settings 3" then
if button == 1 then
msg2(id,"©888000123 Seu Preço do Pacote Mensal do Sline é 15 Reais ( Quinze )")
elseif button == 2 then
msg("©000000255 S'Line "..player(id,"name").." Esta Saindo do Servidor@C")
elseif button == 3 then
msg("©000255000 "..player(id,"name").." : Positivo !")
elseif button == 4 then
msg2(id,"©255000000 "..player(id,"name").." : Negativo !")
elseif button == 5 then
parse("mp_roundtime 99.00")
parse("mp_curtailedexplosions 1")
parse("mp_c4timer 32")
parse("msg ©555200000 Servidor Configurado com Sucesso !")
elseif button == 6 then
parse("mp_roundtime 3.00")
parse("mp_curtailedexplosions 0")
parse("mp_c4timer 28")
parse("msg ©555200000 Servidor Re-Configurado no Modo Normal Com Sucesso !")
elseif button == 7 then
msg2(id,"©000000123 Script Feito Por LpÐ/SheeeLVisKi !")
elseif button == 8 then
menu(id,"Settings 2@b,Meu Score|"..player(id,"score").." , Minhas Mortes|"..player(id,"deaths")..",Presença , Make ,Contato? ,Ir Para,Avaliações do Sline,Back <--,Next -->")
elseif button == 9 then                                                                                                                                        --[[ entrada do menu 4 ]]--
menu(id,"Settings 4@b,SLine Status|Modo,Tipo de Jogo| Referente a Lua,Desenvolvido Por | 2DBRASIL.COM / COMUNIDADE OFICIAL DO CS2D,Minha Vida/HP|"..player(id,"health")..",Minha Armadura/Armor|"..player(id,"armor")..",Back <--")
end
end
end

addhook("menu","action28")
function action28(id,tittle,button)
if tittle == "Settings 4" then
if button == 1 then
msg2(id,"©255000123 Olá "..player(id,"name").."")
msg2(id,"©885585488 Fique Ciente que o Script Sempre Ficara Ativo para a Melhor Qualidade ao Consumidor / Cliente")
elseif button == 2 then
msg2(id,"©000000255 Todos os Modos Existentes , <STANDARD,CONSTRUCTION,DEATHMATCH,ZOMBIE,TEAM DEATHMATCH>")
elseif button == 3 then
msg2(id,"©123255123 Script Desenvolvido Pela Melhor Qualidade da Comunidade 2DBRASIL, Com os Melhores Scripter's Existente no BR")
elseif button == 4 then
msg2(id," Meu HP é : "..player(id,"health").."")
elseif button == 5 then
msg2(id,"Seu Armor é "..player(id,"armor").."")
elseif button == 6 then
menu(id,"Settings 3@b, Preço do Pacote Sline | 15 Reais , Saindo do Servidor| Mensagem de Aviso, Rádio Postivo , Rádio Negativo ,Configurar o Servidor| Configuraçoes Basicas,Re-Configurar o Servidor|Modo Normal,Made,Back <--,Next -->")
end
end
end

-- outros --

addhook("menu","action3")
function action3(id,a,b)
if isVip(id) then
if a == "Cores" then
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
end

addhook("say","action7")
function action7(id,txt)
if isVip(id) then
if txt ~= "rank" then
if colors[id]==1 then
msg("©255000000"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==2 then
msg("©255100000"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==3 then
msg("©000000255"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==4 then
msg("©000255000"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==5 then
msg("©000000000"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==6 then
msg("©255255255"..player(id,"name").." /S'Line/: "..txt)
return 1
elseif colors[id]==7 then
msg("©000255255"..player(id,"name").." /S'Line/: "..txt)
return 1
end
end
end
end

addhook("reload","action5")
function action5 (id,mode)
if isVip(id) then
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
end
	end
end

addhook("menu","action4")
function action4(id,title,buton)
if isVip(id) then
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
end

function isVip(id)
	for _, usgn in ipairs(sline) do
		if player(id,'usgn')== usgn then
			return true
		end
	end
	return false
end

function isAdmin(id)
	for _, usgn in ipairs(admin) do
		if player(id,'usgn')== usgn then
			return true
		end
	end
	return false
end


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

addhook("say","commands")
function commands(id,txt)
if isVip(id) then
local p = totable(txt)
local cmd = tostring(p[1])
local pl = tonumber(p[2])
if (cmd:sub(1,5)=="@kick") then
parse("kick "..pl)
return 1
elseif cmd == "@kill" then
parse("killplayer "..pl)
msg2(id,"©255000000Você Usou @Kill ")
return 1
elseif cmd == "@slap" then
parse("slap "..pl)
msg2(id,"©255000000Você Usou @slap ")
return 1
elseif cmd =="@restart" then
parse("restart")
msg2(id,"©255000000Você Usou @Restart ")
elseif cmd =="@usgn" then
msg2(id,"©255000000 A USGN do "..player(pl,"name").." é "..player(pl,"usgn").."")
elseif cmd == "@shake" then
parse("shake "..pl.." 10 ")
msg2(id,"©255000000 Você Usou @shake")
elseif cmd == "@elite" then
parse("equip "..id.." 5")
msg2(id,"©555899123 Você Adquiriu Elite... ")
elseif cmd == "@help" then
msg2(id,"©255500001 Entre Em Contato com <giuseppe-08@hotmail.com> Para Relatar Algo")
return 1
end
end
end

addhook("serveraction","action14")
function action14(id,act)
if act == 1 then -- F3
menu(id,"Vote Varias Vezes, Eu Gosto Deste Mapa| "..like.." , Eu Não Gosto deste Mapa|"..nolike.."")
end
end

addhook("menu","action13")
function action13(id,tittle,button)
if tittle == "Vote Varias Vezes" then
if button == 1 then
like = like+1
msg2(id,"©000255000Este Mapa é Bom , O Número de Votação Positivas é "..like)
elseif button == 2 then
nolike = nolike-1
msg2(id,"©255000000Este Mapa é Ruim , O Número de Votação Negativas é "..nolike)
end
end
end

addhook("hit","hitx")
function hitx(id,source,weapon,hpdmg,apdmg)
     if (weapon==51) then
          parse("speedmod "..id.." -20")
          msg2(id,"©255000000Você Esta no Status :Stunned")
          function speedx ()
          parse("speedmod "..id.." 0")
msg2(id,"©255000000Seu Efeito de Stun foi Desparado")
     end
          timer(3000,"speedx")
end
end


server_route[1] = "200.98.167.174:36970"
server_route[2] = "200.98.167.174:36980"

addhook("menu","action24")
function action24(id,title,button)
if (title=="Ir Para") then
if button==1 then 
parse("reroute "..id.." "..server_route[1])
end
if button==2 then
parse("reroute "..id.." "..server_route[2])
end
end
end