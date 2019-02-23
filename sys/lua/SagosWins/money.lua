-------------------------------------------------------------
----------------------Script By SagosWins--------------------
-------------------------------------------------------------


bala_infinita       =   "verdadeiro"       ------------------(LEIA)----------------------
                                           --(só escreva minusculo ou não vai funcionar)-
HE_infinita         =   "falso"            -------("verdadeiro" = ativa o script)--------
                                           --------("falso" = desativa o script)---------
dinheiro_infinito   =   "verdadeiro"       ----------------------------------------------

FlashBang_Infinito  =   "falso"

qfb                 =   2                  -- qfb é Quantas FlashBang Pode Ter No Servidor




--------SE VOCE NÃO SOUBER SCRIPTS NÃO MODIFIQUE AQUI-------
merda = 0
addhook("attack","atacar")
function atacar(id)
if bala_infinita == "verdadeiro" then
cartucho = player(id,"weapontype")
parse("equip "..id.." "..cartucho) end
if HE_infinita == "verdadeiro" then
parse("equip "..id.." 51")
end if FlashBang_Infinito == "falso" then
merda = merda+1 end
if merda == qfb then
parse("strip "..id.." 52")
merda = 0
end if FlashBang_Infinito == "verdadeiro" then
parse("equip "..id.." 52") end end
addhook("always","sempreee")
function sempreee()
for dinheiro = 1,32 do
if dinheiro_infinito == "verdadeiro" then
parse("setmoney "..dinheiro.." 16000") end end end
------------------------------------------------------------