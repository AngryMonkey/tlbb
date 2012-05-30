--副本任务
--指点本派弟子

--************************************************************************
--MisDescBegin

--脚本号
x600037_g_ScriptId = 600037

--任务号
x600037_g_MissionId = 1112

--父任务号
x600037_g_UpMissionId = 1111

--任务等级
x600037_g_MissionLevel = 10000

--任务归类
x600037_g_MissionKind = 50

--是否是精英任务
x600037_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x600037_g_IsMissionOkFail			=0	--0 任务完成标记[值不能变]
x600037_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置[值不能变]
x600037_g_MissionParam_KillNumber	=2	--2 需要消灭的怪物数量
x600037_g_Param_sceneid				=3	--3号：当前副本任务的场景号
x600037_g_Param_killcount			=4	--4号：杀死任务怪的数量
--6号：未用
--7号：未用

--**********************************以上是动态****************************

--任务文本描述
x600037_g_MissionName = "与人出头"
x600037_g_MissionInfo = ""													--任务描述
x600037_g_MissionTarget = "    赶走滋事者。"								--任务目标

x600037_g_Parameter_Kill_CountRandom = { { id = 300470, numNeeded = 2, numKilled = 4 } }

-- 通用城市任务脚本
x600037_g_CityMissionScript = 600001
x600037_g_ConstructionScript = 600035
x600037_g_TransScript = 400900

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600037_g_CopySceneName = "市集"

x600037_g_CopySceneType = FUBEN_SHIJI2	--副本类型，定义在ScriptGlobal.lua里面

x600037_g_CopySceneMap = "shiji_2.nav"
x600037_g_Exit = "shiji_2_area.ini"
x600037_g_LimitMembers = 1				--可以进副本的最小队伍人数
x600037_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x600037_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x600037_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x600037_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x600037_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x600037_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x600037_g_MonsterCount = 10				--弟子数量
x600037_g_Fuben_X = 43					--进入副本的位置X
x600037_g_Fuben_Z = 45					--进入副本的位置Z

x600037_g_MonsterGroupId = 1			--普通怪
x600037_g_BossGroupId = 2				--boss怪

--**********************************
--任务入口函数
--**********************************
function x600037_OnDefaultEvent( sceneId, selfId, targetId )
	--只有接了此任务才能走进来。任务完成时会自动删除，也不会走到这里
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then
		x600037_AcceptEnterCopyScene( sceneId, selfId )
	end
end

--**********************************
--列举事件
--**********************************
function x600037_OnEnumerate( sceneId, selfId, targetId )
	TAddText( sceneId, x600037_g_MissionName )
	x600037_AskEnterCopyScene( sceneId, selfId )
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x600037_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "侠女"
	elseif PlayerGender == 1 then
		rank = "少侠"
	else
		rank = "阁下"
	end

	local missionInfo = format( "    借东西倒是不难，不过现在有人要找我麻烦，还请" .. rank .. "替我出头。" )

	TAddText( sceneId, missionInfo )
	TAddNumText( sceneId, x600037_g_ScriptId, "进入市集", 10, 1, x600037_g_ScriptId )
end

--**********************************
--玩家同意进入副本
--**********************************
function x600037_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

		if copysceneid >= 0 then												--进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x600037_g_Fuben_X, x600037_g_Fuben_Z )
				return
			end
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_sceneid, -1 )		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		x600037_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600037_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600037_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600037_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600037_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600037_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600037_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, x600037_g_MonsterCount )				--剩余怪物的数量

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

	LuaFnSetSceneLoad_Area( sceneId, x600037_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "shiji_2_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600037_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600037_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end

end

--**********************************
--副本事件
--**********************************
function x600037_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600037_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600037_g_MissionId )

		--将任务的第3号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600037_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600037_g_Fuben_X, x600037_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600037_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600037_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x600037_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600037_g_Param_sceneid )

	if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--父任务设置成失败
		misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_IsMissionOkFail, 2 )
		ResetMissionEvent( sceneId, selfId, x600037_g_UpMissionId, 4 )
	end

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x600037_g_MissionId )

	if sceneId == copyscene then											--如果在副本里删除任务，则直接传送回
		x600037_NotifyFailTips( sceneId, selfId, "任务失败！" )
		x600037_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600037_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取得副本入口场景号
	local x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local z = LuaFnGetCopySceneData_Param( sceneId, 8 )
	CallScriptFunction( x600037_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600037_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600037_g_MissionId ) == 0 then
		return
	end

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_MissionId )

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600037_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	local monstercount = LuaFnGetCopySceneData_Param( sceneId, 6 )
	monstercount = monstercount - 1
	LuaFnSetCopySceneData_Param( sceneId, 6, monstercount )						--剩余弟子的数量
	SetMissionByIndex( sceneId, selfId, misIndex, x600037_g_Param_killcount, x600037_g_MonsterCount - monstercount )	--已杀死的怪物数量，仅供客户端使用

	local strText

	if monstercount > 0 then
		strText = format( "剩余 %d 名滋事者", monstercount )
		x600037_NotifyFailTips( sceneId, selfId, strText )
	else
		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "任务完成，将在 %d 秒后传送到入口位置", x600037_g_CloseTick * x600037_g_TickTime )
		x600037_NotifyFailTips( sceneId, selfId, strText )

		if IsHaveMission( sceneId, selfId, x600037_g_UpMissionId ) > 0 then				--父任务设置新阶段
			misIndex = GetMissionIndexByID( sceneId, selfId, x600037_g_UpMissionId )
			SetMissionByIndex( sceneId, selfId, misIndex, 2, 4 )
		end

		--删除玩家任务列表中对应的任务
		DelMission( sceneId, selfId, x600037_g_MissionId )
	end
end

--**********************************
--进入区域事件
--**********************************
function x600037_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600037_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600037_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新的定时器调用次数

	-- 将 Boss 加强
	if TickCount == 1 then
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			-- 找到 Boss = monsterId
			monsterId = GetMonsterObjID( sceneId, i )
			local GroupID = GetMonsterGroupID( sceneId, monsterId )
			if GroupID == x600037_g_BossGroupId then
				local maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
				maxHP = floor( maxHP * 0.3 )
				maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
				LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
				RestoreHp( sceneId, monsterId )
				break
			end
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

		if leaveTickCount >= x600037_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x600037_g_CloseTick - leaveTickCount ) * x600037_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600037_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600037_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
