--07ʥ��Ԫ��

--�Ҹ�ѩ��ʹ�ýű�


--�ű���
x300064_g_scriptId = 300064

x300064_g_GiftTbl = {

	30501101,
	30501102,
	30501015,
	30008022,
	30008023,
	30008024,
	30505034,
	30505035,
	30505036,
	30505037

}


--**********************************
--�¼��������
--**********************************
function x300064_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300064_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300064_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300064_OnConditionCheck( sceneId, selfId )

	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--��������....

			--���ܶ��Լ�ʹ��....
		if selfId == targetId then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end

	elseif objType == 2 then--�����NPC....

		--����Ƕ�NPCʹ�õĻ�....������Ƿ���ѩ��....
		local ret = CallScriptFunction( 050023, "CanThrowSnowBall", sceneId, selfId, targetId )
		if ret ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end

	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
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
function x300064_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x300064_OnActivateOnce( sceneId, selfId )
	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--������������....

		--1/12����(9%)���жԷ�....���Է�һ����Ч....����Ŀ��ʾ....
		local rand = random(100)
		if rand < 9 then
				LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 10482, 0)
				BeginEvent( sceneId )
					AddText( sceneId, "����"..LuaFnGetName(sceneId,selfId).."���Ҹ�ѩ��Ͷ���ˣ�" )
				EndEvent( sceneId )
				DispatchMissionTips( sceneId, targetId )
		end

	elseif objType == 2 then--�����ѩ��....

		local ret = CallScriptFunction( 050023, "OnHitBySnowBall", sceneId, selfId, targetId )
		if ret == 1 then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 10481, 0)
		else
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 1
		end

	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 1

	end

	--40��(��)ʹ�ñ���Ʒ��һ�����ʻ��ý�Ʒ....
	if GetLevel(sceneId, selfId) < 40 then
		return 1
	end

	--1/500��ö���....
	local GoodLuck = random(5000)
	if GoodLuck > 10 then
		return 1
	end

	local idx = random( getn(x300064_g_GiftTbl) )
	local ItemId = x300064_g_GiftTbl[idx]
	local BagIndex = TryRecieveItem( sceneId, selfId, ItemId, QUALITY_MUST_BE_CHANGE )
	if BagIndex ~= -1 then

		local playerName = GetName(sceneId, selfId)
		local transfer = GetBagItemTransfer(sceneId,selfId,BagIndex)

		msg = format("#{_INFOUSR%s}#P���Ҹ���ѩ�����˳�ȥ��#{_INFOMSG%s}#P���������������#{_INFOUSR%s}#P�ı����С�", playerName, transfer, playerName )
		BroadMsgByChatPipe(sceneId, selfId, msg, 4)

	end

	return 1;

end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300064_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
