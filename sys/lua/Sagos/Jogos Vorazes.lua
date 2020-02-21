function initArray(m)
	local array = {}
	for i = 1, m 
	do array[i]=0
	end
		return array
end 


awp_balas=initArray(32)


addhook("attack","balas")
function balas(id)

end