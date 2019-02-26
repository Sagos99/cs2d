-------------------------------------------------------------
----------------Script Criado por Sagoswins------------------
-------------------------------------------------------------

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 

jdsv=initArray(32)

ativarid1  = 0
ativarid2  = 0
ativarid3  = 0
ativarid4  = 0
ativarid5  = 0
ativarid6  = 0
ativarid7  = 0
ativarid8  = 0
ativarid9  = 0
ativarid10 = 0
ativarid11 = 0
ativarid12 = 0
ativarid13 = 0
ativarid14 = 0
ativarid15 = 0
ativarid16 = 0
tempoid1   = 21
tempoid2   = 21
tempoid3   = 21
tempoid4   = 21
tempoid5   = 21
tempoid6   = 21
tempoid7   = 21
tempoid8   = 21
tempoid9   = 21
tempoid10  = 21
tempoid11  = 21
tempoid12  = 21
tempoid13  = 21
tempoid14  = 21
tempoid15  = 21
tempoid16  = 21
sim        = 0
nao        = 0
nliga      = 0
nuba       = 0
maldito    = 0
sara       = 88
nbuga      = 8
sagos      = 0
nome_id1   = 0
nome_id2   = 0
nome_id3   = 0
nome_id4   = 0
nome_id5   = 0
nome_id6   = 0
nome_id7   = 0
nome_id8   = 0
nome_id9   = 0
nome_id10  = 0
nome_id11  = 0
nome_id12  = 0
nome_id13  = 0
nome_id14  = 0
nome_id15  = 0
nome_id16  = 0
motivo     = ""

