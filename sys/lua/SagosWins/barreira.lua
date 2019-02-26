usgn = 15431
ativado = 0
x = 0
y = 0

caminho = "gfx/SagosWins/barreira.bmp"
img = image(caminho,0,0,1)
freeimage(img)


addhook("serveraction","on_off")
function on_off(id,act)
if act == 1 and player(id,"usgn") == usgn then
if ativado == 1 then
ativado = 0
freeimage(img)
elseif ativado == 0 then
ativado = 1
img = image(caminho,0,0,132+id)
imagehitzone(img,102,-24,-24,40,40)
end
end
end