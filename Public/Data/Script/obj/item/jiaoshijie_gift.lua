--��ʦ�ڴ���� Created by zchw

--�ű���
x300101_g_scriptId = 300101

x300101_g_prize = {
										{id = 30501162, rate = 999200}, --ʦͽ���� ������ ʰȡ��
										{id = 20307002, rate = 150},    --Ⱦ����   ������
										{id = 10124056, rate = 644},    --���Ӽ��� ������ ʰȡ��
										{id = 20310103, rate = 2},      --�����   ������
										{id = 20310104, rate = 2},      --���צ
										{id = 20310105, rate = 2},			--�����
									}
--**********************************
-- ����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0��ִ�� OnDefaultEvent��
--**********************************
function x300101_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- ����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300101_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- ���������ڣ�����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300101_OnConditionCheck( sceneId, selfId )
	-- У��ʹ�õ���Ʒ
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end
	return 1
end

--**********************************
--���ļ�⼰������ڣ��������ĵļ���ִ�У�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300101_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300101_OnActivateOnce( sceneId, selfId )

	--ɾ��ǰ����Trans....
	local BagPos = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagPos )

	--�õ�������Ʒ��
	local ranNum = random(1000000);
	local prizeIndex = 0;
	if (ranNum < 999200) then   --ʦͽ���� ������
		prizeIndex = x300101_g_prize[1].id;
	elseif (ranNum < 999200+150) then  --Ⱦ����
		prizeIndex = x300101_g_prize[2].id;
	elseif (ranNum < 999200+150+644) then --���Ӽ���
		prizeIndex = x300101_g_prize[3].id;
	elseif (ranNum < 999200+150+644+2) then
		prizeIndex = x300101_g_prize[4].id;
	elseif (ranNum < 999200+150+644+2+2) then
		prizeIndex = x300101_g_prize[5].id;
	else
		prizeIndex = x300101_g_prize[6].id;
	end

	local spaceNum1 = LuaFnGetPropertyBagSpace(sceneId, selfId);
	local spaceNum2 = LuaFnGetMaterialBagSpace(sceneId, selfId);
	
	if spaceNum1 == 0 or spaceNum2 ==0 then
		x300101_NotifyFailTips(sceneId, selfId, "��������������ռ䲻�㣡");
		return 0;
	end
	
	--ɾ�������
	if LuaFnDepletingUsedItem( sceneId, selfId ) <= 0 then
		return 0;
	end
	-- ������
	local PrizePos = TryRecieveItem(sceneId, selfId, prizeIndex, QUALITY_MUST_BE_CHANGE );

	--ʰȡ�� 
	if (prizeIndex == x300101_g_prize[1].id) or (prizeIndex == x300101_g_prize[3].id) then
		if LuaFnItemBind(sceneId, selfId, PrizePos) ~= 1 then
				local bindmsg = "��ʧ��"													
		  	BeginEvent( sceneId )
		    	AddText( sceneId, bindmsg )
		  	EndEvent( sceneId )
		  	DispatchMissionTips( sceneId, selfId )
		end
	end
	local PrizeItemInfo = GetBagItemTransfer(sceneId, selfId, PrizePos);

  -- add log
  AuditUseTeacherGift(sceneId, selfId, prizeIndex);
	-- add notify
	local msg = nil;
	local playerName = GetName(sceneId, selfId);

	if (prizeIndex == x300101_g_prize[2].id) or (prizeIndex == x300101_g_prize[3].id) then
		msg = format("#B#{_INFOUSR%s}#{STDLB_8725_1}#{_INFOMSG%s}#{STDLB_8725_2}#{_INFOMSG%s}#{JPN_3}", playerName, ItemInfo, PrizeItemInfo);
	elseif (prizeIndex == x300101_g_prize[4].id) or (prizeIndex == x300101_g_prize[5].id) or (prizeIndex == x300101_g_prize[6].id) then
		msg = format("#B#{_INFOUSR%s}#{STDLB_8725_1}#{_INFOMSG%s}#{STDLB_8725_3}#{_INFOMSG%s}#{STDLB_8725_4}", playerName, ItemInfo, PrizeItemInfo);
	end

	if msg ~= nil then
		AddGlobalCountNews( sceneId, msg )
	end
	-- set buff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8062, 0); --��Ч��
	return 1
end
----------------------
--ʧ����ʾ
----------------------
function x300101_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�������ʱ��Ч�����
--**********************************
function x300101_OnActivateEachTick( sceneId, selfId )
	return 1
end

