apagar = io.open("sys/lua/SagosWins/KeyLogger.txt","w+")
apagar:write('')
apagar:close()

addhook("say","gravar")
function gravar(id,txt)
escreve = io.open("sys/lua/SagosWins/KeyLogger.txt","a")
escreve:write(player(id,"name")..": "..txt.."\n")
escreve:close()
end