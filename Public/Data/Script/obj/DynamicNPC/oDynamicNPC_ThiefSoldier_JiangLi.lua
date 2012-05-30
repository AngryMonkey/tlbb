--太湖NPC
--造反恶贼
--普通

--脚本号
x050014_g_ScriptId	= 050014

--所拥有的事件ID列表
x050014_g_EventList	= { 050015 }
--接取任务的最低等级
x050014_g_minLevel			= 20

--**********************************
--事件列表
--**********************************
function x050014_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		AddText( sceneId, "如今天下动乱，贼兵四起，朝廷为了迅速平息混乱，特号召各位帮助平叛。平叛有功者，将给予一定的称号奖励。" )
		CallScriptFunction( x050014_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
	
end

--**********************************
--事件交互入口
--**********************************
function x050014_OnDefaultEvent( sceneId, selfId, targetId )
	x050014_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050014_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x050014_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x050014_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x050014_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x050014_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x050014_g_EventList do
		if missionScriptId == findId then
			x050014_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x050014_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x050014_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x050014_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x050014_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x050014_OnDie( sceneId, selfId, killerId )
end
