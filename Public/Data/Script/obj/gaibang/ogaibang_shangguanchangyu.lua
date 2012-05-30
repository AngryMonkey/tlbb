--丐帮NPC
--上官长雨
--普通

--脚本号
x010009_g_ScriptId = 010009

--所拥有的事件
estudy_lianhualuo = 713531
elevelup_lianhualuo = 713590
edialog_lianhualuo = 713611
--所拥有的事件ID列表
x010009_g_eventList={estudy_lianhualuo,elevelup_lianhualuo}	
--MessageNum = 1		--MessageNum是对话编号，用于调用不同对话
--**********************************
--事件列表
--**********************************
function x010009_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"我的技能只教本派弟子。")
	for i, eventId in x010009_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x010009_g_ScriptId, "莲花落介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x010009_OnDefaultEvent( sceneId, selfId,targetId )
	x010009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x010009_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_026}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	for i, findId in x010009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x010009_g_ScriptId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x010009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010009_g_eventList do
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
function x010009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x010009_g_eventList do
		if missionScriptId == findId then
			x010009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x010009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x010009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x010009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x010009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x010009_OnDie( sceneId, selfId, killerId )
end
