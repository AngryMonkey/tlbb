--鲁平


--脚本号
x031006_g_scriptId = 031006

--所拥有的事件ID列表
x031006_g_eventList={}

--**********************************
--事件列表
--**********************************
function x031006_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  听说法念师兄未出家前和那个有名的铸剑大师雷焕有不一般的关系，不知道是真是假。#r  不过，每年清明的时候都有个带面纱的女施主来找师兄，可师兄从不见她，唉，#r  孽债啊！")
	for i, eventId in x031006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x031006_OnDefaultEvent( sceneId, selfId,targetId )
	x031006_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x031006_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x031006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x031006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031006_g_eventList do
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
function x031006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			x031006_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x031006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x031006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x031006_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x031006_OnDie( sceneId, selfId, killerId )
end

