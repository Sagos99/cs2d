addhook("endround","wlsounds")
win_sound = "happy_game_over.ogg"
loose_sound = "game_over.ogg"

function wlsounds(id)
 if(id == 40) then
  for i = 1,32 do
   if (player(i,"team") == 1) then
    parse("sv_sound2 "..i.." "..win_sound)
   end
  end
  for i = 1,32 do
   if (player(i,"team") == 2) then
    parse("sv_sound2 "..i.." "..loose_sound)
   end
  end
 end
 if(id == 41) then
  for i = 1,32 do
   if (player(i,"team") == 2) then
    parse("sv_sound2 "..i.." "..win_sound)
   end
  end
  for i = 1,32 do
   if (player(i,"team") == 1) then
    parse("sv_sound2 "..i.." "..loose_sound)
   end
  end
 end
end

--ct 41
--t  40