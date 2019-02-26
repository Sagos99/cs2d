
function initArray(m,k)
       local array = {}
       if k==nil then k=0 end
       for i = 0, m do
               array[i]=k
       end
       return array
end

function totable(t,match)
	local cmd = {}
	if not match then match = "[^%s]+" end
	for word in string.gmatch(t, match) do
		table.insert(cmd, word)
	end 
	return cmd 
end

function totable2(t,match)
	local cmd = {}
        local tblc=0
	if not match then match = "[^%s]+" end
	for word in string.gmatch(t, match) do
		cmd["'..word..'"]=tblc
	end 
	return cmd 
end

__timerArg={}
function timerEx(ms,func,count,...)
	count=count or 1
	if count==0 then count=-1 end
	local tmpfunc,id="",0
	for i=1,8 do
		local rand=math.random(0,2)
		if rand==0 then
			tmpfunc=tmpfunc..string.char(math.random(65,90))
		elseif rand==1 then
			tmpfunc=tmpfunc..string.char(math.random(97,112))
		else
			tmpfunc=tmpfunc..math.random(0,9)
		end
	end
	table.insert(__timerArg,{type(func),tmpfunc,func,{...},count})
	for n,v in pairs(__timerArg) do
		if v[2]==tmpfunc then
			id=n
			break
		end
	end
	_G[tmpfunc]=function(id)
		id=tonumber(id)
		if __timerArg[id][1]=="function" then
			__timerArg[id].r=__timerArg[id][3](unpack(__timerArg[id][4]))
		elseif __timerArg[id][1]=="string" or __timerArg[id][1]=="number" then
			__timerArg[id].r=loadstring("return "..__timerArg[id][3].."(unpack(__timerArg["..id.."][4]))")()
		end
		__timerArg[id][5]=__timerArg[id][5]-1
		if __timerArg[id][5]==0 then
			_G[__timerArg[id][2]]=nil
			__timerArg[id]=nil
		end
	end
	timer(ms,tmpfunc,id,count)
	return id
end

function freetimerEx(id)
	if __timerArg[id]~=nil then
		freetimer(__timerArg[id][2],id)
		_G[__timerArg[id][2]]=nil
		__timerArg[id]=nil
		return true
	end
	return false
end
-------------------==================----------------------

--- hudtxt used = 41 // last for hud Achievement get
--- hudtxt empty = nil

------color------- Indonesian language
hitam = "©000000000"
putih = "©255255255"
hitam = "©000000000"
hijau = "©000555000"
hijau2 = "©0  128  0"
merah = "©255000000"
abu = "©191191191"
emas = "©255215000"
biru = "©30 144255"
biru2 = "©0  0  255"
coklat = "©15075   0"
ungu = "©191  0255"
kuning = "©255255  0"
nila = "©111  0255"
oren = "©255127  0"
ungu2 = "©128  0128"
violet = "©233130238"
coklat2 = "©160 82 45"
cyan = "©000255255"
------end--------

jaf={}
jaf.loclua="sys/lua/JAF-OtherWorld/"
jaf.locsfx="sfx/JAF/otherworld/"
jaf.locgfx="gfx/JAF/otherworld/"
jaf.rcon_password="kurangicepatkan9"
jaf.sv_name="Adventure - Other World"
jaf.sv_password="berjuang"
jaf.sv_maintenance=false
dofile(jaf.loclua.."language.txt")
dofile(jaf.loclua.."quest.lua")

parse("sv_gamemode 1")
parse("mp_deathdrop 4")
parse("mp_dropgrenades 0")
parse("mp_idleaction 4")
parse("sv_maxplayers 32")
parse("mp_teamkillpenalty 0")
parse("mp_kickpercent 0")
parse("mp_autoteambalance 0")
parse("sv_friendlyfire 0")
parse("mp_infammo 1")
parse("sv_rconusers ")
parse("mp_maxrconfails 99999999")
parse("sv_name "..jaf.sv_name)
parse("sv_rcon "..jaf.rcon_password)
parse("sv_password ")
parse("sv_hostport 36960")
parse("sv_usgnonly 0")
parse("mp_hud 100")
parse('mp_building_limit "dispenser" 99999')
parse('mp_building_limit "turret"99999')
parse('mp_building_limit "supply"99999')
parse('mp_building_limit "gate field" 99999')
parse('mp_building_limit "wall I" 99999')
parse('mp_building_limit "wall II" 99999')
parse('mp_building_limit "wall III" 99999')
parse('mp_building_limit "barbed wire" 99999')
parse('mp_building_limit "Barricade" 99999')
parse('mp_building_limit "teleporter exit" 99999')
parse('mp_building_limit "teleporter entrance" 99999')
parse('sv_forcelight 0')
parse('mp_pinglimit 7000')
parse('mp_hudscale 1')
jaf.exp_perlevel=3350
jaf.inventory_max_default=30
jaf.max_sms=80
jaf.maxitem_img=6
jaf.timesay=3
jaf.AFKsettime=60
jaf.serverminutes=0
jaf.itemdropcleartime=45 --- in minute
jaf.trademax=40
jaf.broad_time=45 ------ time for use broadcast
jaf.broadT=0
jaf.checkadminactive=false --- checking active staff(true = enable, false = disable)
jaf.server_sec=0
jaf.server_hour=0
jaf.server_lastcheckadmin="Nothing"
jaf.maxstafftimeactive=(17*3600) --- the max time must the staff admin active(in sec)
jaf.stafftimetocheck=(7*24)  --- time for check the active staff(in hour)
jaf.sv_bublestat=false --- (true = show bubles, false = hide bubles)
jaf.sv_possavepoint=true --- (spawn at saved possition)
jaf.daycycle_status=false --- day-night effect
jaf.daycycle_timecheck=1 --- (1 = day, 0 = night)
jaf.daycycle_lastime=0
jaf.svj_msgMAX=8
jaf.svj_msgMAXWORDS=65
jaf.svj_croptimemax=12
jaf.svj_weatherstat=false
jaf.svj_npc_stime=0
jaf.svj_npc_zombiec=0
jaf.svj_npc_headcrabc=0
jaf.svj_npc_snarkc=0
jaf.svj_uptimemax=30
jaf.sv_maxlevel=105
jaf.sv_plarealist={}
jaf.sv_imgalphafix=true --- to fix bug from dedicated server linux 1.0.0.4

