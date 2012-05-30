--苏飞

--脚本号
x030003_g_scriptId = 030003

--所拥有的事件ID列表
x030003_g_eventList={212100, 808095, 808096, 808097, 808094}
-- 212100  苏飞的世界

--**********************************
--事件列表
--**********************************
function x030003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  我们#R水鬼#W虽然不是人类，但是我们和人类一样有自己的思想有自己的生活，我们并不是凶猛好战的种族。")
	for i, eventId in x030003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x030003_OnDefaultEvent( sceneId, selfId,targetId )
	x030003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x030003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x030003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x030003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
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
function x030003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			x030003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x030003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x030003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x030003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x030003_OnDie( sceneId, selfId, killerId )
end
