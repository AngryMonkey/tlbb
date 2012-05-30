-- 副本任务
-- 就地正法

--************************************************************************
--MisDescBegin

--脚本号
x228903_g_ScriptId = 228903

--任务号
x228903_g_MissionId = 947

-- 前续任务
x228903_g_PreMissionId = 946

-- 目标 NPC
x228903_g_Position_X = 262
x228903_g_Position_Z = 46
x228903_g_SceneID = 18
x228903_g_AccomplishNPC_Name = "种世衡"

--目标NPC
x228903_g_Name = "种世衡"

--任务等级
x228903_g_MissionLevel = 30

--任务归类
x228903_g_MissionKind = 28

--是否是精英任务
x228903_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x228903_g_IsMissionOkFail			=0	--0 任务完成标记
x228903_g_DemandKill				= { { id = 540, num = 1 }, { id = 541, num = 4 } }		--变量第1位
x228903_g_Param_QinNumber			=1	--1 需要杀死秦伯光数量
x228903_g_Param_LubaNumber			=2	--2 需要消灭的秦家寨路霸数量
x228903_g_MonsterList				= { [x228903_g_Param_QinNumber] = { "秦伯光", 1 }, [x228903_g_Param_LubaNumber] = { "秦家寨路霸", 4 } }
x228903_g_Param_sceneid				=3	--3号：当前副本任务的场景号
x228903_g_Param_teamid				=4	--4号：接副本任务时候的队伍号

--**********************************以上是动态****************************

--任务文本描述
x228903_g_MissionName = "就地正法"
x228903_g_MissionInfo = "#{TIANSHAN_SKILL_03}"													--任务描述
x228903_g_MissionTarget = "    #G雁门关#W的#R种世衡#W#{_INFOAIM263,46,18,种世衡}要你在雁门关太守府中杀死秦伯光和四名秦家寨路霸。"		--任务目标
x228903_g_ContinueInfo = "#{TIANSHAN_SKILL_04}"								--未完成任务的npc对话
x228903_g_MissionComplete = "#{TIANSHAN_SKILL_05}"							--完成任务npc说话的话

--任务奖励
x228903_g_MoneyBonus = 1000
x228903_g_exp = 2000

--MisDescEnd
--************************************************************************

x228903_g_TransScript = 400900

--副本名称
x228903_g_CopySceneName = "雁门关太守府"

x228903_g_CopySceneType = FUBEN_YMGTAISHOUFU	--副本类型，定义在ScriptGlobal.lua里面

