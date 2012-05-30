-- 115003

-- 天山同老 115003

--脚本号
x115003_g_scriptId = 115003

--所拥有的事件ID列表
x115003_g_eventList={200051,200097}

--**********************************
--事件列表
--**********************************
function x115003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_Y_003}")
	for i, eventId in x115003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x115003_OnDefaultEvent( sceneId, selfId,targetId )
	x115003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x115003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x115003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x115003_OnMissionAccept( sceneId, selfId, targetId )

	for i, findId in x115003_g_eventList do
		ret = CallScriptFunction( findId, "CheckAccept", sceneId, selfId, targetId )
		if ret > 0 then
			CallScriptFunction( findId, "OnAccept", sceneId, selfId, targetId )
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x115003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			x115003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x115003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x115003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x115003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x115003_OnDie( sceneId, selfId, killerId )
end
