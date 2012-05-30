--钟灵

--脚本号
x119002_g_scriptId = 119002

--所拥有的事件ID列表
x119002_g_eventList={200003, 200081}

--**********************************
--事件列表
--**********************************
function x119002_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		-- 根据任务的完成情况，回有不同的对白
		if IsMissionHaveDone(sceneId,selfId,3) == 1 then
			AddText(sceneId,"#{JQ_WJG_Y_007}")
		else
			AddText(sceneId,"#{JQ_WJG_Y_006}")
		end
		
		for i, eventId in x119002_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x119002_OnDefaultEvent( sceneId, selfId,targetId )
	x119002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x119002_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	for i, findId in x119002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x119002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119002_g_eventList do
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
function x119002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			x119002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x119002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x119002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x119002_OnDie( sceneId, selfId, killerId )
end
