--婚庆副本NPC
--普通

x155000_g_ScriptId = 155000			--脚本ID--add by xindefeng

x155000_g_eventId_cancel = 0;		--我没什么事情……
x155000_g_eventId_leave = 1;		--我要暂时出去一下
x155000_g_eventId_done = 2;			--可以关闭礼堂了
x155000_g_eventId_redeem = 3;		--请帖兑换礼物

x155000_g_invitationDataId_level1  = 30303100;		-- 普通请帖ID
x155000_g_invitationDataId_level2  = 30303101;		-- 高级请帖ID
x155000_g_invitationDataId_level3  = 30303102;		-- 豪华请帖ID

x155000_g_gemList = {{id=50101001, rate=24},
					{id=50101002, rate=24},
					{id=50111001, rate=24},
					{id=50111002, rate=24},
					{id=50104002, rate=4}};
					
x155000_g_redeemList = {{id=x155000_g_invitationDataId_level3, gemRate=10, moneyRate=90, money=30000},
						{id=x155000_g_invitationDataId_level2, gemRate=20, moneyRate=80, money=15000},
						{id=x155000_g_invitationDataId_level1, gemRate=10, moneyRate=90, money=10000}}

--**********************************
--事件交互入口
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
			AddText(sceneId,"怎么样？婚礼已经举行完了么？");
			AddNumText(sceneId, x155000_g_eventId_done, "#G可以关闭礼堂了。", -1, x155000_g_eventId_done);
		else
			AddText(sceneId,"怎么样？参加朋友的婚礼很高兴吧。走之前别忘记凭请帖领礼物哦，错过了这次可没法再领啦。");
			AddNumText(sceneId, x155000_g_eventId_redeem, "请帖兑换礼物。", 6, x155000_g_eventId_redeem);
		end
		
		-- 如果正在关闭礼堂则不能“暂时出去”
		local leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4);
		if leaveFlag == 0 then
			AddNumText(sceneId, x155000_g_eventId_leave, "我要暂时出去一下。", 9, x155000_g_eventId_leave);
		end
		
		AddNumText(sceneId, x155000_g_eventId_cancel, "我没什么事情……", -1, x155000_g_eventId_cancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId,selfId,targetId);
end


--**********************************
--事件列表选中一项
--**********************************
function x155000_OnEventRequest(sceneId, selfId, targetId, eventId)
	if eventId == x155000_g_eventId_cancel then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	elseif eventId == x155000_g_eventId_leave then
		CallScriptFunction( 401030, "PlayerExit", sceneId, selfId);
	elseif eventId == x155000_g_eventId_done then	--增加确认页,防止玩家点错了--modify by xindefeng		
		BeginEvent( sceneId )
			AddText( sceneId, "    您确定婚礼结束了吗？您将不能再返回礼堂了！" )
			AddNumText(sceneId, x155000_g_ScriptId, "是的，我确定婚礼已经结束。", 8, 100 )
			AddNumText(sceneId, x155000_g_ScriptId, "我没什么事情……", 8, 101 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif eventId == x155000_g_eventId_redeem then
		x155000_Redeem(sceneId, selfId, targetId);	
	end
	
	--使用NumText判断	--add by xindefeng
	local NumText = GetNumText()	
	if NumText == 100 then	--确认结束,离开副本
		--关闭窗口
		BeginUICommand( sceneId )			
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
		
		--离开副本
		CallScriptFunction( 401030, "Close", sceneId, selfId)		
	elseif NumText == 101	then	--点错了,关闭对话窗口
		BeginUICommand( sceneId )			
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )		
	end
			
end

--**********************************
--请帖兑换礼物
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
			x155000_MessageBox(sceneId, selfId, targetId, "快把你的请贴发给你的朋友来兑换礼品吧！");
			return 0;
		end
		
		if marryCharGUID_B and selfGUID == marryCharGUID_B then
			x155000_MessageBox(sceneId, selfId, targetId, "快把你的请贴发给你的朋友来兑换礼品吧！");
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
											BroadMsgByChatPipe(sceneId, selfId, "#W#{_INFOUSR"..selfName.."}#I在#W#{_INFOUSR"..itemCreatorName.."}#I的婚礼中，凭藉着请帖兑换到了一颗#W#{_INFOMSG"..gemTransfer.."}#I。", 4);
											x155000_MessageBox(sceneId, selfId, targetId, "你兑换到了一颗"..gemName.."。");
										end
									end
									break;
								end
								randGemValue = randGemValue - gemItem.rate;
							end
						else
							LuaFnAddMoney(sceneId, selfId, tempRedeemItem.money);
							x155000_MessageBox(sceneId, selfId, targetId, "你兑换到了#{_MONEY"..tempRedeemItem.money.."}。");
						end
						break;
					end
				end
			end
		end
	else
		x155000_MessageBox(sceneId, selfId, targetId, "对不起，您并没有本场婚礼的请帖，因此无法兑换。");
	end
end


--**********************************
--对话窗口信息提示
--**********************************
function x155000_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

