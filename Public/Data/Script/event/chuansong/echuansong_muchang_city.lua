-- 城市任务副本回城市的传送点

x400801_g_ScriptId = 400801
x400801_g_ControlScript = 600009

-- 玩家进入传送点
function x400801_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400801_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400801_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400801_OnLeaveArea( sceneId, selfId )
	return
end
