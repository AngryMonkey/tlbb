--副本任务
--救援门派大难

--************************************************************************
--MisDescBegin

--脚本号
x600026_g_ScriptId = 600026

--任务号
x600026_g_MissionId = 1110

--目标NPC
x600026_g_Name = "佟芙蓉"

--任务等级
x600026_g_MissionLevel = 10000

--任务归类
x600026_g_MissionKind = 50

--是否是精英任务
x600026_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明

x600026_g_IsMissionOkFail			=0	--0 任务完成标记
x600026_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600026_g_Param_sceneid				=2	--2 当前副本任务的场景号
x600026_g_MissionParam_Phase		=3	--3 阶段号 此号用于区分当前任务UI的描述信息
x600026_g_MissionParam_MasterId		=4	--4 门派掌门的NPCId号
x600026_g_MissionParam_MenpaiIndex	=5	--5 某门派的索引，分别用于查找字符串列表中某门派的名称[客户端]以及任务与门派相关的信息[服务器端]

--循环任务的数据索引，里面存着已做的环数
x600026_g_MissionRound = 55
--**********************************以上是动态****************************

--任务文本描述
x600026_g_MissionName = "扩张任务"
x600026_g_MissionInfo = ""													--任务描述
x600026_g_MissionTarget = "%f"												--任务目标
x600026_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600026_g_SubmitInfo = "    事情进展得如何？"								--完成未提交时的npc对话
x600026_g_MissionComplete = "    甚好，此次行动江湖尽知，无不称我帮大德大义。"	--完成任务npc说话的话

x600026_g_StrForePart = 3

--用来保存字符串格式化的数据
x600026_g_FormatList = {
	"",
	"    找%1n援救该门派大劫大难。",
	"    护送%2s弟子走出禁地。",
}

x600026_g_StrList = {
	[0] = "少林",
	[1] = "明教",
	[2] = "丐帮",
	[3] = "武当",
	[4] = "峨嵋",
	[5] = "天龙寺",
	[6] = "星宿",
	[7] = "天山",
	[8] = "逍遥",
}

x600026_g_MenpaiInfo = {
	[0] = { Name = "少林",		NpcId = 1700008,	CopySceneName = "塔林",		Type = FUBEN_TALIN1,		    Map = "tongrenxiang_2.nav",		Exit = "tongrenxiang_2_area.ini",	Monster = "tongrenxiang_2_monster_%d.ini", 	EntrancePos = { x = 28, z = 52 },	BackPos = { x = 38, z = 97 }, },
	[1] = { Name = "明教",		NpcId = 1700009,	CopySceneName = "光明洞",	Type = FUBEN_GUANGMINGDONG1,	Map = "guangmingdong_2.nav",	Exit = "guangmingdong_2_area.ini",	Monster = "guangmingdong_2_monster_%d.ini", EntrancePos = { x = 19, z = 42 },	BackPos = { x = 98, z = 57 }, },
	[2] = { Name = "丐帮",		NpcId = 1700010,	CopySceneName = "酒窖",		Type = FUBEN_JIUJIAO1,			Map = "jiujiao_2.nav",			Exit = "jiujiao_2_area.ini",		Monster = "jiujiao_2_monster_%d.ini", 		EntrancePos = { x = 45, z = 47 },	BackPos = { x = 91, z = 99 }, },
	[3] = { Name = "武当",		NpcId = 1700011,	CopySceneName = "灵性峰",	Type = FUBEN_LINGXINGFENG1,		Map = "lingxingfeng_2.nav",		Exit = "lingxingfeng_2_area.ini",	Monster = "lingxingfeng_2_monster_%d.ini", 	EntrancePos = { x = 42, z = 46 },	BackPos = { x = 77, z = 86 }, },
	[4] = { Name = "峨嵋",		NpcId = 1700012,	CopySceneName = "桃花阵",	Type = FUBEN_TAOHUAZHEN1,		Map = "taohuazhen_2.nav",		Exit = "taohuazhen_2_area.ini",		Monster = "taohuazhen_2_monster_%d.ini", 	EntrancePos = { x = 26, z = 46 },	BackPos = { x = 96, z = 73 }, },
	[5] = { Name = "天龙寺",	NpcId = 1700013,	CopySceneName = "塔底",		Type = FUBEN_TADI1,				Map = "tadi_2.nav",				Exit = "tadi_2_area.ini",			Monster = "tadi_2_monster_%d.ini", 			EntrancePos = { x = 45, z = 48 },	BackPos = { x = 96, z = 67 }, },
	[6] = { Name = "星宿",		NpcId = 1700014,	CopySceneName = "五神洞",	Type = FUBEN_WUSHENDONG1,		Map = "wushendong_2.nav",		Exit = "wushendong_2_area.ini",		Monster = "wushendong_2_monster_%d.ini", 	EntrancePos = { x = 14, z = 40 },	BackPos = { x = 142, z = 56 }, },
	[7] = { Name = "天山",		NpcId = 1700015,	CopySceneName = "折梅峰",	Type = FUBEN_ZHEMEIFENG1,		Map = "zhemeifeng_2.nav",		Exit = "zhemeifeng_2_area.ini",		Monster = "zhemeifeng_2_monster_%d.ini", 	EntrancePos = { x = 29, z = 49 },	BackPos = { x = 90, z = 45 }, },
	[8] = { Name = "逍遥",		NpcId = 1700016,	CopySceneName = "谷底",		Type = FUBEN_GUDI1,				Map = "gudi_2.nav",				Exit = "gudi_2_area.ini",			Monster = "gudi_2_monster_%d.ini", 			EntrancePos = { x = 42, z = 47 },	BackPos = { x = 124, z = 145 }, },
}

