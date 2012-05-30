-- 402261
-- 燕子坞 传送出口区域脚本

x402261_g_SceneId = 4
x402261_g_X = 70
x402261_g_Z = 120

--玩家进入一个 area 时触发
function x402261_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, 
																							selfId, 
																							x402261_g_SceneId,
																							x402261_g_X,
																							x402261_g_Z)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x402261_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x402261_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x402261_OnLeaveArea( sceneId, selfId )
	
end

