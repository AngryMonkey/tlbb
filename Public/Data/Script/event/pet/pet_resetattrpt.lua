-- ����ϴ��

-- �ű���
x800107_g_ScriptId = 800107;

x800107_g_resetptItemDataID = 30503021;	--���޵�

--**********************************
-- ������ں���
--**********************************
function x800107_OnDefaultEvent(sceneId, selfId, targetId)
	--����ϴ��
	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, targetId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 800107);
end

--**********************************
-- �о��¼�
--**********************************
function x800107_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x800107_g_ScriptId, "����ϴ��" , 6, -1);
end

--**********************************
-- ����ϴ��
--**********************************
function x800107_ResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L, itemPos)
	if not sceneId or not selfId or not petGUID_H or not petGUID_L or not itemPos then
		return 0;
	end
	
	local checkPet = LuaFnIsPetAvailableByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not checkPet or checkPet ~= 1 then
		x800107_ShowTips(sceneId, selfId, "���ܶԳ�ս�����������޽��в�����");
		return 0;
	end

	local checkRet = LuaFnCheckResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L);
	if not checkRet or checkRet ~= 1 then
		return 0;
	end

	--�� ������������С����޵���	��Ҫ�����޵���
	local itemDataID = GetItemTableIndexByIndex(sceneId, selfId, itemPos);
	if not itemDataID or itemDataID ~= x800107_g_resetptItemDataID then
		x800107_ShowTips(sceneId, selfId, "��Ҫ���޵���");
		return 0;
	end
	
	local itemAvailable = LuaFnIsItemAvailable(sceneId, selfId, itemPos);
	if not itemAvailable or itemAvailable ~= 1 then
		x800107_ShowTips(sceneId, selfId, "���ܲ��������������޵���");
		return 0;
	end
	
	local eraseRet = LuaFnEraseItem(sceneId, selfId, itemPos);
	if not eraseRet or eraseRet ~= 1 then
		x800107_ShowTips(sceneId, selfId, "�������޵�ʧ�ܡ�");
		return 0;
	end

	local ret = LuaFnResetPetAttrPt(sceneId, selfId, petGUID_H, petGUID_L);
	if not ret or ret ~= 1 then
		return 0;
	end
	x800107_ShowTips(sceneId, selfId, "����ϴ��ɹ���");
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
	return 1;
end

--**********************************
-- ��ʾ��Ϣ
--**********************************
function x800107_ShowTips(sceneId, selfId, tipMsg)
	BeginEvent(sceneId);
		AddText(sceneId, tipMsg);
	EndEvent(sceneId);
	DispatchMissionTips(sceneId, selfId);
end
