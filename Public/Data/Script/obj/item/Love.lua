--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--Love.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x300063_g_scriptId = 300063 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--buff���б�
x300063_g_Impact = {

		8030,
		8031,
		8032,
		8033,
		8034,
		8035,
		8036,
		8037,
		8038,
		8039,
		30171,
		30172,
		30173,
		30174,
		30175,
		30176,
		30177,
		30178,
		30179,
		30180,
}

--**********************************
--�¼��������
--**********************************
function x300063_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300063_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300063_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300063_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300063_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end
	return 0;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300063_OnActivateOnce( sceneId, selfId )

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local myLevel = GetLevel(sceneId, selfId)
	local impactID = x300063_g_Impact[1]

  if myLevel > PlayerMaxLevel then
		impactID = x300063_g_Impact[16]
  elseif myLevel > 140 then
		impactID = x300063_g_Impact[15]
  elseif myLevel > 130 then
		impactID = x300063_g_Impact[14]
  elseif myLevel > 120 then
		impactID = x300063_g_Impact[13]
  elseif myLevel > 110 then
		impactID = x300063_g_Impact[12]
  elseif myLevel > 100 then
		impactID = x300063_g_Impact[11]
	elseif myLevel > 90 then
		impactID = x300063_g_Impact[10]
	elseif myLevel > 80 then
		impactID = x300063_g_Impact[9]
	elseif myLevel > 70 then
		impactID = x300063_g_Impact[8]
	elseif myLevel > 60 then
		impactID = x300063_g_Impact[7]
	elseif myLevel > 50 then
		impactID = x300063_g_Impact[6]
	elseif myLevel > 40 then
		impactID = x300063_g_Impact[5]
	elseif myLevel > 30 then
		impactID = x300063_g_Impact[4]
	elseif myLevel > 20 then
		impactID = x300063_g_Impact[3]
	elseif myLevel > 10 then
		impactID = x300063_g_Impact[2]
	else
		impactID = x300063_g_Impact[1]
	end

	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);

	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300063_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
