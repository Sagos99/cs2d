USGN = 15431

tempo = 0

vida = 0
defesa = 0
x = 0
y = 0
velocidade = 0

addhook("second","gravar")
function gravar()
tempo = tempo+1
if tempo > 10 then
tempo = 0

vida = player(1,"health")
defesa = player(1,"armor")
velocidade = player(1,"speedmod")
x = player(1,"x")
y = player(1,"y")
end
end

addhook("hit","voltar")
function voltar(id,source,weapon,hpdmg,apdmg,rawdmg)
if id == 1 then
vida2 = player(1,"health")
vida2 = vida2-rawdmg
if vida2 < 1 then
matar = 1
else
matar = 0
end
if matar == 1 then
parse("setpos 1 "..x.." "..y)
parse("speedmod 1 "..velocidade)
parse("sethealth 1 "..vida)
parse("setarmor 1 "..defesa)
return 1
end
end
end