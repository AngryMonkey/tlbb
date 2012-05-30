--星宿NPC
--篓子
--普通

--脚本号
x016013_g_ScriptId = 016013

--所拥有的事件ID列表
x016013_g_eventList={}	

--**********************************
--事件列表
--**********************************
function x016013_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	--AddText(sceneId,"我的技能只教本派弟子。")
	for i, eventId in x016013_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x016013_OnDefaultEvent( sceneId, selfId,targetId )
	x016013_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x016013_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x016013_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x016013_g_ScriptId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x016013_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016013_g_eventList do
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
function x016013_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x016013_g_eventList do
		if missionScriptId == findId then
			x016013_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x016013_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x016013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x016013_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x016013_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x016013_OnDie( sceneId, selfId, killerId )
end
