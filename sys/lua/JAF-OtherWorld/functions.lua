function jaf.rajawali(id)
         menu(id,"Rajawali - Dreamer,Shop,Quest|Story,,,Who are you?")
end

function jaf.rajawali2(id)
         menu(id,"Rajawali - Dreamer,Shop,(Quest|Story),,,Who are you?")
end

function jaf.jonim(id)
         menu(id,"Joni - Paladin,Shop,Quest,,,Who are you?")
end

function jaf.jonim2(id)
         menu(id,"Joni - Paladin,Shop,(Quest),,,Who are you?")
end

function jaf.legionm(id)
	menu(id,"The Legion,Shop,Quest|Special,,,(Become one of us!)")
end

function jaf.goxim(id)
         menu(id,"Goxi - The Dark,Shop,Quest,,,Who are you?")
end

function jaf.kalumm(id)
         menu(id,"Kalum - Good-Side,Shop,Quest,Let me tell you a Story!,,Who are you?")
end

function jaf.give_shell(id,a,m,m2)
             jaf.shell[id]=jaf.shell[id]+a
             if jaf.shell[id]>25000000 then
                jaf.shell[id]=25000000
             end
             if m~=nil and m then
                 jaf.svj_msg(m)
             end
             if m2~=nil and m2 then
                 jaf.svj_msg2(id,m2)
             end
end

function jaf.give_scs(id,a,m,m2)
             jaf.crystal[id]=jaf.crystal[id]+a
             if jaf.crystal[id]>25000000 then
                jaf.crystal[id]=25000000
             end
             if m~=nil and m then
                 jaf.svj_msg(m)
             end
             if m2~=nil and m2 then
                 jaf.svj_msg2(id,m2)
             end
end

function jaf.logo_remove()
          if jaf.logoIMG~=nil then
                freeimage(jaf.logoIMG)
                jaf.logoIMG=nil
          end
end

function jaf.logo_spawn()
     ----- removed
end

function jaf.buble_remove(id,n)
            if jaf.bubleIMG[id][n]~=nil then
                     freeimage(jaf.bubleIMG[id][n])
                     jaf.bubleIMG[id][n]=nil
            end
end

function jaf.buble_spawn(id,n)
            jaf.buble_remove(id,n)
            buble_scale={0.3,0.2,0.1}
            buble_time=math.random(600,1200)
            buble_xplus=math.random(1,460)
            buble_scalefix=buble_scale[math.random(1,#buble_scale)]
            jaf.bubleIMG[id][n]=image(jaf.locgfx.."bubble.png",50+buble_xplus,520,2,id)
            imagescale(jaf.bubleIMG[id][n],buble_scalefix,buble_scalefix)
            tween_move(jaf.bubleIMG[id][n],buble_time,50+buble_xplus,20)
            tween_alpha(jaf.bubleIMG[id][n],buble_time,0.1)
            function jaf.buble_timer(id,iimg)
                    jaf.buble_remove(id,iimg)
            end
            bbstmr=timerEx(buble_time,jaf.buble_timer,1,id,n)
end

function jaf.removestatusIMG(n)
              if jaf.statusIMG[n]~=nil then
                      freeimage(jaf.statusIMG[n])
                      jaf.statusIMG[n]=nil
              end
end

function jaf.status_spawn()
              for i=1,#jaf.hudIMG_list.status do
                      v=jaf.hudIMG_list.status[i]
                      jaf.removestatusIMG(i)
                      jaf.statusIMG[i]=image(v.img,v.pos[1],v.pos[2],2)
                      imagescale(jaf.statusIMG[i],v.scale,v.scale)
                      if v.alpha~=nil then
                         imagealpha(jaf.statusIMG[i],v.alpha)
                      end
              end
end

function jaf.removebarIMG(id,n)
           if n~=nil and id~=nil and id>0 and jaf.barIMG[id]~=nil and jaf.barIMG[id][n]~=nil then
                    freeimage(jaf.barIMG[id][n])
                    jaf.barIMG[id][n]=nil
           end
end

function jaf.bar_show(id,n)
         local v=jaf.hudIMG_list.bar[n]
         if v~=nil then
            local awal=v.ua(id)
            local akhir=v.un(id)
            jaf.removebarIMG(id,n)
            jaf.barIMG[id][n]=image(v.img,v.pos[1]+((awal/akhir*(v.scale[1]*4))/2),v.pos[2],2,id)
            imagescale(jaf.barIMG[id][n],v.scale[1],v.scale[2])
            imagecolor(jaf.barIMG[id][n],v.color[1],v.color[2],v.color[3])
         end
end

function jaf.removebuttonIMG(n)
              if jaf.buttonIMG[n]~=nil then
                      freeimage(jaf.buttonIMG[n])
                      jaf.buttonIMG[n]=nil
              end
end
              

function jaf.button_spawn()
           for i=1,#jaf.hudIMG_list.btn do
                 local v=jaf.hudIMG_list.btn[i]
                 jaf.removebuttonIMG(i)
                 local scl=1
                 if v.scale~=nil then scl=v.scale end
                 if v.img~=nil and v.img then
                      jaf.buttonIMG[i]=image(v.img[1],v.pos[1],v.pos[2],2)
                      imagecolor(jaf.buttonIMG[i],v.img[2],v.img[3],v.img[4])
                      imagescale(jaf.buttonIMG[i],scl,scl)
                 end
           end
end

function jaf.removebtnposIMG(n)
              if jaf.btnposIMG[n]~=nil then
                      freeimage(jaf.btnposIMG[n])
                      jaf.btnposIMG[n]=nil
              end
end
                 

function jaf.bar_refresh(id,n)
     if jaf.barIMG[id][n]~=nil then
         local v=jaf.hudIMG_list.bar[n] 
         local awal=v.ua(id)
         local akhir=v.un(id)
         if v.vertical then
           imagescale(jaf.barIMG[id][n],(v.scale[1]),(awal/akhir*v.scale[2]))
         else
           imagescale(jaf.barIMG[id][n],(awal/akhir*v.scale[1]),v.scale[2])
         end
         imagepos(jaf.barIMG[id][n],v.pos[1]+((awal/akhir*(v.scale[1]*4))/2),v.pos[2],0)
     end
end

function jaf.bar2_refresh(id,n)
     if jaf.bar2IMG[id][n]~=nil then
         local v=jaf.hudIMG_list.bar2[n]
         local awal=0
         local akhir=0
         if v.var.id~=nil and v.varmax.id~=nil then
           if v.var.player then
              awal=v.var.id[id]
           else
              awal=v.var.id
           end
           if v.varmax.player then
              akhir=v.varmax.id[id]
           else
              akhir=v.varmax.id
           end
           imagescale(jaf.bar2IMG[id][n],(awal/akhir*v.scale[1]),v.scale[2])
           imagepos(jaf.bar2IMG[id][n],v.pos[1]+((awal/akhir*(v.scale[1]*4))/2),v.pos[2],0)
           if awal>=akhir and v.aftercolor~=nil then
                imagecolor(jaf.bar2IMG[id][n],v.aftercolor[1],v.aftercolor[2],v.aftercolor[3])
           elseif v.aftercolor~=nil then
                imagecolor(jaf.bar2IMG[id][n],v.color[1],v.color[2],v.color[3])
           end
         end
     end
end

function jaf.bar2_draw(id,n)
     if jaf.hudIMG_list.bar2[n]~=nil then
        jaf.bar2_remove(id,n)
        jaf.hudIMG_list.bar2[n].state[id]=true
         v=jaf.hudIMG_list.bar2[n]
         local awal=0
         local akhir=0
         if v.var.id~=nil and v.varmax.id~=nil then
           if v.var.player then
              awal=v.var.id[id]
           else
              awal=v.var.id
           end
           if v.varmax.player then
              akhir=v.varmax.id[id]
           else
              akhir=v.varmax.id
           end
         end
         jaf.bar2IMG[id][n]=image(v.img,v.pos[1]+((awal/akhir*(v.scale[1]*4))/2),v.pos[2],2,id)
         imagescale(jaf.bar2IMG[id][n],(awal/akhir*v.scale[1]),v.scale[2])
         imagecolor(jaf.bar2IMG[id][n],v.color[1],v.color[2],v.color[3])
     end
end

function jaf.bar2_remove(id,n)
    jaf.hudIMG_list.bar2[n].state[id]=false
    if jaf.bar2IMG[id][n]~=nil then
       freeimage(jaf.bar2IMG[id][n])
       jaf.bar2IMG[id][n]=nil
    end
end

function jaf.checknowater(id)
x,y=player(id,"tilex"),player(id,"tiley")
          for i=1,#jaf.nowater_area do
                    v=jaf.nowater_area[i]
                    if x>=v[1][1] and x<=v[2][1] and y>=v[1][2] and y<=v[2][2] then
                             return true
                    end
          end
          return false
end

function jaf.item_equipmenu(id,n)
              local v=jaf.list_items[n]
              local eqplang=jaf.sv_lang(jaf.lang[id],39)
              if tonumber(v.memberstat) and jaf.JAFmember[id]<tonumber(v.memberstat) and jaf.admin[id]<1 then
                 eqplang="("..jaf.sv_lang(jaf.lang[id],113)..")"
              end
              local drplang=jaf.sv_lang(jaf.lang[id],40)
              local selllang=jaf.sv_lang(jaf.lang[id],41)
              local rmvlang=jaf.sv_lang(jaf.lang[id],42)
              local alllang=jaf.sv_lang(jaf.lang[id],43)
              local pli=jaf.sv_lang(jaf.lang[id],130)
              local sbi="("..selllang..")"
              local sbiall="("..selllang.."|"..alllang..")"
              if v.attbt and v.attbt[1]==true and jaf.itemSEL[id][v.attbt.no]==jaf.btnitem[id] then
                      eqplang=jaf.sv_lang(jaf.lang[id],95)
                      drplang=""
                      selllang=""
                      rmvlang=""
                      alllang=""
                      pli=""
                      sbi=""
                      sbiall=""
              end
              if v.sellback and tonumber(v.sellback) then
                      sbi=selllang.."|$"..v.sellback
                      sbiall=selllang.."|"..alllang
              end
              if jaf.btnitem[id]==5 and jaf.jfnIMG[id]~=nil then
                      eqplang=jaf.sv_lang(jaf.lang[id],95)
              end
              if v.usgn~=nil and v.usgn and jaf.usgn[id]<=0 then
                      eqplang="(Login User Only)"
              end
              if v.func and v.img~=false then
                      menu(id,"Item options | "..v.name..","..eqplang..","..drplang..","..sbi..","..rmvlang.."|1 item,"..rmvlang.."|"..alllang..","..sbiall..","..pli)
              elseif v.func and v.img==false then
                      menu(id,"Item options | "..v.name..","..eqplang..",("..drplang.."),"..sbi..","..rmvlang.."|1 item,"..rmvlang.."|"..alllang..","..sbiall.."")
              elseif v.img~=false then
                      menu(id,"Item options | "..v.name..",("..eqplang.."),"..drplang..","..sbi..","..rmvlang.."|1 item,"..rmvlang.."|"..alllang..","..sbiall.."")
              else
                      menu(id,"Item options | "..v.name..",("..eqplang.."),("..drplang.."),"..sbi..","..rmvlang.."|1 item,"..rmvlang.."|"..alllang..","..sbiall.."")
              end

end


function jaf.inventorymenu(id,page)
local page=page or 1
local pages=math.ceil((jaf.inventory_max_default+jaf.invplus[id])/7)
local m='Inventory | Page '..page..'@b'
jaf.inventory_refresh(id)
    for i=7*page-6, 7*page do
         local v1=jaf.items[id][i]
         local v2=jaf.aitems[id][i]
         maxi=jaf.inventory_max_default+jaf.invplus[id]
         moinfo=""
         if v1~=nil and v2 and v1>0 and tonumber(jaf.list_items[v1].memberstat) and tonumber(jaf.list_items[v1].memberstat)>0 then
            moinfo="[M]-"
         end
         if jaf.itemLVL[id][i]~=nil and jaf.itemLVL[id][i]>=1 then
            moinfo="[Lvl."..jaf.itemLVL[id][i].."] "..moinfo
         end
         if v1 and v2 and v1>0 and v2>0 and i<=maxi then
                if jaf.list_items[v1].timer~=nil and jaf.list_items[v1].timer then
                     if (math.floor(v2)-v2)~=0 then
                           v2="Permanent"
                     elseif v2>(3600*24) then
                           local gthtr=math.floor(math.floor(((v2/(3600*24))-math.floor(v2/(3600*24)))*(3600*24)))
                           local gtmtr=math.floor(math.floor(((gthtr/3600)-math.floor(gthtr/3600))*3600)/60)
                           local waktudy="day"
                           if math.floor(v2/(3600*24))>1 then
                              waktudy="days"
                           end
                           v2=math.floor(v2/(3600*24)).." "..waktudy.." "..math.floor(gthtr/3600).." hr "..gtmtr.." min"
                     elseif v2>3600 then
                           local gtmtr=math.floor(math.floor(((v2/3600)-math.floor(v2/3600))*3600)/60)
                           v2=math.floor(v2/3600).." hr "..gtmtr.." min"
                     elseif v2>60 then
                           local gtstr=math.floor(((v2/60)-math.floor(v2/60))*60)
                           v2=math.floor(v2/60).." min "..gtstr.." sec"
                     else
                          v2=v2.." s"
                     end
                else
                    if v2>1 then
                        v2=v2..' Units'
                    else
                        v2=v2..' Unit'
                    end
                end
                m=m..','..moinfo..''..jaf.list_items[v1].name..'|'..v2
          elseif v1 and v2 and v1>0 and v2<=0 then
                m=m..',('..moinfo..''..jaf.list_items[v1].name..'|Empty)'
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],101)..'|X)'
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',(Total items|'..jaf.checkuserdata(jaf.usgn[id]).itemtotal..'/'..(jaf.inventory_max_default+jaf.invplus[id])..')' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id,m)
end

