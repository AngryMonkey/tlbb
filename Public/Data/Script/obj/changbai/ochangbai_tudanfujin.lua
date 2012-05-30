--完颜盈哥

--脚本号
x022009_g_scriptId = 022009

--所拥有的事件ID列表
x022009_g_eventList={}--211302,211303,211304,211307,211308	

--**********************************
--事件列表
--**********************************
function x022009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  兀术还是个孩子，他决不是故意要害吴乞买的。神医的配方也一定还在长白山，如果能把它找回来就好了。")
	for i, eventId in x022009_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022009_OnDefaultEvent( sceneId, selfId,targetId )
	x022009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x022009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x022009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022009_g_eventList do
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
function x022009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			x022009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x022009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x022009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022009_OnDie( sceneId, selfId, killerId )
end
