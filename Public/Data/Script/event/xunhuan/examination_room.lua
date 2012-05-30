-- 单人副本

-- 科举活动，考场
--MisDescBegin
-- 脚本号
x801018_g_ScriptId = 801018

--任务号
x801018_g_MissionId = 1220

--任务目标npc
x801018_g_Name = "不知道"

--任务归类
x801018_g_MissionKind = 6


--任务等级
x801018_g_MissionLevel = 10000

--是否是精英任务
x801018_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x801018_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号
--任务文本描述
x801018_g_TransScript = 400900
x801018_g_MissionName = "考场"
x801018_g_MissionInfo = "打败所有的考场护卫即可获得胜利。"		--任务描述
x801018_g_MissionTarget = "打败所有的考场护卫即可获得胜利。"	--任务目标
x801018_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x801018_g_MissionComplete = "    干得不错，甚好甚好。"						--完成任务npc说话的话
x801018_g_MissionRound = 38

--MisDescEnd

x801018_g_Pos = {{x=10,z=11},{x=31,z=13},{x=52,z=11},
								 {x=31,z=27},{x=14,z=34},{x=48,z=34},
								 {x=31,z=40},{x=14,z=49},{x=31,z=45},
								 {x=50,z=49}}

--副本名称
x801018_g_CopySceneName = "考场"
x801018_g_CopySceneType = FUBEN_KAOCHANG	--副本类型，定义在ScriptGlobal.lua里面
x801018_g_CopySceneMap = "kaochang.nav"
x801018_g_LimitMembers = 1					--可以进副本的最小队伍人数
x801018_g_TickTime = 5							--回调脚本的时钟时间（单位：秒/次）
x801018_g_LimitTotalHoldTime = 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x801018_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x801018_g_CloseTick = 6							--副本关闭前倒计时（单位：次数）
x801018_g_NoUserTime = 300					--副本中没有人后可以继续保存的时间（单位：秒）
x801018_g_DeadTrans = 0							--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
--x801018_g_Fuben_X = 50							--进入副本的位置X
--x801018_g_Fuben_Z = 10							--进入副本的位置Z
x801018_g_Back_X = 47								--源场景位置X
x801018_g_Back_Z = 92								--源场景位置Z
x801018_g_NeedMonsterGroupID = 1		--Boss 的组号
x801018_g_TotalNeedKillBoss = 5			--需要杀死Boss数量

x801018_g_TargetNPC = "考场护卫"
x801018_g_Param_sceneid = 2
x801018_g_Param_nPosRandom = 3

--**********************************
--任务入口函数
--**********************************
function x801018_OnDefaultEvent( sceneId, selfId )	--点击该任务后执行此脚本

--	if GetName( sceneId, targetId ) ~= x801018_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end
	local targetId = GetMissionData(sceneId,selfId,MD_EXAM_TARGETID)
	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x801018_g_MissionId ) > 0 then
		x801018_MakeCopyScene( sceneId, selfId )
		--发送任务需求的信息
--		BeginEvent( sceneId )
--			AddText( sceneId, x801018_g_MissionName )
--			AddText( sceneId, x801018_g_ContinueInfo )
--		EndEvent( )
--		local bDone = x801018_CheckSubmit( sceneId, selfId )
--		DispatchMissionDemandInfo( sceneId, selfId, targetId, x801018_g_ScriptId, x801018_g_MissionId, bDone )
	--满足任务接收条件
	elseif x801018_CheckAccept( sceneId, selfId ) > 0 then
		x801018_OnAccept( sceneId, selfId, targetId )
	end
	
end

--**********************************
--列举事件
--**********************************
function x801018_OnEnumerate( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x801018_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end
   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x801018_g_MissionId ) > 0 then
		AddNumText( sceneId, x801018_g_ScriptId, x801018_g_MissionName, 4,-1 )
	end
end

