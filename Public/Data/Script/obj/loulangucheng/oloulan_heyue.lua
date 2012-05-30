-- 楼兰NPC
-- 何悦
-- 普通

-- 脚本号
x050110_g_ScriptId = 050110

--所拥有的事件ID列表
x050110_g_EventList = { 050220,050222 }

x050110_g_Name					= "何悦"

--**********************************
--事件列表
--**********************************
function x050110_UpdateEventList( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x050110_g_Name then
		return
	end
	
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_1}" )
		--local i, findId
		for i, findId in x050110_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x050110_g_ScriptId, "关于黄金之链", 11, 10 )
		AddNumText( sceneId, x050110_g_ScriptId, "关于熔岩之地", 11, 11 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x050110_OnDefaultEvent( sceneId, selfId, targetId )
	x050110_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050110_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80822_1}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	if GetNumText() == 11 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80822_3}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--local i, findId
	for i, findId in x050110_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050110_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	--local i, findId
	for i, findId in x050110_g_EventList do
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
function x050110_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			x050110_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x050110_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x050110_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x050110_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x050110_OnDie( sceneId, selfId, killerId )
end
