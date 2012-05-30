-- ��˫������ʱ��ҩˮ
-- ����һ��ҩˮ��

--�ű���
x300048_g_scriptId = 300048
x300048_g_ItemId = 30008017

x300048_g_BuffPalyer_25 = 60
x300048_g_BuffAll_15 = 62
x300048_g_BuffPet_25 = 61
x300048_g_BuffPet_2 = 53

--**********************************
--�¼��������
--**********************************
function x300048_OnDefaultEvent( sceneId, selfId, nItemIndex )

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300048_g_BuffPalyer_25) == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"�������Ѿ������˸���Ч�ʵĶ౶����ʱ�䣡")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x300048_g_BuffAll_15) == 1   then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,x300048_g_scriptId);
			UICommand_AddInt(sceneId,nItemIndex)
			UICommand_AddString(sceneId,"EatMe");
			UICommand_AddString(sceneId,"�������Ѿ������˶౶����ʱ�䣬�Ƿ�ȷ��ʹ�ã�");
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 24)

		return
	end
	
	x300048_UseItem( sceneId, selfId, nItemIndex)

end

function x300048_IsSkillLikeScript( sceneId, selfId)
	return 0
end

--**********************************
--
--**********************************
function x300048_EatMe( sceneId, selfId, nItemIndex)
	x300048_UseItem( sceneId, selfId, nItemIndex)
end


--**********************************
-- 
--**********************************
function x300048_UseItem( sceneId, selfId, nItemIndex)
	-- �ȼ����� nItemIndex ����Ʒ�ǲ��Ǻ͵�ǰ�Ķ�Ӧ��
	if GetItemTableIndexByIndex(sceneId, selfId, nItemIndex) ~= x300048_g_ItemId  then
		BeginEvent(sceneId)
			AddText(sceneId,"  �����ڲ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	--1��������ǲ��ǵ�ǰ�����ϵ�˫������ʱ���Ƕ��٣�����ﵽ���ޣ��Ͳ���ʹ��
	local nCurHaveTime = DEGetMoneyTime(sceneId, selfId)
	
	if nCurHaveTime >= 95*60*60   then
		BeginEvent(sceneId)
			AddText(sceneId,"  ����ǰʹ�á��߼����鵤����õ�˫������ʱ���Ѿ��������ޡ�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����ʹ�������Ʒ��������
	local ret = EraseItem(sceneId, selfId, nItemIndex)
	
	-- ����ʱ��
	local nCurTime = LuaFnGetCurrentTime()

	if ret == 1    then
		DESetMoneyTime(sceneId, selfId, nCurHaveTime + 3600*5 )
		
		-- �����ҵ�ǰ��˫������ʱ���Ǳ�����ģ������һ����ʾ
		if 1 == DEIsLock(sceneId, selfId)  then
			DESetLock( sceneId, selfId, 0 )
			BeginEvent(sceneId)
				AddText(sceneId,"�������˫��ʱ���Ѿ��ⶳ����������5Сʱ��˫������ʱ�䡣")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		else
			BeginEvent(sceneId)
				AddText(sceneId,"��������5��Сʱ��˫������ʱ�䡣")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
		
	else
		BeginEvent(sceneId)
			AddText(sceneId,"��Ʒ����ʹ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
	
	-- ͬ�����ݵ��ͻ���
	SendDoubleExpToClient(sceneId,selfId)
	
end

