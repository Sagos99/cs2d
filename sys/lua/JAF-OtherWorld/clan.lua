jaf.clan_name={}
jaf.clan_leader={}
jaf.clan_membersID={}
jaf.clan_membersName={}
jaf.clan_diamond={}
jaf.clan_lastdonate={}
jaf.clan_memplus={}
jaf.clan_markimg={}
jaf.clan_reputation={}
jaf.clan_markcolor={}
jaf.clan_maxmember=30
jaf.clan_list=""
jaf.clan_list_name=""
jaf.clan_list_top=""
jaf.clan_request={}
jaf.clan_request_name={}

jaf.clan_marklist={
                  [0]={name="None",imgloc=false},
                  [1]={name="Blue Ball",
                        imgloc=jaf.locgfx.."clanmark1.png"
                       },
                  [2]={name="Void Energy",
                        imgloc=jaf.locgfx.."clanmark2.png"
                       },
                  [3]={name="Meteor",
                        imgloc=jaf.locgfx.."clanmark3.png",
                        rc=true
                       },
                  [4]={name="Pumpkin",
                        imgloc=jaf.locgfx.."clanmark4.png"
                       },
                  [5]={name="Love",
                        imgloc=jaf.locgfx.."clanmark5.png"
                       },
                  [6]={name="Katana",
                        imgloc=jaf.locgfx.."clanmark6.png",
                        rc=true
                       },
                  [7]={name="Crown",
                        imgloc=jaf.locgfx.."clanmark7.png"
                       },
                  [8]={name="GameMaster Crown",
                        imgloc=jaf.locgfx.."clanmark8.png"
                       },
                   }

jaf.get_clanlist={}

function jaf.save_clan(clanID)
    if clanID>0 then
            if not jaf.clan_memplus[clanID] then jaf.clan_memplus[clanID]=0 end
            file=io.output(io.open(jaf.loclua.."clans/clan"..clanID..".txt","w+"))
            local data=""
            data=data..""..tostring(jaf.clan_name[clanID]).." "
            data=data..""..tonumber(jaf.clan_leader[clanID]).." "
            data=data..""..tonumber(jaf.clan_diamond[clanID]).." "
            data=data..""..tonumber(jaf.clan_lastdonate[clanID]).." "
            data=data..""..tonumber(jaf.clan_memplus[clanID]).." "
            data=data..""..tonumber(jaf.clan_reputation[clanID]).." "
            data=data..""..tonumber(jaf.clan_markimg[clanID]).." "
            data=data..""..tostring(jaf.clan_markcolor[clanID]).." "
            data=data.."\n"
            for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                  if jaf.clan_membersID[clanID][i] then
                     data=data..""..tonumber(jaf.clan_membersID[clanID][i]).." "
                  else
                     data=data.."0 "
                  end
            end
            data=data.."\n"
            for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                  if jaf.clan_membersName[clanID][i] and jaf.clan_membersName[clanID][i]~="nil" then
                     data=data..""..tostring(jaf.clan_membersName[clanID][i]).." "
                  else
                     data=data.."X "
                  end
            end
            data=data.."\n"
            data=data..jaf.clan_request[clanID]
            data=data.."\n"
            data=data..jaf.clan_request_name[clanID]
            file:write(data)
	    file:close()
    end
end

function jaf.load_clan(id,clanID)
       if clanID~=nil and tonumber(clanID) and clanID>0 then
                 local clanID=tonumber(clanID)
                 local dirclan=jaf.loclua.."clans/clan"..clanID..".txt"
                 local file = io.open(dirclan:format("clan"..clanID, "r"))
                 if file then
                      local line=file:read()
                      local data=totable(line)
                      local dget=tostring(data[1])
                      local dget2=tonumber(data[2])
                      local dget3=tonumber(data[3])
                      local dget4=tonumber(data[4])
                      local dget5=tonumber(data[5])
                      local dget6=tonumber(data[6])
                      local dget7=tonumber(data[7])
                      local dget8=tostring(data[8])
                      if dget~=nil then jaf.clan_name[clanID]=dget end
                      if dget2~=nil then jaf.clan_leader[clanID]=dget2 end
                      if dget3~=nil then jaf.clan_diamond[clanID]=dget3 end
                      if dget4~=nil then jaf.clan_lastdonate[clanID]=dget4 end
                      if dget5~=nil then
                             jaf.clan_memplus[clanID]=dget5
                      else
                             jaf.clan_memplus[clanID]=0
                      end
                      if dget6~=nil then
                             jaf.clan_reputation[clanID]=dget6
                      else
                             jaf.clan_reputation[clanID]=0
                      end
                      if dget7~=nil then
                             jaf.clan_markimg[clanID]=dget7
                      else
                             jaf.clan_markimg[clanID]=1
                      end
                      if dget8~="nil" and tonumber(dget8)==nil then
                             jaf.clan_markcolor[clanID]=dget8
                      else
                             jaf.clan_markcolor[clanID]="255k255k255"
                      end

                      line=file:read()
                      data=totable(line)
                      jaf.clan_membersID[clanID]={}
                      for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                             dataR=tonumber(data[i])
                             if dataR~=nil then jaf.clan_membersID[clanID][i]=dataR else jaf.clan_membersID[clanID][i]=0 end
                      end

                      line=file:read()
                      data=totable(line)
                      jaf.clan_membersName[clanID]={}
                      for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                             dataR=tostring(data[i])
                             if dataR~=nil then jaf.clan_membersName[clanID][i]=dataR else jaf.clan_membersName[clanID][i]="X" end
                      end

                      line=file:read()
                      if line~=nil then
                         jaf.clan_request[clanID]=line
                      else
                         jaf.clan_request[clanID]=""
                      end

                      line=file:read()
                      if line~=nil then
                         jaf.clan_request_name[clanID]=line
                      else
                         jaf.clan_request_name[clanID]=""
                      end
                                                           
                      file:close()
                      return true
                  else
                       if id~=nil then
                              jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],17))
                              jaf.clan[id]=0
                       end
                       jaf.clan_reputation[clanID]=0
                       return false
                  end
        end
