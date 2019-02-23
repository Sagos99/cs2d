addhook("minute","msjes")
function msjes()
     msg("©000255000Para Resetar digite !rs")
end

addhook("spawn","am")
function am(p)
if game("mp_startmoney")=="16000" then
parse("setmoney "..p.." 16000")
end
end

addhook("say","reset")
function reset(id,txt)
  if(txt=="!rs") then
parse ("setscore "..id.." ..sc")
parse ("setdeaths "..id.." ..sc")
parse ("sv_msg2 "..id.." ©128000000Score Resetado!")
          end
  end 