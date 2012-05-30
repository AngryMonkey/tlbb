--天山NPC
--兰剑
--普通

x017002_g_scriptId = 017002

x017002_g_eventList = { 228902 }

--**********************************
--事件交互入口
--**********************************
function x017002_OnDefaultEvent( sceneId, selfId, targetId )
	x017002_g_MenPai = GetMenPai( sceneId, selfId )
	if x017002_g_MenPai == 7 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TSJZ_081103_04}" )

			for i, eventId in x017002_g_eventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end

			AddNumText( sceneId, x017002_g_scriptId, "学习技能", 12, 0 )
			AddNumText( sceneId, x017002_g_scriptId, "关于心法的介绍", 11, 10 )
			--AddNumText(sceneId, x017002_g_scriptId, "#{JZBZ_081031_02}",11,11)
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	else
		BeginEvent( sceneId )
			AddText( sceneId, "  其实我是天山派弟子们的二师姐，梅剑姐姐才是大师姐。嘿嘿。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--事件列表选中一项
--**********************************
function x017002_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x017002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

	if GetNumText() == 10 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_xinfajieshao_001}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif GetNumText() == 11 then
		BeginEvent(sceneId)					
			AddText( sceneId, "#{JZBZ_081031_01}" )							
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	DispatchXinfaLevelInfo( sceneId, selfId, targetId, 7 )
end

--**********************************
--接受此NPC的任务
--**********************************
function x017002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017002_g_eventList do
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
function x017002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			x017002_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x017002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x017002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x017002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x017002_OnDie( sceneId, selfId, killerId )
end
