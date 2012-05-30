--章惇

--脚本号
x000006_g_scriptId = 000006

--所拥有的事件ID列表
x000006_g_eventList={201511,201512,50015}		

--**********************************
--事件列表
--**********************************
function x000006_UpdateEventList( sceneId, selfId,targetId )

	BeginEvent(sceneId)

		local strText = "  如今天下动乱，贼兵四起。朝廷为了迅速平叛，给百姓一个太平盛世，特号召天下各位英雄帮助平叛。平叛有功者，将由本丞相给予一个尊贵的称号作为奖励。"
		AddText( sceneId, strText )
	
	for i, eventId in x000006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000006_OnDefaultEvent( sceneId, selfId,targetId )
	x000006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000006_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000006_g_eventList do
		if missionScriptId == findId then
			x000006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000006_OnDie( sceneId, selfId, killerId )
end
