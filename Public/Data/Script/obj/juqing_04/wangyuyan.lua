--王姑娘

--脚本号
x037002_g_ScriptId = 037002

--所拥有的事件ID列表
x037002_g_eventList={200015, 200016, 200085}

--**********************************
--事件列表
--**********************************
function x037002_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_YZW_B_002}")
	for i, eventId in x037002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	--如果完家已经完成了 指点群豪戏 14，那么多一个选项
	if IsMissionHaveDone( sceneId, selfId, 14 ) > 0 then  --完家如果有这个任务
		if LuaFnGetCopySceneData_Param(sceneId, 10) == 0  then
			AddNumText( sceneId, x037002_g_ScriptId, "指点群豪戏", 10, 999 )
		end
	end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x037002_OnDefaultEvent( sceneId, selfId,targetId )
	x037002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x037002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 999  then
		--开始点名
		LuaFnSetCopySceneData_Param(sceneId, 10, 1)
		LuaFnSetCopySceneData_Param(sceneId, 11, GetGameTime(sceneId, selfId))
		LuaFnSetCopySceneData_Param(sceneId, 12, GetGameTime(sceneId, selfId))
		
		--点名一旦开始，就不能再来一次了
		LuaFnSetCopySceneData_Param(sceneId, 25, 1)
		
		--关闭客户端界面
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId,1000)

		return
	end
	
	for i, findId in x037002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x037002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId,targetId  )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x037002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			x037002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x037002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x037002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x037002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x037002_OnDie( sceneId, selfId, killerId )
end
