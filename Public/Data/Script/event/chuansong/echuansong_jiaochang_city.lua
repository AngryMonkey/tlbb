-- 城市任务副本回城市的传送点

x400804_g_ScriptId = 400804
x400804_g_ControlScript = 600025

-- 玩家进入传送点
function x400804_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400804_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400804_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400804_OnLeaveArea( sceneId, selfId )
	return
end