end

function jaf.createclan(id,NAME)
            if jaf.usgn[id]>0 and jaf.clan[id]<=0 and jaf.shell[id]>=1000000 then
                       usgncad=jaf.usgn[id]
                       if #tostring(usgncad)<4 then
                          usgncad=1000
                       end
                       if jaf.load_clan(nil,usgncad) then
                          cidp=0.1
                          while jaf.load_clan(nil,usgncad+cidp) do
                                cidp=cidp+0.1
                          end
                          jaf.clan[id]=usgncad+cidp
                       else
                          jaf.clan[id]=usgncad
                       end
                       jaf.give_shell(id,-1000000)
                       jaf.clan_name[jaf.clan[id]]=NAME
                       jaf.clan_leader[jaf.clan[id]]=jaf.usgn[id]
                       jaf.clan_diamond[jaf.clan[id]]=10
                       jaf.clan_membersID[jaf.clan[id]]={}
                       jaf.clan_membersName[jaf.clan[id]]={}
                       jaf.clan_lastdonate[jaf.clan[id]]=0
                       jaf.clan_memplus[jaf.clan[id]]=0
                       jaf.clan_reputation[jaf.clan[id]]=0
                       jaf.clan_request[jaf.clan[id]]=""
                       jaf.clan_request_name[jaf.clan[id]]=""
                       jaf.clan_markimg[jaf.clan[id]]=1
                       jaf.clan_markcolor[jaf.clan[id]]="255k255k255"
                       for i=1,jaf.clan_maxmember+jaf.clan_memplus[jaf.clan[id]] do
                           jaf.clan_membersID[jaf.clan[id]][i]=0
                           jaf.clan_membersName[jaf.clan[id]][i]="X"
                       end
                       jaf.clan_membersID[jaf.clan[id]][1]=jaf.usgn[id]
                       jaf.clan_membersName[jaf.clan[id]][1]=string.gsub(player(id,"name")," ","_")
                       jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],27))
                       jaf.save_clan(jaf.clan[id])
                       jaf.achv_get(id,15)
            elseif jaf.usgn[id]<=0 then
                       jaf.svj_msg2(id,merah..""..jaf.sv_lang(jaf.lang[id],15).."@C")
            elseif jaf.shell[id]<1000000 then
                       jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],36))
            else
                       jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],16))
            end
end

function jaf.clanmembers(clanID)
         check_member=0
         for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
             if jaf.clan_membersID[clanID][i] and jaf.clan_membersID[clanID][i]>0 and jaf.clan_membersName[clanID][i]~="X" then
                    check_member=check_member+1
                    
             end
         end
         return check_member
end

function jaf.clanmembersonline(clanID)
                 check_memberonline=0
                 for _,i in pairs(player(0,"table")) do
                         if jaf.clan[i]==clanID then
                                   check_memberonline=check_memberonline+1
                         end
                 end
                 return check_memberonline
end

