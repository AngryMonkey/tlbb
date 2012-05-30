--完颜盈哥

--脚本号
x022008_g_scriptId = 022008

--所拥有的事件ID列表
x022008_g_eventList={}--211300,211306	

--**********************************
--事件列表
--**********************************
function x022008_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  特使大人，完颜部落进贡的皮子都是最好的，比纥石烈部落的好多了。另外这些上等虎骨是给特使大人的，请您在大王面前多多美言，说完颜部落永远是辽国最忠诚的属国。")
	for i, eventId in x022008_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022008_OnDefaultEvent( sceneId, selfId,targetId )
	x022008_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x022008_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022008_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x022008_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
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
function x022008_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			x022008_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x022008_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x022008_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022008_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022008_OnDie( sceneId, selfId, killerId )
end
