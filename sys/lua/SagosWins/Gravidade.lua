--math.floor(verify)

forca = 0
subir = 0.5
modo = "parado"

addhook("always","gravidade")
	function gravidade()
		if tile(player(1,"tilex"),player(1,"tiley")+1,"wall") then
			modo = "parado"
		else
			modo = "subir"
		end

		if modo == "cair" then
			forca = forca+0.1
			cair = player(1,"y")+forca
			parse("setpos 1 "..player(1,"x").." "..cair.."")
			subir = 1.3
		end

		if modo == "parado" then
			forca = 0
			subir = 0.8
		end

		if modo == "subir" then
			forca = forca-subir
			subir = subir-0.1
			cair = player(1,"y")+forca
			parse("setpos 1 "..player(1,"x").." "..cair.."")
		if subir <= 0 then
			forca = 1
			modo = "cair"
		end
	end
end