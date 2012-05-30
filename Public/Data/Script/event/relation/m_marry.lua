--结婚任务

--脚本号
x806003_g_ScriptId		= 806003

x806003_g_eventId_marry = 0;				-- 我想结婚的事件ID
x806003_g_eventId_selectLevel1 = 1;			-- 选择一般规模婚礼的事件ID
x806003_g_eventId_selectLevel2 = 2;			-- 选择中等规模婚礼的事件ID
x806003_g_eventId_selectLevel3 = 3;			-- 选择豪华规模婚礼的事件ID
x806003_g_eventId_selectLevelCancel = 4;	-- 取消选择婚礼规模的事件ID
x806003_g_eventId_selfAcceptLevel1 = 5;		-- 自已确定了选择一般规模婚礼
x806003_g_eventId_selfAcceptLevel2 = 6;		-- 自已确定了选择中等规模婚礼
x806003_g_eventId_selfAcceptLevel3 = 7;		-- 自已确定了选择豪华规模婚礼
x806003_g_eventId_selfCancelLevel = 8;		-- 自已取消了选择婚礼规模
x806003_g_eventId_targetAcceptLevel1 = 9;	-- 对方确定了选择一般规模婚礼
x806003_g_eventId_targetAcceptLevel2 = 10;	-- 对方确定了选择中等规模婚礼
x806003_g_eventId_targetAcceptLevel3 = 11;	-- 对方确定了选择豪华规模婚礼
x806003_g_eventId_targetCancelLevel = 12;	-- 对方取消了选择婚礼规模
x806003_g_eventId_end = 13;					-- 结束语

x806003_g_ticketItemId = 30505079;			-- 高级婚礼券ID
x806003_g_ticketItemId2 = 30505106;			-- 中级婚礼券ID

--**********************************
--任务入口函数 请求结婚
--**********************************
function x806003_OnDefaultEvent(sceneId, selfId, targetId)
	local selectEventId	= GetNumText();

	--我想结婚的事件
	if x806003_g_eventId_marry == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
	--选择婚礼规模的事件
	elseif x806003_g_eventId_selectLevel1 == selectEventId or x806003_g_eventId_selectLevel2 == selectEventId or x806003_g_eventId_selectLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_selectLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_selectLevel3 == selectEventId then
			marryLevel  = 2;
		end
	
		x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
	--取消选择婚礼规模的事件
	elseif x806003_g_eventId_selectLevelCancel == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
		
	--自已确认了选择
	elseif x806003_g_eventId_selfAcceptLevel1 == selectEventId or x806003_g_eventId_selfAcceptLevel2 == selectEventId or x806003_g_eventId_selfAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_selfAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_selfAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--自已取消了选择婚礼规模
	elseif x806003_g_eventId_selfCancelLevel == selectEventId then
		local canMarry = x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId);
		if canMarry == 1 then
			x806003_OpenMarryLevelUI(sceneId, selfId, targetId);
		end
		
	--对方确认了选择
	elseif x806003_g_eventId_targetAcceptLevel1 == selectEventId or x806003_g_eventId_targetAcceptLevel2 == selectEventId or x806003_g_eventId_targetAcceptLevel3 == selectEventId then
	
		local marryLevel = 0;
		--中等
		if x806003_g_eventId_targetAcceptLevel2 == selectEventId then
			marryLevel  = 1;
		--豪华
		elseif x806003_g_eventId_targetAcceptLevel3 == selectEventId then
			marryLevel  = 2;
		end
		
		x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
	
	--对方取消了选择婚礼规模
	elseif x806003_g_eventId_targetCancelLevel == selectEventId then
	
		x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId);
	
	--结束语
	elseif x806003_g_eventId_end == selectEventId then
		BeginUICommand(sceneId);
		EndUICommand(sceneId);
		DispatchUICommand(sceneId, selfId, 1000);
	end
end

--**********************************
--列举事件
--**********************************
function x806003_OnEnumerate(sceneId, selfId, targetId)
	AddNumText(sceneId, x806003_g_ScriptId, "我想结婚", 10, x806003_g_eventId_marry);
end

--**********************************
--检测是否满足于结婚的条件
--**********************************
function x806003_CheckOpenMarryLevelUI(sceneId, selfId, targetId)
	local ret, maleId, femaleId = x806003_CheckMarry(sceneId, selfId, targetId, 0, 1);
	return ret;
end

