-- 805046
-- ɽ��boss

--����������������
x805046_g_keySD					= {}
x805046_g_keySD["typ"]			= 0		--���ø�������
x805046_g_keySD["spt"]			= 1		--���ø��������¼��ű���
x805046_g_keySD["tim"]			= 2		--���ö�ʱ�����ô���
x805046_g_keySD["currStage"]	= 3		--���ö�ʱ�����ô���
x805046_g_keySD["scn"]			= 4		--���ø�����ڳ�����, ��ʼ��
x805046_g_keySD["cls"]			= 5		--���ø����رձ�־, 0���ţ�1�ر�
x805046_g_keySD["dwn"]			= 6		--�����뿪����ʱ����
x805046_g_keySD["tem"]			= 7		--��������
x805046_g_keySD["x"]			= 8			--��������ڳ����е�xλ��
x805046_g_keySD["z"]			= 9			--��������ڳ����е�zλ��
x805046_g_keySD["killMonsterNum"]	= 10		--ɱ����������
x805046_g_keySD["genMonsterNum"]	= 11			--���ɹ�������
x805046_g_keySD["playerLevel"]	= 12		--��¼��ǰ�����ļ���


--**********************************
-- �Լ�����
--**********************************
function x805046_OnDie( sceneId, selfId, killerId )
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805046_g_keySD["killMonsterNum"] )	
	killNum = killNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805046_g_keySD["killMonsterNum"], killNum )
	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805046_g_keySD["genMonsterNum"] )	
	x805046_TipAllHuman(sceneId, "��ɱ��ɽ��  "..killNum.." / "..genNum )	
end

--**********************************
-- ����
--**********************************
function x805046_OnHeartBeat(sceneId, selfId, nTick)

end

--**********************************
-- ��ʼ��
--**********************************
function x805046_OnInit(sceneId, selfId)
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805046_g_keySD["genMonsterNum"] )	
	genNum = genNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805046_g_keySD["genMonsterNum"], genNum )	
end

--**********************************
-- ɱ�����
--**********************************
function x805046_OnKillCharacter(sceneId, selfId, targetId)

end

--**********************************
-- ����ս��
--**********************************
function x805046_OnEnterCombat(sceneId, selfId, enmeyId)

end

--**********************************
-- ����ս��
--**********************************
function x805046_OnLeaveCombat(sceneId, selfId)

end

--**********************************
--��ʾ���и��������
--**********************************
function x805046_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end
end

--���ѡ��һ�����
function x805046_RandPlayer( sceneId )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ���
	if nHumanNum < 1 then
		return -1
	end
	
	
	local rPlayerIndex = random( nHumanNum )

	local PlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, rPlayerIndex )
	return PlayerId
end
