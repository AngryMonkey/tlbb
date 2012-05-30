-- 连环副本任务
-- 宋辽边界

--************************************************************************
--MisDescBegin

-- 脚本号
x050100_g_ScriptId = 050100

-- 任务号
x050100_g_MissionId = 1260					-- 1260 - 1269

-- 上一个任务的 ID
-- g_MissionIdPre = 1260

-- 任务目标 NPC
x050100_g_Name = "钱宏宇"

--任务归类
x050100_g_MissionKind = 8

--任务等级
x050100_g_MissionLevel = 10000

-- 任务文本描述
x050100_g_MissionName = "一个都不能跑"
x050100_g_MissionInfo = "    "				-- 任务描述
x050100_g_MissionTarget = "    苏州的钱宏宇#{_INFOAIM62,162,1,钱宏宇}让你在30分钟内引出并杀死余毒。#r    #{FQSH_090206_01}"						-- 任务目标
x050100_g_ContinueInfo = "    边境一战关系重大，一定不可掉以轻心。你准备好前往边境剿贼了么？"	-- 未完成任务的npc对话
x050100_g_SubmitInfo = "    任务做得怎么样了？"										-- 提交时的答复
x050100_g_MissionComplete = "    你做的好极了，我们可以通过这块令牌找到这伙匪徒的营寨。去镖局找花剑雨#{_INFOAIM251,109,1,花剑雨}，他可以告诉你令牌的来历。"	--完成任务npc说的话

x050100_g_IsMissionOkFail = 0				-- 0 号：当前任务是否完成(0未完成；1完成；2失败)
x050100_g_DemandKill = { { id = 4060, num = 50 }, { id = 4070, num = 10 }, { id = 4080, num = 1 }, { id = 4090, num = 1 }, { id = 4100, num = 1 } }	-- 1 ~ 5 号，怪物信息
x050100_g_Param_sceneid = 6					-- 6 号：当前副本任务的场景号

-- 任务奖励

--MisDescEnd
--************************************************************************

x050100_g_DemandKillGroup = { 4, 0, 1, 2, 3 }	-- 1 ~ 5 号怪物对应的 GroupID 号，与 x050100_g_DemandKill 一一对应
x050100_g_DogfaceGroup = 0					-- 逃跑小兵的 Group ID
x050100_g_LittleBossGroup = 2				-- 小 Boss Group ID
x050100_g_ViceBossGroup = 1					-- 宋军副都统
x050100_g_BossGroup = 3						-- Boss Group ID
x050100_g_Token = 40004315					-- 令牌号

x050100_g_NumText_Main = 1					-- 接任务的选项
x050100_g_NumText_EnterCopyScene = 2		-- 要求进入副本的选项

x050100_g_CopySceneMap = "songliao.nav"
x050100_g_CopySceneArea = "songliao_area.ini"
x050100_g_CopySceneMonsterIni = "songliao_monster_%d.ini"

x050100_g_CopySceneType = FUBEN_SONGLIAO	-- 副本类型，定义在ScriptGlobal.lua里面
x050100_g_LimitMembers = 1					-- 可以进副本的最小队伍人数
x050100_g_LevelLimit = 30					-- 可以进入副本的最低级别
x050100_g_TickTime = 5						-- 回调脚本的时钟时间（单位：秒/次）
x050100_g_LimitTotalHoldTime = 360			-- 副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050100_g_CloseTick = 6						-- 副本关闭前倒计时（单位：次数）
x050100_g_NoUserTime = 30					-- 副本中没有人后可以继续保存的时间（单位：秒）
x050100_g_LoadBossTick = 180				-- 15 分钟刷小 Boss

x050100_g_LittleBoss = { 4080, 4081, 4082, 4083, 4084, 4085, 4086, 4087, 4088, 4089, 34080, 34081, 34082, 34083, 34084, 34085, 34086, 34087, 34088, 34089 }
x050100_g_Dogface = { 4070, 4071, 4072, 4073, 4074, 4075, 4076, 4077, 4078, 4079, 34070, 34071, 34072, 34073, 34074, 34075, 34076, 34077, 34078, 34079 }
x050100_g_DogfacePos = {
	{ 22, 70, 4 }, { 22, 70, 4 }, { 22, 70, 4 }, { 102, 67, 5 }, { 102, 67, 5 },
	{ 102, 67, 5 }, { 75, 83, 6 }, { 75, 83, 6 }, { 49, 84, 7 }, { 49, 84, 7 }
}
x050100_g_Boss = { 4100, 4101, 4102, 4103, 4104, 4105, 4106, 4107, 4108, 4109, 34100, 34101, 34102, 34103, 34104, 34105, 34106, 34107, 34108, 34109 }

