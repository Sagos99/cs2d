addhook("say","reset") 
function reset(id,txt) 
if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©887777888Uhuul ta Resetado essa Bagaça =D!")
	end 
end


addhook("minute","minute_reset")
function minute_reset()
	msg("©255100000Para Resetar seu Score digite !reset")
end


addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end