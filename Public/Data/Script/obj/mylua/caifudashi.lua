-- 领奖NPC

x889066_g_scriptId = 889066

x889066_g_PrimaryAward = 1
x889066_g_Award2 = 2
x889066_g_Award3 = 3

x889066_g_Intro = 4

x889066_g_NewCard1 = 5
x889066_g_NewCard2 = 6
x889066_g_NewCard3 = 7
x889066_g_NewCard4 = 10
x889066_g_NewCard5 = 11
x889066_g_NewCard6 = 12
x889066_g_NewCard7 = 13
x889066_g_NewCard8 = 14

x889066_g_NewCardIntro = 9
x889066_g_VirtualNew = 30505080

x889066_g_VirtualNew666 = 30504027 --暂时没有虚卡
x889066_g_ActiveNewCard666 = 51--激活666财富卡选项

x889066_g_NewCard1_666 = 43
x889066_g_NewCard2_666 = 44
x889066_g_NewCard3_666 = 45
x889066_g_NewCard4_666 = 46
x889066_g_NewCard5_666 = 47
x889066_g_NewCard6_666 = 48
x889066_g_NewCard7_666 = 49
x889066_g_NewCard8_666 = 50

--电话密保赠品发放"润魂丹"
x889066_g_eventList={210244} --{210244}	LB JIA 添加210245于2008-7-29 10:23:36

--暂时关闭电话密保赠品，刘盾
--x889066_g_eventList={210244}