function jaf.give_item(id,a,b,c,d)
    a=tonumber(a)
    if player(id,"exists") and a~=nil and jaf.list_items[a]~=nil then
       local am=0
       local sam=false
       for i=1,#jaf.items[id] do
           if jaf.items[id][i]>0 then
              am=am+1
           end
           if jaf.items[id][i]==a then
              sam=true
           end
           if jaf.items[id][i]>0 and jaf.list_items[jaf.items[id][i]].timer~=nil and jaf.list_items[jaf.items[id][i]].timer then
              jaf.timeritemc[id][jaf.items[id][i]]=i
           end
       end
       if sam==false and am>=(jaf.inventory_max_default+jaf.invplus[id]) then
          local ni=jaf.table_check(jaf.mylossitem[id],nil).tn
          local nia=jaf.table_check(jaf.mylossitem[id],a).tn
          if c~=nil and tonumber(c) then
             jaf.mylossitem[id][ni]=a
             jaf.mylossitema[id][ni]=c
          elseif b~=nil and tonumber(b) then
             if nia>0 and jaf.mylossitem[id][nia]~=nil and jaf.mylossitem[id][nia]==a and (c==nil or d==nil) then
                jaf.mylossitem[id][nia]=a
                jaf.mylossitema[id][nia]=jaf.mylossitema[id][nia]+b
             else
                jaf.mylossitem[id][ni]=a
                jaf.mylossitema[id][ni]=b
             end
          end
          if d~=nil and tonumber(d) then
             jaf.mylossiteml[id][ni]=d
          end
          if jaf.mylossitemm[id]==nil then
             msg2(id,kuning.."[System] "..putih..""..jaf.sv_lang(jaf.lang[id],186,hijau2..jaf.list_items[a].name..putih))
          end
          if jaf.mylossitemm[id]==nil then
              jaf.freemenu2(jaf.mylossitemm,id)
              jaf.mylossitemm[id]=jaf.menu2(id,12,38,39)
          end
       end
    end
    if player(id,"exists") and a~=nil and b~=nil then
         for g=1,(jaf.inventory_max_default+jaf.invplus[id]) do
            if jaf.items[id][g]~=nil and jaf.items[id][g] and jaf.items[id][g]==a then
               if c~=nil and tonumber(c) then
                  jaf.aitems[id][g]=c
               elseif jaf.list_items[jaf.items[id][g]].timer==nil or jaf.list_items[jaf.items[id][g]].timer==false then
                   jaf.aitems[id][g]=jaf.aitems[id][g]+b
               else
                   jaf.aitems[id][g]=jaf.aitems[id][g]+(b*3600)
               end
               if d~=nil then jaf.itemLVL[id][g]=d end
               jaf.showitemidc[id][jaf.items[id][g]]={jaf.aitems[id][g],g}
               return g
            end
            if jaf.items[id][g]==nil or jaf.items[id][g]<1 then
               jaf.items[id][g]=a
               if c~=nil and tonumber(c) then
                  jaf.aitems[id][g]=c
               elseif jaf.list_items[jaf.items[id][g]].timer==nil or jaf.list_items[jaf.items[id][g]].timer==false then
                  jaf.aitems[id][g]=b
               else
                  jaf.aitems[id][g]=(b*3600)
               end
               if jaf.list_items[jaf.items[id][g]].timer~=nil and jaf.list_items[jaf.items[id][g]].timer then
                  jaf.timeritemc[id][jaf.items[id][g]]=g
               end
               if d~=nil then jaf.itemLVL[id][g]=d end
               jaf.showitemidc[id][jaf.items[id][g]]={jaf.aitems[id][g],g}
               return g
            end
            if jaf.items[id][g]~=nil and jaf.items[id][g] and jaf.items[id][g]==a then
               if c~=nil and tonumber(c) then
                  jaf.aitems[id][g]=c
               elseif jaf.list_items[jaf.items[id][g]].timer==nil or jaf.list_items[jaf.items[id][g]].timer==false then
                   jaf.aitems[id][g]=jaf.aitems[id][g]+b
               else
                   jaf.aitems[id][g]=jaf.aitems[id][g]+(b*3600)
               end
               if d~=nil then jaf.itemLVL[id][g]=d end
               jaf.showitemidc[id][jaf.items[id][g]]={jaf.aitems[id][g],g}
              return g
            end
         end
   end
   return 0
end

function jaf.clearitem(id,a)
              jaf.showitemidc[id][jaf.items[id][a]]=nil
              jaf.aitems[id][a]=0
              jaf.items[id][a]=0
end

function jaf.inventory_refresh(id)
local z={}
local b={}
local l={}
         jaf.timeritemc[id]={}
         jaf.showitemidc[id]={}
         for g=1,(jaf.inventory_max_default+jaf.invplus[id]) do
           if jaf.aitems[id][g] and jaf.aitems[id][g]<1 then
              jaf.showitemidc[id][jaf.items[id][g]]=nil
              jaf.items[id][g]=0
              jaf.aitems[id][g]=0
              jaf.itemLVL[id][g]=nil
           end
           if jaf.aitems[id][g] and jaf.aitems[id][g]>0 then
              z[g]=jaf.items[id][g]
              b[g]=jaf.aitems[id][g]
              l[g]=jaf.itemLVL[id][g]
              jaf.items[id][g]=0
              jaf.aitems[id][g]=0
              jaf.itemLVL[id][g]=nil
              if jaf.list_items[z[g]].timer~=nil and jaf.list_items[z[g]].timer then
                  jaf.timeritemc[id][z[g]]=g
                  jaf.give_item(id,z[g],0,b[g],l[g])
              else
                  jaf.give_item(id,z[g],b[g],nil,l[g])
              end
              jaf.showitemidc[id][z[g]]={b[g],g}
          end
     end
end

function jaf.public_menu(id)
         if jaf.admin[id]>0 then
            menu(id,""..jaf.sv_lang(jaf.lang[id],9)..",Settings|Client,Clan|Client,Admin menu|Staff,Job|Client,House|Client,Teleport|10 SCs,,(Time|"..os.date("%I:%M %p").."),(SCs|"..jaf.crystal[id]..")")
         else
             menu(id,""..jaf.sv_lang(jaf.lang[id],9)..",Settings|Client,Clan|Client,(Admin menu|Staff),Job|Client,House|Client,Teleport|10 SCs,,(Time|"..os.date("%I:%M %p").."),(SCs|"..jaf.crystal[id]..")")
         end
end

function jaf.admin_menu(id)
         shr,sm=jaf.server_hour,math.floor(jaf.server_sec/60)
         mstc,ach=jaf.stafftimetocheck,math.floor(jaf.adminonlinetime[id]/3600)
         if jaf.admin[id]>0 and jaf.godmode[id]>0 then
            va=jaf.sv_lang(jaf.lang[id],78)
         else
            va=jaf.sv_lang(jaf.lang[id],79)
         end
         menu(id,"Admin menu,God mode|"..va..",(Activation|"..ach.."/"..math.floor(jaf.maxstafftimeactive/3600).." hours),(Check in| "..(mstc-shr-1).." hours "..(60-sm).." min),(Last check|"..string.gsub(jaf.server_lastcheckadmin,"_"," ")..")")
end

function jaf.removejfnIMG(id)
              if jaf.jfnIMG[id]~=nil then
                         freeimage(jaf.jfnIMG[id])
                         jaf.jfnIMG[id]=nil
              end
end

function jaf.phone_menu(id)
            local dir=jaf.loclua.."phone/"..jaf.phonenum[id]..".txt"
            local file = io.open(dir:format(jaf.phonenum[id],"r"))
            if file then
                    jaf.phone_load(id,jaf.phonenum[id])
            else
                    jaf.phonenum[id]=0
            end
                if jaf.phonenum[id]~=0 then
                         menu(id,"Phone,(Phone number|"..jaf.phonenum[id].."),(Phone version|JAF-a03),(Password|"..jaf.phonepass[id].."),SMS,Internet|"..(jaf.fastconnect+jaf.connectplus[id]).."Kb/second,Remove number,Remove SMS|All")
                else
                         menu(id,"Phone,Phone number info,(Phone version|JAF-a03)")
                end
end

function jaf.phone_save(id,pn,csms)
     if pn and pn~=0 and jaf.usgn[id]>0 then
            local file=io.output(io.open(jaf.loclua.."phone/"..pn..".txt","w+"))
            local data=""
            data=data..""..jaf.usgn[id].." "
            data=data..""..jaf.phonepass[id].." "
            data=data.."\n"
            if csms then
            for i=1,csms do
                   if jaf.phonesms[id][i] then
                      data=data..""..jaf.phonesms[id][i].."\n"
                   end
            end
            end
            file:write(data)
	    file:close()
     end
end

function jaf.phone_load(id,pn)
     if pn and pn~=0 then
            local dir=jaf.loclua.."phone/"..pn..".txt"
            local file = io.open(dir:format(pn,"r"))
                 if file then
                      line=file:read()
                      data=totable(line)
                      dget=tonumber(data[1])
                      dget2=tostring(data[2])
                      if dget~=nil then jaf.usgn[id]=dget end
                      if dget2~=nil then jaf.phonepass[id]=dget2 end
                      local c_sms=0
                      for line in file:lines() do
                            c_sms=c_sms+1
                            if line~=nil then jaf.phonesms[id][c_sms]=line end
                      end
                      file:close()
                      return {sms_count=c_sms}
                  else
                      jaf.phonenum[id]=0
                  end
     end
end

function jaf.phonenum_load(id,pn,pw)
     if jaf.usgn[id]<=0 then
            local pw=string.lower(pw)
            local pn=tonumber(pn)
            local dir=jaf.loclua.."phone/"..pn..".txt"
            local file = io.open(dir:format(pn,"r"))
            if file then
                   line=file:read()
                   data=totable(line)
                   local pass=tostring(data[2])
                   local getusgn=tonumber(data[1])
                   if pass==pw then
                          jaf.usgn[id]=getusgn
                          for _,i in pairs(player(0,"table")) do
                               if i~=id and jaf.usgn[i]>0 and jaf.usgn[i]==jaf.usgn[id] then
                               jaf.usgn[id]=0
                               end
                          end
                          jaf.load(id,jaf.usgn[id])
                          jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],52))
                   else
                          jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],51))
                   end
                   file:close()
            else
                   jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],49))
            end
      else
            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],50))
      end
end

function jaf.send_sms(id,pn,sms)
            local dir=jaf.loclua.."phone/"..pn..".txt"
            local file = io.open(dir,"a")
            if file then
                    local text=""
                    text=text.."["..jaf.phonenum[id].."] ["..jaf.usgn[id].."] "..sms.."\r\n"
                    file:write(text)
                    file:close()
            end
            jaf.phone_save(id,jaf.phonenum[id],jaf.phone_load(id,jaf.phonenum[id]).sms_count)

end

function jaf.smsmenu(id,page)
jaf.phonesms_reset(id)
local page=page or 1
local pages=math.ceil(jaf.phone_load(id,jaf.phonenum[id]).sms_count/7)
local m='SMS | Page '..page
    for i=7*page-6, 7*page do
         if jaf.phonesms[id][i] then
                local ttbl=totable(jaf.phonesms[id][i])
                local v1=tostring(ttbl[1])
                m=m..',Contact|'..v1
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id, m)
end

function jaf.phonesms_count(pn)
         pn=tonumber(pn)
         if pn and pn~=0 then
            local dir=jaf.loclua.."phone/"..pn..".txt"
            local file = io.open(dir:format(pn,"r"))
            if file then
            local line=file:read()
            local check_sms=0
            for line in file:lines() do
                    if line~=nil then
                                check_sms=check_sms+1
                    end
            end
            file:close()
            return check_sms
            end
         end
end

function jaf.phonesms_reset(id)
              for i=1,jaf.max_sms do
                       jaf.phonesms[id][i]=nil
              end
end

function jaf.removeitemIMG(id,n)
              if n and jaf.itemIMG[id][n]~=nil then
                         freeimage(jaf.itemIMG[id][n])
                         jaf.itemIMG[id][n]=nil
                         jaf.itemSEL[id][n]=0
              end
              if n and n==4 then
                  jaf.pet_target[id]=0
                  jaf.pet_stop[id]=0
              end
end

function jaf.inventorycheckcount(id)
         local invcc=0
         for g=1,(jaf.inventory_max_default+jaf.invplus[id]) do
            if jaf.items[id][g]>0 and jaf.aitems[id][g]>0 then
                 invcc=invcc+1 
            end
         end
         return invcc
end


function jaf.afk_remove(id)
            if jaf.AFKIMG[id]~=nil then
                     freeimage(jaf.AFKIMG[id])
                     jaf.AFKIMG[id]=nil
            end
end

function jaf.checkposbtn(id,x,y)
           if x and y then
              for i,i2 in pairs(jaf.hudIMG_list.btn) do
                   local v=jaf.hudIMG_list.btn[i]
                   local scl=1
                   if v.scale~=nil then scl=v.scale end
                   if x>=(v.pos[1]-(v.img[5]*scl/2)) and x<=(v.pos[1]+(v.img[5]*scl/2)) and y>=(v.pos[2]-(v.img[6]*scl/2)) and y<=(v.pos[2]+(v.img[6]*scl/2)) then
                                return {true,i}
                   end
              end
           end
           return {false,0}
end

function jaf.pet_follow(id)
    if jaf.itemIMG[id][4]~=nil and jaf.itemSEL[id][4]>0 and jaf.pet_stop[id]<1 then
           local pxs=jaf.petx[id]
           local pys=jaf.pety[id]
           local movex=math.random(-64,64)
           local movey=math.random(-64,64)
           jaf.petx[id]=player(id,"x")+movex
           jaf.pety[id]=player(id,"y")+movey
           local rot = 0
           local igt=jaf.list_items[jaf.itemSEL[id][4]]
           if jaf.list_items[jaf.itemSEL[id][4]].petrot==nil or jaf.list_items[jaf.itemSEL[id][4]].petrot==true then 
               rot = -math.deg(math.atan2(pxs-jaf.petx[id], pys-jaf.pety[id]))
           end
           if (igt.petrot==false and igt.petmove~=nil and igt.petmove) then
              if igt.petmove==1 then
                 jaf.petx[id]=player(id,"x")+48+math.random(-5,5)
                 jaf.pety[id]=player(id,"y")+math.random(-10,10)
                 if jaf.radiuscheck(player(id,"x"),player(id,"y"),pxs,pys,48+5,32+10)==false then
                    if pxs<player(id,"x") then
                       rot=45
                    elseif pxs>player(id,"x") then
                       rot=-45
                    end
                 end
                 tween_move(jaf.itemIMG[id][4],1000,jaf.petx[id],jaf.pety[id],rot)
              end
           else
              tween_move(jaf.itemIMG[id][4],1000,jaf.petx[id],jaf.pety[id],rot)
           end
     end
end

