-- 城市任务副本回城市的传送点

x400806_g_ScriptId = 400806
x400806_g_ControlScript = 600037

-- 玩家进入传送点
function x400806_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400806_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400806_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400806_OnLeaveArea( sceneId, selfId )
	return
end
