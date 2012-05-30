-- 领奖NPC

x002084_g_scriptId = 002084

x002084_g_PrimaryAward = 1
x002084_g_Award2 = 2
x002084_g_Award3 = 3

x002084_g_Intro = 4

x002084_g_NewCard1 = 5
x002084_g_NewCard2 = 6
x002084_g_NewCard3 = 7
x002084_g_NewCard4 = 10
x002084_g_NewCard5 = 11
x002084_g_NewCard6 = 12
x002084_g_NewCard7 = 13
x002084_g_NewCard8 = 14

x002084_g_NewCardIntro = 9
x002084_g_VirtualNew = 30505080


--财富卡
x002084_g_NewCardList = {}
--x002084_g_NewCardList[x002084_g_NewCard1] = {
--	needLevel = -1,
--	itemAward = { hashTable = {}, itemList = {10402001,10422012,10423020,10141050,10141051} },
--	moneyReward = 0,
--	PropBagSpaceNeed = 5,
--	MatBagSpaceNeed = 0,
--	TaskBagSpaceNeed = 0,
--	flagBit = MF_GetNewUserCard0,
--	redundantMsg = "    你已经领过1级的奖励了，到15级再来找我吧。",
--	recvMsg = "#{Mis_NewUserCard_16}",
--}
--x002084_g_NewCardList[x002084_g_NewCard2] = {
--	needLevel = 40,
--	itemAward = { hashTable = {}, itemList = {} },
--	moneyReward = 10000,
--	PropBagSpaceNeed = 0,
--	MatBagSpaceNeed = 0,
--	TaskBagSpaceNeed = 0,
--	flagBit = MF_GetNewUserCard1,
--	redundantMsg = "    你已经领过40级奖励了，到60级再来找我吧。",
--	recvMsg = "    恭喜你成功领取40级领取，#G1万赠点。。",
--}
x002084_g_NewCardList[x002084_g_NewCard3] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 20000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    你已经领过60级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G2万赠点。。",
}
x002084_g_NewCardList[x002084_g_NewCard4] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 40000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    你已经领过80级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G4万赠点。。",
}
x002084_g_NewCardList[x002084_g_NewCard5] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 60000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    你已经领过100级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G6万赠点。。",
}
x002084_g_NewCardList[x002084_g_NewCard6] = {
	needLevel = 120,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 80000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    你已经领过120级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G8万赠点。。",
}
x002084_g_NewCardList[x002084_g_NewCard7] = {
	needLevel = 130,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 100000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    你已经领过130级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G10万赠点。。",
}
x002084_g_NewCardList[x002084_g_NewCard8] = {
	needLevel = 140,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 300000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    你已经领过140级奖励了。",
	recvMsg = "    恭喜你成功领取40级领取，#G30万赠点。。",
}