x050100_g_Fuben_X = 60
x050100_g_Fuben_Z = 9
x050100_g_Back_X = 130
x050100_g_Back_Z = 260

x050100_g_Fuben_Relive_X = 60
x050100_g_Fuben_Relive_Z = 15


-- 广播消息
x050100_g_BroadcastMsg = {
	"#Y"..x050100_g_Name.."：#{_BOSS45}#P已经死了！他被我们的英雄#{_INFOUSR$N}#P干掉了！下一个送死的会是谁？#{_BOSS46}？还是#{_BOSS47}？哈哈！",
	"#Y"..x050100_g_Name.."：#P我们的英雄#{_INFOUSR$N}#P，从#G宋辽边境#P带来了振奋人心的消息！那个无恶不作的马匪#{_BOSS45}#P，已经被干掉了！",
	"#Y"..x050100_g_Name.."：#P大家快来看看我们的英雄！#{_INFOUSR$N}#P！一个活着的传奇，大侠中的战斗侠，哦耶！"
}

x050100_g_TakeTimes = 10											-- 每天最多领取次数

--**********************************
-- 任务入口函数
--**********************************
function x050100_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		if numText == x050100_g_NumText_Main then
			if x050100_CheckAccept( sceneId, selfId ) > 0 then
				--发送任务接受时显示的信息
				BeginEvent( sceneId )
					AddText( sceneId, x050100_g_MissionName )
					AddText( sceneId, "    总算有人来惩治这些恶贼了！" )
					AddText( sceneId, "    这伙匪徒在边境十分猖獗，头目是一个叫做余毒的马匪。此人乃丐帮弃徒，武功高强且极善用毒，只有把其手下伪装的宋兵、宋将一举杀光才能引他出现。" .. GetName( sceneId, selfId ) .. "，为了将这些匪徒连根铲除，你必须以最快的速度将他们消灭，并且不能放走一个活口！" )
					AddText( sceneId, "#{M_MUBIAO}" )
					AddText( sceneId, x050100_g_MissionTarget )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
			end
		end
	else
		if numText == x050100_g_NumText_Main then
			local bDone = x050100_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				AddText( sceneId, x050100_g_MissionName )

				if bDone == 1 then
					AddText( sceneId, x050100_g_SubmitInfo )
				else
					AddText( sceneId, x050100_g_ContinueInfo )
					x050100_AskEnterCopyScene( sceneId, selfId, targetId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId, bDone )
		elseif numText == x050100_g_NumText_EnterCopyScene then
			x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他的任务，没有返回 0，有返回 1
--**********************************
function x050100_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1260, x050100_g_MissionId - 1 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	for missionId = x050100_g_MissionId + 1, 1269 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050100_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	-- 不能有其他的任务
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050100_g_ScriptId, x050100_g_MissionName, 4, x050100_g_NumText_Main )
end

--**********************************
-- 检测接受条件
--**********************************
function x050100_CheckAccept( sceneId, selfId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他的任务
	if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end

	-- 检测玩家是否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1 )			-- 上一次放弃任务的时间(单位：一刻钟)
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()												-- 当前时间(单位：一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位：一刻钟)
	--end modified by zhangguoxin 090207

	if iTime+1 >= CurTime then
		x050100_NotifyFailTips( sceneId, selfId, "放弃任务30分钟后才能再次接取" )
		return 0
	end

	-- 一天只能领 x050100_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
	end

	if takenTimes >= x050100_g_TakeTimes then
		x050100_NotifyFailTips( sceneId, selfId, "您今天领取任务的次数已经超过" .. x050100_g_TakeTimes .. "次，请明天再来领取。" )
		return 0
	else
		DayTimes = nowDate + takenTimes * 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )
	end

	return 1
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050100_AskEnterCopyScene( sceneId, selfId, targetId )
	AddNumText( sceneId, x050100_g_ScriptId, "前往边境", 10, x050100_g_NumText_EnterCopyScene )
