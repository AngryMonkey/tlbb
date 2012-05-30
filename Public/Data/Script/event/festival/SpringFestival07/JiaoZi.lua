--ע�⣺

--��Ʒ���ܵ��߼�ֻ��ʹ�û������ܺͽű���ʵ��

--�ű�:

--�����ǽű�����:


--JiaoZi.lua
------------------------------------------------------------------------------------------
--һ����Ʒ��Ĭ�Ͻű�

--�ű���
x050057_g_scriptId = 050057 --��ʱд���,�����õ�ʱ��һ��Ҫ��.

--buff���б�
x050057_g_Impact = {

		3004,
}

x050057_g_Impact1 = {
					10490,
					10491,
					10492,
					10493,
}

--�Ե��ö����Ĺ���
x050057_g_strGetItem = {

	"",
	"",
	"",
}

x050057_g_GetItem =
{
	30505167,
	30505168,
	30505169,
}
--**********************************
--�¼��������
--**********************************
function x050057_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end

--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x050057_IsSkillLikeScript( sceneId, selfId)
	return 1; --����ű���Ҫ����֧��
end

--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x050057_CancelImpacts( sceneId, selfId )
	return 0; --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x050057_OnConditionCheck( sceneId, selfId )
	--У��ʹ�õ���Ʒ
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "��Ʒ����ֻ�ܽ��׸�����ʹ�á�" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80821_6}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	
	--local id = selfId
	--local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
		--	SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
	--	end	
	--end
	--��Ѫ����Ѫ���
	--if(GetHp(sceneId, id) >= GetMaxHp(sceneId, id)) then
	--	LuaFnSendOResultToPlayer(sceneId, selfId, OR_HEALTH_IS_FULL)
	--	return 0
	--end
	

	return 1;
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x050057_OnDeplete( sceneId, selfId )
	--������....��߻�Ҫʹ�ô浽��Ʒ�ϵ���Ϣ��....
	return 1;
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x050057_OnActivateOnce( sceneId, selfId )

	--�Լ�����ʹ��....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "��Ʒ����ֻ�ܽ��׸�����ʹ�á�" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--����Ʒ....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--��buff....������Ч
	local id = selfId
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
			--SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
		--end
		
	--end
	
	local impactID = x050057_g_Impact[1]
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, impactID, 0);

	local randImpact = random(4)
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, x050057_g_Impact1[randImpact], 0);
	
	local level = GetLevel( sceneId, selfId )
	local rand10 = random(10)
	
	if level < 30 and rand10 > 1 then
			return 0
	end
	
	--���������ͬ�Ľ��
	local GoodLuck = random(4000)
	
	
	if GoodLuck < 5 then
	
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[1], QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			--������....
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P�������ڵĽ���ҧ��һ��Ӳ��³�һ������һö#cB3DB35#{_INFOMSG%s}#P������ϲЦ�տ���ףţ���Դ�������������⡣", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 1500 and GoodLuck < 1511 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[2], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P�������ڵĽ���ҧ��һ��Ӳ��³�һ������һö#cB3DB35#{_INFOMSG%s}#P������ϲЦ�տ���ףţ���Դ�������������⡣", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 2500 and GoodLuck < 2901 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[3], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			--local str = format("#W#{_INFOUSR%s}#P�������ڵĽ���ҧ��һ��Ӳ��³�һ������һö#H#{_ITEM%d}#P������ϲЦ�տ���ףţ���Դ�������������⡣", GetName(sceneId,selfId), x050057_g_GetItem[3])
			--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	end
	
	return 1;
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x050057_OnActivateEachTick( sceneId, selfId)
	return 1; --���������Խű�, ֻ�����պ���.
end
