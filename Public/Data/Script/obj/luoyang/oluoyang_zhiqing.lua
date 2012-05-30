--洛阳NPC     洛阳循环任务
--智清
--普通

--脚本号
x000068_g_scriptId = 000068

--所拥有的事件ID列表
x000068_g_eventList={230000, 230011, 230012}

--**********************************
--事件列表
--**********************************
function x000068_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		local PlayerName = GetName( sceneId, selfId )
		AddText(sceneId, "  "..PlayerName.."#{OBJ_luoyang_0021}")
		--for i, eventId in x000068_g_eventList do
		CallScriptFunction( x000068_g_eventList[1], "OnEnumerate", sceneId, selfId, targetId )
		--end
	EndEvent(sceneId)
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x000068_OnDefaultEvent( sceneId, selfId, targetId )
------------------------------------------------------
--[Nov.1 2006]Lybin Close
--x000068_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		local PlayerName	= GetName( sceneId, selfId )
		AddText( sceneId, "  "..PlayerName.."#{OBJ_luoyang_0021}" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
------------------------------------------------------
end

--**********************************
--事件列表选中一项
--**********************************
function x000068_OnEventRequest( sceneId, selfId, targetId, eventId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000068_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x000068_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			x000068_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000068_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000068_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i = 1
	local findId = 0

	for i, findId in x000068_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000068_OnDie( sceneId, selfId, killerId )
end
