-- 402247
-- 连弩塔 

--脚本号
x402247_g_scriptId = 402247

--所拥有的事件ID列表
x402247_g_eventList={}

-- 木材ID  (暂时用别的物品代替)
x402247_g_Item = 40004430


--**********************************
--事件列表
--**********************************
function x402247_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		--AddText(sceneId, "  我是连弩塔，丘果不给我说话。")		    				

		if LuaFnGetCopySceneData_Param(sceneId, 8) >= 10  then
		
			local szName = GetName(sceneId, targetId)
			if szName == "前连弩塔"  then
				AddText(sceneId, "  连弩塔，可自动攻击周围所有的敌方目标。")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 9)
				if nCount < 5  then
					local str = "修复还需要" .. 5-nCount .. "个木材"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,1 )
				end
				
			elseif szName == "后连弩塔"  then
				AddText(sceneId, "  连弩塔，可自动攻击周围所有的敌方目标。")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 10)
				if nCount < 5  then
					local str = "修复还需要" .. 5-nCount .. "个木材"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,2 )
				end
				
			elseif szName == "治疗塔"  then
				AddText(sceneId, "  治疗塔，可自动恢复周围所有的友方目标的血。")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 11)
				if nCount < 10  then
					local str = "修复还需要" .. 10-nCount .. "个木材"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,3 )
				end
				
			elseif szName == "守御塔"  then
				AddText(sceneId, "  守御塔，可降低周围所有的敌方目标的攻击。")
				local nCount = LuaFnGetCopySceneData_Param(sceneId, 12)
				if nCount < 5  then
					local str = "修复还需要" .. 5-nCount .. "个木材"
					AddNumText( sceneId, x402247_g_scriptId, str, 10 ,4 )
				end
				
			end
		end
	
		for i, eventId in x402247_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x402247_OnDefaultEvent( sceneId, selfId,targetId )
	x402247_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402247_OnEventRequest( sceneId, selfId, targetId, eventId )
	
	local nNumText = GetNumText()
	if nNumText == 1  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 9)
		nCount = 5 - nCount
		-- 背包中可以删除的“木材”的总数
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 9, 5-(nCount-nItemCount) )
		end
		
		if LuaFnGetCopySceneData_Param(sceneId, 9) >= 5  then
			
		end
	
	elseif nNumText == 2  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 10)
		nCount = 5 - nCount
		-- 背包中可以删除的“木材”的总数
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 10, 5-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 10) >= 5  then
			
		end
		
	elseif nNumText == 3  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 11)
		nCount = 10 - nCount
		-- 背包中可以删除的“木材”的总数
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 11, 10-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 11) >= 10  then
			
		end
		
	elseif nNumText == 4  then
		local nCount = LuaFnGetCopySceneData_Param(sceneId, 12)
		nCount = 5 - nCount
		-- 背包中可以删除的“木材”的总数
		local nItemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x402247_g_Item) 
		if nItemCount > nCount  then
			nItemCount = nCount
		end
		local bDelOk = LuaFnDelAvailableItem(sceneId,selfId, x402247_g_Item, nItemCount)
		if bDelOk == 1  then
			LuaFnSetCopySceneData_Param(sceneId, 12, 5-(nCount-nItemCount) )
		end

		if LuaFnGetCopySceneData_Param(sceneId, 12) >= 5  then
			
		end
		
	end

	if nNumText==1 or nNumText==2 or nNumText==3 or nNumText==4  then
		
		BeginEvent(sceneId)
			local szName = GetName(sceneId, targetId)
			if szName == "前连弩塔"  then
				AddText(sceneId, "  连弩塔，可自动攻击周围所有的敌方目标。")
			elseif szName == "后连弩塔"  then
				AddText(sceneId, "  连弩塔，可自动攻击周围所有的敌方目标。")
			elseif szName == "治疗塔"  then
				AddText(sceneId, "  治疗塔，可自动恢复周围所有的友方目标的血。")
			elseif szName == "守御塔"  then
				AddText(sceneId, "  守御塔，可降低周围所有的敌方目标的攻击。")
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	
	for i, findId in x402247_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x402247_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402247_g_eventList do
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
function x402247_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			x402247_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402247_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402247_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402247_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402247_OnDie( sceneId, selfId, killerId )

end

