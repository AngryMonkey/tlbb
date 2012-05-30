-- 楼兰NPC
-- 刘盾
-- 普通

-- 脚本号
x050111_g_ScriptId = 050111

--所拥有的事件ID列表
x050111_g_EventList = { 050221 }

x050111_g_Name					= "刘盾"

--**********************************
--事件列表
--**********************************
function x050111_UpdateEventList( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x050111_g_Name then
		return
	end
	
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_20}" )
		--local i, findId
		for i, findId in x050111_g_EventList do
			CallScriptFunction( findId, "OnEnumerate", sceneId, selfId, targetId )
		end
		AddNumText( sceneId, x050111_g_ScriptId, "关于玄佛珠", 11, 10 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	
end

--**********************************
--事件交互入口
--**********************************
function x050111_OnDefaultEvent( sceneId, selfId, targetId )
	x050111_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050111_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80822_2}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	--local i, findId
	for i, findId in x050111_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050111_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	--local i, findId
	for i, findId in x050111_g_EventList do
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
function x050111_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	local i, findId

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			x050111_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x050111_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	local i, findId
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x050111_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	local i, findId
	for i, findId in x050111_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x050111_OnDie( sceneId, selfId, killerId )
end