----- car project -----
jaf.sv_cartileframe=176 --- frame that car able to move
jaf.sv_carimg=nil
jaf.sv_caruser={}
jaf.sv_cargo=0
jaf.sv_carmoverot=0
jaf.sv_carpos={0,0}

--- Note for opening server:
--- Bubles will make your server more lag, i suggest for disable it
--- More monsters more lag
--- Dont using GarbageCollector system, it will make your server being lag(timeout)
--- i recomended for enable the "checkadminactive" system for remove fake admin
--- Developer rank is higest rank here

jaf.logoIMG=nil
jaf.statusIMG={}
jaf.buttonIMG={}
jaf.itemdrop={}
jaf.itemdroplvl={}
jaf.itemdropx={}
jaf.itemdropy={}
jaf.itemdroppos={}
jaf.itemdropIMG={}
jaf.tradelistsel={}
jaf.sv_objid={}
jaf.usgn=initArray(32)
jaf.lang=initArray(32)
jaf.admin=initArray(32)
jaf.bubleIMG=initArray(32)
jaf.save_posx=initArray(32)
jaf.save_posy=initArray(32)
jaf.shell=initArray(32)
jaf.level=initArray(32)
jaf.exp=initArray(32)
jaf.barIMG=initArray(32)
jaf.bar2IMG=initArray(32)
jaf.items=initArray(32)
jaf.aitems=initArray(32)
jaf.btnitem=initArray(32)
jaf.jfnIMG=initArray(32)
jaf.mouseX=initArray(32)
jaf.mouseY=initArray(32)
jaf.mouseSX=initArray(32)
jaf.mouseSY=initArray(32)
jaf.btnset=initArray(32)
jaf.clan=initArray(32)
jaf.claninvite=initArray(32)
jaf.phonepass=initArray(32)
jaf.phonesms=initArray(32)
jaf.smsto=initArray(32)
jaf.phonenum=initArray(32)
jaf.itemIMG=initArray(32)
jaf.itemSEL=initArray(32)
jaf.health=initArray(32)
jaf.maxhealth=initArray(32)
jaf.itemSPEED=initArray(32)
jaf.itemHP=initArray(32)
jaf.itemDMG=initArray(32)
jaf.itemDEF=initArray(32)
jaf.saytime=initArray(32)
jaf.AFKIMG=initArray(32)
jaf.AFKtime=initArray(32)
jaf.btnposIMG=initArray(32)
jaf.petx=initArray(32)
jaf.pety=initArray(32)
jaf.btnbuy=initArray(32)
jaf.btnbuyc=initArray(32)
jaf.userlicense=initArray(32)
jaf.userlictag=initArray(32)
jaf.tradestat=initArray(32)
jaf.tradeitem=initArray(32)
jaf.tradetgt=initArray(32)
jaf.tradepreitem=initArray(32)
jaf.pet_target=initArray(32)
jaf.pet_montarget=initArray(32)
jaf.pet_stop=initArray(32)
jaf.targetmon=initArray(32)
jaf.invplus=initArray(32)
jaf.JAFmember=initArray(32)
jaf.myinfoIMG=initArray(32)
jaf.crystal=initArray(32)
jaf.godmode=initArray(32)
jaf.info_target=initArray(32)
jaf.war=initArray(32)
jaf.warset=initArray(32)
jaf.itemSKILLTIME=initArray(32)
jaf.itemSKILLIMG=initArray(32)
jaf.quest_stat=initArray(32)
jaf.quest_item=initArray(32)
jaf.btnq=initArray(32)
jaf.btnqs=initArray(32)
jaf.btnqc=initArray(32)
jaf.btn2_IMG=initArray(32)
jaf.quest_info=initArray(32)
jaf.wpnimghand=initArray(32)
jaf.pmtgt=initArray(32)
jaf.pmtgt2=initArray(32)
jaf.infoplayer=initArray(32)
jaf.stat2_IMG=initArray(32)
jaf.btnq_eid=initArray(32) --- event-id
jaf.ramadhanE=initArray(32)
jaf.moremenu2=initArray(32)
jaf.btnevent=initArray(32)
jaf.antilag=initArray(32)
jaf.joninet=initArray(32)
jaf.getnet=initArray(32)
jaf.netgetdata=initArray(32)
jaf.netdata=initArray(32)
jaf.getsubnet=initArray(32)
jaf.getnetsearch=initArray(32)
jaf.connectplus=initArray(32)
jaf.getnetimage=initArray(32)
jaf.netimage=initArray(32)
jaf.adminonlinetime=initArray(32)
jaf.inv_page=initArray(32)
jaf.achvmenu2=initArray(32)
jaf.achvID=initArray(32)
jaf.achvstat=initArray(32)
jaf.achvstatIMG=initArray(32)
jaf.preparespawn=initArray(32)
jaf.svj_msgid=initArray(32,{})
jaf.netscroll=initArray(32)
jaf.tradepay=initArray(32)
jaf.imgskillcharg=initArray(32,{})
jaf.inet_loadfinish=initArray(32,0)
jaf.realarmor_id=initArray(32,{0,0})
jaf.moremenu_entity=initArray(32)
jaf.getentitypos=initArray(32,{0,0})
jaf.moremenu_removeclan=initArray(32)
jaf.handwpn=initArray(32,2)
jaf.spawnon=initArray(32,false)
jaf.moremenu_buy=initArray(32)
jaf.morebuy_icount=initArray(32,0)
jaf.morebuy_iimg=initArray(32)
jaf.morebuy_mmark=initArray(32)
jaf.btnbuy_reqitem=initArray(32,{})
jaf.craftex_time=initArray(32,0)
jaf.craftex_timemax=initArray(32,0)
jaf.craftex=initArray(32,0)
jaf.cropstat=initArray(32,false)
jaf.croppos=initArray(32,{tx=0,ty=0})
jaf.croptime=initArray(32,0)
jaf.healthtimetofill=initArray(32)
jaf.fishingstatus=initArray(32,0)
jaf.fishgetimg=initArray(32)
jaf.fishingtimer=initArray(32,0)
jaf.fishingtimer2=initArray(32,0)
jaf.fishingpos=initArray(32,{0,0})
jaf.bankstats=initArray(32,0)
jaf.bank=initArray(32,0)
jaf.jobid=initArray(32,0)
jaf.jobtime=initArray(32,0)
jaf.bankerc=initArray(32,0) -- banker costumers
jaf.houseid=initArray(32,0)
jaf.prahouseid=initArray(32,0)
jaf.newyearE=initArray(32,0)
jaf.banktra=initArray(32,0)
jaf.banktrusgn=initArray(32,0)
jaf.jailsel=initArray(32,0)
jaf.jailtime=initArray(32,0)
jaf.devilwarE=initArray(32,0)
jaf.galaxyE=initArray(32,0)
jaf.tradebuya=initArray(32,1)
jaf.montarget=initArray(32,0)
jaf.classbtn=initArray(32,0)
jaf.classbtnimg=initArray(32,0)
jaf.classtime1=initArray(32,0)
jaf.classtime2=initArray(32,0)
jaf.energy=initArray(32,100)
jaf.stunt=initArray(32,0)
jaf.classgetturn=initArray(32,0)
jaf.itemLVL=initArray(32)
jaf.itemSELID=initArray(32)
jaf.freetrialplay=initArray(32,0)
jaf.moremenu_up=initArray(32)
jaf.up_itemid1=initArray(32,0)
jaf.up_itemid2=initArray(32,0)
jaf.up_imgplus=initArray(32,{})
jaf.up_time=initArray(32,0)
jaf.up_itemslot=initArray(32,0)
jaf.pl_mute=initArray(32,0)
jaf.pl_drun=initArray(32,0)
jaf.rajawalie=initArray(32,0)
jaf.spiritce=initArray(32,0)
jaf.menukuya=initArray(32,0)
jaf.itemidcolor=initArray(32,0)
jaf.checkinvplnya=initArray(32,0)
jaf.jonise=initArray(32,0)
jaf.freezeme=initArray(32,0)
jaf.myquestlist=initArray(32,{})
jaf.questoncela=initArray(32,0)
jaf.wpnpointku=initArray(32,0)
jaf.galaxyE2=initArray(32,0)
jaf.mytutor=initArray(32,{0,0})
jaf.mytutorimg=initArray(32,nil)
jaf.mytutormenu=initArray(32,nil)
jaf.drug_time=initArray(32,0)
jaf.drug_img=initArray(32,nil)
jaf.joinarenaid=initArray(32,0)
jaf.areameid=initArray(32,0)
jaf.hhE=initArray(32,0)
jaf.dayreward=initArray(32,0)
jaf.dayrewardm=initArray(32,0)
jaf.dayrewarda=initArray(32,0)
jaf.dayrewardt=initArray(32,0)
jaf.dayrewardr=initArray(32,0)
jaf.ismelag=initArray(32,nil)
jaf.ismelagt=initArray(32,0)
jaf.mylossitem=initArray(32,{})
jaf.mylossitema=initArray(32,{})
jaf.mylossiteml=initArray(32,{})
jaf.mylossitemm=initArray(32,nil)
jaf.timeritemc=initArray(32,{})
jaf.plnpctalkyoum=initArray(32,nil)
jaf.plnpctalkyouimg=initArray(32,nil)
jaf.plnpctalkyout=initArray(32,{})
jaf.plnpctalkyouc=initArray(32,1)
jaf.plnpctalkyounn=initArray(32,"No Name")
jaf.skilltemppos=initArray(32,{x1=170+105,y1=449,x2=212+105,y2=449})
jaf.skilltemp1=initArray(32,nil)
jaf.skilltemp2=initArray(32,nil)
jaf.skilltmoveid=initArray(32,0)
jaf.freeitemb=initArray(32,0)
jaf.indendE=initArray(32,0)
jaf.clanmarkimg=initArray(32,nil)
jaf.mycountryname=initArray(32,"None")
jaf.npcpressedid=initArray(32,0)
jaf.talkwithbot=initArray(32,false)
jaf.killstreak=initArray(32,0)
jaf.clansimbol=initArray(32,1)
jaf.showitemidc=initArray(32,{})
jaf.areanameshow=initArray(32,"Unknown")
jaf.oldsaveposx=initArray(32,0)
jaf.oldsaveposy=initArray(32,0)
jaf.saveposx=initArray(32,0)
jaf.saveposy=initArray(32,0)
jaf.presavepos=initArray(32,{0,0})
jaf.steam=initArray(32,0)
jaf.shadowve=initArray(32,0)
jaf.class_evovampiret=initArray(32,0)
jaf.owlogo=initArray(32,nil)

