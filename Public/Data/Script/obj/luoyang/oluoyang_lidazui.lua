--大理NPC		烹饪   1烹饪技能学习 2烹饪技能说明
--李大嘴
--普通

--脚本号
x000107_g_ScriptId = 000107

--所拥有的事件Id列表
--elevelup_pengren = 713561
--edialog_pengren = 713601
--所拥有的事件ID列表
x000107_g_eventList={713561,250505}--,713601
--**********************************
--事件列表
--**********************************
function x000107_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  要想学习和提高烹饪的技能就经常来我这里看看，只有不断的练习，你的烹饪技能熟练度才能提高了。")
	AddText(sceneId,"  点击升级烹饪技能，你就能够学习到更高级别的烹饪技术了。")
	for i, eventId in x000107_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	AddNumText( sceneId, x000107_g_ScriptId, "烹饪介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000107_OnDefaultEvent( sceneId, selfId,targetId )
	x000107_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000107_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x000107_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000107_g_ScriptId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000107_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
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
function x000107_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			x000107_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000107_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000107_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000107_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000107_OnDie( sceneId, selfId, killerId )
end
