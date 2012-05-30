-- 连环副本任务
-- 竹林

--************************************************************************
--MisDescBegin

-- 脚本号
x050101_g_ScriptId = 050101

-- 任务号
x050101_g_MissionId = 1261					-- 1260 - 1269

-- 上一个任务的 ID
-- g_MissionIdPre = 1260

-- 任务目标 NPC
x050101_g_Name = "花剑雨"

--任务归类
x050101_g_MissionKind = 8

--任务等级
x050101_g_MissionLevel = 10000

-- 任务文本描述
x050101_g_MissionName = "除害"
x050101_g_MissionInfo = "    "														-- 任务描述
x050101_g_MissionTarget = "    苏州的花剑雨#{_INFOAIM251,108,1,花剑雨}让你杀死80只野熊，并杀死红熊王。#r    #{FQSH_090206_01}"						-- 任务目标
x050101_g_ContinueInfo = "    你们准备好了就请前去竹林消灭红熊王！"					-- 未完成任务的npc对话
x050101_g_SubmitInfo = "    任务做得怎么样了？"										-- 提交时的答复
x050101_g_MissionComplete = "    既然你们已经杀死红熊王了，那么依约我也该告诉你们这块令牌的来历了。你们把这封信交给钱宏宇#{_INFOAIM62,162,1,钱宏宇},他自然会明白一切的。"	--完成任务npc说的话

x050101_g_IsMissionOkFail = 0														-- 0 号：当前任务是否完成(0未完成；1完成；2失败)
x050101_g_DemandKill = { { id = 4120, num = 1 }, { id = 4110, num = 80 } }			-- 1 ~ 2 号，怪物信息
x050101_g_Param_sceneid = 3															-- 3 号：当前副本任务的场景号

-- 任务奖励

--MisDescEnd
--************************************************************************

x050101_g_DemandKillGroup = { 2, 1 }		-- 1 ~ 2 号怪物对应的 GroupID 号，与 x050101_g_DemandKill 一一对应
x050101_g_BossGroup = 2						-- Boss Group ID
x050101_g_Token = 40004315					-- 令牌号
x050101_g_Mail = 40004316					-- 书信

x050101_g_NumText_Main = 1					-- 接任务的选项
x050101_g_NumText_EnterCopyScene = 2		-- 要求进入副本的选项

x050101_g_CopySceneMap = "zhulin.nav"
x050101_g_CopySceneArea = "zhulin_area.ini"
x050101_g_CopySceneMonsterIni = "zhulin_monster_%d.ini"

x050101_g_CopySceneType = FUBEN_ZHULIN		-- 副本类型，定义在ScriptGlobal.lua里面
x050101_g_LimitMembers = 1					-- 可以进副本的最小队伍人数
x050101_g_LevelLimit = 30					-- 可以进入副本的最低级别
x050101_g_TickTime = 5						-- 回调脚本的时钟时间（单位：秒/次）
x050101_g_LimitTotalHoldTime = 360			-- 副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050101_g_CloseTick = 6						-- 副本关闭前倒计时（单位：次数）
x050101_g_NoUserTime = 30					-- 副本中没有人后可以继续保存的时间（单位：秒）

x050101_g_Fuben_X = 97
x050101_g_Fuben_Z = 113
x050101_g_Back_X = 346
x050101_g_Back_Z = 202

x050101_g_Fuben_Relive_X = 97
x050101_g_Fuben_Relive_Z = 113

-- 广播消息
x050101_g_BroadcastMsg = {
	"#Y"..x050101_g_Name .. "：#W#{_INFOUSR$N}#P大侠真是强，一拳打扁#{_BOSS46}#P。有了#{_INFOUSR$N}#P大侠在，哪个毛贼敢倡狂？",
	"#Y"..x050101_g_Name .. "：#W#{_INFOUSR$N}#P大侠真是行，横扫苏州小竹林。一顿胖揍捶下去，没有#G红熊#P摆不平。",
	"#Y"..x050101_g_Name .. "：#W#{_INFOUSR$N}#P大侠真是强，侠义之名万古流。武功更是没得说，凡是#G红熊#P全爆头。"
}