x228903_g_CopySceneMap = "yamen.nav"
x228903_g_Monster = "yamentianshanmis_monster.ini"
x228903_g_Exit = "yamentianshanmis_area.ini"
x228903_g_LimitMembers = 3				--可以进副本的最小队伍人数
x228903_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x228903_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x228903_g_NoUserTime = 10				--副本中没有人后可以继续保存的时间（单位：秒）
x228903_g_Fuben_X = 32					--进入副本的位置X
x228903_g_Fuben_Z = 48					--进入副本的位置Z
x228903_g_Back_X = 259					--源场景位置X
x228903_g_Back_Z = 49					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x228903_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		local bDone = x228903_CheckSubmit( sceneId, selfId )

		if bDone == 0 then												--任务未完成
			if GetNumText() == 1 then
				x228903_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x228903_g_MissionName )
					x228903_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		elseif bDone == 1 then											--任务已经完成
			BeginEvent( sceneId )
				AddText( sceneId, x228903_g_MissionName )
				AddText( sceneId, x228903_g_ContinueInfo )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId, bDone )
		end
	--满足任务接收条件
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			AddText( sceneId, x228903_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, x228903_g_MissionTarget )
			AddText( sceneId, "#{M_SHOUHUO}#r" )
			AddMoneyBonus( sceneId, x228903_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
	end
end

--**********************************
--列举事件
--**********************************
function x228903_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 3, -1 )
	elseif x228903_CheckAccept( sceneId, selfId ) > 0 then
		AddNumText( sceneId, x228903_g_ScriptId, x228903_g_MissionName, 3, -1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x228903_CheckAccept( sceneId, selfId )
	if IsMissionHaveDone( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if IsMissionHaveDone( sceneId, selfId, x228903_g_PreMissionId ) <= 0 then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then
		return 0
	end

	if GetLevel( sceneId, selfId ) < 30 then
		return 0
	end

	return 1
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x228903_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	AddText( sceneId, x228903_g_MissionInfo )
	AddText( sceneId, "#{M_MUBIAO}" )
	AddText( sceneId, x228903_g_MissionTarget )
	AddNumText( sceneId, x228903_g_ScriptId, x228903_g_CopySceneName, 10, 1 )
end

--**********************************
--接受
--**********************************
function x228903_OnAccept( sceneId, selfId, targetId )
	if x228903_CheckAccept( sceneId, selfId ) == 1 then					--没有任务才可以走这里
		--加入任务到玩家列表
		AddMission( sceneId, selfId, x228903_g_MissionId, x228903_g_ScriptId, 1, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then
			return
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x228903_g_MissionName )
			x228903_AskEnterCopyScene( sceneId, selfId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--显示内容告诉玩家已经接受了任务
		x228903_NotifyFailTips( sceneId, selfId, "你接受了任务：" .. x228903_g_MissionName )
		Msg2Player( sceneId, selfId, "#Y接受任务" .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x228903_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "你需要加入一支队伍。" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x228903_NotifyFailTips( sceneId, selfId, "你必须是队长。" )
			return
		end

		--取得玩家附近的队友数量（包括自己）
		local nearteammembercount = GetNearTeamCount( sceneId, selfId )
		if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
			x228903_NotifyFailTips( sceneId, selfId, "你的队员必须在附近才能来协助你。" )
			return
		end

		if nearteammembercount < x228903_g_LimitMembers then
			x228903_NotifyFailTips( sceneId, selfId, "你至少需要 2 个队员来帮助你。" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x228903_g_Param_sceneid, -1 )		--将任务的第3号数据设置为-1, 用于保存副本的场景号
		x228903_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x228903_MakeCopyScene( sceneId, selfId )
	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x228903_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x228903_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x228903_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x228903_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x228903_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Boss的数量
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--杀死路霸的数量

	LuaFnSetSceneLoad_Area( sceneId, x228903_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, x228903_g_Monster )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, 0 )			--级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x228903_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x228903_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end
end

--**********************************
--副本事件
--**********************************
function x228903_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsObjValid( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "你需要加入一支队伍。" )
		return
	end

	if LuaFnIsTeamLeader( sceneId, leaderObjId ) == 0 then
		x228903_NotifyFailTips( sceneId, leaderObjId, "你必须是队长。" )
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	if nearteammembercount < x228903_g_LimitMembers then
		x228903_NotifyFailTips( sceneId, leaderObjId, "你的队伍人数不足。" )
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x228903_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x228903_g_MissionId )

		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x228903_g_Param_sceneid, destsceneId )

		local i = 0
		local member
		for i = 0, nearteammembercount - 1 do
			member = GetNearTeamMember( sceneId, leaderObjId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态
				NewWorld( sceneId, member, destsceneId, x228903_g_Fuben_X, x228903_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x228903_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x228903_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x228903_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x228903_g_MissionId ) <= 0 then				--有任务才可以走这里
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x228903_g_Param_sceneid )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x228903_g_MissionId )
	x228903_NotifyFailTips( sceneId, selfId, "任务失败" )
end