function jaf.svj_msg(txt)
         msg(txt)
end

function jaf.svj_msg2(i,txt)
         msg2(i,txt)
end


function jaf.reset(id)
         jaf.steam[id]=tonumber(player(id,"steamid"))
         jaf.shadowve[id]=0
         jaf.owlogo[id]=nil
         jaf.class_evovampiret[id]=0
         jaf.presavepos[id]={0,0}
         jaf.oldsaveposx[id]=0
         jaf.oldsaveposy[id]=0
         jaf.saveposx[id]=0
         jaf.saveposy[id]=0
         jaf.areanameshow[id]="Unknown"
         jaf.talkwithbot[id]=false
         jaf.indendE[id]=0
         jaf.showitemidc[id]={}
         jaf.clansimbol[id]=1
         jaf.killstreak[id]=0
         jaf.npcpressedid[id]=0
         jaf.mycountryname[id]="None"
         jaf.clanmarkimg[id]=nil
         jaf.freeitemb[id]=0
         jaf.skilltemppos[id]={x1=170+105,y1=449,x2=212+105,y2=449}
         jaf.skilltemp1[id]=nil
         jaf.skilltemp2[id]=nil
         jaf.npctalkhudremove(id)
         jaf.skilltmoveid[id]=0
         jaf.plnpctalkyounn[id]="No Name"
         jaf.plnpctalkyouc[id]=1
         jaf.plnpctalkyoum[id]=nil
         jaf.plnpctalkyouimg[id]=nil
         jaf.plnpctalkyout[id]={}
         jaf.mylossitem[id]={}
         jaf.mylossitema[id]={}
         jaf.mylossiteml[id]={}
         jaf.timeritemc[id]={}
         jaf.mylossitemm[id]=nil
         jaf.ismelag[id]=nil
         jaf.ismelagt[id]=0
         jaf.hhE[id]=0
         jaf.dayreward[id]=0
         jaf.dayrewardm[id]=nil
         jaf.dayrewarda[id]=nil
         jaf.dayrewardt[id]=0
         jaf.dayrewardr[id]=0
         jaf.joinarenaid[id]=0
         jaf.areameid[id]=0
         jaf.drug_time[id]=0
         jaf.drug_img[id]=nil
         jaf.mytutormenu[id]=nil
         jaf.mytutorimg[id]=nil
         jaf.mytutor[id]=0
         jaf.pl_drun[id]=0
         jaf.galaxyE2[id]=0
         jaf.wpnpointku[id]=0
         jaf.questoncela[id]=0
         jaf.jonise[id]=0
         jaf.myquestlist[id]={}
         jaf.freezeme[id]=0
         jaf.checkinvplnya[id]=0
         jaf.itemidcolor[id]=0
         jaf.menukuya[id]=nil
         jaf.rajawalie[id]=1
         jaf.spiritce[id]=1
         jaf.freetrialplay[id]=0
         jaf.up_itemslot[id]=0
         jaf.itemLVL[id]={}
         jaf.invplus[id]=0
         jaf.up_itemid1[id]=0
         jaf.up_itemid2[id]=0
         jaf.up_imgplus[id]={}
         jaf.up_time[id]=0
         jaf.usgn[id]=player(id,"usgn")
         jaf.lang[id]=0
         jaf.admin[id]=0
         jaf.save_posx[id]=0
         jaf.save_posy[id]=0
         jaf.bubleIMG[id]={}
         for i=1,10 do
                jaf.bubleIMG[id][i]=nil
         end
         jaf.shell[id]=0
         jaf.level[id]=1
         jaf.exp[id]=0
         jaf.barIMG[id]={}
         jaf.bar2IMG[id]={}
         for i,i2 in pairs(jaf.hudIMG_list.bar) do
                  jaf.barIMG[id][i]=nil
         end
         for i,i2 in pairs(jaf.hudIMG_list.bar2) do
                  jaf.bar2IMG[id][i]=nil
         end
         jaf.items[id]={}
         jaf.aitems[id]={}
         for i=1,jaf.inventory_max_default+jaf.invplus[id] do
                jaf.items[id][i]=0
                jaf.aitems[id][i]=0
         end
         jaf.btnitem[id]=0
         jaf.jfnIMG[id]=nil
         jaf.mouseX[id]=0
         jaf.mouseY[id]=0
         jaf.mouseSX[id]=0
         jaf.mouseSY[id]=0
         jaf.btnset[id]=0
         jaf.clan[id]=0
         jaf.phonenum[id]=0
         jaf.phonepass[id]=nil
         jaf.claninvite[id]={}
         jaf.phonesms[id]={}
         jaf.smsto[id]=0
         jaf.health[id]=0
         jaf.maxhealth[id]=0
         jaf.itemIMG[id]={}
         jaf.itemSPEED[id]=0
         jaf.itemHP[id]=0
         jaf.itemDMG[id]=0
         jaf.itemDEF[id]=0
         jaf.saytime[id]=0
         jaf.AFKIMG[id]=nil
         jaf.AFKtime[id]=0
         jaf.btnposIMG[id]=nil
         jaf.itemSEL[id]={}
         jaf.petx[id]=0
         jaf.pety[id]=0
         jaf.btnbuy[id]={}
         jaf.btnbuyc[id]=0
         jaf.userlicense[id]=0
         jaf.userlictag[id]=0
         jaf.tradestat[id]=0
         jaf.tradetgt[id]=0
         jaf.pet_target[id]=0
         jaf.pet_stop[id]=0
         jaf.tradepreitem[id]=nil
         jaf.targetmon[id]=0
         jaf.JAFmember[id]=0
         jaf.crystal[id]=0
         jaf.godmode[id]=0
         jaf.info_target[id]=0
         jaf.war[id]=0
         jaf.warset[id]=0
         jaf.classgetturn[id]=0
         jaf.itemSKILLTIME[id]=0
         jaf.itemSKILLIMG[id]={}
         jaf.myinfoIMG[id]=nil
         jaf.tradeitem[id]={}
         jaf.quest_stat[id]={}
         jaf.quest_item[id]={}
         jaf.btnq[id]={}
         jaf.btn2_IMG[id]={}
         jaf.btnqc[id]=1
         jaf.quest_info[id]=0
         jaf.wpnimghand[id]=0
         jaf.pmtgt[id]=0
         jaf.pmtgt2[id]=0
         jaf.infoplayer[id]=1
         jaf.btnq_eid[id]=nil
         jaf.stat2_IMG[id]={}
         jaf.ramadhanE[id]=0
         jaf.moremenu2[id]=nil
         jaf.btnevent[id]=0
         jaf.antilag[id]=0
         jaf.pet_montarget[id]=0
         jaf.joninet[id]=nil
         jaf.getnet[id]=0
         jaf.netgetdata[id]=0
         jaf.netdata[id]=0
         jaf.getsubnet[id]=0
         jaf.connectplus[id]=0
         jaf.getnetsearch[id]=""
         jaf.getnetimage[id]=nil
         jaf.netimage[id]={}
         jaf.adminonlinetime[id]=0
         jaf.inv_page[id]=1
         jaf.preparespawn[id]=0
         jaf.achvmenu2[id]=nil
         jaf.achvID[id]=0
         jaf.achvstat[id]={}
         jaf.svj_msgid[id]={}
         jaf.netscroll[id]=1
         jaf.achvstatIMG[id]=nil
         jaf.tradepay[id]=0
         jaf.imgskillcharg[id]={}
         jaf.inet_loadfinish[id]=0
         jaf.realarmor_id[id]={0,0}
         jaf.moremenu_entity[id]=nil
         jaf.moremenu_removeclan[id]=nil
         jaf.moremenu_buy[id]=nil
         jaf.moremenu_up[id]=nil
         jaf.handwpn[id]=2
         jaf.spawnon[id]=false
         jaf.morebuy_iimg[id]=nil
         jaf.morebuy_icount[id]=0
         jaf.morebuy_mmark[id]=nil
         jaf.craftex_time[id]=0
         jaf.craftex_timemax[id]=0
         jaf.craftex[id]=0
         jaf.cropstat[id]=false
         jaf.croppos[id]={tx=0,ty=0}
         jaf.croptime[id]=0
         jaf.fishingstatus[id]=0
         jaf.fishgetimg[id]=nil
         jaf.fishingtimer[id]=nil
         jaf.fishingtimer2[id]=nil
         jaf.classbtn[id]=0
         jaf.classbtnimg[id]={}
         jaf.classtime1[id]=0
         jaf.classtime2[id]=0
         jaf.fishingpos[id]={0,0}
         jaf.bankstats[id]=0
         jaf.bank[id]=0
         jaf.healthtimetofill[id]=180
         jaf.jobid[id]=0
         jaf.jobtime[id]=0
         jaf.houseid[id]=0
         jaf.prahouseid[id]=0
         jaf.newyearE[id]=0
         jaf.devilwarE[id]=0
         jaf.banktra[id]=0
         jaf.banktrusgn[id]=0
         jaf.jailsel[id]=0
         jaf.jailtime[id]=0
         jaf.galaxyE[id]=0
         jaf.montarget[id]=0
         jaf.tradebuya[id]=1
         jaf.energy[id]=100
         jaf.stunt[id]=0
         jaf.pl_mute[id]=0
         jaf.btnbuy_reqitem[id]={}
         jaf.itemSELID[id]={}
         jaf.getentitypos[id]={0,0}
         for i=1,#jaf.achv_list do
             jaf.achvstat[id][i]=0
         end
         for i,i2 in pairs(jaf.hudIMG_list.status2) do
             jaf.stat2_IMG[id][i]=nil
         end
         for i,i2 in pairs(jaf.hudIMG_list.btn2) do
             jaf.btn2_IMG[id][i]=nil
         end
         for i=1,jaf.trademax do
               jaf.tradeitem[id][i]=nil
         end
         for i=1,jaf.maxitem_img do
               jaf.itemIMG[id][i]=nil
               jaf.itemSEL[id][i]=0
               jaf.itemSELID[id][i]=0
         end
         for i=1,5 do
             jaf.claninvite[id][i]=0
         end
         if jaf.usgn[id]>0 and jaf.steam[id]<=0 then
         for _,i in pairs(player(0,"table")) do
             if i~=id and jaf.usgn[i]>0 and jaf.usgn[i]==jaf.usgn[id] then
                      jaf.usgn[id]=0
                      return 1
             end
         end
         end
         if jaf.steam[id]>0 then
         for _,i in pairs(player(0,"table")) do
             if i~=id and jaf.steam[i]>0 and jaf.steam[i]==jaf.steam[id] then
                      jaf.steam[id]=0
                      return 1
             end
         end
         if jaf.steam[id]>0 then jaf.usgn[id]=jaf.steam[id] end
         end
         jaf.load(id,jaf.usgn[id])
