-- 中秋NPC
-- 苏轼

x050002_g_scriptId = 050002

--所拥有的事件ID列表
x050002_g_eventList = { }

x050002_g_ItemList = { 40004303, 40004304, 40004305 }
x050002_g_MoonCakes = { 30103026, 30103027, 30103028, 30103029, 30103030, 30103031, 30103032, 30103033, 30103034, 30103035, 30103036, 30103037, }
x050002_g_MoonCakeName = { "豆沙馅月饼", "玫瑰馅月饼", "枣泥馅月饼", "五仁馅月饼", "百果馅月饼", "上素馅月饼", "火腿馅月饼", "精美松子馅月饼", "精美茯苓馅月饼", "精美黄精馅月饼", "精美雪莲馅月饼", "精美蜂蜜馅月饼", }
--**********************************
--事件列表
--**********************************
function x050002_UpdateEventList( sceneId, selfId, targetId )
	local i, eventId
	for i, eventId in x050002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

	AddNumText( sceneId, x050002_g_scriptId, "换取中秋佳食", -1, 1 )
end

--**********************************
--事件交互入口
--**********************************
function x050002_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local strText = "    明月几时有，把酒问青天。不知天上宫阙，今夕是何年。我欲乘风归去，又恐琼楼玉宇，高处不胜寒。起舞弄清影，何似在人间。转朱阁，低绮户，照无眠。不应有恨，何事长向别时圆。人有悲欢离合，月有阴晴圆缺，此事古难全。但愿人长久，千里共婵娟。"
		AddText( sceneId, "水调歌头" )
		AddText( sceneId, strText )
		x050002_UpdateEventList( sceneId, selfId, targetId )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050002_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i, findId
	for i, findId in x050002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if GetNumText() == 1 then
		local idx, itemId
		for idx, itemId in x050002_g_ItemList do
			if LuaFnGetAvailableItemCount( sceneId, selfId, itemId ) < 1 then
				x050002_NotifyFailBox( sceneId, selfId, targetId, "    要换取中" ..
					"秋佳食，需要精质面粉，优质香料、上好蔗糖各自一个，" ..
					"可到洛阳姜鲤（127，154），苏州包世荣（190，168），" ..
					"大理杜子腾（109，170）处取得。" )
				return
			end
		end

		local moonCakeId = random( getn(x050002_g_MoonCakes) )
		if LuaFnTryRecieveItem( sceneId, selfId, x050002_g_MoonCakes[moonCakeId], QUALITY_MUST_BE_CHANGE ) < 0 then
			return
		end

		for idx, itemId in x050002_g_ItemList do
			LuaFnDelAvailableItem( sceneId, selfId, itemId, 1 )
		end

		x050002_NotifyFailBox( sceneId, selfId, targetId, "    甚好甚好，中秋良" ..
			"辰，当以此饼赠君，此饼如中秋明月形状，窃以为称之为月饼以为善也。" )

		local strText = "你获得" .. x050002_g_MoonCakeName[moonCakeId]

		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
		x050002_NotifyFailTips( sceneId, selfId, strText )

		-- 当玩家获得精美的月饼，会在世界发系统消息。
		strText = GetName( sceneId, selfId ) .. "在换取月饼时，幸运的得到了" ..
					x050002_g_MoonCakeName[moonCakeId] .. "。"
		BroadMsgByChatPipe( sceneId, selfId, strText, 4 )
		return
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x050002_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x050002_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
