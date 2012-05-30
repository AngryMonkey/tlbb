-- 洛阳擂台副本传送点

x400916_g_ScriptId = 400916
x400916_g_ChallengeScriptId = 806012

-- 玩家进入传送点
function x400916_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x400916_g_ChallengeScriptId, "LeaveScene", sceneId, selfId )
end

-- 玩家停留在传送点
function x400916_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400916_OnLeaveArea( sceneId, selfId )
	return
end
