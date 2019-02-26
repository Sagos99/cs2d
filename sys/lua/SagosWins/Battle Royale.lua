------------------------------------------------------
------------------Script by Sagos---------------------
---------------Criado dia 20/11/2017------------------
------------------------------------------------------

parse("sv_gamemode 1")
parse("mp_weaponfadeout 999")
parse("mp_infammo 1")

function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 

kit=initArray(32)
kitFull=initArray(32)
analgesico=initArray(32)
energetico=initArray(32)
ligadura=initArray(32)
HP=initArray(32)
colete=initArray(32)
folego=initArray(32)
pulmao=initArray(32)

menuKit=initArray(32)
menuKitFull=initArray(32)
menuAnalgesico=initArray(32)
menuEnergetico=initArray(32)
menuLigadura=initArray(32)
menuPrimaria=initArray(32)
menuSecundaria=initArray(32)
menuBala1=initArray(32)
menuBala2=initArray(32)
menuBala3=initArray(32)
menuBala4=initArray(32)
menuBala5=initArray(32)
adrenalinaHud=initArray(32)
folegoHud=initArray(32)

item=initArray(32)
tempoCura=initArray(32)
adrenalina=initArray(32)

balaPistola=initArray(32)
pistola=initArray(32)

balaRifle=initArray(32)
rifle=initArray(32)

balaShotgun=initArray(32)
shotgun=initArray(32)

balaSMG=initArray(32)
SMG=initArray(32)

capacidade=initArray(32)
capacidadeMax=initArray(32)
capacidadeVerif=initArray(32)

status=initArray(32)
modo=initArray(32)

tempo = -1
aviao = 0
rodada = 0
jogadores = 0
vivos = 0
contar = 0

	for a = 1,32 do
		capacidadeMax[a] = 70
		capacidade[a] = 0
		item[a] = ""
		tempoCura[a] = 0
		menuKit[a] = ""
		menuKitFull[a] = ""
		menuAnalgesico[a] = ""
		menuEnergetico[a] = ""
		menuLigadura[a] = ""
		folegoHud[a] = ""
		adrenalinaHud[a] = ""
	end
	
corInfo = "©255100000[Info] ©255255000"
corItem = "©000255000"