end

jaf.data_saveload={[1]={jaf.lang,1},[2]={jaf.oldsaveposx,1},[3]={jaf.oldsaveposy,1},
                   [4]={jaf.shell,1},[5]={jaf.level,1},[6]={jaf.exp,1},
                   [7]={jaf.clan,1},[8]={jaf.phonenum,1},[9]={jaf.userlicense,1},
                   [10]={jaf.invplus,1},[11]={jaf.JAFmember,1},
                   [12]={jaf.crystal,1},[13]={jaf.ramadhanE,1},
                   [14]={jaf.connectplus,1},[15]={jaf.handwpn,1},
                   [16]={jaf.bankstats,1},[17]={jaf.jobid,1},
                   [18]={jaf.newyearE,1},[19]={jaf.jailsel,1},
                   [20]={jaf.jailtime,1},[21]={jaf.devilwarE,1},
                   [22]={jaf.galaxyE,1},[23]={jaf.freetrialplay,1},
                   [24]={jaf.pl_mute,1},[25]={jaf.rajawalie,1},
                   [26]={jaf.spiritce,1},[27]={jaf.jonise,1},
                   [28]={jaf.galaxyE2,1},[29]={jaf.hhE,1},
                   [30]={jaf.dayreward,0},[31]={jaf.freeitemb,1},
                   [32]={jaf.indendE,1},[33]={jaf.clansimbol,1},
                   [34]={jaf.saveposx,1},[35]={jaf.saveposy,1},
                   [36]={jaf.shadowve,1},
                  }

