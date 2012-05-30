--城市NPC
--衙役

x805009_g_scriptId = 805009
x805009_g_BuildingID1 = 0

--所拥有的事件ID列表
x805009_g_eventList = { 600035, 600040 }

-- 任务集事件 ID 列表，这类事件包含子事件
x805009_g_eventSetList = { 600035, 600040 }

--官票类型ID
x805009_g_TicketItemIdx	=	40002000

-- 银票ID
x805009_g_Yinpiao = 40002000


-- 贡献都称号
x805009_g_GuildContriTitle = 
{
	{ currName="",	nextId=242, needContri=250, 	name="★关内侯"},
	{ currName="★关内侯",	nextId=243, needContri=750, 	name="★亭侯"},
	{ currName="★亭侯", 	nextId=244, needContri=1500, 	name="★乡侯"},
	{ currName="★乡侯", 	nextId=245, needContri=3000, 	name="★县侯"},
	{ currName="★县侯", 	nextId=246, needContri=7500, 	name="★郡侯"},
	{ currName="★郡侯", 	nextId=247, needContri=15000, 	name="★县公"},
	{ currName="★县公", 	nextId=248, needContri=30000, 	name="★郡公"},
	{ currName="★郡公", 	nextId=249, needContri=60000, 	name="★国公"},
	{ currName="★国公", 	nextId=250, needContri=125000, 	name="★郡王"},
	{ currName="★郡王", 	nextId=251, needContri=250000, 	name="★亲王"}
}


--**********************************
--事件列表
--**********************************
function x805009_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)

	BeginEvent( sceneId )
		if(Humanguildid == cityguildid) then
