--周无畏

--脚本号
x018005_g_scriptId = 018005


--所拥有的事件ID列表
x018005_g_eventList={808103, 808104, 808105, 808094}--210900,210901,210906, 210409}

--**********************************
--事件列表
--**********************************
function x018005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  雁门关防务现在主要分为三部分：种世衡大帅负责对付雁门关以南的秦家寨盗匪；曲端副帅负责对付雁门关以北的辽兵；马承倩监军负责监督二位元帅的工作。")
	for i, eventId in x018005_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x018005_OnDefaultEvent( sceneId, selfId,targetId )
	x018005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x018005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x018005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018005_g_eventList do
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
function x018005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			x018005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x018005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x018005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x018005_OnDie( sceneId, selfId, killerId )
end