-- 通用城市任务脚本
x600026_g_CityMissionScript = 600001
x600026_g_ExpandScript = 600023

--任务奖励

--MisDescEnd
--************************************************************************


x600026_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x600026_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x600026_g_NoUserTime = 120				--副本中没有人后可以继续保存的时间（单位：秒）

x600026_g_ProtegeGroup = 2				-- 被护送的 NPC Group
x600026_g_PatrolId = 0					-- NPC 巡逻路径

--**********************************
--任务入口函数
--**********************************
function x600026_OnDefaultEvent( sceneId, selfId, targetId )
--	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--判断该npc是否是对应任务的npc
--		return
--	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then
		local bDone = x600026_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600026_g_SubmitInfo
		else
			strText = x600026_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		if bDone == 0 and GetMissionParam( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail ) ~= 2 then		--任务未完成
			if GetNumText() == 1 then	-- 这里是点击门派掌门
				x600026_AcceptEnterCopyScene( sceneId, selfId )
				return

--				BeginEvent( sceneId )
--					AddText( sceneId, x600026_g_MissionName )
--					AskEnterCopyScene( sceneId, selfId )
--				EndEvent( )
--				DispatchEventList( sceneId, selfId, targetId )
			end

			if GetNumText() == 2 then	-- 这里是点击被救援弟子
				x600026_StartPatrol( sceneId, selfId, targetId )
				return
			end
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600026_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600026_g_ScriptId, x600026_g_MissionId, bDone )

	--满足任务接收条件
	elseif x600026_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600026_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600026_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600026_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then
		AddNumText( sceneId, x600026_g_ScriptId, x600026_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600026_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600026_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--接受
--**********************************
function x600026_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 40 then
			CallScriptFunction( x600026_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600026_g_MissionId, x600026_g_ScriptId, 0, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600026_g_MissionId, 4 ) -- 注册 x600026_OnLockedTarget 事件
		CallScriptFunction( x600026_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600026_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		-- 随机一个门派
		local MenpaiIndex = random( 0, getn(x600026_g_MenpaiInfo) )
		local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
		if not MenpaiInfo then
			x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_Phase, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_MasterId, MenpaiInfo.NpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex, MenpaiIndex )

		local _, strNpcName, strNpcSceneDesc, nPosX, nPosZ = GetNpcInfoByNpcId(sceneId, MenpaiInfo.NpcId )

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x600026_g_MissionName )
			local missionInfo = format( "    %s有难，命你速去找%s%s（%d，%d）援救，以扬本帮之威名。",
				MenpaiInfo.Name, strNpcSceneDesc, strNpcName, nPosX, nPosZ )

			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    你接受了任务：" .. x600026_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--当锁定一个对象
