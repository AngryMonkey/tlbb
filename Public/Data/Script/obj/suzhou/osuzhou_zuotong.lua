--苏州NPC		千寻
--左桐
--脚本号

x001080_g_ScriptId = 001080


--所拥有的事件ID列表
x001080_g_eventList={229024,050056}

--**********************************

--事件列表

--**********************************

function x001080_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
			
	for i, eventId in x001080_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--事件交互入口

--**********************************

function x001080_OnDefaultEvent( sceneId, selfId,targetId )

	x001080_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************
--事件列表选中一项
--**********************************
function x001080_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x001080_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001080_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then			
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then				
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001080_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			x001080_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001080_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001080_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001080_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001080_OnDie( sceneId, selfId, killerId )
end
