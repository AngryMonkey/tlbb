x400027_g_ScriptId = 400027

x400027_left 	=90.0000
x400027_right	=101.0000

x400027_top  	=190.0000
x400027_bottom	=198.0000


--玩家进入一个 area 时触发
function x400027_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<20 then
		BeginEvent(sceneId)
			strText = "你的等级不足20级"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400027_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu1");
		UICommand_AddString(sceneId, "镜湖为不加杀气场景，请注意安全。你确认要进入吗？");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,45,264, 20)
	end
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400027_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400027_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400027_OnLeaveArea( sceneId, selfId )
end

--**********************************
--任务入口函数
--**********************************
function x400027_GotoJinghu1( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	
	-- 检查玩家是不是还在这个范围内
	if sceneId ~= 12   then
		--你已经不在可传送区域。
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400027_left or
			targetX > x400027_right or
			targetZ < x400027_top  or
			targetZ > x400027_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"你已经不在可传送区域。")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,34,233, 20)
		
end
