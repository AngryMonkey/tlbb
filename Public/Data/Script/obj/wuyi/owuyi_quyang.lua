--鲁平


--脚本号
x032001_g_scriptId = 032001

--所拥有的事件ID列表
x032001_g_eventList={212123}

--**********************************
--事件列表
--**********************************
function x032001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  山越族的姐妹们都很优秀。#r  紫薇温柔善良，讨人喜欢。水仙清静雅致，沉稳聪颖，而芙蓉姐姐……")
	for i, eventId in x032001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x032001_OnDefaultEvent( sceneId, selfId,targetId )
	x032001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x032001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x032001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x032001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032001_g_eventList do
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
function x032001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x032001_g_eventList do
		if missionScriptId == findId then
			x032001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x032001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x032001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x032001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x032001_OnDie( sceneId, selfId, killerId )
end

