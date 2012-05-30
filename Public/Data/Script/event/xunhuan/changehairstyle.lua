--��������
--�ű���
x801010_g_ScriptId = 801010

--��������UI 21

--**********************************
--�о��¼�
--**********************************
function x801010_OnEnumerate( sceneId, selfId, targetId )
	-- ������Ϣ
	--BeginEvent(sceneId)
	--	AddText(sceneId, "����������ͽű�");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)		

	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 21)
	return

end


--**********************************
--��������
--**********************************
function x801010_FinishAdjust( sceneId, selfId, styleId)

	-- ����δѡ�л�ѡ����Ч
	if styleId < 0 then														
		BeginEvent(sceneId)
			AddText(sceneId, "��û��ѡ����Ҫ�����ķ��͡�");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- �õ���������������Ʒ��id��������
	local ItemId, ItemCount = GetChangeHairItemIdAndItemCount(styleId)
	
	-- ����ֵ�Ƿ�
	if ItemId < 0 or ItemCount < 0 then		
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- ��Ʒ�Ƿ��û�����
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "��û�з���ͼ�����߷���ͼ��������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ��Ʒ���ͨ�����ټ����ҽ�Ǯ
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- ��Ʒ�ͽ�Ǯ��ⶼͨ��
	if (moneyJZ + money >= 50000)	then
		-- ��������·��ͣ��������������������Ʒ�ͽ�Ǯ��
		local ret = LuaFnChangeHumanHairModel( sceneId, selfId, styleId )
		if ret == 0 then	
			BeginEvent(sceneId)
				AddText(sceneId, "�ı䷢�ͳɹ���")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		-- ����Ϊ����ʧ��ʱ�Ĵ�����Ϣ
		elseif ret == 1  then														--��ѡ�ķ�������ҵ�ǰ�ķ���һ��
			BeginEvent(sceneId)
				AddText(sceneId, "��ѡ��һ�ֺ��㵱ǰ��ͬ�ķ��͡�");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then														--û����Ҫ���ĵ���Ʒ�����Ʒ������
			BeginEvent(sceneId)
				AddText(sceneId, "��û�з���ͼ�����߷���ͼ��������");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then														
			BeginEvent(sceneId)
				AddText(sceneId, "��Ǯ���㡣");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- ��Ǯ����
	else
		BeginEvent(sceneId)
			AddText(sceneId, "������Я���Ľ�Ǯ���㡣");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����һ������Ĺ㲥��Ϣ
	local message;	
	local randMessage = random(3);
		
	if randMessage == 1 then	
		message = format("#{FaXing_00}#{_INFOUSR%s}#{FaXing_01}", LuaFnGetName(sceneId, selfId));
	elseif randMessage == 2 then
		message = format("#{FaXing_02}#{_INFOUSR%s}#{FaXing_03}", LuaFnGetName(sceneId, selfId));
	else
		message = format("#{FaXing_04}#{_INFOUSR%s}#{FaXing_05}", LuaFnGetName(sceneId, selfId));
	end
		
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end
