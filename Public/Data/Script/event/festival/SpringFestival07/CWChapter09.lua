--BOSS���� 09�Ž�Ŀ

--������


--�ű���
x050039_g_scriptId = 050039

--�������ؽű��ű���....
x050039_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050039_g_ChapterId = 9

--�������ű�....
x050039_g_ActionTbl = {

	[30] = { [100]=451,[200]=550 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050039_OnStartThisChapter( sceneId )

	--����������....
	local msg = "#P[����������-������]��#Y����岥��棡�����̣���������"
	MonsterTalk(sceneId, -1, "����", msg )

	--������������....
	local MstId = -1
	MstId = CallScriptFunction( x050039_g_MainScriptId, "CreateBossActor", sceneId, "HuDaoShenShou", 160, 109, 1 )
	SetPatrolId(sceneId, MstId, 30)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050039_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�Ƿ��ߵ������һ��Ѳ�ߵ�....
	if patrolPointIndex ~= 4 then
		return
	end

	--ɾ����������....
	if 1 == CallScriptFunction( x050039_g_MainScriptId, "IsSpecificBossActor", sceneId, "HuDaoShenShou", objId ) then
		CallScriptFunction( x050039_g_MainScriptId, "DeleteBossActor", sceneId, "HuDaoShenShou", objId )
		--����Ŀ����....
		x050039_OnEndThisChapter( sceneId )
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050039_OnEndThisChapter( sceneId )

	CallScriptFunction( x050039_g_MainScriptId, "OnChapterEnd", sceneId, x050039_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050039_g_ActionTbl[patrolPathIndex]
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