function jaf.pet_teleport(id)
         if jaf.itemIMG[id][4]~=nil and jaf.itemSEL[id][4]>0 then
                 n=jaf.itemSEL[id][4]
                 local movex=math.random(-50,50)
                 local movey=math.random(-50,50)
                 local dist = math.sqrt((player(id,'x')-jaf.petx[id])^2 + (player(id,'y')-jaf.pety[id])^2)
                 if dist>=500 then
                      jaf.petx[id]=player(id,"x")+movex
                      jaf.pety[id]=player(id,"y")+movey
                      imagepos(jaf.itemIMG[id][4],player(id,'x'),player(id,'y'),0)
                 else
                      jaf.pet_follow(id)
                 end
                 if jaf.pet_target[id]>0 then
                        npt=jaf.pet_target[id]
                        local ix,iy,px,py=player(id,"x"),player(id,"y"),player(npt,"x"),player(npt,"y")
                        if not player(npt,"exists") or player(npt,"health")<1 then
                               jaf.pet_target[id]=0
                               jaf.pet_stop[id]=0
                        elseif not jaf.radiuscheck(ix,iy,px,py,(7*32+16),(7*32+16)) or player(id,"health")<1 then
                               jaf.pet_target[id]=0
                               jaf.pet_stop[id]=0
                        end
                 end
                 if jaf.pet_montarget[id]>0 then
                    pmtg=jaf.pet_montarget[id]
                    if jaf.monsterHP[pmtg]<1 then
                       jaf.pet_montarget[id]=0
                       jaf.pet_stop[id]=0
                    elseif jaf.radiuscheck(player(id,"x"),player(id,"y"),jaf.monsterx[pmtg],jaf.monstery[pmtg],(8*32+16),(8*32+16))==false then
                       jaf.pet_montarget[id]=0
                       jaf.pet_stop[id]=0
                    end
                 end
                 local rpets=8
                 local rpetsg=5
                 if jaf.list_items[n].petskillrandom~=nil then
                    rpets=jaf.list_items[n].petskillrandom[1]
                    rpetsg=jaf.list_items[n].petskillrandom[2]
                 end
                 if jaf.pet_target[id]>0 and jaf.pet_target[id]~=id and jaf.list_items[n].petattack and math.random(1,8)==6 then
                        jaf.list_items[n].petattack(id)
                 elseif jaf.list_items[n].petskill~=nil and math.random(1,rpets)==rpetsg then
                        jaf.list_items[n].petskill(id)
                 end
         end
end

function jaf.item_buymenucreate(id,iid) 
    -- iid={{itemid,priceShell,PriceSCs,PriceDiamondclan,itemreq}}
    -- itemreq = {{item,count}}
    for i=1,jaf.btnbuyc[id] do
             jaf.btnbuy[id][i]=nil
    end
    jaf.btnbuy_reqitem[id]={}
             if iid then
                  jaf.btnbuyc[id]=#iid
                  for i=1,jaf.btnbuyc[id] do
                       if iid[i][1] then
                           vks=0
                           vksc=0
                           vkdc=0
                           if tonumber(iid[i][2]) then
                              vks=tonumber(iid[i][2])
                           end
                           if tonumber(iid[i][3]) then
                              vksc=tonumber(iid[i][3])
                           end
                           if tonumber(iid[i][4]) then
                              vkdc=tonumber(iid[i][4])
                           end
                           if iid[i][5]~=nil and iid[i][5] and type(iid[i][5])=="table" then
                                 jaf.btnbuy_reqitem[id][i]=iid[i][5]
                           end
                           jaf.btnbuy[id][i]=iid[i][1].." "..vks.." "..vksc.." "..vkdc
                       end
                  end
                  jaf.item_buymenu(id,1)
             end
end

function jaf.item_buymenu(id,page)
if jaf.btnbuyc[id]>0 then
local page=page or 1
local pages=math.ceil(jaf.btnbuyc[id]/7)
local m='Buy item | Page '..page..'@b'
    for i=7*page-6, 7*page do
         if jaf.btnbuy[id][i] then
                local itemid=tonumber(totable(jaf.btnbuy[id][i])[1])
                local price,pricesc,pricedc=0,0,0
                local ir=jaf.btnbuy_reqitem[id][i]
                price=tonumber(totable(jaf.btnbuy[id][i])[2])
                pricesc=tonumber(totable(jaf.btnbuy[id][i])[3])
                pricedc=tonumber(totable(jaf.btnbuy[id][i])[4])
                itemname=jaf.list_items[itemid].name
                if jaf.list_items[itemid].timer~=nil and jaf.list_items[itemid].timer==true then
                     itemname=itemname.." - for 1 hour"
                end
                if #itemname>36 then
                      itemname=string.sub(itemname,1,36).."..."
                end
                local putp=0
                if jaf.admin[id]>=#jaf.admintag and jaf.godmode[id]>0 then
                       putp="Free"
                elseif jaf.freeitemb[id]>0 and (jaf.list_items[itemid].nf==nil or jaf.list_items[itemid].nf==false) then
                       putp="Free"
                elseif ir~=nil and ir and type(ir)=="table" then
                       putp=""
                       for iir=1,#ir do
                           if ir[iir]~=nil then
                              putp=putp..ir[iir][2].." "..jaf.list_items[ir[iir][1]].name.."(s) "
                           end
                       end
                elseif pricedc<1 and pricesc<1 and price>=1000000 then
                       putp=(price/1000000).."M Shell"
                elseif pricedc<1 and pricesc>0 and pricesc>=1000000 then
                       putp=(pricesc/1000000).."M SC's"
                elseif pricedc<1 and pricesc<1 then
                       putp=price.." Shell"
                elseif pricedc<1 and pricesc>0 then
                       putp=pricesc.." SC's"
                elseif pricedc>0 and pricedc>=1000000 then
                       putp=(pricedc/1000000).."M Diamond's"
                elseif pricedc>0 then
                       putp=pricedc.." Diamond's"
                end
                if tonumber(jaf.list_items[itemid].memberstat) and jaf.JAFmember[id]<jaf.list_items[itemid].memberstat and jaf.admin[id]<1 then
                   m=m..',('..itemname..' - [Member only]|$'..putp..')'
                else
                   m=m..','..itemname..'|$'..putp
                end
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id, m)
end
end

function jaf.buylicense(id,price,lic,bmsg,bmsg2)
         if price>0 and id>0 then
                    tlic=jaf.userlicense[id]
                    if jaf.shell[id]>=price and tlic<lic then
                                jaf.userlicense[id]=lic
                    elseif jaf.shell[id]>=price and tlic==lic then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],76)..""..jaf.lictag[tlic][2].." rank!")
                    elseif jaf.shell[id]>=price and tlic>lic then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],77))
                    elseif jaf.shell[id]<price then
                                jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],12))
                    end
                    if bmsg2~=nil then
                                jaf.svj_msg2(id,bmsg2)
                    end
         elseif price<1 and id>0 then
                    tlic=jaf.userlicense[id]
                    if tlic<lic then
                                jaf.userlicense[id]=lic
                    end
         end
         if bmsg~=nil then
                    jaf.svj_msg(bmsg)
         end
end

function jaf.settingsmenu(id)
         local slt=jaf.sv_lang(jaf.lang[id],78)
         local ifs=jaf.sv_lang(jaf.lang[id],78)
         local als=jaf.sv_lang(jaf.lang[id],78)
         local twb=jaf.sv_lang(jaf.lang[id],78)
         local hpp=jaf.sv_lang(jaf.lang[id],147)
         local hppk=jaf.sv_lang(jaf.lang[id],148)
         local cs=jaf.sv_lang(jaf.lang[id],78)
         local vipig="(Go to VIP Island)"
         if jaf.userlicense[id]>=1 then vipig="Go to VIP Island" end
         if jaf.talkwithbot[id]==false then twb=jaf.sv_lang(jaf.lang[id],79) end
         if jaf.userlictag[id]<1 then slt=jaf.sv_lang(jaf.lang[id],79) end
         if jaf.infoplayer[id]<1 then ifs=jaf.sv_lang(jaf.lang[id],79) end
         if jaf.clansimbol[id]<1 then cs=jaf.sv_lang(jaf.lang[id],79) end
         if jaf.antilag[id]<1 then als=jaf.sv_lang(jaf.lang[id],79) end
         if jaf.handwpn[id]==1 then hppk=jaf.sv_lang(jaf.lang[id],149) end
         if jaf.userlicense[id]>0 then
              menu(id,"Settings,"..jaf.sv_lang(jaf.lang[id],10)..","..jaf.lictag[jaf.userlicense[id]][2].." Tag|"..slt..",INFO Player|"..ifs..",Anti-lag|"..als..","..hpp.."|"..hppk..","..vipig..",Clan Symbol|"..cs..",,("..os.date("%d %b %Y")..")")
         else
              menu(id,"Settings,"..jaf.sv_lang(jaf.lang[id],10)..",(Say Tag|"..slt.."),INFO Player|"..ifs..",Anti-lag|"..als..","..hpp.."|"..hppk..","..vipig..",Clan Symbol|"..cs..",,("..os.date("%d %b %Y")..")")
         end
              
         
end

function jaf.checkuserdata(usgn)
             if usgn and usgn>0 then
                 local dir=jaf.loclua.."Users/%s.txt"
                 local file = io.open(dir:format(usgn, "r"))
                 if file then
                        local line=file:read()
                        local data=totable(line)
                        line=file:read()
                        local data2=totable(line)
                        local line2=file:read()
                        local line3=file:read()
                        local line4=file:read()
                        file:close()
                        local titemid={}
                        local titempl=0
                        for i=1,#data2 do
                            if data2[i]~=nil and string.find(data2[i],"lvl")==false and tonumber(data2[i])>0 then
                                titempl=titempl+1
                                titemid[i]=tonumber(data2[i])
                            elseif data2[i]~=nil and string.find(data2[i],"lvl") then
                                titempl=titempl+1
                                titemid[i]=tonumber(string.sub(1,(string.find(data2[i],"lvl")-1)))
                            elseif data2[i]~=nil and tonumber(data2[i])~=nil and tonumber(data2[i])>0 then
                                titempl=titempl+1
                                titemid[i]=tonumber(data2[i])
                            else
                                titemid[i]=0
                            end
                        end
                        return {
                                langid=tonumber(data[1]),
                                lang=jaf.lang_list[tonumber(data[1])].lang,
                                lastx=tonumber(data[2]),
                                lasty=tonumber(data[3]),
                                shell=tonumber(data[4]),
                                level=tonumber(data[5]),
                                exp=tonumber(data[6]),
                                clanid=tonumber(data[7]),
                                phonenumber=tonumber(data[8]),
                                license=tonumber(data[9]),
                                admin=jaf.admintag[jaf.CheckAdmin(usgn)][2],
                                itemtotal=titempl,
                                itemid=titemid,
                                data=data
                                }
                 else
                       return {langid=0,lang="None",lastx=0,lasty=0,shell=0,level=0,exp=0,clanid=0,phonenumber=0,license=0,admin="None",itemtotal=0,itemid=0,data=false}
                 end
                 else
                       return {langid=0,lang="None",lastx=0,lasty=0,shell=0,level=0,exp=0,clanid=0,phonenumber=0,license=0,admin="None",itemtotal=0,itemid=0,data=false}
             end
end

function jaf.moreinfousermenu(id,usgn)
             if usgn>0 then
                       ud=jaf.checkuserdata(usgn)
                       mxexp=(ud.level*jaf.exp_perlevel)
                       mn=jaf.clan_membersName[jaf.clan[id]][jaf.btnset[id]]
                       mexp=" ("..math.floor(ud.exp/mxexp*100).."%)"
                       ammiu=",(Shell|Secret),(License Level|Secret),(Last Tile X position|Secret),(Last Tile Y position|Secret),(Admin stats|Secret),"
                       plang=ud.langid
                       if not plang or plang<1 then
                          plang=1
                       end
                       if jaf.admin[id]>0 then
                              ammiu=",(Shell|"..ud.shell.."),(License Level|"..ud.license.."),(Last Tile X position|"..math.floor((ud.lastx/32)).."),(Last Tile Y position|"..math.floor((ud.lasty/32)).."),(Admin stats|"..ud.admin.."),"
                       end
                       menu(id,"More info - "..mn..",(Level|"..ud.level..""..mexp.."),(Phone number|"..ud.phonenumber.."),(Language|"..jaf.lang_list[plang].lang..")"..ammiu.."<<|"..jaf.sv_lang(jaf.lang[id],80))
             else
                       jaf.clanmembermenu(id,1)
             end
end

function jaf.tradebuymenu(id,pl,page)
  if player(pl,"exists") and jaf.tradestat[pl]>0 then
    local page=page or 1
    local pages=math.ceil(jaf.trademax/7)
    local m='Trade buy | Page '..page..'@b'
    jaf.trade_refresh(pl)
    for i=7*page-6, 7*page do
         if jaf.tradeitem[pl][i] and jaf.tradeitem[pl][i]~=nil then
                v=jaf.tradeitem[pl][i]
                local titem=tonumber(totable(v)[1])
                local tprice=tonumber(totable(v)[2])
                local tsprice=tprice
                local tpyby=tonumber(totable(v)[4])
                local tpyia=tonumber(totable(v)[5])
                local btpsid=tonumber(totable(v)[6])
                local tpusgn=tonumber(totable(v)[7])
                local pyinfby="Shell"
                local mo2info=""
                if jaf.list_items[titem].memberstat~=nil and jaf.list_items[titem].memberstat then
                   mo2info="[M]-"
                end
                if jaf.itemLVL[pl][btpsid]~=nil and jaf.itemLVL[pl][btpsid]>=1 then
                   mo2info="[Lvl."..jaf.itemLVL[pl][btpsid].."] "..mo2info
                end
                if tpyby>0 then pyinfby="SC's" end
                if tsprice>=1000000 then
                       tsprice=(tsprice/1000000).."M "..pyinfby
                else
                       tsprice=tsprice.." "..pyinfby
                end
                if id==pl then
                     m=m..',('..mo2info..''..jaf.list_items[titem].name..' - '..tpyia..'x ['..tpusgn..']|$'..tsprice..')'
                else
                     if tpusgn<=0 or tpusgn==jaf.usgn[id] then
                        m=m..','..mo2info..''..jaf.list_items[titem].name..' - '..tpyia..'x ['..tpusgn..']|$'..tsprice
                     else
                        m=m..',('..mo2info..''..jaf.list_items[titem].name..' - '..tpyia..'x ['..tpusgn..']|$'..tsprice..')'
                     end
                end
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',(Trade by '..player(pl,"name")..')' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id, m)
   elseif not player(pl,"exists") then
         jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
   else
         jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],86))
   end
end

function jaf.tradelistmenu(id,page)
local page=page or 1
local pages=math.ceil(32/7)
local m='Trade list | Page '..page
    for i=7*page-6, 7*page do
         if player(i,"exists") and jaf.tradestat[i]>0 then
                m=m..','..player(i,"name")
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id, m)
end

function jaf.tradeprivateplayer(id,page)
local page=page or 1
local pages=math.ceil(32/7)
local m='Trade Private | Page '..page..'@b'
    for i=7*page-6, 7*page do
          if player(i,"exists") and jaf.usgn[i]>0 then
                m=m..','..player(i,"name")..'|USGN: '..jaf.usgn[i]
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',<< '..jaf.sv_lang(jaf.lang[id],80)
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id, m)
end

