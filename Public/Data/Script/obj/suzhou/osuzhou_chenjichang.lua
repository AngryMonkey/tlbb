--苏州NPC
--陈季常
--一般

--脚本号
--x001024_g_scriptId = 001024

--所拥有的事件ID列表
x001024_g_eventList={
					 889053, --向前冲
					 }

--**********************************
--事件列表
--**********************************
function x001024_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_suzhou_0009}")
	for i, eventId in x001024_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001024_OnDefaultEvent( sceneId, selfId, targetId )
	x001024_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001024_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001024_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001024_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001024_g_eventList do
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
function x001024_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001024_g_eventList do
		if missionScriptId == findId then
			x001024_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001024_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001024_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001024_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001024_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001024_OnDie( sceneId, selfId, killerId )

end
