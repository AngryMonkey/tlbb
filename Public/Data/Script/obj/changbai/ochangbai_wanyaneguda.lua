--顽颜阿骨打

--脚本号
x022001_g_scriptId = 022001

--所拥有的事件ID列表
x022001_g_eventList={}--211305,211306,211309	

--**********************************
--事件列表
--**********************************
function x022001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  辽国人都传说，女真兵不可满一万，满一万则天下无敌。完颜部一定要统一女真，率领一万铁骑，推翻辽国的统治。")
	for i, eventId in x022001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x022001_OnDefaultEvent( sceneId, selfId,targetId )
	x022001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x022001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x022001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x022001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x022001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			x022001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x022001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x022001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x022001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x022001_OnDie( sceneId, selfId, killerId )
end
