--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--3151.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x300055_g_scriptId = 300055 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x300055_g_Impact1 = 3151 --��ʱд���
x300055_g_Impact2 = -1 --����

--**********************************
--�¼��������
--**********************************
function x300055_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300055_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300055_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300055_OnConditionCheck( sceneId, selfId )
	
	if sceneId ~= 0 and sceneId ~= 1 and sceneId ~= 2 and sceneId ~= 186 then
		x300055_NotifyTip( sceneId, selfId, "#{QingXinDan_Limit_00}");
		return 0;
	end
	
	local nPkValue = LuaFnGetHumanPKValue(sceneId, selfId);
	if nPkValue <= 0 then
		x300055_NotifyTip( sceneId, selfId, "#{QingXinDan_00}");
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
function x300055_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then		
		
		local nPkValue = LuaFnGetHumanPKValue(sceneId, selfId);
		
		local msg = format("����ɱ���½���1�㣬�����ڵ�ɱ��Ϊ%d", nPkValue-1);
		x300055_NotifyTip( sceneId, selfId, msg);
		
		LuaFnSetHumanPKValue(sceneId,selfId, nPkValue - 1);	

		-- [ QUFEI 2007-11-09 15:36 UPDATE BugID 27611 ]		
		local LogInfo	= format( "[ChangePKValue]:QingXinDan sceneId=%d, GUID=%0X, ItemID=%d, PKValueBgn=%d, PKValueEnd=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),
				30008018,
				nPkValue,
				LuaFnGetHumanPKValue(sceneId, selfId) )
		WriteCheckLog( sceneId, selfId, LogInfo )
		
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
function x300055_OnActivateOnce( sceneId, selfId )
	
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300055_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x300055_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
