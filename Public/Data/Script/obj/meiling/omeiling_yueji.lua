--梅岭NPC
--月季
--普通

--脚本号
x033009_g_scriptId = 033009

--所拥有的事件ID列表
x033009_g_eventList={212113}

--**********************************
--事件列表
--**********************************
function x033009_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  最近太阳花姐姐总是莫明其妙的发脾气，好奇怪啊！也不知道紫薇妹妹那边有没有什么事情，好久没她们的消息了。#r  也不知道荆棘在做什么，这几天感觉很压抑，像是要有什么事情发生似的。唉，可能是我又多心了吧。")
		for i, eventId in x033009_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x033009_OnDefaultEvent( sceneId, selfId,targetId )
	x033009_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x033009_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x033009_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x033009_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x033009_g_eventList do
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
function x033009_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			x033009_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x033009_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x033009_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x033009_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x033009_OnDie( sceneId, selfId, killerId )
end