--**********************************
-- 婚礼规模的选择页面
--**********************************
function x806003_OpenMarryLevelUI(sceneId, selfId, targetId)
	BeginEvent(sceneId);
		local moneyLevel0 = x806003_CalcNeedMoney(0);
		local moneyLevel1 = x806003_CalcNeedMoney(1);
		local moneyLevel2 = x806003_CalcNeedMoney(2);
		AddText(sceneId, "#{yuelao_jiehun}#r一般规模的婚礼，需要花费#{_EXCHG"..moneyLevel0.."}；中等规模的婚礼，需要花费#{_EXCHG"..moneyLevel1.."}。豪华规模的婚礼，需要花费#{_EXCHG"..moneyLevel2.."}。");
		AddNumText(sceneId, x806003_g_ScriptId, "一般规模的婚礼", 6, x806003_g_eventId_selectLevel1);
		AddNumText(sceneId, x806003_g_ScriptId, "中等规模的婚礼", 6, x806003_g_eventId_selectLevel2);
		AddNumText(sceneId, x806003_g_ScriptId, "豪华规模的婚礼", 6, x806003_g_eventId_selectLevel3);
		AddNumText(sceneId, x806003_g_ScriptId, "我暂时不准备结婚……", 8, x806003_g_eventId_selectLevelCancel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
-- 自已确认选择的页面
--**********************************
function x806003_SelfCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)
	
	LuaFnSetHumanMarryInfo(sceneId, selfId, -1, 0);

	BeginEvent(sceneId);
		if marryLevel == 2 then
			AddText(sceneId, "你选择了"..x806003_GetMarryLevelName(marryLevel).."，同时你将要支付#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W或#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}，#r你们是否已经决定好结婚，并且在接下来的生活中，不离不弃呢？");
		else
			AddText(sceneId, "你选择了"..x806003_GetMarryLevelName(marryLevel).."，同时你将要支付#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W或#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#W或#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}，#r你们是否已经决定好结婚，并且在接下来的生活中，不离不弃呢？");
		end
		local tempAcceptEventID = x806003_g_eventId_selfAcceptLevel1;
		if marryLevel == 1 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel2;
		elseif marryLevel == 2 then
			tempAcceptEventID = x806003_g_eventId_selfAcceptLevel3;
		end		
		AddNumText(sceneId, x806003_g_ScriptId, "确认", 6, tempAcceptEventID);
		AddNumText(sceneId, x806003_g_ScriptId, "取消", 8, x806003_g_eventId_selfCancelLevel);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
	
end

--**********************************
-- 自已已经确认了你的选择的事件
--**********************************
function x806003_OnSelfAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);
		
		x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel);
		
		x806003_MessageBox(sceneId, selfId, targetId, "等待对方确定……");
		
	end
end

--**********************************
-- 对方确认选择的页面
--**********************************
function x806003_TargetCheckSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		LuaFnSetHumanMarryInfo(sceneId, marryTargetId, -1, 0);
		
		BeginEvent(sceneId);
			if marryLevel == 2 then
				AddText(sceneId, "对方选择了"..x806003_GetMarryLevelName(marryLevel).."，同时对方将要支付#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W或#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}，#r你们是否已经决定好结婚，并且在接下来的生活中，不离不弃呢？");
			else
				AddText(sceneId, "对方选择了"..x806003_GetMarryLevelName(marryLevel).."，同时对方将要支付#Y"..GetItemName(sceneId, x806003_g_ticketItemId).."#W或#Y"..GetItemName(sceneId, x806003_g_ticketItemId2).."#W或#{_EXCHG"..x806003_CalcNeedMoney(marryLevel).."}，#r你们是否已经决定好结婚，并且在接下来的生活中，不离不弃呢？");
			end
			local tempAcceptEventID = x806003_g_eventId_targetAcceptLevel1;
			if marryLevel == 1 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel2;
			elseif marryLevel == 2 then
				tempAcceptEventID = x806003_g_eventId_targetAcceptLevel3;
			end
			AddNumText(sceneId, x806003_g_ScriptId, "确认", 6, tempAcceptEventID);
			AddNumText(sceneId, x806003_g_ScriptId, "取消", 8, x806003_g_eventId_targetCancelLevel);
		EndEvent(sceneId);
		DispatchEventList(sceneId, marryTargetId, targetId);
	end
end

