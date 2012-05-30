--鲁平


--脚本号
x031007_g_scriptId = 031007

--所拥有的事件ID列表
x031007_g_eventList={}

--**********************************
--事件列表
--**********************************
function x031007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  施主，你可曾听说过离我们金山寺不远的雷峰塔？后来不知道怎么回事塔倒了，真是奇怪，难道是佛祖显灵？")
	for i, eventId in x031007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x031007_OnDefaultEvent( sceneId, selfId,targetId )
	x031007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x031007_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x031007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031007_g_eventList do
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
function x031007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x031007_g_eventList do
		if missionScriptId == findId then
			x031007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x031007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x031007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x031007_OnDie( sceneId, selfId, killerId )
end

