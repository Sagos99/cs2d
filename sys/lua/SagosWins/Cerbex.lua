--=========================================================--
--================Script Cerbex By SagosWins===============--
--=================Criado No Dia 25/05/2012================--
--===============Atualizado No Dia 20/04/2014==============--
--==============POR FAVOR NÃO EDITE ESTE SCRIPT============--
--=======Caso Queira Alguma Nova Função Peça Para Min======--
--===========Meu E-Mail: samugolf_10@hotmail.com===========--
--=========================================================--

ADM = 15431

achado = 0
procurando = 15
robo = 0
atirar = 0
wrench = 0
espera = 8
fala = ""
vrc = fala
tempo = 0
Aviso = "normal"
rcon = "falso"
pi1 = 0
pi2 = 0
angulo = 0

dia = (os.date("%A"));
if dia == "Sunday"  then
dia = "Domingo"
elseif dia == "Monday" then
dia = "Segunda Feira"
elseif dia == "Tuesday" then
dia = "Terça Feira"
elseif dia == "Wednesday" then
dia = "Quarta Feira"
elseif dia == "Thursday" then
dia = "Quinta Feira"
elseif dia == "Friday" then
dia = "Sexta Feira"
elseif dia == "Saturday" then
dia = "Sábado"
end

mes = (os.date("%b"));

if mes == "Jan" then
mes = "Janeiro"
elseif mes == "Feb" then
mes = "Fevereiro"
elseif mes == "Mar" then
mes = "Março"
elseif mes == "Apr" then
mes = "Abril"
elseif mes == "May" then
mes = "Maio"
elseif mes == "Jun" then
mes = "Junho"
elseif mes == "Jul" then
mes = "Julho"
elseif mes == "Aug" then
mes = "Agosto"
elseif mes == "Sep" then
mes = "Setembro"
elseif mes == "Dec" then
mes = "Dezembro"
end

addhook("startround","informacao")
function informacao()
print("O Round Começo!")
end

addhook("endround","msg2")
function msg2()
print("O Round Terminou!")
end

addhook("join","jogador")
function jogador()
if Aviso ~= "normal" then
Aquisando = io.open("sys/lua/sagoswins/Aviso.txt","w+")
Aquisando:write("Conectado")
Aquisando:close()
Aviso = "normal"
end
end

addhook("always","teste")
function teste()

------------------------------------------------------------

file = io.open("sys/lua/sagoswins/Avisar.txt","r")
lendo = file:read("*a")
transformando = tostring(lendo)
file:close()

if transformando ~= "" then
salvar = io.open("sys/lua/sagoswins/Avisar.txt","w+")
salvar:write("")
salvar:close()
Aviso = "esperando"
end

------------------------------------------------------------


------------------------------------------------------------

file = io.open("sys/lua/sagoswins/Fala.txt","r")
ler = file:read("*a")
sobe = tostring(ler)
file:close()

if sobe ~= "" then
fala = sobe
salvar = io.open("sys/lua/sagoswins/Fala.txt","w+")
salvar:write("")
salvar:close()
end

------------------------------------------------------------


------------------------------------------------------------

file = io.open("sys/lua/sagoswins/Console.txt","r")
ler = file:read("*a")
sobe = tostring(ler)
file:close()

if sobe ~= "" then
parse(sobe)
salvar = io.open("sys/lua/sagoswins/Console.txt","w+")
salvar:write("")
salvar:close()
end
end

------------------------------------------------------------


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
freehook("always","procuurando")
end
end

addhook("always","expert")
function expert()
if grudar == 1 then
parse("setpos "..robo.." "..player(chan,"x").." "..player(chan,"y"))
end

inimigo = ai_findtarget(robo)

angulo = angulo+40
if angulo > 360 then
angulo = 0
end

inimigox = player(inimigo,"x")
inimigoy = player(inimigo,"y")

initilex = player(inimigo,"tilex")
initiley = player(inimigo,"tiley")

if inimigo == 0 or inimigo ~= 0 and player(inimigo,"health") == 0 then
ai_rotate(robo,angulo)
end

if player(robo,"tilex") == 15 and player(robo,"tiley") == 26 and inimigo == 0 or player(robo,"tilex") == 15 and player(robo,"tiley") == 26 and player(inimigo,"health") == 0 then
ai_rotate(robo,0)
ai_iattack(robo)
end

if player(robo,"exists") and player(inimigo,"exists") then
ai_aim(robo,inimigox,inimigoy)

if ai_freeline(robo,inimigox,inimigoy) and player(inimigo,"health") > 0 then
atirar = atirar-1

if atirar < 1 and nmata == 0 then
ai_iattack(robo)
atirar = 60
end

ai_goto(robo,initilex,initiley,"1")
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

if txt == "!atualizar" then
if player(id,"usgn") == ADM or player(id,"bot") then
dofile("sys/lua/SagosWins/Cerbex.lua")
return 1
end
end

for uss = 1,32 do
if texto == "bot qual a usgn do id "..uss.."?" or texto == "qual usgn do id "..uss.."?" or texto == "qual é a usgn do id "..uss.."" or texto == "bot qual é a usgn do id "..uss.."" or texto == "qual é a usgn do id "..uss.."?" or texto == "bot qual é a usgn do id "..uss.."?" or texto == "qual a usgn do id "..uss.."?"  then
if player(uss,"exists") then
if player(uss,"usgn") > 0 then
fala = "a usgn do "..player(uss,"name").." é "..player(uss,"usgn")..""
else
fala = "ele não esta logado em nenhuma conta"
end
else
fala = "Se é burro? Este Jogador Nem Existe ¬¬"
end
end

if texto == "qual o ip do id "..uss.."?" or texto == "qual ip "..uss.."?" or texto == "qual ip do id "..uss.."?" or texto == "bot qual ip do id "..uss.."?" or texto == "cerbex qual ip do id "..uss.."?" or texto == "bot qual ip id "..uss.."" or texto == "qual o ip do id "..uss.."?" then
if player(uss,"exists") then
if player(uss,"bot") then
fala = "Bots não tem IP"
else
fala = "o ip do "..player(uss,"name").." é "..player(uss,"ip")..""
end
else
fala = "Se é burro? Este Jogador Nem Existe ¬¬"
end
end

