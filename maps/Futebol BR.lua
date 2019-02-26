---------------------
-- © Flacko 2010    -
-- v0.1             -
-- 21/09/2010       -
-- Edited by Bobcat -
---------------------

parse([[sv_gm 2]])

ball_spawn_point = {x=0, y=0}

ball = {
	xacc = 0,
	yacc = 0,
	xvel = 0,
	yvel = 0,
	x = 0,
	y = 0,
	img = 0,
	lt = 0,
}
redgoalpos ={}
bluegoalpos={}
goalcount = {0,0}
minutes_playing = 0


function spawn_ball()
	if ball.img ~= 0 then
		freeimage(ball.img)
	end
	ball.x = (ball_spawn_point.x+0.5)*32
	ball.y = (ball_spawn_point.y+0.5)*32
	ball.xacc = 0
	ball.yacc = 0
	ball.xvel = 0
	ball.yvel = 0
	local id = image("gfx/sprites/Futebol BR - Bola.bmp",0,0,0)
	imagepos(id,ball.x,ball.y,0)
	ball.img = id
	lt = 0
end

function kickball(angle,strength,momentum,id)
	ball.xvel = math.cos(angle)*strength
	ball.yvel = math.sin(angle)*strength
	ball.xacc = math.cos(angle)*momentum
	ball.yacc = math.sin(angle)*momentum
	ball.lt = id
end

function loadgoalpositions()
	for tx=0, map("xsize") do
		for ty=0, map("ysize") do
			if entity(tx,ty,"exists") then
				if entity(tx,ty,"name") == "rednet" then
					table.insert(redgoalpos,{x = tx, y = ty})
				elseif entity(tx,ty,"name") == "bluenet" then
					table.insert(bluegoalpos,{x = tx, y = ty})
				elseif entity(tx,ty,"name") == "ballstart" then
					ball_spawn_point.x = tx
					ball_spawn_point.y = ty
				end
			end
		end
	end
end

function checkifgoal()
	local b = ball
	local rgp = redgoalpos
	
	local btx = math.floor((b.x+b.xvel)/32)
	local bty = math.floor((b.y+b.yvel)/32)
	
	for i=1, #rgp do
		if btx == rgp[i].x then
			if bty == rgp[i].y then
				isgoal(2) --Bola na rede vermelha, gol da equipe azul!
				return 1
			end
		end
	end
	
	local bgp = bluegoalpos
	
	for i=1,#bgp do
		if btx == bgp[i].x then
			if bty == bgp[i].y then
				isgoal(1) --Bola na rede azul, gol da equipe vermelha!
				return 1
			end
		end
	end
end



