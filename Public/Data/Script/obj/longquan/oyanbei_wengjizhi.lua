--鲁平


--脚本号
x031003_g_scriptId = 031003

--所拥有的事件ID列表
x031003_g_eventList={212119}

--**********************************
--事件列表
--**********************************
function x031003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  以前年少不懂事，以为只要喜欢就可以去争取，却不曾想铸下大错。#r  二哥为了成全我出家为僧，阿青为了二哥终身不嫁，我，我，我真是个罪人啊！")
	for i, eventId in x031003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x031003_OnDefaultEvent( sceneId, selfId,targetId )
	x031003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x031003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x031003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031003_g_eventList do
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
function x031003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x031003_g_eventList do
		if missionScriptId == findId then
			x031003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x031003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x031003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x031003_OnDie( sceneId, selfId, killerId )
end

