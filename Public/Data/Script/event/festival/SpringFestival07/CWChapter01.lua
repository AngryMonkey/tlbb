--BOSS���� 01�Ž�Ŀ

--������������


--�ű���
x050031_g_scriptId = 050031

--�������ؽű��ű���....
x050031_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050031_g_ChapterId = 1

--�������ű�....
x050031_g_ActionTbl = {

	[7] = { [200]=453,[202]=456 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050031_OnStartThisChapter( sceneId )

	--����������....
	local MstId = -1
	MstId = CallScriptFunction( x050031_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 153, 112 )

	--���ÿ���Ѳ��·��....
	SetPatrolId(sceneId, MstId, 7)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050031_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050031_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�ߵ����һ��·����....
	if patrolPointIndex == 5 then
		--����ǲ���������....
		if 1 == CallScriptFunction( x050031_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			--ɾ��������....
			CallScriptFunction( x050031_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
			--����Ŀ����....
			x050031_OnEndThisChapter( sceneId )
		end
		return
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050031_OnEndThisChapter( sceneId )

	CallScriptFunction( x050031_g_MainScriptId, "OnChapterEnd", sceneId, x050031_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050031_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--���̻�....
	if patrolPointIndex == 2 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 39, 159, 116, 0)
	end

	local pathActData = x050031_g_ActionTbl[patrolPathIndex]
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
