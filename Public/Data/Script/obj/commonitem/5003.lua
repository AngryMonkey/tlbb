-- �������ٵ�
-- ���ӳ�������

-- ����ͨ�ù��ܽű�
x335003_g_petCommonId = PETCOMMON

--******************************************************************************
-- ���²�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű��� ���ĳ���ȷ�ű��ţ�
x335003_g_scriptId = 335003

-- ����ֵ ������Ҫ���д������ֵ��
x335003_g_LifeValue = 500			-- ��������ֵ

--��׼Ч��ID ���ĳɳ���ʹ��ѱ�����ߵ���Ч��
--g_ImpactID = 0

--******************************************************************************
-- ���ϲ�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű�

--**********************************
--���뷵�� 1 ������ȷִ����������
--**********************************
function x335003_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335003_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if(LuaFnGetPetLife( sceneId, selfId, petGUID_H, petGUID_L ) >= 
		LuaFnGetPetMaxLife( sceneId, selfId, petGUID_H, petGUID_L )) then
		BeginEvent(sceneId)
			strText = "�ó��ﲻ��Ҫ�ӳ�������"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
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
function x335003_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335003_OnActivateOnce( sceneId, selfId )
	if x335003_g_LifeValue > 0 then
		CallScriptFunction( x335003_g_petCommonId, "IncPetLife", sceneId, selfId, x335003_g_LifeValue )
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335003_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- �������û��ʲô�ã����Ǳ�����
function x335003_CancelImpacts( sceneId, selfId )
	return 0
end
