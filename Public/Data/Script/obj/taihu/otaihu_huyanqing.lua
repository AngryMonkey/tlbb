--太湖NPC
--呼延庆
--普通

--脚本号
x004001_g_ScriptId	= 004001

--所拥有的事件ID列表
x004001_g_EventList	= { 232002 }


--**********************************
--事件列表
--**********************************
function x004001_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		local	nam	= LuaFnGetName( sceneId, selfId )
		AddText( sceneId, "  "..nam.." ，来吧。#r" )
		for i, findId in x004001_g_EventList do
			CallScriptFunction( x004001_g_EventList[i], "OnEnumerate", sceneId, selfId, targetId )
		end
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--事件交互入口
--**********************************
function x004001_OnDefaultEvent( sceneId, selfId, targetId )
	x004001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x004001_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x004001_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x004001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x004001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			x004001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x004001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x004001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x004001_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x004001_OnDie( sceneId, selfId, killerId )
end