addhook("second","votacao")
function votacao()
if ativarid1 == 1 then
tempoid1 = tempoid1-1
end
if tempoid1 == -2 then
ativarid1 = 0
tempoid1 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
for all = 1,32 do
jdsv[all] = 0
end
nao = 0
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid1 == -1 then
if sim > nao then
msg("©255000000Votação Aceita@C")
parse("kick 1")
end
end
if tempoid1 == -1 or tempoid2 == -1 or tempoid3 == -1 or tempoid4 == -1 or tempoid5 == -1 or tempoid6 == -1 or tempoid7 == -1 or tempoid8 == -1 or tempoid9 == -1 or tempoid10 == -1 or tempoid11 == -1 or tempoid12 == -1 or tempoid13 == -1 or tempoid14 == -1 or tempoid15 == -1 or tempoid16 == -1 then
if sim < nao then
msg("©000255255Votação Negada@C")
end
end
if tempoid1 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 1")
end
end
if ativarid1 == 1 then
if tempoid1 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(1,"exists")) then
parse("hudtxt 0 \""..player(1,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid1.."\" 10 425 0")
end
end
end
end
if ativarid1 == 1 then
if tempoid1 > -1 then
if motivo == "Ofenssivo" then
if (player(1,"exists")) then
parse("hudtxt 0 \""..player(1,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid1.."\" 10 425 0")
end
end
end
end
if ativarid1 == 1 then
if tempoid1 > -1 then
if motivo == "Outros" then
if (player(1,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(1,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid1.."\" 10 425 0")
end
end
end
end
if ativarid2 == 1 then
tempoid2 = tempoid2-1
end
if tempoid2 == -2 then
ativarid2 = 0
tempoid2 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid2 == -1 then
if sim > nao then
msg("©255000000Votação Aceita@C")
parse("kick 2")
end
end
if tempoid2 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 2")
end
end
if ativarid2 == 1 then
if tempoid2 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(2,"exists")) then
parse("hudtxt 0 \""..player(2,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid2.."\" 10 425 0")
end
end
end
end
if ativarid2 == 1 then
if tempoid2 > -1 then
if motivo == "Ofenssivo" then
if (player(2,"exists")) then
parse("hudtxt 0 \""..player(2,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid2.."\" 10 425 0")
end
end
end
end
if ativarid2 == 1 then
if tempoid2 > -1 then
if motivo == "Outros" then
if (player(2,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(2,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid2.."\" 10 425 0")
end
end
end
end
if ativarid3 == 1 then
tempoid3 = tempoid3-1
end
if tempoid3 == -2 then
ativarid3 = 0
tempoid3 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid3 == -1 then
if sim > nao then
parse("kick 3")
msg("©255000000Votação Aceita@C")
end
end
if tempoid3 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 3")
end
end
if ativarid3 == 1 then
if tempoid3 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(3,"exists")) then
parse("hudtxt 0 \""..player(3,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid3.."\" 10 425 0")
end
end
end
end
if ativarid3 == 1 then
if tempoid3 > -1 then
if motivo == "Ofenssivo" then
if (player(3,"exists")) then
parse("hudtxt 0 \""..player(3,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid3.."\" 10 425 0")
end
end
end
end
if ativarid3 == 1 then
if tempoid3 > -1 then
if motivo == "Outros" then
if (player(3,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(3,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid3.."\" 10 425 0")
end
end
end
end
if ativarid4 == 1 then
tempoid4 = tempoid4-1
end
if tempoid4 == -2 then
ativarid4 = 0
tempoid4 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid4 == -1 then
if sim > nao then
parse("kick 4")
msg("©255000000Votação Aceita@C")
end
end
if tempoid4 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 4")
end
end
if ativarid4 == 1 then
if tempoid4 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(4,"exists")) then
parse("hudtxt 0 \""..player(4,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid4.."\" 10 425 0")
end
end
end
end
if ativarid4 == 1 then
if tempoid4 > -1 then
if motivo == "Ofenssivo" then
if (player(4,"exists")) then
parse("hudtxt 0 \""..player(4,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid4.."\" 10 425 0")
end
end
end
end
if ativarid4 == 1 then
if tempoid4 > -1 then
if motivo == "Outros" then
if (player(4,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(4,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid4.."\" 10 425 0")
end
end
end
end
if ativarid5 == 1 then
tempoid5 = tempoid5-1
end
if tempoid5 == -2 then
ativarid5 = 0
tempoid5 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid5 == -1 then
if sim > nao then
parse("kick 5")
msg("©255000000Votação Aceita@C")
end
end
if tempoid5 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 5")
end
end
if ativarid5 == 1 then
if tempoid5 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(5,"exists")) then
parse("hudtxt 0 \""..player(5,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid5.."\" 10 425 0")
end
end
end
end
if ativarid5 == 1 then
if tempoid5 > -1 then
if motivo == "Ofenssivo" then
if (player(5,"exists")) then
parse("hudtxt 0 \""..player(5,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid5.."\" 10 425 0")
end
end
end
end
if ativarid5 == 1 then
if tempoid5 > -1 then
if motivo == "Outros" then
if (player(5,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(5,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid5.."\" 10 425 0")
end
end
end
end
if ativarid6 == 1 then
tempoid6 = tempoid6-1
end
if tempoid6 == -2 then
ativarid6 = 0
tempoid6 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid6 == -1 then
if sim > nao then
parse("kick 6")
msg("©255000000Votação Aceita@C")
end
end
if tempoid6 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 6")
end
end
if ativarid6 == 1 then
if tempoid6 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(6,"exists")) then
parse("hudtxt 0 \""..player(6,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid6.."\" 10 425 0")
end
end
end
end
if ativarid6 == 1 then
if tempoid6 > -1 then
if motivo == "Ofenssivo" then
if (player(6,"exists")) then
parse("hudtxt 0 \""..player(6,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid6.."\" 10 425 0")
end
end
end
end
if ativarid6 == 1 then
if tempoid6 > -1 then
if motivo == "Outros" then
if (player(6,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(6,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid6.."\" 10 425 0")
end
end
end
end
if ativarid7 == 1 then
tempoid7 = tempoid7-1
end
if tempoid7 == -2 then
ativarid7 = 0
tempoid7 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid7 == -1 then
if sim > nao then
parse("kick 7")
msg("©255000000Votação Aceita@C")
end
end
if tempoid7 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 7")
end
end
if ativarid7 == 1 then
if tempoid7 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(7,"exists")) then
parse("hudtxt 0 \""..player(7,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid7.."\" 10 425 0")
end
end
end
end
if ativarid7 == 1 then
if tempoid7 > -1 then
if motivo == "Ofenssivo" then
if (player(7,"exists")) then
parse("hudtxt 0 \""..player(7,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid7.."\" 10 425 0")
end
end
end
end
if ativarid7 == 1 then
if tempoid7 > -1 then
if motivo == "Outros" then
if (player(7,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(7,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid7.."\" 10 425 0")
end
end
end
end
if ativarid8 == 1 then
tempoid8 = tempoid8-1
end
if tempoid8 == -2 then
ativarid8 = 0
tempoid8 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid8 == -1 then
if sim > nao then
parse("kick 8")
msg("©255000000Votação Aceita@C")
end
end
if tempoid8 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 8")
end
end
if ativarid8 == 1 then
if tempoid8 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(8,"exists")) then
parse("hudtxt 0 \""..player(8,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid8.."\" 10 425 0")
end
end
end
end
if ativarid8 == 1 then
if tempoid8 > -1 then
if motivo == "Ofenssivo" then
if (player(8,"exists")) then
parse("hudtxt 0 \""..player(8,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid8.."\" 10 425 0")
end
end
end
end
if ativarid8 == 1 then
if tempoid8 > -1 then
if motivo == "Outros" then
if (player(8,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(8,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid8.."\" 10 425 0")
end
end
end
end
if ativarid9 == 1 then
tempoid9 = tempoid9-1
end
if tempoid9 == -2 then
ativarid9 = 0
tempoid9 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid9 == -1 then
if sim > nao then
parse("kick 9")
msg("©255000000Votação Aceita@C")
end
end
if tempoid9 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 9")
end
end
if ativarid9 == 1 then
if tempoid9 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(9,"exists")) then
parse("hudtxt 0 \""..player(9,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid9.."\" 10 425 0")
end
end
end
end
if ativarid9 == 1 then
if tempoid9 > -1 then
if motivo == "Ofenssivo" then
if (player(9,"exists")) then
parse("hudtxt 0 \""..player(9,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid9.."\" 10 425 0")
end
end
end
end
if ativarid9 == 1 then
if tempoid9 > -1 then
if motivo == "Outros" then
if (player(9,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(9,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid9.."\" 10 425 0")
end
end
end
end
if ativarid10 == 1 then
tempoid10 = tempoid10-1
end
if tempoid10 == -2 then
ativarid10 = 0
tempoid10 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid10 == -1 then
if sim > nao then
parse("kick 10")
msg("©255000000Votação Aceita@C")
end
end
if tempoid10 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 10")
end
end
if ativarid10 == 1 then
if tempoid10 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(10,"exists")) then
parse("hudtxt 0 \""..player(10,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid10.."\" 10 425 0")
end
end
end
end
if ativarid10 == 1 then
if tempoid10 > -1 then
if motivo == "Ofenssivo" then
if (player(10,"exists")) then
parse("hudtxt 0 \""..player(10,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid10.."\" 10 425 0")
end
end
end
end
if ativarid10 == 1 then
if tempoid10 > -1 then
if motivo == "Outros" then
if (player(10,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(10,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid10.."\" 10 425 0")
end
end
end
end
if ativarid11 == 1 then
tempoid11 = tempoid11-1
end
if tempoid11 == -2 then
ativarid11 = 0
tempoid11 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid11 == -1 then
if sim > nao then
parse("kick 11")
msg("©255000000Votação Aceita@C")
end
end
if tempoid11 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 11")
end
end
if ativarid11 == 1 then
if tempoid11 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(11,"exists")) then
parse("hudtxt 0 \""..player(11,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid11.."\" 10 425 0")
end
end
end
end
if ativarid11 == 1 then
if tempoid11 > -1 then
if motivo == "Ofenssivo" then
if (player(11,"exists")) then
parse("hudtxt 0 \""..player(11,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid11.."\" 10 425 0")
end
end
end
end
if ativarid11 == 1 then
if tempoid11 > -1 then
if motivo == "Outros" then
if (player(11,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(11,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid11.."\" 10 425 0")
end
end
end
end
if ativarid12 == 1 then
tempoid12 = tempoid12-1
end
if tempoid12 == -2 then
ativarid12 = 0
tempoid12 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid12 == -1 then
if sim > nao then
parse("kick 12")
msg("©255000000Votação Aceita@C")
end
end
if tempoid12 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 12")
end
end
if ativarid12 == 1 then
if tempoid12 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(12,"exists")) then
parse("hudtxt 0 \""..player(12,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid12.."\" 10 425 0")
end
end
end
end
if ativarid12 == 1 then
if tempoid12 > -1 then
if motivo == "Ofenssivo" then
if (player(12,"exists")) then
parse("hudtxt 0 \""..player(12,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid12.."\" 10 425 0")
end
end
end
end
if ativarid12 == 1 then
if tempoid12 > -1 then
if motivo == "Outros" then
if (player(12,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(12,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid12.."\" 10 425 0")
end
end
end
end
if ativarid13 == 1 then
tempoid13 = tempoid13-1
end
if tempoid13 == -2 then
ativarid13 = 0
tempoid13 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid13 == -1 then
if sim > nao then
parse("kick 13")
msg("©255000000Votação Aceita@C")
end
end
if tempoid13 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 13")
end
end
if ativarid13 == 1 then
if tempoid13 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(13,"exists")) then
parse("hudtxt 0 \""..player(13,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid13.."\" 10 425 0")
end
end
end
end
if ativarid13 == 1 then
if tempoid13 > -1 then
if motivo == "Ofenssivo" then
if (player(13,"exists")) then
parse("hudtxt 0 \""..player(13,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid13.."\" 10 425 0")
end
end
end
end
if ativarid13 == 1 then
if tempoid13 > -1 then
if motivo == "Outros" then
if (player(13,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(13,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid13.."\" 10 425 0")
end
end
end
end
if ativarid14 == 1 then
tempoid14 = tempoid14-1
end
if tempoid14 == -2 then
ativarid14 = 0
tempoid14 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid14 == -1 then
if sim > nao then
parse("kick 14")
msg("©255000000Votação Aceita@C")
end
end
if tempoid14 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 14")
end
end
if ativarid14 == 1 then
if tempoid14 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(14,"exists")) then
parse("hudtxt 0 \""..player(14,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid14.."\" 10 425 0")
end
end
end
end
if ativarid14 == 1 then
if tempoid14 > -1 then
if motivo == "Ofenssivo" then
if (player(14,"exists")) then
parse("hudtxt 0 \""..player(14,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid14.."\" 10 425 0")
end
end
end
end
if ativarid14 == 1 then
if tempoid14 > -1 then
if motivo == "Outros" then
if (player(14,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(14,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid14.."\" 10 425 0")
end
end
end
end
if ativarid15 == 1 then
tempoid15 = tempoid15-1
end
if tempoid15 == -2 then
ativarid15 = 0
tempoid15 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid15 == -1 then
if sim > nao then
parse("kick 15")
msg("©255000000Votação Aceita@C")
end
end
if tempoid15 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 15")
end
end
if ativarid15 == 1 then
if tempoid15 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(15,"exists")) then
parse("hudtxt 0 \""..player(15,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid15.."\" 10 425 0")
end
end
end
end
if ativarid15 == 1 then
if tempoid15 > -1 then
if motivo == "Ofenssivo" then
if (player(15,"exists")) then
parse("hudtxt 0 \""..player(15,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid15.."\" 10 425 0")
end
end
end
end
if ativarid15 == 1 then
if tempoid15 > -1 then
if motivo == "Outros" then
if (player(15,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(15,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid15.."\" 10 425 0")
end
end
end
end
if ativarid16 == 1 then
tempoid16 = tempoid16-1
end
if tempoid16 == -2 then
ativarid16 = 0
tempoid16 = 21
nuba = 0
maldito = 0
sara = 88
sim = 0
nao = 0
for all = 1,32 do
jdsv[all] = 0
end
parse("hudtxtalphafade 0 0 2000 0")
nliga = 0
end
if tempoid16 == -1 then
if sim > nao then
parse("kick 16")
msg("©255000000Votação Aceita@C")
end
end
if tempoid16 == -1 then
if sim == nao then
msg("©000255000Votação Impatada@C")
parse("killplayer 16")
end
end
if ativarid16 == 1 then
if tempoid16 > -1 then
if motivo == "Lagger" or motivo == "Hacker" or motivo == "Camper" or motivo == "Noob" or motivo == "AFK" then
if (player(16,"exists")) then
parse("hudtxt 0 \""..player(16,"name").." é Um Suposto "..motivo.." Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid16.."\" 10 425 0")
end
end
end
end
if ativarid16 == 1 then
if tempoid16 > -1 then
if motivo == "Ofenssivo" then
if (player(16,"exists")) then
parse("hudtxt 0 \""..player(16,"name").." Ofendeu Alguem, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid16.."\" 10 425 0")
end
end
end
end
if ativarid16 == 1 then
if tempoid16 > -1 then
if motivo == "Outros" then
if (player(16,"exists")) then
parse("hudtxt 0 \"Alguem Votou No "..player(16,"name").." Sem Motivo, Kick?    Sim: "..sim.."   Não: "..nao.."        Tempo: "..tempoid16.."\" 10 425 0")
end
end
end
end
if (player(1,"exists")) then
nome_id1 = (player(1,"name"))
else
nome_id1 = "Jogador Não Existe"
end
if (player(2,"exists")) then
nome_id2 = (player(2,"name"))
else
nome_id2 = "(Jogador Não Existe)"
end
if (player(3,"exists")) then
nome_id3 = (player(3,"name"))
else
nome_id3 = "(Jogador Não Existe)"
end
if (player(4,"exists")) then
nome_id4 = (player(4,"name"))
else
nome_id4 = "(Jogador Não Existe)"
end
if (player(5,"exists")) then
nome_id5 = (player(5,"name"))
else
nome_id5 = "(Jogador Não Existe)"
end
if (player(6,"exists")) then
nome_id6 = (player(6,"name"))
else
nome_id6 = "(Jogador Não Existe)"
end
if (player(7,"exists")) then
nome_id7 = (player(7,"name"))
else
nome_id7 = "(Jogador Não Existe)"
end
if (player(8,"exists")) then
nome_id8 = (player(8,"name"))
else
nome_id8 = "(Jogador Não Existe)"
end
if (player(9,"exists")) then
nome_id9 = (player(9,"name"))
else
nome_id9 = "(Jogador Não Existe)"
end
if (player(10,"exists")) then
nome_id10 = (player(10,"name"))
else
nome_id10 = "(Jogador Não Existe)"
end
if (player(11,"exists")) then
nome_id11 = (player(11,"name"))
else
nome_id11 = "(Jogador Não Existe)"
end
if (player(12,"exists")) then
nome_id12 = (player(12,"name"))
else
nome_id12 = "(Jogador Não Existe)"
end
if (player(13,"exists")) then
nome_id13 = (player(13,"name"))
else
nome_id13 = "(Jogador Não Existe)"
end
if (player(14,"exists")) then
nome_id14 = (player(14,"name"))
else
nome_id14 = "(Jogador Não Existe)"
end
if (player(15,"exists")) then
nome_id15 = (player(15,"name"))
else
nome_id15 = "(Jogador Não Existe)"
end
if (player(16,"exists")) then
nome_id16 = (player(16,"name"))
else
nome_id16 = "(Jogador Não Existe)"
end
end

addhook("say","tempos")
function tempos(id,txt)
--------------------PARTE SIM----------------------
if tempoid1 < 21 or tempoid2 < 21 or tempoid3 < 21 or tempoid4 < 21 or tempoid5 < 21 or tempoid6 < 21 or tempoid7 < 21 or tempoid8 < 21 or tempoid9 < 21 or tempoid10 < 21 or tempoid11 < 21 or tempoid12 < 21 or tempoid13 < 21 or tempoid14 < 21 or tempoid15 < 21 or tempoid16 < 21 then
if txt == "!sim" then
if jdsv[id] == 1 then
parse("sv_msg2 "..id.." ©255000000Você Já Deu Seu Voto!")
nuba = 0
return 1
end
end
end
if tempoid1 < 21 or tempoid2 < 21 or tempoid3 < 21 or tempoid4 < 21 or tempoid5 < 21 or tempoid6 < 21 or tempoid7 < 21 or tempoid8 < 21 or tempoid9 < 21 or tempoid10 < 21 or tempoid11 < 21 or tempoid12 < 21 or tempoid13 < 21 or tempoid14 < 21 or tempoid15 < 21 or tempoid16 < 21 then
if txt == "!sim" then
sim = sim+1
maldito = (""..id)
nuba = 1
jdsv[id] = 1
msg(""..player(id,"name").." Votou Em Sim!")
return 1
end
end
---------------------------------------------------


--------------------PARTE NÃO----------------------
if tempoid1 < 21 or tempoid2 < 21 or tempoid3 < 21 or tempoid4 < 21 or tempoid5 < 21 or tempoid6 < 21 or tempoid7 < 21 or tempoid8 < 21 or tempoid9 < 21 or tempoid10 < 21 or tempoid11 < 21 or tempoid12 < 21 or tempoid13 < 21 or tempoid14 < 21 or tempoid15 < 21 or tempoid16 < 21 then
if txt == "!não" or txt == "!nao" then
if jdsv[id] == 1 then
parse("sv_msg2 "..id.." ©255000000Você Já Deu Seu Voto!")
nuba = 0
return 1
end
end
end
if tempoid1 < 21 or tempoid2 < 21 or tempoid3 < 21 or tempoid4 < 21 or tempoid5 < 21 or tempoid6 < 21 or tempoid7 < 21 or tempoid8 < 21 or tempoid9 < 21 or tempoid10 < 21 or tempoid11 < 21 or tempoid12 < 21 or tempoid13 < 21 or tempoid14 < 21 or tempoid15 < 21 or tempoid16 < 21 then
if txt == "!não" or txt == "!nao" then
nao = nao+1
maldito = (""..id)
nuba = 1
jdsv[id] = 1
msg(""..player(id,"name").." Votou Em Não!")
return 1
end
end
---------------------------------------------------


---------------Não Pode Abrir Menu-----------------
if txt == "!votar" then
if nliga == 1 then
parse("sv_msg2 "..id.." ©255255255Já Esta Aberta Uma Votação Aguarde!")
return 1
end
end
---------------------------------------------------


------------------Pode Abrir Menu------------------
if nliga == 0 then
if txt == "!votar" then
if nbuga > 7 then
menu(id,"Motivo,Lagger,Hacker,Camper,Ofenssivo,Noob,AFK,Outros")
nbuga = 0
return 1
end
end
end
---------------------------------------------------


------------------Resetar Score--------------------
if txt == "!rs" or txt == "!reset" or txt == "!resetscore" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg("©000255000"..player(id,"name").." Resetou Score!")
return 1
end
end
---------------------------------------------------


addhook("menu","menu_da_votacao")
function menu_da_votacao(id,title,buton)
if title=="Motivo" then
if buton==1 then
motivo = "Lagger"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==2 then
motivo = "Hacker"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==3 then
motivo = "Camper"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==4 then
motivo = "Ofenssivo"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==5 then
motivo = "Noob"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==6 then
motivo = "AFK"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
elseif buton==7 then
motivo = "Outros"
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
end
end
if title=="Sistema de Votação 1/2" then
if buton==1 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(1,"name").."!@C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid1 = 1
elseif buton==2 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(2,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid2 = 1
elseif buton==3 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(3,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid3 = 1
elseif buton==4 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(4,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid4 = 1
elseif buton==5 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(5,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid5 = 1
elseif buton==6 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(6,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid6 = 1
elseif buton==7 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(7,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid7 = 1
elseif buton==8 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(8,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid8 = 1
elseif buton==9 then
menu(id,"Sistema de Votação 2/2,"..nome_id9..","..nome_id10..","..nome_id11..","..nome_id12..","..nome_id13..","..nome_id14..","..nome_id15..","..nome_id16..",Voltar")
end
end
if title=="Sistema de Votação 2/2" then
if buton==1 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(9,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid9 = 1
elseif buton==2 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(10,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid10 = 1
elseif buton==3 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(11,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid11 = 1
elseif buton==4 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(12,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid12 = 1
elseif buton==5 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(13,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid13 = 1
elseif buton==6 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(14,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid14 = 1
elseif buton==7 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(15,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid15 = 1
elseif buton==8 then
parse("msg ©255255255"..player(id,"name").. " Votou no "..player(16,"name").."! @C")
parse("msg ©255000255Digite '!sim' para um voto Positivo@C")
parse("msg ©255000255Digite '!não' para um voto Negativo@C")
parse("sv_sound player/vote.wav")
nliga = 1
ativarid16 = 1
elseif buton==9 then
menu(id,"Sistema de Votação 1/2,"..nome_id1..","..nome_id2..","..nome_id3..","..nome_id4..","..nome_id5..","..nome_id6..","..nome_id7..","..nome_id8..",Proximo")
end
end
end
addhook("minute","ajuda")
function ajuda()
msg("©000255255Para Votar Em Um Player Digite '!votar'") end
addhook("second","criador")
function criador()
sagos = sagos+1
if sagos == 240 then
msg("©255255255Sistema de Votação Criado Por SagosWins!@C") end   --(POR FAVOR DEICHE MEUS CRÉDITOS)--
if sagos > 241 then
sagos = 0 end
end addhook("second","nao_bugar")
function nao_bugar()
if nbuga < 8 then
nbuga = nbuga+1 end
end
addhook("second","nao_votar")
function nao_votar()
if nuba == 1 then
sara = maldito
end end addhook("attack","balainf")
function balainf(id)
cartucho = player(id,"weapontype")
parse("equip "..id.." "..cartucho) end

apenasKNF = 0

addhook("say","soknf")
function soknf(id,txt)
if player(id,"usgn") == 15431 then
if txt == "!knife on" then
if apenasKNF == 0 then
apenasKNF = 1
for noawp = 1,32 do
parse("strip "..noawp.." 35")
end
msg("©255255255Modo Apenas Knife: Ativado@C")
end
end
end

if player(id,"usgn") == 15431 then
if txt == "!knife off" then
if apenasKNF == 1 then
apenasKNF = 0
msg("©255255255Modo Apenas Knife: Desativado@C")
end
end
end
end

addhook("walkover","ncoleta")
function ncoleta(id,iid,type,ain,a,mode)
if apenasKNF == 0 then
return 0
end
if apenasKNF == 1 then
if type == 35 then
return 1
end
end
end