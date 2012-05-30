--邱行洛

--脚本号
x000122_g_scriptId = 000122

--所拥有的事件ID列表
x000122_g_eventList={250551}	

--**********************************
--事件列表
--**********************************
function x000122_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"蹴鞠大赛马上就要开始了，忙死我了，你要是有空能不能帮我捎个话儿？")
	for i, eventId in x000122_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	
	AddNumText( sceneId, x000122_g_scriptId, "洛阳送信任务介绍", 11, 10 )
	AddNumText( sceneId, x000122_g_scriptId, "关于蹴鞠大赛", 11, 11 )
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000122_OnDefaultEvent( sceneId, selfId,targetId )
	x000122_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000122_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_075}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 11 then
		BeginEvent(sceneId)	
			AddText(sceneId,"#B关于蹴鞠大赛");
			AddText( sceneId, "#{CUJU_INFO}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	for i, findId in x000122_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000122_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000122_g_eventList do
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
function x000122_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000122_g_eventList do
		if missionScriptId == findId then
			x000122_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000122_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000122_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000122_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000122_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000122_OnDie( sceneId, selfId, killerId )
end
