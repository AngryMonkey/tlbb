--������ɫ
--�ű���
x801011_g_ScriptId = 801011

--������ɫUI 22

--**********************************
--�о��¼�
--**********************************
function x801011_OnEnumerate( sceneId, selfId, targetId )
	-- ������Ϣ
	--BeginEvent(sceneId)
	--	AddText(sceneId, "���������ɫ�ű�");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	

	-- ΪʲôҪ NPC ���֣�
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 22)
	return

end


--**********************************
--������ɫ
--**********************************
function x801011_FinishAdjust( sceneId, selfId, ColorValue)
	-- Ⱦ����
	item = {20307001, 20307002} -- zchw

	-- �����õ���
	itemCount = LuaFnGetAvailableItemCount ( sceneId, selfId, item[1] ); -- zchw
	itemCount2 = LuaFnGetAvailableItemCount ( sceneId, selfId, item[2] ); 
	if (itemCount < 1) and (itemCount2 < 1) then
		BeginEvent(sceneId)
			AddText(sceneId,"û���㹻��Ⱦ������");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- ����Ǯ
	local money = GetMoney(sceneId, selfId);
	local moneyJZ = GetMoneyJZ(sceneId, selfId);
	
	if (money + moneyJZ) >= 50000 then
		-- �۳����Ӻͽ�Ǯ	
		local costMoneyJZ, costMoney = LuaFnCostMoneyWithPriority (sceneId, selfId, 50000)
		
		-- �����ڲ�������
		if costMoneyJZ == -1 then
			return
		end
		
		-- ���Ӻͽ�Ǯ��Ŀ���۳�
		if (costMoneyJZ + costMoney == 50000) then		
			-- ������Ʒ
			if (itemCount2 >= 1) then
				ret = DelItem( sceneId, selfId, item[2], 1 ); -- zchw ����ɾ���󶨵�Ⱦ����
			else
				ret = DelItem( sceneId, selfId, item[1], 1 );
			end

			-- �����·�ɫ
			SetHumanHairColor( sceneId, selfId, ColorValue )
			BeginEvent(sceneId)
				AddText(sceneId,"Ⱦ���ɹ���")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			-- ���͹㲥
			local message;	
			local randMessage = random(3);	
			if randMessage == 1 then		
	   		message = format("#W#{_INFOUSR%s}#{FaSe_00}", LuaFnGetName(sceneId, selfId));
			elseif randMessage == 2 then
				message = format("#{FaSe_01}#W#{_INFOUSR%s}#{FaSe_02}", LuaFnGetName(sceneId, selfId));
			else
				message = format("#{FaSe_03}#W#{_INFOUSR%s}#{FaSe_04}", LuaFnGetName(sceneId, selfId));
			end
	
			BroadMsgByChatPipe(sceneId, selfId, message, 4);

		-- ���Ӻͽ�Ǯ����Ŀ���� 50000
		else
			BeginEvent(sceneId)
				AddText(sceneId,"��Ǯ���㡣")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)			
			return		
		end
	-- Ǯ��������ֱ�ӷ���
	else
		BeginEvent(sceneId)
			AddText(sceneId,"������Я���Ľ�Ǯ���㡣")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)			
		return	
	end
	
end
