-- 城市任务副本回城市的传送点

x400807_g_ScriptId = 400807
x400807_g_ControlScript = 600039

-- 玩家进入传送点
function x400807_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400807_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400807_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400807_OnLeaveArea( sceneId, selfId )
	return
end
