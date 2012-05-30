--天山NPC
--菊剑
--普通

--折梅峰副本任务npc

--脚本号
x017004_g_scriptId = 017001


--所拥有的事件ID列表
x017004_g_eventList={228901}

--**********************************
--事件列表
--**********************************
function x017004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{OBJ_tianshan_0002}")
		for i, findId in x017004_g_eventList do
			CallScriptFunction( x017004_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x017004_OnDefaultEvent( sceneId, selfId,targetId )
	x017004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x017004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x017004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x017004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x017004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x017004_g_eventList do
		if missionScriptId == findId then
			x017004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x017004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x017004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x017004_OnDie( sceneId, selfId, killerId )
end

