--少林NPC
--掌门人
--玄慈
--普通

--所拥有的事件ID列表
x009005_g_eventList={229009, 200089, 200090, 212140, 229012, 808092}

--**********************************
--事件交互入口
--**********************************
function x009005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"我觉得玄悲师弟圆寂，与大理段家并无干系。")
		for i, findId in x009005_g_eventList do
			CallScriptFunction( x009005_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x009005_OnDefaultEvent( sceneId, selfId,targetId )
	x009005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x009005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x009005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_SHAOLIN )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x009005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x009005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x009005_g_eventList do
		if missionScriptId == findId then
			x009005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x009005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x009005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x009005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x009005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x009005_OnDie( sceneId, selfId, killerId )
end

