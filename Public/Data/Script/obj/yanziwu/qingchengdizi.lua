-- 402257
-- Çà³ÇÅÉµÜ×Ó

x402257_g_KillMonsCount_Qincheng = 20
x402257_g_KillMonsCount_Qinjia 	 = 21
x402257_g_KillMonsCount_Lama		 = 22

function x402257_OnDie( sceneId, selfId, killerId )
	local nCount = LuaFnGetCopySceneData_Param(sceneId, x402257_g_KillMonsCount_Qincheng)
	if nCount<0  then
		nCount = 0
	end
	LuaFnSetCopySceneData_Param(sceneId, x402257_g_KillMonsCount_Qincheng, nCount+1)
end
