addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end

addhook("startround","m")
function m()
for i = 1,32 do
parse("setmoney "..i.." 16000")
end
end


addhook("say","ty",4001)
function ty(id,s)
if s == "@rs" then
parse("setscore "..id.." 0")
parse("setdeaths "..id.." 0")
msg2(id,"©255255255Resetado !")
msg("©000184122O "..player(id,"name").." Resetou seu Score/Deaths (@rs)")
return 1
end
end