function jaf.trademenu(id)
         if jaf.tradestat[id]<1 then
                menu(id,"Trade menu,"..jaf.sv_lang(jaf.lang[id],90)..","..jaf.sv_lang(jaf.lang[id],91))
         else
                menu(id,"My trade,"..jaf.sv_lang(jaf.lang[id],92)..","..jaf.sv_lang(jaf.lang[id],93)..","..jaf.sv_lang(jaf.lang[id],94)..","..jaf.sv_lang(jaf.lang[id],91))
         end
end

function jaf.tradeover(id)
         jaf.tradestat[id]=0
         jaf.tradeitem[id]={}
end


function jaf.tradeitemadd(id,page)
local page=page or 1
local pages=math.ceil((jaf.inventory_max_default+jaf.invplus[id])/7)
local m='Put item trade | Page '..page
    for i=7*page-6, 7*page do
         v1=jaf.items[id][i]
         v2=jaf.aitems[id][i]
         gtb=jaf.list_items[v1]
         maxi=(jaf.inventory_max_default+jaf.invplus[id])
         if v1 and v2 and v1>0 and v2>0 and i<=maxi and (gtb.ontrade==nil or gtb.ontrade==true) and (gtb.timer==nil or gtb.timer==false) then
                m=m..','..string.sub(jaf.list_items[v1].name,1,18)..'|'..v2
          elseif v1 and v2 and v1>0 and (gtb.ontrade==false or gtb.timer==true) then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|X)'
          elseif v1 and v2 and v1>0 and v2<=0 then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|Empty)'
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id,m)
end

function jaf.tradeputprice(id,price,iid,pyby,trdic,tusgn)
             payby="Shell"
             if pyby>0 then
                payby="SC's"
             end
             local trdia=jaf.aitems[id][jaf.btnset[id]]
             if trdia==nil or trdia==false then trdia=0 end
             menu(id,"Trade price item,+100,+1000,+5000,+50000,+100000,"..jaf.sv_lang(jaf.lang[id],177).."(+)|"..trdic.."/"..trdia..",Private Player|"..tusgn..",Done!|"..string.sub(jaf.list_items[iid].name,1,15)..","..payby.."|"..price.."/item")
end

function jaf.trade_refresh(id)
z={}
         for g=1,jaf.trademax do
           if jaf.tradeitem[id][g]~=nil then
              z[g]=jaf.tradeitem[id][g]
              jaf.tradeitem[id][g]=nil
              jaf.trade_putitem(id,z[g])
          end
     end
end

function jaf.trade_putitem(id,a)
       for i=1,jaf.trademax do
            if jaf.tradeitem[id][i]==nil then
                  jaf.tradeitem[id][i]=a
                  return 1
            end
       end
end

function jaf.trade_checkitem(id,a)
             for i=1,jaf.trademax do
                     if jaf.tradeitem[id][i] then
                            v=jaf.tradeitem[id][i]
                            if tonumber(totable(v)[1])==tonumber(a) then
                                       return true
                            end
                     end
             end
             return false
end

function jaf.radiuscheck(ix,iy,px,py,radiusx,radiusy) -- ix/iy=target,px/py=center
        if not tonumber(px) or not tonumber(py) then return false end
	if not (radiusx and radiusy) then radiusx, radiusy = 320, 240 end
	local x1, y1, x2, y2 = px-radiusx, py-radiusy, px+radiusx, py+radiusy
	if ix >= x1 and ix <= x2 and iy >= y1 and iy <= y2 then
               return true
	end
	return false
end

function jaf.enemyhealthshow(id,name,hp,dmg)
         if id>0 and name then
             parse('hudtxt2 '..id..' 6 "'..hijau..''..name..' Health: '..hp..'" 425 400 1')
             parse("hudtxtalphafade "..id.." 6 8000 0")
             if dmg then
                parse('hudtxt2 '..id..' 26 "'..merah..''..name..' Health -'..dmg..'" 425 390 1')
                parse('hudtxtalphafade '..id..' 26 2000 0.0')
                parse('hudtxtmove  '..id..' 26 2000 425 360')
             end
         end
end

function jaf.hitplayer(id,pl,wpnname,dmg) -- id=victim, pl=attacker
       if id and id>0 then
             if not wpnname then
                   wpnname="1Hit"
             end
             if not dmg then
                   dmg=0
             end
             tx=player(id,"tilex")
             ty=player(id,"tiley")
             if pl~=nil and pl and pl>0 and jaf.jobid[pl]==4 and player(pl,"weapontype")==4 and jaf.checkarea(player(pl,"tilex"),player(pl,"tiley"),337,215,340,219) then
                if id~=nil and id and id>0 then
                   jaf.health[id]=jaf.health[id]+dmg
                   jaf.exp[pl]=jaf.exp[pl]+10
                end
                return false
             end
             if (jaf.itemDEF[id])>=100 then
                dmg=0
             elseif jaf.itemDEF[id]>0 then
                dmg=(dmg-math.floor(jaf.itemDEF[id]/100*dmg))
             end
             local cekpvpgk=false
             if pl and pl>0 then
                for i=1,#jaf.safezone do
                    local v=jaf.safezone[i]
                    if jaf.checkarea(tx,ty,v[1],v[2],v[3],v[4]) then
                        return false
                    end
                end
             end
             if pl and pl>0 then
                for i=1,#jaf.pvpzone do
                    local v2=jaf.pvpzone[i]
                    if jaf.checkarea(tx,ty,v2[1],v2[2],v2[3],v2[4]) then
                        cekpvpgk=true
                        break
                    end
                end
             end
             if pl~=nil and pl and pl>0 and cekpvpgk==false then
                if id~=pl then
                   return false
                end
             end
             if jaf.admin[id]>0 and jaf.godmode[id]>0 then
                     return false
             elseif pl and pl>0 and jaf.admin[pl]>0 and jaf.godmode[pl]>0 then
                     return false
             elseif dmg>=(player(id,"health")+jaf.health[id]) then 
                     if pl~=nil and pl>0 and player(pl,"exists") then
                        parse("customkill "..pl.." \""..wpnname.."\" "..id)
                     else
                        parse("customkill 0 \""..wpnname.."\" "..id)
                     end
                     parse('hudtxt2 '..id..' 23 "'..merah..'-'..dmg..'" 425 230 1')
                     parse('hudtxtalphafade '..id..' 23 2000 0.0')
                     parse('hudtxtmove  '..id..' 23 2000 425 190')
             elseif dmg<(player(id,"health")+jaf.health[id]) then
                     jaf.health[id]=jaf.health[id]-dmg
                     parse('hudtxt2 '..id..' 23 "'..merah..'-'..dmg..'" 425 230 1')
                     parse('hudtxtalphafade '..id..' 23 2000 0.0')
                     parse('hudtxtmove  '..id..' 23 2000 425 190')
             end
             return true
        end
        return false
end

function jaf.checkitem(id,niid)
         if tonumber(niid) and jaf.list_items[niid]~=nil then
            if jaf.showitemidc[id][niid]~=nil and jaf.showitemidc[id][niid][1]>0 then
               return {stat=true,amount=jaf.showitemidc[id][niid][1],id=jaf.showitemidc[id][niid][2]}
            end
         end
         return {stat=false,amount=0,id=0}
end

function jaf.removemyinfo(id)
         if jaf.myinfoIMG[id]~=nil then
              parse('hudtxt2 '..id..' 7 "" 0 0')
              parse('hudtxt2 '..id..' 8 "" 0 0')
              parse('hudtxt2 '..id..' 9 "" 0 0')
              parse('hudtxt2 '..id..' 10 "" 0 0')
              parse('hudtxt2 '..id..' 11 "" 0 0')
              parse('hudtxt2 '..id..' 12 "" 0 0')
              parse('hudtxt2 '..id..' 13 "" 0 0')
              parse('hudtxt2 '..id..' 14 "" 0 0')
              parse('hudtxt2 '..id..' 16 "" 0 0')
              parse('hudtxt2 '..id..' 19 "" 0 0')
              parse('hudtxt2 '..id..' 20 "" 0 0')
              parse('hudtxt2 '..id..' 21 "" 0 0')
              parse('hudtxt2 '..id..' 22 "" 0 0')
              parse('hudtxt2 '..id..' 23 "" 0 0')
              parse('hudtxt2 '..id..' 24 "" 0 0')
              freeimage(jaf.myinfoIMG[id])
              jaf.myinfoIMG[id]=nil
         end
end

function jaf.showmyinfo(id,pl)
         if not pl then pl=id end
         local plinfoc="No Clan"
         local plinfou="Not LOGIN"
         local plinfop="No Phone"
         local plinfosc=""
         local plinfodmg=0
         local plinfohp=0
         local plinfolvl=0
         local plinfospeed=0
         local plinfoclass="No Class"
         if pl>0 and jaf.usgn[pl]>0 then
            if jaf.clan[pl]>0 and jaf.load_clan(nil,jaf.clan[pl]) then
               local infocgk=jaf.clan_check(jaf.clan[pl])
               plinfoc=infocgk.name
            end
            plinfou=jaf.usgn[pl]
            plinfop=jaf.phonenum[pl]
         end
         if pl>0 and player(pl,"exists") then
            plinfodmg=jaf.itemDMG[pl]
            plinfospeed=jaf.itemSPEED[pl]
            plinfohp=jaf.itemHP[pl]
            plinfolvl=jaf.level[pl]
            plinfodef=jaf.itemDEF[pl]
            if jaf.itemSEL[pl][2]~=nil and jaf.itemSEL[pl][2]>0 and jaf.list_items[jaf.itemSEL[pl][2]].class~=nil then
               plinfoclass=jaf.list_items[jaf.itemSEL[pl][2]].name
            end
         end
         if (jaf.admin[id]>=1) then
            plinfosc="(SCs|"..jaf.crystal[pl]..")"
         end
         menu(id,"Player status|"..player(pl,"name")..",(LOGIN|"..plinfou.."),(Level|"..plinfolvl.."),(Clan|"..plinfoc.."),(Phone|"..plinfop.."),,(Damage +"..plinfodmg.." ("..plinfoclass..")),(Speed +"..plinfospeed.."),(health +"..plinfohp.."),(Defend "..plinfodef.."%)")
end

function jaf.dropitemcount(n)
         if not n then n=0 end
         local dic=n
         if type(jaf.itemdrop)=="table" and #jaf.itemdrop>=dic then
            dic=#jaf.itemdrop+1
         end
         return dic
end

