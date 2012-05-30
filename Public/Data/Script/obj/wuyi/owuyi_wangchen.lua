--NPC忘尘
--武夷
--普通

--脚本号
x032112_g_scriptId = 032112

--所拥有的事件ID列表
x032112_g_eventList={212123}

--**********************************
--事件列表
--**********************************
function x032112_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  人生不过百年都将走向终点，无论帝王将相还是平民百姓。那么人生在世究竟是为了什么？阿弥陀佛，施主，这个问题是否也在困扰着你呢？")
	for i, eventId in x032112_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x032112_OnDefaultEvent( sceneId, selfId,targetId )
	x032112_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x032112_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x032112_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x032112_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032112_g_eventList do
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
function x032112_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x032112_g_eventList do
		if missionScriptId == findId then
			x032112_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x032112_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x032112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x032112_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x032112_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x032112_OnDie( sceneId, selfId, killerId )
end

