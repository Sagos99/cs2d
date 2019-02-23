ADM = 15431

achado = 0
procurando = 0
robo = 0
atirar2 = 100
wrench = 0
espera = 8
fala = ""
vrc = fala
tempo = 0

addhook("always","procuurando")
function procuurando()
if achado == 0 then
procurando = procurando+1
end
if procurando > 32 then
procurando = 0
end
if player(procurando,"bot") and achado == 0 then
parse("setname "..procurando.." Cerbex")
robo = procurando
achado = 1
end
inimigo = ai_findtarget(robo)


inimigox = player(inimigo,"x")
inimigoy = player(inimigo,"y")
initilex = player(inimigo,"tilex")
initiley = player(inimigo,"tiley")


if player(robo,"exists") and player(inimigo,"exists") then
if ai_freeline(robo,inimigox,inimigoy) and player(inimigo,"health") > 0 then
ai_aim(robo,inimigox,inimigoy)
atirar = atirar-1

if atirar < 1 and nmata == 0 then
ai_iattack(robo)
atirar = atirar2
end

ai_goto(robo,initilex,initiley)
else
ai_selectweapon(robo,50)
end
end

ai_spray(robo)

if tempo > 0 then
tempo = tempo-1
end

if tempo == 1 and fala ~= "" then
ai_say(robo,fala)
fala = ""
end

if fala ~= vrc then
tempo = espera
vrc = fala
end
end


atirar = atirar2

addhook("second","versao")
function versao()
if player(robo,"exists") then
ai_respawn(robo)
antiga = 9999999
end

if robo > 0 then
wrench = wrench+1
if wrench > 5 then
wrench = 0

build = math.random(1,9)

telx = player(robo,"tilex")
crix = math.random(1,2)

if crix == 1 then
telx = telx-1
elseif crix == 2 then
telx = telx+1
end

tely = player(robo,"tiley")
criy = math.random(1,2)

if criy == 1 then
tely = tely-1
elseif criy == 2 then
tely = tely+1
end

ai_selectweapon(robo,74)
if player(robo,"weapon") == 74 then
ai_build(robo,build,telx,tely)
end
ai_selectweapon(robo,50)
end
end
end


addhook("say","BotFala")
function BotFala(id,txt)
texto = string.lower(txt)

if txt == "!atualizar" and player(id,"usgn") == ADM then
dofile("sys/lua/SagosWins/Bot.lua")
return 1
end

for uss = 1,32 do
if texto == "bot qual a usgn do id "..uss.."?" or texto == "qual usgn do id "..uss.."?" or texto == "qual é a usgn do id "..uss.."" or texto == "bot qual é a usgn do id "..uss.."" or texto == "qual é a usgn do id "..uss.."?" or texto == "bot qual é a usgn do id "..uss.."?"  then
if player(uss,"exists") then
if player(uss,"usgn") > 0 then
fala = "a usgn do "..player(uss,"name").." é "..player(uss,"usgn")..""
else
fala = "ele não esta logado em nem uma conta"
end
else
fala = "Se é burro? Este Jogador Nem Existe ¬¬"
end
end

if texto == "bot kika o id "..uss.."" then
if player(id,"usgn") == ADM then
if player(uss,"exists") then
fala = "O Desgraçado do "..player(uss,"name").." Foi Kikado"
parse("kick "..uss)
else
fala = "Desculpe "..player(id,"name").." Mas o ID "..uss.." Não Existe"
end
else
fala = "Só Recebo Ordens Do ADM"
end
end

if texto == "bot qual a usgn mais antiga?" or texto == "cerbex qual a usgn mais antiga?" or texto == "qual é a usgn mais antiga?" or texto == "qual a usgn mais antiga?" then
if player(uss,"exists") and player(uss,"usgn") > 0 and player(uss,"usgn") < antiga then
antiga = player(uss,"usgn")
nominho = player(uss,"name")
fala = "é o "..nominho.." "..antiga..""
end
end
end

if texto == "bot qual usgn mais nova?" or texto == "bot qual a usgn mais nova?" or texto == "cerbex qual a usgn mais nova?" or texto == "cerbex qual usgn mais nova?" or texto == "qual a usgn mais nova?" or texto == "qual é a usgn mais nova?" or texto == "qual usgn mais nova?" or texto == "qual a usgn mais nova?" then
verificando = 0
nominho = ""

