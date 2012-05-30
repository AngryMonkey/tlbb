--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--TuanYuanPie.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x300058_g_scriptId = 300058 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--buff���б�
x300058_g_Impact = {

		8020,
		8021,
		8022,
		8023,
		8024,
		8025,
		8026,
		8027,
		8028,
		8029,
		30161,
		30162,
		30163,
		30164,
		30165,
		30166,
		30167,
		30168,
		30169,
		30170,
}

--**********************************
--�¼��������
--**********************************
function x300058_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300058_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300058_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300058_OnConditionCheck( sceneId, selfId )
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
function x300058_OnDeplete( sceneId, selfId )
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
function x300058_OnActivateOnce( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)
	local impactID = x300058_g_Impact[1]
	local PlayerMaxLevel = GetHumanMaxLevelLimit()

  if myLevel > PlayerMaxLevel then
		impactID = x300058_g_Impact[16]
	elseif myLevel > 140 then
		impactID = x300058_g_Impact[15]
	elseif myLevel > 130 then
		impactID = x300058_g_Impact[14]
	elseif myLevel > 120 then
		impactID = x300058_g_Impact[13]
	elseif myLevel > 110 then
		impactID = x300058_g_Impact[12]
	elseif myLevel > 100 then
		impactID = x300058_g_Impact[11]
	elseif myLevel > 90 then
		impactID = x300058_g_Impact[10]
	elseif myLevel > 80 then
		impactID = x300058_g_Impact[9]
	elseif myLevel > 70 then
		impactID = x300058_g_Impact[8]
	elseif myLevel > 60 then
		impactID = x300058_g_Impact[7]
	elseif myLevel > 50 then
		impactID = x300058_g_Impact[6]
	elseif myLevel > 40 then
		impactID = x300058_g_Impact[5]
	elseif myLevel > 30 then
		impactID = x300058_g_Impact[4]
	elseif myLevel > 20 then
		impactID = x300058_g_Impact[3]
	elseif myLevel > 10 then
		impactID = x300058_g_Impact[2]
	else
		impactID = x300058_g_Impact[1]
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
function x300058_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