--CD-KEY
x889066_g_AwardList = {}
x889066_g_AwardList[x889066_g_PrimaryAward] = {
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
x889066_g_AwardList[x889066_g_Award2] = {
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
x889066_g_AwardList[x889066_g_Award3] = {
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
x889066_g_NewCardList = {}
x889066_g_NewCardList[x889066_g_NewCard1] = {
	needLevel = 50,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 10000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0,
	redundantMsg = "    你已经领过50级的奖励了，到60级再来找我吧。",
	recvMsg = "#{Mis_NewUserCard_16}",
}
x889066_g_NewCardList[x889066_g_NewCard2] = {
	needLevel = 60,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 30000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1,
	redundantMsg = "    你已经领过60级奖励了，到70级再来找我吧。",
	recvMsg = "#{Mis_NewUserCard_17}",
}
x889066_g_NewCardList[x889066_g_NewCard3] = {
	needLevel = 70,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 50000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2,
	redundantMsg = "    你已经领过70级奖励了。",
	recvMsg = "#{Mis_NewUserCard_18}",
}
x889066_g_NewCardList[x889066_g_NewCard4] = {
	needLevel = 80,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 60000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3,
	redundantMsg = "    你已经领过80级奖励了。",
	recvMsg = "#{Mis_NewUserCard_19}",
}
x889066_g_NewCardList[x889066_g_NewCard5] = {
	needLevel = 90,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 80000,
	PropBagSpaceNeed = 0,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4,
	redundantMsg = "    你已经领过90级奖励了。",
	recvMsg = "#{Mis_NewUserCard_20}",
}
x889066_g_NewCardList[x889066_g_NewCard6] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {} },
	moneyReward = 100000,
	PropBagSpaceNeed = 13,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5,
	redundantMsg = "    你已经领过100级奖励了。",
	recvMsg = "#{Mis_NewUserCard_21}",
}
x889066_g_NewCardList[x889066_g_NewCard7] = {
	needLevel = 130,
	itemAward = { hashTable = {}, itemList = {30900016} },
	moneyReward = 150000,
	PropBagSpaceNeed = 1,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6,
	redundantMsg = "    你已经领过130级奖励了。",
	recvMsg = "#{Mis_NewUserCard_22}",
}
x889066_g_NewCardList[x889066_g_NewCard8] = {
	needLevel = 149,
	itemAward = { hashTable = {}, itemList = {30900016} },
	moneyReward = 300000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 0,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7,
	redundantMsg = "    你已经领过149级奖励了。",
	recvMsg = "#{Mis_NewUserCard_23}",
}
	--财富卡666
x889066_g_NewCardListEx = {}
x889066_g_NewCardListEx[x889066_g_NewCard1_666] = {
	needLevel = 100,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard0_666,
	redundantMsg = "    你已经领过100级的奖励了，到100级再来找我吧。",
	recvMsg = "#{CHAOJIDALIKA_081224_1}",
}
x889066_g_NewCardListEx[x889066_g_NewCard2_666] = {
	needLevel = 120,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard1_666,
	redundantMsg = "    你已经领过120级奖励了，到120级再来找我吧。",
	recvMsg = "#{CHAOJIDALIKA_081224_2}",
}
x889066_g_NewCardListEx[x889066_g_NewCard3_666] = {
	needLevel = 140,
	itemAward = { hashTable = {}, itemList = {50601001,50601002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard2_666,
	redundantMsg = "    你已经领过140级奖励了。",
	recvMsg = "#{CHAOJIDALIKA_081224_3}",
}
x889066_g_NewCardListEx[x889066_g_NewCard4_666] = {
	needLevel = 160,
	itemAward = { hashTable = {}, itemList = {50701001,50701002} },
	moneyReward = 1000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard3_666,
	redundantMsg = "    你已经领过160级奖励了。",
	recvMsg = "#{CHAOJIDALIKA_081224_4}",
}
x889066_g_NewCardListEx[x889066_g_NewCard5_666] = {
		needLevel = 180,
	itemAward = { hashTable = {}, itemList = {50701001,50701002} },
	moneyReward = 0,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard4_666,
	redundantMsg = "    你已经领过180级奖励了。",
	recvMsg = "#{CHAOJIDALIKA_081224_5}",
}
x889066_g_NewCardListEx[x889066_g_NewCard6_666] = {
		needLevel = 200,
	itemAward = { hashTable = {}, itemList = {50801001,50801002} },
	moneyReward = 1000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard5_666,
	redundantMsg = "    你已经领过200级奖励了。",
	recvMsg = "#{CHAOJIDALIKA_081224_6}",
}
x889066_g_NewCardListEx[x889066_g_NewCard7_666] = {
	needLevel = 220,
	itemAward = { hashTable = {}, itemList = {50801001,50801002} },
	moneyReward = 2000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard6_666,
	redundantMsg = "    你已经领过220级奖励了。",
	recvMsg = "#{CAIFUKA_081224_7}",
}
x889066_g_NewCardListEx[x889066_g_NewCard8_666] = {
	needLevel = 240,
	itemAward = { hashTable = {}, itemList = {50901001,50901002} },
	moneyReward = 4000,
	PropBagSpaceNeed = 2,
	MatBagSpaceNeed = 2,
	TaskBagSpaceNeed = 0,
	flagBit = MF_GetNewUserCard7_666,
	redundantMsg = "    你已经领过240级奖励了。",
	recvMsg = "#{CAIFUKA_081224_8}",
}


--**********************************
--事件交互入口
--**********************************
function x889066_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		--strText = "    欢迎来到天龙八部游戏世界，有什么我能帮助你的吗？如果你已经在网站上使用过CD-KEY了，你还需要先激活领取条件才能领取奖励。"
		--AddText( sceneId, strText )

		--for i, eventId in x889066_g_eventList do
		--	CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		--end
		AddText( sceneId, "  #G欢迎来到#cFF0000升级奖励系统。" )	
		--AddText( sceneId, "  #Y级别从#cFF000050#W-#cFF0000149#W免费#Y可以领取奖励。" )
		--AddText( sceneId, "  #G等级#cFF0000100级#Y时可以免费领取#cFF0000特色套装。" )
		--AddText( sceneId, "  #G等级#cFF0000130#W-#cFF0000150级#Y时可以免费领取#cFF0000高级宝石合成符。" )
		--AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y领取#G套装元宝#W奖励", 2, 101 )
		AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y领取#G赠点#W奖励", 2, 103 )
		--AddNumText( sceneId, x889066_g_scriptId, "我是推广员cdkey用户", 2, 201 )
		
		--AddNumText( sceneId, x889066_g_scriptId, "#e0e8de5#Y领取#G高级宝石#W奖励", 2, 102 )
		--AddNumText( sceneId, x889066_g_scriptId, "我是推广员cdkey用户", 2, 201 )
		
		--AddNumText( sceneId, x889066_g_scriptId, "关于推广员系统介绍", 11, x889066_g_Intro )
		--AddNumText( sceneId, x889066_g_scriptId, "关于财富卡系统介绍", 11, x889066_g_NewCardIntro )
		--AddNumText( sceneId, x889066_g_scriptId, "关于超级大力卡系统介绍", 11, 520 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--CD-KEY
function x889066_AddCDKeyNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "激活cdkey", 2, 0 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_PrimaryAward].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "领取cdkey奖励", 2, x889066_g_PrimaryAward )
			 eventNum = eventNum + 1
		end

		--if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_Award2].flagBit ) == 0 then
			-- AddNumText( sceneId, x889066_g_scriptId, "领取" .. x889066_g_AwardList[x889066_g_Award2].needLevel .. "级的奖励", 2, x889066_g_Award2 )
			-- eventNum = eventNum + 1
		--end

		--if GetMissionFlag( sceneId, selfId, x889066_g_AwardList[x889066_g_Award3].flagBit ) == 0 then
			-- AddNumText( sceneId, x889066_g_scriptId, "领取" .. x889066_g_AwardList[x889066_g_Award3].needLevel .. "级的奖励", 2, x889066_g_Award3 )
			-- eventNum = eventNum + 1
		--end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的CDKEY奖励。" )
	end
