-------------------------------------------------------------
----------------------Script By Sagoswins--------------------
-------------------------------------------------------------

addhook("hit","mostradano")
function mostradano(id,source,weapon,hpdmg)
parse("hudtxt2 "..source.." 11 \"-"..hpdmg.." HP\" 300 300 0")
parse("hudtxtcolorfade "..source.." 11 0 0 255")
parse("hudtxtalphafade "..source.." 11 1500 0")
parse("hudtxt2 "..id.." 12 \"-"..hpdmg.." HP\" 300 315 0")
parse("hudtxtcolorfade "..id.." 12 0 255 0")
parse("hudtxtalphafade "..id.." 12 1500 0")
end