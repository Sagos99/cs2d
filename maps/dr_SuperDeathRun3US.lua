addhook("movetile","move")
function move(id,X,Y)
	if(X==2 and Y==54) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
	end
	if(X==4 and Y==54) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
	end
	if(X==6 and Y==54) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
		if(PSo==0) then
			PSo=1
			PS=1
		end
	end
	if(X==10 and Y==54) then
		parse("strip "..id.."")
		parse("sethealth "..id.." 100")
		parse("speedmod "..id.." 0")
		if(PSo==1) then
			PSo=2
			PS=2
		end
	end
end