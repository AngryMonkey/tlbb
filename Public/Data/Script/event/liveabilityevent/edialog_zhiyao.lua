--对话事件 

--脚本号
x713602_g_ScriptId = 713602

--**********************************
--任务入口函数
--**********************************
function x713602_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0002}"
		BeginEvent(sceneId)
		AddText(sceneId, dialog)
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713602_OnEnumerate( sceneId, selfId, targetId )
	--	AddNumText(sceneId,x713602_g_ScriptId,"我想了解制药",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713602_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713602_OnAccept( sceneId, selfId, AbilityId )
end
