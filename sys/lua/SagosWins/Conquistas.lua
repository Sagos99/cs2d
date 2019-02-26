ativar = 0
teleport = 0

addhook("serveraction","teclas")
addhook("ms100","mile")
addhook("kill","matar")
addhook("bombplant","bomba")

	function bomba(id,x,y)
		if ativar == 1 then
			pX = player(id,"x")
			pY = player(id,"y")
			parse("restart")
			teleport = 5			
		end
	end

	function teclas(id,act)
		if act == 1 and player(id,"usgn") == 15431 then
			if ativar == 1 then
				ativar = 0
				msg2(id,"©255255255Desativado")
			elseif ativar == 0 then
				ativar = 1
				msg2(id,"©255255255Ativado")
			end
		end
	end
	
	function mile()
		if ativar == 1 then
			--[[for a = 1,32 do
				if player(a,"exists") and a ~= 1 and a ~= 2 then
					parse("customkill 1 Conquista "..a)
				end
			end
			
			--parse("setmoney 1 16000")
			--parse("strip 1 0")--]]
			
			if teleport > 0 then
				teleport = teleport-1
				if teleport == 1 then
					parse("setpos 1 "..pX.." "..pY)
					--msg2(1,"©255255255Teleportado!")
				end
			end
		end
	end
	
	function matar(matador,vitima,weapon,x,y)
		if ativar == 1 then
			parse("spawnplayer "..vitima.." "..x.." "..y)
		end
	end