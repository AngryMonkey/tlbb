
function x333000_OnDefaultEvent( sceneId, selfId, bagIndex )	
	local value = GetBagItemParam( sceneId, selfId, bagIndex, 0, 2 )	
	local nMoneyMax = 9990000
	
	-- �쳣���
	-- Ǯ�Ƿ񳬹��������
	if value > nMoneyMax then
		value = nMoneyMax
	end
	
	-- �Ƿ�����Ʊ
	local nItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, bagIndex)	
	if nItemID ~= 30001000 then
		return 0
	end
	
	local ret = EraseItem( sceneId, selfId, bagIndex )	
	-- ɾ��ʧ��
	if ret ~= 1 then
		return 0
	end
	AddMoney( sceneId, selfId, value )
	
end

function x333000_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
