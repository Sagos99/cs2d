tempo = 30



tempo2 = tempo
bomberman = 0
quantidade = 0
explodir = true
congelado = 0
arma = 0
parse("mp_randomspawn 1")
parse("sv_gamemode 1")

bomba = image("gfx/SagosWins/bomba.png",0,0,3)
freeimage(bomba)

addhook("hit","acertar")
function acertar(id,source,weapon,hpdmg,apdmg)
	if source == bomberman then
		parse("speedmod "..id.." -30")
		parse("speedmod "..source.." 0")
		bomberman = id
		freeimage(bomba)
		bomba = image("gfx/SagosWins/bomba.png",0,0,bomberman+100)		
		congelado = 4
	end
	
	if weapon == 251 then
	return 0
	else
	return 1
	end
end

addhook("join","nascer")
function nascer(id)
	if bomberman == 0 then
		bomberman = id
	end
end

addhook("leave","deixar")
function deixar(id)
	if id == bomberman then
		parse("endround 0")
	end
end

addhook("startround","inicioRodada")
function inicioRodada()
	tempo2 = tempo
	quantidade = 0
	bomberman = 0
	explodir = true
	arma = 0
	for jogador = 1,32 do
		if player(jogador,"exists") then
			quantidade = quantidade+1
		end
	end
	
	for jogador = 1,32 do
		if quantidade == 1 then
			if player(jogador,"exists") then
				bomberman = jogador
			end
		end
		
		if quantidade >= 2 then
			while player(bomberman,"exists") == false and player(bomberman,"team") ~= 0 do
				bomberman = math.random(1,32)
			end
		end
	end
	
	freeimage(bomba)
	bomba = image("gfx/SagosWins/bomba.png",0,0,bomberman+100)
	parse("speedmod "..bomberman.." 3")
	
	while itemtype(arma,"name") == "" do
		arma = math.random(1,91)
	end
	
	for jogador = 1,32 do
		if player(jogador,"exists") then
			parse("equip "..jogador.." "..arma)
		end
	end
	
	msg("©255255255Todos os jogadores ganhou: ©000255000"..itemtype(arma,"name"))
end

addhook("second","segundos")
function segundos()
	if tempo2 == 0 then
		if player(bomberman,"exists") and explodir == true then
			parse("explosion "..player(bomberman,"x").." "..player(bomberman,"y").." 100 1000 0")
			explodir = false
			parse("endround 0")
		end
	end

	if tempo2 > 0 then
		tempo2 = tempo2-1
	end
	
	if tempo2 > 10 then
		parse("hudtxt 49 \"©000180255Tempo: ©000255000"..tempo2.."\" 250 450")
	elseif tempo2 <= 10 then
		parse("hudtxt 49 \"©000180255Tempo: ©255000000"..tempo2.."\" 250 450")
	end
	
	if congelado > 0 then
		congelado = congelado-1
	end
	
	if congelado == 1 then
		parse("speedmod "..bomberman.." 3")
	end
	
	if player(bomberman,"health") == 0 then
		parse("endround 0")
	end
end