function isgoal(t)
	goalcount[t] = goalcount[t] +1
	local scorer = ball.lt
	local strtableinfavor = {
		"GOLASSO!",
		"GOOOOOOL!",
		"GOL!"
				
	}
	local strtableagainst = {
		"GOL CONTRA!",
		"%1 FEZ GOL CONTRA!!!",
	}
	
	local tomsg
	
	if player(scorer,"team") ~= t then --Auto goal
		tomsg = strtableagainst[math.random(1,#strtableagainst)]
		parse("setscore " ..scorer .. " "..player(scorer,"score")-1)
	else --Goal
		tomsg = strtableinfavor[math.random(1,#strtableinfavor)]
		parse("setscore " .. scorer .. " "..player(scorer,"score")+1)
	end
	
	
	local function get_scorer_pos(id)
		local t = player(0,"table")
		local c = 1
		for i=1,#t do
			if player(t[i],"score") > player(id,"score") then
				c = c+1
			end
		end
		return c
		
	end
	function teamidtoname(t,s)
		if s then
			if t==1 then return "TRs" end
			return "CTs"
		else
			if t==1 then return "TR" end
			return "CT"
		end
	end
	
	local function giveformat(s)
		local t={
			player(scorer,"name"),			--%1 nome
			teamidtoname(player(scorer,"team"),1),	--%2 time que fez o gol
			goalcount[player(scorer,"team")],	--%3 gols do time
			player(scorer,"score"),			--%4 gols do jogador
			teamidtoname(3-player(scorer,"team"),1),--%5 outro time
			math.abs(goalcount[1]-goalcount[2]),	--%6 diferença de gols entre os times
			get_scorer_pos(scorer),			--%7 posição do jogador(mais gols,posição melhor)
			minutes_playing,			--Minutos passados desde que o servidor iniciou
		}
		return t[tonumber(s)]
	end
	tomsg = string.gsub(tomsg,"%%(%d)",giveformat)
	
	local color = "©000064255"
	if t == 1 then
		color= "©255000000"
	end
	updatescorecount()
	msg(color..tomsg)
	spawn_ball()
end

function formatrot(r)
	return math.rad(r-90)
end

function getdist(x1,y1,x2,y2)
	return math.sqrt(math.pow(x1-x2,2) + math.pow(y1-y2,2))
end

function math.round(x)
	return math.floor(x+0.5)
end

function updatescorecount()
	parse('hudtxt 1 "TR - CT" 320 20 1')
	parse('hudtxt 2 "'..goalcount[1]..'    '..goalcount[2]..'" 320 50 1')
end

loadgoalpositions()
spawn_ball()

addhook("startround","_startround")
function _startround()
	spawn_ball()
end

addhook("spawn","_spawn")
function _spawn()
	return "x"
end

addhook("always","_always")
function _always()
	local t = player(0,"tableliving")
	for k,id in pairs(t) do
		local px = player(id,"x")
		local py = player(id,"y")
		
		if getdist(px,py,ball.x,ball.y) < 24 then
			--local angle = math.atan2(ball.y-py,ball.x-px)
			local angle = formatrot(player(id,"rot"))
			kickball(angle,4,0.4,id)
		end
	end
	
	checkifgoal()
	
	if not tile(math.floor((ball.x-24+ball.xvel)/32), math.floor(ball.y/32),"walkable") or not tile(math.floor((ball.x+24+ball.xvel)/32), math.floor(ball.y/32),"walkable") then
		ball.xacc = -ball.xacc
		ball.xvel = -ball.xvel
	end
	if not tile(math.floor(ball.x/32), math.floor((ball.y-24+ball.yvel)/32),"walkable") or not tile(math.floor(ball.x/32), math.floor((ball.y+24+ball.yvel)/32),"walkable") then
		ball.yacc = -ball.yacc
		ball.yvel = -ball.yvel		
	end

	ball.xacc = ball.xacc*0.85
	ball.yacc = ball.yacc*0.85
	
	ball.xvel = ball.xvel*0.85 + ball.xacc
	ball.yvel = ball.yvel*0.85 + ball.yacc
	if ball.xvel > 30 then
		ball.xvel = 30
	elseif ball.xvel < -30 then
		ball.xvel = -30
	end
	if ball.yvel > 30 then
		ball.yvel = 30
	elseif ball.yvel < -30 then
		ball.yvel = -30
	end
	
	ball.y = ball.y + ball.yvel
	ball.x = ball.x + ball.xvel
	
	imagepos(ball.img,ball.x,ball.y,0)
end

addhook("join","_join")
function _join(id)
	updatescorecount()
end

addhook("attack2","_attack2")
function _attack2(id)
	local angle = formatrot(player(id,"rot"))
	local pointx = player(id,"x")+math.cos(angle)*24
	local pointy = player(id,"y")+math.sin(angle)*24
	if math.abs(pointx-ball.x) < 32 and math.abs(pointy-ball.y) < 32 then
		kickball(angle,0,12,id)
	end
end

addhook("attack","_attack")
function _attack(id)
	local angle = formatrot(player(id,"rot"))
	local pointx = player(id,"x")+math.cos(angle)*24
	local pointy = player(id,"y")+math.sin(angle)*24
	if math.abs(pointx-ball.x) < 32 and math.abs(pointy-ball.y) < 32 then
		kickball(angle,8,3.5,id)
	end
end

addhook("hit","_hit")
function _hit()
	return 1
end
addhook("buy","_buy")
function _buy()
	return 1
end

addhook("minute","_minute")
function _minute()
	minutes_playing = minutes_playing + 1
end