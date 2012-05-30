--BOSS���� 06�Ž�Ŀ

--СƷ�򶹶�


--�ű���
x050036_g_scriptId = 050036

--�������ؽű��ű���....
x050036_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050036_g_ChapterId = 6

--�������ű�....
x050036_g_ActionTbl = {

	[24] = { [1401]=23 },

	[25] = { [200]=458 },
	[26] = { [200]=456 },
	[27] = { [200]=457 },
	[28] = { [300]=24  },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050036_OnStartThisChapter( sceneId )

	--����������....
	local MstId = -1
	MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 109 )
	SetPatrolId(sceneId, MstId, 24)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050036_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050036_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�������ߵ��˵�ʱ����ľͰ��..�׵�..�콭��..�����....
	if patrolPointIndex == 4 and paopaoIndex == 0 then

		if 0 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		local MstId = -1
		MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "MuTongBo", 155, 107, 1 )
		SetPatrolId(sceneId, MstId, 25)
		MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "BaiDi", 158, 107, 1 )
		SetPatrolId(sceneId, MstId, 26)
		MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "HunJiangLong", 161, 107, 1 )
		SetPatrolId(sceneId, MstId, 27)
		MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "QiEWang", 164, 107, 1 )
		SetPatrolId(sceneId, MstId, 28)
		return

	end


	--ɾ��������....
	if patrolPointIndex == 16 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
		end
		--����Ŀ����....
		x050036_OnEndThisChapter( sceneId )
	end


	--ɾ��ľͰ��..�׵�..�콭��....
	if patrolPointIndex == 3 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "MuTongBo", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "MuTongBo", objId )
		elseif 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "BaiDi", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "BaiDi", objId )
		elseif 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "HunJiangLong", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "HunJiangLong", objId )
		end
	end

	--ɾ�������....
	if patrolPointIndex == 4 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "QiEWang", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		end
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050036_OnEndThisChapter( sceneId )

	CallScriptFunction( x050036_g_MainScriptId, "OnChapterEnd", sceneId, x050036_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050036_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050036_g_ActionTbl[patrolPathIndex]
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
