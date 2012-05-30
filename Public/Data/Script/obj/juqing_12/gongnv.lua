--038002

-- 绿衣宫女 038002

--脚本号
x038002_g_ScriptId = 038002

--所拥有的事件ID列表
x038002_g_eventList={200053, 200055}

--**********************************
--事件列表
--**********************************
function x038002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YPT_B_003}")
	for i, eventId in x038002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	
	-- 如果玩家已经完成了任务“环佩空归月夜魂”，
	-- x200053_g_MissionId为43
	if (IsMissionHaveDone(sceneId,selfId,43) > 0 ) then
		if LuaFnGetCopySceneData_Param(sceneId, 30) == 0 then
			AddNumText( sceneId, x038002_g_ScriptId, "酒罢问君三语", 10, 999 )
			--LuaFnSetCopySceneData_Param(sceneId, 30, 1)
		end
		DispatchEventList(sceneId,selfId,targetId)
	end
end

--**********************************
--事件交互入口
--**********************************
function x038002_OnDefaultEvent( sceneId, selfId,targetId )
	x038002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x038002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999 then
		--开始剧情
		LuaFnSetCopySceneData_Param(sceneId, 8, 1) --控制说话
		LuaFnSetCopySceneData_Param(sceneId, 9, GetGameTime(sceneId, selfId))	--时间

		LuaFnSetCopySceneData_Param(sceneId, 30, 1)
		
    BeginEvent(sceneId)
		AddText(sceneId,"欢迎你的到来!")
    EndEvent( )
    DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	for i, findId in x038002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x038002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038002_g_eventList do
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
function x038002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			x038002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x038002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x038002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x038002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x038002_OnDie( sceneId, selfId, killerId )
end
