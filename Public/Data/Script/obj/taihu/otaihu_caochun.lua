--太湖 曹纯

--脚本号
x004003_g_scriptId = 004003

--所拥有的事件ID列表
x004003_g_eventList={}	--210404,210403

--**********************************
--事件列表
--**********************************
function x004003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	
	local IsDone474 = IsMissionHaveDone(sceneId,selfId,474)
	
		
	
	if(IsDone474 == 0) then	
		AddText(sceneId,  "我的身份是极端保密的，很少有人知道。")	
	end
	
	for i, eventId in x004003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x004003_OnDefaultEvent( sceneId, selfId,targetId )
	x004003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x004003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x004003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x004003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004003_g_eventList do
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
function x004003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			x004003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x004003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x004003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x004003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x004003_OnDie( sceneId, selfId, killerId )
end