--**********************************
--接受
--**********************************
function x801018_OnAccept( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x801018_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x801018_g_MissionId, x801018_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x801018_g_MissionId ) <= 0 then
		return
	end

	-- 随机出玩家的落脚点
	local nPos  = random( getn(x801018_g_Pos) )

	local misIndex = GetMissionIndexByID(sceneId,selfId,x801018_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, x801018_g_Param_nPosRandom, nPos)

	--显示内容告诉玩家已经接受了任务
	local missionInfo = "    打败所有的考场护卫即可获得胜利。"

	BeginEvent( sceneId )
		AddText( sceneId, "你接受了任务：" .. x801018_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	x801018_MakeCopyScene( sceneId, selfId )
end

--**********************************
--检测接受条件
--**********************************
function x801018_CheckAccept( sceneId, selfId )
--	local ret = CallScriptFunction( x801018_g_MilitaryScript, "CheckAccept", sceneId, selfId )
--	return ret
	--怎么检测？？
	return 1
end

--**********************************
--检测是否可以提交
--**********************************
function x801018_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, x801018_g_IsMissionOkFail) >0  then
		return 1
	end 
	return 0
end

--**********************************
--放弃任务
--**********************************
function x801018_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	local misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x801018_g_Param_sceneid )

--	if IsHaveMission( sceneId, selfId, x801018_g_UpMissionId ) > 0 then				--父任务设置成失败
--		misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_UpMissionId )
--		SetMissionByIndex( sceneId, selfId, misIndex, x801018_g_IsMissionOkFail, 2 )
--		ResetMissionEvent( sceneId, selfId, x801018_g_UpMissionId, 4 )
--	end

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x801018_g_MissionId )

	if sceneId == copyscene then											--如果在副本里删除任务，则直接传送回
		x801018_NotifyFailTips( sceneId, selfId, "任务失败！" )
	end
	--怎么删除任务？？
end

--**********************************
--杀死怪物或玩家
--**********************************
function x801018_OnKillObject( sceneId, selfId, objdataId ,objId )

	-- 使用任务中记录的来判断是不是杀对了人
	if IsHaveMission( sceneId, selfId, x801018_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_MissionId )

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x801018_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	local monsterName = GetName(sceneId, objId)
	
	if monsterName ~= x801018_g_TargetNPC   then
		return
	end
	
	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 6 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 6, monstercount )						--剩余考场护卫的数量

	local strText

	if monstercount > 0 then
		strText = format( "剩余 %d 名考场护卫", monstercount )
		x801018_NotifyFailTips( sceneId, selfId, strText )
	else
		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		SetMissionData(sceneId,selfId,MD_EXAM_FLAG,1)
		
		strText = format( "任务完成，将在 %d 秒后传送到入口位置", x801018_g_CloseTick * x801018_g_TickTime )
		x801018_NotifyFailTips( sceneId, selfId, strText )

--		if IsHaveMission( sceneId, selfId, x801018_g_UpMissionId ) > 0 then				--父任务设置新阶段
--			misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_UpMissionId )
--			SetMissionByIndex( sceneId, selfId, misIndex, 2, 4 )
--		end

		--删除玩家任务列表中对应的任务
		DelMission( sceneId, selfId, x801018_g_MissionId )
	end
end

--**********************************
--继续
--**********************************
function x801018_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x801018_g_MissionName )
		AddText( sceneId, x801018_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x801018_g_ScriptId, x801018_g_MissionId )
end

--**********************************
--提交
--**********************************
function x801018_OnSubmit( sceneId, selfId, targetId, selectRadioId )
--	if GetName( sceneId, targetId ) ~= x801018_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end

	if x801018_CheckSubmit( sceneId, selfId ) == 1 then
		-- 删除这个任务
	  DelMission( sceneId, selfId, x801018_g_MissionId )
	end
end



