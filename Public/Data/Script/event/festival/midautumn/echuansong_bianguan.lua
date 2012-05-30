-- 中秋任务副本回敦煌的传送点

x050011_g_ScriptId = 050011
x050011_g_ControlScript = 050010

-- 玩家进入传送点
function x050011_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x050011_g_ControlScript, "Exit", sceneId, selfId )
end

-- 玩家停留在传送点
function x050011_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x050011_OnLeaveArea( sceneId, selfId )
	return
end
