--�����޻��������ҹ���޻������������޻����

--�ű���
x300003_g_scriptId = 300003

--�����
x300003_g_MissionId = 637

--��Ʒ���
x300003_g_ItemId1 = 40002087		--�����޻����
x300003_g_ItemId2 =	40002088		--��ҹ���޻����
x300003_g_ItemId3 =	40002089		--������޻����
x300003_g_ItemId4 = 40002090		--��������ָʾ
--**********************************
--ˢ���¼�
--**********************************
function x300003_OnDefaultEvent( sceneId, selfId, BagIndex )
	--�ж��Ƿ��ж����޻����
	if (HaveItem (sceneId,selfId,x300003_g_ItemId1) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"��Ҫ�����޻����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--�ж��Ƿ��ж����޻����
	if (HaveItem (sceneId,selfId,x300003_g_ItemId2) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"��Ҫ��ҹ���޻����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--�ж��Ƿ���
	if (HaveItem (sceneId,selfId,x300003_g_ItemId3) < 0 ) then
		BeginEvent(sceneId)
			AddText(sceneId,"��Ҫ������޻����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--������������ָʾ
	BeginAddItem(sceneId)
		AddItem( sceneId,x300003_g_ItemId4, 1 )
	ret = EndAddItem(sceneId,selfId)
	if ret >0 then 
		AddItemListToHuman(sceneId,selfId)
		BeginEvent(sceneId)
			AddText(sceneId,"��õ�����������ָʾ1/1")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		--��������ɱ�־��Ϊ1
		misIndex = GetMissionIndexByID(sceneId,selfId,x300003_g_MissionId)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if num == 0 then
			SetMissionByIndex(sceneId,selfId,misIndex,0,0)
		end
		--ɾ��3�������
		DelItem( sceneId, selfId, x300003_g_ItemId1, 1 )
		DelItem( sceneId, selfId, x300003_g_ItemId2, 1 )
		DelItem( sceneId, selfId, x300003_g_ItemId3, 1 )
	else
		BeginEvent(sceneId)
			AddText(sceneId,"û�б����ռ�")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
end


function x300003_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

