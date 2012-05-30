--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--1001.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x331001_g_scriptId = 331001 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x331001_g_Impact1 = 3003 --��ʱд���
x331001_g_Impact2 = -1 --����
x331001_g_SpecailObj = 1	--���컨����Ч
--**********************************
--�¼��������
--**********************************
function x331001_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x331001_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x331001_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x331001_OnConditionCheck( sceneId, selfId )
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
function x331001_OnDeplete( sceneId, selfId )

	local PlayerName 		= LuaFnGetName(sceneId, selfId)
	local itemBagIndex 	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local szTransferItem= GetBagItemTransfer( sceneId, selfId, itemBagIndex )
	local szSceneName	= GetSceneName( sceneId )
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
	
		local message;	
		local randMessage = random(3);

		if randMessage == 1 then
		  message = format("@*;SrvMsg;SCA:#{ManTian_00}#{_INFOUSR%s}#{ManTian_01}#G%s#cff0000#{ManTian_02}#{_INFOMSG%s}#{ManTian_03}", PlayerName, szSceneName, szTransferItem );
		elseif randMessage == 2 then
			message = format("@*;SrvMsg;SCA:#{ManTian_04}#{_INFOUSR%s}#{ManTian_05}#G%s#cff0000#{ManTian_06}#{_INFOMSG%s}#{ManTian_07}#{_INFOUSR%s}#{ManTian_08}", PlayerName, szSceneName, szTransferItem, PlayerName );
		else
			message = format("@*;SrvMsg;SCA:#{ManTian_09}#{_INFOUSR%s}#{ManTian_05}#G%s#cff0000#{ManTian_10}#{_INFOMSG%s}#{ManTian_11}#{_INFOMSG%s}#{ManTian_12}", PlayerName, szSceneName, szTransferItem, szTransferItem );
		end
		
		AddGlobalCountNews( sceneId, message )

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
function x331001_OnActivateOnce( sceneId, selfId )
	if(-1~=x331001_g_Impact1) then
		local posX,posZ = GetWorldPos(sceneId, selfId)

		CreateSpecialObjByDataIndex(sceneId, selfId, x331001_g_SpecailObj, posX, posZ, 0)
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x331001_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x331001_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