--**********************************
--继续
--**********************************
function x228903_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x228903_g_MissionName )
		AddText( sceneId, x228903_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x228903_g_ScriptId, x228903_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x228903_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x228903_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x228903_g_MissionId )				-- 得到任务的序列号
	bRet = GetMissionParam( sceneId, selfId, misIndex, x228903_g_IsMissionOkFail )
	if bRet ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x228903_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x228903_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x228903_CheckSubmit( sceneId, selfId ) == 1 then
		--添加任务奖励
		AddMoney( sceneId, selfId, x228903_g_MoneyBonus )
		LuaFnAddExp( sceneId, selfId, x228903_g_exp )

		DelMission( sceneId, selfId, x228903_g_MissionId )
		--设置任务已经被完成过
		MissionCom( sceneId, selfId, x228903_g_MissionId )
		Msg2Player( sceneId, selfId, "#Y完成任务：" .. x228903_g_MissionName, MSG2PLAYER_PARA )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x228903_OnKillObject( sceneId, selfId, objdataId, objId )
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x228903_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	local paramIndex = 0
	local monsterName = GetMonsterNamebyDataId( objdataId )
	if monsterName == x228903_g_MonsterList[x228903_g_Param_QinNumber][1] then
		paramIndex = x228903_g_Param_QinNumber
	elseif monsterName == x228903_g_MonsterList[x228903_g_Param_LubaNumber][1] then
		paramIndex = x228903_g_Param_LubaNumber
	else
		return
	end

	local num = GetMonsterOwnerCount( sceneId, objId )
	local ownerid = -1
	local strText = "已杀死" .. monsterName .. "：%d/" .. x228903_g_MonsterList[paramIndex][2]
	local bFinished = 0

	for i = 0, num - 1 do
		ownerid = GetMonsterOwnerID( sceneId, objId, i )

		-- 看有没有这个任务
		if ownerid and ownerid > 0 and IsHaveMission( sceneId, ownerid, x228903_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID( sceneId, ownerid, x228903_g_MissionId )
			local count = GetMissionParam( sceneId, ownerid, misIndex, paramIndex ) + 1
			SetMissionByIndex( sceneId, ownerid, misIndex, paramIndex, count )
			local strText1 = format( strText, count )
			x228903_NotifyFailTips( sceneId, ownerid, strText1 )

			if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_QinNumber ) >=
				x228903_g_MonsterList[x228903_g_Param_QinNumber][2] then
				if GetMissionParam( sceneId, ownerid, misIndex, x228903_g_Param_LubaNumber ) >=
					x228903_g_MonsterList[x228903_g_Param_LubaNumber][2] then
						SetMissionByIndex( sceneId, ownerid, misIndex, x228903_g_IsMissionOkFail, 1 )
						x228903_NotifyFailTips( sceneId, ownerid, "任务完成" )
						bFinished = 1
				end
			end
		end
	end

	if bFinished == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local member
		strText = format( "你将在 %d 秒后离开场景", x228903_g_CloseTick * x228903_g_TickTime )

		for i = 0, membercount - 1 do
			member = LuaFnGetCopyScene_HumanObjId( sceneId, i )

			if LuaFnIsObjValid( sceneId, member ) == 1 then
				x228903_NotifyFailTips( sceneId, member, strText )
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x228903_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x228903_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x228903_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新的定时器调用次数

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	-- 没有人的时候关闭副本
	if leaveFlag == 1 then															--需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x228903_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_OnEnterArea( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x228903_g_CloseTick - leaveTickCount ) * x228903_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	else
		local monstercount = GetMonsterCount( sceneId )
		if monstercount <= 0 then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", x228903_g_CloseTick * x228903_g_TickTime )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x228903_NotifyFailTips( sceneId, mems[i], strText )
				end
			end

			return
		end
	end
end

-- 玩家进入传送点
function x228903_OnEnterArea( sceneId, selfId )
	CallScriptFunction( x228903_g_TransScript, "TransferFunc", sceneId, selfId, x228903_g_SceneID, x228903_g_Back_X, x228903_g_Back_Z )
end

-- 玩家停留在传送点
function x228903_OnTimer( sceneId, selfId )
	return
end

-- 玩家离开传送点
function x228903_OnLeaveArea( sceneId, selfId )
	return
end

function x228903_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
