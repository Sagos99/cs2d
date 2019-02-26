function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


a=initArray(133)

max = 133
nome2 = ""
nome3 = ""
nome4 = ""
nome5 = ""

a[1]  = "a"
a[2]  = "e"
a[3]  = "i"
a[4]  = "o"
a[5]  = "u"
a[24] = "r"
a[25] = "s"
a[26] = "x"
a[45] = "h"
a[46] = "m"
a[47] = "n"
a[131] = "ck"
a[132] = "ch"
a[133] = "l"

a[6]  = "ba"
a[7]  = "be"
a[8]  = "bi"
a[9]  = "bo"
a[10] = "bu"
a[11] = "bão"

a[12] = "ca"
a[13] = "ce"
a[14] = "ci"
a[15] = "co"
a[16] = "cu"
a[17] = "cão"

a[18] = "da"
a[19] = "de"
a[20] = "di"
a[21] = "do"
a[22] = "du"
a[23] = "dão"

a[27] = "fa"
a[28] = "fe"
a[29] = "fi"
a[30] = "fo"
a[31] = "fu"
a[32] = "fão"

a[33] = "ga"
a[34] = "ge"
a[35] = "gi"
a[36] = "go"
a[37] = "gu"
a[38] = "gão"

a[39] = "ja"
a[40] = "je"
a[41] = "ji"
a[42] = "jo"
a[43] = "ju"
a[44] = "jão"

a[42] = "ka"
a[48] = "ke"
a[49] = "ki"
a[50] = "ko"
a[51] = "ku"
a[52] = "kão"

a[53] = "la"
a[54] = "le"
a[55] = "li"
a[56] = "lo"
a[57] = "lu"
a[58] = "lão"

a[59] = "ma"
a[60] = "me"
a[61] = "mi"
a[62] = "mo"
a[63] = "mu"
a[64] = "mão"

a[65] = "na"
a[66] = "ne"
a[67] = "ni"
a[68] = "no"
a[69] = "nu"
a[70] = "não"

a[71] = "pa"
a[72] = "pe"
a[73] = "pi"
a[74] = "po"
a[75] = "pu"
a[76] = "pão"

a[77] = "qua"
a[78] = "que"
a[79] = "qui"
a[80] = "quo"
a[81] = "qu"
a[82] = "quão"

a[83] = "ra"
a[84] = "re"
a[85] = "ri"
a[86] = "ro"
a[87] = "ru"
a[88] = "rão"

a[89] = "sa"
a[90] = "se"
a[91] = "si"
a[92] = "so"
a[93] = "su"
a[94] = "são"

a[95] = "ta"
a[96] = "te"
a[97] = "ti"
a[98] = "to"
a[99] = "tu"
a[100] = "tão"

a[101] = "va"
a[102] = "ve"
a[103] = "vi"
a[104] = "vo"
a[105] = "vu"
a[106] = "vão"

a[107] = "wa"
a[108] = "we"
a[109] = "wi"
a[110] = "wo"
a[111] = "wu"
a[112] = "wão"

a[113] = "xa"
a[114] = "xe"
a[115] = "xi"
a[116] = "xo"
a[117] = "xi"
a[118] = "xão"

a[119] = "ya"
a[120] = "ye"
a[121] = "yi"
a[122] = "yo"
a[123] = "yu"
a[124] = "yão"

a[125] = "za"
a[126] = "ze"
a[127] = "zi"
a[128] = "zo"
a[129] = "zu"
a[130] = "zão"

addhook("serveraction","gerar")
function gerar(id,act)
if act == 1 then
maximo = math.random(2,5)
nome2 = ""
nome3 = ""
nome4 = ""
nome5 = ""
criar = 0

if criar < maximo then
b = math.random(1,max)
nome2 = a[b]
criar = criar+1
end

if criar < maximo then
b = math.random(1,max)
nome3 = a[b]
criar = criar+1
end

if criar < maximo then
b = math.random(1,max)
nome4 = a[b]
criar = criar+1
end

if criar < maximo then
b = math.random(1,max)
nome5 = a[b]
criar = criar+1
end

msg2(id,"©255255255O Nome Gerado Foi:©255000000 "..nome2..""..nome3..""..nome4..""..nome5)
end
end