end

--财富卡
function x889066_AddNewUserCardNumText(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
		AddText(sceneId," #ed7ffff#c0b38ba 欢迎来到天龙八部[叁]! ")
		--AddText(sceneId,"#effc9d8#cf30768 注意：财富卡不需激活,可以使用! ")

		--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 0 then
			 --AddNumText( sceneId, x889066_g_scriptId, "激活财富卡", 2, 8 )
			 --eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard1].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard1].needLevel .. "级#G [元宝:10000]#Y  奖励", 2, x889066_g_NewCard1 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard2].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard2].needLevel .. "级#G [元宝:30000]#Y 奖励", 2, x889066_g_NewCard2 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard3].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard3].needLevel .. "级#G [元宝:50000]#Y 奖励", 2, x889066_g_NewCard3 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard4].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard4].needLevel .. "级#G [元宝:60000]#Y 奖励", 2, x889066_g_NewCard4 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard5].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard5].needLevel .. "级#G [元宝:80000]#Y奖励", 2, x889066_g_NewCard5 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard6].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard6].needLevel .. "级#G [元宝:100000]#Y奖励", 2, x889066_g_NewCard6 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard7].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard7].needLevel .. "级#G[元宝:150000]#Y奖励", 2, x889066_g_NewCard7 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardList[x889066_g_NewCard8].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取#cFF0000" .. x889066_g_NewCardList[x889066_g_NewCard8].needLevel .. "级#G[元宝:300000]#Y奖励", 2, x889066_g_NewCard8 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的财富卡奖励。" )
	end
end

--财富卡666
function x889066_AddNewUserCardNumText666(sceneId, selfId, targetId)
	local eventNum = 0
	BeginEvent( sceneId )
	
		--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) == 0 then
			 --AddNumText( sceneId, x889066_g_scriptId, "启动超级大力卡", 2, x889066_g_ActiveNewCard666 )
			 --eventNum = eventNum + 1
		--end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard1_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard1_666].needLevel .. "级#G[6级宝石]#Y奖励", 2, x889066_g_NewCard1_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard2_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard2_666].needLevel .. "级#G[6级宝石]#Y奖励", 2, x889066_g_NewCard2_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard3_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard3_666].needLevel .. "级#G[6级宝石]#Y奖励", 2, x889066_g_NewCard3_666 )
			 eventNum = eventNum + 1
		end
		
		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard4_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard4_666].needLevel .. "级#G[7级宝石]#Y奖励", 2, x889066_g_NewCard4_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard5_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard5_666].needLevel .. "级#G[7级宝石]#Y奖励", 2, x889066_g_NewCard5_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard6_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard6_666].needLevel .. "级#G[8级宝石]#Y奖励", 2, x889066_g_NewCard6_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard7_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard7_666].needLevel .. "级#G[8级宝石]#Y奖励", 2, x889066_g_NewCard7_666 )
			 eventNum = eventNum + 1
		end

		if GetMissionFlag( sceneId, selfId, x889066_g_NewCardListEx[x889066_g_NewCard8_666].flagBit ) == 0 then
			 AddNumText( sceneId, x889066_g_scriptId, "#c33ffcc领取 #cFF0000" .. x889066_g_NewCardListEx[x889066_g_NewCard8_666].needLevel .. "级#G[9级宝石]#Y奖励", 2, x889066_g_NewCard8_666 )
			 eventNum = eventNum + 1
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	if eventNum == 0 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已领取所有的超级大力卡奖励。" )
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x889066_OnEventRequest( sceneId, selfId, targetId, eventId )


