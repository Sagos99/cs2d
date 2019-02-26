addhook("join","entrar")
addhook("name","nomi")
addhook("second","segundos")

nome = ""

function entrar(id)

if player(id,"usgn") == 0 then
nome = "(Sem_USGN) "..player(id,"name")..""
else
nome = "("..player(id,"usgn")..") "..player(id,"name")..""
end

parse("setname "..id.." "..nome)
end


function nomi(id,oldname,newname,forced)
if forced == 0 then

if player(id,"usgn") == 0 then
nome = "(Sem_USGN) "..newname..""
else
nome = "("..player(id,"usgn")..") "..newname..""
end

parse("setname "..id.." "..nome)
return 1
else
return 0
end
end