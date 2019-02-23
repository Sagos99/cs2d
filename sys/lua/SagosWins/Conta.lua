tempo_de_resposta = 10
numero = 11






fala = 0
tempo = tempo_de_resposta
addhook("movetile","ativar")
function ativar(id,x,y)
if x == 10 and y == 33 then
primeiro = math.random(0,numero)
segundo = math.random(0,numero)
terceiro = math.random(0,numero)
quarto = math.random(0,numero)
quinto = math.random(1,7)

if quinto == 1 then
result = primeiro*segundo
result = result+terceiro-quarto
msg("©255000255Quanto é "..primeiro.." x "..segundo.." + "..terceiro.." - "..quarto.." = ???")

elseif quinto == 2 then
result = primeiro+segundo
result = result*terceiro-quarto
msg("©255000255Quanto é "..primeiro.." + "..segundo.." x "..terceiro.." - "..quarto.." = ???")

elseif quinto == 3 then
result = primeiro-segundo
result = result*terceiro+quarto
msg("©255000255Quanto é "..primeiro.." - "..segundo.." x "..terceiro.." + "..quarto.." = ???")

elseif quinto == 4 then
result = primeiro-segundo
result = result+terceiro*quarto
msg("©255000255Quanto é "..primeiro.." - "..segundo.." + "..terceiro.." x "..quarto.." = ???")

elseif quinto == 5 then
result = primeiro*segundo
result = result-terceiro+quarto
msg("©255000255Quanto é "..primeiro.." x "..segundo.." - "..terceiro.." + "..quarto.." = ???")

elseif quinto == 6 then
result = "sagoswins"
msg("©255000255Quem é o Criador Deste Script???")

elseif quinto == 7 then
result = 0
msg("©255000255Quanto é 1+1+1+1+1+1+1*0 == ???")
end

resultado = tostring(result)
print(result)
cid = id
fala = 1
end
if x == 10 and y == 35 then
parse("setpos "..id.." 288 960")
end
end
addhook("say","resultadoo")
function resultadoo(id,txt)
if cid == id and fala == 1 then
if txt == resultado then
fala = 0
tempo = tempo_de_resposta
parse("trigger wall2")
msg("©255000255Correto o Resultado é "..result)
return 1
elseif txt ~= resultado and fala == 1 and cid == id then
parse("customkill 0 Errou a Conta "..id)
fala = 0
tempo = tempo_de_resposta
msg("©255000255O Resultado Não é "..txt.." e Sim "..result)
return 1
end
end
end
addhook("startround","valor_normal")
function valor_normal()
fala = 0
tempo = tempo_de_resposta
end
addhook("second","tempoo")
function tempoo()
if fala == 1 then
msg(tempo.."@C")
tempo = tempo-1
end
if tempo < 1 then
fala = 0
msg(tempo.."@C")
tempo = tempo_de_resposta
parse("customkill 0 O Tempo Acabou "..cid)
msg("©255000255O Resultado era "..result)
end
end