---- data_saveload code, 1 = tonumber, 0 = tostring

function jaf.save_datanya(id)
        if id~=nil and tonumber(id)~=nil and id>0 and (jaf.usgn[id]>0 or jaf.steam[id]>0) then
                  local data_sel=jaf.data_saveload
                  local w_data=""
                  local diraku=jaf.loclua.."Users/"..jaf.usgn[id]..".txt"
                  if jaf.steam[id]>0 then
                     diraku=jaf.loclua.."Users/s"..jaf.steam[id]..".txt"
                  end
                  local gfile = io.output(io.open(diraku,"w+"))
                  for i=1,#data_sel do
                      if data_sel[i]~=nil then
                       w_data=w_data..""..data_sel[i][1][id].." "
                      else
                       w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for g=1,jaf.inventory_max_default+jaf.invplus[id] do
                      if jaf.items[id][g]~=nil then
                         if jaf.itemLVL[id][g]==nil or jaf.itemLVL[id][g]<=0 then
                             w_data=w_data..""..jaf.items[id][g].." "
                         elseif jaf.itemLVL[id][g]~=nil then
                             w_data=w_data..""..jaf.items[id][g].."lvl"..jaf.itemLVL[id][g].." "
                         else
                             w_data=w_data..""..jaf.items[id][g].." "
                         end
                      else
                         w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for g=1,jaf.inventory_max_default+jaf.invplus[id] do
                      if jaf.aitems[id][g]~=nil then
                          w_data=w_data..""..jaf.aitems[id][g].." "
                      else
                          w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for g=1,5 do
                      if jaf.claninvite[id][g]~=nil then
                         w_data=w_data..""..jaf.claninvite[id][g].." "
                      else
                         w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for g=1,#jaf.achv_list do
                      if jaf.achvstat[id][g]~=nil then
                          w_data=w_data..""..jaf.achvstat[id][g].." "
                      else
                          w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for i=1,jaf.maxitem_img do
                      if jaf.itemSEL[id][i]~=nil then
                         w_data=w_data..""..jaf.itemSEL[id][i].." "
                      else
                          w_data=w_data.."0 "
                      end
                  end
                  w_data=w_data.."\n"
                  for i=1,jaf.maxitem_img do
                      if jaf.itemSELID[id][i]~=nil then
                         w_data=w_data..""..jaf.itemSELID[id][i].." "
                      else
                          w_data=w_data.."0 "
                      end
                  end
               gfile:write(w_data)
               gfile:close()
               jaf.bank_save(id)
        end