--**********************************
-- 对方已经确认了你的选择的事件
--**********************************
function x806003_OnTargetAcceptSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 1, targetId);
	
	if marryTargetId ~= -1 then
	
		--此时的self=对方
		marryTargetGUID = LuaFnGetGUID(sceneId, marryTargetId);
		LuaFnSetHumanMarryInfo(sceneId, selfId, marryTargetGUID, 1);

		local checkRet, maleId, femaleId = x806003_CheckMarry(sceneId, marryTargetId, targetId, marryLevel, 0);
		if checkRet == 1 then
			x806003_DoMarry(sceneId, marryTargetId, targetId, marryLevel, maleId, femaleId);
		end
		
	end
end

--**********************************
-- 对方已经取消了你的选择的事件
--**********************************
function x806003_OnTargetCancelSelectMarryLevel(sceneId, selfId, targetId, marryLevel)

	--关闭自已的窗口
	BeginUICommand(sceneId);
	EndUICommand(sceneId);
	DispatchUICommand(sceneId, selfId, 1000);
	
	--提示信息给对方
	local marryTargetId = x806003_GetMarryTargetId(sceneId, selfId, 0, targetId);
	
	if marryTargetId ~= -1 then
	
		x806003_MessageBox(sceneId, marryTargetId, targetId, "对方拒绝了你！");
		
	end
end

