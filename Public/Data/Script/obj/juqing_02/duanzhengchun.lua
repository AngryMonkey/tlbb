--万劫谷 段正淳

--脚本号
x118002_g_scriptId = 118002

--所拥有的事件ID列表
x118002_g_eventList={200002, 200006, 200007}

--**********************************
--事件列表
--**********************************
function x118002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)

	if IsMissionHaveDone(sceneId,selfId,7) == 1 then
		AddText(sceneId,"#{JQ_WJG_B_007}")
	else
		AddText(sceneId,"#{JQ_WJG_B_006}")
	end

	for i, eventId in x118002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x118002_OnDefaultEvent( sceneId, selfId,targetId )
	x118002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x118002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x118002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x118002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
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
function x118002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			x118002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x118002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x118002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x118002_OnDie( sceneId, selfId, killerId )
end
