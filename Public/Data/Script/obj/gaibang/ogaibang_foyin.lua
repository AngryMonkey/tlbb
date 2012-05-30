--丐帮NPC
--佛印
--普通

--脚本号
x010002_g_scriptId = 010002

--所拥有的事件ID列表
x010002_g_eventList={221901}

--**********************************
--事件列表
--**********************************
function x010002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  这丐帮的酒窖中，好酒真是多啊。"..PlayerName.."，你不想去尝尝吗？#r  我做了几天和尚，不好玩，现在来做乞丐，才觉得大慰平生。")
		for i, findId in x010002_g_eventList do
			CallScriptFunction( x010002_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x010002_OnDefaultEvent( sceneId, selfId,targetId )
	x010002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x010002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x010002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x010002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			x010002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x010002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x010002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x010002_OnDie( sceneId, selfId, killerId )
end

