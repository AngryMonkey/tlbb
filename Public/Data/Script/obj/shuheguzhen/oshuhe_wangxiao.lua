-- 束河古镇NPC
-- 王潇 
-- 竞技场传送脚本

--脚本号
x001173_g_scriptId = 001173

--所拥有的事件ID列表
x001173_g_eventList={125020}
x001173_g_MsgInfo = { "#{SHGZ_0612_02}",
											"#{SHGZ_0620_04}",
											"#{SHGZ_0620_05}",
											"#{SHGZ_0620_06}",
										}

--**********************************
--事件列表
--**********************************
function x001173_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001173_g_MsgInfo))
		AddText( sceneId, x001173_g_MsgInfo[msgidx] )	
		for i, eventId in x001173_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001173_OnDefaultEvent( sceneId, selfId,targetId )
	x001173_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001173_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001173_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001173_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001173_g_eventList do
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
function x001173_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			x001173_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001173_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001173_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001173_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001173_OnDie( sceneId, selfId, killerId )
	
end
