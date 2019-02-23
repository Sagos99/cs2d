addhook("serveraction","adminsa")
function adminsa(id,act)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
if act==1 then
menu(id,"Menu Administrador,==Opcoes==,==Player==,==Alertas Para o Server==")
end
return 1
end
end
end

addhook("menu","adminmenu")
function adminmenu(id,title,buton)
if title=="Menu Administrador" then
if buton==1 then
menu(id,"==Opcoes==,==Restart==,==Kikar==|Escolha ID,==Fazer Spec==|Escolha ID,==Frases==,==Administracao de Bots==")
elseif buton==2 then
elseif buton==3 then
elseif buton==4 then
elseif buton==5 then
menu(id,"")
elseif buton==6 then
menu(id,"")
elseif buton==7 then
menu(id,"")
end
end
if title=="==Opcoes==" then
if buton==1 then
parse('restart')
elseif buton==2 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
elseif buton==3 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
elseif buton==4 then
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==5 then
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
elseif buton==6 then
menu(id,"")
elseif buton==7 then
menu(id,"")
end
end
if title=="==Frases== 1/3" then
if buton==1 then
msg("©168098255"..player(id,"name").." #Admin#: Lol")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==2 then
msg("©168098255"..player(id,"name").." #Admin#: '-'")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==3 then
msg("©168098255"..player(id,"name").." #Admin#: aff")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==4 then
msg("©168098255"..player(id,"name").." #Admin#: lag")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==5 then
msg("©168098255"..player(id,"name").." #Admin#: vtnc")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==6 then
msg("©168098255"..player(id,"name").." #Admin#: :@")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==7 then
msg("©168098255"..player(id,"name").." #Admin#: afffffff")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==8 then
msg("©168098255"..player(id,"name").." #Admin#: kk")
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==9 then
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
end
end
if title=="==Frases== 2/3" then
if buton==1 then
msg("©168098255"..player(id,"name").." #Admin#: sim")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==2 then
msg("©168098255"..player(id,"name").." #Admin#: nao")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==3 then
msg("©168098255"..player(id,"name").." #Admin#: cf?")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==4 then
msg("©168098255"..player(id,"name").." #Admin#: go")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==5 then
msg("©168098255"..player(id,"name").." #Admin#: x1 lixin?")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==6 then
msg("©168098255"..player(id,"name").." #Admin#: lixin")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==7 then
msg("©168098255"..player(id,"name").." #Admin#: noobzin")
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
elseif buton==8 then
menu(id,"==Frases== 1/3,Lol,'-',aff,lag,vtnc,:@,afffffff,kk,=Proximo=")
elseif buton==9 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
end
end
if title=="==Frases== 3/3" then
if buton==1 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: Nao so se for aqui!")
elseif buton==2 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: xiu")
elseif buton==3 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: nego so mata no lag")
elseif buton==4 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: pqp")
elseif buton==5 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: vsf")
elseif buton==6 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: porra")
elseif buton==7 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: aaaa")
elseif buton==8 then
menu(id,"==Frases== 3/3,Nao so se for aqui!,xiu,nego so mata no lag,pqp,vsf,porra,aaaa,arrega lixin,=Anterior=")
msg("©168098255"..player(id,"name").." #Admin#: arrega lixin")
elseif buton==9 then
menu(id,"==Frases== 2/3,sim,nao,cf?,go,x1 lixin?,lixin,noobzin,=Anterior=,==Proximo=")
end
end
if title=="==Kikar== 1/3" then
if buton==1 then
parse ('kick 1')
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
elseif buton==2 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 2')
elseif buton==3 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 3')
elseif buton==4 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 4')
elseif buton==5 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 5')
elseif buton==6 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 6')
elseif buton==7 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 7')
elseif buton==8 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
parse ('kick 8')
elseif buton==9 then
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
end
end
if title=="==Kikar== 2/3" then
if buton==1 then
parse ('kick 9')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==2 then
parse ('kick 10')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==3 then
parse ('kick 11')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==4 then
parse ('kick 12')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==5 then
parse ('kick 13')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==6 then
parse ('kick 14')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==7 then
parse ('kick 15')
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
elseif buton==8 then
menu(id,"==Kikar== 1/3,Kick >>>|1,Kick >>>|2,Kick >>>|3,Kick >>>|4,Kick >>>|5,Kick >>>|6,Kick >>>|7,Kick >>>|8,==Proximo==")
elseif buton==9 then
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
end
end
if title=="==Kikar== 3/3" then
if buton==1 then
parse ('kick 16')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==2 then
parse ('kick 17')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==3 then
parse ('kick 18')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==4 then
parse ('kick 19')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==5 then
parse ('kick 20')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==6 then
parse ('kick 21')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==7 then
parse ('kick 22')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==8 then
parse ('kick 23')
menu(id,"==Kikar== 3/3,Kick >>>|16,Kick >>>|17,Kick >>>|18,Kick >>>|19,Kick >>>|20,Kick >>>|21,Kick >>>|22,Kick >>>|23,==Anterior==")
elseif buton==9 then
menu(id,"==Kikar== 2/3,Kick >>>|9,Kick >>>|10,Kick >>>|11,Kick >>>|12,Kick >>>|13,Kick >>>|14,Kick >>>|15,==Anterior==,==Proximo==")
end
end
if title=="Menu Administrador" then
if buton==2 then 
menu(id,"==Player==,==Equipar==|A si mesmo,==Speedmod==,==Resetar Score==")
end
end
if title=="==Player==" then
if buton==1 then
menu(id,"==Equipar==|A si mesmo,==Armors==,==Pesados==,==Equipamentos==,==Pistolas==,==Especiais==")
elseif buton==2 then
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
elseif buton==3 then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255098255"..player(id,"name").." #Admin# Resetou a Sua Frag Com Sucesso!")
end
end
if title=="==Speedmod==" then
if buton==1 then     
	parse("speedmod "..id.." 0")
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
	end              
	if buton==2 then 
	parse("speedmod "..id.." 15")
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
	end
	if buton==3 then 
	parse("speedmod "..id.." 45")
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
	end
	if buton==4 then 
	parse("speedmod "..id.." 70")
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
	end
	if buton==5 then 
	parse("speedmod "..id.." 100")