end

function jaf.load(id,usgn)
       jaf.preparespawn[id]=0
       local usgn=jaf.usgn[id]
       local steam=jaf.steam[id]
       if usgn~=nil and (usgn>0 or steam>0) then
                 jaf.bank_load(id,usgn)
                 local dir=jaf.loclua.."Users/%s.txt"
                 local file=false
                 if steam>0 then
                    file = io.open(dir:format("s"..steam, "r"))
                    jaf.admin[id]=jaf.CheckAdmin(0,steam)
                 else
                    file = io.open(dir:format(usgn, "r"))
                    jaf.admin[id]=jaf.CheckAdmin(usgn)
                 end
                 local dataR=0
                 if file then
                      local line=file:read()
                      local data=totable(line)
                      data_sel=jaf.data_saveload
                      for i=1,#data do
                          if data[i] and data_sel[i][2]==1 then
                             data_sel[i][1][id]=tonumber(data[i])
                          elseif data[i] and data_sel[i][2]==0 then
                             data_sel[i][1][id]=tostring(data[i])
                          end
                      end

                      line=file:read()
                      data=totable(line)
                      local dataC=0
                      for i=1,jaf.inventory_max_default+jaf.invplus[id] do
                           dataC=dataC+1
                           dataR=data[dataC]
                           if dataR~=nil then
                              if string.find(dataR,"lvl") then
                                 jaf.items[id][i]=tonumber(string.sub(dataR,1,(string.find(dataR,"lvl")-1)))
                                 jaf.itemLVL[id][i]=tonumber(string.sub(dataR,(string.find(dataR,"lvl")+3)))
                              else
                                 jaf.items[id][i]=tonumber(dataR)
                              end
                              if jaf.list_items[jaf.items[id][i]]~=nil and jaf.list_items[jaf.items[id][i]].timer~=nil and jaf.list_items[jaf.items[id][i]].timer then
                                 jaf.timeritemc[id][jaf.items[id][i]]=i
                              end
                           end
                      end

                      line=file:read()
                      data=totable(line)
                      dataC=0
                      for i=1,jaf.inventory_max_default+jaf.invplus[id] do
                           dataC=dataC+1
                           dataR=tonumber(data[dataC])
                           if dataR~=nil then jaf.aitems[id][i]=dataR end
                      end

                      line=file:read()
                      data=totable(line)
                      dataC=0
                      for i=1,5 do
                           dataC=dataC+1
                           dataR=tonumber(data[dataC])
                           if dataR~=nil then jaf.claninvite[id][i]=dataR else jaf.claninvite[id][i]=0 end
                      end

                      line=file:read()
                      data=totable(line)
                      dataC=0
                      for i=1,#jaf.achv_list do
                           dataC=dataC+1
                           dataR=tonumber(data[dataC])
                           if dataR~=nil then jaf.achvstat[id][i]=dataR end
                      end

                      line=file:read()
                      if line~=nil then
                      data=totable(line)
                      dataC=0
                      for i=1,jaf.maxitem_img do
                           dataC=dataC+1
                           dataR=tonumber(data[dataC])
                           if dataR~=nil then jaf.itemSEL[id][i]=dataR end
                      end
                      end

                      line=file:read()
                      if line~=nil then
                      data=totable(line)
                      dataC=0
                      for i=1,jaf.maxitem_img do
                           dataC=dataC+1
                           dataR=tonumber(data[dataC])
                           if dataR~=nil then jaf.itemSELID[id][i]=dataR end
                      end
                      end

                      jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],1))
                 else
                      jaf.internet_publiccomment_input(player(id,"name").." is new player here")
                      jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],2))
                 end
                 if jaf.jobid[id]>0 and jaf.jobinfo[jaf.jobid[id]]~=nil then
                     if jaf.jobinfo[jaf.jobid[id]].salarytime~=nil and jaf.jobinfo[jaf.jobid[id]].salarytime then
                        jaf.jobtime[id]=jaf.jobinfo[jaf.jobid[id]].salarytime
                     else
                        jaf.jobtime[id]=0
                     end
                 end
                 jaf.load_clan(id,jaf.clan[id])
       else
            jaf.svj_msg2(id,"[System] "..merah..""..jaf.sv_lang(jaf.lang[id],3))
       end
       if jaf.admin[id]>0 then
            ----- jaf.admintime_load(id,jaf.usgn[id])
            jaf.svj_msg2(id,"[System] "..hijau..""..jaf.sv_lang(jaf.lang[id],4))
       end
