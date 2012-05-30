-- 领奖NPC

x000172_g_scriptId = 000172

x000172_g_PrimaryAward = 1
x000172_g_Award2 = 2
x000172_g_Award3 = 3

x000172_g_Intro = 4

x000172_g_NewCard1 = 5
x000172_g_NewCard2 = 6
x000172_g_NewCard3 = 7
x000172_g_NewCard4 = 10
x000172_g_NewCard5 = 11
x000172_g_NewCard6 = 12
x000172_g_NewCard7 = 13
x000172_g_NewCard8 = 14
x000172_g_LevelUp = 103
x000172_g_NewCardIntro = 9
x000172_g_VirtualNew = 30505080

x000172_g_eventList={210244} --{210244}

--CD-KEY
x000172_g_AwardList = {}
x000172_g_AwardList[x000172_g_PrimaryAward] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = { 10402001, 10422012, 10423020 } },
	moneyReward = 0,
	PropBagSpaceNeed = 3,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward0Flag,
	redundantMsg = "    你已经领过初级奖励了，到30级再来找我吧。",
	recvMsg = "    这里几件饰品，行走江湖多多少少用得上，另外这些钱一并送你，祝你在天龙八部游戏愉快。",
}
x000172_g_AwardList[x000172_g_Award2] = {
	needLevel = 30,
	itemAward = { hashTable = { 40 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 1,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward1Flag,
	redundantMsg = "    你已经领过30级奖励了，到60级再来找我吧。",
	recvMsg = "    这个宝石是一点心意，记得好宝石要在好的装备上镶嵌，祝你好运\。",
}
x000172_g_AwardList[x000172_g_Award3] = {
	needLevel = 60,
	itemAward = { hashTable = { 41 }, itemList = {} },
	moneyReward = 0,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetAward2Flag,
	redundantMsg = "    你已经领过60级奖励了。",
	recvMsg = "    这个要诀是一点心意，记得好要诀要给好的珍兽学习，祝你好运\。",
}
--财富卡
x000172_g_NewCardList = {}
x000172_g_NewCardList[x000172_g_NewCard1] = {
	needLevel = -1,
	itemAward = { hashTable = {}, itemList = {10402001,10422012,10423020,10141050,10141051} },
	moneyReward = 0,
	PropBagSpaceNeed = 5,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0,
	redundantMsg = "    你已经领过1级的奖励了，到15级再来找我吧。",
	recvMsg = "#{Mis_NewUserCard_16}",
}
x000172_g_NewCardList[x000172_g_NewCard2] = {
	needLevel = 15,
	itemAward = { hashTable = {}, itemList = {10413013,10411013,10412013,10421013,30008027,30008027,30008027,30008027,30008027} },
	moneyReward = 0,
	PropBagSpaceNeed = 9,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1,
	redundantMsg = "    你已经领过15级奖励了，到30级再来找我吧。",
	recvMsg = "#{Mis_NewUserCard_17}",
}
x000172_g_NewCardList[x000172_g_NewCard3] = {
	needLevel = 30,
	itemAward = { hashTable = {}, itemList = {30900015} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    你已经领过30级奖励了。",
	recvMsg = "#{Mis_NewUserCard_18}",
}
x000172_g_NewCardList[x000172_g_NewCard4] = {
	needLevel = 40,
	itemAward = { hashTable = {}, itemList = {30505106} },
	moneyReward = 2000,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    你已经领过40级奖励了。",
	recvMsg = "#{Mis_NewUserCard_19}",
}
x000172_g_NewCardList[x000172_g_NewCard5] = {
	needLevel = 89,
	itemAward = { hashTable = {}, itemList = {10141037} },
	moneyReward = 50000,
	PropBagSpaceNeed =0 ,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    你已经领过89级奖励了。",
	recvMsg = "#{Mis_NewUserCard_20}",
}
x000172_g_NewCardList[x000172_g_NewCard6] = {
	needLevel = 99,
	itemAward = { hashTable = {}, itemList = {10141027} },
	moneyReward = 120000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    你已经领过99级奖励了。",
	recvMsg = "#{Mis_NewUserCard_21}",
}
x000172_g_NewCardList[x000172_g_NewCard7] = {
	needLevel = 129,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 120000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    你已经领过129级奖励了。",
	recvMsg = "#{Mis_NewUserCard_22}",
}
x000172_g_NewCardList[x000172_g_NewCard8] = {
	needLevel = 150,
	itemAward = { hashTable = {}, itemList = {30008004,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002,30502002} },
	moneyReward = 200000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    你已经领过150级奖励了。",
	recvMsg = "#{Mis_NewUserCard_23}",
}

--**********************************
--事件交互入口
--**********************************
function x000172_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    #G欢迎来到天龙八部游戏世界，有什么我能帮助你的吗？你还需要先激活领取条件才能领取奖励。"
		AddText( sceneId, strText )

		--for i, eventId in x000172_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end

		--AddNumText( sceneId, x000172_g_scriptId, "我是财富卡用户", 2, 101 )
		--AddNumText( sceneId, x000172_g_scriptId, "我是推广员cdkey用户", 2, 201 )
		
		--AddNumText( sceneId, x000172_g_scriptId, "关于推广员系统介绍", 11, x000172_g_Intro )
		--AddNumText( sceneId, x000172_g_scriptId, "关于财富卡系统介绍", 11, x000172_g_NewCardIntro )
                AddNumText( sceneId, x000172_g_scriptId, "免费无限领取元宝--每次领10万", 2, 102)
                --AddNumText( sceneId, x000172_g_scriptId, "免费无限领取赠点--每次领10万", 2, 123)
		--AddNumText( sceneId, x000172_g_scriptId, "#gff0c0c -= [我要转生] =-", 2,x000172_g_LevelUp )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--CD-KEY
function x000172_AddCDKeyNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "激活cdkey", 2, 0 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_PrimaryAward].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取cdkey奖励", 2, x000172_g_PrimaryAward )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_Award2].flagBit ) == 0 then
			-- AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_AwardList[x000172_g_Award2].needLevel .. "级的奖励", 2, x000172_g_Award2 )
			-- eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x000172_g_AwardList[x000172_g_Award3].flagBit ) == 0 then
			-- AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_AwardList[x000172_g_Award3].needLevel .. "级的奖励", 2, x000172_g_Award3 )
			-- eventNum = eventNum + 1
		--end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的CDKEY奖励。" )
	end
