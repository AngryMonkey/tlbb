--洛阳NPC
--镖师
--普通
--所拥有的事件ID列表

--脚本号
x000073_g_scriptId = 000073

x000073_g_eventList={889051}
--**********************************
--事件交互入口
--**********************************
function x000073_OnDefaultEvent( sceneId, selfId,targetId )
	x000073_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表
--**********************************
function x000073_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{NSRQ_JS_01}")
		for i, eventId in x000073_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000073_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x000073_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000073_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000073_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--继续（已经接了任务）
--**********************************
function x000073_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--提交已做完的任务
--**********************************
function x000073_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

