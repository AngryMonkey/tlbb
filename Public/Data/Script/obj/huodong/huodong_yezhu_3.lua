-- 402104
-- 场景中活动开始后刷出来的Npc

-- 
x402104_g_scriptId = 402104

--所拥有的事件ID列表
x402104_g_eventList={402105}

--**********************************
--事件列表
--**********************************
function x402104_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  可恶的野猪王逃走了！不知你们有没有得到一些可以找到野猪王的线索呢？")
		for i, eventId in x402104_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件交互入口
--**********************************
function x402104_OnDefaultEvent( sceneId, selfId,targetId )
	x402104_UpdateEventList( sceneId, selfId,targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402104_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402104_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
