-- 城市任务副本回城市的传送点

x400802_g_ScriptId = 400802
x400802_g_ControlScript = 600014

-- 玩家进入传送点
function x400802_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400802_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400802_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400802_OnLeaveArea( sceneId, selfId )
	return
end
