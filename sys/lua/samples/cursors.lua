--------------------------------------------------
-- Cursor Script by Unreal Software             --
-- 10.03.2011 - www.UnrealSoftware.de           --
-- Shows cursors of all players                 --
--------------------------------------------------

if sample==nil then sample={} end
sample.cursors={}
sample.cursors.i = {}
sample.cursors.updaterate=150													-- Update rate in ms (fast updates may lead to lags!)

-----------------------
-- INITIAL SETUP     --
-----------------------
timer(sample.cursors.updaterate,"sample.cursors.requestdata","",0)				-- Timer to request updates
function sample.cursors.setup()
	-- Create cursor graphics for all players
	for i=1,32 do
		sample.cursors.i[i] = image("gfx/sprites/flare2.bmp",-10000,-10000,3)	-- Create image
		imagecolor(sample.cursors.i[i],255,255,0)								-- Make image yellow
		imageblend(sample.cursors.i[i],1)										-- Make image glow
		imagealpha(sample.cursors.i[i],0.5)										-- Decrease glow strength
		imagescale(sample.cursors.i[i],0.3,0.3)									-- Decrease image size
	end
end
sample.cursors.setup()

-----------------------
-- STARTROUND        --
-----------------------
addhook("startround","sample.cursors.startround")
function sample.cursors.startround()
	sample.cursors.setup()
end

-----------------------
-- Request Data      --
-----------------------
function sample.cursors.requestdata()
	-- Request absolute cursor positions (2) off ALL players (0)
	reqcld(0,2) -- (reqcl = request client data)
end

-----------------------
-- Incoming Data     --
-----------------------
addhook("clientdata","sample.cursors.clientdata")
function sample.cursors.clientdata(id,mode,x,y)
	-- Change image position if incoming data is absolute cursor position (2)
	if (mode==2) then
		if player(id,"bot")==false then
			--imagepos(sample.cursors.i[id],x,y,0) -- use this for direct position change
			tween_move(sample.cursors.i[id],sample.cursors.updaterate,x,y) -- use this for smooth position change (using a movement tween)
		end
	end
end