function jaf.dropitem(idp,itemID,tilex,tiley,mask,lvlk)
    -- mask={imgloc,scalex,scaley,colour,alpha,rot}
    local tilex=math.floor(tilex)
    local tiley=math.floor(tiley)
    local kl=jaf.dropitemcount(0)
    if (mask==nil and not jaf.list_items[itemID].img) or not jaf.list_items[itemID]  then return 1 end
    for i=1,kl do
       if jaf.itemdrop[i]==nil or not jaf.itemdrop[i] or jaf.itemdrop[i]<1 then
         local dropimg=jaf.list_items[itemID].img[1]
         if lvlk~=nil then jaf.itemdroplvl[i]=lvlk else jaf.itemdroplvl[i]=0 end
         jaf.itemdrop[i]=itemID
         jaf.itemdropx[i]=tilex
         jaf.itemdropy[i]=tiley
         local tdp=tilex+(tiley/10^(#tostring(tilex)))
         if jaf.itemdroppos[tdp]==nil or type(jaf.itemdroppos[tdp])~="table" or (type(jaf.itemdroppos[tdp])=="table" and tonumber(#jaf.itemdroppos[tdp])==nil) then
            jaf.itemdroppos[tdp]={}
         end
         table.insert(jaf.itemdroppos[tdp],{iid=itemID,id=i})
         if mask~=nil and mask[1] and tonumber(mask[2]) and tonumber(mask[3]) then
           local rmk=0
           if tonumber(mask[6]) then rmk=mask[6] end
           jaf.itemdropIMG[i]=image(mask[1],tilex*32+16,tiley*32+16,0)
           imagepos(jaf.itemdropIMG[i],tilex*32+16,tiley*32+16,rmk)
           imagescale(jaf.itemdropIMG[i],mask[2],mask[3])
           if mask[4] and mask[4][1] then imagecolor(jaf.itemdropIMG[i],mask[4][1],mask[4][2],mask[4][3]) end
           if tonumber(mask[5]) then imagealpha(jaf.itemdropIMG[i],mask[5]) end
         else
           jaf.itemdropIMG[i]=image(dropimg,tilex*32+16,tiley*32+16,0)
           imagepos(jaf.itemdropIMG[i],tilex*32+16,tiley*32+16,math.random(0,180))
           imagescale(jaf.itemdropIMG[i],jaf.list_items[itemID].img[2],jaf.list_items[itemID].img[2])
         end
         if idp~=nil and idp and idp>0 then jaf.give_item(idp,itemID,-1) end
         return 1
       end
    end
end

function jaf.removeimgdrop(id)
             if jaf.itemdropIMG[id]~=nil then
                         freeimage(jaf.itemdropIMG[id])
                         jaf.itemdropIMG[id]=nil
             end
end

function jaf.clearitems()
  --- unactived because make a lag
end

function jaf.checkarea(x,y,x1,y1,x2,y2)
         if x>=x1 and y>=y1 and x<=x2 and y<=y2 then
                return true
         end
         return false
end

function jaf.checkblockpl(id,x,y)
         if not tonumber(id) then id=0 end
         x=math.floor(x/32)
         y=math.floor(y/32)
         for _,i in pairs(player(0,"tableliving")) do
               if player(i,"tilex")==x and player(i,"tiley")==y and i~=id then
                      return {i,true}
               end
         end
         return {0,false}
end
             

function jaf.checkblockpos(x1,y1,rot1,id,max,tileblock,objectblock,gcount)
      tilevalue,tilevalueid="walkable",true
      if tileblock~=nil and tileblock[1] and tonumber(tileblock[2]) and (tileblock[1]=="frame" or tileblock[1]=="property") then
          tilevalue,tilevalueid=tileblock[1],tonumber(tileblock[2])
      elseif tileblock~=nil and tileblock[1] and tileblock[2]~=nil then
          tilevalue,tilevalueid=tileblock[1],tileblock[2]
      elseif tileblock~=nil then
          tilevalue=tileblock
      end
      if gcount==nil or not tonumber(gcount) then gcount=16 end
      local x=0
      local y=0
      if not tonumber(id) then id=jaf.checkblockpl(0,x1,y1)[1] end
      if not tonumber(objectblock) then objectblock=30 end
      local rot,x,y,dist=(rot1-90)*math.pi/180,x1,y1,0
      --- x=x+16*math.cos(rot)
      --- y=y+16*math.sin(rot)
      if tonumber(max) and max>0 then
         maxs=0
         while (tile(math.floor(x/32),math.floor(y/32),tilevalue)==tilevalueid) and objectat(math.floor(x/32),math.floor(y/32),objectblock)==0 and not jaf.checkblockpl(id,x,y)[2] and jaf.checkmonsterrad(x,y)<1 and maxs<max do
               maxs=maxs+gcount
               dist=dist+gcount
               x=x+math.cos(rot)*gcount
               y=y+math.sin(rot)*gcount
         end
      else
         while (tile(math.floor(x/32),math.floor(y/32),tilevalue)==tilevalueid) and objectat(math.floor(x+32/32),math.floor(y/32),objectblock)==0 and not jaf.checkblockpl(id,x,y)[2] and jaf.checkmonsterrad(x,y)<1 do
               dist=dist+gcount
               x=x+math.cos(rot)*gcount
               y=y+math.sin(rot)*gcount
         end
      end
      return {x=(x),y=(y),lastrot=rot1,player=jaf.checkblockpl(id,x,y)[1],dis=dist,monster=jaf.checkmonsterrad(x,y),obj=objectat(math.floor(x/32),math.floor(y/32),objectblock)}
end

function jaf.removeskillIMG(id,n)
         if jaf.itemSKILLIMG[id][n]~=nil then
            freeimage(jaf.itemSKILLIMG[id][n])
            jaf.itemSKILLIMG[id][n]=nil 
         end
end

function jaf.skillitem1(id,dmg,img,speed,scale,color,max,bpnt,rotplus,namekill) -- shot skill
      --- rotplus = the value that give plus/minus rot for player rot
      if namekill==nil and jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]>0 then namekill=jaf.list_items[jaf.itemSEL[id][3]].name end
      if namekill==nil then namekill="1hit" end
      local blockposnametype="deadly"
      if bpnt~=nil and bpnt then blockposnametype=bpnt end
      local NSIA=1
      local x=0
      local y=0
      local rpk=0
      if rotplus~=nil and rotplus then rpk=rotplus end
      while jaf.itemSKILLIMG[id][NSIA]~=nil do
            NSIA=NSIA+1
      end
      if not tonumber(max) then max=0 end
      jaf.removeskillIMG(id,NSIA)
      px,py,rot=player(id,"x"),player(id,"y"),(player(id,"rot")+rpk)
      local v=false
      if jaf.admin[id]>0 and jaf.godmode[id]>0 then
         v=jaf.checkblockpos(px,py,rot,id,max,{blockposnametype,false})
      else
         if bpnt~=nil and bpnt then
            v=jaf.checkblockpos(px,py,rot,id,max,{bpnt,false})
         else
            v=jaf.checkblockpos(px,py,rot,id,max)
         end
      end
      if v~=false then
      x=v.x
      y=v.y
      dist=v.dis/1000
      tgt=0
      local monster=v.monster
      jaf.itemSKILLIMG[id][NSIA]=image(img,px,py,1,0)
      imagepos(jaf.itemSKILLIMG[id][NSIA],px,py,rot)
      imagescale(jaf.itemSKILLIMG[id][NSIA],scale,scale)
      imagecolor(jaf.itemSKILLIMG[id][NSIA],color[1],color[2],color[3])
      timedir=(dist*speed)
      tween_move(jaf.itemSKILLIMG[id][NSIA],timedir,x,y,rot)
      function jaf.itemskilltimer(a1,a2,a3,a4,a5,a6,a7,namekill)
           local id=tonumber(a1)
           local NSIA=tonumber(a2)
           local x=tonumber(a3)
           local y=tonumber(a4)
           local tgt=jaf.checkblockpl(id,x,y)[1]
           if tgt>0 then
              jaf.hitplayer(tgt,id,namekill,math.floor(10/100*dmg))
              jaf.enemyhealthshow(id,player(tgt,"name"),(player(tgt,"health")+jaf.health[tgt]),math.floor(10/100*dmg))
           end
           jaf.removeskillIMG(id,NSIA)
           if tonumber(a7)>0 then
              jaf.hitzone("xm"..a7,id,oid,0,x,y,dmg)
           else
              jaf.hitzone(iid,id,oid,0,x,y,dmg)
           end
           if a6~=nil and tonumber(a6) and tonumber(a6)>0 then
              jaf.objectdamage(tonumber(a6),"o"..dmg,id)
           end
              
      end
      local tskl2m=timerEx(timedir,jaf.itemskilltimer,1,id,NSIA,x,y,tgt,v.obj,monster,namekill)
      end
end

function jaf.skillitem2(id,dmg,img,speed,max,bomb,efek,bpnt,rotplus,posplus,sound,namekill)
 -- shot skill+effect, just like shot projectile
      ----------- Parameters details -----------
      --- id = user id
      --- max = maximum range should be reached in pixel
      --- dmg = damage to object
      --- bomb = {range,dmg}
      --- efek = {effect,color={r,g,b},range,particle}
      --- bpnt = block status .example: "wall"
      --- img = {img,{scale or {scalex,scaley},time},color,rc=rotateconstant,blend}
      --- rotplus = the value that give plus/minus rot for player rot, use table {rot} for rotating without player rot
      --- posplus = {x,y} place the skill starting wherever you want
      --- speed = time in milisecond, or by table {speedtime,timeover}

      if namekill==nil and jaf.itemSEL[id][3]~=nil and jaf.itemSEL[id][3]>0 then namekill=jaf.list_items[jaf.itemSEL[id][3]].name end
      if namekill==nil then namekill="1hit" end
      local blockposnametype="deadly"
      if bpnt~=nil and bpnt then blockposnametype=bpnt end
      local NSIA=1
      local x=0
      local y=0
      local rpk=0
      local rotmeoke=player(id,"rot")
      if rotplus~=nil and rotplus then rpk=rotplus end
      if rotplus~=nil and rotplus then
         if type(rotplus)=="table" then
            rotmeoke=rotplus[1]
         else
            rotmeoke=rotmeoke+rotplus
         end
      end
      while jaf.itemSKILLIMG[id][NSIA]~=nil do
            NSIA=NSIA+1
      end
      if not tonumber(max) then max=0 end
      jaf.removeskillIMG(id,NSIA)
      local px,py,rot=player(id,"x"),player(id,"y"),rotmeoke
      if posplus~=nil then
         px,py=posplus[1],posplus[2]
      end
      local v=false
      if jaf.admin[id]>0 and jaf.godmode[id]>0 then
         v=jaf.checkblockpos(px,py,rot,id,max,{blockposnametype,false})
      else
         if bpnt~=nil and bpnt then
            v=jaf.checkblockpos(px,py,rot,id,max,{bpnt,false})
         else
            v=jaf.checkblockpos(px,py,rot,id,max)
         end
      end
      local monsterk=v.monster
      local gtmonid=monsterk
      if v~=false then
      x=v.x
      y=v.y
      dist=v.dis/1000
      tgt=0
      jaf.itemSKILLIMG[id][NSIA]=image(img[1],px,py,1,0)
      imagepos(jaf.itemSKILLIMG[id][NSIA],px,py,rot)
      if img[2]~=nil and tonumber(img[2][2])~=nil then
         if type(img[2][1])~="table" then
            tween_scale(jaf.itemSKILLIMG[id][NSIA],img[2][2],img[2][1],img[2][1])
         elseif type(img[2][1])=="table" then
            tween_scale(jaf.itemSKILLIMG[id][NSIA],img[2][2],img[2][1][1],img[2][1][2])
         end
      elseif tonumber(img[2])~=nil then
         imagescale(jaf.itemSKILLIMG[id][NSIA],img[2],img[2])
      end
      if img[5]~=nil and tonumber(img[5])~=nil then
         imageblend(jaf.itemSKILLIMG[id][NSIA],img[5])
      end
      imagecolor(jaf.itemSKILLIMG[id][NSIA],img[3][1],img[3][2],img[3][3])
      if type(speed)=="table" then
         timedir=(dist*speed[1])+speed[2]
         if img.rc~=nil and img.rc then
            tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],img.rc)

            tween_move(jaf.itemSKILLIMG[id][NSIA],(dist*speed[1]),x,y)
         else

            tween_move(jaf.itemSKILLIMG[id][NSIA],(dist*speed[1]),x,y,rot)
         end
         if efek~=nil then
            function jaf.itemskilltimer2anew(aa1,aa2,aa3,aa4,aa5,aa6,aa7,namekill)
                local dmg=aa6
                local id=aa4
                local aa5=a9
                local a8=aa7
                local tgt=jaf.checkblockpl(id,aa1,aa2)[1]
                parse("effect \""..aa3[1].."\" "..aa1.." "..aa2.." "..aa3[3].." "..aa3[4].." "..aa3[2][1].." "..aa3[2][2].." "..aa3[2][3].."")
               if tgt>0 then
                  jaf.hitplayer(tgt,id,namekill,math.floor(10/100*dmg))
                  jaf.enemyhealthshow(id,player(tgt,"name"),(player(tgt,"health")+jaf.health[tgt]),math.floor(10/100*dmg))
               end
               if a8~=nil and tonumber(a8) and tonumber(a8)>0 then
                 jaf.objectdamage(tonumber(a8),"o"..dmg,id)
               end
               if a9~=nil and tonumber(a9)>0 then
                  jaf.hitzone("xm"..a9,id,oid,0,x,y,dmg)
               else
                  jaf.hitzone(iid,id,oid,0,x,y,dmg)
               end
            end
            local tsklm2itemanew=timerEx((dist*speed[1]),jaf.itemskilltimer2anew,1,x,y,efek,id,monsterk,dmg,v.obj,namekill)
         end
      else
         timedir=(dist*speed)
         if img.rc~=nil and img.rc then
            tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],img.rc)
            tween_move(jaf.itemSKILLIMG[id][NSIA],(dist*speed),x,y)
         else
            tween_move(jaf.itemSKILLIMG[id][NSIA],(dist*speed),x,y,rot)
         end
      end
      function jaf.itemskilltimer2(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,namekill)
           local NSIA=tonumber(a2)
           local x=tonumber(a3)
           local y=tonumber(a4)
           local efek=a6
           local bomb=a7
           local dmg=a12
           local id=tonumber(a1)
           local tgt=jaf.checkblockpl(id,x,y)[1]
           if a10~=nil then
              jaf.getsound2(x,y,a10,(12*32+16),(12*32+16))
           end
           jaf.removeskillIMG(id,NSIA)
           if type(a11)~="table" then
           if tgt>0 then
              jaf.hitplayer(tgt,id,namekill,math.floor(10/100*dmg))
              jaf.enemyhealthshow(id,player(tgt,"name"),(player(tgt,"health")+jaf.health[tgt]),math.floor(10/100*dmg))
           end
           if a9~=nil and tonumber(a9)>0 then
              jaf.hitzone("xm"..a9,id,oid,0,x,y,dmg)
           else
              jaf.hitzone(iid,id,oid,0,x,y,dmg)
           end
           end
           if efek~=nil then
              v=efek
              if type(a11)~="table" then
                parse("effect \""..v[1].."\" "..x.." "..y.." "..v[3].." "..v[4].." "..v[2][1].." "..v[2][2].." "..v[2][3].."")
              end
           end
           if bomb~=nil then
              v=bomb
              parse("explosion "..x.." "..y.." "..v[1].." "..v[2].." "..id)
           end
           if type(a11)~="table" and a8~=nil and tonumber(a8) and tonumber(a8)>0 then
              jaf.objectdamage(tonumber(a8),"o"..dmg,id)
           end
      end
      local tsklm2item=timerEx(timedir,jaf.itemskilltimer2,1,id,NSIA,x,y,tgt,efek,bomb,v.obj,monsterk,sound,speed,dmg,namekill)
      end
      return {monster=gtmonid,x=x,y=y,dmg=dmg,timedir=timedir,dist=dist}
end

function jaf.checkmonsterrad(x,y) -- checking pos x and y in monster radius
     for i,i2 in pairs(jaf.monsterid) do
         local v=jaf.listmonster[i2]
         local mx=jaf.monsterx[i]
         local my=jaf.monstery[i]
         local msx=(v.img[2]*v.scale[1])/2
         local msy=(v.img[2]*v.scale[2])/2
         if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil and jaf.radiuscheck(x,y,mx,my,msx,msy) then
                 return i
         end
     end
     return 0
end

function jaf.checkmonsterrad2(posx,posy,radx,rady) -- checking rad x and y monster pos in radius
     for i,i2 in pairs(jaf.monsterid) do
         local v=jaf.listmonster[i2]
         local mx=jaf.monsterx[i]
         local my=jaf.monstery[i]
         if jaf.monsterHP[i]>0 and jaf.monsterIMG[i]~=nil and jaf.radiuscheck(mx,my,posx,posy,radx,rady) then
                 return i
         end
     end
     return 0
end

function jaf.checkamountitem(id,n)
         return jaf.checkitem(id,n).amount
end

function jaf.removebtn2IMG(id,n)
         if jaf.btn2_IMG[id][n]~=nil then
                freeimage(jaf.btn2_IMG[id][n])
                jaf.btn2_IMG[id][n]=nil
         end
end

function jaf.checkposbtn2(id,x,y)
           if x and y then
              for i,i2 in pairs(jaf.hudIMG_list.btn2) do
                   v=jaf.hudIMG_list.btn2[i]
                   if x>=(v.pos[1]-(v.img[5]/2)) and x<=(v.pos[1]+(v.img[5]/2)) and y>=(v.pos[2]-(v.img[6]/2)) and y<=(v.pos[2]+(v.img[6]/2)) and jaf.btn2_IMG[id][i]~=nil then
                                return {true,i}
                   end
              end
           end
           return {false,0}
end

function jaf.btn2_create(id,i)
         if v and v.img then
               jaf.removebtn2IMG(id,i)
               jaf.btn2_IMG[id][i]=image(jaf.hudIMG_list.btn2[i].img[1],jaf.hudIMG_list.btn2[i].pos[1],jaf.hudIMG_list.btn2[i].pos[2],2,id)
               imagecolor(jaf.btn2_IMG[id][i],jaf.hudIMG_list.btn2[i].img[2],jaf.hudIMG_list.btn2[i].img[3],jaf.hudIMG_list.btn2[i].img[4])
         end
end

