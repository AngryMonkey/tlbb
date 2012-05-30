--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--3004.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x332000_g_scriptId = 332000 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--��Ҫ�ĵȼ�

--Ч����ID
x332000_g_Impact1 = 3004 --��ʱд���
x332000_g_Impact2 = -1 --����

--**********************************
--�¼��������
--**********************************
function x332000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x332000_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x332000_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x332000_OnConditionCheck( sceneId, selfId )

	if sceneId ~= 5 then
		return 0;
	end
	
	local targetX, targetZ;
	targetX = 268;
	targetZ = 241;
	local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
	local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
--	local MonsterId = LuaFnCreateMonster( sceneId, 473, nPlayerX, nPlayerZ, 3, 0, 808038);
--	SetCharacterDieTime(sceneId, MonsterId, 1000*10)
	local msg;
	
	if fDis > 5    then
		msg = "ֻ���ھ����ģ�268��241���������ɽ������ơ�";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
		
		--���� ��Ч��
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "�Ѿ�������Ч�ڣ�";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end
	end
	
	--� ��Ч
	local actId = 36;
	
	local LianYaoStatus = GetActivityParam( sceneId, actId, 0 );
	
	if LianYaoStatus <= 0 then
		DelItem (  sceneId, selfId, 40004414, 1);
		local msg = "�Ѿ�����22��00�޷���ֲ���ɲ��Ѿ���ʧ��";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	--���ɵ���Ч
	local QianNianCaoGen = GetActivityParam( sceneId, actId, 1 );
	if QianNianCaoGen <= 0 then
		return 0;
	end
	--ȷ�� û�� ҩ��
	local YaoDing_LianYao_Status = GetActivityParam( sceneId, actId, 2 );
	if YaoDing_LianYao_Status > 0 then
		return 0;
	end
	
	msg = "#{JingHu_LingYao_01}";
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x332000_g_scriptId);		
		UICommand_AddInt(sceneId,1);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		

	--�������������
	--if(GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId)) then
	--	return 0
	--end

	--��Ѫ��������Ѫ�������
	--if((GetHp(sceneId, selfId) >= GetMaxHp(sceneId, selfId)) and (GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId))) then
	--	return 0
	--end

	return 0; --����Ҫ�κ�����������ʼ�շ���1��
end


function x332000_DoUseItemReal( sceneId, selfId, param1, param2 )
	if sceneId ~= 5 then
		return 0;
	end
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
	
		-- ����Ƿ�����Ч��Χ��
		local targetX, targetZ;
		targetX = 268;
		targetZ = 241;
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
		if fDis > 5    then
			local msg;
			msg = "ֻ���ھ����ģ�268��241���������ɽ������ơ�";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;
		end
		
		--���� ��Ч��
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "�Ѿ�������Ч�ڣ�";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end

		local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

		local message = format("#{JingHu_LingYao_02}#{_INFOMSG%s}#{JingHu_LingYao_03}", szTransfer);		

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		DelItem (  sceneId, selfId, 40004414, 1);
		
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		
		nPlayerX = nPlayerX + 1;
		nPlayerZ = nPlayerZ + 1;
		
		
		local MonsterId = LuaFnCreateMonster( sceneId, 881, nPlayerX, nPlayerZ, 3, -1, 502000 );	
		
--		SetUnitReputationID(sceneId, selfId, MonsterId, GetUnitReputationID(sceneId, selfId, selfId))
		
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)

		local nCurTime = LuaFnGetCurrentTime()
		local actId = 36;
		SetActivityParam( sceneId, actId, 4, nCurTime );
		SetActivityParam( sceneId, actId, 2, 1 );
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		
		SetActivityParam( sceneId, actId, 3, selfGUID );
		
		local szPlayerName = LuaFnGetName( sceneId, selfId );		
		JINGHU_YAODING_CREATER_NAME = szPlayerName;
		
		SetActivityParam( sceneId, actId, 5, MonsterId );
		
		--Ϊ�˱���һ�����ж�� ҩ���������
		DelItem (  sceneId, selfId, 40004415, 1);
		if TryRecieveItem( sceneId, selfId, 40004415, 1 ) >= 0 then
			local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
						
			SetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2, nCurTime )			
			
		end
		
	end
	


end



--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x332000_OnDeplete( sceneId, selfId )
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
function x332000_OnActivateOnce( sceneId, selfId )
	if(-1~=x332000_g_Impact1) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x332000_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x332000_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x332000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
