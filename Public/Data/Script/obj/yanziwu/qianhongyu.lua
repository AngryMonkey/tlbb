--402246
-- 钱宏宇

--脚本号
x402246_g_scriptId = 402246

x402246_g_SceneData_1 = 8

--所拥有的事件ID列表
x402246_g_eventList={}

--**********************************
--事件列表
--**********************************
function x402246_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		if nStep==11   then
			AddText(sceneId, "#{dazhan_yzw_004}")
		elseif nStep == 15  then
			AddText(sceneId, "#{dazhan_yzw_006}")
		else
			AddText(sceneId, "#{dazhan_yzw_005}")
		end

		for i, eventId in x402246_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		if nStep == 10  then
			AddNumText( sceneId, x402246_g_scriptId, "战斗吧！", 10 ,1  )
		end
			
		if nStep < 14  then
			--AddNumText( sceneId, x402246_g_scriptId, "直接开始第3关", 10 ,2  )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402246_OnDefaultEvent( sceneId, selfId,targetId )
	x402246_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402246_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 1  then
		-- 检测当前是不是在相关副本，这里必须要做安全检查，现在先不做
		if GetName(sceneId, targetId) ~= "钱宏宇"  then
			return
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 8) == 10  then
			LuaFnSetCopySceneData_Param(sceneId, 8, 11)
		end
		
		-- 关闭界面
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 2  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 15)
		
		--同时刷出需要的后续怪
		CallScriptFunction( 401040, "CreateMonster_9",sceneId )
		CallScriptFunction( 401040, "CreateMonster_10",sceneId )
		CallScriptFunction( 401040, "CreateMonster_11",sceneId )
		
		BeginEvent(sceneId)
			AddText(sceneId, "  第3关已经开启")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
	end

	for i, findId in x402246_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x402246_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402246_g_eventList do
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
function x402246_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			x402246_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402246_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402246_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402246_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402246_OnDie( sceneId, selfId, killerId )
	LuaFnSetCopySceneData_Param(sceneId, 26, 501)
end

