--BOSS春晚 04号节目

--广告方便面


--脚本号
x050034_g_scriptId = 050034

--春晚主控脚本脚本号....
x050034_g_MainScriptId = 050030

--本节目的节目号....
x050034_g_ChapterId = 4

--动作播放表....
x050034_g_ActionTbl = {

	[17] = { [100]=460,[200]=1 },

}

--**********************************
--开始本节目....
--**********************************
function x050034_OnStartThisChapter( sceneId )

	--孙美美喊话....
	local msg = "#P[春晚主持人-孙美美]：#Y下面插播广告！赞助商：胡繁。"
	MonsterTalk(sceneId, -1, "洛阳", msg )

	--创建段誉..慕容复..王语嫣....
	local MstId = -1
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "DuanYu", 163, 111, 1 )
	SetPatrolId(sceneId, MstId, 16)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "MuRongFu", 160, 112, 1 )
	SetPatrolId(sceneId, MstId, 17)
	MstId = CallScriptFunction( x050034_g_MainScriptId, "CreateBossActor", sceneId, "WangYuYan", 164, 111, 1 )
	SetPatrolId(sceneId, MstId, 18)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050034_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--是否走到了最后一个巡逻点....
	if patrolPointIndex ~= 3 then
		return
	end

	--删除段誉..慕容复..王语嫣....
	if 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "DuanYu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "DuanYu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "MuRongFu", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "MuRongFu", objId )
	elseif 1 == CallScriptFunction( x050034_g_MainScriptId, "IsSpecificBossActor", sceneId, "WangYuYan", objId ) then
		CallScriptFunction( x050034_g_MainScriptId, "DeleteBossActor", sceneId, "WangYuYan", objId )
		--本节目结束....
		x050034_OnEndThisChapter( sceneId )
	end

end

--**********************************
--结束本节目....
--**********************************
function x050034_OnEndThisChapter( sceneId )

	CallScriptFunction( x050034_g_MainScriptId, "OnChapterEnd", sceneId, x050034_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050034_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050034_g_ActionTbl[patrolPathIndex]
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
