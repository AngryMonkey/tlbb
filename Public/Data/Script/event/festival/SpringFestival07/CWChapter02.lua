--BOSS春晚 02号节目

--歌曲向天再借500年


--脚本号
x050032_g_scriptId = 050032

--春晚主控脚本脚本号....
x050032_g_MainScriptId = 050030

--本节目的节目号....
x050032_g_ChapterId = 2

--动作播放表....
x050032_g_ActionTbl = {

	[8]  = { [100]=24 ,                              [600]=129,           [900]=163,[1000]=24 },
	[9]  = {                     [400]=129,          [600]=129,           [900]=163,[1000]=24 },
	[10] = {                                         [600]=129, [700]=454,[900]=454,[1000]=24 },
	[11] = {                               [500]=129,[600]=129,           [900]=163,[1000]=24 },
	[12] = {           [200]=24 ,                    [600]=129,           [900]=129,[1000]=24 },

}

--**********************************
--开始本节目....
--**********************************
function x050032_OnStartThisChapter( sceneId )

	--创建野猪王..恶霸..远古棋魂..贼兵头目..狂暴龙....
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
--怪物巡逻到某点时回调本接口....
--**********************************
function x050032_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050032_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--是否走到了最后一个巡逻点....
	if patrolPointIndex ~= 11 then
		return
	end

	--删除野猪王..恶霸..远古棋魂..贼兵头目..狂暴龙....
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
		--本节目结束....
		x050032_OnEndThisChapter( sceneId )
	end

end

--**********************************
--结束本节目....
--**********************************
function x050032_OnEndThisChapter( sceneId )

	CallScriptFunction( x050032_g_MainScriptId, "OnChapterEnd", sceneId, x050032_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
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