menu(id,"==Speedmod==,==Normal==,15,45,70,100,==Voltar==")
end
if buton==6 then
menu(id,"==Player==,==Equipar==|A si mesmo,==Speedmod==")
end
end
if title=="==Equipar==|A si mesmo" then
if buton==1 then
menu(id,"==Armors==,==Super Armor==,==Medic Armor==,==Stealth Armor==,==Voltar==")
elseif buton==2 then
menu(id,"==Pesados==,==Rpg==,==Grenade Launcher==,==Rocket Launcher==,==FlameThrower==,==M249==,==Voltar==")
elseif buton==3 then
menu(id,"==Equipamentos==,==Chainsaw==,==Laser Mine==,==Claw==,==Mine==,==Machete==,==Wrench==,==Medikit==,==Gut Bomb==,==Tactical Shield==,==Voltar==")
elseif buton==4 then
menu(id,"==Pistolas==,==Desert Eagle==,=p228==,==Five-Seven==,==USP==,==Glock==,==Elite==,==Voltar==")
elseif buton==5 then
menu(id,"==Especiais==,==Portal Gun==,=Laser==,==SnowBall==,==Gold==,==Money==,==Nigh Vision==,==Gas Grenade==,==Voltar==")
end
end
if title=="==Armors==" then
if buton==1 then
parse("equip "..id.." 83 ")
elseif buton==2 then
parse("equip "..id.." 82 ")
elseif buton==3 then
parse("equip "..id.." 84 ")
elseif buton==4 then
menu(id,"==Equipar==|A si mesmo,==Armors==,==Pesados==,==Equipamentos==,==Pistolas==,==Especiais==")
end
end
if title=="==Pesados==" then
if buton==1 then
parse("equip "..id.." 47 ")
elseif buton==2 then
parse("equip "..id.." 49 ")
elseif buton==3 then
parse("equip "..id.." 48 ")
elseif buton==4 then
parse("equip "..id.." 46 ")
elseif buton==5 then
parse("equip "..id.." 40 ")
elseif buton==6 then
menu(id,"==Equipar==|A si mesmo,==Armors==,==Pesados==,==Equipamentos==,==Pistolas==,==Especiais==")
end
end
if title=="==Equipamentos==" then
if buton==1 then
parse("equip "..id.." 85 ")
elseif buton==2 then
parse("equip "..id.." 87 ")
elseif buton==3 then
parse("equip "..id.." 78 ")
elseif buton==4 then
parse("equip "..id.." 77 ")
elseif buton==5 then
parse("equip "..id.." 69 ")
elseif buton==6 then
parse("equip "..id.." 74 ")
elseif buton==7 then
parse("equip "..id.." 64 ")
elseif buton==8 then
parse("equip "..id.." 86 ")
elseif buton==9 then
parse("equip "..id.." 41 ")
end
end
if title=="==Pistolas==" then
if buton==1 then
parse("equip "..id.." 3 ")
elseif buton==2 then
parse("equip "..id.." 4 ")
elseif buton==3 then
parse("equip "..id.." 6 ")
elseif buton==4 then
parse("equip "..id.." 1 ")
elseif buton==5 then
parse("equip "..id.." 2 ")
elseif buton==6 then
parse("equip "..id.." 5 ")
elseif buton==7 then
parse("equip "..id.." 4 ")
menu(id,"==Equipar==|A si mesmo,==Armors==,==Pesados==,==Equipamentos==,==Pistolas==,==Especiais==")
end
end
if title=="==Especiais==" then
if buton==1 then
parse("equip "..id.." 88 ")
elseif buton==2 then
parse("equip "..id.." 45 ")
elseif buton==3 then
parse("equip "..id.." 75 ")
elseif buton==4 then
parse("equip "..id.." 68 ")
elseif buton==5 then
parse("equip "..id.." 67 ")
elseif buton==6 then
parse("equip "..id.." 59 ")
elseif buton==7 then
parse("equip "..id.." 72 ")
elseif buton==8 then
menu(id,"==Equipar==|A si mesmo,==Armors==,==Pesados==,==Equipamentos==,==sePistolas==,==Especiais==")
end
end
if title=="==Administracao de Bots==" then
if buton==1 then
parse('bot_add_t')
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
elseif buton==2 then
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
parse('bot_add_ct')
elseif buton==3 then
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
parse('bot_remove_t')
elseif buton==4 then
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
parse('bot_remove_ct')
elseif buton==5 then
menu(id,"==Administracao de Bots==,Add Bot|T,Add Bot|CT,Remover Bot|T,Remover Bot|Ct,==Matar todos os Bots==")
parse('bot_kill')
end
end
if title=="==Fazer Spec== 1/2| Escolha ID" then
if buton==1 then
parse('makespec 1')
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
elseif buton==2 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 2')
elseif buton==3 then
parse('makespec 3')
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
elseif buton==4 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 4')
elseif buton==5 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 5')
elseif buton==6 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 6')
elseif buton==7 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 7')
elseif buton==8 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
parse('makespec 8')
elseif buton==9 then
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
end
end
if title=="==Fazer Spec== 2/2| Escolha ID" then
if buton==1 then
parse('makespec 9')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==2 then
parse('makespec 10')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==3 then
parse('makespec 11')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==4 then
parse('makespec 12')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==5 then
parse('makespec 13')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==6 then
parse('makespec 14')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==7 then
parse('makespec 15')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==8 then
parse('makespec 16')
menu(id,"==Fazer Spec== 2/2| Escolha ID,Fazer Spec >>>|9,Fazer Spec >>>|10,Fazer Spec >>>|11,Fazer Spec >>>|12,Fazer Spec >>>|13,Fazer Spec >>>|14,Fazer Spec >>>|15,Fazer Spec >>>|16,==Anterior== ")
elseif buton==9 then
menu(id,"==Fazer Spec== 1/2| Escolha ID,Fazer Spec >>>|1,Fazer Spec >>>|2,Fazer Spec >>>|3,Fazer Spec >>>|4,Fazer Spec >>>|5,Fazer Spec >>>|6,Fazer Spec >>>|7,Fazer Spec >>>|8,==Proximo== ")
end
end
if title=="Menu Administrador" then
if buton==3 then
menu(id,"==Alertas Para o Server==,==Ajuda para resetar Score==,==Creditos==")
end
end
if title=="==Alertas Para o Server==" then
if buton==1 then
msg("©255255255Dica de Admin: Para Resetar sua frag escreva:")
msg("©255255255!rs , !reset ou !resetscore")
elseif buton==2 then
msg("©000255255Script Totalmente feito por Andresa, ou ao usuario que")
msg("©000255255utiliza a U.S.G.N: 44092, devido a supostas trocas de nick ;D")
end
end
end

