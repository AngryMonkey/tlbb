-- 各擂台对应的 脚本

x806012_g_ScriptId = 806012

x806012_g_GlobalChallengeScript = 806010

-- 副本场景
x806012_g_CopyScene = "leitai_2.nav"

-- 副本出口
x806012_g_CopySceneExit = "leitai_2_area.ini"

-- 副本登陆地点
x806012_g_Pos = { x=31, z=32, offset=3.53 }

-- 副本无人时关闭时间 (毫秒)
x806012_g_CopySceneCloseTime = 3000

-- 副本定时器触发周期 (毫秒)
x806012_g_TickTime = 5000

-- 擂台开始时间
x806012_g_BeginTick = 3

-- 副本只剩下一方时的关闭周期 ( 单位为定时器触发周期 )
x806012_g_CloseTick = 3

-- 副本Pvp规则
x806012_g_PvpRuler = 9	--zchw

-- 副本类型号
x806012_g_CopySceneType = FUBEN_PVP_LEITAI

-- 挑战双方阵营号
x806012_g_Camp = { self=10, target=11 }

-- 挑战结束以后回到的位置
x806012_g_BackPos = { sceneId=0, x=187, z=324 }

-- 无敌 BUFF ~~~
x806012_g_Buff = 112

x806012_g_BuffID_ClearChgBodyBuff = 84
-- 让 selfId (及队友) 挑战 targetId (及队友)
function x806012_DoChallenge( sceneId, selfId, targetId )

	-- 先创建一个副本，如果创建成功，则继续，否则返回
	local CreatorGUID = LuaFnObjId2Guid( sceneId, selfId )
	local TargetGUID = LuaFnObjId2Guid( sceneId, targetId )
	LuaFnSetSceneLoad_Map( sceneId, x806012_g_CopyScene )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, CreatorGUID )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x806012_g_CopySceneCloseTime )
	LuaFnSetCopySceneData_PvpRuler( sceneId, x806012_g_PvpRuler )
	LuaFnSetCopySceneData_Timer( sceneId, x806012_g_TickTime )
	LuaFnSetCopySceneData_Param( sceneId, 0, x806012_g_CopySceneType )			-- 设置副本类型
	LuaFnSetCopySceneData_Param( sceneId, 1, x806012_g_ScriptId )				-- 将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )						-- 设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, TargetGUID )				-- 挑战对手的 GUID
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )						-- 设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )						-- 设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )						-- 保存 self 队伍号以及阵营的剩余人数 TeamID * 10 + TeamMemberCount
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )						-- 保存 target 队伍号以及阵营的剩余人数 TeamID * 10 + TeamMemberCount

	LuaFnSetSceneLoad_Area( sceneId, x806012_g_CopySceneExit )					-- 加载擂台出口

	local CopySceneID = LuaFnCreateCopyScene( sceneId )					-- 初始化完成后调用创建副本函数
	if CopySceneID <= 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "擂台太过拥挤，无法容纳更多人战斗" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		DispatchMissionTips( sceneId, targetId )
		return
	end
	--记录统计信息
	LuaFnAuditChallenge(sceneId, selfId, targetId)
end

function x806012_GetSelfTeamId( sceneId )
	return LuaFnGetCopySceneData_Param( sceneId, 6 ) / 10
end

function x806012_GetTargetTeamId( sceneId )
	return LuaFnGetCopySceneData_Param( sceneId, 7 ) / 10
end

function x806012_GetSelfMembersCount( sceneId )
	local selfInfo = LuaFnGetCopySceneData_Param( sceneId, 6 )
	selfInfo = selfInfo - selfInfo / 10 * 10

	if selfInfo < 0 then
		selfInfo = -selfInfo
	end

	return selfInfo
end

function x806012_ModifySelfMembersCount( sceneId, count )
	local selfInfo = LuaFnGetCopySceneData_Param( sceneId, 6 )

	if selfInfo < 0 then
		count = -count
	end

	LuaFnSetCopySceneData_Param( sceneId, 6, selfInfo + count )
end

function x806012_GetTargetMembersCount( sceneId )
	local TargetInfo = LuaFnGetCopySceneData_Param( sceneId, 7 )
	TargetInfo = TargetInfo - TargetInfo / 10 * 10

	if TargetInfo < 0 then
		TargetInfo = -TargetInfo
	end

	return TargetInfo
end

