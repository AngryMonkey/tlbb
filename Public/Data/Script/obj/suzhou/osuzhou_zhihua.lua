--苏州NPC		烹饪   1烹饪技能学习 2烹饪技能说明
--智化
--普通

--脚本号
x001030_g_ScriptId = 001030

--所拥有的事件Id列表
--elevelup_pengren = 713561
--edialog_pengren = 713601
--所拥有的事件ID列表
x001030_g_eventList={713561,713601}
--**********************************
--事件列表
--**********************************
function x001030_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0010}")
	for i, eventId in x001030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001030_OnDefaultEvent( sceneId, selfId,targetId )
	x001030_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001030_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001030_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001030_g_ScriptId )
		return
	end
end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001030_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001030_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			x001030_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001030_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001030_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001030_OnDie( sceneId, selfId, killerId )
end
