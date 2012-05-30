-- 苏州NPC
-- 包世荣
-- 一般

-- 脚本号
x001037_g_scriptId = 001037

x001037_g_shoptableindex = 25

x001037_g_ControlScript = 050009
x001037_g_ExchangeList = { id = 40004304, name = "优质香料", cost = 30 }
x001037_g_yiexihuFlag = 1;

--**********************************
--事件交互入口
--**********************************
function x001037_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "#{BSR_80919_1}" )
		AddNumText( sceneId, x001037_g_scriptId, "看看你卖的东西", 7, 0 )
		--if x001037_g_yiexihuFlag == 1 then
		--	AddNumText( sceneId, x001037_g_scriptId, "去夜西湖", 6, 3 )
			AddNumText( sceneId, x001037_g_scriptId, "捕捉萤火虫介绍", 11, 14 )
			AddNumText( sceneId, x001037_g_scriptId, "雪球、绿豆汤、西瓜汁活动介绍", 11, 15 )
		--end

		if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x001037_g_scriptId, "换取食材", 6, 1 )
			--AddNumText( sceneId, x001037_g_scriptId, "食材有什么用", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001037_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == x001037_g_scriptId then
		local selectItem = GetNumText();
		if selectItem == 0 then
			DispatchShopItem( sceneId, selfId, targetId, x001037_g_shoptableindex )
		end
		
		if x001037_g_yiexihuFlag == 1 then
			if selectItem == 3 then
				--CallScriptFunction((400900), "TransferFuncFromNpc",sceneId, selfId, 121, 40, 52);
			elseif selectItem == 14 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_091}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			elseif selectItem == 15 then
				BeginEvent(sceneId)
					AddText( sceneId, "#{function_help_092}" )
				EndEvent(sceneId)
				DispatchEventList( sceneId, selfId, targetId )
			end
		end
	end

	if CallScriptFunction( x001037_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    要换一份" .. x001037_g_ExchangeList.name ..
				"，需要积分" .. x001037_g_ExchangeList.cost .. "点，你现在只有" .. score .. "分，似乎不够啊。" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  你目前的中秋积分为" .. score .. "分，换取一份" ..
					x001037_g_ExchangeList.name .. "，需要积分" .. x001037_g_ExchangeList.cost .. "点，你确定要换吗？" )

				AddNumText( sceneId, x001037_g_scriptId, "确定要换", -1, 3 )
				AddNumText( sceneId, x001037_g_scriptId, "我只是路过", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    在洛阳姜鲤（127，" ..
				"154），苏州包世荣（190，168），大理杜子腾（109，170）分别换" ..
				"三种不同的食材后，找苏州（193，148）岳常圆传送到西湖来换中秋" ..
				"特殊物品。" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x001037_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x001037_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x001037_NotifyFailBox( sceneId, selfId, targetId, "    背包空间已满。" )
			end

			score = score - x001037_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x001037_NotifyFailBox( sceneId, selfId, targetId, "    剩余积分：" .. score .. "。" )
			return
		elseif GetNumText() == 4 then
			BeginUICommand( sceneId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end
		return
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x001037_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
