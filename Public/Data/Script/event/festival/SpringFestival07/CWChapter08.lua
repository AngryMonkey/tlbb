--BOSS春晚 08号节目

--歌曲双节棍


--脚本号
x050038_g_scriptId = 050038

--春晚主控脚本脚本号....
x050038_g_MainScriptId = 050030

--本节目的节目号....
x050038_g_ChapterId = 8

--动作播放表....
x050038_g_ActionTbl = {

	[29] = {
						[200]=458,[201]=458,[202]=458,
						[400]=457,[401]=457,[402]=457,
						[600]=456,[601]=456,[602]=456,
						[800]=456,[801]=457,[802]=458,
					}

}

--**********************************
--开始本节目....
--**********************************
function x050038_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050038_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 36)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050038_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050038_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--孙美美走到此点时....
	if patrolPointIndex == 2 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050038_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			--创建段延庆....
			local MstId = -1 
			MstId = CallScriptFunction( x050038_g_MainScriptId, "CreateBossActor", sceneId, "DuanYanQing", 160, 108, 1 )
			SetPatrolId(sceneId, MstId, 29)
			--删除孙美美....
			CallScriptFunction( x050038_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )
		end
		return
	end

	--删除段延庆....
	if patrolPointIndex == 9 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050038_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuanYanQing", objId ) then
			CallScriptFunction( x050038_g_MainScriptId, "DeleteBossActor", sceneId, "DuanYanQing", objId )
			--本节目结束....
			x050038_OnEndThisChapter( sceneId )
		end
	end

end

--**********************************
--结束本节目....
--**********************************
function x050038_OnEndThisChapter( sceneId )

	CallScriptFunction( x050038_g_MainScriptId, "OnChapterEnd", sceneId, x050038_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050038_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--放烟花....
	if patrolPointIndex == 2 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 9, 162, 115, 0)
		CreateSpecialObjByDataIndex(sceneId, objId, 9, 158, 115, 0)
	elseif patrolPointIndex == 4 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 6, 157, 115, 0)
		--CreateSpecialObjByDataIndex(sceneId, objId, 10, 160, 116, 0)
	elseif patrolPointIndex == 6 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 6, 163, 115, 0)
		--CreateSpecialObjByDataIndex(sceneId, objId, 12, 160, 116, 0)
	elseif patrolPointIndex == 8 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 43, 160, 116, 0)
	end

	local pathActData = x050038_g_ActionTbl[patrolPathIndex]
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
