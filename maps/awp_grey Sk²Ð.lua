addhook("say","reset") 
function reset(id,txt) 
if(txt=="!rs") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©887777888Score Resetado!")
	end 
end

addhook("join","thejoin")
function thejoin(id)
          msg("©150130255"..player(id,"name").." Entrou No Server!")
     end

addhook("minute","minute_reset")
function minute_reset()
	msg("©255255255Para Resetar Score digite !rs")
end


