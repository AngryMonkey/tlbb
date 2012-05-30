--对话事件 

--脚本号
x713601_g_ScriptId = 713601

--**********************************
--任务入口函数
--**********************************
function x713601_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0001}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713601_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713601_g_ScriptId,"我想了解烹饪",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713601_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713601_OnAccept( sceneId, selfId, AbilityId )
end