if x889066_g_NewCardIntro == GetNumText() then
		
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

	if GetNumText() == 0 then
		x889066_CheckCDKey( sceneId, selfId, targetId )
	elseif GetNumText() == x889066_g_Intro then
		x889066_Introduce( sceneId, selfId, targetId )
	elseif x889066_g_AwardList[GetNumText()] then
		x889066_GetAward( sceneId, selfId, targetId, GetNumText() )
	elseif GetNumText() == 8 then
		x889066_CheckNewUserCard(sceneId, selfId, targetId)
	elseif GetNumText() == x889066_g_ActiveNewCard666 then
		x889066_CheckNewUserCard666(sceneId, selfId, targetId)
	elseif x889066_g_NewCardList[GetNumText()] then
		x889066_GetNewCardPrize( sceneId, selfId, targetId, GetNumText())
	elseif x889066_g_NewCardListEx[GetNumText()] then
		x889066_GetNewCardPrize666( sceneId, selfId, targetId, GetNumText())
	elseif GetNumText() == 101 then
		x889066_AddNewUserCardNumText(sceneId,selfId,targetId)
	elseif GetNumText() == 102 then
		x889066_AddNewUserCardNumText666(sceneId,selfId,targetId)
	elseif GetNumText() == 103 then
		BeginEvent( sceneId )
			AddText( sceneId, "#Y领取等级赠点奖励，请使用#G随身宝石#Y->#G随身功能#Y->#G领取奖励#Y。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 201 then
		x889066_AddCDKeyNumText(sceneId, selfId, targetId)	
	end
		
	for i, eventId in x889066_g_eventList do		
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		--return --警告：在没有条件处理的情况下，循环中慎用return
	end	
	
end

--**********************************
-- 检查 CDKey
--**********************************
function x889066_CheckCDKey( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		return
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无法再激活cdkey。" )
		--return
	--end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    对不起，你已经超过10级，无法激活领奖条件。" )
		--return
	--end

	CallScriptFunction( PRIZE_SCRIPT_ID, "AskCDKey", sceneId, selfId )

	-- 以下为测试使用
	-- SetMissionFlag( sceneId, selfId, MF_GetAwardFlag, 1 )
end

--**********************************
-- 检查 财富卡
--**********************************
function x889066_CheckNewUserCard( sceneId, selfId, targetId )
	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过cdkey，无法再激活财富卡。" )
		return
	end
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已经激活过财富卡，无须再次激活。" )
		return
	end

	--if GetLevel( sceneId, selfId ) >= 10 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的等级已经大于10级，无法再激活财富卡。" )
		--return
	--end
	
	-- 判断是否直接激活财富卡
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard()
	if nIsActive == 1 then
		--财富卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经激活财富卡成功，到达一定等级之后可以再来我这里领取奖励。" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889066_g_VirtualNew )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x889066_g_VirtualNew, 1 )
		if ret < 1 then
			return
		end
		--财富卡的虚拟卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经激活财富卡成功，到达一定等级之后可以再来我这里领取奖励。" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "  您的等级过高，无法启动财富卡" )
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
-- 检查 财富卡666
--**********************************
function x889066_CheckNewUserCard666( sceneId, selfId, targetId )
	
	if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你已经启动过超级大力卡，无须再次启动。" )
		return
	end

	-- 判断是否直接激活财富卡
	-- [ QUFEI 2008-02-29 22:26 UPDATE BugID 32610 ]
	local nIsActive = 0
	nIsActive = IsActiveRichesCard666()
	if nIsActive == 1 then
		--财富卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    恭喜！你已经启动超级大力卡成功，到达一定等级之后可以再来我这里领取奖励。" )
		
		return 0
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889066_g_VirtualNew666 )
	if nItemNum > 0 then
		local ret = LuaFnDelAvailableItem( sceneId, selfId, x889066_g_VirtualNew666, 1 )
		if ret < 1 then
			return
		end
		--财富卡的虚拟卡开卡
		SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
		x889066_NotifyFailBox( sceneId, selfId, targetId, "   恭喜！你已经启动超级大力卡成功，到达一定等级之后可以再来我这里领取奖励。" )
	else
	
		if GetLevel( sceneId, selfId ) > 30 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "  您的等级过高，无法启动财富卡" )
		return
		end
	
		--打开输入财富卡卡号界面
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 20080819 )
	end

	-- 以下为测试使用
	--SetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666, 1 )
