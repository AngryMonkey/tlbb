--BOSS���� 04�Ž�Ŀ

--��淽����


--�ű���
x050034_g_scriptId = 050034

--�������ؽű��ű���....
x050034_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050034_g_ChapterId = 4

--�������ű�....
x050034_g_ActionTbl = {

	[17] = { [100]=460,[200]=1 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050034_OnStartThisChapter( sceneId )

	--����������....
	local msg = "#P[����������-������]��#Y����岥��棡�����̣�������"
	MonsterTalk(sceneId, -1, "����", msg )

	--��������..Ľ�ݸ�..������....
	local MstId = -1
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "DuanYu", 163, 111, 1 )
	SetPatrolId(sceneId, MstId, 16)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "MuRongFu", 160, 112, 1 )
	SetPatrolId(sceneId, MstId, 17)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "WangYuYan", 164, 111, 1 )
	SetPatrolId(sceneId, MstId, 18)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050034_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�Ƿ��ߵ������һ��Ѳ�ߵ�....
	if patrolPointIndex ~= 3 then
		return
	end

	--ɾ������..Ľ�ݸ�..������....
	if 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuanYu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "DuanYu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "MuRongFu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "MuRongFu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "WangYuYan", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "WangYuYan", objId )
		--����Ŀ����....
		x050034_OnEndThisChapter( sceneId )
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050034_OnEndThisChapter( sceneId )

	CallScriptFunction( x050034_g_MainScriptId, "OnChapterEnd", sceneId, x050034_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050034_g_ActionTbl[patrolPathIndex]
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