function x806012_ModifyTargetMembersCount( sceneId, count )
	local TargetInfo = LuaFnGetCopySceneData_Param( sceneId, 7 )

	if TargetInfo < 0 then
		count = -count
	end

	LuaFnSetCopySceneData_Param( sceneId, 7, TargetInfo + count )
end

function x806012_CalcPosOffset()
	local offset = x806012_g_Pos.offset * random(100) / 100

	if random(0, 1) > 0 then
		offset = -offset
	end

	return offset
end

--**********************************
--副本事件
--**********************************
function x806012_OnCopySceneReady( sceneId, destsceneId )

	-- 以下获得一个完整的需要进入新区域的人员列表
	local selfId = LuaFnGuid2ObjId( sceneId, LuaFnGetCopySceneData_TeamLeader(destsceneId) )
	local targetId = LuaFnGuid2ObjId( sceneId, LuaFnGetCopySceneData_Param( destsceneId, 3 ) )
	local ChallengeFlag = GetMissionData( sceneId, selfId, MD_TIAOZHAN_SCRIPT )
	local selfCampCount = 0
	local targetCampCount = 0
	local num = 0
	local members = {}
	local membersCount = 0

	-- 将两边的队伍号保存起来
	LuaFnSetCopySceneData_Param( destsceneId, 6, 10 * GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( destsceneId, 7, 10 * GetTeamId( sceneId, targetId ) )

	-- 将符合传送条件的玩家组合起来
	members[0] = selfId
	membersCount = 1
	if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
		num = LuaFnGetTeamSceneMemberCount( sceneId, selfId )
		for	i=0, num-1 do
			members[membersCount] = LuaFnGetTeamSceneMember( sceneId, selfId, i )

			if GetMissionData( sceneId, members[membersCount], MD_TIAOZHAN_SCRIPT ) == ChallengeFlag then
				membersCount = membersCount + 1
			end
		end
	end

	members[membersCount] = targetId
	membersCount = membersCount + 1
	if LuaFnHasTeam( sceneId, targetId ) ~= 0 then
		num = LuaFnGetTeamSceneMemberCount( sceneId, targetId )
		for	i=0, num-1 do
			members[membersCount] = LuaFnGetTeamSceneMember( sceneId, targetId, i )

			if GetMissionData( sceneId, members[membersCount], MD_TIAOZHAN_SCRIPT ) == ChallengeFlag then
				membersCount = membersCount + 1
			end
		end
	end

	for i=0, membersCount-1 do
		-- TODO: 目前是有标记就传送过去，将要判断是否处于一些特定状态，比如交易、摆摊等等状态是不能传送的
		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then
			NewWorld( sceneId, members[i], destsceneId, x806012_g_Pos.x + x806012_CalcPosOffset(), x806012_g_Pos.z + x806012_CalcPosOffset())
		end
	end
end

-- 获得自己站在哪方的信息，1: 挑战方，2: 被挑战方
function x806012_GetMySide( sceneId, selfId )
	local MyGUID = LuaFnObjId2Guid( sceneId, selfId )

	local ChallengerGUID = LuaFnGetCopySceneData_TeamLeader( sceneId )
	local targetGUID = LuaFnGetCopySceneData_Param( sceneId, 3 )

	local MySide = 0

	if targetGUID < 0 then
		targetGUID = targetGUID + 4294967296
	end

	if MyGUID == ChallengerGUID then
		MySide = 1
	elseif MyGUID == targetGUID then
		MySide = 2
	else
		local MyTeamId = GetTeamId( sceneId, selfId )
		local selfTeamId = x806012_GetSelfTeamId( sceneId )
		local targetTeamId = x806012_GetTargetTeamId( sceneId )

		if MyTeamId == selfTeamId then
			MySide = 1
		else	-- 出了问题就便宜被挑战者了，呵呵
			MySide = 2
		end
	end

	return MySide
end

--**********************************
--有玩家进入副本事件
--**********************************
function x806012_OnPlayerEnter( sceneId, selfId )
	-- 设置玩家阵营号，如果玩家的 GUID 等于挑战方或被挑战方 GUID，则直接设置相应阵营号
	-- 否则玩家应该属于某一方的队伍，如果队伍号相等，则赋予该队伍号对应的阵营号
	SetMissionData( sceneId, selfId, MD_PREV_CAMP, GetCurCamp(sceneId, selfId) )

	local MySide = x806012_GetMySide( sceneId, selfId )
	if MySide == 1 then
		SetUnitCampID( sceneId, selfId, selfId, x806012_g_Camp.self )
		SetPvpAuthorizationFlagByID(sceneId, selfId, 2, 1) --2是竞技授权标记
	--	x806012_ModifySelfMembersCount( sceneId, 1 )
	else
		SetUnitCampID( sceneId, selfId, selfId, x806012_g_Camp.target )
		SetPvpAuthorizationFlagByID(sceneId, selfId, 2, 1) --2是竞技授权标记
	--	x806012_ModifyTargetMembersCount( sceneId, 1 )
	end

	-- 加上 15 秒的 buff，也许应该放在 NewWorld 以前，主要害怕如果 NewWorld 失败可能会有一些副作用
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x806012_g_Buff, 0)

	-- 设置默认还魂点为进入场景的擂台
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x806012_g_BackPos.sceneId, x806012_g_BackPos.x, x806012_g_BackPos.z )
	-- 进入校场副本的玩家要清除变身buff，防止不能操作被打死
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x806012_g_BuffID_ClearChgBodyBuff, 0)
end

