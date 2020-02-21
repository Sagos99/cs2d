-------------------------------------------------------------
----------------Script Criado por Sagoswins------------------
-------------------------------------------------------------


--[[
ip = ""
teste = 0
a = "qwe"

addhook("join","entrar")
function entrar(id)
--ip = player(id,"ip")
teste = tonumber(ip)

--ip = math.floor(ip)

teste = teste+teste

msg(teste)
end

--]]


addhook("say","DEUS")
function DEUS(id,txt)
a = string.lower(txt)
a = string.match (a,"samuel")
if a == "samuel" then
msg2(id,"©255255255Você disse o nome do criador do script")
end
end