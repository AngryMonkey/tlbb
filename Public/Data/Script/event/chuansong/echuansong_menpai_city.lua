-- 城市任务副本回城市的传送点

x400805_g_ScriptId = 400805
x400805_g_ControlScript = 600026

-- 玩家进入传送点
function x400805_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400805_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400805_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400805_OnLeaveArea( sceneId, selfId )
	return
end