function jaf.clanjoinkan(clanID,pl)
             jaf.load_clan(nil,clanID)
             if player(pl,"exists") and jaf.usgn[pl]>0 and jaf.clan[pl]<=0 then
                     if jaf.clan_check(clanID).member<jaf.clan_maxmember+jaf.clan_memplus[clanID] then
                         for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                                 if jaf.clan_membersID[clanID][i] and jaf.clan_membersID[clanID][i]==jaf.usgn[id] then
                                    jaf.svj_msg2(pl,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[pl],18))
                                    jaf.clan[pl]=clanID
                                    return 1
                                 elseif jaf.clan_membersID[clanID][i]~=nil and jaf.clan_membersID[clanID][i]<=0 then
                                    jaf.clan_membersID[clanID][i]=jaf.usgn[pl]
                                    jaf.clan_membersName[clanID][i]=string.gsub(player(pl,"name")," ","_")
                                    jaf.svj_msg2(pl,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[pl],18))
                                    jaf.clan[pl]=clanID
                                    jaf.clan_reputation[clanID]=jaf.clan_reputation[clanID]+100
                                    jaf.save_clan(clanID)
                                    return 1
                                 end
                         end
                      else
                              jaf.svj_msg2(pl,"[System] "..merah..""..jaf.sv_lang(jaf.lang[pl],19))
                      end
              end
end

function jaf.clanleave(id)
          if jaf.clan[id]>0 then
              jaf.varfreeimage(id,jaf.clanmarkimg)
              clanID=jaf.clan[id]
              jaf.load_clan(nil,clanID)
              for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                        if jaf.clan_membersID[clanID][i] and jaf.clan_membersID[clanID][i]==jaf.usgn[id] then
                                      jaf.clan_membersID[clanID][i]=0
                                      jaf.clan_membersName[clanID][i]="X"
                                      if jaf.clan_reputation[clanID]>=100 then
                                         jaf.clan_reputation[clanID]=jaf.clan_reputation[clanID]-100
                                      end
                                      jaf.save_clan(clanID)
                                      jaf.clan[id]=0
                                      jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],29))
                                      return 1
                         end
              end
          end
end

function jaf.clanmeexists(id)
        jaf.load_clan(id,jaf.clan[id])
        if jaf.clan[id]>0 then
               clanID=jaf.clan[id]
               for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                       v=jaf.clan_membersID[clanID][i]
                       if v and v==jaf.usgn[id] then
                              return true
                       end
               end
        end
        jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],37))
        jaf.clan[id]=0
        return false
end

function jaf.clan_check_member(usgnID,clanID)
        local usgnID=tonumber(usgnID)
        local clanID=tonumber(clanID)
        cv=jaf.load_clan(id,clanID)
        if cv and usgnID>0 then
               for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                       v=jaf.clan_membersID[clanID][i]
                       if v and v==usgnID then
                              return true
                       end
               end
        end
        return false
end

function jaf.claninvitation(id,pl)
          if jaf.clan[id]>0 then
              clanID=jaf.clan[id]
            if jaf.clanmembers(clanID)<jaf.clan_maxmember+jaf.clan_memplus[clanID] then
              if jaf.clan[pl]<=0 and jaf.clan[pl]~=jaf.clan[id] and jaf.usgn[pl]>0 and player(pl,"exists") then
                        for i=1,5 do
                           if jaf.claninvite[pl][i] and jaf.claninvite[pl][i]<=0 then
                                    jaf.claninvite[pl][i]=clanID
                                    jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],23))
                                    jaf.svj_msg2(pl,"[System] "..hijau..""..player(id,"name")..""..jaf.sv_lang(jaf.lang[pl],24))
                                    return 1
                           end
                        end
              elseif jaf.clan[pl]>0 then
                     jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],20))
              elseif jaf.clan[pl]==jaf.clan[id] then
                     jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],21))
              else
                     jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],22))
              end
           else
                              jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[pl],34))
           end
          end
end

function jaf.clan_menu(id)
              if jaf.clan[id]>0 then
                      jaf.clan_list_save(jaf.clan[id])
                      jaf.clanmeexists(id)
                      local clmk=jaf.clan_marklist[jaf.clan_markimg[jaf.clan[id]]].name
                      if tostring(clmk)=="nil" then
                         clmk="None"
                      end
                      if jaf.clan[id]>0 and jaf.clan_leader[jaf.clan[id]]==jaf.usgn[id] then
                             menu(id,"Clan | "..jaf.clan_name[jaf.clan[id]]..",Members|"..jaf.clanmembers(jaf.clan[id]).."/"..(jaf.clan_maxmember+jaf.clan_memplus[jaf.clan[id]]).." ("..jaf.clanmembersonline(jaf.clan[id]).."),Remove clan,Diamond donate,Clan shop,Clan List,Requets List,Symbol|"..clmk..",(Diamonds|"..jaf.clan_diamond[jaf.clan[id]].."),(Reputation|"..jaf.clan_reputation[jaf.clan[id]]..")")
                      elseif jaf.clan[id]>0 then
                             menu(id,"Clan | "..jaf.clan_name[jaf.clan[id]]..",Members|"..jaf.clanmembers(jaf.clan[id]).."/"..(jaf.clan_maxmember+jaf.clan_memplus[jaf.clan[id]]).." ("..jaf.clanmembersonline(jaf.clan[id]).."),Leave clan,Diamond donate,(Clan shop|leader),Clan List,(Symbol|"..clmk.."),(Diamonds|"..jaf.clan_diamond[jaf.clan[id]].."),(Reputation|"..jaf.clan_reputation[jaf.clan[id]]..")")
                      end
              else
                      menu(id,"No clan,Clan invitation,Clan List")
              end
