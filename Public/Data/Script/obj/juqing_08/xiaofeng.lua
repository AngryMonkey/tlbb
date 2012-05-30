--120001

-- 苍茫山，萧峰

--脚本号
x120001_g_scriptId = 120001

--所拥有的事件ID列表
x120001_g_eventList={200035, 200036}

--**********************************
--事件列表
--**********************************
function x120001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_CMS_B_001}")
	
	-- 如果这个玩家完成了“四面楚歌，”
  if IsMissionHaveDone(sceneId,selfId,31) > 0 then
		AddNumText(sceneId,x120001_g_scriptId,"金戈荡寇鏖兵",10,123);
	end
	
	for i, eventId in x120001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x120001_OnDefaultEvent( sceneId, selfId,targetId )
	x120001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x120001_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	if GetNumText() == 123   then
		-- 开启剧情
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 3)
			LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		end
		-- 关闭UI
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
		
	end

	for i, findId in x120001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x120001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
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
function x120001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			x120001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x120001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x120001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x120001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x120001_OnDie( sceneId, selfId, killerId )
end
