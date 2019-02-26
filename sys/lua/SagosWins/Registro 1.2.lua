-------------------------------------------------------------
---------------Script Registro 1.2 By SagosWins--------------
-------------------Criado No Dia 23/7/2012-------------------
-----------------Atualizado No Dia 26/7/2012-----------------
-------------------------------------------------------------

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


----------------Variavel------------------------
regi_login=initArray(32)
regi_senha=initArray(32)
login_nick=initArray(32)
login_senha=initArray(32)
nao_logado=initArray(32)
nick=initArray(32)
senha=initArray(32)
veri_senha=initArray(32)
veri_nick=initArray(32)
xxp=initArray(32)
level=initArray(32)
max=initArray(32)
morte=initArray(32)
ponto=initArray(32)
------------------------------------------------

for arrumando = 1,32 do
nao_logado[arrumando] = 0
max[arrumando] = 11
end


addhook("join","registrar")
function registrar(id)
nao_logado[id] = 1
menu(id,"Bem Vindo Ao Sv do SagosWins@b,Registrar|Se Voçe Ainda Não Tiver Uma Conta,Logar-se|Se Voçe Ja Possui Uma Conta")
nick[id] = "Não_Registrado"
parse("setname "..id.." "..nick[id])
end

addhook("menu","login")
function login(id,titulo,botao)

if titulo == "Bem Vindo Ao Sv do SagosWins" then
if botao == 1 then
msg2(id,"©255255255Digite Seu Login Para se Registrar!")
regi_login[id] = 1
end

if botao == 2 then
msg2(id,"©255255255Digite Seu Login!")
login_nick[id] = 1
end
end
end


addhook("say","DB")
function DB(id,txt)

-------------------------------------------------------------------------------
if regi_login[id] == 1 then
nick[id] = (""..txt)

nome = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Nome.txt","r")

if nome ~= NILL then
msg2(id,"©255255255Esta Conta Já Existe Por Favor Escolha Outro Nome!")
return 1
elseif nome == NILL then
nome = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Nome.txt","w+")
nome:write(nick[id].."")
nome:close()
regi_login[id] = 0
regi_senha[id] = 1
msg2(id,"©255255255Login Aceito, Digite Uma Senha!")
return 1
end
end
-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
if regi_senha[id] == 1 then
senha[id] = (txt.."")

senhaa = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Senha.txt","w+")
senhaa:write(senha[id].."")
senhaa:close()

pontos = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Pontos.txt","w+")
pontos:write(ponto[id].."")
pontos:close()

mortes = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Mortes.txt","w+")
mortes:write(morte[id].."")
mortes:close()

xpp = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Xp.txt","w+")
xpp:write(xxp[id].."")
xpp:close()

xxp[id] = 0
ponto[id] = 0
morte[id] = 0
max[id] = 11
level[id] = 0

parse("setname "..id.." "..nick[id])
nao_logado[id] = 0
regi_senha[id] = 0
msg2(id,"©255255255Sua Conta Foi Criada Com Sucesso!")
return 1
end
-------------------------------------------------------------------------------



-------------------------------------------------------------------------------
if login_nick[id] == 1 then
veri_nick[id] = (""..txt)
nome = io.open("sys/lua/SagosWins/Data Base/"..veri_nick[id].."_Nome.txt","r")

if nome ~= NILL then


leia = nome:read("*a")
nick[id] = tostring(leia)
nome:close()
login_nick[id] = 0
login_senha[id] = 1
msg2(id,"©255255255Digite Sua Senha!")
return 1

elseif nome == NILL then

msg2(id,"©255255255Esta Conta Não Existe!")
login_nick[id] = 0
menu(id,"Bem Vindo Ao Sv do SagosWins@b,Registrar|Se Voçe Ainda Não Tiver Uma Conta,Logar-se|Se Voçe Ja Possui Uma Conta")
return 1
end
end
--------------------------------------------------------------------------------

if login_senha[id] == 1 then
veri_senha[id] = (""..txt)
nome = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Senha.txt","r")

if nome ~= NILL then
leia = nome:read("*a")
senha[id] = tostring(leia)
nome:close()

if veri_senha[id] == senha[id] then
login_senha[id] = 0
parse("setname "..id.." "..nick[id])
msg2(id,"©255255255Logado Com Succeso!")
nao_logado[id] = 0

pontos = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Pontos.txt","r")
leia = pontos:read("*a")
ponto[id] = tonumber(leia)
pontos:close()

mortes = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Mortes.txt","r")
leia = mortes:read("*a")
morte[id] = tonumber(leia)
mortes:close()

experiencia = io.open("sys/lua/SagosWins/Data Base/"..nick[id].."_Xp.txt","r")
leia = experiencia:read("*a")
xxp[id] = tonumber(leia)
experiencia:close()



return 1

