addhook("join","entrar")
function entrar(id)
	for jogador = 1,32 do
		if jogador == id then
			msg2(jogador,"©120120120Welcome to the Server")
		else
			msg2(jogador,"©120120120The player ©255255255"..player(id,"name").." ©120120120has enter to the Server")
		end
	end
end