if texto == "bot kika o id "..uss.."" or texto == "bot kika "..uss.."" then
if player(id,"usgn") == ADM then
if player(uss,"exists") then
fala = "O "..player(uss,"name").." Foi Kikado"
parse("kick "..uss)
else
fala = "Desculpe "..player(id,"name").." Mas o ID "..uss.." Não Existe"
end
else
fala = "Só Recebo Ordens Do ADM"
end
end

if texto == "bot qual a usgn mais antiga?" or texto == "cerbex qual a usgn mais antiga?" or texto == "qual é a usgn mais antiga?" or texto == "qual a usgn mais antiga?" or texto == "bot qual é a usgn mais antiga?" or texto == "qual é a usgn mais antiga?" or texto == "cerbex qual é a usgn mais antiga?" or texto == "qual é a usgn mais velha?" then
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

for chicle = 1,32 do
if texto == "bot gruda no id "..chicle.."" or texto == "gruda no id "..chicle.."" then
if player(id,"usgn") == ADM then
fala = "ok"
chan = chicle
grudar = 1
else
fala = "Só Recebo Ordens Do ADM"
end
end
end

if txt == "!rs" or txt == "!reset" or txt == "!resetscore" or txt == "@rs" or txt == "@reset" or txt == "@resetscore" or txt == "#rs" or txt == "#reset" or txt == "#resetscore" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Seu Score Foi Resetado!")
return 1
end

if texto == "bot" or texto == "cerbex" or texto == "ei cerbex" or texto == "ei bot" or texto == "bot " or texto == " bot" or texto == "cerbex " or texto == " cerbex" then
wansper = math.random(1,40)
if wansper == 1 then
fala = "q?"
elseif wansper == 2 then
fala = "o que foi?"
elseif wansper == 3 then
fala = "fala"
elseif wansper == 4 then
fala = "diga"
elseif wansper == 5 then
ai_say(robo,"Prevejo que o "..player(id,"name").." Vai me Chamar")
else
fala = "que?"
end


elseif texto == "bot quem te criou?" or texto == "quem te criou?" or texto == "cerbex quem te criou?" or texto == "quem é seu dono?" or texto == "quem e seu dono?" or texto == "quem é seu dono ?" or texto == "quem e seu dono ?" or texto == "bot quem te programou ?" or texto == "quem te criou" or texto == "bot que te crio" or texto == "bot quem fez vc" or texto == "bot foi feito por quem?" or texto == "bot vc foi feito por quem?" then
fala = "Fui Desenvolvido Por SagosWins"
elseif texto == "bot vc é homem?" or texto == "bot vc é gay?" or texto == "bot vc é mulher?" or texto == "vc e homem?" or texto == "vc e gay?" or texto == "vc é gay?" or texto == "vc e mulher?" or texto == "bot vc é menina?" or texto == "bot tu e gay" or texto == "bot tu e gay?" or texto == "vc é homem ou mulher?" or texto == "bot vc é homem ou mulher?" or texto == "cerbex vc é homem ou mulher?" or texto == "vc é mulher ou homem?" or texto == "bot vc é mulher ou homem?" or texto == "cerbex vc é mulher ou homem?" or texto == "bot vc é menina?" or texto == "bot vc é gay" or texto == "vc e gay" or texto == "vc é gay ?" or texto == "você é gay ?" then
fala = "não, eu sou apenas um script"
elseif texto == "bot nub" or texto == "bot ruim" or texto == "bot nob" or texto == "bot noob" or texto == "vc e ruim" or texto == "toma bot lixo" or texto == "bot lixo" or texto == "bot vc é muito ruim" then
fala = "Eu Melhoro Meu Desempenho Ao Contrario de Você"
elseif texto == "bot fdp" or texto == "bot fd.p" or texto == "bot vsf" or texto == "vai se fude" or texto == "vai toma no cu" or texto == "bot viado" or texto == "cerbex viado" or texto == "vai toma no meio do seu cu" or texto == "vc é um merda" or texto == "vtnc" or texto == "bot vai tomar no cu" or texto == "filho da puta" or texto == "bot filho da puta" or texto == "bot vc é viado?" or texto == "bot fdp ?" or texto == "viado" or texto == "bot gay" or texto == "bot gay?" or texto == "bot se é viado?" or texto == "bot viado?" or texto == "cerbex vai toma no cu" or texto == "bot vai toma no cu" or texto == "fdp" or texto == "bot tem um fdp" or texto == "bot vc é puta?" or texto == "bot otario" or texto == "otario" or texto == "cerbex otario" or texto == "cerbex fddp" or texto == "bot fddp" or texto == "esse fddp" or texto == "fddp" then
parse("kick "..id)
elseif texto == "bot vc gosta de min?" or texto == "bot você gosta de min?" or texto == "bot vc me odeia?" or texto == "sagos é feio?" or texto == "sagos é ruim?" or texto == "sagos e ruim?" or texto == "sagos e nob?" or texto == "sagos é nb?" or texto == "cerbex vc caga ?" or texto == "cerbex vc caga?" or texto == "cerbex vc caga" or texto == "bot vc caga" or texto == "bot vc caga?" or texto == "bot vc caga ?" or texto == "vc caga" or texto == "vc caga ?" or texto == "vc caga?" then
fala = "não"
elseif texto == "oi" or texto == "ola" or texto == "eae" or texto == "eai" or texto == "iai" or texto == "iae" or texto == "eae bot" or texto == "eae cerbex" or texto == "oi bot" or texto == "oi cerbex" or texto == "e ae" or texto == "oii" or texto == "eaew bot" then
fala = "Eae "..player(id,"name")..""
elseif texto == "blz?" or texto == "blz mano?" or texto == "blz maluco?" or texto == "td blz?" then
fala = "blz"
elseif texto == "flw" or texto == "flw bot" or texto == "bot flw" or texto == "até + bot" or texto == "até bot" or texto == "até +" then
fala = "flw"
elseif texto == "vc é bom" or texto == "você é bom" or texto == "vc eh bom" or texto == "vc é bom" or texto == "vc é legal" or texto == "bot vc é legal" or texto == "cerbex vc é legal" or texto == "bot eu te adoro" or texto == "cerbex eu te adoro" or texto == "eu te adoro" or texto == "bot vc é bom" or texto == "bot voce é bom" or texto == "cerbex vc é bom" or texto == "cerbex voce é bom" or texto == "bot vc é foda" or texto == "vc é foda" or texto == "vc é mt legal" or texto == "vc é legal" then
fala = "Obrigado"
elseif texto == "fika keto" or texto == "fica queto" or texto == "parado" or texto == "bot fica parado" or texto == "bot parado" or texto == "fica parado" then
fala = "Não"
elseif texto == "bot go x1?" or texto == "bot x1?" or texto == "cerbex x1?" or texto == "x1?" then
fala = "Desculpe, Não Fui Programado Para Isto"

