--对话事件 采矿npc薛铜锤

--脚本号
x713607_g_ScriptId = 713607

--**********************************
--任务入口函数
--**********************************
function x713607_OnDefaultEvent( sceneId, selfId, targetId )
	dialog = "#{event_liveabilityevent_0007}"
	BeginEvent(sceneId)
		AddText(sceneId, dialog)
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--列举事件
--**********************************
function x713607_OnEnumerate( sceneId, selfId, targetId )
		AddNumText(sceneId,x713607_g_ScriptId,"我想了解采矿",11,-1)
end

--**********************************
--检测接受条件
--**********************************
function x713607_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713607_OnAccept( sceneId, selfId, AbilityId )
end