end

--财富卡
function x000172_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "激活财富卡", 2, 8 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard1].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取1级的奖励", 2, x000172_g_NewCard1 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard2].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard2].needLevel .. "级的奖励", 2, x000172_g_NewCard2 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard3].needLevel .. "级的奖励", 2, x000172_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard4].needLevel .. "级的奖励", 2, x000172_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard5].needLevel .. "级的奖励", 2, x000172_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard6].needLevel .. "级的奖励", 2, x000172_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard7].needLevel .. "级的奖励", 2, x000172_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x000172_g_NewCardList[x000172_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x000172_g_scriptId, "领取" .. x000172_g_NewCardList[x000172_g_NewCard8].needLevel .. "级的奖励", 2, x000172_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的财富卡奖励。" )
	end
end

--**********************************
--转生
--**********************************
function x000172_LevelUp (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) >= 1000000000 and GetLevel(sceneId,selfId) >= 149  then 
		BeginEvent( sceneId )
			SetLevel( sceneId,selfId, 49)
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			ZengDian(SceneId,selfId,targetId,1,1000000)
			AddText(sceneId,"恭喜您,成功转生 ")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
			AddText(sceneId,".革命尚未成功,同志仍需努力,到149级再来找我把,并且要攒够10亿经验哦...")
		EndEvent( sceneId )
		
	end
	

	DispatchEventList( sceneId, selfId, targetId )

end
--**********************************
--事件列表选中一项
--**********************************
function x000172_OnEventRequest( sceneId, selfId, targetId, eventId )


	if x000172_g_NewCardIntro == GetNumText() then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XinShouKa_Help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end

	if GetNumText() == 0 then
		x000172_CheckCDKey( sceneId, selfId, targetId )
	elseif GetNumText() == x000172_g_Intro then
		x000172_Introduce( sceneId, selfId, targetId )
	elseif x000172_g_AwardList[GetNumText()] then
		x000172_GetAward( sceneId, selfId, targetId, GetNumText() )
	elseif GetNumText() == 8 then
		x000172_CheckNewUserCard(sceneId, selfId, targetId)
	elseif x000172_g_NewCardList[GetNumText()] then
		x000172_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x000172_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 201 then
		x000172_AddCDKeyNumText(sceneId, selfId, targetId)	
         elseif GetNumText() == 102 then  
               YuanBao(sceneId,selfId,targetId,1,100000) 
                 BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:您成功领取10万元宝", 0) 
                BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD: 携带元宝数量上限为100万，超过无效。", 0 )
         elseif GetNumText() == 123 then  
               ZengDian(sceneId,selfId,targetId,1,100000) 
                 BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:您成功领取10万增点", 0) 
	elseif GetNumText() == 	x000172_g_LevelUp then
		x000172_LevelUp(sceneId, selfId, targetId)	
	end
		
	for i, eventId in x000172_g_eventList do		
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end	
	
