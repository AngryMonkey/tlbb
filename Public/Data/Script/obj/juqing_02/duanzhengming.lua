--万劫谷 段正明

--脚本号
x118003_g_scriptId = 118003

--所拥有的事件ID列表
x118003_g_eventList={200008, 200007}

--**********************************
--事件列表
--**********************************
function x118003_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_WJG_B_008}")
	for i, eventId in x118003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x118003_OnDefaultEvent( sceneId, selfId,targetId )
	x118003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x118003_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x118003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x118003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x118003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			x118003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x118003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( findId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x118003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( findId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x118003_OnDie( sceneId, selfId, killerId )
end
