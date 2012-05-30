--苏州NPC
--雪竹莲
--一般

x001036_g_scriptId = 001036

--所拥有的事件ID列表
x001036_g_eventList={800110,800112}

--**********************************
-- 更新事件列表
--**********************************
function x001036_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{OBJ_suzhou_0012}")
	
		-- 调用事件列表 x001036_g_eventList 中的每一项的 Enumerate 函数来显示选择条目
		for i, eventId in x001036_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001036_OnDefaultEvent( sceneId, selfId,targetId )
	x001036_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001036_OnEventRequest( sceneId, selfId, targetId, eventId )
	-- 调用事件列表 x001036_g_eventList 中的每一项的 DefaultEvent 函数
	for i, findId in x001036_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
