-- 城市任务副本回城市的传送点

x400803_g_ScriptId = 400803
x400803_g_ControlScript = 600019

-- 玩家进入传送点
function x400803_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400803_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400803_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400803_OnLeaveArea( sceneId, selfId )
	return
end
