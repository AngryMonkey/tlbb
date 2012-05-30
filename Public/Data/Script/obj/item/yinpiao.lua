
function x333000_OnDefaultEvent( sceneId, selfId, bagIndex )	
	local value = GetBagItemParam( sceneId, selfId, bagIndex, 0, 2 )	
	local nMoneyMax = 9990000
	
	-- 异常检查
	-- 钱是否超过最高上限
	if value > nMoneyMax then
		value = nMoneyMax
	end
	
	-- 是否是银票
	local nItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, bagIndex)	
	if nItemID ~= 30001000 then
		return 0
	end
	
	local ret = EraseItem( sceneId, selfId, bagIndex )	
	-- 删除失败
	if ret ~= 1 then
		return 0
	end
	AddMoney( sceneId, selfId, value )
	
end

function x333000_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
