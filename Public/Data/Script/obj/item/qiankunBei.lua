-- 300057
-- ������ ʹ��

--�ű���
x300057_g_scriptId = 300057

x300057_g_ItemId = 30008033

x300057_g_BuffId = 8500
x300057_g_BuffId_1 = 57

--**********************************
--�¼��������
--**********************************
function x300057_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- ��������� 8500 ���� 57 ��BUFF �Ͳ����ٳ����ҩ
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300057_g_BuffId) == 1 or
		 LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300057_g_BuffId_1) == 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"ֻ�е��Զ���ȡ��ƷЧ����ʧ֮�����ʹ�á�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	x300057_UseItem( sceneId, selfId, nItemIndex)
end

function x300057_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
-- 
--**********************************
function x300057_UseItem( sceneId, selfId, nItemIndex)
	
	-- �ȼ����� nItemIndex ����Ʒ�ǲ��Ǻ͵�ǰ�Ķ�Ӧ��
	local nItemId = GetItemTableIndexByIndex(sceneId, selfId, nItemIndex)
	if nItemId ~= x300057_g_ItemId   then
		BeginEvent(sceneId)
			AddText(sceneId,"  �����ڲ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ��һ��ҩ
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300057_g_BuffId, 100 )
		--BeginEvent(sceneId)
		--	AddText(sceneId,"��������һ��Сʱ�ĳ���˫������ʱ�䡣")
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"��Ʒ����ʹ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end


