--BOSS春晚 03号节目

--歌曲保卫三连环


--脚本号
x050033_g_scriptId = 050033

--春晚主控脚本脚本号....
x050033_g_MainScriptId = 050030

--本节目的节目号....
x050033_g_ChapterId = 3

--动作播放表....
x050033_g_ActionTbl = {

	[48] = { [100]=453 },

	[13] = { [100]=129,                    [600]=129,[700]=450,          [900]=450 },
	[14] = {           [200]=129,          [600]=129,                    [900]=450 },
	[15] = {                     [300]=129,[600]=129,          [800]=461,[900]=461 },

}

--**********************************
--开始本节目....
--**********************************
function x050033_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050033_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 48)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050033_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050033_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--孙美美走到此点时....
	if patrolPointIndex == 2 and paopaoIndex == -1 then

		if 0 == CallScriptFunction( x050033_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		--创建余毒..红熊王..葛荣....
		local MstId = -1
		MstId = CallScriptFunction( x050033_g_MainScriptId, "CreateBossActor", sceneId, "YuDu", 157, 106, 1 )
		SetPatrolId(sceneId, MstId, 13)
		MstId = CallScriptFunction( x050033_g_MainScriptId, "CreateBossActor", sceneId, "HongXiongWang", 160, 106, 1 )
		SetPatrolId(sceneId, MstId, 14)
		MstId = CallScriptFunction( x050033_g_MainScriptId, "CreateBossActor", sceneId, "GeRong", 163, 106, 1 )
		SetPatrolId(sceneId, MstId, 15)

		--删除孙美美....
		CallScriptFunction( x050033_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )

		return

	end


	--删除余毒..红熊王..葛荣....
	if patrolPointIndex == 10 and paopaoIndex == -1 then

		if 1 == CallScriptFunction( x050033_g_MainScriptId, "IsSpecificBossActor", sceneId, "YuDu", objId ) then
			CallScriptFunction( x050033_g_MainScriptId, "DeleteBossActor", sceneId, "YuDu", objId )
		elseif 1 == CallScriptFunction( x050033_g_MainScriptId, "IsSpecificBossActor", sceneId, "HongXiongWang", objId ) then
			CallScriptFunction( x050033_g_MainScriptId, "DeleteBossActor", sceneId, "HongXiongWang", objId )
		elseif 1 == CallScriptFunction( x050033_g_MainScriptId, "IsSpecificBossActor", sceneId, "GeRong", objId ) then
			CallScriptFunction( x050033_g_MainScriptId, "DeleteBossActor", sceneId, "GeRong", objId )
			--本节目结束....
			x050033_OnEndThisChapter( sceneId )
		end

	end

end

--**********************************
--结束本节目....
--**********************************
function x050033_OnEndThisChapter( sceneId )

	CallScriptFunction( x050033_g_MainScriptId, "OnChapterEnd", sceneId, x050033_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050033_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050033_g_ActionTbl[patrolPathIndex]
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