end

function jaf.clan_donatemenu(id)
             if jaf.clan[id]>0 then
                    jaf.load_clan(id,jaf.clan[id])
                    if jaf.clan[id]>0 then
                           menu(id,"Clan - Donating,5 Diamond|50K shell,10 Diamond|100K Shell,50 Diamond|500K shell,100 Diamond|1M shell,500 Diamond|5M Shell,,,(Diamonds|"..jaf.clan_diamond[jaf.clan[id]].."),(Last donator|"..jaf.clan_lastdonate[jaf.clan[id]]..")")
                    end
             end
end

function jaf.clanmembermenu(id,page)
local page=page or 1
local pages=math.ceil(jaf.clan_maxmember/7)
local m='Members clan | Page '..page
jaf.clan_refreshlist(jaf.clan[id])
    for i=7*page-6, 7*page do
         stmo="OFFLINE"
         v=jaf.clan_membersID[jaf.clan[id]][i]
         for _,im in pairs(player(0,"table")) do
                  if jaf.usgn[im]==v then
                        stmo="ONLINE"
                  end
         end
         if v and v>0 and v==jaf.clan_leader[jaf.clan[id]] then
                shorttxt='['..stmo..']#'..v..' |Leader'
                m=m..','..shorttxt:sub(1,24)
         elseif v and v>0 then
                shorttxt='['..stmo..']#'..v..' '..jaf.clan_membersName[jaf.clan[id]][i]
                m=m..','..shorttxt:sub(1,24)
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
              m = m ..',<|'..jaf.sv_lang(jaf.lang[id],80) 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
              menu(id, m)
end

function jaf.claninvitemenu(id)
                 m="Invitation"
                 for i=1,5 do
                      if jaf.claninvite[id][i]>0 then
                              v=jaf.clan_check(tonumber(jaf.claninvite[id][i]))
                              m=m..",#"..v.leader.."|"..v.name
                      else m=m..","
                      end
                 end
                 menu(id,m)
end

function jaf.clan_refreshlist(clanID)
                jaf.load_clan(nil,clanID)
                z={}
                b={}
                for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                     if jaf.clan_membersID[clanID][i]>0 then
                              z[i]=jaf.clan_membersID[clanID][i]
                              b[i]=jaf.clan_membersName[clanID][i]
                              jaf.clan_membersID[clanID][i]=0
                              jaf.clan_membersName[clanID][i]="X"
                              jaf.clan_listset(clanID,z[i],b[i])
                      end
                 end
end

function jaf.clan_listset(clanID,a,b)
       for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                    if jaf.clan_membersID[clanID][i]<1 then
                             jaf.clan_membersID[clanID][i]=a
                             jaf.clan_membersName[clanID][i]=b
                             jaf.save_clan(clanID)
                             return 1
                    end
                    if jaf.clan_membersID[clanID][i]==a then
                             jaf.save_clan(clanID)
                             return 1
                    end
       end
end

function jaf.clan_check(clanID)
       if clanID~=nil and tonumber(clanID) and clanID>0 then
                 local dirclan=jaf.loclua.."clans/clan"..clanID..".txt"
                 local file = io.open(dirclan:format("clan"..clanID, "r"))
                 if file then
                    local line=file:read()
                    local data=totable(line)
                    local clnmmrck=0
                    line=file:read()
                    for _,i in pairs(totable(line)) do
                        if tonumber(i)>0 then
                           clnmmrck=clnmmrck+1
                        end
                    end
                    file:close()
                    return {true,name=data[1],member=clnmmrck,diamond=tonumber(data[3]),maxmember=tonumber(data[5]+jaf.clan_maxmember),leader=tonumber(data[2]),reputation=tonumber(data[6])}
                 end
                 return {false,name="Nothing",member=0,diamond=0,maxmember=0,leader=0,reputation=0}
       end
       return {false,name="Nothing",member=0,diamond=0,maxmember=0,leader=0,reputation=0}
end

jaf.clanwar_pos={
                  --- {[0]={buttontilex,buttontiley,timewar},...<team-n(xpos,ypos)>}
                  {[0]={152,40,(5*60)},{63,110},{82,121}},
                }
