--南海NPC
--李老太太
--普通

x034006_g_eventList = {212112}

--**********************************
--事件交互入口
--**********************************
function x034006_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  我儿子虽然已经不在了，但他还活着呢！他永远活在辽西呢！")
		for i, eventId in x034006_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--刷新事件
--**********************************
function x034006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x034006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x034006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x034006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x034006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end


