--庞安时

--脚本号
x001012_g_scriptId = 001012

--所拥有的事件ID列表
x001012_g_eventList={200601,200602,200802,200803,212116,713503,713562}

--**********************************
--事件列表
--**********************************
function x001012_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	print(PlayerName)
	--AddText(sceneId,"  医生以救死扶伤为天职，但如果一个恶人身患重病该怎么办呢？救，还是不救，这是一个问题。");
	AddText(sceneId, "#{OBJ_dali_0034}");
	for i, eventId in x001012_g_eventList do
		print(i)
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001012_OnDefaultEvent( sceneId, selfId,targetId )
	x001012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001012_OnEventRequest( sceneId, selfId, targetId, eventId )
	if eventId == 713503 or eventId == 713562 then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(), x001012_g_scriptId )
		return
	end
	for i, findId in x001012_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001012_g_eventList do
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
function x001012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			x001012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001012_OnDie( sceneId, selfId, killerId )
end