jaf.clanwar_stat={}
jaf.clanwar_clan={}
jaf.clanwar_time={}
jaf.clanwar_score={}
jaf.clanwar_waittime={}

function jaf.clanwar_reset()
         for i=1,#jaf.clanwar_pos do
             jaf.clanwar_stat[i]=0
             jaf.clanwar_clan[i]={}
             jaf.clanwar_score[i]={}
             jaf.clanwar_time[i]=0
             jaf.clanwar_waittime[i]=0
             for ic=1,#jaf.clanwar_pos[i] do
                 jaf.clanwar_clan[i][ic]=0
                 jaf.clanwar_score[i][ic]=0
             end
         end
end

function jaf.clanwar_reward(i,diamon)
         if not tonumber(diamon) then diamon=1000 end
         vc=jaf.clanwar_clan[i]
         vs=jaf.clanwar_score[i]
         vsct=0
         for is=1,#jaf.clanwar_pos[i] do
             vsct=vsct+vs[is]
         end
         for ic=1,#jaf.clanwar_pos[i] do
             jaf.load_clan(nil,vc[ic])
             if vs[ic]>0 and vsct>0 then
               vr=math.floor(vs[ic]/vsct*diamon)
               jaf.clan_diamond[vc[ic]]=jaf.clan_diamond[vc[ic]]+vr
               jaf.clan_reputation[vc[ic]]=jaf.clan_reputation[vc[ic]]+(vr-math.floor(45/100*vr))
               jaf.svj_msg(hijau.."[Clan News] "..abu..""..jaf.clan_name[vc[ic]].." got "..vr.." diamonds from war")
             end
             jaf.save_clan(vc[ic])
         end
end

function jaf.clanwar_resetid(i)
         jaf.clanwar_reward(i,#jaf.clanwar_pos[i]*115)
         cw_sc={}
         cw_cl={}
         cw_scmax=0
         for ic=1,#jaf.clanwar_pos[i] do
             cw_sc[ic]=jaf.clanwar_score[i][ic]
             cw_cl[ic]=jaf.clanwar_clan[i][ic]
             cw_scmax=cw_scmax+cw_sc[ic]
             jaf.clanwar_clan[i][ic]=0
             jaf.clanwar_score[i][ic]=0
         end
         for _,id in pairs(player(0,"table")) do
             if jaf.war[id] and jaf.war[id]==i then
                    jaf.war[id]=0
                    jaf.warset[id]=0
                    parse("setpos "..id.." "..(jaf.clanwar_pos[i][0][1]*32+16).." "..(jaf.clanwar_pos[i][0][2]*32+16))
                    for icc=1,#jaf.clanwar_pos[i] do
                         if cw_sc[icc] and cw_sc[icc]>0 and cw_cl[icc]==jaf.clan[id] then
                              cw_rs=math.floor((cw_sc[icc]/cw_scmax*100)/100*25000)
                              jaf.give_shell(id,cw_rs)
                              jaf.svj_msg2(id,"[Server] "..hijau..""..jaf.sv_lang(jaf.lang[id],120,cw_rs))
                         end
                    end
             end
         end
         jaf.clanwar_stat[i]=0
         jaf.clanwar_time[i]=0
end

function jaf.clanwar_setwarpos(id,p)
         v=jaf.clan[id]
         if jaf.npc_time<1 and v>0 and jaf.war[id]<1 then
            jaf.load_clan(nil,v)
            for i=1,#jaf.clanwar_pos[p] do
                if jaf.clanwar_clan[p] and jaf.clanwar_clan[p][i]==v then
                        jaf.war[id]=p
                        jaf.warset[id]=i
                        parse("setpos "..id.." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][1]*32+16).." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][2]*32+16))
                        jaf.clanwar_waittime[p]=40
                        jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],106))
                        return 1
                end
                if jaf.clanwar_clan[p] and jaf.clanwar_clan[p][i]<1 then
                        jaf.war[id]=p
                        jaf.warset[id]=i
                        jaf.clanwar_clan[p][i]=v
                        parse("setpos "..id.." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][1]*32+16).." "..(jaf.clanwar_pos[jaf.war[id]][jaf.warset[id]][2]*32+16))
                        jaf.clanwar_waittime[p]=40
                        jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],106))
                        return 1
                end
            end
            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],105))
         elseif jaf.war[id]>0 then
            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],107))
         else
            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],25))
         end
end