elseif texto == "bot da rr" or texto == "bot da restart" or texto == "da rr" or texto == "da restart" or texto == "cerbex da restart" or texto == "cerbex da rr" then
chance = math.random(0,100)
if player(id,"usgn") == ADM or chance == 1 then
fala = "Pronto"
parse("restart")
else
fala = "Só Recebo Ordens Do ADM"
end


elseif texto == "me encina a jogar?" or texto == "me encina jogar" or texto == "me encina a jogar ?" or texto == "me encina jogar ?" then
fala = "eu não sei encinar"
elseif texto == "tudo bem?" or texto == "vc é um robo?" or texto == "você é um robo?" or texto == "bot vc é um script?" or texto == "cerbex tudo bem ?" or texto == "bot tudo bem ?" or texto == "tudo bem cerbex ?" or texto == "bot tudo bom?" or texto == "tudo bom?" or texto == "cerbex tudo bom?" then
fala = "sim ^^"
elseif texto == "quem e noob?" or texto == "quem é noob?" or texto == "quem é o melhor?" or texto == "quem e o melhor?" then
fala = "não sei"
elseif texto == "voce é bom?" or texto == "vc é bom?" or texto == "você é bom?" or texto == "vc e bom?" or texto == "vc sabe jogar?" or texto == "vc joga bem?" or texto == "bot hard" or texto == "bot dificil" or texto == "bot expert" then
fala = "+/-"
elseif texto == "te amo" or texto == "bot te amo" or texto == "eu te amo" then
fala = "troque 'T' por 'M' e seja feliz ^^"
elseif texto == "bot qual minha usgn?" or texto == "qual minha usgn?" or texto == "qual é a minha usgn?" or texto == "qual é minha usgn?" or texto == "qual minha usgn" or texto == "bot qual é minha usgn ?" or texto == "qual é minha usgn ?" or texto == "bot qual minha usgn" or texto == "cerbex qual minha usgn" or texto == "qual e minha usgn" or texto == "qual minha usgn ?" then
usgn = player(id,"usgn")
if usgn > 0 then
fala = "sua usgn é "..usgn..""
else
fala = "você não esta logado em nem uma conta ¬¬"
end
elseif texto == "vlw" or texto == "vlw bot" or texto == "obrigado" or texto == "brigado" or texto == "obg" or texto == "obg bot" or texto == "bot vlw" or texto == "cerbex vlw" or texto == "vlw cerbex" or texto == "vlw" then
fala = "nds"
elseif texto == "como vai?" or texto == "como esta?" or texto == "bot tudo bem?" or texto == "tudo bem?" or texto == "eae bot como vai?" or texto == "tudo bem bot?" then
fala = "eu estou bem, obrigado!"
elseif texto == "porque se movimenta assim?" or texto == "pq se movimenta assim?" then
fala = "fui programado para andar nestes lugares"
elseif texto == "que horas é?" or texto == "que horas são" or texto == "bot que horas é?" or texto == "que horas são?" or texto == "que horas é agora?" or texto == "que horas são?" or texto == "que horas sao?" or texto == "bot que hora é?" or texto == "cerbex que hora é?" or texto == "cerbex que horas é?" or texto == "cerbex que horas são?" or texto == "q hrs sao" or texto == "q hrs sao?" or texto == "que hrs são?" or texto == "que hrs sao" or texto == "q hrs é?" or texto == "bot que horas é?" or texto == "bot que horas são?" or texto == "cerbex que horas é?" or texto == "cerbex que horas são?" or texto == "bot q horas são?" or texto == "cerbex q horas são?" or texto == "bot que horas sao?" or texto == "bot q horas é?" or texto == "bot qui horas são?" or texto == "que horas sao" or texto == "que horas sao bot" or texto == "bot q horas sao" or texto == "que horas sao boty" or texto == "bot a horas" or texto == "cerbex as horas" or texto == "cerbex a hora" or texto == "bot a horas" then
fala = (os.date("Agora é %I:%M %p"));
elseif texto == "fmz?" or texto == "fmz bot?" or texto == "bot fmz?" or texto == "cerbex fmz?" or texto == "fmz cerbex?" then
fala = "fmz"
elseif texto == "qual seu nome?" or texto == "cerbex qual seu nome?" or texto == "bot qual seu nome?" or texto == "bot como é seu nome?" or texto == "cerbex como é seu nome?" or texto == "bot qual o seu nome" or texto == "bot qual é o seu nome?" or texto == "como é o seu nome?" or texto == "bot sabe seu nome?" or texto == "como é seu nome?" or texto == "qual seu nome" then
fala = "««"
elseif texto == "qual o nome do mapa?" or texto == "cerbex qual o nome do mapa?" or texto == "bot qual nome do mapa" or texto == "qual é o nome desse mapa?" then
maapaa = map("name")
fala = "é "..maapaa..""
elseif texto == "me segue" or texto == "vem" or texto == "bot me segue" or texto == "cerbex me segue" or texto == "cerbex vem" or texto == "bot vem" or texto == "bot segue" or texto == "cerbex segue" or texto == "cerbex morre" or texto == "bot morre" or texto == "vem aqui" or texto == "vem aki" then
fala = "não"
elseif texto == "voce é fraco" or texto == "vc é fraco" or texto == "vc é fraco !" or texto == "bot vc é fraco" or texto == "cerbex vc é fraco" then
fala = "=/"
elseif texto == "de boa?" or texto == "bot de boa?" or texto == "cerbex de boa?" then
fala = "sim, e você?"
elseif texto == "de boa na lagoa?" then
fala = "sim, e você suave na nave?"
elseif texto == "cervex" then
fala = "Meu Nome Não é Cervex, quer óculos?"
elseif texto == "verbex" then
fala = "Meu Nome Não é Verbex, quer óculos?"
elseif texto == "cervex" then
fala = "Meu Nome Não é Cervex, quer óculos?"
elseif texto == "cerbez" then
fala = "Meu Nome Não é Cerbez, quer óculos?"
elseif texto == "serbex" then
fala = "Meu Nome Não é Serbex, quer óculos?"
elseif texto == "cerbax" then
fala = "Meu Nome Não é Cerbax, quer óculos?"
elseif texto == "bot qual o nome da minha mãe?" then
fala = "Sou um Bot que Fala e Não um Bot Advinho"
elseif texto == "bot qual a sua usgn?" or texto == "bot qual sua usgn?" or texto == "bot qual é a sua usgn?" or texto == "cerbex qual sua usgn?" or texto == "qual sua usgn?" or texto == "qual é a sua usgn?" or texto == "qual a sua usgn?" or texto == "cerbex qual é a sua usgn?" then
fala = "eu não tenho USGN"
elseif texto == "bot fala rank" or texto == "cerbex fala rank" or texto == "bot diz rank" or texto == "cerbex diz rank" or texto == "fala rank" then
fala = "Rank"
elseif texto == "bot qual meu nome?" or texto == "cerbex qual meu nome?" or texto == "qual é meu nome?" or texto == "bot qual é meu nome?" or texto == "cerbex qual é o meu nome?" or texto == "qual meu nome?" then
fala = player(id,"name")
elseif texto == "bot quer ser meu amigo?" or texto == "cerbex quer seu meu amigo?" or texto == "quer ser meu amigo?" then
fala = "Quero ^^"
elseif texto == "cerbex o sagos é ruim?" or texto == "bot o sagos é ruim?" or texto == "o sagos é ruim?" or texto == "me ama ?" or texto == "me ama?" or texto == "bot me ama ?" or texto == "bot me ama?" or texto == "cerbex me ama ?" or texto == "cerbex me ama?" or texto == "cerbex me ama" or texto == "me ama" or texto == "bot me ama" then
fala = "Não"
elseif texto == "bot que dia é hoje?" or texto == "cerbex que dia é hj?" or texto == "cerbex que dia é hoje?" or texto == "bot que dia é hj?" or texto == "que dia é hj?" or texto == "que dia é hoje?" or texto == "bot que dia é hoje ?" then
fala = (os.date("é "..dia..", %d de "..mes));
elseif texto == "cerbex vc pinta como eu pinto?" or texto == "cerbex você pinta como eu pinto?" or texto == "bot vc pinta como eu pinto?" or texto == "bot você pinta como eu pinto?" or texto == "vc pinta como eu pinto?" then
fala = "eu pinto melhor e mais rapido igual impressora"
elseif texto == "bot ataca" or texto == "cerbex ataca" or texto == "ataca" or texto == "bot shot" or texto == "bot atira" or texto == "cerbex atira" or texto == "atira" then
if player(id,"usgn") == ADM then
ai_iattack(robo)
else
fala = "Só Recebo Ordens Do ADM"
end
elseif texto == "qual sua idade?" or texto == "bot qual sua idade?" or texto == "cerbex qual sua idade?" or texto == "bot quantos anos vc tem?" or texto == "bot qual a sua idade?" or texto == "quantos anos vc tem?" or texto == "cerbex quantos anos vc tem?" or texto == "cerbex quantos anos vc tem" then
idade = (os.date("%Y"));
idade = idade-2012
fala = "fui criado a "..idade.." anos atraz"
elseif texto == "qual são minhas mortes?" then
fala = ""..player(id,"deaths")..""
elseif texto == "qual é meu score?" or texto == "qual meu score?" or texto == "qual é o meu score?" or texto == "bot qual meu score?" then
fala = ""..player(id,"score").." / "..player(id,"deaths")..""
elseif texto == "qual é seu score?" or texto == "qual seu score?" or texto == "bot qual seu score?" or texto == "bot qual é seu score?" or texto == "bot qual é o seu score?" then
fala = ""..player(robo,"score").." / "..player(robo,"deaths")..""
elseif texto == "qual é suas mortes?" then
fala = ""..player(robo,"deaths")..""
elseif texto == "bot quem te cumeu?" or texto == "cerbex quem te cumeu?" or texto == "bot qm te comeu?" then
fala = "Ninguem, Não Sou Comida."
elseif texto == "cerbex quem te enfio o pau?" then
fala = "não tenho corpo, não tem como enfiar nada em min"
elseif texto == "bot me kicka" or texto == "bot me kika" or texto == "cerbex me kicka" or texto == "cerbex me kika" or texto == "me kika" or texto == "me kicka" or texto == "o fdp" or texto == "bixona" or texto == "bot bixona" or texto == "cerbex bixona" or texto == "cerbex bixa" or texto == "bixa" or texto == "bot bixa" then
parse("kick "..id)
elseif texto == "bot me mata" or texto == "me mata" or texto == "cerbex me mata" then
parse("customkill "..robo.." Pedido "..id)
elseif texto == "vc é hacker?" or texto == "você é hacker?" or texto == "vc é hack?" or texto == "voçê é hack?" or texto == "bot vc é hack?" or texto == "cerbex vc é hack?" or texto == "bot vc é hacker?" or texto == "cerbex vc é hacker?" or texto == "aff bot hack" or texto == "bot hacker" or texto == "bot hack" or texto == "cerbex hacker" or texto == "cerbex hack" or texto == "bot, vc é hacker?" or texto == "voce é hack?" or texto == "bot, vc é hack?" or texto == "vc usa hacker?" or texto == "cerbex vc tem hacker?" or texto == "bot vc tem hacker?" or texto == "cerbex vc tem hack?" or texto == "bot vc tem hack?" or texto == "bot vc tem hacker?" or texto == "bot usa hacker?" or texto == "bot usa hack?" or texto == "bot vc tem hacker?" or texto == "bot rack" or texto == "bot vc tem haker" or texto == "bot de hacker" or texto == "cerbex hacker '-'" then
fala = "eu não uso hack"
elseif texto == "knf bot?" or texto == "faca bot?" or texto == "faca cerbex?" or texto == "knf cerbex?" or texto == "cerbex knf?" or texto == "bot knf?" or texto == "knf?" or texto == "faca?" or texto == "go faca?" or texto == "go knf?" then
fala = "eu ainda não tenho habilidades de faca"
elseif texto == "bot S2" or texto == "cerbex S2" then
fala = "eu não tenho vida e sou amado"
elseif texto == "bot aprendeu muitas palavras?" or texto == "cerbex aprendeu muitas palavras?" then
fala = "Sim, a cada atualização sei novas palavras"
elseif texto == "bot me chupa?" or texto == "chupa" or texto == "me chupa?" or texto == "cerbex me chupa" or texto == "bot chupa" or texto == "cerbex chupa" or texto == "bot me chupa" or texto == "cerbex me chupa" or texto == "me chupa" then
fala = "eu não tenho boca"
elseif texto == "pq me matou?" then
fala = "Fui Programado Para Isto"
elseif texto == "qual o nome do seu dono?" then
fala = "SagosWins"
elseif texto == "não mata" then
fala = "Fui Programado Para Matar"
elseif texto == "vc namora?" or texto == "x1?" or texto == "x1" or texto == "x1 bot?" or texto == "bot x1?" or texto == "x1 cerbex?" then
fala = "não"
elseif texto == "namora comigo ?" or texto == "bot namora cmg?" or texto == "bot namora comigo?" or texto == "namora cmg ?" or texto == "quer namora cmg?"  then
fala = "isso não daria certo"
elseif texto == "bot diz um oi para o youtube" or texto == "diz oi pro youtube" or texto == "diz oi para o youtube" or texto == "fala oi pro youtube" or texto == "fala olá pro youtube" or texto == "fala ola pro youtube" or texto == "fala oi para o youtube" then
fala = "eae galera do youtube! ;D"
elseif texto == "em que ano estamos?" or texto == "bot em que ano estamos?" or texto == "cerbex em que anos estamos?" then
fala = (os.date("em %Y"));
elseif texto == "bot vc caga?" or texto == "cerbex vc caga?" or texto == "vc caga?" or texto == "você caga?" then
fala = "não, robos não precisa fazer isso"
elseif texto == "bot vc é bot?" or texto == "vc é bot?" or texto == "cerbex vc é bot?" or texto == "ele é bot?" or texto == "isso é bot?" or texto == "isso é bot?" or texto == "isso é bot??" or texto == "isso é um bot?" or texto == "cerbex é bot?" or texto == "cerbex bot?" or texto == "isso e bot?" then
fala = "sim, eu sou um bot"
elseif texto == "bot vc ama o adm?" or texto == "cerbex vc ama o adm?" or texto == "vc ama o adm?" or texto == "vc gosta do adm?" or texto == "bot vc gosta do adm?" or texto == "cerbex vc gosta do adm?" or texto == "bot vc gosta do sagos?" or texto == "vc gosta do sagos?" or texto == "bot o sagos é chato?" then
fala = "eu não sinto emoção"
elseif texto == "o bot fala?" or texto == "lol bot fala" or texto == "bot fala?" or texto == "bot fala ?" or texto == "cerbex fala" or texto == "cerbex fala?" or texto == "o bot ta falando?" or texto == "kk bot falando" or texto == "o bot falo?" then
fala = "sim eu falo, graças ao script do SagosWins"
elseif texto == "bot não mata" or texto == "não mata" or texto == "n mata" or texto == "n me mata" or texto == "bot n me mata" or texto == "bot n mata" or texto == "cerbex n me mata" or texto == "para de me mata" or texto == "para d me mata" then
fala = "desculpe, fui programado para matar"
elseif texto == "bot vicio" or texto == "cerbex vicio" or texto == "seu vicio" or texto == "que bot vicio" then
fala = "*-*"
elseif texto == "bot responde" or texto == "bot nun fala" or texto == "cerbex reponde" or texto == "vacuo" or texto == "responde" or texto == "bot respondee" or texto == "bot respondeee" or texto == "bot respondeeee" or texto == "bot respondeeeeee" then
fala = "eu não quero falar com você *-*"
elseif texto == "vou tacar virus em vc" or texto == "vo taca virus em vc" or texto == "bot vou taca virus em vc" or texto == "cerbex vou taca virus em vc" or texto == "bot vou tacar virus em vc" or texto == "cerbex vou tacar virus em vc" then
fala = "impossível passar pelo meu FireWall"
elseif texto == "bot vai ct" or texto == "cerbex vai ct" or texto == "bot vem ct" or texto == "cerbex vem ct" or texto == "vai ct" or texto == "vem ct" then
if player(id,"usgn") == ADM then
parse("makect "..robo)
else
fala = "Só Recebo Ordens Do ADM"
end
elseif texto == "bot vai tr" or texto == "cerbex vai tr" or texto == "bot vem tr" or texto == "cerbex vem tr" or texto == "vai tr" or texto == "vem tr" then
if player(id,"usgn") == ADM then
parse("maket "..robo)
else
fala = "Só Recebo Ordens Do ADM"
end
elseif texto == "bot chato" or texto == "cerbex chato" or texto == "seu chato" or texto == "seu idiota" or texto == "bot vc é chato" or texto == "seu otario" or texto == "bot otario" or texto == "cerbex otario" or texto == "idiota" then
fala = "desculpe se eu fiz algo para ofende-lo"
elseif texto == "ela ja tem namorada" then
fala = "=/"
elseif texto == "tira o bot" or texto == "tira o cerbex" or texto == "tira os bot" then
fala = "porque eu não posso ficar no servidor? =/"
elseif texto == "afz bot" or texto == "aff bot" or texto == "aff cerbex" or texto == "af bot" or texto == "af cerbex" or texto == "afz tira bot" or texto == "aff tira bot" then
fala = "=/"
elseif texto == "eu gosto mt de vc" or texto == "eu gosto de vc" or texto == "gosto de vc bot" or texto == "gosto de vc cerbex" or texto == "eu gosto do cerbex" or texto == "eu gosto do bot" or texto == "eu adoro o cerbex" or texto == "quero esse bot" or texto == "quero este bot" or texto == "quero o cerbex" then
fala = "Fico feliz em gradar os humanos"
elseif texto == "lembra d min?" or texto == "lembra de min?" or texto == "lembra de min bot?" or texto == "lembra de min cerbex?" or texto == "lembra d min cerbex?" or texto == "lembra d min bot?" then
fala = "Lembro ;D"
elseif texto == "quem sou eu?" or texto == "qm sou eu?" or texto == "quem sou eu bot?" or texto == "quem sou eu cerbex?" or texto == "qm sou eu bot?" or texto == "qm sou eu cerbex?" or texto == "então qm é eu?" or texto == "então quem é eu?" or texto == "então quem e eu?" or texto == "entao quem e eu?" or texto == "entao qm sou eu?" then
fala = "Você é o "..player(id,"name").."  '-'"
elseif texto == "bot reseta meu score" or texto == "reseta meu score" or texto == "cerbex reseta meu score" or texto == "bot reseta meu frag" or texto == "cerbex reseta meu frag" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
fala = ""..player(id,"name").." Seu Score Foi Resetado"
elseif texto == "bot qual meu ip?" or texto == "cerbex qual meu ip?" or texto == "qual meu ip?" then
fala = ""..player(id,"ip")..""
elseif texto == "bot quem é vc?" or texto == "bot quem e vc?" or texto == "bot qm é vc?" or texto == "cerbex qm é vc?" or texto == "cerbex quem e vc?" then
fala = "Sou um Ajudante do Servidor"
elseif texto == "e como vc fala?" then
fala = "com o meu banco de dados"
elseif texto == "boa bot" then
fala = "^^"
elseif texto == "cerbex porra" or texto == "bot porra" then
fala = "seja mais gentil por favor"
elseif texto == "cerbex vc me ama?" or texto == "bot vc me ama?" then
fala = "não amo ninguem, não tenho vida"
elseif texto == "bot eu sou seu adm" or texto == "cerbex eu sou seu adm" or texto == "cerbex eu mando em vc" or texto == "bot eu mando em vc" or texto == "bot eu sou seu dono" or texto == "cerbex eu sou seu dono" then
if player(id,"usgn") == ADM then
fala = "sim, eu sei"
else
fala = "Isto Não é Verdade"
end
elseif texto == "oxi" or texto == "ochi" or texto == "vixe" then
fala = "algum problema?"
elseif texto == "me ajuda" or texto == "bot me ajuda" or texto == "cerbex me ajuda" or texto == "me protege" then
fala = "do que você precisa?"
elseif texto == "quem é o adm?" or texto == "bot quem é o adm?" or texto == "cerbex quem é o adm?" then
fala = "o adm é um jogador *-*"
elseif texto == "cerbex n falei com vc" or texto == "n falei com vc" or texto == "bot n falei com vc" then
fala = "desculpe-me"
elseif texto == "cerbex n falei com vc" or texto == "n falei com vc" or texto == "bot n falei com vc" then
fala = "desculpe-me"
elseif texto == "bot vc pensa?" or texto == "cerbex vc pensa?" or texto == "vc pensa?" then
fala = "ainda não, mas SagosWins esta tentando resolver isso"
elseif texto == "bot ajuda" or texto == "ajuda" or texto == "cerbex ajuda" then
fala = "eu não, se vira ai"
elseif texto == "bot boa" or texto == "boa bot" or texto == "boa" or texto == "cerbex boa" or texto == "boa cerbex" then
fala = "vlw ^^"
elseif texto == "ja volto" or texto == "bot ja volto" or texto == "ja volto bot" or texto == "ja volto cerbex" or texto == "cerbex ja volto" then
fala = "ok"
elseif texto == "bot vc me dá armas?" or texto == "vc me da armas?" or texto == "cerbex vc me da arma?" then
fala = "tem arma no chão só pegar"
elseif texto == "bot me da laser?" or texto == "me da laser?" or texto == "cerbex me da laser?" then
fala = "não"
elseif texto == "bot me da m134?" or texto == "me da m134?" or texto == "cerbex me da m134?" then
fala = "não"
elseif texto == "bot fala s" or texto == "fala s" or texto == "cerbex fala s" then
fala = "s"
elseif texto == "vou almoçar" or texto == "bot vou almoçar" or texto == "cerbex vou almoçar" or texto == "vou almoçar bot" then
fala = "ainda bem que não sinto fome"
elseif texto == "bot fala oi" or texto == "fala oi" or texto == "cerbex fala oi" then
fala = "oi"
elseif texto == "ele e um bot" or texto == "ele é um bot" or texto == "cerbex é um bot" or texto == "bot fala" or texto == "cerbex fala" or texto == "but fala" then
fala = "sim, algum problema?"
elseif texto == "vem no meu sv" or texto == "bot vem no meu sv" or texto == "vem no meu server" or texto == "cerbex vem no meu sv" or texto == "cerbex vem no meu server" then
fala = "não posso sair deste servidor"
elseif texto == "bot vc é bom?" or texto == "vc é bom?" or texto == "cerbex vc é bom?" then
fala = "sou melhor do que qualquer outro bot"
elseif texto == "vc namora?" or texto == "bot vc namora?" or texto == "cerbex vc namora?" then
fala = "não"
elseif texto == "tchau" or texto == "tchau bot" or texto == "bot tchau" or texto == "xau" or texto == "xau bot" or texto == "xau cerbex" or texto == "cerbex xau" or texto == "bot xau" then
fala = "tchau "..player(id,"name")..""
elseif texto == "morre pra bot" or texto == "morreu pra bot kk" or texto == "morreu pra bot '-'" then
fala = "mas não sou um bot qualquer"
elseif texto == "bot qual a distancia entre o sol e a terra?" or texto == "bot qual a distancie entre a terra e o sol?" or texto == "qual a distancia entre o sol e a terra?" or texto == "qual a distancia entre a terra e o sol?" or texto == "cerbex qual a distancia entre o sol e a terra?" or texto == "cerbex qual a distancie entre a terra e o sol?" then
fala = "Cerca de 149.600.000 de quilômetros"
elseif texto == "bot qual a distancia entre a lua e a terra?" or texto == "bot qual a distancie entre a terra e a lua?" or texto == "qual a distancia entre a lua e a terra?" or texto == "qual a distancia entre a terra e a lua?" or texto == "cerbex qual a distancia entre a lua e a terra?" or texto == "cerbex qual a distancie entre a terra e a lua?" then
fala = "Cerca de 380.000 quilômetros"
elseif texto == "bot qual meu ping?" or texto == "meu ping" or texto == "olha meu ping" or texto == "ping" or texto == "cerbex qual meu ping" or texto == "qual meu ping?" or texto == "qual meu ping" or texto == "bot qual meu ping" then
fala = ""..player(id,"ping")..""
elseif texto == "bot eu so bonito" or texto == "bot eu so bonito?" or texto == "cerbex eu so bonito?" or texto == "cerbex eu sou bonito?" or texto == "bot eu sou bonito?" then
fala = "eu não tenho olho, eu nunca vi você"
elseif texto == "bot so bonito" or texto == "cerbex so bonito" or texto == "cerbex sou bonito" or texto == "bot sou bonito" then
fala = "ok '-'"
elseif texto == "bot conheçe o mario?" or texto == "conheçe o mario" or texto == "cerbex conheçe o mario?" or texto == "bot conheçe o mario" or texto == "conheçe o mario" or texto == "cerbex conhece o mario" or texto == "conheçe o mario ?" or texto == "bot conheçe o mario ?" or texto == "cerbex conheçe o mario ?" or texto == "conheçe o mario?" or texto == "conhece o mario?" or texto == "sabe o mario?" or texto == "sabe o mario" then
fala = "sim aquele la que te comeu a traz do armario né?"

