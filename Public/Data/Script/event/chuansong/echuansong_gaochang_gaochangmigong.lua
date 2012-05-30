x400933_g_ScriptId = 400933

x400933_left 	=69.0000
x400933_right	=76.0000

x400933_top  	=141.0000
x400933_bottom	=148.0000


--玩家进入一个 area 时触发
function x400933_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400933_g_ScriptId);
		UICommand_AddString(sceneId, "GotoGaochangmigong");
		UICommand_AddString(sceneId, "高昌迷宫为不加杀气场景，请注意安全。你确认要进入吗？");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400933_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400933_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400933_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400933_GotoGaochangmigong( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 424   then
		--你已经不在可传送区域。
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400933_left or
			targetX > x400933_right or
			targetZ < x400933_top  or
			targetZ > x400933_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 520,100,99)
		
end
