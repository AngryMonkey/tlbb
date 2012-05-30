x402045_g_KillNum = 30

--**********************************
-- ��������
--**********************************
function x402045_OnDie(sceneId, objId, killerId)
	
	local szName = GetName(sceneId, objId)

	if szName == "˫˫��"  or
			szName == "ԧ���"  or
			szName == "����Ʈ"  or
			szName == "������"  or
			
			szName == "˫˫����"  or
			szName == "ԧ��չ�"  or
			szName == "����ƮƮ"     then
			
		local nKillNum = LuaFnGetCopySceneData_Param(sceneId, x402045_g_KillNum)
		nKillNum = nKillNum + 1
		local str = "��ɱ������" .. tostring(nKillNum) .. "/149"
		x402045_TipAllHuman(sceneId, str)
		LuaFnSetCopySceneData_Param(sceneId, x402045_g_KillNum, nKillNum)
	end
end

--**********************************
--��ʾ���и��������
--**********************************
function x402045_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	-- û���˵ĳ�����ʲô������
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