-- 副本出口离开调用这个函数
function x806012_LeaveScene( sceneId, selfId )
	-- 统计剩余人数
	--local MySide = x806012_GetMySide( sceneId, selfId )
	--if MySide == 1 then
	--	x806012_ModifySelfMembersCount( sceneId, -1 )
	--else
	--	x806012_ModifyTargetMembersCount( sceneId, 1 )
	--end
	SetUnitCampID(sceneId, selfId, selfId, -1)
	SetPvpAuthorizationFlagByID(sceneId, selfId, 2, 0) --2是竞技授权标记

	--LuaFnDelApplyCamp( sceneId, selfId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 83 , 0);
	CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, x806012_g_BackPos.sceneId, x806012_g_BackPos.x, x806012_g_BackPos.z )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x806012_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x806012_OnCopySceneTimer( sceneId, nowTime )
	-- 副本时钟设置
	local tick = LuaFnGetCopySceneData_Param( sceneId, 2 )
	tick = tick + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, tick + 1 )		-- 设置新的定时器调用次数

	-- 副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then																			-- 需要离开
		-- 离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount + 1 )

		if x806012_g_CloseTick <= leaveTickCount then
			-- 将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
			for	i=0, membercount-1 do
				local playerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
				if LuaFnIsObjValid( sceneId, playerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, playerId ) == 1 then
					x806012_LeaveScene( sceneId, playerId )
				end
			end
		else
			-- 通知剩余玩家副本即将关闭
			local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	  		local strText = format( "擂台将在 %d 秒后关闭", (x806012_g_CloseTick-leaveTickCount)*x806012_g_TickTime/1000 )
	  		BeginEvent( sceneId )
	  			AddText( sceneId, strText )
	  		EndEvent( sceneId )

			for	i=0, membercount-1 do
				local member = LuaFnGetCopyScene_HumanObjId( sceneId, i )
				if LuaFnIsObjValid( sceneId, member ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then
	  			DispatchMissionTips( sceneId, member )
				end
			end
		end
	elseif tick > x806012_g_BeginTick then
		-- 统计双方人员数量，当一方无人时，则关闭副本，不考虑断线
		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local selfCount = 0
		local targetCount = 0

		for	i=0, membercount-1 do
			local playerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, playerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, playerId ) == 1 then
	  		if x806012_GetMySide( sceneId, playerId ) == 1 then
	  			selfCount = selfCount + 1
	  		else
	  			targetCount = targetCount + 1
	  		end
			end
		end

		if selfCount < 1 or targetCount < 1 then
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		else
			return
		end

	  	local strText = "比赛结束，擂台即将关闭"
	  	BeginEvent( sceneId )
	  		AddText( sceneId, strText )
	  	EndEvent( sceneId )

		for	i=0, membercount-1 do
			local playerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, playerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, playerId ) == 1 then
	  		DispatchMissionTips( sceneId, playerId )
			end
		end
	else
		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )

		local strText = ""

		if tick < x806012_g_BeginTick then
			strText = format( "比赛将在 %d 秒后开始", (x806012_g_BeginTick-tick)*x806012_g_TickTime/1000 )
		else
			strText = "比赛正式开始"
		end

		BeginEvent(	sceneId )
			AddText( sceneId, strText )
		EndEvent( sceneId )

		for	i=0, membercount-1 do
			local playerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			if LuaFnIsObjValid( sceneId, playerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, playerId ) == 1 then
				DispatchMissionTips( sceneId, playerId )
			end
		end

	end

end
