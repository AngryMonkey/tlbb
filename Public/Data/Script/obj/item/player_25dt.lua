-- ����2.5����ʱ��ҩˮ

--�ű���
x300046_g_scriptId = 300046
x300046_g_ItemId = 30008014
x300046_g_BuffId = 60

x300046_g_BuffPalyer_25 = 60
x300046_g_BuffAll_15 = 62
x300046_g_BuffPet_25 = 61
x300046_g_BuffPet_2 = 53

--**********************************
--�¼��������
--**********************************
function x300046_OnDefaultEvent( sceneId, selfId, nItemIndex )

	-- ������Լ����Ͳ����ٳ�
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300046_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ�ʹ���˶౶����ҩ�����Ч����ʧ����ʹ�á�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ������������ ˫������ʱ��  ����ʾ���Ҫ��Ҫ��
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	if nCurHaveTime > 0  and  DEIsLock(sceneId, selfId)~=1  then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300046_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"�������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ��ʹ�ã�");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300046_g_BuffAll_15) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300046_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"�������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ���滻��");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)
		return
	end
	x300046_UseItem( sceneId, selfId, nItemIndex)
end

function x300046_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300046_EatMe( sceneId, selfId, nItemIndex)
	x300046_UseItem( sceneId, selfId, nItemIndex)
end

--**********************************
-- 
--**********************************
function x300046_UseItem( sceneId, selfId, nItemIndex)
	-- �ȼ����� nItemIndex ����Ʒ�ǲ��Ǻ͵�ǰ�Ķ�Ӧ��
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300046_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  �����ڲ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	-- ��һ��ҩ
	local ret = EraseItem(sceneId, selfId, nItemIndex)

	if ret == 1   then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x300046_g_BuffId, 100 )
		BeginEvent(sceneId)
			AddText(sceneId,"��������һ��Сʱ������2.5����ʱ�䡣")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"��Ʒ����ʹ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
	end
end

