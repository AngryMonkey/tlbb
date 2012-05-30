-- 擂台的事件区域脚本

x806013_g_ScriptId = 806013
x806013_g_ChallengeScriptId = 806014

-- 玩家进入擂台时设置
function x806013_OnEnterArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, x806013_g_ChallengeScriptId )
	ResetChallengeData( sceneId, selfId )
end

-- 玩家停留在擂台定时触发
function x806013_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开擂台时触发
function x806013_OnLeaveArea( sceneId, selfId )
	SetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT, 0 )
	ResetChallengeData( sceneId, selfId )
end
