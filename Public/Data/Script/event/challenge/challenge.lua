-- challenge.lua
-- 挑战相关脚本

x806010_g_ScriptId = 806010

-- 判断该玩家是否处在挑战区域
function x806010_HaveChallengeFlag( sceneId, selfId )
	return (GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT ) > 0)
end

-- 让 selfId (及队友) 挑战 targetId (及队友)
function x806010_ProcChallenge( sceneId, selfId, targetId )
	local ChallengeScript = GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT )

	if ChallengeScript ~= GetMissionData( sceneId, targetId, MD_TIAOZHAN_SCRIPT ) then
		return
	end

	-- 调用具体的挑战脚本，每个擂台应该绑定一个脚本
	CallScriptFunction(ChallengeScript, "DoChallenge", sceneId, selfId, targetId )
end
