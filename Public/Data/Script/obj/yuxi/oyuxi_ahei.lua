--玉溪NPC
--阿黑
--普通

x027004_g_scriptId = 027004

--所拥有的事件ID列表
x027004_g_eventList={212111}

--**********************************
--事件列表
--**********************************
function x027004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  为什么从小青梅竹马，长大后就一定要在一起呢？#r  我很难理解，为什么大家都这样以为……是的，我是应该救出阿诗玛，她是我最好的朋友，但是……#r  为什么？为什么？为什么连阿依娜都觉得我和阿诗玛是金童玉女呢？")
	for i, eventId in x027004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x027004_OnDefaultEvent( sceneId, selfId,targetId )
	x027004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x027004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x027004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x027004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x027004_g_eventList do
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
function x027004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x027004_g_eventList do
		if missionScriptId == findId then
			x027004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x027004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	
	for i, findId in x027004_g_eventList do
		if 212111 == findId then
			CallScriptFunction( 212111, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x027004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x027004_g_eventList do
		if 212111 == findId then
			CallScriptFunction( 212111, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x027004_OnDie( sceneId, selfId, killerId )
end