--**********************************
function x600026_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) < 1 then
		return		-- 没有该任务
	end
	
	-- 如果当前的Npc是副本中的Npc，那么，不能再进入副本了
	--if LuaFnGetSceneType(sceneId) == 1  then
	--	return
	--end
	
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local MenpaiIndex = GetMissionParam( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
		return
	end

	local _, strNpcName, _noUse1, _noUse2, _noUse3, _noUse4, nSceneId = GetNpcInfoByNpcId( sceneId, MenpaiInfo.NpcId )	

	if ( GetName( sceneId, objId ) == strNpcName and  nSceneId == sceneId ) then							-- 掌门
		local missionInfo = format( "    一群身份不明者闯入禁地，困住了我派弟子，请援手我门派。" )

		TAddText( sceneId, missionInfo )
		TAddNumText( sceneId, x600026_g_ScriptId, "大劫大难", 10, 1, x600026_g_ScriptId )
		return
	end

--	--是否是副本
--	local sceneType = LuaFnGetSceneType( sceneId )
--	if sceneType ~= 1 then
--		return
--	end

	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype == MenpaiInfo.Type then
		local GroupID = GetMonsterGroupID( sceneId, objId )
		-- 因为巡逻 NPC 被点中以后不会再次响应点击事件，所以这里不作额外处理
		if GroupID == x600026_g_ProtegeGroup then
			local PlayerGender = GetSex( sceneId, selfId )
			local rank

			if PlayerGender == 0 then
				rank = "侠女"
			else
				rank = "少侠"
			end

			local missionInfo = format( "    多谢%s援手相助，贵帮大义自当结草衔环相报。", rank )

			TAddText( sceneId, missionInfo )
			TAddNumText( sceneId, x600026_g_ScriptId, "请随在下杀出重围", 10, 2, x600026_g_ScriptId )
			return
		end
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600026_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

		-- 这里不把玩家传到上一个场景，因为护送任务中，玩家一旦离开场景
		-- 被护送的 NPC 可能死亡，也可能走到终点，也可能副本已经设置为关闭标记
		-- 都可能导致玩家无意义得进入，所以一旦同意进入副本，一律进入新副本

		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_Param_sceneid, -1 )		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		x600026_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--开始进入护送过程
--**********************************
function x600026_StartPatrol( sceneId, selfId, targetId )
	local flag = LuaFnGetCopySceneData_Param( sceneId, 8 )
	if flag == 1 then															-- 已经开始护送
		return
	end

	local GroupID = GetMonsterGroupID( sceneId, targetId )
	if GroupID == x600026_g_ProtegeGroup then
		--启动该任务的任务时钟器
		StartMissionTimer( sceneId, selfId, x600026_g_MissionId )
		SetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )
		SetPatrolId( sceneId, targetId, x600026_g_PatrolId )							-- 设置巡逻路径
		LuaFnSetCopySceneData_Param( sceneId, 8, 1 )							--标示已经开始护送
		SetUnitReputationID( sceneId, selfId, targetId, GetUnitReputationID( sceneId, selfId, selfId ) )
		SetMonsterFightWithNpcFlag( sceneId, targetId, 1 )				-- 打开允许怪物和怪物战斗的标记
		-- GetMonsterFightWithNpcFlag
	end
end

--**********************************
--创建副本
--**********************************
function x600026_MakeCopyScene( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local MenpaiIndex = GetMissionParam( sceneId, selfId, misIndex, x600026_g_MissionParam_MenpaiIndex )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
		return
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, MenpaiInfo.Map )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600026_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600026_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, MenpaiInfo.Type )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600026_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )							--点击被护送者的次数
	LuaFnSetCopySceneData_Param( sceneId, 7, MenpaiIndex )					--标示这是第几个场景
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							--标示是否已经开始护送

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127

	local mylevel = GetLevel( sceneId, selfId )
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, MenpaiInfo.Exit )
	LuaFnSetSceneLoad_Monster( sceneId, format( MenpaiInfo.Monster, iniLevel ) )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel ) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600026_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600026_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end