end

--**********************************
-- 检查 CDKey
--**********************************
function x000172_CheckCDKey( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		return
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无法再激活cdkey。" )
		--return
	--end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    对不起，你已经超过10级，无法激活领奖条件。" )
		--return
	--end

	CallScriptFunction( PRIZE_SCRIPT_ID, "AskCDKey", sceneId, selfId )

	-- 以下为测试使用
	-- SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
end

--**********************************
-- 检查 财富卡
--**********************************
function x000172_CheckNewUserCard( sceneId, selfId, targetId )
	--if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过cdkey，无法再激活财富卡。" )
		--return
	--end
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无须再次激活。" )
		return
	end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的等级已经大于10级，无法再激活财富卡。" )
		--return
	--end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x000172_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x000172_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--财富卡的虚拟卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经激活财富卡成功，到达一定等级之后可以再来我这里领取奖励。" )
	else
		--打开输入财富卡卡号界面
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 2004 )
	end

	-- 以下为测试使用
	--SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
end

--**********************************
-- 推广员系统介绍
--**********************************
function x000172_Introduce( sceneId, selfId, targetId )
	x000172_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey是我们推广员发布给用户的序列号，使用此序列号在页面激活之后，可以到游戏中领取少许的奖励，并且只能领取一次。" )
end

--**********************************
-- 领CD-KEY奖品
--**********************************
function x000172_GetAward( sceneId, selfId, targetId, grade )
	local awardInfo = x000172_g_AwardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) ~= 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- 放不下就没有了
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		AddMoney( sceneId, selfId, awardInfo.moneyReward )
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- 领财富卡奖品
--**********************************
function x000172_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x000172_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x000172_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end
	
	if grade == x000172_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x000172_NotifyFailBox( sceneId, selfId, targetId, "    您携带的珍兽已满，您可以放生一个珍兽留出空位。" )
			return
		end
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- 放不下就没有了
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		TryRecieveItem( sceneId, selfId, itemSN, 9 )
	end

	if awardInfo.moneyReward > 0 then
		if grade == x000172_g_NewCard4 or grade == x000172_g_NewCard5 or grade == x000172_g_NewCard6 or grade == x000172_g_NewCard7 or grade == x000172_g_NewCard8 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x000172_g_NewCard3 then
		local mItem = x000172_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end
	
	if grade == x000172_g_NewCard7 then
		local mItem = x000172_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x000172_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x000172_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- 门派套装
function x000172_GetMenpaiTaoEquip(mid)
	if(mid == MP_SHAOLIN) then
		return 10500002
	elseif(mid == MP_MINGJIAO) then
		return 10500012
	elseif(mid == MP_GAIBANG) then
		return 10501002
	elseif(mid == MP_WUDANG) then
		return 10502002
	elseif(mid == MP_EMEI) then
		return 10503002
	elseif(mid == MP_XINGSU) then
		return 10503012
	elseif(mid == MP_DALI) then
		return 10505002
	elseif(mid == MP_TIANSHAN) then
		return 10504002
	elseif(mid == MP_XIAOYAO) then
		return 10504012
	else
		return 0
	end
	return 0
end

-- 门派要诀
function x000172_GetMenpaiYaoJue(mid)
	if(mid == MP_SHAOLIN) then
		return 30308011
	elseif(mid == MP_MINGJIAO) then
		return 30308012
	elseif(mid == MP_GAIBANG) then
		return 30308013
	elseif(mid == MP_WUDANG) then
		return 30308014
	elseif(mid == MP_EMEI) then
		return 30308015
	elseif(mid == MP_XINGSU) then
		return 30308016
	elseif(mid == MP_DALI) then
		return 30308017
	elseif(mid == MP_TIANSHAN) then
		return 30308018
	elseif(mid == MP_XIAOYAO) then
		return 30308019
	else
		return 0
	end
	return 0
end
