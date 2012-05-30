--洛阳NPC
--范移城
--普通

x000143_g_ScriptId	= 143
x000143_g_EventList	= { 808008, 808009 }

--**********************************
--事件交互入口
--**********************************
function x000143_OnDefaultEvent( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, "  我是移民接待使，如果你刚移民到此，有什么需要帮忙的尽管开口好了。" )
		for i, eventId in x000143_g_EventList do
			CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件列表选中一项
--**********************************
function x000143_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x000143_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end
