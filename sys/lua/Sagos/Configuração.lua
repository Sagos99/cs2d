-------------------------------------------------------------
----------------Script Criado por Sagoswins------------------
-------------------------------------------------------------


script = 1          -------(0 - Desativa o Script, 1 - Ativa o Script)-------



tempo = 0	    -----------(NÃO MODIFIQUE ISTO)------------
addhook("always","configurar")
function configurar()
tempo = tempo+1
if script == 1 then
if tempo == 200 then
msg("©255255255Iniciando Configuração!") end
end if script == 1 then
if tempo == 500 then
parse("sv_maxplayers 32")
parse("sv_fow 0")
parse("sv_friendlyfire 0")
parse("sv_hostport 36963")
parse("sv_lan 0")
parse("mp_startmoney 16000")
parse("mp_antispeeder 0")
parse("mp_buytime 9.9")
parse("mp_c4timer 31")
parse("mp_grenaderebuy 1")
parse("mp_autoteambalance 0")
parse("bot_prefix ")
parse("mp_unbuyable ")
parse("mp_infammo 1")
parse("mp_respawndelay 1")
parse("sv_restart 5")
parse("mp_randomspawn 0")
msg("©255255255Configuração Completa!") end
end if tempo > 505 then
tempo = 505 end
end