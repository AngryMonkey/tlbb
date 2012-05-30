-- ������� ���ĳ���ȷ���֣�
-- ���ӳ�������ֵ

-- ����ͨ�ù��ܽű�
x334606_g_petCommonId = PETCOMMON

--******************************************************************************
-- ���²�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű��� ���ĳ���ȷ�ű��ţ�
x334606_g_scriptId = 334606

-- ����ֵ ������Ҫ���д������ֵ��
x334606_g_HPValue = 8148			-- ����ֵ����ֵ
x334606_g_MaxHPValue = 0		-- �������ֵ����ֵ
x334606_g_LifeValue = 0			-- ��������ֵ
x334606_g_HappinessValue = 0	-- ���ֶ�����ֵ

--��׼Ч��ID ���ĳɳ���Գ�������Ч��
--g_ImpactID = 0

--******************************************************************************
-- ���ϲ�����Ҫ����Ҫ�޸ĵĲ���
--******************************************************************************

--�ű�

--**********************************
--���뷵�� 1 ������ȷִ����������
--**********************************
function x334606_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x334606_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	-- �õ���ǰ����ʹ�õ���Ʒ�ı���λ��
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	ret = CallScriptFunction( x334606_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x334606_OnDeplete( sceneId, selfId )
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
function x334606_OnActivateOnce( sceneId, selfId )
	if x334606_g_HPValue > 0 then
		CallScriptFunction( x334606_g_petCommonId, "IncPetHP", sceneId, selfId, x334606_g_HPValue )
	end

	if x334606_g_MaxHPValue > 0 then
		CallScriptFunction( x334606_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x334606_g_MaxHPValue )
	end

	if x334606_g_LifeValue > 0 then
		CallScriptFunction( x334606_g_petCommonId, "IncPetLife", sceneId, selfId, x334606_g_LifeValue )
	end

	if x334606_g_HappinessValue > 0 then
		CallScriptFunction( x334606_g_petCommonId, "IncPetHappiness", sceneId, selfId, x334606_g_HappinessValue )
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
function x334606_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- �������û��ʲô�ã����Ǳ�����
function x334606_CancelImpacts( sceneId, selfId )
	return 0
end