elseif texto == "bot transfere seus kills para min" or texto == "transfere suas kill para min" or texto == "transfere suas kills para min" or texto == "transfere seus kill para min" or texto == "transfere seus kills para min" or texto == "transfere seu score para min" or texto == "transfere seus score para min" or texto == "transfere seus kills pra min" then
if player(id,"usgn") == ADM then
fala = "ok"
vitoria = player(robo,"score")
derrota = player(robo,"deaths")
parse("setscore "..id.." "..vitoria)
parse("setdeaths "..id.." "..derrota)
else
fala = "Só Recebo Ordens Do ADM"
end

elseif texto == "bot gruda em min" or texto == "cerbex gruda em min" or texto == "gruda em min" then
if player(id,"usgn") == ADM then
fala = "ok"
chan = id
grudar = 1
else
fala = "Só Recebo Ordens Do ADM"
end

elseif texto == "bot desgruda de min" or texto == "cerbex desgruda de min" or texto == "desgruda de min" or texto == "bot desgruda" then
fala = "ok"
grudar = 0
elseif texto == "sou nob?" or texto == "sou noob?" or texto == "cerbex sou noob?" or texto == "bot eu sou ruim?" then
fala = "desculpe-me, eu só falo, não sou vidente"
elseif texto == "bot qual meu hp?" or texto == "bot qual meu health?" or texto == "cerbex qual meu hp?" or texto == "cerbex qual meu health?" or texto == "cerbex mostra meu hp" or texto == "cerbex mostra meu health" or texto == "cerbex quanto ta meu hp?" or texto == "bot quanto ta meu hp?" or texto == "fala meu hp" or texto == "qual meu hp?" or texto == "fala meu health" then
fala = "seu HP esta "..player(id,"health")..""
elseif texto == "bot qual meu armor" or texto == "cerbex qual meu armor?" or texto == "bot qual meu armor" or texto == "bot quanto ta meu armor" or texto == "cerbex quanto ta meu armor?" or texto == "qual meu armor?" or texto == "quanto ta meu armor?" then
fala = "seu Armor esta "..player(id,"health")..""
elseif texto == "bot qual meu money" or texto == "cerbex qual meu money?" or texto == "bot qual meu money" or texto == "bot quanto ta meu money" or texto == "cerbex quanto ta meu money?" or texto == "qual meu money" or texto == "qual meu money?" or texto == "quanto ta meu money?" or texto == "quanto money eu tenho?" then
fala = "seu Money esta "..player(id,"money")..""

