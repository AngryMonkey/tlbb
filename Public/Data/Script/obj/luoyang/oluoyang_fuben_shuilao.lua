--水牢副本任务npc

--脚本号
x000089_g_scriptId = 000090


--所拥有的事件ID列表
x000089_g_eventList={231000}

--**********************************
--事件列表
--**********************************
function x000089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  "..PlayerName.." ，来吧。\n")
		for i, findId in x000089_g_eventList do
			CallScriptFunction( x000089_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000089_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000089_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  你快去白马寺吧，智清大师一定迫不及待的想见你呢！我这几日公务缠身，等我平定水牢的叛乱之后，一定去白马寺帮助智清大师赈济灾民。" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--事件列表选中一项
--**********************************
function x000089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			x000089_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000089_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000089_OnDie( sceneId, selfId, killerId )
end
