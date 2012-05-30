-- 城市任务副本回城市的传送点

x400808_g_ScriptId			= 400808
x400808_g_ControlScript	= 600042

-- 玩家进入传送点
function x400808_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x400808_g_ControlScript, "BackToCity", sceneId, selfId )
end

-- 玩家停留在传送点
function x400808_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400808_OnLeaveArea( sceneId, selfId )
	return
end
