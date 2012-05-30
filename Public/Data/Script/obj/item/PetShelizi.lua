--����������

x300077_g_scriptId = 300077
x300077_g_bagIndex = -1	
x300077_g_hugeExp = 1500000
--**********************************
--�¼��������
--**********************************
function x300077_OnDefaultEvent( sceneId, selfId, bagIndex )

	local slzExp = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --EXP
	
	local PetGuidH , PetGuidL = LuaFnGetCurrentPetGUID(sceneId, selfId)

	if PetGuidH == nil or PetGuidL == nil then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081113_18}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	if IsPilferLockFlag(sceneId, selfId)  == -1 then
		return
	end
	
	local petLevel		 = LuaFnGetPetLevelByGUID(sceneId, selfId , PetGuidH , PetGuidL)	
	local PetToHumanMaxLevel = GetPetMaxLevelToHuman(sceneId, selfId , PetGuidH , PetGuidL)
	local PetExp		 = GetPet_ExpByGUID(sceneId, selfId , PetGuidH , PetGuidL)
	
	if petLevel >= PetToHumanMaxLevel then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081126_2}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end


	local levelCanUp = 0;
	local tmpExp = PetExp + slzExp
	
	local expToLevel = LuaFnGetPetNeedExp(sceneId, selfId, petLevel)	
	
	while tmpExp > expToLevel do
		levelCanUp = levelCanUp + 1	
		tmpExp = tmpExp - expToLevel
		expToLevel = LuaFnGetPetNeedExp(sceneId, selfId, petLevel + levelCanUp)
	end

	x300077_g_bagIndex = bagIndex

	BeginUICommand(sceneId);
		UICommand_AddInt(sceneId, slzExp);
		UICommand_AddInt(sceneId, levelCanUp);
		UICommand_AddInt(sceneId, petLevel);
		UICommand_AddInt(sceneId, PetToHumanMaxLevel);
		UICommand_AddInt(sceneId, PetGuidH);
		UICommand_AddInt(sceneId, PetGuidL);
		UICommand_AddInt(sceneId, bagIndex)
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 300077);	

end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300077_IsSkillLikeScript( sceneId, selfId)
	return 0; --����ű���Ҫ����֧��
end

function x300077_UseShelizi(sceneId, selfId , bagIndex)
	
	if LuaFnGetItemTableIndexByIndex(sceneId, selfId , bagIndex) ~= 30900058 then
		return
	end
	
	local slzExp = GetBagItemParam(sceneId, selfId, bagIndex, 4, 2) --EXP

	if slzExp < 0 then
		return
	end	
	local PetGuidH , PetGuidL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	if PetGuidH == nil or PetGuidL == nil then
		BeginEvent(sceneId)
			AddText(sceneId,"#{ZSKSSJ_081113_18}")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local itemInfo = GetBagItemTransfer(sceneId, selfId ,bagIndex)
	if EraseItem(sceneId, selfId, bagIndex) > 0 then
		
		PetAddExp(sceneId, selfId,slzExp)
		local str = format("#{ZSKSSJ_081126_3}%d#{ZSKSSJ_081126_4}" ,slzExp )
		BeginEvent(sceneId)
			AddText(sceneId,str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		if slzExp > x300077_g_hugeExp then
			local PetName = LuaFnGetPetTransferByGUID(sceneId, selfId ,PetGuidH , PetGuidL)
			local PlayerName = GetName(sceneId, selfId)
			local strText = format("#{_INFOUSR%s}#{ZSD_1}#{_INFOMSG%s}#{ZSD_2}#{_INFOMSG%s}#{ZSD_3}%d#{ZSD_4}" ,PlayerName,itemInfo,PetName,slzExp)
			AddGlobalCountNews( sceneId, strText)
		end
	end
end
