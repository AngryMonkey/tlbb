-- 苏州NPC
-- 花剑雨
-- 一般

-- 脚本号
x001029_g_ScriptId = 001029

--所拥有的事件ID列表
x001029_g_EventList = { 050101, 500610 }

--**********************************
--事件列表
--**********************************
function x001029_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "    本镖局承蒙黑白两道的兄弟赏脸，走镖时从未出过纰漏，来我们镖局保镖，你就尽管放心好了。" )

		local i, findId
		for i, findId in x001029_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x001029_g_ScriptId, "连环副本介绍", 11, 105 )
		AddNumText( sceneId, x001029_g_ScriptId, "楼兰连环副本介绍", 11, 106 )
		
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x001029_OnDefaultEvent( sceneId, selfId, targetId )
	x001029_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001029_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 105 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_077}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return	
	elseif GetNumText() == 106 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{XSHBZ_80917_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end


	local i, findId
	for i, findId in x001029_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001029_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001029_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			x001029_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001029_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001029_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x001029_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001029_OnDie( sceneId, selfId, killerId )
end