--**********************************
--事件交互入口
--**********************************
function x002084_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "    欢迎来到复古天龙八部，请到了一定等级到我这里领取赠点。。"
		AddText( sceneId, strText )

		AddNumText( sceneId, x002084_g_scriptId, "我要激活冲级拿赠点", 2, 101 )
		AddNumText( sceneId, x002084_g_scriptId, "我要提升心法到149级", 3, 1000 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--财富卡
function x002084_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "激活冲级送赠点", 2, 8 )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard1].flagBit ) == 0 then
		--	 AddNumText( sceneId, x002084_g_scriptId, "领取1级的奖励", 2, x002084_g_NewCard1 )
		--	 eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard2].flagBit ) == 0 then
		--	 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard2].needLevel .. "级的奖励[1万赠点]", 2, x002084_g_NewCard2 )
		--	 eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard3].needLevel .. "级的奖励[2万赠点]", 2, x002084_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard4].needLevel .. "级的奖励[4万赠点]", 2, x002084_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard5].needLevel .. "级的奖励[6万赠点]", 2, x002084_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard6].needLevel .. "级的奖励[8万赠点]", 2, x002084_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard7].needLevel .. "级的奖励[10万赠点]", 2, x002084_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x002084_g_NewCardList[x002084_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x002084_g_scriptId, "领取" .. x002084_g_NewCardList[x002084_g_NewCard8].needLevel .. "级的奖励[30万赠点]", 2, x002084_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的财富卡奖励。" )
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x002084_OnEventRequest( sceneId, selfId, targetId, eventId )


if x002084_g_NewCardIntro == GetNumText() then
		
		BeginEvent( sceneId )
			AddText( sceneId, "#{XinShouKa_Help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 520 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{CHAOJIDALIKA_090112_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )			
	end

	if GetNumText() == 8 then
		x002084_CheckNewUserCard(sceneId, selfId, targetId)
	elseif x002084_g_NewCardList[GetNumText()] then
		x002084_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x002084_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 1000 then
		x002084_UpdateXinFa(sceneId,selfId,targetId)
	end
		
	
end


--**********************************
-- 检查 财富卡
--**********************************
function x002084_UpdateXinFa( sceneId, selfId, targetId )

		if GetLevel( sceneId, selfId ) < 128  then
				x002084_NotifyFailBox( sceneId, selfId, targetId, "    你等级不到128级，无法提升心法。" )
				return
		end
	local nMenPaiId = GetMenPai(sceneId, selfId)
	local	nam	= LuaFnGetName( sceneId, selfId )
		if nMenPaiId == 9 then
						x002084_NotifyFailBox( sceneId, selfId, targetId, "    您目前无门派，无法提升心法。" )
				return
		end
		if nMenPaiId == 0 then
					LuaFnSetXinFaLevel(sceneId,selfId,1,149)
					LuaFnSetXinFaLevel(sceneId,selfId,2,149)
					LuaFnSetXinFaLevel(sceneId,selfId,3,149)
					LuaFnSetXinFaLevel(sceneId,selfId,4,149)
					LuaFnSetXinFaLevel(sceneId,selfId,5,149)
					LuaFnSetXinFaLevel(sceneId,selfId,6,149)
					LuaFnSetXinFaLevel(sceneId,selfId,55,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 1 then
					LuaFnSetXinFaLevel(sceneId,selfId,7,149)
					LuaFnSetXinFaLevel(sceneId,selfId,8,149)
					LuaFnSetXinFaLevel(sceneId,selfId,9,149)
					LuaFnSetXinFaLevel(sceneId,selfId,10,149)
					LuaFnSetXinFaLevel(sceneId,selfId,11,149)
					LuaFnSetXinFaLevel(sceneId,selfId,12,149)
					LuaFnSetXinFaLevel(sceneId,selfId,56,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 2 then
					LuaFnSetXinFaLevel(sceneId,selfId,13,149)
					LuaFnSetXinFaLevel(sceneId,selfId,14,149)
					LuaFnSetXinFaLevel(sceneId,selfId,15,149)
					LuaFnSetXinFaLevel(sceneId,selfId,16,149)
					LuaFnSetXinFaLevel(sceneId,selfId,17,149)
					LuaFnSetXinFaLevel(sceneId,selfId,18,149)
					LuaFnSetXinFaLevel(sceneId,selfId,57,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 3 then
					LuaFnSetXinFaLevel(sceneId,selfId,19,149)
					LuaFnSetXinFaLevel(sceneId,selfId,20,149)
					LuaFnSetXinFaLevel(sceneId,selfId,21,149)
					LuaFnSetXinFaLevel(sceneId,selfId,22,149)
					LuaFnSetXinFaLevel(sceneId,selfId,23,149)
					LuaFnSetXinFaLevel(sceneId,selfId,24,149)
					LuaFnSetXinFaLevel(sceneId,selfId,58,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 4 then
					LuaFnSetXinFaLevel(sceneId,selfId,25,149)
					LuaFnSetXinFaLevel(sceneId,selfId,26,149)
					LuaFnSetXinFaLevel(sceneId,selfId,27,149)
					LuaFnSetXinFaLevel(sceneId,selfId,28,149)
					LuaFnSetXinFaLevel(sceneId,selfId,29,149)
					LuaFnSetXinFaLevel(sceneId,selfId,30,149)
					LuaFnSetXinFaLevel(sceneId,selfId,59,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 5 then
					LuaFnSetXinFaLevel(sceneId,selfId,31,149)
					LuaFnSetXinFaLevel(sceneId,selfId,32,149)
					LuaFnSetXinFaLevel(sceneId,selfId,33,149)
					LuaFnSetXinFaLevel(sceneId,selfId,34,149)
					LuaFnSetXinFaLevel(sceneId,selfId,35,149)
					LuaFnSetXinFaLevel(sceneId,selfId,36,149)
					LuaFnSetXinFaLevel(sceneId,selfId,60,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 6 then
					LuaFnSetXinFaLevel(sceneId,selfId,37,149)
					LuaFnSetXinFaLevel(sceneId,selfId,38,149)
					LuaFnSetXinFaLevel(sceneId,selfId,39,149)
					LuaFnSetXinFaLevel(sceneId,selfId,40,149)
					LuaFnSetXinFaLevel(sceneId,selfId,41,149)
					LuaFnSetXinFaLevel(sceneId,selfId,42,149)
					LuaFnSetXinFaLevel(sceneId,selfId,61,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 7 then
					LuaFnSetXinFaLevel(sceneId,selfId,43,149)
					LuaFnSetXinFaLevel(sceneId,selfId,44,149)
					LuaFnSetXinFaLevel(sceneId,selfId,45,149)
					LuaFnSetXinFaLevel(sceneId,selfId,46,149)
					LuaFnSetXinFaLevel(sceneId,selfId,47,149)
					LuaFnSetXinFaLevel(sceneId,selfId,48,149)
					LuaFnSetXinFaLevel(sceneId,selfId,62,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		elseif nMenPaiId == 8 then
					LuaFnSetXinFaLevel(sceneId,selfId,49,149)
					LuaFnSetXinFaLevel(sceneId,selfId,50,149)
					LuaFnSetXinFaLevel(sceneId,selfId,51,149)
					LuaFnSetXinFaLevel(sceneId,selfId,52,149)
					LuaFnSetXinFaLevel(sceneId,selfId,53,149)
					LuaFnSetXinFaLevel(sceneId,selfId,54,149)
					LuaFnSetXinFaLevel(sceneId,selfId,63,149)
       				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 51, 0)
		end 

					--BroadMsgByChatPipe( sceneId, selfId, "#G恭喜玩家 "..nam.."成功提升心法到149级。", 4 )
					x002084_NotifyFailBox( sceneId, selfId, targetId, "    恭喜您成功提升心法到149级！" )
					return 0
end

--**********************************
-- 检查 财富卡
--**********************************
function x002084_CheckNewUserCard( sceneId, selfId, targetId )
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无须再次激活。" )
		return
	end
	
	-- 判断是否直接激活财富卡
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard()
	if nIsActive == 1 then
		--财富卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经激活财富卡成功，到达一定等级之后可以再来我这里领取奖励。" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x002084_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x002084_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--财富卡的虚拟卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经激活财富卡成功，到达一定等级之后可以再来我这里领取奖励。" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "  您的等级过高，无法启动大力卡" )
		return
		end
	
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
function x002084_Introduce( sceneId, selfId, targetId )
	x002084_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey是我们推广员发布给用户的序列号，使用此序列号在页面激活之后，可以到游戏中领取少许的奖励，并且只能领取一次。" )
end

--**********************************
-- 领财富卡奖品
--**********************************
function x002084_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x002084_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x002084_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end
	
	if grade == x002084_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x002084_NotifyFailBox( sceneId, selfId, targetId, "    您携带的珍兽已满，您可以放生一个珍兽留出空位。" )
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
		local ibagidx
		ibagidx =TryRecieveItem( sceneId, selfId, itemSN, 9 )
		if(itemSN == 30900015 and ibagidx ~= -1) then			--低级宝石合成符绑定 by Vega 20081008
			LuaFnItemBind(sceneId, selfId,ibagidx)								
		end
	end

	if awardInfo.moneyReward > 0 then
		if grade == x002084_g_NewCard1 or grade == x002084_g_NewCard2 or grade == x002084_g_NewCard3 or grade == x002084_g_NewCard4 or grade == x002084_g_NewCard5 or grade == x002084_g_NewCard6 or grade == x002084_g_NewCard7 or grade == x002084_g_NewCard8 then
			ZengDian(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			AddMoney( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x002084_g_NewCard3 then
		local mItem = x002084_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end
	
	if grade == x002084_g_NewCard7 then
		local mItem = x002084_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x002084_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x002084_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- 门派套装
function x002084_GetMenpaiTaoEquip(mid)
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
function x002084_GetMenpaiYaoJue(mid)
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
