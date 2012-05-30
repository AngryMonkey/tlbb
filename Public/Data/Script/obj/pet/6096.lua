-- ����ͨ�ù��ܽű�
x336096_g_petCommonId = PETCOMMON

--�ű���
x336096_g_scriptId = 336096


--�ű�

--**********************************
-- ��ȡ������ID
--**********************************
function x336096_GetPetBookId(sceneId, selfId)
	local ItemIndexInBag, PetBookId = nil, nil
	ItemIndexInBag = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)	--��ȡ���＼�����ڱ�����Index
	PetBookId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndexInBag) --��ȡ���＼����ID
	
	return PetBookId
end

--**********************************
--���뷵�� 1 ������ȷִ����������
--**********************************
function x336096_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x336096_OnConditionCheck( sceneId, selfId )
	--���Item�Ƿ���Ч
	if(LuaFnVerifyUsedItem(sceneId, selfId) == 0) then
		return 0;	--Item��Чֱ�ӷ���
	end
	
	--���ʹ�ö�����Ч��
	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petGUID_H, petGUID_L);
	if checkAvailable and checkAvailable ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x336096_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x336096_OnActivateOnce( sceneId, selfId )

	local PetBookId = x336096_GetPetBookId(sceneId, selfId) --��ȡ���＼����ID
	local SkillId = GetPetBookSkillID(sceneId,PetBookId)	--��ȡ���＼�����Ӧ����ID
	
	if -1 == SkillId then
		return 0
	end
	
	local PetGuidH = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local PetGuidL = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	local pgH , pgL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	--�Ƿ��ս
	if (PetGuidH == pgH) and (PetGuidL == pgL) then
		return 0
	end

	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		CallScriptFunction( x336096_g_petCommonId, "PetStudy", sceneId, selfId, SkillId )
		return 1
	end

	return 0

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x336096_OnActivateEachTick( sceneId, selfId)
	return 1
end

-- �������û��ʲô�ã����Ǳ�����
function x336096_CancelImpacts( sceneId, selfId )
	return 0
end
