--BOSS春晚 09号节目

--广告宠粮


--脚本号
x050039_g_scriptId = 050039

--春晚主控脚本脚本号....
x050039_g_MainScriptId = 050030

--本节目的节目号....
x050039_g_ChapterId = 9

--动作播放表....
x050039_g_ActionTbl = {

	[30] = { [100]=451,[200]=550 },

}

--**********************************
--开始本节目....
--**********************************
function x050039_OnStartThisChapter( sceneId )

	--孙美美喊话....
	local msg = "#P[春晚主持人-孙美美]：#Y下面插播广告！赞助商：云霏霏。"
	MonsterTalk(sceneId, -1, "洛阳", msg )

	--创建护岛神兽....
	local MstId = -1
	MstId = CallScriptFunction( x050039_g_MainScriptId, "CreateBossActor", sceneId, "HuDaoShenShou", 160, 109, 1 )
	SetPatrolId(sceneId, MstId, 30)

end

--**********************************
--怪物巡逻到某点时回调本接口....
--**********************************
function x050039_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	--如果动作表中配置了动作则播放动作....
	x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)


	--是否走到了最后一个巡逻点....
	if patrolPointIndex ~= 4 then
		return
	end

	--删除护岛神兽....
	if 1 == CallScriptFunction( x050039_g_MainScriptId, "IsSpecificBossActor", sceneId, "HuDaoShenShou", objId ) then
		CallScriptFunction( x050039_g_MainScriptId, "DeleteBossActor", sceneId, "HuDaoShenShou", objId )
		--本节目结束....
		x050039_OnEndThisChapter( sceneId )
	end

end

--**********************************
--结束本节目....
--**********************************
function x050039_OnEndThisChapter( sceneId )

	CallScriptFunction( x050039_g_MainScriptId, "OnChapterEnd", sceneId, x050039_g_ChapterId )

end

--**********************************
--播放动作表中某个动作....
--**********************************
function x050039_PlayAct( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	local pathActData = x050039_g_ActionTbl[patrolPathIndex]
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
