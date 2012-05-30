-- 402249
-- 华赫艮


--脚本号
x402249_g_scriptId = 402249

--所拥有的事件ID列表
x402249_g_eventList={}

--**********************************
--事件列表
--**********************************
function x402249_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		AddText(sceneId, "#{dazhan_yzw_007}")
		if GetName(sceneId, targetId) == "华赫艮" then
			if nStep == 15  then
				AddNumText( sceneId, x402249_g_scriptId, "从地道进入燕子坞", 9 ,1  )
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402249_OnDefaultEvent( sceneId, selfId,targetId )
	x402249_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402249_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 1  then
		--local nStep = LuaFnGetCopySceneData_Param(sceneId, 8)
		--if nStep == 14  then
			-- 传送玩家到一个新的位置
			SetPos(sceneId, selfId, 154, 96)
		--end
		return
	end
	
	for i, findId in x402249_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x402249_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402249_g_eventList do
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
function x402249_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			x402249_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402249_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402249_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402249_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402249_OnDie( sceneId, selfId, killerId )

end

