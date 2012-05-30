--BOSS���� 05�Ž�Ŀ

--����è-������


--�ű���
x050035_g_scriptId = 050035

--�������ؽű��ű���....
x050035_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050035_g_ChapterId = 5

--�������ű�....
x050035_g_ActionTbl = {

	[49] = { [100]=453 },

	[19] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[20] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[21] = { [200]=453,[300]=453,[400]=1,[500]=1,[600]=2,[700]=2,[800]=461,[900]=463           },
	[22] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[23] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050035_OnStartThisChapter( sceneId )

	--����������....
	local MstId = -1
	MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 49)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050035_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050035_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�������ߵ��˵�ʱ....
	if patrolPointIndex == 2 and paopaoIndex == -1 then

		if 0 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		--����Сӥӥ..С����..����è..С����..С����....
		local MstId = -1
		MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "YingYing", 158, 106 )
		SetPatrolId(sceneId, MstId, 19)
		MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "ZhuZhu", 159, 107 )
		SetPatrolId(sceneId, MstId, 20)
		MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "FeiTianMao", 160, 108, 1 )
		SetPatrolId(sceneId, MstId, 21)
		MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "GouGou", 160, 107 )
		SetPatrolId(sceneId, MstId, 22)
		MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "HuHu", 161, 106 )
		SetPatrolId(sceneId, MstId, 23)

		--ɾ��������....
		CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )

		return

	end


	--ɾ��Сӥӥ..С����..����è..С����..С����....
	if patrolPointIndex == 12 and paopaoIndex == -1 then

		if 1 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "YingYing", objId ) then
			CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "YingYing", objId )
		elseif 1 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "ZhuZhu", objId ) then
			CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "ZhuZhu", objId )
		elseif 1 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "FeiTianMao", objId ) then
			CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "FeiTianMao", objId )
		elseif 1 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "GouGou", objId ) then
			CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "GouGou", objId )
		elseif 1 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "HuHu", objId ) then
			CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "HuHu", objId )
			--����Ŀ����....
			x050035_OnEndThisChapter( sceneId )
		end

	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050035_OnEndThisChapter( sceneId )

	CallScriptFunction( x050035_g_MainScriptId, "OnChapterEnd", sceneId, x050035_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050035_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050035_g_ActionTbl[patrolPathIndex]
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
