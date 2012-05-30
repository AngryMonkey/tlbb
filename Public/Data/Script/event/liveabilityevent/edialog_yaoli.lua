--对话事件 

--脚本号
x713620_g_ScriptId = 713620

--**********************************
--任务入口函数
--**********************************
function x713620_OnDefaultEvent( sceneId, selfId, targetId)
	dialog = "#{event_liveabilityevent_0029}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713620_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713620_g_ScriptId,"我想了解药理",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713620_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713620_OnAccept( sceneId, selfId, AbilityId )
end
