--BOSS���� 02�Ž�Ŀ

--���������ٽ�500��


--�ű���
x050032_g_scriptId = 050032

--�������ؽű��ű���....
x050032_g_MainScriptId = 050030

--����Ŀ�Ľ�Ŀ��....
x050032_g_ChapterId = 2

--�������ű�....
x050032_g_ActionTbl = {

	[8]  = { [100]=24 ,                              [600]=129,           [900]=163,[1000]=24 },
	[9]  = {                     [400]=129,          [600]=129,           [900]=163,[1000]=24 },
	[10] = {                                         [600]=129, [700]=454,[900]=454,[1000]=24 },
	[11] = {                               [500]=129,[600]=129,           [900]=163,[1000]=24 },
	[12] = {           [200]=24 ,                    [600]=129,           [900]=129,[1000]=24 },

}

--**********************************
--��ʼ����Ŀ....
--**********************************
function x050032_OnStartThisChapter( sceneId )

	--����Ұ����..���..Զ�����..����ͷĿ..����....
	local MstId = -1
	MstId = CallScriptFunction( x050032_g_MainScriptId, "CreateBossActor", sceneId, "YeZhuWang", 156, 106, 1 )
	SetPatrolId(sceneId, MstId, 8)
	MstId = CallScriptFunction( x050032_g_MainScriptId, "CreateBossActor", sceneId, "EBa", 158, 106, 1 )
	SetPatrolId(sceneId, MstId, 9)
	MstId = CallScriptFunction( x050032_g_MainScriptId, "CreateBossActor", sceneId, "QiHun", 160, 106, 1 )
	SetPatrolId(sceneId, MstId, 10)
	MstId = CallScriptFunction( x050032_g_MainScriptId, "CreateBossActor", sceneId, "ZeiBingTouMu", 162, 106, 1 )
	SetPatrolId(sceneId, MstId, 11)
	MstId = CallScriptFunction( x050032_g_MainScriptId, "CreateBossActor", sceneId, "KuangBaoLong", 164, 106, 1 )
	SetPatrolId(sceneId, MstId, 12)

end

--**********************************
--����Ѳ�ߵ�ĳ��ʱ�ص����ӿ�....
--**********************************
function x050032_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--����������������˶����򲥷Ŷ���....
	x050032_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--�Ƿ��ߵ������һ��Ѳ�ߵ�....
	if patrolPointIndex ~= 11 then
		return
	end

	--ɾ��Ұ����..���..Զ�����..����ͷĿ..����....
	if 1 == CallScriptFunction( x050032_g_MainScriptId, "IsSpecificBossActor", sceneId, "YeZhuWang", objId ) then
		CallScriptFunction( x050032_g_MainScriptId, "DeleteBossActor", sceneId, "YeZhuWang", objId )
	elseif 1 == CallScriptFunction( x050032_g_MainScriptId, "IsSpecificBossActor", sceneId, "EBa", objId ) then
		CallScriptFunction( x050032_g_MainScriptId, "DeleteBossActor", sceneId, "EBa", objId )
	elseif 1 == CallScriptFunction( x050032_g_MainScriptId, "IsSpecificBossActor", sceneId, "QiHun", objId ) then
		CallScriptFunction( x050032_g_MainScriptId, "DeleteBossActor", sceneId, "QiHun", objId )
	elseif 1 == CallScriptFunction( x050032_g_MainScriptId, "IsSpecificBossActor", sceneId, "ZeiBingTouMu", objId ) then
		CallScriptFunction( x050032_g_MainScriptId, "DeleteBossActor", sceneId, "ZeiBingTouMu", objId )
	elseif 1 == CallScriptFunction( x050032_g_MainScriptId, "IsSpecificBossActor", sceneId, "KuangBaoLong", objId ) then
		CallScriptFunction( x050032_g_MainScriptId, "DeleteBossActor", sceneId, "KuangBaoLong", objId )
		--����Ŀ����....
		x050032_OnEndThisChapter( sceneId )
	end

end

--**********************************
--��������Ŀ....
--**********************************
function x050032_OnEndThisChapter( sceneId )

	CallScriptFunction( x050032_g_MainScriptId, "OnChapterEnd", sceneId, x050032_g_ChapterId )

end

--**********************************
--���Ŷ�������ĳ������....
--**********************************
function x050032_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050032_g_ActionTbl[patrolPathIndex]
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