function jaf.broadcast(color,broadm)
       if jaf.broadT==0 then
             jaf.broadT=jaf.broad_time
             broad_char=tonumber(-(#broadm*10))
             broad_timem=-broad_char*30
             if broad_timem>=jaf.broad_time*1000 then broad_timem=20000 end
             for i=1,32 do
               if player(i,"exists") then
                   parse('hudtxt2 '..i..' 25 "'..color..''..broadm..'" 640 0')
                   parse('hudtxtmove '..i..' 25 '..broad_timem..' '..broad_char..' 0')
               end
             end
             print(kuning.."News have been launching!")
       else
             print(""..merah.."SERVER: Wait "..jaf.broadT.." Second for broadcast.")
        end
end


function jaf.freewalk(id)
     local rot = player(id,"rot")
     if rot < -90 then rot = rot + 360 end
     local angle = math.rad(math.abs( rot + 90 )) - math.pi
     local x = player(id,"x") + math.cos(angle) * 10
     local y = player(id,"y") + math.sin(angle) * 10
        if x > 0 and y > 0 and x < map("xsize") * 32 and y < map("ysize") * 32 then
           parse("setpos "..id.." "..x.." "..y)
        end
end

function jaf.itemcode_create(code,usgnid,shell,scs,itemid,itemaid)
         if usgnid==nil or not tonumber(usgnid) then usgnid=0 end
         if shell==nil or not tonumber(shell) then shell=0 end
         if scs==nil or not tonumber(scs) then scs=0 end
         if itemid==nil or not tonumber(itemid) then itemid=0 end
         if itemaid==nil or not tonumber(itemaid) then itemaid=1 end
         if itemid>0 and not jaf.list_items[itemid] then itemid=0 end
         if code~=nil then
            w_data=""
            local dir=jaf.loclua.."itemcode/"..code..".txt"
            file = io.output(io.open(dir,"w+"))
            w_data=w_data..""..usgnid.." "
            w_data=w_data..""..shell.." "
            w_data=w_data..""..scs.." "
            w_data=w_data..""..itemid.." "
            w_data=w_data..""..itemaid.." "
            print(hijau2.."Item code succesfully created just can used by usgn "..usgnid)
            print(hijau..">> Reward Of The Item Code("..code..") <<")
            print(biru.."* Shell: "..shell)
            print(biru.."* SCs: "..scs)
            if itemid>0 and jaf.list_items[itemid]~=nil then
                print(biru.."* Item: "..jaf.list_items[itemid].name)
            else
                print(biru.."* Item: None")
            end
            print(biru.."* Item Amount: "..itemaid)
            file:write(w_data)
            file:close()
         else
            print(merah.."ERROR: Please put the code!")
         end
end

function jaf.itemcode_takecode(id,code)
         if id>0 and code~=nil then
            local dir=jaf.loclua.."itemcode/"..code..".txt"
            local file = io.open(dir:format(code,"r"))
            if file then
               local line=file:read()
               local data=totable(line)
               local usgnid=tonumber(data[1])
               local shell=tonumber(data[2])
               local scs=tonumber(data[3])
               local itemid=tonumber(data[4])
               local itemaid=tonumber(data[5])
               
               jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],119))
               if usgnid>0 and usgnid~=jaf.usgn[id] then
                  jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],116))
                  file:close()
                  return 1
               end
               jaf.give_shell(id,shell)
               jaf.crystal[id]=jaf.crystal[id]+scs
               if itemid>0 then jaf.give_item(id,itemid,itemaid) end
               if shell>=0 and scs>=0 and itemid>0 then
                  jaf.svj_msg2(id,"[Server] "..hijau.."You got "..shell.." Shell,"..scs.." SCs and "..jaf.list_items[itemid].name.." from Item code!")
               elseif shell>0 and scs>0 then
                  jaf.svj_msg2(id,"[Server] "..hijau.."You got "..shell.." Shell and "..scs.." SCs from Item code!")
               elseif shell>0 then
                  jaf.svj_msg2(id,"[Server] "..hijau.."You got "..shell.." Shell from Item code!")
               elseif scs>0 then
                  jaf.svj_msg2(id,"[Server] "..hijau.."You got "..scs.." SCs from Item code!")
               elseif itemid>0 then
                  jaf.svj_msg2(id,"[Server] "..hijau.."You got "..jaf.list_items[itemid].name.." from Item code!")
               end
               file:close()
               os.remove(dir)
               return true
            else
               jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],117))
            end
        elseif id>0 then
            jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],118))
        end
        return false
end

function jaf.removestat2IMG(id,n)
         if jaf.stat2_IMG[id][n]~=nil then
                freeimage(jaf.stat2_IMG[id][n])
                jaf.stat2_IMG[id][n]=nil
         end
end

function jaf.status2_create(id,n)
          v=jaf.hudIMG_list.status2[n]
          if v and v.img then
              jaf.removestat2IMG(id,n)
              jaf.stat2_IMG[id][n]=image(v.img,v.pos[1],v.pos[2],2,id)
              imagescale(jaf.stat2_IMG[id][n],v.scale,v.scale)
          end
end

function jaf.menu2(id,bg,...) -- bg = stat2 id, (...) = btn2-id,...btn2-n
         if tonumber(bg) and {...} then
               if bg>0 then jaf.status2_create(id,bg) end
               for i=1,#{...} do
                   if tonumber(unpack({...},i,i)) then
                      jaf.btn2_create(id,unpack({...},i,i))
                   end
               end
               return {true,pl=id,#{...},bg,unpack({...})}
         end
         return {false}
end

function jaf.freemenu2(varmenu2,id)
         local v=varmenu2
         if tonumber(id) and id>0 then v=varmenu2[id] end
         if v~=nil and v then
           if v[2]~=nil and tonumber(v[2])~=nil then
           for i=1,tonumber(v[2]) do
                if v[3+i]~=nil then
                   jaf.removebtn2IMG(tonumber(v.pl),tonumber(v[3+i]))
                end
           end
           end
           if v[3]~=nil then
              jaf.removestat2IMG(tonumber(v.pl),tonumber(v[3]))
           end
           if tonumber(id) and id>0 then varmenu2[id]=nil else varmenu2=nil end
         end
end

function jaf.freemenu3(varmenu3)
         v=varmenu3
         if v or v~=nil then
           for i=1,tonumber(v[2]) do
                jaf.removebtn2IMG(tonumber(v.pl),tonumber(v[3+i]))
           end
           jaf.removestat2IMG(tonumber(v.pl),tonumber(v[3]))
         end
         v=nil
end

function jaf.checkmoverot(x1,y1,rot,rangemove)
        if not dis then dis=10 end
        if not rot then rot=0 return {0,0} end
        if rot < -90 then rot = rot + 360 end
        local angle =math.rad(math.abs( rot + 90 ))-math.pi
        local x = x1+math.cos(angle)*rangemove
        local y = y1+math.sin(angle)*rangemove
        if x > 0 and y > 0 and x < map("xsize") * 32 and y < map("ysize") * 32 then
             return {x,y}
        end
        return {x1,y1}
end

function jaf.event_check()
         nameday=os.date("%A")
         day=tonumber(os.date("%d"))
         month=os.date("%b")
         year=os.date("%Y")
         getevent={}
         geteventc=0
         if nameday and day and month and year then
         for i=1,#jaf.event_schedule do
             v=jaf.event_schedule[i]
             if v and v.date[1] and v.date[2] and v.date[3] and type(v.date[1])~="table" and v.date[1]>0 and v.date[1]==day and string.lower(v.date[2])==string.lower(month) and string.lower(v.date[3])==string.lower(nameday) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             elseif v and v.date[3]==nil and v.date[1] and type(v.date[1])~="table" and v.date[2] and v.date[1]>0 and v.date[1]==day and string.lower(v.date[2])==string.lower(month) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             elseif v and v.date[2]==nil and v.date[1] and type(v.date[1])~="table" and v.date[3] and v.date[1]>0 and v.date[1]==day and string.lower(v.date[3])==string.lower(nameday) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             elseif v and v.date[2]==nil and v.date[1] and type(v.date[1])=="table" and v.date[3] and string.lower(v.date[3])==string.lower(nameday) then
                for ii=1,#v.date[1] do
                    if v.date[1][ii]==day then
                       geteventc=geteventc+1
                       getevent[geteventc]=i
                       break
                    end
                end
             elseif v and v.date[2] and v.date[1] and type(v.date[1])=="table" and v.date[3]==nil and string.lower(v.date[2])==string.lower(month) then
                for ii=1,#v.date[1] do
                    if v.date[1][ii]==day then
                       geteventc=geteventc+1
                       getevent[geteventc]=i
                       break
                    end
                end
             elseif v and v.date[2] and v.date[3] and string.lower(v.date[2])==string.lower(month) and string.lower(v.date[3])==string.lower(nameday) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             elseif v and v.date[1]==nil and v.date[3]==nil and v.date[2] and string.lower(v.date[2])==string.lower(month) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             elseif v and v.date[2]==nil and v.date[1]==nil and v.date[3] and string.lower(v.date[3])==string.lower(nameday) then
                geteventc=geteventc+1
                getevent[geteventc]=i
             end
         end
         end
         if geteventc>0 then return getevent else return false end
end


function jaf.event_list(id,page)
eck=jaf.event_check()
if eck then
local page=page or 1
local pages=math.ceil(#eck/7)
local m='Event active list | Page '..page
    for i=7*page-6, 7*page do
         if eck[i] then
                m=m..','..jaf.event_schedule[eck[i]].title
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id,m)
else
jaf.svj_msg2(id,"[Server] "..merah..jaf.sv_lang(jaf.lang[id],125))
end
end

function jaf.event_menu(id,n)
         local v=jaf.event_schedule[n]
         es,eq,ei,epos="(Shop)","(Quest)","(Info)","(Go to Event Place)"
         if v then
              if v.shop then es="Shop" end
              if v.quest then eq="Quest's" end
              if v.info~=nil then ei="Info" end
              if v.pos~=nil and v.pos then epos="Go to Event Place" end
              menu(id,"Event - "..v.title..","..es..","..eq..","..ei..","..epos)
         end
end

function jaf.lagging(id,mode)
         if not mode then mode=0 end
         if jaf.antilag[id]>0 and player(id,"ping")>=700 then
            if mode>0 then jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],127)) end
         elseif jaf.antilag[id]>0 then
            if mode>0 then jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],126)) end
            return false
         else
            return true
         end
end

function jaf.rot_target(x,y,targetx,targety)
         return -math.deg(math.atan2(x-targetx,y-targety))
end

function jaf.admintime_save(usgngg,ngg)
end

function jaf.admintime_load(id,usgn)
end



function jaf.stafftimecheck(time) --- time = admin online time limit(in second)
        if time==nil then time=(3600*24) end
        local filename =jaf.loclua.."Admin.txt" --- file directory
	local file = io.open(filename)
        ausgn,alevel,agetc,aunac={},{},0,0
        ----- firtsly get the staff usgn and staff level from staff list
        if file then
            for line in file:lines() do
                local ln=totable(line)
                if tonumber(ln[1]) then
                   agetc=agetc+1
                   ausgn[agetc]=ln[1]
                   if ln[2] then alevel[agetc]=tonumber(ln[2]) else alevel[agetc]=1 end
                end
            end
            file:close()
        end
        ----- check the staff online time and remove unactive staff
        if agetc>0 then
           for i=1,agetc do
               v=jaf.admintime_load(nil,ausgn[i])
               if v and tonumber(v) then
                  if v<tonumber(time) and alevel[i]>1 and alevel[i]<3 then
                     aunac=aunac+1
                     alevel[i]=alevel[i]-1
                  elseif v<time and alevel[i]<3 then
                     aunac=aunac+1
                     ausgn[i]=nil
                     alevel[i]=nil
                  end
               end
           end
        else
           print(merah.."System ERROR: There are nothing staff has removed")
           return false
        end
        ---- save the active staff to staff list
        w_data=""
        for i=1,agetc do
            if ausgn[i] then
               jaf.admintime_save(ausgn[i],0)
               w_data=w_data..ausgn[i].." "..alevel[i].." \n"
            end
        end
        file=io.output(io.open(filename,"w+"))
        file:write(w_data)
        file:close()
        for _,pl in pairs(player(0,"table")) do
            if jaf.admin[pl]>0 then
                jaf.admin[pl]=jaf.CheckAdmin(jaf.usgn[pl])
                jaf.adminonlinetime[pl]=0
            end
        end
        print(hijau.."Staff online time system checking the unactive staff and removed "..aunac.." staff from staff list")
        jaf.svj_msg("[System] "..abu.."Staff online time system checking the unactive staff and removed "..aunac.." staff from staff list")
end

function jaf.server_save()
         local filename =jaf.loclua.."server.txt" --- file directory
         w_data=""
         w_data=w_data..jaf.server_sec.." "
         w_data=w_data..jaf.server_hour.." "
         w_data=w_data..jaf.server_lastcheckadmin.." "
         file=io.output(io.open(filename,"w+"))
         file:write(w_data)
         file:close()
end


function jaf.server_load()
        local filename =jaf.loclua.."server.txt" --- file directory
	local file = io.open(filename)
        if file then
           line=file:read()
           tbld=totable(line)
           if tonumber(tbld[1]) then jaf.server_sec=tonumber(tbld[1]) end
           if tonumber(tbld[2]) then jaf.server_hour=tonumber(tbld[2]) end
           if tbld[3] then jaf.server_lastcheckadmin=tbld[3] end
           file:close()
       end
end


