--BOSS春晚 07号节目

--豆豆舞蹈


--脚本号
x050037_g_scriptId = 050037

--春晚主控脚本脚本号....
x050037_g_MainScriptId = 050030

--本节目的节目号....
x050037_g_ChapterId = 7

--动作播放表....
x050037_g_ActionTbl = {

	[50] = {
						[100]=152,[200]=152,[300]=153,[400]=153,
						[900] =154,[1000]=154,[1100]=154,[1200]=154,
						[1300]=129,[1400]=129,[1500]=152,
						[1600]=129,[1700]=129,[1800]=24,
						[1900]=129,[2000]=152,
						[2100]=129,[2200]=152,
						[2300]=155,[2400]=153,[2500]=153,[2600]=155,
						[2800]=152,[2900]=152,[3000]=153,[3100]=153,
						[3200]=155,[3300]=155,
					},

	[51] = {
						[100]=152,[200]=152,[300]=153,[400]=153,
						[500]=155,[600]=155,
					},

	[52] = {
						[100]=152,[200]=152,[300]=153,[400]=153,
						[500]=155,[600]=155,
					},

}

--**********************************
--开始本节目....
--**********************************
function x050037_OnStartThisChapter( sceneId )

	--创建企鹅王A....
	local MstId = -1
	MstId = CallScriptFunction( x050037_g_MainScriptId, "CreateBossActor", sceneId, "QiEWang", 160, 104 )
	SetPatrolId(sceneId, MstId, 50)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050037_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050037_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--企鹅王A走到此点时....
	if patrolPathIndex == 50 and patrolPointIndex == 27 and paopaoIndex == -1 then

		--创建企鹅王B..企鹅王C....
		local MstId = -1
		MstId = CallScriptFunction( x050037_g_MainScriptId, "CreateBossActor", sceneId, "QiEWang", 157, 109 )
		SetPatrolId(sceneId, MstId, 51)
		MstId = CallScriptFunction( x050037_g_MainScriptId, "CreateBossActor", sceneId, "QiEWang", 163, 109 )
		SetPatrolId(sceneId, MstId, 52)
		return

	end

	--删除企鹅王A....
	if patrolPathIndex == 50 and patrolPointIndex == 34 and paopaoIndex == -1 then
		CallScriptFunction( x050037_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		--本节目结束....
		x050037_OnEndThisChapter( sceneId )
		return
	end

	--删除企鹅王B....
	if patrolPathIndex == 51 and patrolPointIndex == 7 and paopaoIndex == -1 then
		CallScriptFunction( x050037_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		return
	end

	--删除企鹅王C....
	if patrolPathIndex == 52 and patrolPointIndex == 7 and paopaoIndex == -1 then
		CallScriptFunction( x050037_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		return
	end

end

--**********************************
--结束本节目....
--**********************************
function x050037_OnEndThisChapter( sceneId )

	CallScriptFunction( x050037_g_MainScriptId, "OnChapterEnd", sceneId, x050037_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050037_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--放烟花....
	if patrolPathIndex == 50 and patrolPointIndex == 23 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 9, 157, 114, 3000 )
		CreateSpecialObjByDataIndex(sceneId, objId, 9, 163, 114, 3000 )
	elseif patrolPathIndex == 50 and patrolPointIndex == 32 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 11, 160, 114, 3000 )
	end

	local pathActData = x050037_g_ActionTbl[patrolPathIndex]
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
