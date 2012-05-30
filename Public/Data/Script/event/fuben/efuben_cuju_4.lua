x402045_g_KillNum = 30

--**********************************
-- 足球死亡
--**********************************
function x402045_OnDie(sceneId, objId, killerId)
	
	local szName = GetName(sceneId, objId)

	if szName == "双双燕"  or
			szName == "鸳鸯拐"  or
			szName == "云外飘"  or
			szName == "满天星"  or
			
			szName == "双双燕燕"  or
			szName == "鸳鸯拐拐"  or
			szName == "云外飘飘"     then
			
		local nKillNum = LuaFnGetCopySceneData_Param(sceneId, x402045_g_KillNum)
		nKillNum = nKillNum + 1
		local str = "已杀死足球：" .. tostring(nKillNum) .. "/149"
		x402045_TipAllHuman(sceneId, str)
		LuaFnSetCopySceneData_Param(sceneId, x402045_g_KillNum, nKillNum)
	end
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402045_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

