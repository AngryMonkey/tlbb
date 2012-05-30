--洛阳NPC		养生法npc		1学习养生法技能		2中医技能说明
--蔷薇
--普通

--脚本号
x000113_g_ScriptId = 000113

--所拥有的事件Id列表
--estudy_yangshengfa = 713528
--elevelup_yangshengfa = 713587
--edialog_yangshengfa = 713621
--所拥有的事件ID列表
x000113_g_eventList={713528,713587,250504}--,713621
--**********************************
--事件列表
--**********************************
function x000113_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  你想学习养生法技能么？")
	for i, eventId in x000113_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x000113_g_ScriptId, "养生介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000113_OnDefaultEvent( sceneId, selfId,targetId )
	x000113_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000113_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_002}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000113_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000113_g_ScriptId )
		return
	end
end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000113_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000113_g_eventList do
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
function x000113_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			x000113_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000113_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000113_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000113_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000113_OnDie( sceneId, selfId, killerId )
end
