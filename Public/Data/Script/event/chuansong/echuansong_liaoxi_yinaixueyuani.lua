x400925_g_ScriptId = 400925

x400925_left 	=284.0000
x400925_right	=288.0000

x400925_top  	=41.0000
x400925_bottom	=47.0000


--玩家进入一个 area 时触发
function x400925_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400925_g_ScriptId);
		UICommand_AddString(sceneId, "GotoYinaixueyuan");
		UICommand_AddString(sceneId, "银皑雪原为不加杀气场景，请注意安全。你确认要进入吗？");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400925_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400925_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400925_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400925_GotoYinaixueyuan( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 21   then
		--你已经不在可传送区域。
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400925_left or
			targetX > x400925_right or
			targetZ < x400925_top  or
			targetZ > x400925_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
		
end
