--鲁平


--脚本号
x032002_g_scriptId = 032004

--所拥有的事件ID列表
x032002_g_eventList={}

--**********************************
--事件列表
--**********************************
function x032002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  欢迎你来到山越人的巡逻者营地，你可以在这里四处转转，但是千万不要伤害那些花花草草哦，它们可是我们山越人的好朋友呢。#r  那边是水仙姐姐，她可是我们营地最聪明的人呢。")
	for i, eventId in x032002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x032002_OnDefaultEvent( sceneId, selfId,targetId )
	x032002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x032002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x032002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x032002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032002_g_eventList do
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
function x032002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			x032002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x032002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x032002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x032002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x032002_OnDie( sceneId, selfId, killerId )
end

