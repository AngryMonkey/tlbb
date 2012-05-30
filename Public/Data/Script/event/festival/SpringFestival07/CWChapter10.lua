--BOSS���� 10�Ž�Ŀ

--СƷһ������


--�ű���
x050040_g_scriptId = 050040

--�������ؽű��ű���....
x050040_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050040_g_ChapterId = 10

--�������ű�....
x050040_g_ActionTbl = {

	[31] = { [100]=453 },

	[32] = { [100]=457,[200]=23,[300]=146,[500]=23,[699]=24           },
	[33] = { [200]=459,                                     [300]=459 },

	[34] = { [100]=129,[300]=455 },
	[35] = { [100]=129,[300]=455 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050040_OnStartThisChapter( sceneId )

	--����������....
	local MstId = -1
	MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 31)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050040_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050040_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�������ߵ��˵�ʱ.....
	if patrolPointIndex == 2 and paopaoIndex == -1 then

		if 0 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		--�����������..����ʮ��...
		local MstId = -1
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "ChiXiaoHuoHun", 153, 114, 1 )
		SetPatrolId(sceneId, MstId, 32)
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "Chun30", 163, 114, 1 )
		SetPatrolId(sceneId, MstId, 33)

		--ɾ��������....
		CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )

		return

	end


	--��������ߵ��˵�ʱ������˿֩����..��˿֩����....
	if patrolPointIndex == 3 and paopaoIndex == 0 then

		if 0 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChiXiaoHuoHun", objId ) then
			return
		end

		local MstId = -1
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "ChanSiZhiZhu", 164, 115, 1 )
		SetPatrolId(sceneId, MstId, 34)
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "DuSiZhiZhu", 164, 118, 1 )
		SetPatrolId(sceneId, MstId, 35)
		return

	end


	--ɾ���������....
	if patrolPointIndex == 8 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChiXiaoHuoHun", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "ChiXiaoHuoHun", objId )
		end
	end

	--ɾ������ʮ��....
	if patrolPointIndex == 4 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "Chun30", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "Chun30", objId )
			--����Ŀ����....
			x050040_OnEndThisChapter( sceneId )
		end
	end

	--ɾ����˿֩����..��˿֩����....
	if patrolPointIndex == 5 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuSiZhiZhu", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "DuSiZhiZhu", objId )
		elseif 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChanSiZhiZhu", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "ChanSiZhiZhu", objId )
		end
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050040_OnEndThisChapter( sceneId )

	CallScriptFunction( x050040_g_MainScriptId, "OnChapterEnd", sceneId, x050040_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050040_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--���̻�....
	if patrolPathIndex == 32 and patrolPointIndex == 2 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 5, 159, 116, 0)
	end

	local pathActData = x050040_g_ActionTbl[patrolPathIndex]
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
