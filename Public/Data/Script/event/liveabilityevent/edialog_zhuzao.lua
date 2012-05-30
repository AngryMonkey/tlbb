--对话事件 

--脚本号
x713604_g_ScriptId = 713604

--**********************************
--任务入口函数
--**********************************
function x713604_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0004}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713604_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713604_g_ScriptId,"我想了解铸造",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713604_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713604_OnAccept( sceneId, selfId, AbilityId )
end
