-- 大理擂台副本传送点

x400917_g_ScriptId = 400917
x400917_g_ChallengeScriptId = 806014

-- 玩家进入传送点
function x400917_OnEnterArea( sceneId, selfId )
	CallScriptFunction(x400917_g_ChallengeScriptId, "LeaveScene", sceneId, selfId )
end

-- 玩家停留在传送点
function x400917_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x400917_OnLeaveArea( sceneId, selfId )
	return
end