x050101_g_TakeTimes = 10											-- 每天最多领取次数
--**********************************
-- 任务入口函数
--**********************************
function x050101_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		if numText == x050101_g_NumText_Main then
			if x050101_CheckAccept( sceneId, selfId ) > 0 then
				--发送任务接受时显示的信息
				BeginEvent( sceneId )
					AddText( sceneId, x050101_g_MissionName )
					AddText( sceneId, "    不错，我确实可以告诉你这块令牌的来历，不过在此之前，你得帮我个忙。" )
					AddText( sceneId, "    在苏州城外的竹林里有一群野熊，本来它们是很温顺的，但自从一头红熊当上了这群野熊的首领后，它们就变得残暴起来了，附近已经有不少的村子遭到了袭击，可是朝廷却一直顾不上派兵来对付这些野兽，为了避免乡亲们不受到更大的伤害，我必须尽快想办法除掉这只该死的红熊。" )
					AddText( sceneId, "    如果你能帮我杀死这只红熊，我就告诉你这块令牌的来历。" )
					AddText( sceneId, "#{M_MUBIAO}" )
					AddText( sceneId, x050101_g_MissionTarget )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId )
			end
		end
	else
		if numText == x050101_g_NumText_Main then
			local bDone = x050101_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				AddText( sceneId, x050101_g_MissionName )

				if bDone == 1 then
					AddText( sceneId, x050101_g_SubmitInfo )
				else
					AddText( sceneId, x050101_g_ContinueInfo )
					x050101_AskEnterCopyScene( sceneId, selfId, targetId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId, bDone )
		elseif numText == x050101_g_NumText_EnterCopyScene then
			x050101_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他的任务，没有返回 0，有返回 1
--**********************************
function x050101_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1260, x050101_g_MissionId - 1 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	for missionId = x050101_g_MissionId + 1, 1269 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050101_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	-- 不能有其他的任务
	if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050101_g_ScriptId, x050101_g_MissionName, 4, x050101_g_NumText_Main )
end

-- 没有令牌如何处理？不显示条目（不显示的后果可能是让某些玩家不知道这里有任务）还是给出提示？
--**********************************
-- 检测接受条件
--**********************************
function x050101_CheckAccept( sceneId, selfId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他的任务
	if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end

	-- 检测玩家是否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2 )			-- 上一次放弃任务的时间(单位：一刻钟)
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()												-- 当前时间(单位：一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位：一刻钟)
	--end modified by zhangguoxin 090207

	if iTime+1  >= CurTime then
		x050101_NotifyFailTips( sceneId, selfId, "放弃任务30分钟后才能再次接取" )
		return 0
	end

	-- 如果没有：需要“余毒的令牌”
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050101_g_Token ) < 1 then
		x050101_NotifyFailTips( sceneId, selfId, "    需要#{_ITEM" .. x050101_g_Token .."}。" )
		return 0
	end

	-- 一天只能领 x050101_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
	end

	if takenTimes >= x050101_g_TakeTimes then
		x050101_NotifyFailTips( sceneId, selfId, "您今天领取任务的次数已经超过" .. x050101_g_TakeTimes .. "次，请明天再来领取。" )
		return 0
	else
		DayTimes = nowDate + takenTimes * 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES, DayTimes )
	end

	return 1
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050101_AskEnterCopyScene( sceneId, selfId, targetId )
	AddNumText( sceneId, x050101_g_ScriptId, "前往竹林", 10, x050101_g_NumText_EnterCopyScene )
end

