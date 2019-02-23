sagos = 13903
tempo = -1

addhook("serveraction","et1")
function et1(id,act)
if act == 1 and player(id,"usgn") == sagos and tempo == -1 then
tempo = 0
end
end

addhook("second","blue")
function blue()

if tempo == 0 then
parse("sv_sound SagosWins/blue/Blue1.ogg")
end

if tempo == 29 then
parse("sv_sound SagosWins/blue/Blue2.ogg")
end

if tempo == 58 then
parse("sv_sound SagosWins/blue/Blue3.ogg")
end

if tempo == 87 then
parse("sv_sound SagosWins/blue/Blue4.ogg")
end

if tempo == 116 then
parse("sv_sound SagosWins/blue/Blue5.ogg")
end

if tempo == 145 then
parse("sv_sound SagosWins/blue/Blue6.ogg")
end

if tempo == 174 then
parse("sv_sound SagosWins/blue/Blue7.ogg")
end

if tempo == 203 then
tempo = -1
end

if tempo >= 0 then
tempo = tempo+1
end
end