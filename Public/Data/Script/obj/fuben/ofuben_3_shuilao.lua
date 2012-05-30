--水牢副本任务npc

--脚本号
x402020_g_scriptId = 402020


--所拥有的事件ID列表
x402020_g_eventList={401020}

--**********************************
--事件列表
--**********************************
function x402020_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." ，来吧。\n")
		for i, findId in x402020_g_eventList do
			CallScriptFunction( x402020_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402020_OnDefaultEvent( sceneId, selfId,targetId )
	x402020_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402020_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x402020_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x402020_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x402020_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			x402020_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402020_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402020_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402020_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402020_OnDie( sceneId, selfId, killerId )
end
