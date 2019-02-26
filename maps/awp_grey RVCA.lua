teleport = 0
tempo = 0
ralff = 0
x = 0
y = 0


addhook("serveraction","Entrada")
function Entrada(id,act)
if player(id,"usgn") == 15431 and act == 1 and teleport == 0 then
ralff = id
reqcld(id,2)
parse("setpos "..id.." 0 0")
parse("sv_sound SagosWins/Teleportar.wav")
teleport = 1
tempo = 2
end

if act == 3 and player(id,"usgn") == 15431 then
dofile("sys/lua/SagosWins/Teleportar.lua")
end
end

addhook("clientdata","Processo")
function Processo(id,mode,data1,data2)
x = data1
y = data2
parse('effect \"smoke\" '..x..' '..y..' 10 10 10 10 10')
end

addhook("second","Saida")
function Saida()
if tempo > 0 then
tempo = tempo-1
end

if tempo == 1 then
parse("setpos "..ralff.." "..x.." "..y)
teleport = 0
end
end