for uss2 = 1,32 do
if player(uss2,"exists") and player(uss2,"usgn") > verificando then
verificando = player(uss2,"usgn")
nominho = player(uss2,"name")
end

if uss2 == 32 then
fala = "é o "..nominho.." "..verificando..""
end
end


end

if txt == "!rs" then
parse("setscore "..id.." 0")
parse("setdeath "..id.." 0")
msg("©255255255"..player(id,"name").." Resetou o Score!")
end

if texto == "bot" or texto == "cerbex" or texto == "ei cerbex" or texto == "ei bot" then
fala = "que?"
elseif texto == "bot quem te criou?" or texto == "quem te criou?" or texto == "cerbex quem te criou?" or texto == "quem é seu dono?" or texto == "quem e seu dono?" or texto == "quem é seu dono ?" or texto == "quem e seu dono ?" or texto == "bot quem te programou ?" then
fala = "Fui Desenvolvido Por SagosWins"
elseif texto == "bot vc é homem?" or texto == "bot vc é gay?" or texto == "bot vc é mulher?" or texto == "vc e homem?" or texto == "vc e gay?" or texto == "vc é gay?" or texto == "vc e mulher?" then
fala = "não, eu sou apenas um script"
elseif texto == "bot nub" or texto == "bot ruim" or texto == "bot nob" or texto == "bot noob" or texto == "vc e ruim" or texto == "toma bot lixo" or texto == "bot lixo" or texto == "bot vc é muito ruim" then
fala = "Eu Melhoro Meu Desempenho Ao Contrario de Você"
elseif texto == "bot fdp" or texto == "bot fd.p" or texto == "bot vsf" or texto == "vai se fude" or texto == "vai toma no cu" or texto == "bot viado" or texto == "cerbex viado" or texto == "vai toma no meio do seu cu" or texto == "vc é um merda" or texto == "vtnc" or texto == "bot vai tomar no cu" then
parse("kick "..id)
elseif texto == "bot vc gosta de min?" or texto == "bot você gosta de min?" or texto == "bot vc me odeia?" or texto == "sagos é feio?" then
fala = "não"
elseif texto == "oi" or texto == "ola" or texto == "eae" or texto == "eai" or texto == "iai" or texto == "iae" or texto == "eae bot" or texto == "eae cerbex" or texto == "oi bot" or texto == "oi cerbex" then
fala = "Eae "..player(id,"name")..""
elseif texto == "blz?" then
fala = "blz"
elseif texto == "flw" or texto == "flw bot" then
fala = "flw"
elseif texto == "vc é bom" or texto == "você é bom" or texto == "vc eh bom" or texto == "vc é bom" or texto == "vc é legal" or texto == "bot vc é legal" or texto == "cerbex vc é legal" then
fala = "Obrigado"
elseif texto == "fika keto" then
fala = "Não"
elseif texto == "bot go x1?" or texto == "bot x1?" or texto == "cerbex x1?" then
fala = "Não"
elseif texto == "kkk" then
fala = "kkkk"
elseif texto == "bot da rr" or texto == "bot da restart" or texto == "da rr" or texto == "da restart" or texto == "cerbex da restart" or texto == "cerbex da rr" then
if player(id,"usgn") == ADM then
fala = "Pronto"
parse("restart 2")
else
fala = "Só Recebo Ordens Do ADM"
end
elseif texto == "me encina a jogar?" or texto == "me encina jogar" then
fala = "eu não sei encinar"
elseif texto == "tudo bem?" or texto == "vc é um robo?" or texto == "você é um robo?" then
fala = "sim ^^"
elseif texto == "quem e noob?" or texto == "quem é noob?" or texto == "quem é o melhor?" or texto == "quem e o melhor?" then
fala = "não sei"
elseif texto == "voce é bom?" or texto == "vc é bom?" or texto == "você é bom?" or texto == "vc e bom?" or texto == "vc sabe jogar?" or texto == "vc joga bem?" then
fala = "+/-"
elseif texto == "te amo" or texto == "bot te amo" then
fala = "troque T por M e seja feliz ^^"
elseif texto == "bot qual minha usgn?" or texto == "qual minha usgn?" or texto == "qual é a minha usgn?" or texto == "qual é minha usgn?" or texto == "qual minha usgn" or texto == "bot qual é minha usgn ?" or texto == "qual é minha usgn ?" then
usgn = player(id,"usgn")
if usgn > 0 then
fala = "sua usgn é "..usgn..""
else
fala = "você não esta logado em nem uma conta ¬¬"
end
elseif texto == "vlw" or texto == "vlw bot" or texto == "obrigado" or texto == "brigado" then
fala = "nds"
elseif texto == "como vai?" or texto == "como esta?" or texto == "bot tudo bem?" or texto == "tudo bem?" then
fala = "eu estou bem, obrigado!"
elseif texto == "porque se movimenta assim?" then
fala = "fui programado para andar nestes lugares"
elseif texto == "que horas é?" or texto == "que horas são" or texto == "bot que horas é?" or texto == "que horas são?" or texto == "que horas é agora?" or texto == "que horas são?" or texto == "que horas sao?" or texto == "bot que hora é?" or texto == "cerbex que hora é?" then
fala = (os.date("Agora é %I:%M %p"));
elseif texto == "fmz?" or texto == "fmz bot?" then
fala = "fmz"
elseif texto == "qual seu nome?" or texto == "cerbex qual seu nome?" or texto == "bot qual seu nome?" or texto == "bot como é seu nome?" or texto == "cerbex como é seu nome?" then
fala = "««"
elseif texto == "qual o nome do mapa?" or texto == "cerbex qual o nome do mapa?" or texto == "bot qual nome do mapa" or texto == "qual é o nome desse mapa?" then
maapaa = map("name")
fala = "é "..maapaa..""
elseif texto == "me segue" then
fala = "não"
elseif texto == "voce é fraco" or texto == "vc é fraco" or texto == "vc é fraco !" then
fala = "=/"
elseif texto == "de boa?" then
fala = "sim, e você?"
elseif texto == "cerbez" then
fala = "Meu Nome Não é Cerbez, quer óculos?"
elseif texto == "bot qual o nome da minha mãe?" then
fala = "Sou um Bot que Fala e Não um Bot Vidente"
elseif texto == "bot qual a sua usgn?" then
fala = "Eu Não Tenho USGN"
elseif texto == "bot fala rank" or texto == "cerbex fala rank" or texto == "bot diz rank" or texto == "cerbex diz rank" then
fala = "Rank"
elseif texto == "bot qual meu nome?" or texto == "cerbex qual meu nome?" or texto == "qual é meu nome?" or texto == "bot qual é meu nome?" or texto == "cerbex qual é o meu nome?" or texto == "qual meu nome?" then
fala = player(id,"name")
elseif texto == "bot quer ser meu amigo?" then
fala = "Quero"
elseif texto == "cerbex o sagos é ruim?" then
fala = "Não"
elseif texto == "bot que dia é hoje?" or texto == "cerbex que dia é hj?" or texto == "cerbex que dia é hoje?" or texto == "bot que dia é hj?" or texto == "que dia é hj?" or texto == "que dia é hoje?" or texto == "bot que dia é hoje ?" then
fala = (os.date("é %A, %d %b %Y"));
elseif texto == "cerbex vc pinta como eu pinto?" or texto == "cerbex você pinta como eu pinto?" or texto == "bot vc pinta como eu pinto?" or texto == "bot você pinta como eu pinto?" then
fala = "não, eu pinto mais bonito e mais rapido"
elseif texto == "queijo" then
fala = "qual queijo?"
elseif texto == "bot ataca" and player(id,"usgn") == ADM or texto == "cerbex ataca" and player(id,"usgn") == ADM then
ai_iattack(robo)
elseif texto == "qual sua idade?" then
fala = "11 meses"
elseif texto == "qual são minhas mortes?" then
fala = ""..player(id,"deaths")..""
elseif texto == "qual é meu score?" or texto == "qual meu score?" then
fala = ""..player(id,"score")..""
elseif texto == "qual é seu score?" then
fala = ""..player(robo,"score")..""
elseif texto == "qual é suas mortes?" then
fala = ""..player(robo,"deaths")..""
elseif texto == "bot quem te cumeu?" or texto == "cerbex quem te cumeu?" or texto == "bot qm te comeu?" then
fala = "Ninguem, Não Sou Comida."
elseif texto == "cerbex quem te enfio o pau?" or texto == "cerbex quem enfio o pau no cu?" then
fala = "não tenho corpo, não tem como enfiar nada em min"
end
end