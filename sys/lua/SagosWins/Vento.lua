--------------------------------------------------
------------Script Vento by 1.0 SagosWins---------
-------------Criado no dia 12/09/2015-------------
-----------------Sem Modificações-----------------
--------------------------------------------------

forca = 5


addhook("always","sempre")
function sempre()
	for j = 1,32 do
		if player(j,"exists") == true and player(j,"tilex") == 10 and player(j,"tiley") == 38 then
			parse("setpos "..j.." "..math.random(112,912).." "..math.random(112,848))
		end
	end
end