end

--**********************************
--副本事件
--**********************************
function x600026_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600026_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600026_g_MissionId )
		local MenpaiIndex = GetMissionParam( sceneId, leaderObjId, misIndex, x600026_g_MissionParam_MenpaiIndex )
		local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
		if not MenpaiInfo then
			x600026_NotifyFailTips( sceneId, leaderObjId, "严重错误！" )
			return
		end

		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600026_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, MenpaiInfo.EntrancePos.x, MenpaiInfo.EntrancePos.z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600026_OnPlayerEnter( sceneId, selfId )
	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
		return
	end

	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) == 0 then				-- 如果进入副本前删除任务，则直接传送回
		x600026_NotifyFailTips( sceneId, selfId, "你当前未接此任务" )
		x600026_BackToCity( sceneId, selfId )
		return
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600026_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x600026_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600026_g_Param_sceneid )

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600026_g_ExpandScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果在副本里删除任务，则直接传送回
		x600026_NotifyFailTips( sceneId, selfId, "任务失败！" )
		x600026_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600026_BackToCity( sceneId, selfId )
	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
		return
	end

	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, MenpaiInfo.BackPos.x, MenpaiInfo.BackPos.z )
end

--**********************************
--继续
--**********************************
function x600026_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600026_g_MissionName )
		AddText( sceneId, x600026_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600026_g_ScriptId, x600026_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600026_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local ret = CallScriptFunction( x600026_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600026_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600026_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600026_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600026_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x600026_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600026_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600026_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新的定时器调用次数

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

		if leaveTickCount >= x600026_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600026_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x600026_g_CloseTick - leaveTickCount ) * x600026_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600026_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

--**********************************
--定时事件
--**********************************
function x600026_OnTimer( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600026_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600026_g_MissionId )

	local MenpaiIndex = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local MenpaiInfo = x600026_g_MenpaiInfo[MenpaiIndex]
	if not MenpaiInfo then
		x600026_NotifyFailTips( sceneId, selfId, "严重错误！" )
		return
	end

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )			-- 不再走此心跳
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype == MenpaiInfo.Type then
		local monstercount = GetMonsterCount( sceneId )
		local i, monsterId, GroupID

		for i = 0, monstercount - 1 do
			monsterId = GetMonsterObjID( sceneId, i )
			GroupID = GetMonsterGroupID( sceneId, monsterId )
			-- 因为巡逻 NPC 被点中以后不会再次响应点击事件，所以这里不作额外处理
			if GroupID == x600026_g_ProtegeGroup then
				local x, z = GetLastPatrolPoint( sceneId, 0 )
				local npcX, npcZ = GetWorldPos( sceneId, monsterId )

				if (x - npcX) * (x - npcX) + (z - npcZ) * (z - npcZ) < 4 then	-- 离终点不到 2 米
					SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 1 )
					ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )		-- 不再走此心跳
					ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 4 )		-- 不再让点击
					LuaFnDeleteMonster( sceneId, monsterId )
					LuaFnSetCopySceneData_Param( sceneId, 4, 1 )				-- 副本关闭标记
					x600026_NotifyFailTips( sceneId, selfId, "任务完成，请回城复命" )
				end

				return
			end
		end

		-- 被护送的 NPC 死亡
		x600026_NotifyFailTips( sceneId, selfId, "任务失败！" )
		SetMissionByIndex( sceneId, selfId, misIndex, x600026_g_IsMissionOkFail, 2 )	-- 任务失败
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	end

	-- 离开了副本或者被护送的 NPC 死亡都停止走计时器
	ResetMissionEvent( sceneId, selfId, x600026_g_MissionId, 5 )						-- 不再走此心跳
end

function x600026_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
