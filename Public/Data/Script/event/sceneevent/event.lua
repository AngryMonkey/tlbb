--212126


function x212126_CheckAllXinfaLevel(sceneId, selfId, level)
	
	local nMnpai = GetMenPai(sceneId, selfId)
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMnpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	
	return 1
	
end
