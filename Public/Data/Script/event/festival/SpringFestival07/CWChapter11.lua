--BOSS���� 11�Ž�Ŀ

--������


--�ű���
x050041_g_scriptId = 050041

--�������ؽű��ű���....
x050041_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050041_g_ChapterId = 11

--�������ű�....
x050041_g_ActionTbl = {

	[38] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=457 },
	[43] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=454 },
	[44] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=457 },
	[45] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=456 },

	[39] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=459 },
	[40] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=459 },
	[41] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=459 },
	[42] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=463 },
	[46] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=550 },
	[47] = { [200]=129,[400]=24,[500]=457,[600]=24,[700]=457 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050041_OnStartThisChapter( sceneId )

	--����������....
	local MstId = -1
	MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 106 )
	SetPatrolId(sceneId, MstId, 37)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050041_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050041_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�������ߵ��˵�ʱ�����������..���..����..�׵�....
	if patrolPointIndex == 1 and paopaoIndex == 0 then

		if 0 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		local MstId = -1
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "ChiXiaoHuoHun", 161, 107 )
		SetPatrolId(sceneId, MstId, 38)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "QiHun", 158, 107 )
		SetPatrolId(sceneId, MstId, 43)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "KuangBaoLong", 155, 107 )
		SetPatrolId(sceneId, MstId, 44)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "BaiDi", 164, 107 )
		SetPatrolId(sceneId, MstId, 45)
		return

	end


	--�������ߵ��˵�ʱ��������ʮ��..��˿֩����..��˿֩����..�޵з���è..��������..�����....
	if patrolPointIndex == 2 and paopaoIndex == 0 then

		if 0 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		local MstId = -1
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "Chun30", 163, 108 )
		SetPatrolId(sceneId, MstId, 39)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "DuSiZhiZhu", 156, 108 )
		SetPatrolId(sceneId, MstId, 40)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "ChanSiZhiZhu", 154, 108 )
		SetPatrolId(sceneId, MstId, 41)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "FeiTianMao", 161, 108 )
		SetPatrolId(sceneId, MstId, 42)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "HuDaoShenShou", 165, 108 )
		SetPatrolId(sceneId, MstId, 46)
		MstId = CallScriptFunction( x050041_g_MainScriptId, "CreateBossActor", sceneId, "QiEWang", 158, 108 )
		SetPatrolId(sceneId, MstId, 47)
		return

	end


	--ɾ��������....
	if patrolPointIndex == 10 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
			--����Ŀ����....
			x050041_OnEndThisChapter( sceneId )
		end
	end

	--ɾ���������..����ʮ��..��˿֩����..��˿֩����..�޵з���è..���..����..�׵�..��������..�����....
	if patrolPointIndex == 8 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChiXiaoHuoHun", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "ChiXiaoHuoHun", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "Chun30", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "Chun30", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuSiZhiZhu", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "DuSiZhiZhu", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChanSiZhiZhu", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "ChanSiZhiZhu", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "FeiTianMao", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "FeiTianMao", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "QiHun", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "QiHun", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "KuangBaoLong", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "KuangBaoLong", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "BaiDi", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "BaiDi", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "HuDaoShenShou", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "HuDaoShenShou", objId )
		elseif 1 == CallScriptFunction( x050041_g_MainScriptId, "IsSpecificBossActor", sceneId, "QiEWang", objId ) then
			CallScriptFunction( x050041_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		end
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050041_OnEndThisChapter( sceneId )

	CallScriptFunction( x050041_g_MainScriptId, "OnChapterEnd", sceneId, x050041_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050041_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--���̻�....
	if patrolPathIndex == 37 and patrolPointIndex == 3 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 1, 160, 112, 0)
		CreateSpecialObjByDataIndex(sceneId, objId, 10, 160, 112, 0)
	elseif patrolPathIndex == 38 and patrolPointIndex == 8 and paopaoIndex == -1 then
		CreateSpecialObjByDataIndex(sceneId, objId, 13, 160, 109, 0)
		CreateSpecialObjByDataIndex(sceneId, objId, 6, 160, 109, 0)
		CreateSpecialObjByDataIndex(sceneId, objId, 5, 160, 109, 0)
	end

	local pathActData = x050041_g_ActionTbl[patrolPathIndex]
	if pathActData then

		local idx = patrolPointIndex * 100
		if -1 == paopaoIndex then
			idx = idx + 99
		else
			idx = idx + paopaoIndex
		end

		local actId = pathActData[ idx ]
		if actId and actId > 0 then
			MonsterDoAction( sceneId, objId, actId, -1 )
		end

	end

end
