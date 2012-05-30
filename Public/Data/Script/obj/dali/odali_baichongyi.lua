-- 002058
-- 白崇义

--脚本号
x002058_g_scriptId = 002058

--所拥有的事件ID列表
x002058_g_eventList={125020}

--**********************************
--事件列表
--**********************************
function x002058_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  #G$N#W英雄！来嵩山封禅台竞技场展示一下你的实力吧！#r  #G你在进入封禅台之前必须加入一支队伍，这支队伍中的所有人在进入封禅台后都和你属于同一个阵营，除了他们以外，在封禅台上的其他所有人都是你的对手。#W #r  怎么样，想来试试看吗？");
		for i, eventId in x002058_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002058_OnDefaultEvent( sceneId, selfId,targetId )
	x002058_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002058_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002058_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002058_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002058_g_eventList do
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
function x002058_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			x002058_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002058_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002058_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002058_OnDie( sceneId, selfId, killerId )
end