function jaf.clanwar_checkstart(i)
         if jaf.npc_time>0 then return false end
         v=#jaf.clanwar_pos[i]
         ccs=0
         for cw=1,#jaf.clanwar_pos[i] do
             if jaf.clanwar_clan[i][cw]>0 then
                     ccs=ccs+1
             end
         end
         if jaf.clanwar_stat[i]<1 and ccs>=v then
             jaf.clanwar_stat[i]=1
             jaf.clanwar_time[i]=jaf.clanwar_pos[i][0][3]
         end
end

function jaf.clanwar_checkclancount(i)
         cc=0
         for cw=1,#jaf.clanwar_pos[i] do
             if jaf.clanwar_clan[i][cw]>0 then
                cc=cc+1
             end
         end
         return cc
end

function jaf.clan_list_save(clanIDl)
         if clanIDl~=nil and tonumber(clanIDl) then
            jaf.clan_list_load()
         else
            clanIDl=0
         end
         clanIDl=tonumber(clanIDl)
         local cgtldr=tonumber(jaf.clan_check(clanIDl).leader)
         local cldradm=tonumber(jaf.CheckAdmin(cgtldr))
         if (jaf.clan_list:find(clanIDl)==nil or clanIDl<1) and cldradm<=0 then 
           local file=io.output(io.open(jaf.loclua.."clanlist.txt","w+"))
           local data=""
           if clanIDl~=nil and tonumber(clanIDl) and tonumber(clanIDl)>0 then
             jaf.clan_list=jaf.clan_list.."c"..clanIDl.."l "
             jaf.clan_list_name=jaf.clan_list_name.."n"..jaf.clan_name[clanIDl].."l "
           end
           data=data..jaf.clan_list
           data=data.."\n"
           data=data..jaf.clan_list_name
           data=data.."\n"
           data=data..jaf.clan_list_top

           file:write(data)
	   file:close()
           jaf.clan_top_add(clanIDl)
         end
end

function jaf.clan_list_load()
         local filelocclanlist=jaf.loclua.."clanlist.txt"
         local file = io.open(filelocclanlist)
         if file then
            line=file:read()
            if line~=nil then
               jaf.clan_list=line
            end

            line=file:read()
            if line~=nil then
               jaf.clan_list_name=line
            end

            line=file:read()
            if line~=nil then
               jaf.clan_list_top=line
            end

            file:close()
            return {stat=true,clan=totable(jaf.clan_list)}
         end
         file:close()
         return {stat=false,clan={}}
end

function jaf.clan_list_remove(clanIDl)
         if clanIDl~=nil and not tonumber(clanIDl) then
            return
         end
         local data=""
         clanIDl=tonumber(clanIDl)
         jaf.clan_list_load()
         jaf.clan_list=string.gsub(jaf.clan_list,"c"..clanIDl.."l ","")
         jaf.clan_list=string.gsub(jaf.clan_list,"c"..clanIDl.."l","")
         jaf.clan_list_name=string.gsub(jaf.clan_list_name,"n"..jaf.clan_name[clanIDl].."l ","")
         jaf.clan_list_name=string.gsub(jaf.clan_list_name,"n"..jaf.clan_name[clanIDl].."l","")
         file=io.output(io.open(jaf.loclua.."clanlist.txt","w+"))
         data=data..jaf.clan_list
         data=data.."\n"
         data=data..jaf.clan_list_name
         data=data.."\n"
         data=data..jaf.clan_list_top
         file:write(data)
	 file:close()
end

