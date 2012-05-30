--蔡卞

--脚本号
x000002_g_scriptId = 000002

--所拥有的事件ID列表
x000002_g_eventList={200501,200502,200603,200604,201111,201211,201313,201411,201412,201511,201512,201611,650000}

--**********************************
--事件列表
--**********************************
function x000002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  西京洛阳乃是天下第一大城。来了洛阳，可别忘了去赏赏洛阳牡丹，去白马寺上一炷香。");
	--bDone = IsMissionHaveDone( sceneId, selfId, 0004 );
	--PrintStr (bDone)
	for i, eventId in x000002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000002_OnDefaultEvent( sceneId, selfId,targetId )
	x000002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000002_g_eventList do
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
function x000002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			x000002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000002_OnDie( sceneId, selfId, killerId )
end
