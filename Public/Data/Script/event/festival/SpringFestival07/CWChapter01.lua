--BOSS春晚 01号节目

--孙美美春晚开场


--脚本号
x050031_g_scriptId = 050031

--春晚主控脚本脚本号....
x050031_g_MainScriptId = 050030

--本节目的节目号....
x050031_g_ChapterId = 1

--动作播放表....
x050031_g_ActionTbl = {

	[7] = { [200]=453,[202]=456 },

}

--**********************************
--开始本节目....
--**********************************
function x050031_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050031_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 153, 112 )

	--设置开场巡逻路径....
	SetPatrolId(sceneId, MstId, 7)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050031_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050031_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--走到最后一个路径点....
	if patrolPointIndex == 5 then
		--检测是不是孙美美....
		if 1 == CallScriptFunction( x050031_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			--删除孙美美....
			CallScriptFunction( x050031_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
			--本节目结束....
			x050031_OnEndThisChapter( sceneId )
		end
		return
	end

end

--**********************************
--结束本节目....
--**********************************
function x050031_OnEndThisChapter( sceneId )

	CallScriptFunction( x050031_g_MainScriptId, "OnChapterEnd", sceneId, x050031_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050031_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--放烟花....
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