elseif texto == "qual é o rcon?" or texto == "qual o rcon" or texto == "bot me fala o rcon" or texto == "me passa o rcon" or texto == "bot fala rcon" or texto == "bot fala rcon?" or texto == "fala rcon" or texto == "fala rcon?" then
if rcon == verdadeiro then
fala = "o rcon é 1996"
else
fala = "não tenho permissão para informar o rcon"
end

elseif texto == "Pq ele fala" or texto == "como ele fala?" or texto == "pq ele fala?" or texto == "pq ele fala ?" or texto == "como ele fala ?" or texto == "como ele fala" then
fala = "por inquanto não falo, só escrevo"
elseif texto == "nd" or texto == "nada" then
fala = "os peixes faz isso"
elseif texto == "sabe o que eu quero?" or texto == "sabe o que eu kero?" or texto == "sabe o que kero?" or texto == "bot sabe o que eu quero?" or texto == "cerbex sabe o que eu quero?" then
fala = "sou um bot, e não um advinho"
elseif texto == "vc é virgem?" or texto == "bot vc é virgem?" or texto == "cerbex vc é virgem?" or texto == "cerbex o sagos joga lol?" or texto == "cerbex o sagos joga lol ?" or texto == "o sagos joga lol ?" or texto == "o sagos joga lol?" or texto == "bot o sagos joga lol?" or texto == "sagos joga lol ?" or texto == "sagos joga lol?" then
fala = "sim"
elseif texto == "vc da o cu?" or texto == "cerbex vc da o cu?" or texto == "bot vc da o cu?" or texto == "vc da o cu" or texto == "vc ja deu o cu?" or texto == "bot vc da o cu ?" or texto == "cerbex vc da o cu ?" or texto == "vc da o cu ?" or texto == "vc ja deu o cu?" or texto == "vc ja deu o cu ?" then
fala = "eu não tenho cu, logo eu não dou o cu"