--**********************************
--接受
--**********************************
function x050101_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then					-- 没有任务才可以走这里
		if GetMissionCount( sceneId, selfId ) >= 20 then						-- 身上任务数量是否达到上限20个
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    任务记录已满，无法接取更多的任务。" )
			return
		end

		if GetLevel( sceneId, selfId ) < x050101_g_LevelLimit then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    你的等级还不足30级，这个任务对你太危险，还是先锻炼锻炼再去吧。" )
			return
		end

		-- 不能有其他的任务
		if x050101_CheckConflictMission( sceneId, selfId ) == 1 then
			return
		end

		-- 如果玩家身上具有一块以上的道具”余毒的令牌”,可以在此接受新任务“除害”,接任务的同时消耗一个令牌”余毒的令牌”。
		if LuaFnDelAvailableItem( sceneId, selfId, x050101_g_Token, 1 ) == 0 then
			-- 否则显示：需要“余毒的令牌”
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    需要#{_ITEM" .. x050101_g_Token .."}。" )
			return
		end

		-- 加入任务到玩家列表
		AddMission( sceneId, selfId, x050101_g_MissionId, x050101_g_ScriptId, 1, 0, 0 )			-- kill、area、item
		if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) <= 0 then
			return
		end

		-- 一天只能领 x050101_g_TakeTimes 次
		local DayTimes

		DayTimes = GetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES )
		DayTimes = DayTimes + 100000
		SetMissionData( sceneId, selfId, MD_ROUNDMISSION2_TIMES, DayTimes )

