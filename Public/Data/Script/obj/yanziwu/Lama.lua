-- 402260
-- ÇØ¼ÒÕ¯Ç×±ø

x402260_g_KillMonsCount_Qincheng = 20
x402260_g_KillMonsCount_Qinjia 	 = 21
x402260_g_KillMonsCount_Lama		 = 22

function x402260_OnDie( sceneId, selfId, killerId )
	local nCount = LuaFnGetCopySceneData_Param(sceneId, x402260_g_KillMonsCount_Lama)
	if nCount<0  then
		nCount = 0
	end
	LuaFnSetCopySceneData_Param(sceneId, x402260_g_KillMonsCount_Lama, nCount+1)
end