--**********************************
--玩家同意进入副本
--**********************************
function x801018_AcceptEnterCopyScene( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x801018_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x801018_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x801018_g_Param_sceneid )
--		local teamid = GetTeamId( sceneId, selfId )

		if copysceneid >= 0 then						--进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				local nPos = GetMissionParam(sceneId, selfId, misIndex, x801018_g_Param_nPosRandom)
		
				if nPos < 1 or nPos > 10 then
					nPos = 1
				end
				local go_Fuben_X = x801018_g_Pos[nPos].x
				local go_Fuben_Z = x801018_g_Pos[nPos].z

				NewWorld( sceneId, selfId, copysceneid, go_Fuben_X, go_Fuben_Z )
			else		-- 只要在里面没有完成，就算失败，需要重做
				x801018_NotifyFailTips( sceneId, selfId, "任务失败，请放弃重新接取" )
			end
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x801018_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x801018_g_Param_sceneid, -1 )		--将任务的第3号数据设置为-1, 用于保存副本的场景号
		--SetMissionByIndex( sceneId, selfId, misIndex, x801018_g_Param_teamid, teamid )	--将任务的第4号数据队伍号
		x801018_MakeCopyScene( sceneId, selfId )
	end

end

function x801018_MakeCopyScene( sceneId, selfId )

	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x801018_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x801018_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x801018_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x801018_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x801018_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置副本场景号
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置进入副本的随机位置
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, x801018_g_TotalNeedKillBoss )	--需要杀死的护卫数量
	
	local x, z = LuaFnGetWorldPos( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 7, x )							--玩家出来时候的位置
	LuaFnSetCopySceneData_Param( sceneId, 8, z )							--玩家出来时候的位置
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Monster( sceneId, "kaochang_monster_" .. tostring(iniLevel) .. ".ini" )
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	
	if bRetSceneID > 0 then
		x801018_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x801018_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end
end

--**********************************
--副本事件
--**********************************
function x801018_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x801018_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x801018_g_MissionId )

		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x801018_g_Param_sceneid, destsceneId )
		
		-- 获得进入副本的位置
		local misIndex = GetMissionIndexByID(sceneId,leaderObjId,x801018_g_MissionId)
		local nPos = GetMissionParam(sceneId, leaderObjId, misIndex, x801018_g_Param_nPosRandom)
		
		if nPos < 1 or nPos > 10 then
			nPos = 1
		end
		local go_Fuben_X = x801018_g_Pos[nPos].x
		local go_Fuben_Z = x801018_g_Pos[nPos].z
		
		NewWorld( sceneId, leaderObjId, destsceneId, go_Fuben_X, go_Fuben_Z )

	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x801018_OnPlayerEnter( sceneId, selfId )
--	LuaFnSetCopySceneData_Param( sceneId, 8, LuaFnGetCopySceneData_Param( sceneId, 8 ) + 1 )
	local x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local z = LuaFnGetCopySceneData_Param( sceneId, 8 )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 2, x, z );

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x801018_OnHumanDie( sceneId, selfId, killerId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )

	-- 任务人死亡，任务失败，游戏结束
	if leaderguid == LuaFnGetGUID( sceneId, selfId ) then
--		x801018_OnAbandon( sceneId, selfId )
		local	oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, 3 )
		x801018_BackToCity( sceneId, selfId )
	end
end

function x801018_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 回城
--**********************************
function x801018_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取得副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local z = LuaFnGetCopySceneData_Param( sceneId, 8 )
	CallScriptFunction( x801018_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x801018_OnCopySceneTimer( sceneId, nowTime )
local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			--找到Boss
			monsterId		= GetMonsterObjID( sceneId, i )
--			if GetMonsterGroupID( sceneId, monsterId ) == x600042_g_BossGroupId then
--				SetCharacterName( sceneId, monsterId, BossName )
--			end
		end
		
		
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新的定时器调用次数

	-- 将Monster改名
	if TickCount == 1 then
		local monsterId
		for i = 0, monstercount - 1 do
			monsterId		= GetMonsterObjID( sceneId, i )
			SetCharacterName( sceneId, monsterId, x801018_g_TargetNPC )
		end
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x801018_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x801018_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x801018_g_CloseTick - leaveTickCount ) * x801018_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x801018_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x801018_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  		x801018_BackToCity(sceneId,mems[i])
		end
	end
end
