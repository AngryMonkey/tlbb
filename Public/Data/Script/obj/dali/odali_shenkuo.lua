--大理NPC
--沈括
--普通

--脚本号
x002001_g_scriptId = 002001

--所拥有的事件ID列表
x002001_g_eventList={212128,212131}

--**********************************
--事件列表
--**********************************
function x002001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  大理国有很多植物和矿藏极为罕见，也不枉我从汴京千里迢迢而来，真是不虚此行啊。")
		for i, eventId in x002001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		-- 领取称号
		if (IsMissionHaveDone(sceneId,selfId, 253) > 0 ) then
			AddNumText(sceneId, x002001_g_scriptId, "领取称号", 6, 999);
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002001_OnDefaultEvent( sceneId, selfId,targetId )
	x002001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText()==999  then
		LuaFnAwardTitle( sceneId, selfId,  9, 233)
		SetCurTitle(sceneId, selfId,  9, 233)
		LuaFnDispatchAllTitle(sceneId, selfId)
		return
	end
	
	for i, findId in x002001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002001_g_eventList do
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
function x002001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			x002001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002001_OnDie( sceneId, selfId, killerId )
end