--		SetMissionEvent( sceneId, selfId, x050101_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

		local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )

		SetMissionByIndex( sceneId, selfId, misIndex, x050101_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
		SetMissionByIndex( sceneId, selfId, misIndex, x050101_g_Param_sceneid, -1 )		-- 副本号置为 -1

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x050101_g_MissionName )
			AddText( sceneId, x050101_g_ContinueInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x050101_g_MissionName )

			x050101_AskEnterCopyScene( sceneId, selfId, targetId )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050101_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050101_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
			-- 将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050101_g_Fuben_X, x050101_g_Fuben_Z )
			else
				x050101_NotifyFailBox( sceneId, selfId, targetId, "    很抱歉，你的任务已经失败了。" )
			end

			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    你一个人势单力薄，还是多叫几个帮手再来吧。" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    你不是队长，只有队长才能决定是否接受我的委托。" )
			return
		end
		
		--bug27726，2007.11.15 by alan，因为sceneMemberCount不一定准确，改用附近队员数与队伍人数的比较判断
		--并不再提示具体不在附近的队员名称
				
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);	
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);		
		if not teamMemberCount or not nearMemberCount or teamMemberCount ~= nearMemberCount then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    你还有队员不在附近。" )
			return
		end
		
		--bug27726 end

		-- 取得玩家附近的队友数量（包括自己）
		--local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		--local sceneMemberCount = GetTeamSceneMemberCount(sceneId, selfId);
		--if not teamMemberCount or not sceneMemberCount or teamMemberCount ~= sceneMemberCount + 1 then
		--	x050101_NotifyFailBox( sceneId, selfId, targetId, "    你还有队员不在附近。" )
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
		--		x050101_NotifyFailBox( sceneId, selfId, targetId, strOutmsg)
		--	end
		--	return 
		--end
		
		if nearMemberCount < x050101_g_LimitMembers then
			x050101_NotifyFailBox( sceneId, selfId, targetId, "    竹林里野熊很多，最少你们得有 3 位同伴我才放心让你们去。（队伍中至少需要三个30级以上角色）" )
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

			if IsHaveMission( sceneId, member, x050101_g_MissionId ) <= 0 then
				if notAcceptMissionCount == 0 then
					outNotAcceptMissionStr = outNotAcceptMissionStr..GetName(sceneId, member);
				else
					outNotAcceptMissionStr = outNotAcceptMissionStr.."、"..GetName(sceneId, member);
				end
				notAcceptMissionCount = notAcceptMissionCount + 1;
			end

			if notAcceptMissionCount == 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x050101_g_MissionId )
				if GetMissionParam( sceneId, member, misIndex, x050101_g_Param_sceneid ) >= 0 then
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
			x050101_NotifyFailBox( sceneId, selfId, targetId, outNotAcceptMissionStr);
			return
		end
		
		if doingMissionCount > 0 then
			outDoingMissionStr = outDoingMissionStr.."）已经在做该任务了。";
			x050101_NotifyFailBox( sceneId, selfId, targetId, outDoingMissionStr);
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
		LuaFnSetSceneLoad_Map( sceneId, x050101_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050101_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050101_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050101_g_CopySceneType )				-- 设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050101_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
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
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 是否杀死红熊王
		LuaFnSetCopySceneData_Param( sceneId, 13, iniLevel / 10 )				-- 存储玩家们的级别档次
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 红熊王是否已经加血

		LuaFnSetSceneLoad_Area( sceneId, x050101_g_CopySceneArea )

		local monsterINI = format( x050101_g_CopySceneMonsterIni, iniLevel )
		LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

		LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) -- 级别差，CopyScene_LevelGap 在 scene.lua 中赋值

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050101_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
		else
			x050101_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050101_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050101_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050101_g_LimitMembers then
		x050101_NotifyFailTips( sceneId, leaderObjId, "    竹林里野熊很多，最少你们得有 3 位同伴我才放心让你们去。" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050101_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
			--将任务的第1号数据设置为副本的场景号
			SetMissionByIndex( sceneId, members[i], misIndex, x050101_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050101_g_MissionId, 0 )			-- 关心杀怪事件
			NewWorld( sceneId, members[i], destsceneId, x050101_g_Fuben_X, x050101_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050101_OnPlayerEnter( sceneId, selfId )
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x050101_g_Fuben_Relive_X, x050101_g_Fuben_Relive_Z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050101_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		return
	end

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050101_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	--取得杀死怪物的GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if GroupID == x050101_g_BossGroup then
		LuaFnSetCopySceneData_Param( sceneId, 12, 1 )							-- 是否杀死红熊王

		local monstercount = GetMonsterCount( sceneId )
		local bossId
		for i = 0, monstercount - 1 do
			bossId = GetMonsterObjID( sceneId, i )
			-- 设置成非主动攻击
			-- 基础 AI 变为 1
			SetNPCAIType( sceneId, bossId, 1 )
			-- 扩展 AI 变为 0
			SetAIScriptID( sceneId, bossId, 0 )
			-- 然后开始发呆
			NpcToIdle( sceneId, bossId )
		end

		local BroadcastMsg = x050101_g_BroadcastMsg[ random( getn(x050101_g_BroadcastMsg) ) ]
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )

	end

	local killedMonsterIndex, killedCount = 0, 0
	for i = 1, getn( x050101_g_DemandKillGroup ) do
		if GroupID == x050101_g_DemandKillGroup[i] then
			killedMonsterIndex = i
			killedCount = LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) + 1
			LuaFnSetCopySceneData_Param( sceneId, 7 + i - 1, killedCount )		-- 杀死Bossi的数量
			break
		end
	end

	if killedMonsterIndex == 0 then													-- 杀死了一个不相关怪
		return
	end

	local maxKilledCount = x050101_g_DemandKill[killedMonsterIndex].num

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local misIndex
	local strText = format( "已杀死%s： %d/%d", GetName( sceneId, objId ), killedCount, maxKilledCount )
	for i = 0, num - 1 do
		mems[i + 1] = LuaFnGetCopyScene_HumanObjId( sceneId, i )					-- 取得当前场景里人的objId

		if LuaFnIsObjValid( sceneId, mems[i + 1] ) == 1 then						-- 不在场景的不做此操作
			x050101_NotifyFailTips( sceneId, mems[i + 1], strText )
			Msg2Player( sceneId, mems[i + 1], strText, MSG2PLAYER_PARA )
			misIndex = GetMissionIndexByID( sceneId, mems[i + 1], x050101_g_MissionId )
			SetMissionByIndex( sceneId, mems[i + 1], misIndex, killedMonsterIndex, killedCount )	-- 刷新杀怪数量
		end
	end

	local leaveFlag = 1
	for i = 1, getn( x050101_g_DemandKillGroup ) do
		if LuaFnGetCopySceneData_Param( sceneId, 7 + i - 1 ) < x050101_g_DemandKill[i].num then
			leaveFlag = 0
			break
		end
	end

	-- 杀死所有怪则离开场景
	if leaveFlag == 1 then
		local misIndex
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		for i = 1, num do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050101_NotifyFailTips( sceneId, mems[i], "任务目标完成，即将离开副本...." )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050101_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050101_g_IsMissionOkFail, 1 )	-- 任务完成
			end
		end
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050101_OnHumanDie( sceneId, selfId, killerId )
	-- 任何一个玩家死亡都会导致红熊王生命全满
