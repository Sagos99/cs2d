----------------------------------------------------------------------
-------------------------Script By Sagoswins--------------------------
----------------------------------------------------------------------

-----------------------------------------------------------------
nda = "Best Love Song"            --(O Nome Do Arquivo Que Esta Baixando)-----
mb  = 0              --(O tanto de MB que ja foi baixado)--------
vdd = 45              --(A Velocidade do kbps)------------
tda = 4              --(O Tamanho do arquivo que esta baixando)--
-----------------------------------------------------------------





------------Se Não Souber Scripts Não Modifique Aqui-------------
kb       = 0
segundos = 0
minutos  = 0
horas    = 0
dias     = 0
soma1    = 0
soma2    = 0
soma3    = 0
terminio = 0

addhook("second","net")
function net()
kb = kb+vdd

if kb > 999 then
mb = mb+1
kb = kb-1000
end

if mb < tda then
parse("hudtxt 5 \"Download em Andamento  "..kb.." KB          "..mb.." MB\" 10 410")
parse("hudtxt 6 \"Baixando "..nda.."  "..mb.." de "..tda.." MB\" 10 395")
parse("hudtxt 7 \"Terminio Daqui       "..dias.." Dias    "..horas.." Horas    "..minutos.." Minutos    "..segundos.." Segundos\" 10 425")
end

if mb >= tda then
terminio = 1
parse('hudtxt 5 "Download Concluido!" 10 425')
parse("hudtxtalphafade 0 6 0 0")
parse("hudtxtalphafade 0 7 0 0")
end

convert2 = mb*1000
convert1 = tda*1000-convert2

while soma1 < convert1 do
soma1 = soma1+vdd
segundos = segundos+1
end

while segundos > 59 do
segundos = segundos-60
minutos = minutos+1
end

while minutos > 59 do
minutos = minutos-60
horas = horas+1
end

while horas > 23 do
horas = horas-24
dias = dias+1
end

segundos = segundos-1

if terminio == 0 then
if segundos < 0 then
segundos = 59
minutos = minutos-1
end

if minutos < 0 then
minutos = 59
horas = horas-1
end

if horas < 0 then
horas = 24
dias = dias-1
end
end
end
------------------------------------------------------------------