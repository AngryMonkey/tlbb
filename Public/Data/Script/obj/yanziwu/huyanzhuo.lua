-- 402241
-- 呼延灼   燕子坞副本内

--太湖 李纲

--脚本号
x402241_g_scriptId = 402241

x402241_g_SceneData_1 = 8

--所拥有的事件ID列表
x402241_g_eventList={}

--**********************************
--事件列表
--**********************************
function x402241_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) < 10  then
			AddText(sceneId, "#{dazhan_yzw_002}")
		elseif LuaFnGetCopySceneData_Param(sceneId, 8) >= 10  then
			AddText(sceneId, "#{dazhan_yzw_003}")
		end	
		
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			AddNumText( sceneId, x402241_g_scriptId, "战斗吧！", 10 ,1  )
			--AddNumText( sceneId, x402241_g_scriptId, "直接跳到第二关", 10 ,2  )
		end
		
		for i, eventId in x402241_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402241_OnDefaultEvent( sceneId, selfId,targetId )
	x402241_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402241_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1  then
		-- 检测当前是不是在相关副本，这里必须要做安全检查，现在现不做
		if GetName(sceneId, targetId) ~= "呼延豹"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 2)
		end

		-- 关闭界面
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
		return
	end
	
	if GetNumText() == 2  then
		-- 检测当前是不是在相关副本，这里必须要做安全检查，现在现不做
		if GetName(sceneId, targetId) ~= "呼延豹"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 10)
		end
		BeginEvent(sceneId)
			AddText(sceneId, "第二关已经开启。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

		return
	end

	for i, findId in x402241_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x402241_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
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
function x402241_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			x402241_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402241_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402241_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402241_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402241_OnDie( sceneId, selfId, killerId )
	LuaFnSetCopySceneData_Param(sceneId, 26, 500)
end

