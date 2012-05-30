--甘宝宝

--脚本号
x025002_g_scriptId = 025002

--所拥有的事件ID列表
x025002_g_eventList={}

--**********************************
--事件列表
--**********************************
function x025002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  这里是苍山的观月亭，前面就是洱海，每当月夜，洱海风停水静，皎洁的月色溶入湖面，犹如万点星光，泛起万顷银波。#r  对面的山崖是望雪崖，从那山崖上可以看到点苍山峰白雪皑皑，素裹银装，在阳光照耀下，洁白晶莹。#r  可是这么美丽的景色现在已经没有人敢来观赏了……");
	for i, eventId in x025002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x025002_OnDefaultEvent( sceneId, selfId,targetId )
	x025002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x025002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x025002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x025002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
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
function x025002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			x025002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x025002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x025002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x025002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x025002_OnDie( sceneId, selfId, killerId )
end