end

function jaf.CheckAdmin(ausgn,steam)
        local usgn=ausgn
        if steam~=nil and steam>0 then usgn="s"..steam end
	local filename =jaf.loclua.."Admin.txt"
	local file = io.open(filename)
	if file then
		for line in file:lines() do
			local parses = totable(line)
			if parses[1] ~= nil then
				if tostring(usgn)==parses[1] then
					if tonumber(parses[2]) ~= nil then
						return tonumber(parses[2])
					else
						return 1
					end
				end
			end
		end
		if file ~= nil then
			file:close()
		end
	end		
	return 0
end

function jaf.bank_save(id)
         if jaf.usgn[id]>0 and jaf.bankstats[id]>0 then
              local dir=jaf.loclua.."bank/"..jaf.usgn[id]..".txt"
              local file = io.output(io.open(dir,"w+"))
              file:write(jaf.bank[id])
              file:close()
        end
end

function jaf.bank_load(id,usgn)
           if usgn~=nil and usgn>0 then
              local dir=jaf.loclua.."bank/%s.txt"
              local file = io.open(dir:format(usgn, "r"))
              if file then
                 local line=file:read()
                 local data=tonumber(line)
                 if data~=nil then
                     jaf.bank[id]=data
                     file:close()
                     return data
                 end
                 file:close()
                 return 0
              else
                 return false
              end
           end
