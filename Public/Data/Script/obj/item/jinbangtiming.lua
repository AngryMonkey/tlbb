-- ������: [ QUFEI 2007-09-12 21:51 UPDATE BugID 24674 ]
-- �������
--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--jinbangtiming.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x335133_g_scriptId = 335133 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--buff�б�
x335133_g_Impact = {

		8040,
		8041,
		8042,
		8043,
		8044,
		8045,
		30181,
		30182,
		30183,
		30184,
		30185,
		30186,
}

--**********************************
--�¼��������
--**********************************
function x335133_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x335133_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x335133_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x335133_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local myLevel = GetLevel(sceneId, selfId)
    
  if myLevel < 20 then
     return 0
	end
	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x335133_OnDeplete( sceneId, selfId )
		-- ������Ʒ....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x335133_OnActivateOnce( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)

	-- �ӽ������Buff....	
	local impactID = x335133_g_Impact[1]
	local PlayerMaxLevel = GetHumanMaxLevelLimit()

  if myLevel > PlayerMaxLevel then
		impactID = x335133_g_Impact[12]
  elseif myLevel > 140 then
		impactID = x335133_g_Impact[11]
  elseif myLevel > 130 then
		impactID = x335133_g_Impact[10]
	elseif myLevel > 120 then
		impactID = x335133_g_Impact[9]
	elseif myLevel > 110 then
		impactID = x335133_g_Impact[8]
	elseif myLevel > 100 then
		impactID = x335133_g_Impact[7]
	elseif myLevel > 90 then
		impactID = x335133_g_Impact[6]
	elseif myLevel > 80 then
		impactID = x335133_g_Impact[5]
	elseif myLevel > 70 then
		impactID = x335133_g_Impact[4]
	elseif myLevel > 60 then
		impactID = x335133_g_Impact[3]
	elseif myLevel > 50 then
		impactID = x335133_g_Impact[2]
	elseif myLevel > 40 then
		impactID = x335133_g_Impact[1]
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
function x335133_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
