-- 洛阳NPC		酒店老板
-- 江鲤
-- 普通

-- 脚本号
x000102_g_scriptId = 000102
-- 商店号
x000102_g_ShopTabId = 15 
--所拥有的事件ID列表
x000102_g_eventList = { }

x000102_g_ControlScript = 050009
x000102_g_ExchangeList = { id = 40004303, name = "精质面粉", cost = 20 }

--**********************************
--事件列表
--**********************************
function x000102_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  天上飞的、地上跑的、水里游的，想吃什么我这茗珍楼里应有尽有。" )
		AddNumText(sceneId,x000102_g_scriptId,"购买食物",7,1111)
		if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
			--AddNumText( sceneId, x000102_g_scriptId, "换取食材", 6, 1 )
			--AddNumText( sceneId, x000102_g_scriptId, "食材有什么用", 11, 2 )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x000102_OnDefaultEvent( sceneId, selfId, targetId )
	x000102_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000102_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1111 then
		DispatchShopItem( sceneId, selfId, targetId, x000102_g_ShopTabId);
	end
	local i, findId
	for i, findId in x000102_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if CallScriptFunction( x000102_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) > 0 then
		if GetNumText() == 1 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "    要换一份" .. x000102_g_ExchangeList.name ..
				"，需要积分" .. x000102_g_ExchangeList.cost .. "点，你现在只有" .. score .. "分，似乎不够啊。" )
				return
			end

			BeginEvent( sceneId )
				AddText( sceneId, "  你目前的中秋积分为" .. score .. "分，换取一份" ..
					x000102_g_ExchangeList.name .. "，需要积分" .. x000102_g_ExchangeList.cost .. "点，你确定要换吗？" )

				AddNumText( sceneId, x000102_g_scriptId, "确定要换", -1, 3 )
				AddNumText( sceneId, x000102_g_scriptId, "我只是路过", -1, 4 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		elseif GetNumText() == 2 then
			x000102_NotifyFailBox( sceneId, selfId, targetId, "    在洛阳姜鲤（127，" ..
				"154），苏州包世荣（190，168），大理杜子腾（109，170）分别换" ..
				"三种不同的食材后，找苏州（193，148）岳常圆传送到西湖来换中秋" ..
				"特殊物品。" )
			return
		elseif GetNumText() == 3 then
			local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
			if score < x000102_g_ExchangeList.cost then
				return
			end

			if LuaFnTryRecieveItem( sceneId, selfId, x000102_g_ExchangeList.id, QUALITY_MUST_BE_CHANGE ) < 0 then
				x000102_NotifyFailBox( sceneId, selfId, targetId, "    背包空间已满。" )
			end

			score = score - x000102_g_ExchangeList.cost
			SetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE, score )
			x000102_NotifyFailBox( sceneId, selfId, targetId, "    剩余积分：" .. score .. "。" )
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
--接受此NPC的任务
--**********************************
function x000102_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000102_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			x000102_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000102_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000102_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000102_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000102_OnDie( sceneId, selfId, killerId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x000102_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