addhook("say" , "say_1")
function say_1(id,message)
	if (message=="!reset") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255000000"..player(id,"name").." #User# Resetou a Sua Frag Com Sucesso!")
end
if (message=="!rr") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255000000"..player(id,"name").." #User# Resetou a Sua Frag Com Sucesso!")
end
if (message=="!resetscore") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255000000"..player(id,"name").." #User# Resetou a Sua Frag Com Sucesso!")
end
if (message=="!rs") then
parse("setdeaths "..id.." 0")
parse("setscore "..id.." 0")
msg("©255000000"..player(id,"name").." #User# Resetou a Sua Frag Com Sucesso!")
end
end


if sample==nil then sample={} end
sample.ut={}

-----------------------
-- INITIAL SETUP     --
-----------------------
function initArray(m)
	local array = {}
	for i = 1, m do
		array[i]=0
	end
	return array
end
sample.ut.timer=initArray(32)
sample.ut.level=initArray(32)
sample.ut.fblood=


-----------------------
-- PREPARE TO FIGHT! --
-----------------------
addhook("startround","sample.ut.startround")
function sample.ut.startround()
	parse("sv_sound \"fun/prepare1_ultimate.wav\"")
	sample.ut.fblood=0
end

addhook("kill","sample.ut.kill")
function sample.ut.kill(killer,victim,weapon)
	if (os.clock()-sample.ut.timer[killer])>30 then
		sample.ut.level[killer]=0;
	end
	level=sample.ut.level[killer]
	level=level+1
	sample.ut.level[killer]=level
	sample.ut.timer[killer]=os.clock()
	-- FIRST BLOOD?
	if (sample.ut.fblood==1) then
		sample.ut.fblood=1
		parse("sv_sound \"fun1/f_wickedsick.wav\"")
		msg (player(victim,"name").." Jaah morreu pro  "..player(killer,"name").."??@C")	
	end

	-- HUMILIATION? (KNIFEKILL)
	if (weapon==50) then
		-- HUMILIATION!
		parse("sv_sound \"fun/knife1_ultimate.wav\"")
		msg ("©123456789"..player(killer,"name").." Passou o facao no noobzin do "..player(victim,"name").." Crreeedo!@C")
	else
		-- REGULAR KILL
		if (level==1) then
			-- Single Kill! Nothing Special!
		elseif (level==2) then
			parse("sv_sound \"fun1/f_dominating.wav\"");
			msg ("©000255000"..player(killer,"name").." Matou 2 mendingos sujos!@C")
		elseif (level==3) then
			parse("sv_sound \"fun1/f_multikill.wav\"")
			msg ("©192192192"..player(killer,"name").." Destruio 3!@C")
		elseif (level==4) then
			parse("sv_sound \"fun1/f_ultrakill.wav\"")
			msg ("©000000255"..player(killer,"name").." uuu Que medinha levo 4 ja kk@C")
		elseif (level==5) then
			parse("sv_sound \"fun1/f_monsterkill.wav\"")
			msg ("©000000255"..player(killer,"name").." kk Cagao, levo 5@C")
		elseif (level==6) then
			parse("sv_sound \"fun1/f_rampage.wav\"")
			msg ("©123456789"..player(killer,"name").." Desliga aim owww, kk levo 6@C")
		elseif (level==7) then
			parse("sv_sound \"fun1/f_killingspree.wav\"")
			msg ("©123456789"..player(killer,"name").." Ja se foram 7?@C")
		elseif (level==8) then
			parse("sv_sound \"fun1/f_godlike.wav\"")
			msg ("©123456789"..player(killer,"name").." Creeeedo Que nino Revolts!@C")
		elseif (level==9) then
			parse("sv_sound \"fun1/f_megakill.wav\"")
			msg ("©200000000 "..player(killer,"name").." Porra ninguem vai me matar nao??@C")
		else
			parse("sv_sound \"fun1/f_unstoppable.wav\"")
			msg ("©168098255 "..player(killer,"name").." seus troxa ja matei "..level.." noobs!@C")
		end
	end
