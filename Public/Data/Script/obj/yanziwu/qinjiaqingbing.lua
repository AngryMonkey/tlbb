-- 402258
-- �ؼ�կ�ױ�

x402258_g_KillMonsCount_Qincheng = 20
x402258_g_KillMonsCount_Qinjia 	 = 21
x402258_g_KillMonsCount_Lama		 = 22

function x402258_OnDie( sceneId, selfId, killerId )
	
	-- ֻ�����Ħ������ǰɱ���Ĳż�������

	local nCount = LuaFnGetCopySceneData_Param(sceneId, x402258_g_KillMonsCount_Qinjia)
	if nCount<0  then
		nCount = 0
	end
	LuaFnSetCopySceneData_Param(sceneId, x402258_g_KillMonsCount_Qinjia, nCount+1)
end