else
login_senha[id] = 0
menu(id,"Bem Vindo Ao Sv do SagosWins@b,Registrar|Se Voçe Ainda Não Tiver Uma Conta,Logar-se|Se Voçe Ja Possui Uma Conta")
msg2(id,"©255255255A Senha Esta Incorreta!")
return 1
end

elseif nome == NILL then

msg2(id,"©255255255Erro Ao Entrar Na Conta!")
login_senha[id] = 0
menu(id,"Bem Vindo Ao Sv do SagosWins@b,Registrar|Se Voçe Ainda Não Tiver Uma Conta,Logar-se|Se Voçe Ja Possui Uma Conta")
return 1
end
end

for info = 1,32 do
if txt == "!info "..info.."" then
if player(info,"exists") then
msg2(id,"Informações do Jogador "..player(info,"name").."")
msg2(id,"xp: "..xxp[info].." / "..max[info])
msg2(id,"Level: "..level[info])
msg2(id,"Kills: "..ponto[info])
msg2(id,"Deaths: "..morte[info])
else
msg2(id,"Este Jogador Não Existe!")
end
end
end

if nao_logado[id] == 0 then
msg("[lvl "..level[id].."]  "..player(id,"name")..": "..txt)
return 1
end

if txt == "!rs" or txt == "!reset" or txt == "!resetscore" or txt == "!RS" or txt == "!RESET" or txt == "!RESETSCORE" or txt == "!Rs" or txt == "!Reset" or txt == "!Resetscore" or txt == "!ResetScore" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Score Resetado!")
end
end

--------------------------------------------------------------------------------
addhook("second","nao_muda_nome")
function nao_muda_nome()
for jogador = 1,32 do
if player(jogador,"exists") and nao_logado[jogador] == 0 then
if player(jogador,"name") ~= nick[jogador] then
parse("setname "..jogador.." "..nick[jogador])
end
parse("hudtxt2 "..jogador.." 7 \"XP: "..xxp[jogador].." / "..max[jogador].."\" 500 300 0")
parse("hudtxt2 "..jogador.." 6 \"Level: "..level[jogador].."\" 500 315 0")
parse("hudtxt2 "..jogador.." 5 \"Kills: "..ponto[jogador].." Deaths: "..morte[jogador].."\" 500 330 0")
end
end
end
--------------------------------------------------------------------------------


facil = 0
--------------------------------------------------------------------------------
addhook("always","sempre")
function sempre()
for todos_jogadores2 = 1,32 do
if nao_logado[todos_jogadores2] == 1 then
if player(todos_jogadores2,"team") == 1 or player(todos_jogadores2,"team") == 2 then
parse("makespec "..todos_jogadores2)
regi_login[todos_jogadores2] = 0
regi_senha[todos_jogadores2] = 0
login_nick[todos_jogadores2] = 0
login_senha[todos_jogadores2] = 0
menu(todos_jogadores2,"Bem Vindo Ao Sv do SagosWins@b,Registrar|Se Voçe Ainda Não Tiver Uma Conta,Logar-se|Se Voçe Ja Possui Uma Conta")
end
end
if xxp[todos_jogadores2] < 0 then
xxp[todos_jogadores2] = 0
end


while xxp[todos_jogadores2] >= max[todos_jogadores2] do
facil = max[todos_jogadores2]+max[todos_jogadores2]
facil = facil+facil
facil = facil/2
max[todos_jogadores2] = facil
level[todos_jogadores2] = level[todos_jogadores2]+1
end
end
end
--------------------------------------------------------------------------------



addhook("kill","pontomorte")
function pontomorte(killer,victim,weapon,x,y)

if level[killer] > level[victim] then
xxp[killer] = xxp[killer]+19
xxp[victim] = xxp[victim]-16
end

if level[killer] == level[victim] then
xxp[killer] = xxp[killer]+24
xxp[victim] = xxp[victim]-19
end

if level[killer] < level[victim] then
xxp[killer] = xxp[killer]+29
xxp[victim] = xxp[victim]-24
end

ponto[killer] = ponto[killer]+1
morte[victim] = morte[victim]+1

pontos = io.open("sys/lua/SagosWins/Data Base/"..nick[killer].."_Pontos.txt","w+")
pontos:write(ponto[killer].."")
pontos:close()

mortes = io.open("sys/lua/SagosWins/Data Base/"..nick[victim].."_Mortes.txt","w+")
mortes:write(morte[victim].."")
mortes:close()

xpp = io.open("sys/lua/SagosWins/Data Base/"..nick[victim].."_Xp.txt","w+")
xpp:write(xxp[victim].."")
xpp:close()

xpp = io.open("sys/lua/SagosWins/Data Base/"..nick[killer].."_Xp.txt","w+")
xpp:write(xxp[killer].."")
xpp:close()
end

addhook("minute","informacao")
function informacao()
msg("©000255000Para Ver o Status de um Jogador Digite !info <id>")
end