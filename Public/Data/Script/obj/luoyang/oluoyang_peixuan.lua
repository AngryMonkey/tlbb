--洛阳NPC    学习镶嵌技能    升级镶嵌技能
--裴宣
--镶嵌

--脚本号
x000114_g_ScriptId = 000114

--所拥有的事件
--estudy_xiangqian = 713504
--elevelup_xiangqian = 713563
--edialog_xiangqian = 713603
--所拥有的事件ID列表
x000114_g_eventList={} -- 713504,713563,713603}
--**********************************
--事件列表
--**********************************
function x000114_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_luoyang_0031}")
	for i, eventId in x000114_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000114_OnDefaultEvent( sceneId, selfId,targetId )
	x000114_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000114_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000114_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000114_g_ScriptId )
		return
	end
end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000114_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000114_g_eventList do
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
function x000114_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			x000114_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000114_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000114_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000114_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000114_OnDie( sceneId, selfId, killerId )
end