--		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			AddText( sceneId, "    帮中大小事务，有需要我能帮你什么的，一家兄弟不必客气。" )

			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到一级", 6, 1 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到二级", 6, 2 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到三级", 6, 3 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到四级", 6, 4 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置建筑到五级", 6, 5 )

			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到一级", 6, 6 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到二级", 6, 7 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到三级", 6, 8 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到四级", 6, 9 )
			--AddNumText( sceneId, x805009_g_scriptId, "设置场景到五级", 6, 10 )

			--AddNumText( sceneId, x805009_g_scriptId, "调整六率方向", 6, 13 )
			AddNumText( sceneId, x805009_g_scriptId, "设置/查看上线留言", 6, 22 )
			AddNumText( sceneId, x805009_g_scriptId, "城市建设", 6, 12 )
			AddNumText( sceneId, x805009_g_scriptId, "城市研究", 6, 14 )

			for i, eventId in x805009_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
			--AddNumText( sceneId, x805009_g_scriptId, "帮会徽章", 6, 15 )
			--AddNumText( sceneId, x805009_g_scriptId, "获得跑商官票", 7, 16 )
			--AddNumText( sceneId, x805009_g_scriptId, "交回跑商官票", 7, 17 )
			AddNumText( sceneId, x805009_g_scriptId, "商业路线", 12, 18 )
			AddNumText( sceneId, x805009_g_scriptId, "县衙介绍", 11, 19 )
			AddNumText( sceneId, x805009_g_scriptId, "建设任务介绍", 11, 20 )
			AddNumText( sceneId, x805009_g_scriptId, "研究任务介绍", 11, 21 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_02}", 11, 25 )--关于兑换帮贡牌
			AddNumText( sceneId, x805009_g_scriptId, "申请成为帮主", 6, 23 )
			AddNumText( sceneId, x805009_g_scriptId, "#{SQBZ_090205_01}", 11, 26 )
			--AddNumText( sceneId, x805009_g_scriptId, "回到洛阳", 9, 11 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
			--AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
			AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090226_10}", 9, 29 )
			local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
			local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
			local guildName = LuaFnGetGuildName(sceneId, selfId);
			for i, titleItem in x805009_g_GuildContriTitle do
				if currGuildContriTitle == "" then
					currGuildContriTitle = guildName
				end
				if currGuildContriTitle == guildName..titleItem.currName then
					AddNumText( sceneId, x805009_g_scriptId, "晋升为"..titleItem.name, 6, 30 )
					break;
				end
			end
			
			AddNumText( sceneId, x805009_g_scriptId, "#{BGCH_8829_01}", 6, 24 )--将帮贡兑换成帮贡牌

		else
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "侠女"
			elseif PlayerGender == 1 then
				rank = "少侠"
			else
				rank = "这位"
			end

			AddText( sceneId, "    " .. rank .. "面生得紧，我乃本城的主管，有什么事情我可以接待外客。" )
		end

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805009_OnDefaultEvent( sceneId, selfId, targetId )
	x805009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805009_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805009_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805009_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805009_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- 处理正常的事件列表中的事件
	if x805009_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end

	-- 处理本脚本自带事件，孙雨写的，未作修改
	if GetNumText() == 1 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 0)
	elseif GetNumText() == 2 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 1)
	elseif GetNumText() == 3 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 2)
	elseif GetNumText() == 4 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 3)
	elseif GetNumText() == 5 then
		CityBuildingChange(sceneId, selfId, x805009_g_BuildingID1, 4)
	elseif GetNumText() == 6 then
		CitySetLevel(sceneId, selfId, sceneId, 0)
	elseif GetNumText() == 7 then
		CitySetLevel(sceneId, selfId, sceneId, 1)
	elseif GetNumText() == 8 then
		CitySetLevel(sceneId, selfId, sceneId, 2)
	elseif GetNumText() == 9 then
		CitySetLevel(sceneId, selfId, sceneId, 3)
	elseif GetNumText() == 10 then
		CitySetLevel(sceneId, selfId, sceneId, 4)
	elseif GetNumText() == 11 then
		-- 如果玩家正在跑商，就不让玩家使用这个功能
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 0,144,98)

	elseif GetNumText() == 12 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市内政界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 100)
	elseif GetNumText() == 13 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市发展趋势界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 101)
	elseif GetNumText() == 14 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市研究界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 102)
	elseif GetNumText() == 15 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用帮会大旗界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 103)
	elseif GetNumText() == 18 then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId) --调用城市商业路线界面
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 105)
	elseif GetNumText() == 16 then
		--获得官票，关闭，移到银行npc处

		--是否是本帮成员
		local guildid 		= GetHumanGuildID(sceneId,selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "阁下不是本帮成员，本帮任务不便相告。"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--是否是商人或帮主
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ((guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN)) then
				BeginEvent(sceneId)
					strText = "对不起,只有商业官员或是帮主才能够获得官票."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--级别是否够
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "这位小兄弟现在就来经商，未免早了一些，不如到40级再来找我，方是道理。"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local curMoney = 0
		local maxMoney = 0

		if level>=40 and level<55 then
			curMoney = 20000
			maxMoney = 100000
		elseif level>=55 and level<69 then
			curMoney = 30000
			maxMoney = 150000
		elseif level>=70 and level<84 then
			curMoney = 40000
			maxMoney = 250000
		elseif level>=85 and level<100 then
			curMoney = 50000
			maxMoney = 300000
		end

		--是否有银票
		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)

		if bagpos ~= -1	then
				BeginEvent(sceneId)
					strText = "对不起,您只能领取一张官票"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return

		elseif bagpos == -1 then

				--帮派资金是否够开出一张银票的
				local GuildMoney = CityGetAttr(sceneId, selfId, GUILD_MONEY)
				if GuildMoney <= curMoney then
						BeginEvent(sceneId)
							strText = "帮派资金不够为你开出银票"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
				end

				BeginAddItem( sceneId )
				AddItem( sceneId, x805009_g_TicketItemIdx, 1 )
				ret = EndAddItem( sceneId, selfId )
				if ret > 0 then
					AddItemListToHuman(sceneId,selfId )
					bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
					--根据所在场景,物品类型获得应该的物品价值
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE, curMoney)
					SetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE, maxMoney)
					CityChangeAttr(sceneId, selfId, GUILD_MONEY, (-1)*curMoney)
					LuaFnRefreshItemInfo(sceneId, selfId, bagpos)
					BeginEvent(sceneId)
						strText = "甚好甚好，这张银票你且拿去，多为本帮赚回些资金，功劳不小啊。"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				else
					BeginEvent(sceneId)
						strText = "背包已满,无法接受任务"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
				end
		end

	elseif GetNumText() == 17 then
		--交回银票，关闭，移到银行npc处

		--是否是本帮成员
		local guildid 		= GetHumanGuildID(sceneId, selfId)
		local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)

		if(guildid ~= cityguildid) then
				BeginEvent(sceneId)
					strText = "阁下不是本帮成员..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--是否是商人或帮主
		local	guildpos = GetGuildPos(sceneId, selfId)
		if ( (guildpos ~= GUILD_POSITION_COM) and (guildpos ~= GUILD_POSITION_CHIEFTAIN) ) then
				BeginEvent(sceneId)
					strText = "对不起,只有商业官员或是帮主才能够交还银票."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		--级别是否够
		local level = GetLevel(sceneId, selfId)
		if(level<40) then
				BeginEvent(sceneId)
					strText = "这位小兄弟现在就来经商，未免早了一些..."
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
		end

		local	bagpos = GetBagPosByItemSn(sceneId, selfId, x805009_g_TicketItemIdx)
		if bagpos ~= -1	then
			local	TicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_CUR_MONEY_START, TICKET_ITEM_PARAM_CUR_MONEY_TYPE)
			local	MaxTicketMoney = GetBagItemParam(sceneId, selfId, bagpos, TICKET_ITEM_PARAM_MAX_MONEY_START, TICKET_ITEM_PARAM_MAX_MONEY_TYPE)
			if TicketMoney ~= 0 then

				if TicketMoney < MaxTicketMoney	then
						BeginEvent(sceneId)
							strText = "你的银票没有赚到应赚的价值，再去赚赚吧。"
							AddText(sceneId,strText);
						EndEvent(sceneId)
						DispatchMissionTips(sceneId,selfId)
						return
				end

				CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, 50)
				CityChangeAttr(sceneId, selfId, GUILD_MONEY, TicketMoney*0.9)
				AddMoney(sceneId, selfId, TicketMoney*0.1)
				AddExp(sceneId, selfId, 20000)
				local ReturnType = DelItem(sceneId, selfId, x805009_g_TicketItemIdx, 1)
				if ReturnType == 0 then
					BeginEvent(sceneId)
						strText = "无法删除银票"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				else
					BeginEvent(sceneId)
						strText = "成功删除银票"
						AddText(sceneId,strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					return
				end

			else
				BeginEvent(sceneId)
					strText = "对不起,您的银票里没钱"
					AddText(sceneId,strText);
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
		else
			BeginEvent(sceneId)
				strText = "对不起,您没有银票"
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif GetNumText() == 19 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_XianYa}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 20 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Build}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 21 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{City_Intro_Research}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 22 then
		local guildpos = GetGuildPos( sceneId, selfId )
		if guildpos ~= GUILD_POSITION_ASS_CHIEFTAIN and guildpos ~= GUILD_POSITION_CHIEFTAIN then
			--如果不是帮主或副帮主则打开查看留言界面....
			
			--准备打开查看留言界面....(等待LeaveWord更新....)
			--UI脚本不会直接打开界面而是向World请求帮会留言(更新本地帮会留言)....
			--当客户端的LeaveWord被更新后会发送UI消息....到那时查看留言界面才会打开....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19841120 )
			return
		else
			--如果是帮主或副帮主则打开设置留言界面....
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 19840424 )
			return
		end
		
	elseif GetNumText() == 23 then
		GuildPromoteToChief(sceneId, selfId)
		
	--将帮贡兑换成帮贡牌
	elseif GetNumText() == 24 then
	
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19821 )

	--关于兑换帮贡牌
	elseif GetNumText() == 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{BGCH_8829_05}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	
	--关于申请成为帮主
	elseif GetNumText() == 26 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SQBZ_090205_02}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )

 --回到大理
	elseif GetNumText() == 27 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 2,181,120)
		
	--回到苏州
	elseif GetNumText() == 28 then
		if GetItemCount(sceneId, selfId, x805009_g_Yinpiao)>=1  then
			BeginEvent( sceneId )
				AddText( sceneId, "  你身上有银票，正在跑商！我不能帮助你。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--NewWorld(sceneId, selfId, 0, 144, 98)
		CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 1,224,185)
	elseif GetNumText() == 29 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{BHCS_090226_11}" )
		AddNumText( sceneId, x805009_g_scriptId, "回到洛阳", 9, 11 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_02}", 9, 27 )
		AddNumText( sceneId, x805009_g_scriptId, "#{BHCS_090219_03}", 9, 28 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
			
	--帮会贡献度称号
	elseif GetNumText() == 30 then
		
		local currGuildContriSum = CityGetAttr(sceneId, selfId, 15);
		local currGuildContriTitle = GetGuildContriTitle(sceneId, selfId);
		local guildName = LuaFnGetGuildName(sceneId, selfId);
		
		for i, titleItem in x805009_g_GuildContriTitle do
			if currGuildContriTitle == "" then
				currGuildContriTitle = guildName
			end
			if currGuildContriTitle == guildName..titleItem.currName then	
				local playerName = GetName(sceneId, selfId);

				if currGuildContriSum < titleItem.needContri then
					local strTip = "#R"..playerName.."#W！晋升为帮会的#G"..guildName..titleItem.name.."#W需要为帮会做出#G"..titleItem.needContri.."#W点贡献的！想要晋升的话，就为帮会多做一些事情吧！";
					BeginEvent( sceneId )
						AddText( sceneId, strTip )
					EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
				
				AwardGuildContriTitle( sceneId, selfId, guildName..titleItem.name);
				SetCurTitle( sceneId, selfId, 38, 0 );
				LuaFnDispatchAllTitle( sceneId, selfId )
				
				local strTip = "恭喜你！#R"..playerName.."#W！你现在是我们帮会的#G"..guildName..titleItem.name.."#W了！为了帮会的盛世霸业，继续努力吧！"
				
				--增加特效
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
				local sMessage = format("@*;SrvMsg;GLD:#W本帮高手#R#{_INFOUSR%s}#W为本帮立下大功，赐予爵位：#G%s#W！望#R#{_INFOUSR%s}#W再接再厉，为本帮再立新功！", playerName, guildName..titleItem.name ,playerName);	
	    		BroadMsgByChatPipe(sceneId, selfId, sMessage, 6);
			
			
				sMessage = format("#W#{_INFOUSR%s}为#G%s#W的建设不辞辛苦，特赐予爵位：#G%s#W！", playerName,guildName, guildName..titleItem.name );
				BroadMsgByChatPipe(sceneId, selfId, sMessage, 4);
		
				BeginEvent( sceneId )
					AddText( sceneId, strTip )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				
				break;
			end
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x805009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805009_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
		elseif ret == -2 then
			x805009_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805009_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805009_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805009_OnDie( sceneId, selfId, killerId )
end

function x805009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--帮贡界面UI 19821 Banggong Exchange调用到这里
--**********************************
function x805009_BanggongExchange( sceneId, selfId, nvalue ) --这个是玩家输入值，实际的扣除值还要在此基础上+10%的税率
	local haveBangGong = CityGetAttr(sceneId, selfId, GUILD_CONTRIB_POINT)
	
	--是否安全时间，这个判断函数里面自己有提示信息，不需要这里写提示信息
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return
	end
	
	--输入是否超过已有数量
	if nvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_03}")
		return
	end
	
	--帮贡牌的最大额度不能超过200。
	if nvalue > 200 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_25}")
		return
	end
	
	--帮贡牌的最小额度不能低于10。
	if nvalue < 10 then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_26}")
		return
	end
	
	local totalvalue = floor( nvalue*0.1 ) + nvalue

	--加上税率之后是否有足够帮贡
	if totalvalue > haveBangGong then
		x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8922_27}")
		return
	end
	
	--道具栏是否有空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) <= 0 then
		x805009_NotifyFailTips( sceneId, selfId, "#{SJQM_8819_20}")
		return
	end
	
	local ret = CityChangeAttr(sceneId, selfId, GUILD_CONTRIB_POINT, -totalvalue)
	if ret == 1 then
		local BagIndex = TryRecieveItem( sceneId, selfId, 30900050, QUALITY_MUST_BE_CHANGE )
		local roleBangPaiID = GetHumanGuildID(sceneId, selfId)
		
		if BagIndex ~= -1 then
			SetBagItemParam(sceneId, selfId, BagIndex, 4, 2, roleBangPaiID) --帮派ID
			SetBagItemParam(sceneId, selfId, BagIndex, 8, 2, nvalue) --帮贡数值
			LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
			x805009_NotifyFailTips( sceneId, selfId, "#{BGCH_8829_10}"..nvalue.."#{BGCH_8829_11}")
		else
			x805009_NotifyFailTips( sceneId, selfId, "创建物品出错")
		end
	else
		x805009_NotifyFailTips( sceneId, selfId, "扣除帮贡失败")
	end
	
end
