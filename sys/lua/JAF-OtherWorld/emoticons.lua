-----
-- Emoticons for CS2D by HÃ¤ppy C@mper
--
HC_EMOTICONS = {
    ["^[:=8][-^o]?[)%]3>]$"]            = "smiling", -- :)
    ["^%^[_]?%^$"]                      = "smiling", -- ^_^
    ["^[:=8][-^o]?[D]$"]                = "smiling_big", -- :D
    ["^[:=8][-^o]?[(%[]$"]              = "frowning", -- :(
    ["^[;][-^o]?[)%]D]$"]               = "winking", -- ;)
    ["^[xX][-^o]?[D]+$"]                = "laughing", -- xD
    ["^[lL1][oOöÖ0]+[lL1]+[sSzZ]*%??$"] = "laughing", -- lol
    ["^[hH][aAeEoOöÖ][hH][aAeEoOöÖ]$"]  = "laughing", -- hehe
    ["^[rR][oOï¿½ï¿½0]+[fF][lL1]+$"]    = "laughing", -- rofl
    ["^[:=8xX][-^o]?[pPbq]$"]           = "cheeky", -- :P
    ["^[:=8xX]['][-^o]?%($"]            = "crying", -- :'(
    ["^[;][-]?%($"]                     = "crying", -- ;(
    ["^D[-^o]?[:=8xX]$"]                = "crying", -- Dx
    ["^T[_.-]?T$"]                      = "crying", -- T_T
    ["^[:=8][-^o]?[oO0]$"]              = "surprised", -- :O
    ["^[oO0][_.-]?[oO0]$"]              = "surprised", -- O_o
    ["^[oO0][mM][gG]$"]                 = "surprised", -- omg
    ["^[:=8][-^o]?[/\\]$"]              = "skeptical", -- :/
    ["^[:=8][-^o]?[sS]$"]               = "uneasy", -- :S
    ["^>[:=8;][-^o]?[)%]D]$"]           = "evil", -- >:D
    ["^>[_.-]<$"]                       = "angry", -- >_<
    ["^>[:=8;][-^o]?[(%[]$"]            = "angry", -- >:(
    ["^<3$"]                            = "heart" -- <3
}
HC_EMOTICON_LINGER_TIME = 3
HC_EMOTICON_FADE_IN_STEP = 0.30
HC_EMOTICON_FADE_OUT_STEP = 0.20
HC_EMOTICON_OPACITY = 0.60
HC_EMOTICON_PATH = "gfx/JAF/Smile/"
function hc_emoticons_init()
addhook("say", "hc_say_hook")
addhook("leave", "hc_leave_hook")
hc_smiling_players = {}
hc_emoticons = {}
for i = 1, 32 do
hc_emoticons[i] = {}
end
end
hc_emoticons_init()
function hc_leave_hook(p, reason)
if hc_emoticons[p].smiley_time ~= nil then
freeimage(hc_emoticons[p].emoticon)
freeimage(hc_emoticons[p].speechbubble)
for i, id in ipairs(hc.chat.smiling_players) do
 if id == p then
                table.remove(hc.chat.smiling_players, i)
break
end
end
end
hc_emoticons[p] = {}
end
function hc_say_hook(p, text)
if text=="rank" or text=="Rank" then return 0 end
if player(p, "team") ~= 3 and player(p, "health") > 0 then
hc_check_for_smileys(p, text)
return 1
else
return 1
end
end
function hc_check_for_smileys(p, message)
for word in string.gmatch(message, "[^%s]+") do
for smiley, emoticon in pairs(HC_EMOTICONS) do
if word:match(smiley) then
hc_show_emoticon(p, emoticon)
return 1
 end
end
end
end
function hc_show_emoticon(p, emoticon)
 if hc_emoticons[p].emoticon ~= nil then
freeimage(hc_emoticons[p].emoticon)
else
table.insert(hc_smiling_players, p)
hc_emoticons[p].speechbubble = image(HC_EMOTICON_PATH .. "speechbubble.png", 0, 0, 200 + p)
hc_emoticons[p].alpha = HC_EMOTICON_FADE_IN_STEP
end
hc_emoticons[p].smiley_time = os.time()
hc_emoticons[p].emoticon = image(HC_EMOTICON_PATH .. emoticon .. ".png", 0, 0, 200 + p)
    imagealpha(hc_emoticons[p].speechbubble, hc_emoticons[p].alpha)
 imagealpha(hc_emoticons[p].emoticon, hc_emoticons[p].alpha)
end