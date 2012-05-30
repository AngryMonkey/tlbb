--BOSS春晚 06号节目

--小品打豆豆


--脚本号
x050036_g_scriptId = 050036

--春晚主控脚本脚本号....
x050036_g_MainScriptId = 050030

--本节目的节目号....
x050036_g_ChapterId = 6

--动作播放表....
x050036_g_ActionTbl = {

	[24] = { [1401]=23 },

	[25] = { [200]=458 },
	[26] = { [200]=456 },
	[27] = { [200]=457 },
	[28] = { [300]=24  },

}

--**********************************
--开始本节目....
--**********************************
function x050036_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050036_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 109 )
	SetPatrolId(sceneId, MstId, 24)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050036_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050036_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--孙美美走到此点时创建木桶伯..白帝..混江龙..企鹅王....
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


	--删除孙美美....
	if patrolPointIndex == 16 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
		end
		--本节目结束....
		x050036_OnEndThisChapter( sceneId )
	end


	--删除木桶伯..白帝..混江龙....
	if patrolPointIndex == 3 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "MuTongBo", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "MuTongBo", objId )
		elseif 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "BaiDi", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "BaiDi", objId )
		elseif 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "HunJiangLong", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "HunJiangLong", objId )
		end
	end

	--删除企鹅王....
	if patrolPointIndex == 4 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050036_g_MainScriptId, "IsSpecificBossActor", sceneId, "QiEWang", objId ) then
			CallScriptFunction( x050036_g_MainScriptId, "DeleteBossActor", sceneId, "QiEWang", objId )
		end
	end

end

--**********************************
--结束本节目....
--**********************************
function x050036_OnEndThisChapter( sceneId )

	CallScriptFunction( x050036_g_MainScriptId, "OnChapterEnd", sceneId, x050036_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
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
