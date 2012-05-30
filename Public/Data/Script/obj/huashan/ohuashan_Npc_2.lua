--传出这个场景的Npc
--普通

--脚本号
x125002_g_scriptId = 125002

--所拥有的事件ID列表
x125002_g_eventList={001231}

--**********************************
--事件交互入口
--**********************************

function x125002_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  想要离开这里了？")
		for i, eventId in x125002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x125002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x125002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