addhook("say","falar")
addhook("second","segundos")
addhook("walkover","coletar")
addhook("attack","atacar")
addhook("attack2","atacar2")
addhook("serveraction","teclas")
addhook("menu","mymenu")
addhook("hit","ataque")
addhook("drop","dropar")
addhook("movetile","mover")
addhook("always","sempre")

	function mover(id,x,y)
		if item[id] ~= "" then
			msg2(id,corInfo.."Item Cancelado, não se mova para usar")
			item[id] = ""
			tempoCura[id] = 0
		end
		
		if tile(player(id,"tilex"),player(id,"tiley"),"frame") == 3 then -- 3 = água
			folego[id] = folego[id]+1
			if folego[id] == 1 then
				pulmao[id] = 15
			end
			parse("speedmod "..id.." -10")
		else
			folego[id] = 0
			if adrenalina[id] > 60 then
				parse("speedmod "..id.." 5")
			else
				parse("speedmod "..id.." 0")
			end
		end
	end


	function dropar(id,iid,type,ain,a,mode,x,y)
		if type == 1 or type == 2 or type == 3 or type == 4 or type == 5 or type == 6 then
			pistola[id] = 0
		end
		
		if type == 10 or type == 11 then
			shotgun[id] = 0
		end
		
		if type == 20 or type == 21 or type == 22 or type == 23 or type == 24 then
			SMG[id] = 0
		end
		
		if type == 30 or type == 31 or type == 32 or type == 33 or type == 34 or type == 35 or type == 36 or type == 37 or type == 38 or type == 39 or type == 91 then
			rifle[id] = 0
		end
	end

	function ataque(vitima,atacante,weapon,hpdmg,apdmg,rawdmg)
		if weapon == 1 or weapon == 2 or weapon == 3 or weapon == 4 or weapon == 5 or weapon == 6 then
			if balaPistola[atacante] > 0 then
				return 0
			else
				return 1
			end
		end
		
		if weapon == 10 or weapon == 11 then
			if balaShotgun[atacante] > 0 then
				return 0
			else
				return 1
			end
		end
		
		if weapon == 20 or weapon == 21 or weapon == 22 or weapon == 23 or weapon == 24 then
			if balaSMG[atacante] > 0 then
				return 0
			else
				return 1
			end
		end
		
		if weapon == 30 or weapon == 31 or weapon == 32 or weapon == 33 or weapon == 34 or weapon == 35 or weapon == 36 or weapon == 37 or weapon == 38 or weapon == 39 or weapon == 91 then
			if balaRifle[atacante] > 0 then
				return 0
			else
				return 1
			end
		end
	end

	function mymenu(id,title,button)
		if title == "Inventário" then
			if button == 1 then
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
			elseif button == 2 then
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Usar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 3 then
				menu(id,"Dropar Itens,Itens de Cura,Munição,Armas,,,,,,Voltar")
			end
		end
		
		if title == "Armas" then
			if button == 1 then
				if rifle[id] == 0 and shotgun[id] == 0 and SMG[id] == 0 then
					msg2(id,corInfo.."Você não tem arma primária no inventário")
				end
				
				if rifle[id] > 0 then
					parse("equip "..id.." "..rifle[id])
					msg2(id,corInfo.."Você equipou: "..corItem..""..itemtype(rifle[id],"name"))
					rifle[id] = 0
				end
				
				if shotgun[id] > 0 then
					parse("equip "..id.." "..shotgun[id])
					msg2(id,corInfo.."Você equipou: "..corItem..""..itemtype(shotgun[id],"name"))
					shotgun[id] = 0
				end
				
				if SMG[id] > 0 then
					parse("equip "..id.." "..SMG[id])
					msg2(id,corInfo.."Você equipou: "..corItem..""..itemtype(SMG[id],"name"))
					SMG[id] = 0
				end
				
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
				
			elseif button == 2 then
				if pistola[id] > 0 then
					parse("equip "..id.." "..pistola[id])
					msg2(id,corInfo.."Você equipou: "..corItem..""..itemtype(pistola[id],"name"))
					pistola[id] = 0
				else
					msg2(id,corInfo.."Você não tem pistola no inventário")
				end
				
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
			elseif button == 9 then
				menu(id,"Inventário,Armas,Itens de Cura,Dropar Itens")
			end
		end
		
		if title == "Usar Itens de Cura" then
			if button == 1 then
				if item[id] == "" then
					if analgesico[id] == 0 then
						msg2(id,corInfo.."Você não tem "..corItem.."Analgésico")
					else
						tempoCura[id] = 6
						item[id] = "analgesico"
						msg2(id,corInfo.."Aguarde 6 segundos para usar "..corItem.."Analgésico")
					end
				else
					msg2(id,corInfo.."Aguarde, você já está usando um item")
				end
			elseif button == 2 then
				if item[id] == "" then
					if energetico[id] == 0 then
						msg2(id,corInfo.."Você não tem "..corItem.."Energético")
					else
						tempoCura[id] = 4
						item[id] = "energetico"
						msg2(id,corInfo.."Aguarde 4 segundos para usar "..corItem.."Energético")
					end
				else
					msg2(id,corInfo.."Aguarde, você já está usando um item")
				end
			elseif button == 3 then
				if item[id] == "" then
					if player(id,"health") >= 75 then
						msg2(id,corInfo.."Ligadura só cura até 75% de HP")
					else
						if ligadura[id] == 0 then
							msg2(id,corInfo.."Você não tem "..corItem.."Ligadura")
						else
							tempoCura[id] = 4
							item[id] = "ligadura"
							msg2(id,corInfo.."Aguarde 4 segundos para usar "..corItem.."Ligadura")
						end
					end
				else
					msg2(id,corInfo.."Aguarde, você já está usando um item")
				end
			elseif button == 4 then
				if item[id] == "" then
					if player(id,"health") < 75 then
						if kit[id] == 0 then
							msg2(id,corInfo.."Você não tem "..corItem.."Kit médico")
						else
							tempoCura[id] = 6
							item[id] = "kit"
							msg2(id,corInfo.."Aguarde 6 segundos para usar "..corItem.."Kit Médico")
						end
					else
						msg2(id,corInfo.."Ligadura só cura até 75% de vida")
					end
				else
					msg2(id,corInfo.."Aguarde, você já está usando um item")
				end
			elseif button == 5 then
				if item[id] == "" then
					if player(id,"health") < 100 then
						if kitFull[id] == 0 then
							msg2(id,corInfo.."Você não tem "..corItem.."Kit Full")
						else
							tempoCura[id] = 8
							item[id] = "kit full"
							msg2(id,corInfo.."Aguarde 8 segundos para usar "..corItem.."Kit Full")
						end
					else
						msg2(id,corInfo.."Você já está com HP cheio")
					end
				else
					msg2(id,corInfo.."Aguarde, você já está usando um item")
				end
			elseif button == 9 then
				menu(id,"Inventário,Armas,Itens de Cura,Dropar Itens")
			end
		end
		
		if title == "Dropar Itens" then
			if button == 1 then
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 2 then
				menu(id,"Escolha a Arma,Rifle|"..balaRifle[id].." Balas,Shotgun|"..balaShotgun[id].." Balas,SMG|"..balaSMG[id].." Balas,Pistola|"..balaPistola[id].." Balas,,,,,Voltar")
			elseif button == 3 then
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Dropar Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
			elseif button == 9 then
				menu(id,"Inventário,Armas,Itens de Cura,Dropar Itens")
			end
		end
		
		if title == "Escolha a Arma" then
			if button == 1 then
				if balaRifle[id] >= 30 then
					menuBala1[id] = "30"
				elseif balaRifle[id] > 0 then
					menuBala1[id] = ""..balaRifle[id]
				else
					menuBala1[id] = "(30)"
				end
				
				if balaRifle[id] >= 60 then
					menuBala2[id] = "60"
				else
					menuBala2[id] = "(60)"
				end
				
				if balaRifle[id] >= 90 then
					menuBala3[id] = "90"
				else
					menuBala3[id] = "(90)"
				end
				
				if balaRifle[id] >= 120 then
					menuBala4[id] = "120"
				else
					menuBala4[id] = "(120)"
				end
				
				if balaRifle[id] >= 150 then
					menuBala5[id] = "150"
				else
					menuBala5[id] = "(150)"
				end
				
				menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
			elseif button == 2 then
				if balaShotgun[id] >= 10 then
					menuBala1[id] = "10"
				elseif balaShotgun[id] > 0 then
					menuBala1[id] = ""..balaShotgun[id]
				else
					menuBala1[id] = "(10)"
				end
				
				if balaShotgun[id] >= 20 then
					menuBala2[id] = "20"
				else
					menuBala2[id] = "(20)"
				end
				
				if balaShotgun[id] >= 30 then
					menuBala3[id] = "30"
				else
					menuBala3[id] = "(30)"
				end
				
				if balaShotgun[id] >= 40 then
					menuBala4[id] = "40"
				else
					menuBala4[id] = "(40)"
				end
				
				if balaShotgun[id] >= 50 then
					menuBala5[id] = "50"
				else
					menuBala5[id] = "(50)"
				end
				
				menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
			elseif button == 3 then
				if balaSMG[id] >= 30 then
					menuBala1[id] = "30"
				elseif balaSMG[id] > 0 then
					menuBala1[id] = ""..balaSMG[id]
				else
					menuBala1[id] = "(30)"
				end
				
				if balaSMG[id] >= 60 then
					menuBala2[id] = "60"
				else
					menuBala2[id] = "(60)"
				end
				
				if balaSMG[id] >= 90 then
					menuBala3[id] = "90"
				else
					menuBala3[id] = "(90)"
				end
			
				if balaSMG[id] >= 120 then
					menuBala4[id] = "120"
				else
					menuBala4[id] = "(120)"
				end
				
				if balaSMG[id] >= 150 then
					menuBala5[id] = "150"
				else
					menuBala5[id] = "(150)"
				end
				
				menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
			elseif button == 4 then
				if balaPistola[id] >= 15 then
					menuBala1[id] = "15"
				elseif balaPistola[id] > 0 then
					menuBala1[id] = ""..balaPistola[id]
				else
					menuBala1[id] = "(15)"
				end
				
				if balaPistola[id] >= 30 then
					menuBala2[id] = "30"
				else
					menuBala2[id] = "(30)"
				end
				
				if balaPistola[id] >= 45 then
					menuBala3[id] = "45"
				else
					menuBala3[id] = "(45)"
				end
				
				if balaPistola[id] >= 60 then
					menuBala4[id] = "60"
				else
					menuBala4[id] = "(60)"
				end
				
				if balaPistola[id] >= 75 then
					menuBala5[id] = "75"
				else
					menuBala5[id] = "(75)"
				end
				
				menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
			elseif button == 9 then
				menu(id,"Dropar Itens,Itens de Cura,Munição,Armas,,,,,,Voltar")
			end
		end
			
		if title == "Rifle" then
			if button == 1 then
				if balaRifle[id] >= 30 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaRifle[id] = balaRifle[id]-30
					capacidade[id] = capacidade[id]-30
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaRifle[id] > 0 then
					capacidade[id] = capacidade[id]-balaRifle[id]
					balaRifle[id] = 0
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaRifle[id] == 0 then
					msg2(id,corInfo.."Você não tem "..corItem.."Balas de Rifle")
				end
			elseif button == 2 then
				if balaRifle[id] >= 60 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaRifle[id] = balaRifle[id]-60
					capacidade[id] = capacidade[id]-60
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 3 then
				if balaRifle[id] >= 90 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaRifle[id] = balaRifle[id]-90
					capacidade[id] = capacidade[id]-90
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 4 then
				if balaRifle[id] >= 120 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaRifle[id] = balaRifle[id]-120
					capacidade[id] = capacidade[id]-120
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 5 then
				if balaRifle[id] >= 150 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaRifle[id] = balaRifle[id]-150
					capacidade[id] = capacidade[id]-150
					
					if balaRifle[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaRifle[id] > 0 then
						menuBala1[id] = ""..balaRifle[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaRifle[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaRifle[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaRifle[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaRifle[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"Rifle,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 9 then
				menu(id,"Escolha a Arma,Rifle|"..balaRifle[id].." Balas,Shotgun|"..balaShotgun[id].." Balas,SMG|"..balaSMG[id].." Balas,Pistola|"..balaPistola[id].." Balas,,,,,Voltar")
			end
		end
		
		if title == "Shotgun" then
			if button == 1 then
				if balaShotgun[id] >= 10 then
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					balaShotgun[id] = balaShotgun[id]-10
					capacidade[id] = capacidade[id]-10
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaShotgun[id] > 0 then
					capacidade[id] = capacidade[id]-balaShotgun[id]
					balaShotgun[id] = 0
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaShotgun[id] == 0 then
					msg2(id,corInfo.."Você não tem "..corItem.."Balas de Shotgun")
				end
			elseif button == 2 then
				if balaShotgun[id] >= 20 then
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					balaShotgun[id] = balaShotgun[id]-20
					capacidade[id] = capacidade[id]-20
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 3 then
				if balaShotgun[id] >= 30 then
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					balaShotgun[id] = balaShotgun[id]-30
					capacidade[id] = capacidade[id]-30
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 4 then
				if balaShotgun[id] >= 40 then
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 72 "..player(id,"tilex").." "..player(id,"tiley"))
					balaShotgun[id] = balaShotgun[id]-40
					capacidade[id] = capacidade[id]-40
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 5 then
				if balaShotgun[id] >= 50 then
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 61 "..player(id,"tilex").." "..player(id,"tiley"))
					balaShotgun[id] = balaShotgun[id]-50
					capacidade[id] = capacidade[id]-50
					
					if balaShotgun[id] >= 10 then
						menuBala1[id] = "10"
					elseif balaShotgun[id] > 0 then
						menuBala1[id] = ""..balaShotgun[id]
					else
						menuBala1[id] = "(10)"
					end
					
					if balaShotgun[id] >= 20 then
						menuBala2[id] = "20"
					else
						menuBala2[id] = "(20)"
					end
					
					if balaShotgun[id] >= 30 then
						menuBala3[id] = "30"
					else
						menuBala3[id] = "(30)"
					end
					
					if balaShotgun[id] >= 40 then
						menuBala4[id] = "40"
					else
						menuBala4[id] = "(40)"
					end
					
					if balaShotgun[id] >= 50 then
						menuBala5[id] = "50"
					else
						menuBala5[id] = "(50)"
					end
					
					menu(id,"Shotgun,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 9 then
				menu(id,"Escolha a Arma,Rifle|"..balaRifle[id].." Balas,Shotgun|"..balaShotgun[id].." Balas,SMG|"..balaSMG[id].." Balas,Pistola|"..balaPistola[id].." Balas,,,,,Voltar")
			end
		end
		
		if title == "SMG" then
			if button == 1 then
				if balaSMG[id] >= 30 then
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					balaSMG[id] = balaSMG[id]-30
					capacidade[id] = capacidade[id]-30
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaSMG[id] > 0 then
					capacidade[id] = capacidade[id]-balaSMG[id]
					balaSMG[id] = 0
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaSMG[id] == 0 then
					msg2(id,corInfo.."Você não tem "..corItem.."Balas de SMG")
				end
			elseif button == 2 then
				if balaSMG[id] >= 60 then
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					balaSMG[id] = balaSMG[id]-60
					capacidade[id] = capacidade[id]-60
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 3 then
				if balaSMG[id] >= 90 then
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					balaSMG[id] = balaSMG[id]-90
					capacidade[id] = capacidade[id]-90
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 4 then
				if balaSMG[id] >= 120 then
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					balaSMG[id] = balaSMG[id]-120
					capacidade[id] = capacidade[id]-120
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 5 then
				if balaSMG[id] >= 150 then
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 75 "..player(id,"tilex").." "..player(id,"tiley"))
					balaSMG[id] = balaSMG[id]-150
					capacidade[id] = capacidade[id]-150
					
					if balaSMG[id] >= 30 then
						menuBala1[id] = "30"
					elseif balaSMG[id] > 0 then
						menuBala1[id] = ""..balaSMG[id]
					else
						menuBala1[id] = "(30)"
					end
					
					if balaSMG[id] >= 60 then
						menuBala2[id] = "60"
					else
						menuBala2[id] = "(60)"
					end
					
					if balaSMG[id] >= 90 then
						menuBala3[id] = "90"
					else
						menuBala3[id] = "(90)"
					end
					
					if balaSMG[id] >= 120 then
						menuBala4[id] = "120"
					else
						menuBala4[id] = "(120)"
					end
					
					if balaSMG[id] >= 150 then
						menuBala5[id] = "150"
					else
						menuBala5[id] = "(150)"
					end
					
					menu(id,"SMG,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 9 then
				menu(id,"Escolha a Arma,Rifle|"..balaRifle[id].." Balas,Shotgun|"..balaShotgun[id].." Balas,SMG|"..balaSMG[id].." Balas,Pistola|"..balaPistola[id].." Balas,,,,,Voltar")
			end
		end
		
		if title == "Pistola" then
			if button == 1 then
				if balaPistola[id] >= 15 then
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					balaPistola[id] = balaPistola[id]-15
					capacidade[id] = capacidade[id]-15
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaPistola[id] > 0 then
					capacidade[id] = capacidade[id]-balaPistola[id]
					balaPistola[id] = 0
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				elseif balaPistola[id] == 0 then
					msg2(id,corInfo.."Você não tem "..corItem.."Balas de Pistola")
				end
			elseif button == 2 then
				if balaPistola[id] >= 30 then
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					balaPistola[id] = balaPistola[id]-30
					capacidade[id] = capacidade[id]-30
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 3 then
				if balaPistola[id] >= 45 then
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					balaPistola[id] = balaPistola[id]-45
					capacidade[id] = capacidade[id]-45
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 4 then
				if balaPistola[id] >= 60 then
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					balaPistola[id] = balaPistola[id]-60
					capacidade[id] = capacidade[id]-60
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 5 then
				if balaPistola[id] >= 75 then
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					parse("spawnitem 62 "..player(id,"tilex").." "..player(id,"tiley"))
					balaPistola[id] = balaPistola[id]-75
					capacidade[id] = capacidade[id]-75
					
					if balaPistola[id] >= 15 then
						menuBala1[id] = "15"
					elseif balaPistola[id] > 0 then
						menuBala1[id] = ""..balaPistola[id]
					else
						menuBala1[id] = "(15)"
					end
					
					if balaPistola[id] >= 30 then
						menuBala2[id] = "30"
					else
						menuBala2[id] = "(30)"
					end
					
					if balaPistola[id] >= 45 then
						menuBala3[id] = "45"
					else
						menuBala3[id] = "(45)"
					end
					
					if balaPistola[id] >= 60 then
						menuBala4[id] = "60"
					else
						menuBala4[id] = "(60)"
					end
					
					if balaPistola[id] >= 75 then
						menuBala5[id] = "75"
					else
						menuBala5[id] = "(75)"
					end
					
					menu(id,"Pistola,"..menuBala1[id]..","..menuBala2[id]..","..menuBala3[id]..","..menuBala4[id]..","..menuBala5[id]..",,,,Voltar")
				end
			elseif button == 9 then
				menu(id,"Escolha a Arma,Rifle|"..balaRifle[id].." Balas,Shotgun|"..balaShotgun[id].." Balas,SMG|"..balaSMG[id].." Balas,Pistola|"..balaPistola[id].." Balas,,,,,Voltar")
			end
		end
		
		if title == "Dropar Armas" then
			if button == 1 then
				if rifle[id] > 0 then
					parse("spawnitem "..rifle[id].." "..player(id,"tilex").." "..player(id,"tiley"))
					rifle[id] = 0
				elseif shotgun[id] > 0 then
					parse("spawnitem "..shotgun[id].." "..player(id,"tilex").." "..player(id,"tiley"))
					shotgun[id] = 0
				elseif SMG[id] > 0 then
					parse("spawnitem "..SMG[id].." "..player(id,"tilex").." "..player(id,"tiley"))
					SMG[id] = 0
				end
				
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Dropar Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
			elseif button == 2 then
				if pistola[id] > 0 then
					parse("spawnitem "..pistola[id].." "..player(id,"tilex").." "..player(id,"tiley"))
					pistola[id] = 0
				end
				
				if rifle[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(rifle[id],"name")..""
				elseif SMG == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if SMG[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(SMG[id],"name")..""
				elseif rifle == 0 and shotgun == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if shotgun[id] > 0 then
					menuPrimaria[id] = "Primária:|"..itemtype(shotgun[id],"name")..""
				elseif rifle == 0 and SMG == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if rifle[id] == 0 and SMG[id] == 0 and shotgun[id] == 0 then
					menuPrimaria[id] = "(Primária:|Nenhum)"
				end
				
				if pistola[id] > 0 then
					menuSecundaria[id] = "Secundária:|"..itemtype(pistola[id],"name")..""
				else
					menuSecundaria[id] = "(Secundária:|Nenhum)"
				end
				
				menu(id,"Dropar Armas,"..menuPrimaria[id]..","..menuSecundaria[id]..",,,,,,,Voltar")
			elseif button == 9 then
				menu(id,"Dropar Itens,Itens de Cura,Munição,Armas,,,,,,Voltar")
			end
		end
		
		if title == "Dropar Itens de Cura" then
			if button == 1 then
				if item[id] ~= "" then
					msg2(id,corInfo.."Item Cancelado, você o dropou")
					item[id] = ""
					tempoCura[id] = 0
				end
				
				analgesico[id] = analgesico[id]-1
				parse("spawnitem 68 "..player(id,"tilex").." "..player(id,"tiley"))
				capacidade[id] = capacidade[id]-10
				
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 2 then
				if item[id] ~= "" then
					msg2(id,corInfo.."Item Cancelado, você o dropou")
					item[id] = ""
					tempoCura[id] = 0
				end
				
				energetico[id] = energetico[id]-1
				parse("spawnitem 66 "..player(id,"tilex").." "..player(id,"tiley"))
				capacidade[id] = capacidade[id]-10
				
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 3 then
				if item[id] ~= "" then
					msg2(id,corInfo.."Item Cancelado, você o dropou")
					item[id] = ""
					tempoCura[id] = 0
				end
				
				ligadura[id] = ligadura[id]-1
				parse("spawnitem 67 "..player(id,"tilex").." "..player(id,"tiley"))
				capacidade[id] = capacidade[id]-10
				
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 4 then
				if item[id] ~= "" then
					msg2(id,corInfo.."Item Cancelado, você o dropou")
					item[id] = ""
					tempoCura[id] = 0
				end
				
				kit[id] = kit[id]-1
				parse("spawnitem 65 "..player(id,"tilex").." "..player(id,"tiley"))
				capacidade[id] = capacidade[id]-10
				
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 5 then
				if item[id] ~= "" then
					msg2(id,corInfo.."Item Cancelado, você o dropou")
					item[id] = ""
					tempoCura[id] = 0
				end
				
				kitFull[id] = kitFull[id]-1
				parse("spawnitem 64 "..player(id,"tilex").." "..player(id,"tiley"))
				capacidade[id] = capacidade[id]-10
				
				if analgesico[id] > 0 then
					menuAnalgesico[id] = "Analgésico|Quantidade: "..analgesico[id]..""
				else
					menuAnalgesico[id] = "(Analgésico)|Nenhum"
				end
				
				if energetico[id] > 0 then
					menuEnergetico[id] = "Energético|Quantidade: "..energetico[id]..""
				else
					menuEnergetico[id] = "(Energético)|Nenhum"
				end
				
				if ligadura[id] > 0 then
					menuLigadura[id] = "Ligadura|Quantidade: "..ligadura[id]..""
				else
					menuLigadura[id] = "(Ligadura)|Nenhum"
				end
				
				if kit[id] > 0 then
					menuKit[id] = "Kit Médico|Quantidade: "..kit[id]..""
				else
					menuKit[id] = "(Kit Médico)|Nenhum"
				end
				
				if kitFull[id] > 0 then
					menuKitFull[id] = "Kit Full|Quantidade: "..kitFull[id]..""
				else
					menuKitFull[id] = "(Kit Full)|Nenhum"
				end				
				
				menu(id,"Dropar Itens de Cura,"..menuAnalgesico[id]..","..menuEnergetico[id]..","..menuLigadura[id]..","..menuKit[id]..","..menuKitFull[id]..",,,,Voltar")
			elseif button == 9 then
				menu(id,"Dropar Itens,Itens de Cura,Munição,Armas,,,,,,Voltar")
			end
		end
	end

	function teclas(id,act)
		if act == 1 then			
			menu(id,"Inventário,Armas,Itens de Cura,Dropar Itens")
		end
	end
	
	function atacar2(id,mode)
		modo[id] = mode
	end

	function atacar(id)
		if player(id,"weapon") == 1 or player(id,"weapon") == 2 or player(id,"weapon") == 3 or player(id,"weapon") == 4 or player(id,"weapon") == 5 or player(id,"weapon") == 6 then
			status[id] = "pistola"
		end
		
		if player(id,"weapon") == 10 or player(id,"weapon") == 11 then
			status[id] = "shotgun"
		end
		
		if player(id,"weapon") == 20 or player(id,"weapon") == 21 or player(id,"weapon") == 22 or player(id,"weapon") == 23 or player(id,"weapon") == 24 then
			status[id] = "SMG"
		end
		
		if player(id,"weapon") == 30 or player(id,"weapon") == 31 or player(id,"weapon") == 32 or player(id,"weapon") == 33 or player(id,"weapon") == 34 or player(id,"weapon") == 35 or player(id,"weapon") == 36 or player(id,"weapon") == 37 or player(id,"weapon") == 38 or player(id,"weapon") == 39 or player(id,"weapon") == 91 then
			status[id] = "rifle"
		end
	
	
		if player(id,"weapon") == 1 or player(id,"weapon") == 2 or player(id,"weapon") == 3 or player(id,"weapon") == 4 or player(id,"weapon") == 5 or player(id,"weapon") == 6 then
			if balaPistola[id] > 1 then
				balaPistola[id] = balaPistola[id]-1
				capacidade[id] = capacidade[id]-1
				if modo[id] == 1 then
					if player(id,"weapontype") == 2 then
						balaPistola[id] = balaPistola[id]-2
						capacidade[id] = capacidade[id]-2
					end
				end
			elseif balaPistola[id] <= 1 then				
				if balaPistola[id] == 1 then
					capacidade[id] = capacidade[id]-1
				end
				balaPistola[id] = 0
				pistola[id] = player(id,"weapon")
				parse("strip "..id.." "..player(id,"weapon"))
				modo[id] = 0
				msg2(id,corInfo.."Sem balas de pistola, sua "..corItem..""..itemtype(pistola[id],"name").." ©255255000foi guardada no inventário")
			end
		end
		
		if player(id,"weapon") == 10 or player(id,"weapon") == 11 then
			if balaShotgun[id] > 1 then
				balaShotgun[id] = balaShotgun[id]-1
				capacidade[id] = capacidade[id]-1
			elseif balaShotgun[id] <= 1 then				
				if balaShotgun[id] == 1 then
					capacidade[id] = capacidade[id]-1
				end
				balaShotgun[id] = 0
				shotgun[id] = player(id,"weapon")
				parse("strip "..id.." "..player(id,"weapon"))
				modo[id] = 0
				msg2(id,corInfo.."Sem balas de shotgun, sua "..corItem..""..itemtype(shotgun[id],"name").." ©255255000foi guardada no inventário")
			end
		end
		
		if player(id,"weapon") == 20 or player(id,"weapon") == 21 or player(id,"weapon") == 22 or player(id,"weapon") == 23 or player(id,"weapon") == 24 then
			if balaSMG[id] > 1 then
				balaSMG[id] = balaSMG[id]-1
				capacidade[id] = capacidade[id]-1
			elseif balaSMG[id] <= 1 then				
				if balaSMG[id] == 1 then
					capacidade[id] = capacidade[id]-1
				end
				balaSMG[id] = 0
				SMG[id] = player(id,"weapon")
				parse("strip "..id.." "..player(id,"weapon"))
				modo[id] = 0
				msg2(id,corInfo.."Sem balas de SMG, sua "..corItem..""..itemtype(SMG[id],"name").." ©255255000foi guardada no inventário")
			end
		end
		
		if player(id,"weapon") == 30 or player(id,"weapon") == 31 or player(id,"weapon") == 32 or player(id,"weapon") == 33 or player(id,"weapon") == 34 or player(id,"weapon") == 35 or player(id,"weapon") == 36 or player(id,"weapon") == 37 or player(id,"weapon") == 38 or player(id,"weapon") == 39 or player(id,"weapon") == 91 then
			if balaRifle[id] > 1 then
				balaRifle[id] = balaRifle[id]-1
				capacidade[id] = capacidade[id]-1
				if modo[id] == 1 then
					if player(id,"weapontype") == 39 then
						balaRifle[id] = balaRifle[id]-2
						capacidade[id] = capacidade[id]-2
					end
				end
			elseif balaRifle[id] <= 1 then				
				if balaRifle[id] == 1 then
					capacidade[id] = capacidade[id]-1
				end
				balaRifle[id] = 0
				rifle[id] = player(id,"weapon")
				parse("strip "..id.." "..player(id,"weapon"))
				modo[id] = 0
				msg2(id,corInfo.."Sem balas de rifle, sua "..corItem..""..itemtype(rifle[id],"name").." ©255255000foi guardada no inventário")
			end
		end
	end

	function coletar(id,iid,type,ain,a,mode)		
		if capacidade[id] < capacidadeMax[id] then
			if type == 64 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					kitFull[id] = kitFull[id]+1
					msg2(id,corInfo.."Você pegou "..corItem.."Kit Full")
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 65 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					kit[id] = kit[id]+1
					msg2(id,corInfo.."Você pegou "..corItem.."Kit Médico")
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 62 then
				capacidadeVerif[id] = capacidade[id]+15
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					balaPistola[id] = balaPistola[id]+15
					msg2(id,corInfo.."Você pegou "..corItem.."15 Balas de Pistola")
					if pistola[id] > 0 then
						parse("equip "..id.." "..pistola[id])
						msg2(id,corInfo.."Você equipou "..corItem..""..itemtype(pistola[id],"name"))
						pistola[id] = 0	
						modo[id] = 0
					end
					capacidade[id] = capacidade[id]+15
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 75 then
				capacidadeVerif[id] = capacidade[id]+30
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					balaSMG[id] = balaSMG[id]+30
					msg2(id,corInfo.."Você pegou "..corItem.."30 Balas de SMG")
					if SMG[id] > 0 then
						parse("equip "..id.." "..SMG[id])
						msg2(id,corInfo.."Você equipou "..corItem..""..itemtype(SMG[id],"name"))
						SMG[id] = 0
						modo[id] = 0
					end
					capacidade[id] = capacidade[id]+30
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 72 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					balaShotgun[id] = balaShotgun[id]+10
					msg2(id,corInfo.."Você pegou "..corItem.."10 Balas de Shotgun")
					if shotgun[id] > 0 then
						parse("equip "..id.." "..shotgun[id])
						msg2(id,corInfo.."Você equipou "..corItem..""..itemtype(shotgun[id],"name"))
						shotgun[id] = 0
						modo[id] = 0
					end
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 68 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					analgesico[id] = analgesico[id]+1
					msg2(id,corInfo.."Você pegou "..corItem.."Analgésico")
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end			
			elseif type == 66 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					energetico[id] = energetico[id]+1
					msg2(id,corInfo.."Você pegou "..corItem.."Energético")
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 67 then
				capacidadeVerif[id] = capacidade[id]+10
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					ligadura[id] = ligadura[id]+1
					msg2(id,corInfo.."Você pegou "..corItem.."Ligadura")
					capacidade[id] = capacidade[id]+10
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			elseif type == 61 then
				capacidadeVerif[id] = capacidade[id]+30
				if capacidadeVerif[id] <= capacidadeMax[id] then
					parse("removeitem "..iid)
					balaRifle[id] = balaRifle[id]+30
					msg2(id,corInfo.."Você pegou "..corItem.."30 Balas de Rifle")
					if rifle[id] > 0 then
						parse("equip "..id.." "..rifle[id])
						msg2(id,corInfo.."Você equipou "..corItem..""..itemtype(rifle[id],"name"))
						rifle[id] = 0
						modo[id] = 0
					end
					capacidade[id] = capacidade[id]+30
					return 1
				else
					msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
					return 1
				end
			end
		elseif type == 51 or type == 52 or type == 53 or type == 54 or type == 73 or type == 61 or type == 62 or type == 64 or type == 65 or type == 66 or type == 67 or type == 68 or type == 72 or type == 75 then
			msg2(id,corInfo.."Espaço insuficiente para carregar mais itens")
			return 1
		end
		
		if pistola[id] ~= 0 then
			if type == 1 or type == 2 or type == 3 or type == 4 or type == 5 or type == 6 then
				msg2(id,corInfo.."Você já tem "..corItem..""..itemtype(pistola[id],"name").." ©255255000no inventário")
				return 1
			end
		end
		
		if rifle[id] ~= 0 or SMG[id] ~= 0 or shotgun[id] ~= 0 then
			if type == 10 or type == 11 or type == 20 or type == 21 or type == 22 or type == 23 or type == 24 or type == 30 or type == 31 or type == 32 or type == 33 or type == 34 or type == 35 or type == 36 or type == 37 or type == 38 or type == 39 or type == 91 then
				if rifle[id] > 0 then
					msg2(id,corInfo.."Você já tem "..corItem..""..itemtype(rifle[id],"name").." ©255255000no inventário")
				elseif SMG[id] > 0 then
					msg2(id,corInfo.."Você já tem "..corItem..""..itemtype(SMG[id],"name").." ©255255000no inventário")
				elseif shotgun[id] > 0 then
					msg2(id,corInfo.."Você já tem "..corItem..""..itemtype(shotgun[id],"name").." ©255255000no inventário")
				end
				return 1
			end
		end
		
		if type == 79 then				
			if colete[id] == 0 then
				parse("removeitem "..iid)
				parse("equip "..id.." 79")
				colete[id] = 1
				msg2(id,corInfo.."Você equipou "..corItem.."Colete 1")
				capacidadeMax[id] = capacidadeMax[id]+50
				return 1
			else
				msg2(id,corInfo.."Você já possui um colete igual ou melhor")
				return 1
			end
		elseif type == 80 then
			if colete[id] == 0 then
				parse("removeitem "..iid)
				parse("equip "..id.." 80")
				colete[id] = 2
				msg2(id,corInfo.."Você equipou "..corItem.."Colete 2")
				capacidadeMax[id] = capacidadeMax[id]+50
				return 1
			elseif colete[id] == 1 then
				parse("removeitem "..iid)
				parse("equip "..id.." 80")
				colete[id] = 2
				msg2(id,corInfo.."Você equipou "..corItem.."Colete 2")
				parse("spawnitem 79 "..player(id,"tilex").." "..player(id,"tiley"))
				return 1
			else
				msg2(id,corInfo.."Você já possui um colete igual ou melhor")
				return 1
			end
		elseif type == 81 then
			if colete[id] == 0 then
				parse("removeitem "..iid)
				parse("equip "..id.." 81")
				colete[id] = 3
				msg2(id,corInfo.."Você equipou "..corItem.."Colete 3")
				capacidadeMax[id] = capacidadeMax[id]+50
				return 1
			elseif colete[id] == 1 or colete[id] == 2 then
				parse("removeitem "..iid)
				parse("equip "..id.." 81")
				colete[id] = 3
				msg2(id,corInfo.."Você equipou "..corItem.."Colete 3")
					if colete[id] == 1 then
						parse("spawnitem 79 "..player(id,"tilex").." "..player(id,"tiley"))
					elseif colete[id] == 2 then
						parse("spawnitem 80 "..player(id,"tilex").." "..player(id,"tiley"))
					end
				return 1
			else
				msg2(id,corInfo.."Você já possui um colete igual ou melhor")
				return 1
			end
		end
	end
	
	function sempre()
	
	end
	
	function falar(id,txt)
		if txt == "!inicia" then
			tempo = 10
			return 1
		end
	end
	
	function segundos()
		if jogadores >= 2 then
			contar = contar+1
			if contar == 1 then
				tempo = 10
			end
		else
			contar = 0
		end
		
		
		if tempo > 0 then			
			parse("hudtxt 33 \"©255255255O Jogo irá começar dentro de: "..corItem..""..tempo.." segundos\" 15 195 0")
			tempo = tempo-1
		elseif rodada == 0 then
			parse("hudtxt 33 \"©255255255Aguardando jogadores para começar!\" 15 195 0")
		else
			parse("hudtxt 33 ")
		end
		
		if tempo == 0 then
			aviao = 1
			rodada = 1
		end
		
		jogadores = 0
		for a = 1,32 do
			if player(a,"exists") then
				if capacidade[a] < 0 then
					capacidade[a] = 0
				end
			
				if adrenalina[a] > 0 then
					adrenalinaHud[a] = " | Adrenalina: "..adrenalina[a]-1
				else
					adrenalinaHud[a] = ""
				end
				
				if folego[a] > 0 then
					if pulmao[a] > 0 then
						folegoHud[a] = " | Folego: "..pulmao[a]-1
					else
						folegoHud[a] = " | Folego: "..pulmao[a]
					end
				else
					folegoHud[a] = ""
				end
				
			
				if status[a] == "pistola" then
					parse("hudtxt2 "..a.." "..a.." \"©255255255Balas de Pistola: "..balaPistola[a].." | Capacidade: "..capacidade[a].."/"..capacidadeMax[a]..""..adrenalinaHud[a]..""..folegoHud[a].."\" 15 180 0")
				elseif status[a] == "shotgun" then
					parse("hudtxt2 "..a.." "..a.." \"©255255255Balas de Shotgun: "..balaShotgun[a].." | Capacidade: "..capacidade[a].."/"..capacidadeMax[a]..""..adrenalinaHud[a]..""..folegoHud[a].."\" 15 180 0")
				elseif status[a] == "SMG" then
					parse("hudtxt2 "..a.." "..a.." \"©255255255Balas de SMG: "..balaSMG[a].." | Capacidade: "..capacidade[a].."/"..capacidadeMax[a]..""..adrenalinaHud[a]..""..folegoHud[a].."\" 15 180 0")
				elseif status[a] == "rifle" then
					parse("hudtxt2 "..a.." "..a.." \"©255255255Balas de Rifle: "..balaRifle[a].." | Capacidade: "..capacidade[a].."/"..capacidadeMax[a]..""..adrenalinaHud[a]..""..folegoHud[a].."\" 15 180 0")
				else
					parse("hudtxt2 "..a.." "..a.." \"©255255255Capacidade: "..capacidade[a].."/"..capacidadeMax[a]..""..adrenalinaHud[a]..""..folegoHud[a].."\" 15 180 0")
				end
				
				if tempoCura[a] > 0 and item[a] ~= "" then
					tempoCura[a] = tempoCura[a]-1
				end
				
				if tempoCura[a] == 0 and item[a] == "analgesico" then
					item[a] = ""
					adrenalina[a] = adrenalina[a]+55
					analgesico[a] = analgesico[a]-1
					capacidade[a] = capacidade[a]-10
					msg2(a,corInfo.."Você usou "..corItem.."Analgésico")
				end
				
				if tempoCura[a] == 0 and item[a] == "energetico" then
					item[a] = ""
					adrenalina[a] = adrenalina[a]+45
					energetico[a] = energetico[a]-1
					capacidade[a] = capacidade[a]-10
					msg2(a,corInfo.."Você usou "..corItem.."Energético")
				end

				if tempoCura[a] == 0 and item[a] == "ligadura" then
					item[a] = ""
					if player(a,"health") < 75 and player(a,"health") >= 60 then
						parse("sethealth "..a.." 75")
						ligadura[a] = ligadura[a]-1
						capacidade[a] = capacidade[a]-10
						msg2(a,corInfo.."Você usou "..corItem.."Ligadura")
					else
						parse("sethealth "..a.." "..player(a,"health")+15)
						ligadura[a] = ligadura[a]-1
						capacidade[a] = capacidade[a]-10
						msg2(a,corInfo.."Você usou "..corItem.."Ligadura")
					end
				end
				
				if tempoCura[a] == 0 and item[a] == "kit" then
					item[a] = ""
					parse("sethealth "..a.." 75")
					kit[a] = kit[a]-1
					capacidade[a] = capacidade[a]-10
					msg2(a,corInfo.."Você usou "..corItem.."Kit Médico")
				end
				
				if tempoCura[a] == 0 and item[a] == "kit full" then
					item[a] = ""
					parse("sethealth "..a.." 100")
					kitFull[a] = kitFull[a]-1
					capacidade[a] = capacidade[a]-10
					msg2(a,corInfo.."Você usou "..corItem.."Kit Full")
				end	

				if adrenalina[a] > 0 then
					adrenalina[a] = adrenalina[a]-1
					
					if player(a,"health") < 100 then
						HP[a] = player(a,"health")+1
						parse("sethealth "..a.." "..HP[a])
					end							
				end
				
				if pulmao[a] > 0 then
					pulmao[a] = pulmao[a]-1
				end
				
				if pulmao[a] == 0 and folego[a] > 0 then
					HP[a] = player(a,"health")-15
					if HP[a] > 0 then
						parse("sethealth "..a.." "..HP[a])
					else
						parse("customkill 0 \"Morreu afogado\" "..a)
					end
				end
				
				if player(a,"health") > 0 then					
					jogadores = jogadores+1
				end
			end
		end
	end