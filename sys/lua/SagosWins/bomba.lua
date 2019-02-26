-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

tempo_da_bomba = 120      --(Escolha o Tempo Da Bomba)--


addhook("startround","valor_padrao")
function valor_padrao()
matheus        = 0
eliana         = 0
nao_plantar    = 1
nao_desarma    = 1
azul           = 0
vermelho       = 0
fio_correto    = 0
tranca         = 1
tranca2        = 1
menu(0,"Qual Fio o TR Colocou?")
parse("mp_c4timer "..tempo_da_bomba) end
addhook("bombplant","escolher_fio")
function escolher_fio(id,x,y)
if nao_plantar == 1 then
menu(id,"Qual Fio Desarma a Bomba?,Azul,Vermelho")
return 1
else
matheus = (""..x)
eliana  = (""..y)
return 0
end end
addhook("bombdefuse","qual_fio")
function qual_fio(id)
if nao_desarma == 1 then
menu(id,"Qual Fio o TR Colocou?,Azul,Vermelho")
return 1
else
return 0
end end
addhook("bombexplode","fio_certo")
function fio_certo(id,x,y)
if fio_correto == 1 then
return 1
else
return 0
end end
addhook("menu","acao_fios")
function acao_fios(id,title,buton)
if title=="Qual Fio Desarma a Bomba?" then
if buton==1 then
nao_plantar = 0
azul        = 1
elseif buton==2 then
nao_plantar = 0
vermelho    = 1
end
end
if title=="Qual Fio o TR Colocou?" then
if buton==1 then
tranca = 0
elseif buton==2 then
tranca2 = 0
end end end
addhook("second","decisao")
function decisao()
if tranca == 0 then
if azul > vermelho then
nao_desarma = 0
fio_correto = 1
parse("mp_c4timer 3")
end end
if tranca == 0 then
if azul < vermelho then
parse("mp_c4timer 0")
end end
if tranca2 == 0 then
if vermelho > azul then
nao_desarma = 0
fio_correto = 1
parse("mp_c4timer 3")
end end
if tranca2 == 0 then
if vermelho < azul then
parse("mp_c4timer 0")
end end end