--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--3004.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x332001_g_scriptId = 332001 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x332001_g_Impact1 = 3004 --��ʱд���
x332001_g_Impact2 = -1 --����

--**********************************
--�¼��������
--**********************************
function x332001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332001_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332001_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332001_OnConditionCheck( sceneId, selfId )

	local nLevel = GetLevel(sceneId, selfId);
	if nLevel < 30 then
		return 0;
	end

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
function x332001_OnDeplete( sceneId, selfId )
	
	local szTransfer;
	
	local szPlayerName = LuaFnGetName( sceneId, selfId );
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30505076);
	if nItemBagIndex >= 0 then		
		szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
	end

	local message = format("#{_INFOUSR%s}������һ�����µ�һ��ҩ#{_INFOMSG%s}���������û�����̩���о��Լ��������г�����", szPlayerName, szTransfer );	
	AddGlobalCountNews( sceneId, message )

	local ExpBonus = 500000;
	AddExp( sceneId, selfId, ExpBonus )

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
function x332001_OnActivateOnce( sceneId, selfId )
	if(-1~=x332001_g_Impact1) then
	--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x332001_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332001_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x332001_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
