--BOSS春晚 05号节目

--飞天猫-健康歌


--脚本号
x050035_g_scriptId = 050035

--春晚主控脚本脚本号....
x050035_g_MainScriptId = 050030

--本节目的节目号....
x050035_g_ChapterId = 5

--动作播放表....
x050035_g_ActionTbl = {

	[49] = { [100]=453 },

	[19] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[20] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[21] = { [200]=453,[300]=453,[400]=1,[500]=1,[600]=2,[700]=2,[800]=461,[900]=463           },
	[22] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },
	[23] = {                     [400]=1,[500]=1,[600]=2,[700]=2,                    [1100]=24 },

}

--**********************************
--开始本节目....
--**********************************
function x050035_OnStartThisChapter( sceneId )

	--创建孙美美....
	local MstId = -1
	MstId = CallScriptFunction( x050035_g_MainScriptId, "CreateBossActor", sceneId, "SunMeiMei", 160, 110 )
	SetPatrolId(sceneId, MstId, 49)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050035_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050035_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--孙美美走到此点时....
	if patrolPointIndex == 2 and paopaoIndex == -1 then

		if 0 == CallScriptFunction( x050035_g_MainScriptId, "IsSpecificBossActor", sceneId, "SunMeiMei", objId ) then
			return
		end

		--创建小鹰鹰..小猪猪..飞天猫..小狗狗..小虎虎....
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

		--删除孙美美....
		CallScriptFunction( x050035_g_MainScriptId, "DeleteBossActor", sceneId, "SunMeiMei", objId )

		return

	end


	--删除小鹰鹰..小猪猪..飞天猫..小狗狗..小虎虎....
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
			--本节目结束....
			x050035_OnEndThisChapter( sceneId )
		end

	end

end

--**********************************
--结束本节目....
--**********************************
function x050035_OnEndThisChapter( sceneId )

	CallScriptFunction( x050035_g_MainScriptId, "OnChapterEnd", sceneId, x050035_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
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
