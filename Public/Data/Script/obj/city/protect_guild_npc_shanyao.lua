--保护帮派驻地
--普通

--脚本号
x805040_g_ScriptId	= 805040

--所拥有的事件ID列表
x805040_g_EventList	= { 805042 }


--接取任务的最低等级
x805040_g_minLevel			= 20

--**********************************
--事件列表
--**********************************
function x805040_UpdateEventList( sceneId, selfId, targetId )

	local Humanguildid 	= GetHumanGuildID(sceneId,selfId)
	local cityguildid 	= GetCityGuildID(sceneId, selfId, sceneId)
	
	if Humanguildid ~= cityguildid then
		BeginEvent( sceneId )
			AddText( sceneId, "#{SYDH_81016_01}" )
			AddNumText( sceneId, 805042, "关于保护帮会" ,11 ,2)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	CallScriptFunction( x805040_g_EventList[1], "OnEnumerate", sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x805040_OnDefaultEvent( sceneId, selfId, targetId )
	x805040_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x805040_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x805040_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x805040_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805040_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			x805040_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x805040_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x805040_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x805040_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x805040_OnDie( sceneId, selfId, killerId )
end