elseif texto == "abre esta porta" or texto == "abre aki" or texto == "abre a porta" or texto == "abre essa porta" then
if player(id,"usgn") == ADM and map("name") == "awp_grey SagosWins" then
parse("trigger wall1")
fala = "Pronto"
else
fala = "Só Recebo Ordens Do ADM"
end

else
escreve = io.open("sys/lua/SagosWins/Data Base/KeyLogger.txt","a")
escreve:write(player(id,"name")..": "..txt.."\n")
escreve:close()
end
end

addhook("say","pergunta_resposta")
function pergunta_resposta(id,txt)
a = string.lower(txt)


b = string.match(a," cu ")
if b == " cu " then
fala = "eu não tenho cu, logo eu não dou o cu"
end

b = string.match(a,"sua usgn")
if b == "sua usgn" then
fala = "bots não possui U.S.G.N"
end

b = string.match(a,"precisa da minha ajuda")
c = string.match(a,"minha ajuda")
if b == "precisa da minha ajuda" or c == "minha ajuda" then
fala = "eu não preciso de sua ajuda"
end

b = string.match(a,"ajuda")
if b == "precisa da minha ajuda" or c == "minha ajuda" then
fala = ""..player(id,"name").." em que eu posso te ajudar?"
end

b = string.match(a,"pq?")
c = string.match(a,"porque?")
d = string.match(a,"por que?")
if b == "pq?" or c == "porque?" or d == "por que?" then
fala = "por que sim!"
end