function jaf.list_id(varalst,md) -- md (1 = id, 2 = name)
         if varalst==nil then return "" end
         if md==1 then
            return tonumber(string.sub(varalst,2,(#varalst-1)))
         elseif md==2 then
            return tostring(string.sub(varalst,2,(#varalst-1)))
         end
end

function jaf.clan_list_menu(id,page)
local v=jaf.clan_list_load()
if v.state==false then return end
local page=page or 1
local pages=math.ceil(#v.clan/7)
local m='Clan List Exists | Page '..page
    for i=7*page-6, 7*page do
         if v.clan[i]~=nil then
                if jaf.clan_name[jaf.list_id(v.clan[i],1)]==nil then
                   jaf.load_clan(nil,jaf.list_id(v.clan[i],1))
                end
                v2=jaf.clan_check(jaf.list_id(v.clan[i],1))
                gtoprk=jaf.clan_top_check(jaf.list_id(v.clan[i],1))
                if gtoprk>0 and jaf.list_id(v.clan[i],1)~=jaf.clan[id] then
                   m=m..','..v2.name..'|#Rank '..gtoprk
                elseif gtoprk>0 then
                   m=m..',('..v2.name..'|#Rank '..gtoprk..')'
                elseif jaf.list_id(v.clan[i],1)~=jaf.clan[id] then
                   m=m..','..v2.name
                else
                   m=m..',('..v2.name..')'
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
              m = m ..',('..jaf.sv_lang(jaf.lang[id],141)..'|'..#totable(jaf.clan_list)..' Clan(s))' 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id, m)
end

function jaf.clan_list_info(id,clanIDl)
         if clanIDl~=nil and not tonumber(clanIDl) then
            return
         end
         mycln=jaf.clan[id]
         clanIDl=tonumber(clanIDl)
         local v=jaf.clan_check(clanIDl)
         if v[1]==false then
            jaf.clan_list_remove(clanIDl)
            jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],38))
         else
            leadnamec="Unknown"
            for i=1,#jaf.clan_membersID[clanIDl] do
                if jaf.clan_membersID[clanIDl][i]==jaf.clan_leader[clanIDl] then
                     leadnamec=jaf.clan_membersName[clanIDl][i]
                     break
                end
            end
            gtprnk=jaf.clan_top_check(clanIDl)
            crqsnt="Send Request"
            crqsrm=""
            if jaf.usgn[id]<=0 then
               crqsnt="(Send Request|Logged User)"
            elseif mycln>0 then
               crqsnt="("..jaf.sv_lang(jaf.lang[id],16)..")"
            elseif jaf.clan_check_member(jaf.usgn[id],clanIDl) then
               crqsnt=jaf.sv_lang(jaf.lang[id],146)
            end
            if jaf.admin[id]>0 then
               crqsrm="Remove from List"
            end
            gtprnkif="(Reputation|"..v.reputation..")"
            if gtprnk>0 then
               gtprnkif="(Reputation|TOP 10 Clans)"
            end
            menu(id,"Clan info,(Name|"..v.name.."),(Clan ID|"..clanIDl.."),(Leader|"..leadnamec.."),(Member|"..v.member.."/"..v.maxmember.."),"..gtprnkif..","..crqsnt..","..crqsrm..",,<|"..jaf.sv_lang(jaf.lang[id],80))
         end
end

function jaf.clan_top_add(clanID)
         if clanID~=nil and not tonumber(clanID) or tonumber(clanID)<=0 then
            return
         end
         clanID=tonumber(clanID)
         jaf.load_clan(nil,clanID)
         jaf.clan_list_load()
         v=totable(jaf.clan_list_top)
         v2,v3,getrank={},{},0
         if #v<=0 then
            jaf.clan_list_top=jaf.clan_list_top..clanID.." "
            jaf.clan_list_save()
         elseif #v>0 then
            gttv3=0
            for i=1,#v do
                if tonumber(v[i])~=clanID then
                   gttv3=gttv3+1
                   v3[gttv3]=tonumber(v[i])
                end
            end
            for i=1,#v do
                if v[i]~=nil and tonumber(v[i])>0 and jaf.clan_reputation[tonumber(v[i])]==nil then
                   jaf.load_clan(nil,tonumber(v[i]))
                end
                if v[i]~=nil and jaf.clan_reputation[clanID]>=jaf.clan_reputation[tonumber(v[i])] then
                   getrank,gc=i,0
                   v2[getrank]=clanID
                   for k=1,10 do
                       if v2[k]==nil then
                          gc=gc+1
                          v2[k]=tonumber(v3[gc])
                       end
                   end
                   break
                elseif #v<10 and v[i+1]==nil then
                    jaf.clan_list_top=jaf.clan_list_top..clanID.." "
                    jaf.clan_list_save()
                    return
                end
            end
         end
        m=""
        if #v2>0 then
           for i=1,#v2 do
               m=m..v2[i].." "
           end
           jaf.clan_list_top=m
           jaf.clan_list_save()
        end
end

function jaf.clan_top_check(clanID,loadmod)
         if loadmod==nil then
            loadmod=true
         end
         if clanID~=nil and not tonumber(clanID) then
            return 0
         end
         clanID=tonumber(clanID)
         if loadmod==true then
            jaf.clan_list_load()
         end
         if string.find(jaf.clan_list_top,clanID) then
            gv=totable(jaf.clan_list_top)
            for i=1,#totable(jaf.clan_list_top) do
                if gv[i]~=nil and tonumber(gv[i]) and tonumber(gv[i])==clanID then
                       return i
                 end
            end
         end
         return 0
end

function jaf.clan_request_add(id,clanID)
         if clanID==nil or tonumber(clanID)==false or tonumber(clanID)<=0 or jaf.usgn[id]<=0 then
            return
         end
         clanID=tonumber(clanID)
         vst=false
         local v=jaf.clan_check(clanID)
         if jaf.clan_request[clanID]==nil then
            vst=jaf.load_clan(nil,clanID)
         else vst=true
         end
         if vst and not string.find(jaf.clan_request[clanID],"c"..jaf.usgn[id].."r") and v.member<v.maxmember then
            jaf.clan_request[clanID]=jaf.clan_request[clanID].."c"..jaf.usgn[id].."r "
            jaf.clan_request_name[clanID]=jaf.clan_request_name[clanID].."c"..string.gsub(player(id,"name")," ","_").."r "
            jaf.save_clan(clanID)
            jaf.svj_msg2(id,"[System] "..hijau..jaf.sv_lang(jaf.lang[id],142,jaf.clan_name[clanID]))
         elseif vst and v.member>=v.maxmember then
            jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],19))
         elseif vst and string.find(jaf.clan_request[clanID],"c"..jaf.usgn[id].."r") then
            jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],143,jaf.clan_name[clanID]))
         else
            jaf.svj_msg2(id,"[System] "..merah..jaf.sv_lang(jaf.lang[id],38))
         end
