--���츱��NPC
--��ͨ

x155000_g_ScriptId = 155000			--�ű�ID--add by xindefeng

x155000_g_eventId_cancel = 0;		--��ûʲô���顭��
x155000_g_eventId_leave = 1;		--��Ҫ��ʱ��ȥһ��
x155000_g_eventId_done = 2;			--���Թر�������
x155000_g_eventId_redeem = 3;		--�����һ�����

x155000_g_invitationDataId_level1  = 30303100;		-- ��ͨ����ID
x155000_g_invitationDataId_level2  = 30303101;		-- �߼�����ID
x155000_g_invitationDataId_level3  = 30303102;		-- ��������ID

x155000_g_gemList = {{id=50101001, rate=24},
					{id=50101002, rate=24},
					{id=50111001, rate=24},
					{id=50111002, rate=24},
					{id=50104002, rate=4}};
					
x155000_g_redeemList = {{id=x155000_g_invitationDataId_level3, gemRate=10, moneyRate=90, money=30000},
						{id=x155000_g_invitationDataId_level2, gemRate=20, moneyRate=80, money=15000},
						{id=x155000_g_invitationDataId_level1, gemRate=10, moneyRate=90, money=10000}}

--**********************************
--�¼��������
--**********************************
function x155000_OnDefaultEvent(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local marryCharGUID_A, marryCharGUID_B;
		marryCharGUID_A = LuaFnGetCopySceneData_Param(sceneId, 6);
		marryCharGUID_B = LuaFnGetCopySceneData_Param(sceneId, 7);
		local bSelfWedding = 0;
		if selfGUID and marryCharGUID_A and marryCharGUID_B then
			if marryCharGUID_A < 0 then
				marryCharGUID_A = marryCharGUID_A + 4294967296;
			end
			if marryCharGUID_B < 0 then
				marryCharGUID_B = marryCharGUID_B + 4294967296;
			end
			if selfGUID == marryCharGUID_A or selfGUID == marryCharGUID_B then
				bSelfWedding = 1;
			end
		end
		if bSelfWedding == 1 then
			AddText(sceneId,"��ô���������Ѿ���������ô��");
			AddNumText(sceneId, x155000_g_eventId_done, "#G���Թر������ˡ�", -1, x155000_g_eventId_done);
		else
			AddText(sceneId,"��ô�����μ����ѵĻ���ܸ��˰ɡ���֮ǰ������ƾ����������Ŷ���������ο�û����������");
			AddNumText(sceneId, x155000_g_eventId_redeem, "�����һ����", 6, x155000_g_eventId_redeem);
		end
		
		-- ������ڹر��������ܡ���ʱ��ȥ��
		local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4);
		if leaveFlag == 0 then
			AddNumText(sceneId, x155000_g_eventId_leave, "��Ҫ��ʱ��ȥһ�¡�", 9, x155000_g_eventId_leave);
		end
		
		AddNumText(sceneId, x155000_g_eventId_cancel, "��ûʲô���顭��", -1, x155000_g_eventId_cancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end


--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x155000_OnEventRequest(sceneId, selfId, targetId, eventId)
	if eventId == x155000_g_eventId_cancel then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	elseif eventId == x155000_g_eventId_leave then
		CallScriptFunction( 401030, "PlayerExit", sceneId, selfId);
	elseif eventId == x155000_g_eventId_done then	--����ȷ��ҳ,��ֹ��ҵ����--modify by xindefeng		
		BeginEvent( sceneId )
			AddText( sceneId, "    ��ȷ����������������������ٷ��������ˣ�" )
			AddNumText(sceneId, x155000_g_ScriptId, "�ǵģ���ȷ�������Ѿ�������", 8, 100 )
			AddNumText(sceneId, x155000_g_ScriptId, "��ûʲô���顭��", 8, 101 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif eventId == x155000_g_eventId_redeem then
		x155000_Redeem(sceneId, selfId, targetId);	
	end
	
	--ʹ��NumText�ж�	--add by xindefeng
	local NumText = GetNumText()	
	if NumText == 100 then	--ȷ�Ͻ���,�뿪����
		--�رմ���
		BeginUICommand( sceneId )			
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
		
		--�뿪����
		CallScriptFunction( 401030, "Close", sceneId, selfId)		
	elseif NumText == 101	then	--�����,�رնԻ�����
		BeginUICommand( sceneId )			
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	end
			
end

--**********************************
--�����һ�����
--**********************************
function x155000_Redeem(sceneId, selfId, targetId)
	local selfGUID = LuaFnGetGUID(sceneId, selfId);
	local marryCharGUID_A, marryCharGUID_B;
	marryCharGUID_A = LuaFnGetCopySceneData_Param(sceneId, 6);
	marryCharGUID_B = LuaFnGetCopySceneData_Param(sceneId, 7);
	if selfGUID then
		if marryCharGUID_A and marryCharGUID_A < 0 then
			marryCharGUID_A = marryCharGUID_A + 4294967296;
		end
		if marryCharGUID_B and marryCharGUID_B < 0 then
			marryCharGUID_B = marryCharGUID_B + 4294967296;
		end
		
		if marryCharGUID_A and selfGUID == marryCharGUID_A then
			x155000_MessageBox(sceneId, selfId, targetId, "������������������������һ���Ʒ�ɣ�");
			return 0;
		end
		
		if marryCharGUID_B and selfGUID == marryCharGUID_B then
			x155000_MessageBox(sceneId, selfId, targetId, "������������������������һ���Ʒ�ɣ�");
			return 0;
		end
	end

	local itemIdList = {x155000_g_invitationDataId_level3, x155000_g_invitationDataId_level2, x155000_g_invitationDataId_level1};
	local itemId;
	local itemPos;
	local haveInvitation = 0;
	for _, itemId in itemIdList do
		local i, maxCount;
		maxCount = 100;
		itemPos = 0;
		for i = 0, maxCount - 1 do
			itemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, itemId, itemPos + 1);
			if itemPos and itemPos > -1 then
				local creatorGUID = GetBagItemParam(sceneId, selfId, itemPos, 0, 2);
				if creatorGUID then
					if creatorGUID == marryCharGUID_A or creatorGUID == marryCharGUID_B then
						haveInvitation = 1;
						break;
					end
				end
			end
		end
		
		if haveInvitation == 1 then
			break;
		end
	end

	if haveInvitation == 1 then
		local itemDataId = GetItemTableIndexByIndex(sceneId, selfId, itemPos);
		if itemDataId then
			local tempRedeemItem;		
			for _, tempRedeemItem in x155000_g_redeemList do
				if tempRedeemItem.id == itemDataId then
					local retGetName, itemCreatorName = LuaFnGetItemCreator(sceneId, selfId, itemPos);
					local eraseItemRet = EraseItem(sceneId, selfId, itemPos);
					if eraseItemRet and eraseItemRet == 1 then
						local totalRate = tempRedeemItem.gemRate + tempRedeemItem.moneyRate;
						local randValue = random(totalRate);
						if randValue < tempRedeemItem.gemRate then
							local totalGemRate = 0;
							local gemItem;
							for _, gemItem in x155000_g_gemList do
								totalGemRate = totalGemRate + gemItem.rate;
							end
							local randGemValue = random(totalGemRate);
							for _, gemItem in x155000_g_gemList do
								if randGemValue < gemItem.rate then
									LuaFnBeginAddItem(sceneId);
									LuaFnAddItem(sceneId, gemItem.id, 1);
									local addItemRet = LuaFnEndAddItem(sceneId, selfId);
									if addItemRet and addItemRet == 1 then
										LuaFnAddItemListToHuman(sceneId, selfId);
										local selfName = LuaFnGetName(sceneId, selfId);
										local gemTransfer = GetItemTransfer(sceneId, selfId, 0);
										local gemName = GetItemName(sceneId, gemItem.id);
										if selfName and itemCreatorName and gemName and gemTransfer then
											BroadMsgByChatPipe(sceneId, selfId, "#W#{_INFOUSR"..selfName.."}#I��#W#{_INFOUSR"..itemCreatorName.."}#I�Ļ����У�ƾ���������һ�����һ��#W#{_INFOMSG"..gemTransfer.."}#I��", 4);
											x155000_MessageBox(sceneId, selfId, targetId, "��һ�����һ��"..gemName.."��");
										end
									end
									break;
								end
								randGemValue = randGemValue - gemItem.rate;
							end
						else
							LuaFnAddMoney(sceneId, selfId, tempRedeemItem.money);
							x155000_MessageBox(sceneId, selfId, targetId, "��һ�����#{_MONEY"..tempRedeemItem.money.."}��");
						end
						break;
					end
				end
			end
		end
	else
		x155000_MessageBox(sceneId, selfId, targetId, "�Բ�������û�б������������������޷��һ���");
	end
end


--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x155000_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