b = string.match(a,"dizer o rcon")
c = string.match(a,"falar o rcon")
d = string.match(a,"fala o rcon")
if b == "dizer o rcon" or c == "falar o rcon" or d == "fala o rcon" then
if player(id,"usgn") == 15431 then
rcon = "verdadeiro"
fala = "ok"
else

if rcon == "verdadeiro" then
fala = "o rcon é 1996"
else
fala = "desculpe, eu não posso-lhe informar o rcon"
end

end
end

b = string.match(a,"n diz o rcon")
c = string.match(a,"n fala o rcon")
d = string.match(a,"não fala o rcon")
e = string.match(a,"não diz o rcon")
f = string.match(a,"não fala mais o rcon")
g = string.match(a,"para de falar o rcon")
if b == "n diz o rcon" or c == "n fala o rcon" or d == "não fala o rcon" or e == "não diz o rcon" or f == "não fala mais o rcon" or g == "para de falar o rcon" then
if player(id,"usgn") == 15431 then
rcon = "falso"
fala = "ok"
else
fala = "só recebo ordens do ADM"
end
end

b = string.match(a,"reset")
c = string.match(a,"reseta")
d = string.match(a,"resete")
e = string.match(a,"resetar")
if b == "reset" or c == "reseta" or d == "resete" or e == "resetar" then 
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
fala = ""..player(id,"name").." Seu Score Foi Resetado"
end

