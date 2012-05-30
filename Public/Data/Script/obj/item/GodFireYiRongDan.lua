--������:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
--ע�⣺�ýű�ֻ���ڹ������ܻʹ��

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


------------------------------------------------------------------------------------------
--�������ܻ���ߵ�Ĭ�Ͻű�

--�ű���
x808086_g_scriptId = 808086

--��Ҫ�ĵȼ�
--��Ҫ������ID
x808086_g_MissionID = 1000

--��Ҫ��Ч��ID	���ʹ��
x808086_g_ImpactID 	= 5929

--Ч����ID
x808086_g_itemList = {}
x808086_g_itemList[30505207] = {impactId=5933}			-- �ڹ��
x808086_g_itemList[30505208] = {impactId=5934}			-- ���Ӷ���


--**********************************
--�¼��������
--**********************************
function x808086_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x808086_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x808086_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x808086_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--�����û�й�����������
	if IsHaveMission( sceneId, selfId, x808086_g_MissionID ) <= 0 then
		x808086_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--������ʹ������
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808086_g_ImpactID) == 0 then
		x808086_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808086_g_itemList[itemTblIndex];
	if not itemCur then
		x808086_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end

	return 1; --����Ҫ�κ�����������ʼ�շ���1��
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x808086_OnDeplete( sceneId, selfId )
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
function x808086_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808086_g_itemList[itemTblIndex];
	if not itemCur then
		x808086_NotifyFailTips(sceneId, selfId, "δ���ŵ��ߣ��޷�ʹ�á�");
		return 0;
	end
	
	if(-1~=itemCur.impactId) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, itemCur.impactId, 0);
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x808086_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end

--**********************************
-- ��Ŀʧ����ʾ
--**********************************
function x808086_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
