--鲁平


--脚本号
x024001_g_scriptId = 024001

--所拥有的事件ID列表
x024001_g_eventList={808099, 808100, 808101, 808094}

--**********************************
--事件列表
--**********************************
function x024001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  年轻人，在这里可不要乱跑啊！#r  野人和狼人可都不是好惹的，看看我们村子现在的状况，你就知道那些侵略者有多凶狠了。#r  前面的那条大路叫茶马道，很多商人从这里运送茶叶去遥远的异国，以前时不时的就有马队从那里经过，马铃声可以传到好远好远……")
	for i, eventId in x024001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x024001_OnDefaultEvent( sceneId, selfId,targetId )
	x024001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x024001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x024001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
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
function x024001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			x024001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x024001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x024001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x024001_OnDie( sceneId, selfId, killerId )
end

