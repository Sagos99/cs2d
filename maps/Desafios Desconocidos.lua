--Desafios Desconocidos Literalmente Por Unknown Soldier--
--V0.6.5--

function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end

Times=0
TimesC=0
Lose = 0
RTimer=0
PS=0
PSo=0
TopS=0
Ready=0
LO=0
SSAAR=1
SH=1000
SM=1000

addhook("startround","Start")
function Start()
	SH=1000
	SM=1000
	PS=0
	PSo=0
	TopS=0
	Ready=0
	LO=0
	SSAAR=1
	RTimer=0
	parse("sv_gm 2")
	parse("mp_respawndelay 5")
end

addhook("spawn","Aparicion")
function Aparicion (id)
	if (Ready==1) then
		msg2(id, "©255000000Don't Respawn / No Reaparescas")
	end
return 79
end

addhook("say","pwi")
function pwi(id,txt)
	for id=1,32 do
		if (player(id,"exists")) then
			if(PS==1 and txt=="cambielapass") then
				parse("trigger PWC")
				PS=0
			end
			if(PS==2) then 
				if (txt=="cuatroapreteenter") then
					parse("trigger PWC2")
					PS=3
				elseif (txt=="quatropressioneenter") then
					parse("trigger PWC2")
					PS=3
				end
			end
			if(PS==3 and txt=="678987096789870") then
				parse("trigger RP")
				PS=0
				msg("©000155255Acceso remoto Confirmado")
			end
		end
	end
end

addhook("triggerentity","delay") 
function delay(X,Y) 
	if(X==27 and Y==15) then
		if (Times>=1) then
			parse("trigger A28.")
		else
			parse("trigger A16.")
		end
	end
	if(X==130 and Y==40) then
		if(Times>=2) then
			msg("©255000000Marcefabian: Hasta ahora solo Fracasaron "..Times.." Veces")
		elseif(Times==1) then
			msg("©255000000Marcefabian: Hasta ahora solo Fracasaron Una Sola Ves")
		else
			msg("©255000000Marcefabian: Hasta ahora no Fracasaron Nunca")
		end
	end
	if(X==1 and Y==1) then
		TimesC=TimesC + 1
		msg("©255255255Numero de Veces Completado: "..TimesC.."@C")
		msg("©255255000Objetos Secretos Encontrados: "..TopS.." de 6@C")
	end
	if(X==40 and Y==20) then
		Ready=1
	end
	if(X==10 and Y==10) then
		if(Times<=5) then
			parse("trigger A01")
		end
	end
	if(X==2 and Y==2) then
		TopS=TopS + 1
		msg("©255255000Objetos Secretos: "..TopS.." de 6@C")
	end
	if(X==128 and Y==62) then
		if(LO==1) then
			return 1
		end
	end
	if(X==150 and Y==70) then
		LO=1
	end
	if(X==25 and Y==125) then
		SH=SH - 5
		if (SH<1) then
		parse("trigger SMBM0")
		parse("hudtxt 1")
		parse("hudtxt 2")
		end
	end
	if(X==17 and Y==128) then
		SATQ=math.random(0,5)
		if (SATQ==0) then
			if (SM >= 200) then
				SM=SM - 200
				parse("trigger STHUNDERD")
			else
				parse("trigger SReAttack")
			end
		end
		if (SATQ==1) then
			if (SM>=300) then
				SM=SM - 300
				parse("trigger SLBEAMD")
			else
				parse("trigger SReAttack")
			end
		end
		if (SATQ==2) then
			if (SM>=200) then
				SM=SM - 200
				parse("trigger SFIRED")
			else
				parse("trigger SReAttack")
			end
		end
		if (SATQ==3) then
			if (SM >= 300) then
				SM=SM - 300
				parse("trigger SDARKD")
			else
				parse("trigger SReAttack")
			end
		end
		if (SATQ==4) then
			if (SM >= 500) then
				SM=SM - 500
				parse("trigger SHA")
			else
				parse("trigger SReAttack")
			end
		end
		if (SATQ==5) then
			if (SM <= 700) then
				parse("trigger SMA")
			else
				parse("trigger SReAttack")
			end
		end
	end
	if(Y==128) then
		if(X==9) then
			SM=1000
		end
		if(X==11) then
			if (SH<=500) then
				SH=SH+500
			else
				SH=1000
			end
		end
	end
	if(X==14 and Y==113) then
	end
end

addhook("movetile","movet")
function movet(id,X,Y)
	if(X==95 and Y==24) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
	end
	if(X==137 and Y==73) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
	end
	if(X==88 and Y==44) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
		if(PSo==0) then
			PSo=1
			PS=1
		end
	end
	if(X==34 and Y==39) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
	end
	if(X==86 and Y==59) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
		if(PSo==1) then
			PSo=2
			PS=2
		end
	end
end

addhook("hit","SlowM")
function SlowM(id,source)
	if (player(id,"health")<=30) then
		parse("speedmod "..id.." -10")
	else
		parse("speedmod "..id.." 0")
	end
end

addhook("collect","cosas")
function cosas(id,iid,tipe)
	if(tipe==64) then
		parse("speedmod "..id.." 0")
	end
end

addhook("move","move")
function move (id,X,Y,walk)
	for id=1,32 do
		if (player(id,"exists")) then
			if (SSAAR==1) then
				if (player(id,"tilex")>=109 and player(id,"tilex")<=111) then
					if (player(id,"tiley")>=76 and player(id,"tiley")<=82) then
						if(walk==0) then
							parse("trigger SSA")
							SSAAR=0
						end
					end
				end
			end
		end
	end
RTimer = 0
end

addhook("attack","shot")
function shot(id)
RTimer = 0
end

addhook("second","endt")
function endt ()
RTimer=RTimer+1
parse("bot_remove_all")
	if(RTimer>15) then
		Lose=1
	else
		Lose=0
	end
	if (Ready==1 and Lose==1) then
		Times=Times + 1
		Lose=0
		msg("Iniciando Auto Restart@C")
		parse("sv_restart")
	end
end