--	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1 then								-- 熊王死了就不判断了
--		return
--	end
--
--	local monstercount = GetMonsterCount( sceneId )
--	local monsterId, GroupID
--
--	for i = 0, monstercount - 1 do
--		monsterId = GetMonsterObjID( sceneId, i )
--		GroupID = GetMonsterGroupID( sceneId, monsterId )
--
--		if GroupID == x050101_g_BossGroup then
--			RestoreHp( sceneId, monsterId )
--			break
--		end
--	end
end

--**********************************
--离开副本
--**********************************
function x050101_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050101_g_Back_X, x050101_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050101_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050101_g_MissionName )
		AddText( sceneId, x050101_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050101_g_ScriptId, x050101_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050101_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050101_g_Param_sceneid )

	-- 设置放弃连环任务的时间
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--begin modified by zhangguoxin 090207
	SetMissionData( sceneId, selfId, MD_ROUNDMISSION2, CurTime )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x050101_g_MissionId )
	
	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050101_g_CopySceneType then											-- 如果在副本里删除任务，则直接传送回
		x050101_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050101_g_Back_X, x050101_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050101_OnCopySceneTimer( sceneId, nowTime )
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

		if leaveTickCount >= x050101_g_CloseTick then										-- 倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050101_g_CloseTick - leaveTickCount ) * x050101_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050101_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050101_NotifyFailTips( sceneId, mems[i], "任务时间已到，离开场景...." )
				x050101_Exit( sceneId, mems[i] )
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
				x050101_NotifyFailTips( sceneId, mems[i], "你不在正确的队伍中，离开场景...." )
				x050101_Exit( sceneId, mems[i] )
			end
		end

		-- 每分钟提示玩家剩余时间
		if mod( x050101_g_TickTime * TickCount, 60 ) < x050101_g_TickTime and TickCount < x050101_g_LimitTotalHoldTime then
			local str = "剩余 " .. ( x050101_g_LimitTotalHoldTime - TickCount ) * x050101_g_TickTime / 60 .. " 分钟..."
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050101_NotifyFailTips( sceneId, mems[i], str )
				end
			end
		end

		local monstercount = GetMonsterCount( sceneId )
		local bossId, GroupID, bossX, bossZ = -1
		local x, z = GetLastPatrolPoint( sceneId, 0 )
		for i = 0, monstercount - 1 do
			if LuaFnGetCopySceneData_Param( sceneId, 14 ) > 0 then
				break
			end

			bossId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, bossId )

			if GroupID == x050101_g_BossGroup then												-- 判断 Boss 是否逃到指定地点
				bossX, bossZ = GetWorldPos( sceneId, bossId )
				--	如果逃到了则
				if (x - bossX) * (x - bossX) + (z - bossZ) * (z - bossZ) < 25 then		-- 离终点不到 5 米
					-- 疯狂逃窜后的发呆是必要的
					NpcToIdle( sceneId, bossId )
					-- 恢复气血
					RestoreHp( sceneId, bossId )
					-- 基础 AI 变为 0
					SetNPCAIType( sceneId, bossId, 0 )
					-- 扩展 AI 变为 129
					SetAIScriptID( sceneId, bossId, 129 )
					-- 删除巡逻路径
					SetPatrolId( sceneId, bossId, -1 )
					LuaFnSetCopySceneData_Param( sceneId, 14, 1 )
				end

				break
			end
		end
	end
end

--**********************************
--检测是否可以提交
--**********************************
function x050101_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050101_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050101_g_MissionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050101_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x050101_NotifyFailTips( sceneId, selfId, "缺少一格任务物品空间" )
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050101_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050101_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x050101_CheckSubmit( sceneId, selfId ) == 1 then
		x050101_NotifyFailBox( sceneId, selfId, targetId, x050101_g_MissionComplete )
		TryRecieveItem( sceneId, selfId, x050101_g_Mail, 1 )
		DelMission( sceneId, selfId, x050101_g_MissionId )
		-- 任务或活动统计
		LuaFnAuditQuest(sceneId, selfId, "竹林")
		local strText = x050101_g_MissionName .. "任务已完成。"
		x050101_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050101_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050101_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

