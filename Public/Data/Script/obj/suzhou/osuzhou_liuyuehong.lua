--苏州NPC
--柳月虹
--一般
x001025_g_ScriptId = 1025

x001025_g_ControlScript = 808071


--**********************************
--事件交互入口
--**********************************
function x001025_OnDefaultEvent( sceneId, selfId,targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"  从现在开始，你只许疼我一个，要宠我，不许骗我，答应我的每一件事情都要做到。")
		CallScriptFunction( x001025_g_ControlScript, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x001025_OnEventRequest( sceneId, selfId, targetId, eventId )
  
	if eventId == x001025_g_ControlScript then
		CallScriptFunction( x001025_g_ControlScript, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end

end
