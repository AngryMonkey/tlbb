--��װ��

function x801015_OnService( sceneId, selfId, itemId, platformType )
--һЩ�����ж�
--����
--���
	local tArray = {}
	tArray[1] = {0}
	tArray[2] = {1,2,3,4,5,14,15}
	tArray[3] = {6,7,11,12,13}
	
	local tArray_Text = {"����ֻ̨������������","����ֻ̨��������ߡ�","����ֻ̨��������Ʒ��"}
	local tArray_Ability = {"����","����","����"}
	local nLevel =GetBagItemLevel(sceneId, selfId,itemId)
	local EquipType = LuaFnGetBagEquipType(sceneId, selfId, itemId)
	local find = 0

	for i, item in tArray[platformType] do
		if item == EquipType then
			find =1
		end
	end
	
	if find == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,tArray_Text[platformType])
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	if nLevel < 40 then
		BeginEvent(sceneId)
		AddText(sceneId,"ֻ����������ȼ�>=40����װ��")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	ret = DoRepair( sceneId, selfId, itemId, platformType )

	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"��װ���޷��ٴ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -2 then
		BeginEvent(sceneId)
		AddText(sceneId,"���"..tArray_Ability[platformType].."���ܵȼ�����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -3 then
		BeginEvent(sceneId)
		AddText(sceneId,"û���㹻�Ļ���")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -4 then
		BeginEvent(sceneId)
		AddText(sceneId,"�ܲ��ң����޸������У��������������ã�ʹ���#{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."}����Щ��ĥ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	elseif ret == -5 then
		BeginEvent(sceneId)
		AddText(sceneId,"��������г���δ֪����")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == -6 then
		BeginEvent(sceneId)
		AddText(sceneId,"��Ʒû���𺦣���������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif ret == 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"�����㾫�ĵ��޸������#{_ITEM"..LuaFnGetItemTableIndexByIndex(sceneId,selfId,itemId).."}�Ѿ��޺��ˡ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		Msg2Player(  sceneId, selfId,"����"..floor(nLevel/10+5).."����",MSG2PLAYER_PARA )
	end
	
end
