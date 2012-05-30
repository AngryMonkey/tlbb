--高升泰

--脚本号
x002018_g_scriptId = 002018


--所拥有的事件ID列表
x002018_g_eventList={}
--x002018_g_eventList={200301,200302}

--**********************************
--事件列表
--**********************************
function x002018_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  现在很多武林人士集聚大理城，"..PlayerName..PlayerSex.."，要是你为朝廷想做点什么，去找五华坛的李工部，他会给你些事情的，为朝廷做事会得到奖励的。")
	--四大恶人此次前来大理,不知有何所图,但总而言之,不是好事.");
	for i, eventId in x002018_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002018_OnDefaultEvent( sceneId, selfId,targetId )
	x002018_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002018_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002018_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002018_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
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
function x002018_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			x002018_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002018_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002018_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002018_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002018_OnDie( sceneId, selfId, killerId )
end