end

--**********************************
--接受
--**********************************
function x050100_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then					-- 没有任务才可以走这里
		if GetMissionCount( sceneId, selfId ) >= 20 then						-- 身上任务数量是否达到上限20个
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    任务记录已满，无法接取更多的任务。" )
			return
		end

		if GetLevel( sceneId, selfId ) < x050100_g_LevelLimit then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    你的等级还不足30级，无法胜任。" )
			return
		end

		-- 不能有其他的任务
		if x050100_CheckConflictMission( sceneId, selfId ) == 1 then
			return
		end

		-- 加入任务到玩家列表
		AddMission( sceneId, selfId, x050100_g_MissionId, x050100_g_ScriptId, 1, 0, 0 )			-- kill、area、item
		if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
			return
		end

		-- 一天只能领 x050100_g_TakeTimes 次
		local DayTimes

		DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES )
		DayTimes = DayTimes + 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION1_TIMES, DayTimes )

--		SetMissionEvent( sceneId, selfId, x050100_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )

		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
		SetMissionByIndex( sceneId, selfId, misIndex, x050100_g_Param_sceneid, -1 )		-- 副本号置为 -1

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x050100_g_MissionName )
			AddText( sceneId, x050100_g_ContinueInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x050100_g_MissionName )

			x050100_AskEnterCopyScene( sceneId, selfId, targetId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050100_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
			-- 将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050100_g_Fuben_X, x050100_g_Fuben_Z )
			else
				x050100_NotifyFailBox( sceneId, selfId, targetId, "    很抱歉，你的任务已经失败了。" )
			end

			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    剿贼一事非同小可，你需要有一支强大的队伍。" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    我需要得到队长的确认才能放心让你们前往边境。" )
			return
		end
		
		--bug27726，2007.11.15 by alan，因为sceneMemberCount不一定准确，改用附近队员数与队伍人数的比较判断
		--并不再提示具体不在附近的队员名称
				
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);	
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);		
		if not teamMemberCount or not nearMemberCount or teamMemberCount ~= nearMemberCount then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    你还有队员不在附近。" )
			return
		end
		
		--bug27726 end
                                                               
		-- 取得玩家附近的队友数量（包括自己）
		--local teamMemberCount = GetTeamMemberCount(sceneId, selfId);		
		--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
		--if not teamMemberCount or not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
		--	x050100_NotifyFailBox( sceneId, selfId, targetId, "    你还有队员不在附近。" )
		--	return
		--end
		
		--local nearMemberCount = GetNearTeamCount(sceneId, selfId)
		--if nearMemberCount ~= sceneMemberCount + 1 then
		--	local strOutmsg = "您队伍中有成员（";
		--	local checkNearCount = 0;
		--	for	i = 0, sceneMemberCount - 1 do
		--		local sceneMemId = LuaFnGetTeamSceneMember(sceneId, selfId, i);
		--		if sceneMemId and sceneMemId >= 0 then
		--			local findFlag = 0;
		--			for	j = 0, nearMemberCount - 1 do
		--				local nearMemId = GetNearTeamMember(sceneId, selfId, j);
		--				if nearMemId and nearMemId == sceneMemId then
		--					findFlag = 1;
		--					break;
		--				end
		--			end
					
		--			if findFlag == 0 then
		--				memName = GetName(sceneId, sceneMemId);
		--				if checkNearCount == 0 then
		--					strOutmsg = strOutmsg..memName;
		--				else
		--					strOutmsg = strOutmsg.."、"..memName;
		--				end
		--				checkNearCount = checkNearCount + 1;
		--			end
		--		end
		--	end
		--	if checkNearCount  > 0 then
		--		strOutmsg = strOutmsg.."）不在附近，请集合后再找我进入活动。";
		--		x050100_NotifyFailBox( sceneId, selfId, targetId, strOutmsg)
		--	end
		--	return 
		--end

		if nearMemberCount < x050100_g_LimitMembers then
			x050100_NotifyFailBox( sceneId, selfId, targetId, "    剿贼一事非同小可，你需要一些本领与你相当的帮手我才放心。（队伍中至少需要三个30级以上角色）" )
			return
		end

		-- 检测小队中是否有人任务记录已满, 队友是否已经接过此任务
		local member, mylevel, numerator, denominator = 0, 0, 0, 0
		local outNotAcceptMissionStr = "您队伍中有成员（";
		local notAcceptMissionCount = 0;
		local outDoingMissionStr = "您队伍中有成员（";
		local doingMissionCount = 0;
		for	i = 0, nearMemberCount - 1 do
			member = GetNearTeamMember( sceneId, selfId, i )

			if IsHaveMission( sceneId, member, x050100_g_MissionId ) <= 0 then
				if notAcceptMissionCount == 0 then
					outNotAcceptMissionStr = outNotAcceptMissionStr..GetName(sceneId, member);
				else
					outNotAcceptMissionStr = outNotAcceptMissionStr.."、"..GetName(sceneId, member);
				end
				notAcceptMissionCount = notAcceptMissionCount + 1;
			end

			if notAcceptMissionCount == 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x050100_g_MissionId )
				if GetMissionParam( sceneId, member, misIndex, x050100_g_Param_sceneid ) >= 0 then
					if doingMissionCount == 0 then
						outDoingMissionStr = outDoingMissionStr..GetName(sceneId, member);
					else
						outDoingMissionStr = outDoingMissionStr.."、"..GetName(sceneId, member);
					end
					doingMissionCount = doingMissionCount + 1;
				end
			end

			numerator = numerator + GetLevel( sceneId, member ) ^ 4
			denominator = denominator + GetLevel( sceneId, member ) ^ 3
		end
		
		if notAcceptMissionCount > 0 then
			outNotAcceptMissionStr = outNotAcceptMissionStr.."）还没有接任务。";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outNotAcceptMissionStr);
			return
		end

		if doingMissionCount > 0 then
			outDoingMissionStr = outDoingMissionStr.."）已经在做该任务了。";
			x050100_NotifyFailBox( sceneId, selfId, targetId, outDoingMissionStr);
			return
		end
		
		if denominator <= 0 then
			mylevel = 0
		else
			mylevel = numerator / denominator
		end

    local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 10
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050100_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050100_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050100_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050100_g_CopySceneType )				-- 设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050100_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放，1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀死Boss1的数量
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 杀死Boss2的数量
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 杀死Boss3的数量
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 杀死Boss4的数量
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 杀死Boss5的数量
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 是否杀死小 Boss
		LuaFnSetCopySceneData_Param( sceneId, 13, iniLevel / 10 )				-- 存储玩家们的级别档次
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 是否已经有小怪逃走
		LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- 是否已经刷出大 Boss

		LuaFnSetSceneLoad_Area( sceneId, x050100_g_CopySceneArea )

		local monsterINI = format( x050100_g_CopySceneMonsterIni, iniLevel )
		LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

		LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) -- 级别差，CopyScene_LevelGap 在 scene.lua 中赋值

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050100_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
		else
			x050100_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050100_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- 设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- 找不到该玩家
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- 处于无法执行逻辑的状态
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local i, nearMemberCount, member
	local members = {}
	local validmembercount = 0

	nearMemberCount = GetNearTeamCount( sceneId, leaderObjId )
	for i = 0, nearMemberCount - 1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050100_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050100_g_LimitMembers then
		x050100_NotifyFailTips( sceneId, leaderObjId, "    剿贼一事非同小可，你需要一些本领与你相当的帮手我才放心。（队伍中至少需要三个30级以上角色）" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050100_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
			--将任务的第1号数据设置为副本的场景号
			SetMissionByIndex( sceneId, members[i], misIndex, x050100_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050100_g_MissionId, 0 )			-- 关心杀怪事件
			NewWorld( sceneId, members[i], destsceneId, x050100_g_Fuben_X, x050100_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050100_OnPlayerEnter( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050100_g_Fuben_Relive_X, x050100_g_Fuben_Relive_Z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050100_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050100_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	--取得杀死怪物的GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	local killedMonsterIndex, killedCount = 0, 0
	for i = 1, getn( x050100_g_DemandKillGroup ) do
		if GroupID == x050100_g_DemandKillGroup[i] then
			killedMonsterIndex = i
			killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
			LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
			break
		end
	end

	if killedMonsterIndex == 0 then													-- 杀死了一个不相关怪
		return
	end

	if x050100_g_BossGroup == GroupID then
		local BroadcastMsg = x050100_g_BroadcastMsg[ random( getn(x050100_g_BroadcastMsg) ) ]
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
	end

	local maxKilledCount = x050100_g_DemandKill[killedMonsterIndex].num

	--取得当前场景里的人数
	local i, humanObjId, misIndex
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local strText = format( "已杀死%s： %d/%d", GetName( sceneId, objId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId

		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						-- 不在场景的不做此操作
			x050100_NotifyFailTips( sceneId, humanObjId, strText )
			Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )
			misIndex = GetMissionIndexByID( sceneId, humanObjId, x050100_g_MissionId )
			SetMissionByIndex( sceneId, humanObjId, misIndex, killedMonsterIndex, killedCount )	-- 刷新杀怪数量

			-- 杀死所有怪没有放走一个则在中央大营前刷出boss[余毒],杀死后副本任务完成。(余毒身上必掉任务道具”余毒的令牌”)
			if x050100_g_BossGroup == GroupID then
				-- 杀死了也不关闭副本，因为要等所有人都捡令牌……
				AddMonsterDropItem( sceneId, objId, humanObjId, x050100_g_Token )

				SetMissionByIndex( sceneId, humanObjId, misIndex, x050100_g_IsMissionOkFail, 1 )	-- 任务完成
			end
		end
	end

	-- 杀死地图中央的小boss[伪装的宋兵都统]5秒后，在地图下方刷出10只沿路线逃窜的小怪
	if x050100_g_LittleBossGroup == GroupID then									-- 杀死了小 Boss
		LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 是否杀死小 Boss
	end

	-- 杀死所有怪没有放走一个则在中央大营前刷出boss[余毒]
	local bigBossFlag = 1
	for i = 1, 4 do
		if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x050100_g_DemandKill[i].num then
			bigBossFlag = 0
			break
		end
	end

	if bigBossFlag == 1 then
		if LuaFnGetCopySceneData_Param( sceneId, 15 ) > 0 then					-- 不需要再刷 Boss 了
			return
		end

		local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
		if not x050100_g_Boss[bossGrade] then
			return
		end

		local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
		local bossId = LuaFnCreateMonster( sceneId, x050100_g_Boss[bossGrade], 55, 67, 14, 126, -1 )
		SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
		SetCharacterTitle(sceneId, bossId, "边境大王")
		SetMonsterGroupID( sceneId, bossId, x050100_g_BossGroup )
		LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050100_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050100_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
end

--**********************************
--放弃
--**********************************
function x050100_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050100_g_Param_sceneid )


	-- 设置放弃连环任务的时间
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--end modified by zhangguoxin 090207
	SetMissionData( sceneId, selfId, MD_ROUNDMISSION1, CurTime )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x050100_g_MissionId )
	
	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050100_g_CopySceneType then											-- 如果在副本里删除任务，则直接传送回
		x050100_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050100_g_Back_X, x050100_g_Back_Z )
	end
end


--**********************************
--副本场景定时器事件
--**********************************
function x050100_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- 取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							-- 设置新的定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- 需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050100_g_CloseTick then										-- 倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050100_g_CloseTick - leaveTickCount ) * x050100_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050100_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050100_NotifyFailTips( sceneId, mems[i], "任务时间已到，离开场景...." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的队伍号
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050100_NotifyFailTips( sceneId, mems[i], "你不在正确的队伍中，离开场景...." )
				x050100_Exit( sceneId, mems[i] )
			end
		end

		-- 每分钟提示玩家剩余时间
		if mod( x050100_g_TickTime * TickCount, 60 ) < x050100_g_TickTime and TickCount < x050100_g_LimitTotalHoldTime then
			local str = "剩余 " .. ( x050100_g_LimitTotalHoldTime - TickCount ) * x050100_g_TickTime / 60 .. " 分钟..."
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050100_NotifyFailTips( sceneId, mems[i], str )
				end
			end
		end

		-- 副本进行15分钟时会在队长玩家身边刷出小boss：伪装的宋兵副都统
		if TickCount == x050100_g_LoadBossTick then
			local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
			if not x050100_g_LittleBoss[bossGrade] then
				return
			end

			local PosX, PosZ = 55, 66												-- 避免出现队伍成员死光光啊死光光
			for	i = 0, membercount - 1 do
				PosX, PosZ = LuaFnGetWorldPos( sceneId, mems[i] )					-- 避免出现未找到队长的意外
				if LuaFnIsTeamLeader( sceneId, mems[i] ) == 1 then
					break
				end
			end

			local bossId = LuaFnCreateMonster( sceneId, x050100_g_LittleBoss[bossGrade], PosX, PosZ, 14, 124, -1 )
			SetLevel( sceneId, bossId, GetLevel( sceneId, bossId ) + LevelGap )
			SetMonsterGroupID( sceneId, bossId, x050100_g_ViceBossGroup )
		end

		-- 杀死地图中央的小boss[伪装的宋兵都统]5秒后，在地图下方刷出10只沿路线逃窜的小怪
		local flag = LuaFnGetCopySceneData_Param( sceneId, 12 )
		if flag > 0 then
			if flag == 1 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )						-- 等一轮再出小怪
			elseif flag == 2 then
				LuaFnSetCopySceneData_Param( sceneId, 12, 0 )

				local bossGrade = LuaFnGetCopySceneData_Param( sceneId, 13 )
				if not x050100_g_Dogface[bossGrade] then
					return
				end

				local dogfaceId = -1
				for i = 1, getn( x050100_g_DogfacePos ) do
					if x050100_g_DogfacePos[i] then
						dogfaceId = LuaFnCreateMonster( sceneId, x050100_g_Dogface[bossGrade], x050100_g_DogfacePos[i][1], x050100_g_DogfacePos[i][2], 1, 4, -1 )
						SetLevel( sceneId, dogfaceId, GetLevel( sceneId, dogfaceId ) + LevelGap )
						SetMonsterGroupID( sceneId, dogfaceId, x050100_g_DogfaceGroup )
						SetPatrolId( sceneId, dogfaceId, x050100_g_DogfacePos[i][3] )		-- 设置巡逻路径
					end
				end
			end
		end

		-- 小怪沿路线到达指定区域则消失
		-- 当有一个小怪逃走后在屏幕上方提示玩家：“逃窜匪类逃出，贼人头目闻风藏匿，任务失败。”
		local monstercount = GetMonsterCount( sceneId )
		local monsterId, GroupID, DogX, DogZ, misIndex
		local x, z = GetLastPatrolPoint( sceneId, 5 )

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )

			if GroupID == x050100_g_DogfaceGroup
			 and LuaFnIsCharacterLiving( sceneId, monsterId ) == 1 then			-- 判断活着的小兵是否逃跑成功
				DogX, DogZ = GetWorldPos( sceneId, monsterId )

				if (x - DogX) * (x - DogX) + (z - DogZ) * (z - DogZ) < 25 then	-- 离终点不到 5 米
					if LuaFnGetCopySceneData_Param( sceneId, 14 ) < 1 then		-- 第一次小兵逃跑
						LuaFnSetCopySceneData_Param( sceneId, 14, 1 )			-- 是否已经有小怪逃走

						for	i = 0, membercount - 1 do
							if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
								misIndex = GetMissionIndexByID( sceneId, mems[i], x050100_g_MissionId )
								SetMissionByIndex( sceneId, mems[i], misIndex, x050100_g_IsMissionOkFail, 2 )	-- 任务失败
								x050100_NotifyFailTips( sceneId, mems[i], "逃窜匪类逃出，贼人头目闻风藏匿，任务失败。" )
							end
						end
					end

					LuaFnDeleteMonster( sceneId, monsterId )
				end
			end
		end

--		if GetMonsterCount( sceneId ) < 1 then
--			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
--		end
	end
end

--**********************************
--继续
--**********************************
function x050100_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050100_g_MissionName )
		AddText( sceneId, x050100_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050100_g_ScriptId, x050100_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x050100_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050100_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050100_g_MissionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050100_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	local nItemNum = GetItemCount( sceneId, selfId, x050100_g_Token )
	if nItemNum < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050100_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x050100_CheckSubmit( sceneId, selfId ) == 1 then
		-- 不扣东西，直接完成
		x050100_NotifyFailBox( sceneId, selfId, targetId, x050100_g_MissionComplete )
		DelMission( sceneId, selfId, x050100_g_MissionId )
		-- 任务或活动统计
		LuaFnAuditQuest(sceneId, selfId, "宋辽边界")
		local strText = x050100_g_MissionName .. "任务已完成。"
		x050100_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050100_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050100_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

