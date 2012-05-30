-- 212118


-- 城市任务副本回城市的传送点

x212118_g_ScriptId = 212118

-- 玩家进入传送点
function x212118_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1, 105, 111)
end

-- 玩家停留在传送点
function x212118_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x212118_OnLeaveArea( sceneId, selfId )
	return
end