function jaf.getitemdrop(id,x,y) --- id,tilex,tiley
         local v=jaf.itemdroppos[(x+(y/10^(#tostring(x))))]
         nv=1
         if v~=nil and type(v)=="table" and tonumber(#v)~=nil and #v>1 then
            nv=#v
         end
         if v==nil then return false end
         v=v[nv]
         if v~=nil and v.iid>0 and v.id>0 then
                    local i=v.id
                    if jaf.itemdropIMG[i]~=nil and v.iid and v.iid>0 and jaf.checkuserdata(jaf.usgn[id]).itemtotal<(jaf.inventory_max_default+jaf.invplus[id]) then
                                jaf.removeimgdrop(i)
                                local myslotdr=jaf.give_item(id,v.iid,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],72,jaf.list_items[v.iid].name))
                                jaf.itemdropx[i]=0
                                jaf.itemdropy[i]=0
                                jaf.itemdrop[i]=0
                                jaf.itemdroppos[(x+(y/10^(#tostring(x))))][nv]=nil
                                if jaf.itemdroplvl[i]~=nil and jaf.itemdroplvl[i]>0 then
                                   jaf.itemLVL[id][myslotdr]=jaf.itemdroplvl[i]
                                   jaf.itemdroplvl[i]=0
                                end
                                return i
                    elseif jaf.itemdropIMG[i]~=nil and jaf.itemdrop[i] and jaf.itemdrop[i]>0 and jaf.checkitem(id,v.iid).stat then
                                jaf.removeimgdrop(i)
                                local myslotdr=jaf.give_item(id,v.iid,1)
                                jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],72,jaf.list_items[v.iid].name))
                                jaf.itemdropx[i]=0
                                jaf.itemdropy[i]=0
                                jaf.itemdrop[i]=0
                                jaf.itemdroppos[(x+(y/10^(#tostring(x))))][nv]=nil
                                if jaf.itemdroplvl[i]~=nil and jaf.itemdroplvl[i]>0 then
                                   jaf.itemLVL[id][myslotdr]=jaf.itemdroplvl[i]
                                   jaf.itemdroplvl[i]=0
                                end
                                return i
                    elseif jaf.itemdropIMG[i]~=nil and v.iid>0 and v.iid>0 and jaf.itemdropx[i]==x and jaf.itemdropy[i]==y and jaf.checkuserdata(jaf.usgn[id]).itemtotal>=(jaf.inventory_max_default+jaf.invplus[id]) then
                                jaf.svj_msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],100))
                                return i
                    end
         end
end

function jaf.getsound(id,sfile)
         if tonumber(id) and sfile then
             parse('sv_sound2 '..id..' "'..sfile..'"')
         end
end

function jaf.getsound2(x,y,sfile,rx,ry)
         for _,id in pairs(player(0,"table")) do
               px,py=player(id,"x"),player(id,"y")
               if jaf.radiuscheck(x,y,px,py,rx,ry) then
                      jaf.getsound(id,sfile)
               end
         end
end

function jaf.getsound3(sfile)
         if sfile then
             parse('sv_sound "'..sfile..'"')
         end
end

function jaf.freeachvstatIMG(id)
         if jaf.achvstatIMG[id]~=nil then
                freeimage(jaf.achvstatIMG[id])
                jaf.achvstatIMG[id]=nil
         end
end

function jaf.table_check(tbl,txtf)
         --- txtf = find what u need on table(appear a table slot number)
         if type(tbl)=="table" then
                tbln=1
                if txtf==nil then
                   while tbl[tbln]~=txtf do tbln=tbln+1 end
                else
                   for i=0,#tbl do if tbl[i]~=nil and tbl[i]==txtf then tbln=i end end
                end
                return {stat=true,tn=tbln}
         end
         return {stat=false,tn=0}
end

function jaf.varfreeimage(id,var) --- specially for image id in table
         if tonumber(id) and id>0 and var then
               if var[id]~=nil then
                     freeimage(var[id])
                     var[id]=nil
                end
         end
end

function jaf.varfreeimage2(var) --- not for image id in table
         if var~=nil then
               freeimage(var)
               var=nil
         end
end

function jaf.jobmenu(id)
         if jaf.jobid[id]>0 and jaf.jobinfo[jaf.jobid[id]]~=nil then
            local ji=jaf.jobid[id]
            local jwp=jaf.jobinfo[ji].workpos
            local jst=0
            local jsy=jaf.jobinfo[ji].salary
            local jnm=jaf.jobinfo[ji].name
            local jik="Info"
            if jaf.jobinfo[ji].info==nil then jik="(Info)" end
            if jaf.jobinfo[ji].salarytime==nil or jaf.jobinfo[ji].salarytime==false then jst=0 else jst=jaf.jobinfo[ji].salarytime end
            if jwp==nil or type(jwp)~="table" then
               menu(id,"Job,("..jnm.."),("..jsy.." SCs for "..jst.." sec),(Go to work place),(Work Time|"..jaf.jobtime[id].."),"..jik)
            elseif jwp~=nil and type(jwp)=="table" then
               menu(id,"Job,("..jnm.."),("..jsy.." SCs for "..jst.." sec),Go to work place,(Work Time|"..jaf.jobtime[id].."),"..jik)
            end
         else
            jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],164))
         end
end

function jaf.bankcentermenu(id)
         if jaf.bankstats[id]>0 then
            menu(id,"J.I.B Center@b,(Make Bank Account|100K Shell)")
         else
            menu(id,"J.I.B Center@b,Make Bank Account|100K Shell")
         end
end

function jaf.housemenu(id)
         local hidp=jaf.houseid[id]
         if hidp>0 and jaf.house_list[hidp]~=nil then
            menu(id,"House,(Name|"..jaf.house_list[hidp].name.."),Open/Close door,Teleport to house,Leave house")
         else
            msg2(id,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[id],168))
         end
end

function jaf.job_list(id,page)
local page=page or 1
local pages=math.ceil(#jaf.jobinfo/7)
local m='Job List | Page '..page..'@b'
    for i=7*page-6, 7*page do
         if jaf.jobinfo[i]~=nil and jaf.jobinfo[i].check(id)==true then
                m=m..','..jaf.jobinfo[i].name..'|'..jaf.jobinfo[i].checkinfo
         elseif jaf.jobinfo[i]~=nil then
                m=m..',('..jaf.jobinfo[i].name..'|'..jaf.jobinfo[i].checkinfo..')'
         else
                m=m..','
         end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id,m)
end

function jaf.zombie_spawn(x,y,x2,y2)
         local txnpc=math.random(x,x2)
         local tynpc=math.random(y,y2)
         if (tile(txnpc,tynpc,"walkable")==true) and jaf.svj_npc_zombiec<8 then
            parse("spawnnpc 1 "..txnpc.." "..tynpc.." 0")
            jaf.svj_npc_zombiec=jaf.svj_npc_zombiec+1
         end
end

function jaf.headcrab_spawn(x,y,x2,y2)
         local txnpc=math.random(x,x2)
         local tynpc=math.random(y,y2)
         if (tile(txnpc,tynpc,"walkable")==true) and jaf.svj_npc_headcrabc<5 then
            parse("spawnnpc 2 "..txnpc.." "..tynpc.." 0")
            jaf.svj_npc_headcrabc=jaf.svj_npc_headcrabc+1
         end
end

function jaf.snark_spawn(x,y,x2,y2)
         local txnpc=math.random(x,x2)
         local tynpc=math.random(y,y2)
         if (tile(txnpc,tynpc,"walkable")==true) and jaf.svj_npc_snarkc<5 then
            parse("spawnnpc 3 "..txnpc.." "..tynpc.." 0")
            jaf.svj_npc_snarkc=jaf.svj_npc_snarkc+1
         end
end

function jaf.clear_npc_map()
         for _,o in pairs(object(0,'table')) do
		if object(o,"type")==30 then
		   parse("killobject "..o)
		end
	 end
         jaf.sv_objid={}
         jaf.svj_npc_zombiec=0
         jaf.svj_npc_headcrabc=0
         msg(kuning.."[System] "..ungu.."Clearing all of NPCs in the map.")
end

function jaf.daycycle_refresh()
         local dchour=tonumber(os.date("%I"))
         local dcts=os.date("%p")
         if jaf.daycycle_lastime==dchour then return false end
         jaf.daycycle_lastime=dchour
         if dchour==12 then dchour=0 end
         if not jaf.daycycle_status then
            parse("sv_daylighttime -1")
            return false
         end
         if (string.lower(dcts)=="pm" and dchour<6) or (string.lower(dcts)=="am" and dchour>6) then
              parse("sv_daylighttime -1")
              if jaf.daycycle_timecheck==0 then
                 jaf.daycycle_timecheck=1
                 parse("trigger nightsnd")
                 parse("trigger daysnd")
              end
              return false
         end
         if string.lower(dcts)=="pm" and dchour>=6 then
            if jaf.daycycle_timecheck==1 then
               jaf.daycycle_timecheck=0
               parse("trigger nightsnd")
               parse("trigger daysnd")
            end
            local timrl={[6]=0,[7]=1,[8]=2,[9]=3,[10]=4,[11]=5,[12]=6}
            parse("sv_daylighttime "..(195-math.floor(timrl[dchour]/6*10)))
         elseif string.lower(dcts)=="am" and dchour<=6 then
            parse("sv_daylighttime "..(185+math.floor(dchour/6*20)))
            if jaf.daycycle_timecheck==1 then
               jaf.daycycle_timecheck=0
               parse("trigger nightsnd")
               parse("trigger daysnd")
            end
         end
end

function jaf.teleportget(id,x,y,time,didflash) --- time (in second)
                 if didflash==nil then didflash=true end
                 local lastspeed=player(id,"speedmod")
                 if time==nil then time=1
                 elseif time~=nil and (tonumber(time)==nil or not tonumber(time)) then time=1
                 end
                 local NSIA=1
                 while jaf.itemSKILLIMG[id][NSIA]~=nil do
                       NSIA=NSIA+1
                 end
                 local NSIA2=NSIA+1
                 while jaf.itemSKILLIMG[id][NSIA2]~=nil do
                       NSIA2=NSIA2+1
                 end
                 jaf.varfreeimage(NSIA,jaf.itemSKILLIMG[id])
                 jaf.varfreeimage(NSIA2,jaf.itemSKILLIMG[id])
                 jaf.itemSKILLIMG[id][NSIA]=image(jaf.locgfx.."blackhole.png",(player(id,"x")),(player(id,"y")),1,0)
                 jaf.itemSKILLIMG[id][NSIA2]=image(jaf.locgfx.."blackhole.png",(x),(y),1,0)
                 imagescale(jaf.itemSKILLIMG[id][NSIA],0.2,0.2)
                 imagescale(jaf.itemSKILLIMG[id][NSIA2],0.2,0.2)
                 tween_scale(jaf.itemSKILLIMG[id][NSIA],(time*300),1,1)
                 tween_scale(jaf.itemSKILLIMG[id][NSIA2],(time*300),1,1)
                 tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA],-10)
                 tween_rotateconstantly(jaf.itemSKILLIMG[id][NSIA2],10)
                 jaf.stunt[id]=1
                 parse("speedmod "..id.." -50")
                 if didflash~=nil and didflash then
                   parse("flashplayer "..id.." "..74)
                 end
                 function jaf.tlpibktimer(id,n1,n2,tx,ty,lsp)
                      local id=tonumber(id)
                      local n1=tonumber(n1)
                      local n2=tonumber(n2)
                      parse("setpos "..id.." "..(tx).." "..(ty))
                      -- parse('effect "colorsmoke" '..(tx)..' '..(ty)..' 52 22 000 000 000  ')
                      jaf.stunt[id]=0
                      parse("speedmod "..id.." "..lsp)
                      tween_scale(jaf.itemSKILLIMG[id][n1],(time*500),0,0)
                      tween_scale(jaf.itemSKILLIMG[id][n2],(time*500),0,0)
                      function jaf.tlpibk2timer(id,nn1,nn2)
                         jaf.varfreeimage(nn1,jaf.itemSKILLIMG[id])
                         jaf.varfreeimage(nn2,jaf.itemSKILLIMG[id])
                      end
                      local tlpibk2=timerEx((time*500),jaf.tlpibk2timer,1,id,n1,n2)
                 end
                 local tlpibk=timerEx((time*1000),jaf.tlpibktimer,1,id,NSIA,NSIA2,x,y,lastspeed)
end

function jaf.itemupselect(id,page)
local page=page or 1
local pages=math.ceil((jaf.inventory_max_default+jaf.invplus[id])/7)
local m='Select ItemUP | Page '..page
    for i=7*page-6, 7*page do
         local v1=jaf.items[id][i]
         local v2=jaf.aitems[id][i]
         local gtb=jaf.list_items[v1]
         local maxi=(jaf.inventory_max_default+jaf.invplus[id])
         if v1 and v2 and v1>0 and v2>0 and i<=maxi and gtb.itemup~=nil and gtb.itemup~=false then
                if gtb.memberstat~=nil and gtb.memberstat and (jaf.JAFmember[id]>0 or jaf.admin[id]>0) then
                   m=m..','..string.sub(jaf.list_items[v1].name,1,18)
                elseif gtb.memberstat~=nil and gtb.memberstat then
                   m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|Member)'
                else
                   m=m..','..string.sub(jaf.list_items[v1].name,1,18)
                end
          elseif v1 and v2 and v1>0 then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|X)'
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id,m)
end

function jaf.itemselecttoup(id,page)
local page=page or 1
local pages=math.ceil((jaf.inventory_max_default+jaf.invplus[id])/7)
local m='Take item to UP | Page '..page
    for i=7*page-6, 7*page do
         local v1=jaf.items[id][i]
         local v2=jaf.aitems[id][i]
         local gtb=jaf.list_items[v1]
         local maxi=(jaf.inventory_max_default+jaf.invplus[id])
         if v1~=nil and v2~=nil and v1>0 and v2>0 and i<=maxi and jaf.itemLVL[id][i]~=nil and (gtb.itemup==nil or gtb.itemup==false) then
                if jaf.itemLVL[id][i]<10 then
                  m=m..','..string.sub(jaf.list_items[v1].name,1,18)..'|Lvl.'..jaf.itemLVL[id][i]
                else
                  m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|Max lvl)'
                end
          elseif v1~=nil and v2~=nil and v1>0 and v2>0 and (gtb.itemup==nil or gtb.itemup==false) then
                m=m..','..string.sub(jaf.list_items[v1].name,1,18)
          elseif v1~=nil and v2~=nil and v1>0 then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|X)'
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id,m)
end

function jaf.color_select(id,page)
local page=page or 1
local pages=math.ceil(#jaf.itemcolorlist/7)
local m='Select Color | Page '..page..'@b'
    for i=7*page-6, 7*page do
         if jaf.itemcolorlist[i]~=nil and jaf.itemcolorlist[i] then
                m=m..','..jaf.itemcolorlist[i].name
         else
                m=m..','
         end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id,m)
end

function jaf.invencheckmenu(id,page,idd)
if player(id,"exists")==false then
   jaf.svj_msg2(idd,"[Server] "..merah..""..jaf.sv_lang(jaf.lang[idd],96))
   return false
