--柴进

--脚本号
x003001_g_scriptId = 003001

--所拥有的事件ID列表
x003001_g_eventList={}--210809,210300, 210301, 210302, 210304}

--**********************************
--事件列表
--**********************************
function x003001_UpdateEventList ( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  鬼啊！！！哦，是你啊。抱歉，我最近已经被鬼吓得失魂落魄了。我不知道自己看到的到底是人还是鬼……")
	for i, eventId in x003001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end
--**********************************
--事件交互入口
--**********************************
function x003001_OnDefaultEvent( sceneId, selfId,targetId )
	x003001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x003001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x003001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x003001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x003001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x003001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x003001_g_eventList do
		if missionScriptId == findId then
			x003001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x003001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x003001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x003001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x003001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x003001_OnDie( sceneId, selfId, killerId )
end