--**********************************
-- 判断是否可以结婚
--**********************************
function x806003_CheckMarry(sceneId, selfId, targetId, marryLevel, isCheckOpenMarryLevelUI)
	local szMsg = "如果想要结婚的话，必须男女双方一起组队之后再来找我。"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "结婚组队的队伍必须只能由男女双方组成，队伍中不能有其他人员。"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "只有两人均走到我身边之后才能结婚。"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "必须双方为异性才可以结婚。"
	local maleId = -1;
	local femaleId = -1;
	local marryTargetId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	if maleId == -1 or femaleId == -1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "结婚时男方需要达到35级，女方需要达到20级。"
	if LuaFnGetLevel(sceneId, maleId) < 35 or LuaFnGetLevel(sceneId, femaleId) < 20 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "必须双方均为未婚才能结婚。"
	if LuaFnIsMarried(sceneId, maleId) > 0 or LuaFnIsMarried(sceneId, femaleId) > 0 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "如果需要结婚，双方的友好度必须到达1000。"
	if LuaFnIsFriend(sceneId, maleId, femaleId) ~= 1 or LuaFnIsFriend(sceneId, femaleId, maleId) ~= 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	if LuaFnGetFriendPoint(sceneId, maleId, femaleId) < 1000 or LuaFnGetFriendPoint(sceneId, femaleId, maleId) < 1000 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "你们是师徒，怎么可以结婚呢？"
	if LuaFnIsMaster(sceneId, maleId, femaleId) == 1 or LuaFnIsMaster(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end

	szMsg = "已经结拜的双方是不能结婚的。"
	if LuaFnIsBrother(sceneId, maleId, femaleId) == 1 or LuaFnIsBrother(sceneId, femaleId, maleId) == 1 then
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	if isCheckOpenMarryLevelUI and isCheckOpenMarryLevelUI == 1 then
		return 1, -1, -1;
	end
	
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			x806003_MessageBox(sceneId, selfId, targetId, "你的#Y"..GetItemName(sceneId, selectTicketItemId).."#W被锁定了，所以现在还不能交给我。");
			x806003_MessageBox(sceneId, marryTargetId, targetId, "对方的#Y"..GetItemName(sceneId, selectTicketItemId).."#W被锁定了，所以现在还不能交给我。");
			return 0, -1, -1;
		end
	else
	--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			szMsg = "对不起，你身上的金钱不足。"
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
			szMsg = "对不起，对方身上的金钱不足。"
			x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
			return 0, -1, -1;
		end
	end
	
	szMsg = "物品背包空间已满，无法放置结婚戒指，请检查双方的背包。"
	local maleProSpace = LuaFnGetPropertyBagSpace(sceneId, maleId);
	local femaleProSpace = LuaFnGetPropertyBagSpace(sceneId, femaleId);
	if maleProSpace < 1 or femaleProSpace < 1 then
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local selfTaskCount = GetMissionCount(sceneId, selfId);
	if selfTaskCount >= 20 then
		szMsg = "任务记录已满，无法获取新任务。"
		x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		szMsg = "对方任务记录已满，无法获取新任务。"
		x806003_MessageBox(sceneId, marryTargetId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	szMsg = "双方并没有完全同意结婚。"
	local maleGUID = LuaFnGetGUID(sceneId, maleId);
	local femaleGUID = LuaFnGetGUID(sceneId, femaleId);
	local maleIsAccept, maleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, maleId);
	if maleIsAccept and maleIsAccept == 1 and maleTargetGUID and maleTargetGUID == femaleGUID then
	else
		x806003_MessageBox(sceneId, maleId, targetId, szMsg);
		return 0, -1, -1;
	end
	
	local femaleIsAccept, femaleTargetGUID = LuaFnGetHumanMarryInfo(sceneId, femaleId);
	if femaleIsAccept and femaleIsAccept == 1 and femaleTargetGUID and femaleTargetGUID == maleGUID then
	else
		x806003_MessageBox(sceneId, femaleId, targetId, szMsg);
		return 0, -1, -1;
	end

	return 1, maleId, femaleId;
end

--**********************************
-- 处理结婚
--**********************************
function x806003_DoMarry(sceneId, selfId, targetId, marryLevel, maleId, femaleId)
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		return 0;
	end

	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		return 0;
	end

	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		return 0;
	end

	local maleId = -1;
	local femaleId = -1;
	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		local sexType = LuaFnGetSex(sceneId, memId);
		if sexType == 1 then
			maleId = memId;
		else
			femaleId = memId;
		end
	end

	if maleId == -1 or femaleId == -1 then
		return 0;
	end

	--扣钱
	local ticketItemPos = -1;
	local selectTicketItemId = -1;
	if marryLevel == 2 then
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
		selectTicketItemId = x806003_g_ticketItemId;
	else
		ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId2);
		selectTicketItemId = x806003_g_ticketItemId2;
		if not ticketItemPos or ticketItemPos < 0 then
			ticketItemPos = GetBagPosByItemSn(sceneId, selfId, x806003_g_ticketItemId);
			selectTicketItemId = x806003_g_ticketItemId;
		end
	end
	if ticketItemPos and ticketItemPos > -1 then
		local checkRet = LuaFnIsItemAvailable(sceneId, selfId, ticketItemPos);
		if not checkRet or checkRet ~= 1 then
			return 0;
		end
		
		local eraseItemRet = EraseItem(sceneId, selfId, ticketItemPos);
		if not eraseItemRet or eraseItemRet ~= 1 then
			return 0;
		end
	else
		--local money = LuaFnGetMoney(sceneId, selfId);
		--local needMoney = x806003_CalcNeedMoney(marryLevel);
		--if money and needMoney and money >= needMoney then
		--hzp 2008-12-9
		local nMoneyJZ = GetMoneyJZ(sceneId, selfId);
		local nMoneyJB = LuaFnGetMoney(sceneId, selfId);
		local nMoneySelf = nMoneyJZ + nMoneyJB;
		local needMoney = x806003_CalcNeedMoney(marryLevel);
		if nMoneyJZ and nMoneyJB and nMoneySelf and needMoney and nMoneySelf >= needMoney then
		else
			return 0;
		end

		--LuaFnCostMoney(sceneId, selfId, needMoney);	
		LuaFnCostMoneyWithPriority(sceneId, selfId, needMoney);	
	end

	--增加称号
	local maleName = LuaFnGetName(sceneId, maleId);
	local femaleName = LuaFnGetName(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, femaleId, maleName .. "的娘子");
	DispatchAllTitle(sceneId, femaleId);

	LuaFnAwardSpouseTitle(sceneId, maleId, femaleName .. "的夫君");
	DispatchAllTitle(sceneId, maleId);

	--发戒指
	local pos;
	local ringItemId = x806003_GetRingByMarryLevel(marryLevel);
	pos	= TryRecieveItem(sceneId, maleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, maleId, pos, femaleName);
	end

	pos	= TryRecieveItem(sceneId, femaleId, ringItemId, 1);
	if pos and pos ~= -1 then
		LuaFnSetItemCreator(sceneId, femaleId, pos, maleName);
	end
	
	--重温婚礼计数清0
	SetMissionData( sceneId, maleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	SetMissionData( sceneId, femaleId, MD_TW_REEXPERIENCE_WEDDING_TOTAL_COUNT, 0 )
	
	--正式结婚
	LuaFnMarry(sceneId, maleId, femaleId, marryLevel);
	
	--加入新任务
	CallScriptFunction( 250036, "OnAccept", sceneId, selfId, marryLevel);

	--聊天窗口给男方提示
	--Msg2Player(sceneId, maleId, "恭喜你和"..femaleName.."结为夫妻！", MSG2PLAYER_PARA);
	Msg2Player(sceneId, maleId, "您获得了称号'"..femaleName.."的夫君'。", MSG2PLAYER_PARA);

	--聊天窗口给女方提示
	--Msg2Player(sceneId, femaleId, "恭喜你和"..maleName.."结为夫妻！", MSG2PLAYER_PARA);
	Msg2Player(sceneId, femaleId, "您获得了称号'"..maleName.."的娘子'。", MSG2PLAYER_PARA);
	
	local ringItemName = GetItemName(sceneId, ringItemId);
	if ringItemName then
		Msg2Player(sceneId, maleId, "您获得了"..ringItemName.."。", MSG2PLAYER_PARA );
		Msg2Player(sceneId, femaleId, "您获得了"..ringItemName.."。", MSG2PLAYER_PARA);
	end
	
	--世界公告
	local strChatMessage = "#b#cff99ff恭喜#W#{_INFOUSR"..maleName.."}#b#cff99ff和#W#{_INFOUSR"..femaleName.."}#b#cff99ff喜结连理，祝愿他们白头偕老、比翼双飞、一生幸福。";
	BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;AUC:"..strChatMessage, 4);
	
	--分别发EMAIL给男女双方上面的所有好友
	local maleGuid = LuaFnGetGUID(sceneId, maleId);
	local femaleGuid = LuaFnGetGUID(sceneId, femaleId);
	LuaFnSendMailToAllFriend( sceneId, maleId, "我亲爱的朋友，我已和" .. femaleName .. "喜结良缘，祝福我们吧！", 1, femaleGuid )
	LuaFnSendMailToAllFriend( sceneId, femaleId, "我亲爱的朋友，我已和" .. maleName .. "喜结良缘，祝福我们吧！", 1, maleGuid )

	--结束语
	local endMsg = "恭喜你们喜结连理，接下来请找洛阳（177，94）的喜来乐安排花车巡游，不过喜来乐负责整个洛阳的喜事，每天特别忙，所以你们一定要在一个小时之后找到他。否则过了这个期限可就没办法了。";
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "谢谢……", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, maleId, targetId);
	
	BeginEvent(sceneId);
		AddText(sceneId, endMsg);
		AddNumText(sceneId, x806003_g_ScriptId, "谢谢……", 8, x806003_g_eventId_end);
	EndEvent(sceneId);
	DispatchEventList(sceneId, femaleId, targetId);
