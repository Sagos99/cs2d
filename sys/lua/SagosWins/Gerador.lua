addhook("say","nomealeatorio")
function nomealeatorio(id,txt)
if player(id,"usgn") == 15431 and txt == "!gerar" then

maximo = math.random(4,9)
contador = 0

a = ""
b = ""
c = ""
d = ""
e = ""
f = ""
g = ""
h = ""
i = ""

while contador < maximo do

if contador == 1 then
letra = math.random(97,122)
a = string.char(letra)

elseif contador == 2 then
letra = math.random(97,122)
b = string.char(letra)

elseif contador == 3 then
letra = math.random(97,122)
c = string.char(letra)

elseif contador == 4 then
letra = math.random(97,122)
d = string.char(letra)

elseif contador == 5 then
letra = math.random(97,122)
e = string.char(letra)

elseif contador == 6 then
letra = math.random(97,122)
f = string.char(letra)

elseif contador == 7 then
letra = math.random(97,122)
g = string.char(letra)

elseif contador == 8 then
letra = math.random(97,122)
h = string.char(letra)

elseif contador == 9 then
letra = math.random(97,122)
i = string.char(letra)
end

contador = contador+1
end

msg("©255255255Nome Aleatório: "..a..""..b..""..c..""..d..""..e..""..f..""..g..""..i.."")
return 1
end
end