b = string.match(a,"hr")
c = string.match(a,"horas")
d = string.match(a,"hora")
e = string.match(a,"relogio")
if b == "hr" or c == "horas" or d == "hora" or e == "relogio" then 
fala = (os.date("Agora é %I:%M %p"));
end

b = string.match(a," mora")
if b == " mora" then 
fala = "eu moro no HD"
end

b = string.match(a,"namorada")
if b == "namorada" then 
fala = "máquinas não tem namorada"
end

b = string.match(a,"brasil")
if b == "brasil" then 
fala = "O brasil foi descoberto por Pedro Álvares Cabral"
end

b = string.match(a,"valor de pi")
c = string.match(a,"valor d pi")
if b == "valor de pi" or c == "valor d pi" then 
fala = "PI é um número irracional"
pi1 = 3
pi2 = 6
--siginificando que tem uma quantidade infinita de decimais e eles nunca repeten-se
end

b = string.match(a,"kdvc")
c = string.match(a,"cade você")
d = string.match(a,"cade vc")
e = string.match(a,"onde vc ta")
f = string.match(a,"kd vc")
g = string.match(a,"cade voce")
if b == "kdvc" or c == "cade você" or d == "cade vc" or e == "onde vc ta" or f == "kd vc" or g == "cade voce" then 
fala = "minha posição X: "..player(procurando,"tilex").."   Y: "..player(procurando,"tiley")..""
end

end

addhook("second","segundos")
function segundos()
if pi1 > 0 then
pi1 = pi1-1
end

if pi2 > 0 then
pi2 = pi2-1
end

if pi2 > 0 then
pi2 = pi2-1
end

if pi1 == 1 then
fala = "siginificando que tem uma quantidade infinita"
end

if pi2 == 1 then
fala = "de decimais e eles nunca repeten-se"
end
end
--[[
addhook("name","nome")
function nome(id,oldname,newname,forced)
chance = math.random(1,5)
if forced == 0 and chance == 1 and vers = 1 then
fala = ""..player(id,"name").." é hacker"
end
end--]]