end

--**********************************
-- 推广员系统介绍
--**********************************
function x889066_Introduce( sceneId, selfId, targetId )
	x889066_NotifyFailBox( sceneId, selfId, targetId, "    Cdkey是我们推广员发布给用户的序列号，使用此序列号在页面激活之后，可以到游戏中领取少许的奖励，并且只能领取一次。" )
end

--**********************************
-- 领CD-KEY奖品
--**********************************
function x889066_GetAward( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_AwardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	if GetMissionFlag( sceneId, selfId, MF_GetAwardFlag ) ~= 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		return
	end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
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
		YuanBao( sceneId, selfId, awardInfo.moneyReward )
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )
end

--**********************************
-- 领财富卡奖品
--**********************************
function x889066_GetNewCardPrize( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_NewCardList[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard ) ~= 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		--return
	--end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end
	
	if grade == x889066_g_NewCard3 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x889066_NotifyFailBox( sceneId, selfId, targetId, "    您携带的珍兽已满，您可以放生一个珍兽留出空位。" )
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
		if grade == x889066_g_NewCard1 or grade == x889066_g_NewCard2 or grade == x889066_g_NewCard3 or grade == x889066_g_NewCard4 or grade == x889066_g_NewCard5 or grade == x889066_g_NewCard6 or grade == x889066_g_NewCard7 or grade == x889066_g_NewCard8 then
			YuanBao(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			YuanBao( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x889066_g_NewCard5 then
		local MemPai=GetMenPai(sceneId, selfId)
		    if MemPai == 0 then
			TryRecieveItem( sceneId, selfId, 10500009, 1 )
			TryRecieveItem( sceneId, selfId, 10510009, 1 )
			TryRecieveItem( sceneId, selfId, 10511009, 1 )
			TryRecieveItem( sceneId, selfId, 10512009, 1 )
			TryRecieveItem( sceneId, selfId, 10513009, 1 )
			TryRecieveItem( sceneId, selfId, 10514009, 1 )
			TryRecieveItem( sceneId, selfId, 10515009, 1 )
			TryRecieveItem( sceneId, selfId, 10520009, 1 )
			TryRecieveItem( sceneId, selfId, 10521009, 1 )
			TryRecieveItem( sceneId, selfId, 10522009, 1 )
			TryRecieveItem( sceneId, selfId, 10523009, 1 )
			TryRecieveItem( sceneId, selfId, 10552009, 1 )
			TryRecieveItem( sceneId, selfId, 10553009, 1 )
		    elseif MemPai == 1  then
			TryRecieveItem( sceneId, selfId, 10500019, 1 )
			TryRecieveItem( sceneId, selfId, 10510019, 1 )
			TryRecieveItem( sceneId, selfId, 10511019, 1 )
			TryRecieveItem( sceneId, selfId, 10512019, 1 )
			TryRecieveItem( sceneId, selfId, 10513019, 1 )
			TryRecieveItem( sceneId, selfId, 10514019, 1 )
			TryRecieveItem( sceneId, selfId, 10515019, 1 )
			TryRecieveItem( sceneId, selfId, 10520019, 1 )
			TryRecieveItem( sceneId, selfId, 10521019, 1 )
			TryRecieveItem( sceneId, selfId, 10522019, 1 )
			TryRecieveItem( sceneId, selfId, 10523019, 1 )
			TryRecieveItem( sceneId, selfId, 10552019, 1 )
			TryRecieveItem( sceneId, selfId, 10553019, 1 )
		    elseif MemPai == 2  then
			TryRecieveItem( sceneId, selfId, 10501009, 1 )
			TryRecieveItem( sceneId, selfId, 10510029, 1 )
			TryRecieveItem( sceneId, selfId, 10511029, 1 )
			TryRecieveItem( sceneId, selfId, 10512029, 1 )
			TryRecieveItem( sceneId, selfId, 10513029, 1 )
			TryRecieveItem( sceneId, selfId, 10514029, 1 )
			TryRecieveItem( sceneId, selfId, 10515029, 1 )
			TryRecieveItem( sceneId, selfId, 10520029, 1 )
			TryRecieveItem( sceneId, selfId, 10521029, 1 )
			TryRecieveItem( sceneId, selfId, 10522029, 1 )
			TryRecieveItem( sceneId, selfId, 10523029, 1 )
			TryRecieveItem( sceneId, selfId, 10552029, 1 )
			TryRecieveItem( sceneId, selfId, 10553029, 1 )
		    elseif MemPai == 3  then
			TryRecieveItem( sceneId, selfId, 10502009, 1 )
			TryRecieveItem( sceneId, selfId, 10510039, 1 )
			TryRecieveItem( sceneId, selfId, 10511039, 1 )
			TryRecieveItem( sceneId, selfId, 10512039, 1 )
			TryRecieveItem( sceneId, selfId, 10513039, 1 )
			TryRecieveItem( sceneId, selfId, 10514039, 1 )
			TryRecieveItem( sceneId, selfId, 10515039, 1 )
			TryRecieveItem( sceneId, selfId, 10520039, 1 )
			TryRecieveItem( sceneId, selfId, 10521039, 1 )
			TryRecieveItem( sceneId, selfId, 10522039, 1 )
			TryRecieveItem( sceneId, selfId, 10523039, 1 )
			TryRecieveItem( sceneId, selfId, 10552039, 1 )
			TryRecieveItem( sceneId, selfId, 10553039, 1 )
		    elseif MemPai == 4  then
			TryRecieveItem( sceneId, selfId, 10503009, 1 )
			TryRecieveItem( sceneId, selfId, 10510049, 1 )
			TryRecieveItem( sceneId, selfId, 10511049, 1 )
			TryRecieveItem( sceneId, selfId, 10512049, 1 )
			TryRecieveItem( sceneId, selfId, 10513049, 1 )
			TryRecieveItem( sceneId, selfId, 10514049, 1 )
			TryRecieveItem( sceneId, selfId, 10515049, 1 )
			TryRecieveItem( sceneId, selfId, 10520049, 1 )
			TryRecieveItem( sceneId, selfId, 10521049, 1 )
			TryRecieveItem( sceneId, selfId, 10522049, 1 )
			TryRecieveItem( sceneId, selfId, 10523049, 1 )
			TryRecieveItem( sceneId, selfId, 10552049, 1 )
			TryRecieveItem( sceneId, selfId, 10553049, 1 )
		    elseif MemPai == 5  then
			TryRecieveItem( sceneId, selfId, 10503019, 1 )
			TryRecieveItem( sceneId, selfId, 10510059, 1 )
			TryRecieveItem( sceneId, selfId, 10511059, 1 )
			TryRecieveItem( sceneId, selfId, 10512059, 1 )
			TryRecieveItem( sceneId, selfId, 10513059, 1 )
			TryRecieveItem( sceneId, selfId, 10514059, 1 )
			TryRecieveItem( sceneId, selfId, 10515059, 1 )
			TryRecieveItem( sceneId, selfId, 10520059, 1 )
			TryRecieveItem( sceneId, selfId, 10521059, 1 )
			TryRecieveItem( sceneId, selfId, 10522059, 1 )
			TryRecieveItem( sceneId, selfId, 10523059, 1 )
			TryRecieveItem( sceneId, selfId, 10552059, 1 )
			TryRecieveItem( sceneId, selfId, 10553059, 1 )
		    elseif MemPai == 6  then
			TryRecieveItem( sceneId, selfId, 10504009, 1 )
			TryRecieveItem( sceneId, selfId, 10510069, 1 )
			TryRecieveItem( sceneId, selfId, 10511069, 1 )
			TryRecieveItem( sceneId, selfId, 10512069, 1 )
			TryRecieveItem( sceneId, selfId, 10513069, 1 )
			TryRecieveItem( sceneId, selfId, 10514069, 1 )
			TryRecieveItem( sceneId, selfId, 10515069, 1 )
			TryRecieveItem( sceneId, selfId, 10520069, 1 )
			TryRecieveItem( sceneId, selfId, 10521069, 1 )
			TryRecieveItem( sceneId, selfId, 10522069, 1 )
			TryRecieveItem( sceneId, selfId, 10523069, 1 )
			TryRecieveItem( sceneId, selfId, 10552069, 1 )
			TryRecieveItem( sceneId, selfId, 10553069, 1 )
		    elseif MemPai == 7  then
			TryRecieveItem( sceneId, selfId, 10504019, 1 )
			TryRecieveItem( sceneId, selfId, 10510079, 1 )
			TryRecieveItem( sceneId, selfId, 10511079, 1 )
			TryRecieveItem( sceneId, selfId, 10512079, 1 )
			TryRecieveItem( sceneId, selfId, 10513079, 1 )
			TryRecieveItem( sceneId, selfId, 10514079, 1 )
			TryRecieveItem( sceneId, selfId, 10515079, 1 )
			TryRecieveItem( sceneId, selfId, 10520079, 1 )
			TryRecieveItem( sceneId, selfId, 10521079, 1 )
			TryRecieveItem( sceneId, selfId, 10522079, 1 )
			TryRecieveItem( sceneId, selfId, 10523079, 1 )
			TryRecieveItem( sceneId, selfId, 10552079, 1 )
			TryRecieveItem( sceneId, selfId, 10553079, 1 )
		    elseif MemPai == 8  then
			TryRecieveItem( sceneId, selfId, 10505009, 1 )
			TryRecieveItem( sceneId, selfId, 10510089, 1 )
			TryRecieveItem( sceneId, selfId, 10511089, 1 )
			TryRecieveItem( sceneId, selfId, 10512089, 1 )
			TryRecieveItem( sceneId, selfId, 10513089, 1 )
			TryRecieveItem( sceneId, selfId, 10514089, 1 )
			TryRecieveItem( sceneId, selfId, 10515089, 1 )
			TryRecieveItem( sceneId, selfId, 10520089, 1 )
			TryRecieveItem( sceneId, selfId, 10521089, 1 )
			TryRecieveItem( sceneId, selfId, 10522089, 1 )
			TryRecieveItem( sceneId, selfId, 10523089, 1 )
			TryRecieveItem( sceneId, selfId, 10552089, 1 )
			TryRecieveItem( sceneId, selfId, 10553089, 1 )
		   end
	end

	if grade == x889066_g_NewCard7 then
		local mItem = x889066_GetMenpaiYaoJue(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.recvMsg )

		local str = ""
		local rand = random(5)
				
		if rand == 1  then
			str = format("#effc9d8#cf30768最新消息,#eFFFF00#g11Cc3F#{_INFOUSR%s}#effc9d8#cf30768在洛阳免费领取了奖励，所有玩家到达等级后可以免费领取大量元宝和套装！", GetName(sceneId,selfId))
		elseif rand == 2  then
			str = format("#b#e6f00c7#c00ffff通知！#effffff#gffff00#{_INFOUSR%s}#e6f00c7#c00ffff到达了等级,在#effffff#gffff00洛阳等级奖励#e6f00c7#c00ffff领取了大量的元宝和套装！", GetName(sceneId,selfId))
		elseif rand == 3  then
			str = format("#e0ba4b6#c00ffff亲爱的玩家注意,现在#effffff#gf0fff5#{_INFOUSR%s}#e0ba4b6#c00ffff在洛阳等级奖励NPC,免费领取了大量元宝和套装！", GetName(sceneId,selfId))
		elseif rand == 4  then
			str = format("#b#gffff00#{_INFOUSR%s}#e6f00c7真是够朋友,在等级奖励NPC处领取了大量的元宝和套装,免费通知大家别忘记去领取哦！", GetName(sceneId,selfId))
		else
			str = format("#e0e8de5#Y恭喜#gffff00#{_INFOUSR%s}#e0e8de5#Y在洛阳等级奖励NPC处领取了大量元宝和套装,等级到了的玩家都可以免费领取哦！", GetName(sceneId,selfId))
		end
				
		BroadMsgByChatPipe(sceneId, selfId, str, 4)
end

--**********************************
-- 领财富卡奖品666
--**********************************
function x889066_GetNewCardPrize666( sceneId, selfId, targetId, grade )
	local awardInfo = x889066_g_NewCardListEx[grade]
	if not awardInfo then
		return
	end

	if GetMissionFlag( sceneId, selfId, awardInfo.flagBit ) == 1 then
		x889066_NotifyFailBox( sceneId, selfId, targetId, awardInfo.redundantMsg )
		return													-- 领过了
	end

	--if GetMissionFlag( sceneId, selfId, MF_ActiveNewUserCard666 ) ~= 1 then
		--x889066_NotifyFailBox( sceneId, selfId, targetId, "    你暂时无法领取到奖励。" )
		--return
	--end

	if GetLevel( sceneId, selfId ) < awardInfo.needLevel then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    嗯，你的等级不够，待等级达到" .. awardInfo.needLevel .. "级再来找我吧。" )
		return
	end

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < awardInfo.PropBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包道具栏至少需要留出" .. awardInfo.PropBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < awardInfo.MatBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包材料栏至少需要留出" .. awardInfo.MatBagSpaceNeed .. "格。" )
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < awardInfo.TaskBagSpaceNeed then
		x889066_NotifyFailBox( sceneId, selfId, targetId, "    你的背包任务栏至少需要留出" .. awardInfo.TaskBagSpaceNeed .. "格。" )
		return
	end
	
	if grade == x889066_g_NewCard3_666 then
		if TryCreatePet(sceneId,selfId,1) <= 0 then
			x889066_NotifyFailBox( sceneId, selfId, targetId, "    您携带的珍兽已满，您可以放生一个珍兽留出空位。" )
			return
		end
	end

	local itemSN, itemName, itemDesc, bBroadCast
	for i, row in awardInfo.itemAward.hashTable do
		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( row )
		if itemSN > -1 then
			local bagpos01 = TryRecieveItem( sceneId, selfId, itemSN, 9 )								-- 放不下就没有了
			LuaFnItemBind( sceneId, selfId, bagpos01 )
		end
	end

	for i, itemSN in awardInfo.itemAward.itemList do
		local ibagidx = TryRecieveItem( sceneId, selfId, itemSN, 9 )
		LuaFnItemBind(sceneId, selfId,ibagidx)	

	end

	if awardInfo.moneyReward > 0 then
		if grade == x889066_g_NewCard4_666 or grade == x889066_g_NewCard5_666 or grade == x889066_g_NewCard6_666 or grade == x889066_g_NewCard7_666 or grade == x889066_g_NewCard8_666 then
			YuanBao(sceneId,selfId,targetId,1,awardInfo.moneyReward)
		else
			YuanBao( sceneId, selfId, awardInfo.moneyReward )
		end
	end
	
	if grade == x889066_g_NewCard3_666 then
		local mItem = x889066_GetMenpaiTaoEquip(GetMenPai(sceneId,selfId))
		if mItem > 0 then
			TryRecieveItem( sceneId, selfId, mItem, 9 )
		end
		LuaFnCreatePetToHuman(sceneId, selfId, 3359, 1, 0)
	end

	SetMissionFlag( sceneId, selfId, awardInfo.flagBit, 1 )
	x889066_NotifyFailBox( sceneId, selfId, targetId, "恭喜您成功领取奖励" )
end


--**********************************
-- 对话窗口信息提示
--**********************************
function x889066_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

-- 门派套装
function x889066_GetMenpaiTaoEquip(mid)
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
function x889066_GetMenpaiYaoJue(mid)
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
