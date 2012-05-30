--苏州NPC
--文彦博
--一般

--脚本号

x001009_g_ScriptId = 001009
x001009_g_EventId = 808125

--**********************************
--事件交互入口
--**********************************
function x001009_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{BBLP_90209_1}")
		CallScriptFunction( x001009_g_EventId, "OnEnumerate",sceneId, selfId, targetId )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


function x001009_OnEventRequest( sceneId, selfId, targetId, eventId )
  
	if eventId == x001009_g_EventId then
		CallScriptFunction( x001009_g_EventId, "OnDefaultEvent",sceneId, selfId, targetId )
		return
	end

end