end

function jaf.banker_transfer(id,tbusgn,tbamount)
         if tbusng==nil or tonumber(tbusgn)==nil or tbusgn<=0 or tbamount==nil or  tonumber(tbamount)==nil or tbamount<=0 then return false end
         if tonumber(id)==nil or (not player(id,"exists")) or jaf.bank[id]<tbamount then
            if jaf.bank[id]<tbamount then
               msg2(id,kuning.."[BANK] "..merah.."Not enough balance!")
            else
               msg2(id,kuning.."[BANK] "..merah.."Failed for some reason")
            end
            return false
         end
         local ckpsv=false
         for _,i in pairs(player(0,"tableliving")) do
             if jaf.usgn[i]==tbusgn then ckpsv=i break end
         end
         if ckpsv then
            if jaf.bankstats[ckpsv]>=1 then
               jaf.bank[id]=jaf.bank[id]-tbamount
               jaf.bank[i]=jaf.bank[i]+tbamount
            end
         else
            local dir=jaf.loclua.."bank/%s.txt"
            local file = io.open(dir:format(tbusgn, "r"))
            local ckpsva=0
            if file then
               jaf.bank[id]=jaf.bank[id]-tbamount
               local line=file:read()
               ckpsva=tonumber(line)
               ckpsva=ckpsva+tbamount
               file:close()
               local dir=jaf.loclua.."bank/"..tbusgn..".txt"
               local file = io.output(io.open(dir,"w+"))
               file:write(ckpsva)
               file:close()
               msg2(id,kuning.."[BANK] "..oren.."Transfer "..tbamount.." Bank balance to usgn "..tbusgn.." is succes.")
            end
         end
end