end
local page=page or 1
local pages=math.ceil((jaf.inventory_max_default+jaf.invplus[id])/7)
local m='Check Inventory | Page '..page..'@b'
    for i=7*page-6, 7*page do
         local v1=jaf.items[id][i]
         local v2=jaf.aitems[id][i]
         local gtb=jaf.list_items[v1]
         local maxi=(jaf.inventory_max_default+jaf.invplus[id])
         local tipenya=""
         if v1~=nil and v2~=nil and v1>0 and jaf.list_items[v1].timer~=nil and jaf.list_items[v1].timer==true then
                     if (math.floor(v2)-v2)~=0 then
                           tipenya="Permanent"
                     elseif v2>(3600*24) then
                           local gthtr=math.floor(math.floor(((v2/(3600*24))-math.floor(v2/(3600*24)))*(3600*24)))
                           local gtmtr=math.floor(math.floor(((gthtr/3600)-math.floor(gthtr/3600))*3600)/60)
                           local waktudy="day"
                           if math.floor(v2/(3600*24))>1 then
                              waktudy="days"
                           end
                           tipenya=math.floor(v2/(3600*24)).." "..waktudy.." "..math.floor(gthtr/3600).." hr "..gtmtr.." min"
                     elseif v2>3600 then
                           local gtmtr=math.floor(math.floor(((v2/3600)-math.floor(v2/3600))*3600)/60)
                           tipenya=math.floor(v2/3600).." hr "..gtmtr.." min"
                     elseif v2>60 then
                           local gtstr=math.floor(((v2/60)-math.floor(v2/60))*60)
                           tipenya=math.floor(v2/60).." min "..gtstr.." sec"
                     else
                          tipenya=v2.." s"
                     end
         elseif v1~=nil and v2~=nil and v1>0 then
                     tipenya=v2.." Unit(s)"
         end
         if v1~=nil and v2~=nil and v1>0 and v2>0 and i<=maxi and jaf.itemLVL[id][i]~=nil then
                if jaf.itemLVL[id][i]<10 then
                  m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'-Lvl.'..jaf.itemLVL[id][i]..'|'..tipenya..')'
                else
                  m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'-Max lvl|'..tipenya..')'
                end
          elseif v1~=nil and v2~=nil and v1>0 and v2>0 and (gtb.itemup==nil or gtb.itemup==false) then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|'..tipenya..')'
          elseif v1~=nil and v2~=nil and v1>0 then
                m=m..',('..string.sub(jaf.list_items[v1].name,1,18)..'|'..tipenya..')'
          else
                m=m..','
          end
    end
         langpage=jaf.sv_lang(jaf.lang[idd],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[idd],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[idd],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..",("..player(id,"name").."'s Inventory|"..jaf.checkuserdata(jaf.usgn[id]).itemtotal.."/"..(jaf.inventory_max_default+jaf.invplus[id])..")" 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[idd],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(idd,m)
end

function jaf.tele_menukuya(id,page)
local page=page or 1
local pages=math.ceil(#jaf.arealocatedta/7)
local m='Teleport to Location | Page '..page..'@b'
    for i=7*page-6, 7*page do
         if jaf.arealocatedta[i]~=nil and jaf.arealocatedta[i] then
                m=m..','..jaf.arealocated[jaf.arealocatedta[i]][5]
         else
                m=m..','
         end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id,m)
end

function jaf.langselectmenu(id,page)
local page=page or 1
local pages=math.ceil(#jaf.arealocatedta/7)
local m=jaf.sv_lang(jaf.lang[id],10)..' | Page '..page..''
    for i=7*page-6, 7*page do
         if jaf.lang_list[i]~=nil and jaf.lang_list[i] and i~=jaf.lang[id] then
                m=m..','..jaf.lang_list[i].lang
         elseif jaf.lang_list[i]~=nil and jaf.lang_list[i] then
                m=m..',('..jaf.lang_list[i].lang..')'
         else
                m=m..','
         end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id,m)
end

function jaf.psdmenu(id,page)
local page=page or 1
local pages=math.ceil(#jaf.mylossitem[id]/7)
local m='Take Item on PSD | Page '..page..'@b'
    for i=7*page-6, 7*page do
         if jaf.mylossitem[id][i]~=nil and jaf.mylossitem[id][i]>0 and jaf.mylossiteml[id][i]~=nil then
                local am=jaf.mylossitema[id][i]
                local itm=jaf.mylossitem[id][i]
                if am==nil or tonumber(am)==nil then
                   am=0
                end
                if jaf.list_items[itm].timer~=nil and jaf.list_items[itm].timer then
                   m=m..','..jaf.list_items[itm].name..' - lvl.'..jaf.mylossitemal[id][i]..'|'..am..' second(s)'
                else
                   m=m..','..jaf.list_items[itm].name..' - lvl.'..jaf.mylossitemal[id][i]..'|'..am..' unit(s)'
                end
         elseif jaf.mylossitem[id][i]~=nil and jaf.mylossitem[id][i]>0 then
                local am=jaf.mylossitema[id][i]
                local itm=jaf.mylossitem[id][i]
                if am==nil or tonumber(am)==nil then
                   am=0
                end
                if jaf.list_items[itm].timer~=nil and jaf.list_items[itm].timer then
                   m=m..','..jaf.list_items[itm].name..'|'..am..' second(s)'
                else
                   m=m..','..jaf.list_items[itm].name..'|'..am..' unit(s)'
                end
         else
                m=m..',(EMPTY)'
         end
    end
         langpage=jaf.sv_lang(jaf.lang[id],8)
         if page >= pages then 
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],5)..'|'..langpage..' '..(page+1)..''
         end
         if page == 1 then 
              m = m ..',('..jaf.sv_lang(jaf.lang[id],7)..'|X)' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id,m)
end

function jaf.npctalkme(id,npcimg,npcname,tbl) -- tbl={txt1,txt2,...txt-n}
         if player(id,"exists") and tbl~=nil and type(tbl)=="table" and #tbl>0 and npcname~=nil then
                jaf.npctalkhudremove(id)
                jaf.plnpctalkyout[id]=tbl
                jaf.plnpctalkyounn[id]=npcname
                jaf.freemenu2(jaf.plnpctalkyoum,id)
                jaf.varfreeimage(id,jaf.plnpctalkyouimg)
                jaf.plnpctalkyoum[id]=jaf.menu2(id,13,40,41,42)
                jaf.plnpctalkyouc[id]=1
                if npcimg~=nil and npcimg then
                   jaf.plnpctalkyouimg[id]=image(npcimg,225,190,2,id)
                   imagepos(jaf.plnpctalkyouimg[id],225,190,180)
                end
                local n=jaf.plnpctalkyouc[id]
                if tbl[n]~=nil then
                   parse('hudtxt2 '..id..' '..(11)..' "'..hijau..''..npcname..'" 335 '..(145))
                   local mc=50
                   local ca=#tbl[n]
                   if ca>(5*mc) then
                      ca=(5*mc)
                   end
                   parse('hudtxt2 '..id..' '..(19)..' "'..putih..''..n..'/'..#tbl..'" 390 338 1')
                   local cgc=0
                   for i=1,math.ceil(ca/mc) do
                       if tbl[n]:sub((cgc*mc),(cgc*mc))==" " then
                         parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc+1),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                       else
                         parse('hudtxt2 '..id..' '..(11+i)..' "'..kuning..''..tbl[n]:sub((cgc*mc),(cgc*mc+mc-1))..'" 335 '..(155+17*i))
                       end
                       cgc=cgc+1
                   end
                end
         end
end

function jaf.npctalkhudremove(id)
         parse('hudtxt2 '..id..' 11 "" 0 0')
         parse('hudtxt2 '..id..' 12 "" 0 0')
         parse('hudtxt2 '..id..' 13 "" 0 0')
         parse('hudtxt2 '..id..' 14 "" 0 0')
         parse('hudtxt2 '..id..' 15 "" 0 0')
         parse('hudtxt2 '..id..' 16 "" 0 0')
         parse('hudtxt2 '..id..' 19 "" 0 0')
end

function jaf.npctalkremove(id)
            jaf.plnpctalkyout[id]={}
            jaf.plnpctalkyouc[id]=1
            jaf.plnpctalkyounn[id]="No Name"
            jaf.freemenu2(jaf.plnpctalkyoum,id)
            jaf.npctalkhudremove(id)
            jaf.varfreeimage(id,jaf.plnpctalkyouimg)
end

function jaf.refreshitemimg(id,nolisted)
            local listing={5,2,3,6,1,4}
            local nltd=0
            if nolisted~=nil and nolisted then
               nltd=nolisted
            end
            for lt=1,#listing do
                local i=listing[lt]
                if jaf.itemSEL[id][i]>0 and jaf.itemIMG[id][i]~=nil and i~=nltd then
                   jaf.varfreeimage(i,jaf.itemIMG[id])
                   local imgn=i
                   local imgl=jaf.list_items[jaf.itemSEL[id][i]].attbt.img
                   local imgst=jaf.list_items[jaf.itemSEL[id][i]].attbt[2]
                   local imgrc=jaf.list_items[jaf.itemSEL[id][i]].attbt.rc
                   local imgcwp=jaf.list_items[jaf.itemSEL[id][i]].comwpn
                   if i~=4 and imgl then
                      jaf.itemIMG[id][imgn]=image(imgl,1,1,imgst+id)
                      if imgcwp~=nil and imgcwp then
                         imagepos(jaf.itemIMG[id][imgn],320,240,0)
                      end
                      if imgrc and tonumber(imgrc) then
                         if imgrc==1 then
                            imagescale(jaf.itemIMG[id][imgn],1,-1)
                         elseif imgrc==2 and jaf.handwpn[id]==1 then
                            imagescale(jaf.itemIMG[id][imgn],-1,1)
                         end
                      elseif jaf.handwpn[id]==2 and jaf.itemIMG[id][3]~=nil then
                         imagescale(jaf.itemIMG[id][3],-1,1)
                      end
                      if imgn==3 then
                         if jaf.wpnimghand[id]==0 then
                            imagescale(jaf.itemIMG[id][imgn],1,-1)
                            if imgcwp~=nil and imgcwp then
                               imagepos(jaf.itemIMG[id][imgn],320,240,0)
                            end
                         end
                      end
                   elseif imgl then
                      if imgst>1 then
                         imgst=1
                      end
                      jaf.itemIMG[id][imgn]=image(imgl,0,0,imgst)
                      imagepos(jaf.itemIMG[id][imgn],jaf.petx[id],jaf.pety[id],0)
                   end
                end
            end
           if jaf.clan[id]>0 and jaf.clan_markimg[jaf.clan[id]]~=nil and jaf.clan_markimg[jaf.clan[id]]>0 and jaf.clansimbol[id]>0 then
              local cmid=jaf.clan_markimg[jaf.clan[id]]
              jaf.varfreeimage(id,jaf.clanmarkimg)
              if jaf.clan_marklist[cmid]~=nil then
                 if jaf.clan_marklist[cmid].rc~=nil and jaf.clan_marklist[cmid].rc then
                    jaf.clanmarkimg[id]=image(jaf.clan_marklist[cmid].imgloc,0,0,100+id)
                    tween_rotateconstantly(jaf.clanmarkimg[id],10)
                 else
                    jaf.clanmarkimg[id]=image(jaf.clan_marklist[cmid].imgloc,0,0,200+id)
                 end
                 local cmid=jaf.clan[id]
                 if jaf.clan_markcolor[cmid]~=nil then
                    local mc=jaf.clan_markcolor[cmid]:gsub("k"," ")
                    local mt=totable(mc)
                    imagecolor(jaf.clanmarkimg[id],mt[1],mt[2],mt[3])
                 end
              end
           elseif jaf.clanmarkimg[id]~=nil then
              jaf.varfreeimage(id,jaf.clanmarkimg)
           end
end

function jaf.refreshitemuse(id,nolisted)
            local listing={5,2,3,6,1,4}
            local nltd=0
            if nolisted~=nil and nolisted then
               nltd=nolisted
            end
            for lt=1,#listing do
                local i=listing[lt]
                if jaf.itemSEL[id][i]>0 and i~=nltd then
                   local usid=jaf.itemSEL[id][i]
                   jaf.varfreeimage(i,jaf.itemIMG[id])
                   local imgn=i
                   local imgl=jaf.list_items[jaf.itemSEL[id][i]].attbt.img
                   local imgst=jaf.list_items[jaf.itemSEL[id][i]].attbt[2]
                   local imgrc=jaf.list_items[jaf.itemSEL[id][i]].attbt.rc
                   local imgcwp=jaf.list_items[jaf.itemSEL[id][i]].comwpn
                   local morepp=jaf.list_items[jaf.itemSEL[id][i]].more
                   if jaf.itemSEL[id][imgn]~=jaf.btnitem[id] then
                      jaf.removeitemIMG(id,imgn)
                      if imgn==3 and jaf.list_items[usid].itemskill then
                         jaf.svj_msg2(id,"[INFO] "..hijau..""..jaf.sv_lang(jaf.lang[id],112))
                      end
                      parse("setweapon "..id.." 50")
                      jaf.wpnimghand[id]=1
                      if imgn==2 then
                         if jaf.list_items[usid].class~=nil then
                            jaf.varfreeimage(1,jaf.classbtnimg[id])
                            jaf.varfreeimage(2,jaf.classbtnimg[id])
                            local gtp=jaf.skilltemppos[id]
                            if jaf.list_items[usid].class[1]~=nil then
                               jaf.classbtnimg[id][1]=image(jaf.list_items[usid].class[1][1],gtp.x1,gtp.y1,2,id)
                               if jaf.classtime1[id]>0 then
                                  imagecolor(jaf.classbtnimg[id][1],000,000,000)
                               end
                            end
                            if jaf.list_items[usid].class[2]~=nil then
                               jaf.classbtnimg[id][2]=image(jaf.list_items[usid].class[2][1],gtp.x2,gtp.y2,2,id)
                               if jaf.classtime2[id]>0 then
                                  imagecolor(jaf.classbtnimg[id][2],000,000,000)
                               end
                              end
                           else
                              jaf.varfreeimage(1,jaf.classbtnimg[id])
                              jaf.varfreeimage(2,jaf.classbtnimg[id])
                           end
                        end
                        if i~=4 and imgl then
                           jaf.itemIMG[id][imgn]=image(imgl,1,1,imgst+id)
                           if imgcwp~=nil and imgcwp then
                             imagepos(jaf.itemIMG[id][imgn],320,240,0)
                          end
                          if imgrc and tonumber(imgrc) then
                             if imgrc==1 then
                                imagescale(jaf.itemIMG[id][imgn],1,-1)
                             elseif imgrc==2 and jaf.handwpn[id]==1 then
                                imagescale(jaf.itemIMG[id][imgn],-1,1)
                             end
                          elseif jaf.handwpn[id]==2 and jaf.itemIMG[id][3]~=nil then
                            imagescale(jaf.itemIMG[id][3],-1,1)
                          end
                          if morepp~=nil and morepp.speed~=nil and morepp.speed then
                             parse("speedmod "..id.." "..jaf.itemSPEED[id]+morepp.speed)
                          end
                        elseif imgl then
                          if imgst>1 then
                             imgst=1
                          end
                          jaf.itemIMG[id][imgn]=image(imgl,0,0,imgst)
                          imagepos(jaf.itemIMG[id][imgn],jaf.petx[id],jaf.pety[id],0)
                        end
                 else
                    jaf.removeitemIMG(id,imgn)
                    if imgn==2 then
                       jaf.varfreeimage(1,jaf.classbtnimg[id])
                       jaf.varfreeimage(2,jaf.classbtnimg[id])
                       jaf.classtime1[id]=0
                       jaf.classtime2[id]=0
                    end
                    if morepp~=nil and morepp.speed~=nil and morepp.speed then
                       parse("speedmod "..id.." 0")
                     end
                   end
                end
            end
end


---------------- Intellegence Robot ------------------

--- Removed caused the LAG


---------------- MAP Protection ----------------------
-- Removed, not effective


---------------- Car Project ----------------
function jaf.car_move()
         ---- Removed
end

function jaf.car_spawn(tilex,tiley,rot)
         ---- Removed
end

function jaf.car_go()
         ---- Removed
end