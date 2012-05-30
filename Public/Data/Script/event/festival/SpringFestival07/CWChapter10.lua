--BOSS春晚 10号节目

--小品一见钟情


--脚本号
x050040_g_scriptId = 050040

--春晚主控脚本脚本号....
x050040_g_MainScriptId = 050030

--本节目的节目号....
x050040_g_ChapterId = 10

--动作播放表....
x050040_g_ActionTbl = {

	[31] = { [100]=453 },

	[32] = { [100]=457,[200]=23,[300]=146,[500]=23,[699]=24           },
	[33] = { [200]=459,                                     [300]=459 },

	[34] = { [100]=129,[300]=455 },
	[35] = { [100]=129,[300]=455 },

}

--**********************************
--开始本节目....
--**********************************
function x050040_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 31)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050040_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050040_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--孙美美走到此点时.....
	if patrolPointIndex == 2 and paopaoIndex == -1 then

		if 0 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		--创建赤霄火魂..春三十娘...
		local MstId = -1
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "ChiXiaoHuoHun", 153, 114, 1 )
		SetPatrolId(sceneId, MstId, 32)
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "Chun30", 163, 114, 1 )
		SetPatrolId(sceneId, MstId, 33)

		--删除孙美美....
		CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )

		return

	end


	--赤霄火魂走到此点时创建毒丝蜘蛛王..缠丝蜘蛛王....
	if patrolPointIndex == 3 and paopaoIndex == 0 then

		if 0 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChiXiaoHuoHun", objId ) then
			return
		end

		local MstId = -1
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "ChanSiZhiZhu", 164, 115, 1 )
		SetPatrolId(sceneId, MstId, 34)
		MstId = CallScriptFunction( x050040_g_MainScriptId, "CreateBossActor", sceneId, "DuSiZhiZhu", 164, 118, 1 )
		SetPatrolId(sceneId, MstId, 35)
		return

	end


	--删除赤霄火魂....
	if patrolPointIndex == 8 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChiXiaoHuoHun", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "ChiXiaoHuoHun", objId )
		end
	end

	--删除春三十娘....
	if patrolPointIndex == 4 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "Chun30", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "Chun30", objId )
			--本节目结束....
			x050040_OnEndThisChapter( sceneId )
		end
	end

	--删除毒丝蜘蛛王..缠丝蜘蛛王....
	if patrolPointIndex == 5 and paopaoIndex == -1 then
		if 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuSiZhiZhu", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "DuSiZhiZhu", objId )
		elseif 1 == CallScriptFunction( x050040_g_MainScriptId, "IsSpecificBossActor", sceneId, "ChanSiZhiZhu", objId ) then
			CallScriptFunction( x050040_g_MainScriptId, "DeleteBossActor", sceneId, "ChanSiZhiZhu", objId )
		end
	end

end

--**********************************
--结束本节目....
--**********************************
function x050040_OnEndThisChapter( sceneId )

	CallScriptFunction( x050040_g_MainScriptId, "OnChapterEnd", sceneId, x050040_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050040_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--放烟花....
	if patrolPathIndex == 32 and patrolPointIndex == 2 and paopaoIndex == 0 then
		CreateSpecialObjByDataIndex(sceneId, objId, 5, 159, 116, 0)
	end

	local pathActData = x050040_g_ActionTbl[patrolPathIndex]
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
