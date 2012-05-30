--崔百泉

--脚本号
x002008_g_scriptId = 002008

--所拥有的事件ID列表
x002008_g_eventList={}
--x002008_g_eventList={200201,200202,200203,200301,200302,200303}

--**********************************
--事件列表
--**********************************
function x002008_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  大理国近年来民泰国安，王府也殷实的很。")
	for i, eventId in x002008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002008_OnDefaultEvent( sceneId, selfId,targetId )
	x002008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002008_g_eventList do
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
function x002008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			x002008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002008_OnDie( sceneId, selfId, killerId )
end
