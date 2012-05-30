--鲁平


--脚本号
x024004_g_scriptId = 024004

--所拥有的事件ID列表
x024004_g_eventList={}

--**********************************
--事件列表
--**********************************
function x024004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  我是个孤儿，从来没有见过阿爸和阿妈，是叔叔把我从小抚养长大的，叔叔对我就象亲生儿子一样，我一定要找到他。#r  我曾经在叔叔的卧房里见过一个姑姑的画像，那个姑姑好漂亮啊，叔叔每次喝醉了就会一直看着那幅画像，一直看。#r  叔叔会不会去找那个姑姑了？")
	for i, eventId in x024004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x024004_OnDefaultEvent( sceneId, selfId,targetId )
	x024004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x024004_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x024004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x024004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
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
function x024004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			x024004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x024004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x024004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x024004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x024004_OnDie( sceneId, selfId, killerId )
end

