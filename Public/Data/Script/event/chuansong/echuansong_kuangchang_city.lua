-- 城市任务副本回城市的传送点

x400800_g_ScriptId = 400800
x400800_g_ControlScript = 600004

-- 玩家进入传送点
function x400800_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400800_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400800_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400800_OnLeaveArea( sceneId, selfId )
	return
end