end


addhook("reload","fastreload")
function fastreload(id,mode)
wp = player(id,"weapontype")
	if mode==1 then
		parse("equip "..id.." "..wp)
		parse("setweapon "..id.." "..wp)
	end
end

addhook("startround","imgstart")
function imgstart(start)
image("gfx/cs2dclanssmk2.png",580,375,2,0)
end


adminlist = {44092,61515}

addhook("say","dsay")
function dsay(id,txt)
for _, usgn in ipairs(adminlist) do
if player(id,'usgn') == usgn then
	msg("©255098255"..player(id,"name").." : "..txt)
return 1
end
end
end

function Array(size,value)
	local array = {}
	for i = 1, size do
		array[i] = value
	end
	return array
end

LS_att = Array(32, 0)
LS_lit = Array(32, 0)
LS_ht = Array(32, 0)
LS_mode = Array(32, 0)

StPth = 'gfx/LaserShockwave/45'

addhook('attack', 'LS_attack')
addhook('hit', 'LS_hit')
addhook('attack2', 'LS_attack2')
addhook('collect', 'LS_collect')
addhook('select', 'LS_select')

function LS_attack(id)
	if player(id, 'weapontype') == 35 then
		LS_att[id] = image(StPth..'.png', 0, 1, 1)
		imagepos(LS_att[id], player(id, 'x'), player(id, 'y'), player(id, 'rot'))
		LS_lit[id] = image(StPth..'f.png', 0, 1, 1)
		imagepos(LS_lit[id], player(id, 'x'), player(id, 'y'), player(id, 'rot'))
		if LS_mode[id] == 0 then
			imagecolor(LS_att[id], 0, 255, 255)
			imagecolor(LS_lit[id], 255, 255, 255)
		elseif LS_mode[id] == 1 then
			imagecolor(LS_att[id], 255, 255, 255)
			imagecolor(LS_lit[id], 255, 255, 255)
		elseif LS_mode[id] == 2 then
			imagecolor(LS_att[id], 255, 255, 255)
			imagecolor(LS_lit[id], 255, 255, 255)
		elseif LS_mode[id] == 3 then
			imagecolor(LS_att[id], 255, 255, 255)
			imagecolor(LS_lit[id], 255, 255, 255)
		end
		tween_alpha(LS_att[id], 1000, 0.0)
		tween_alpha(LS_lit[id], 200, 0.0)
		timer(1000, 'freeimage', LS_att[id])
		timer(200, 'freeimage', LS_lit[id])
	end
end

function LS_hit(id, source, weapon)
	if player(id, 'team') ~= player(source, 'team') then
		if weapon == 35 then
			LS_ht[id] = image(StPth..'h.png', 0, 1, 1)
			imagepos(LS_ht[id], player(id, 'x'), player(id, 'y'), player(source, 'rot'))
			if LS_mode[source] == 0 then
				imagecolor(LS_ht[id], 0, 255, 0)
			elseif LS_mode[source] == 1 then
				imagecolor(LS_ht[id], 255, 0, 0)
			elseif LS_mode[source] == 2 then
				imagecolor(LS_ht[id], 255, 255, 0)
			elseif LS_mode[source] == 3 then
				imagecolor(LS_ht[id], 0, 0, 255)
			end
			tween_alpha(LS_ht[id], 1000, 0.0)
			timer(1000, 'freeimage', LS_ht[id])
		end
	end
end

function LS_attack2(id, mode)
	if player(id, 'weapontype') == 35 then
		LS_mode[id] = mode
	end
end

function LS_collect(id, iid, mode)
	if iid == 35 then
		LS_mode[id] = mode
	end
end

function LS_select(id, type, mode)
	if type == 35 then
		LS_mode[id] = mode
	end
end