end

--**********************************
--对话窗口信息提示
--**********************************
function x806003_MessageBox(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId);
		AddText(sceneId, msg);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--计算婚礼对应的钱数
--**********************************
function x806003_CalcNeedMoney(marryLevel)
	if marryLevel == 1 then
		return 5203344;
	elseif marryLevel == 2 then
		return 13145200;
	else
		return 520520;
	end
end

--**********************************
--得婚礼等级对应的名称
--**********************************
function x806003_GetMarryLevelName(marryLevel)
	if marryLevel == 1 then
		return "中等规模婚礼";
	elseif marryLevel == 2 then
		return "豪华规模婚礼";
	else
		return "一般规模婚礼";
	end
end

--**********************************
--得婚礼等级对应的戒指的ID
--**********************************
function x806003_GetRingByMarryLevel(marryLevel)
	if marryLevel == 1 then
		return 10422097;
	elseif marryLevel == 2 then
		return 10422098;
	else
		return 10422096;
	end
end

--**********************************
--得对方的objId
--**********************************
function x806003_GetMarryTargetId(sceneId, selfId, showMessage, targetId)

	local marryTargetId = -1;
	
	local szMsg = "如果想要结婚的话，必须男女双方一起组队之后再来找我。"
	if LuaFnHasTeam(sceneId, selfId) == 0 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end
	
	szMsg = "结婚组队的队伍必须只能由男女双方组成，队伍中不能有其他人员。"
	if LuaFnGetTeamSize(sceneId, selfId) ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	szMsg = "只有两人均走到我身边之后才能结婚。"
	local nearNum = GetNearTeamCount(sceneId, selfId);
	if nearNum ~= 2 then
		if showMessage and showMessage == 1 then
			x806003_MessageBox(sceneId, selfId, targetId, szMsg);
		end
		return -1;
	end

	for nearIndex = 0, nearNum - 1 do
		local memId = GetNearTeamMember(sceneId, selfId, nearIndex);
		if memId ~= selfId then
			marryTargetId = memId;
		end
	end
	
	return marryTargetId;
	
end