end

function jaf.clan_req_menu(id,page)
local v=totable(jaf.clan_request[jaf.clan[id]])
local v2=totable(jaf.clan_request_name[jaf.clan[id]])
local page=page or 1
local pages=math.ceil(#v/7)
local m='Request List | Page '..page
    for i=7*page-6, 7*page do
         local k=tonumber(jaf.list_id(v[i],1))
         if k~=nil and k>0 then
                local getname="NoName"
                if v2[i]~=nil then
                   getname=jaf.list_id(v2[i],2)
                end
                m=m..','..string.sub(getname,1,15)..'|#'..k
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
              m = m ..',<|'..jaf.sv_lang(jaf.lang[id],80) 
         else
              m = m ..','..jaf.sv_lang(jaf.lang[id],6)..'|'..langpage..' '..(page-1)..'' 
         end
         menu(id, m)
end

function jaf.clan_req_info(id,usgnID)
        if usgnID==nil or tonumber(usgnID)==false or tonumber(usgnID)<=0 then
           return 
        end
        sttcc=jaf.clan_check_member(usgnID,jaf.clan[id])
        local tkmbr="Accept to join"
        if sttcc==true then
           tkmbr="(Already in Clan)"
        end
        local ud=jaf.checkuserdata(usgnID)
        if ud.clanid>0 then
           tkmbr="(He has a Clan)"
        end
        local mxexp=(ud.level*jaf.exp_perlevel)
        local mexp=" ("..math.floor(ud.exp/mxexp*100).."%)"
        local plang=ud.langid
        local pname=jaf.list_id(totable(jaf.clan_request_name[jaf.clan[id]])[jaf.btnset[id]],2)
        menu(id,"Player Request Check,(Name|"..pname.."),(Level|"..ud.level..""..mexp.."),(Phone number|"..ud.phonenumber.."),(Language|"..jaf.lang_list[plang].lang.."),"..tkmbr..",Denied from Clan,,,<|"..jaf.sv_lang(jaf.lang[id],80))
end

function jaf.clanjoin(id,clanID,usgnID,nameku)
             jaf.load_clan(nil,clanID)
             local usgnID=tonumber(usgnID)
             local clanID=tonumber(clanID)
             if usgnID and usgnID>0 and jaf.checkuserdata(usgnID).clanid<=0 then
                 if jaf.clanmembers(clanID)<jaf.clan_maxmember+jaf.clan_memplus[clanID] then
                         for i=1,jaf.clan_maxmember+jaf.clan_memplus[clanID] do
                          if jaf.clan_membersID[clanID][i] and jaf.clan_membersID[clanID][i]<=0 then
                             jaf.clan_membersID[clanID][i]=usgnID
                             jaf.clan_membersName[clanID][i]=string.gsub(nameku," ","_")
                             jaf.save_clan(clanID)
                             if id~=nil then
                                jaf.svj_msg2(id,hijau..jaf.sv_lang(jaf.lang[id],145))
                             end
                             return 1
                          end
                         end
                  else
                         jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],34))
                  end
            elseif usgnID and usgnID>0 and jaf.checkuserdata(usgnID).clanid>0 then
                 jaf.svj_msg2(id,merah..jaf.sv_lang(jaf.lang[id],20))
            end
end

function jaf.clan_symbolcolorm(id)
         local cmid=jaf.clan[id]
         if jaf.clan_markimg[cmid]>0 and jaf.clan_markcolor[cmid]~=nil then
            local mc=jaf.clan_markcolor[cmid]:gsub("k"," ")
            local mt=totable(mc)
            menu(id,"Clan Symbol Color,Red +5|"..mt[1]..",Green +5|"..mt[2]..",Blue +5|"..mt[3]..",,Neutral,(Be Careful!),,,<|"..jaf.sv_lang(jaf.lang[id],80))
         else
            msg2(id,merah.."Failed!")
         end
end