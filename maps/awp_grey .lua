addhook("say","reset")
function reset(id,txt)
  if(txt=="!reset") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©128000000Score Resetado!")
          end
  end 