-- 连环副本任务
-- 黄金之链

--************************************************************************
--MisDescBegin

-- 脚本号
x050220_g_ScriptId = 050220

---- 任务号
x050220_g_MissionId = 1256					--1256 黄金之链--1257 玄佛珠--1258 熔岩之地

---- 上一个任务的 ID
---- g_MissionIdPre = 1260

---- 任务目标 NPC
x050220_g_Name = "何悦"

--任务归类
x050220_g_MissionKind = 8

--任务等级
x050220_g_MissionLevel = 10000

-- 任务文本描述
x050220_g_MissionName = "黄金之链"
x050220_g_MissionInfo = "    "														-- 任务描述
x050220_g_MissionTarget = "    #{LLFBM_80918_1}"						-- 任务目标
--x050220_g_ContinueInfo = "    你们准备好了就请前去竹林消灭红熊王！"					-- 未完成任务的npc对话
x050220_g_SubmitInfo = "#{LLFB_80816_19}"										-- 提交时的答复
x050220_g_MissionComplete = "#{LLFB_80902_1}"	--完成任务npc说的话

x050220_g_IsMissionOkFail = 0														-- 0号索引：当前任务是否完成(0未完成；1完成；2失败)
x050220_g_IsSmallMonster = 1														-- 1 号索引：杀玄雷坡土匪的数量
x050220_g_IsBossNiuQu = 2																-- 2 号索引：杀牛曲的数量
x050220_g_IsBossNiuQi = 3																-- 3 号索引：杀牛奇的数量
x050220_g_IsBossWang = 4																-- 4 号索引：杀王阎的数量
x050220_g_IsFindGoods = 5																-- 5 号索引：是否找到黄金之链
x050220_g_Param_sceneid = 6															-- 6号索引：当前任务数据的6位置设置为场景ID

-- 任务完成情况,内容动态刷新,从任务参数的第1位开始
x050220_g_Custom	= { {id="已杀死：#r  玄雷坡土匪",num=60},{id="  牛曲",num=1},{id="  牛奇",num=1},{id="  王阎",num=1},{id="已找到：#r  黄金之链",num=1} }

--MisDescEnd
--************************************************************************

x050220_g_huangjinzhilian = 40004453	--黄金之链
x050220_g_heyuanxin = 40004460	--何悦的信

x050220_g_SmallMonster = "玄雷坡土匪"			--小怪
x050220_g_NiuQu = "牛曲"							--牛曲
x050220_g_NiuQi = "牛奇"							--牛奇
x050220_g_BossWang = "王阎"					-- boss王阎

SmallMonsterIDTbl = {13000,13001,13002,13003,13004,13005,13006,13007,13008,13009}			--小怪
NiuQuIDTbl = {13020,13021,13022,13023,13024,13025,13026,13027,13028,13029}							--牛曲
NiuQiIDTbl = {13040,13041,13042,13043,13044,13045,13046,13047,13048,13049}							--牛奇
BossWangIDTbl = {13060,13061,13062,13063,13064,13065,13066,13067,13068,13069}					-- boss王阎

x050220_g_SmallMonsterAPos = { --A地小怪坐标
{124,	201},{128,	201},{136,	201},{142,	201},{148,	197},
{148,	193},{148,	189},{148,	186},{148,	181},{143,	174},
{138,	174},{132,	174},{126,	174},{159,	183},{159,	189}}

x050220_g_SmallMonsterBPos = { --B地小怪坐标
{55,	85},{64,	85},{75,	85},{86,	84},{97,	84},
{107,	84},{107,	70},{97,	71},{85,	69},{74,	68},
{64,	68},{55,	68},{53,	56},{75,	57},{85,	58},
{56,	45},{75,	46},{85,	46},{61,	37},{66,	37}}

x050220_g_SmallMonsterCPos = { --C地小怪坐标
{165,	43},{171,	43},{168,	45},{166,	49},{172,	49},
{157,	61},{164,	61},{160,	64},{157,	68},{164,	67},
{176,	60},{182,	61},{179,	63},{176,	66},{182,	66},
{173,	79},{178,	81},{175,	82},{171,	84},{177,	86},
{197,	68},{205,	70},{200,	72},{196,	74},{204,	76}
}

x050220_g_NumText_Main = 1					-- 接任务的选项
x050220_g_NumText_EnterCopyScene = 2		-- 要求进入副本的选项

x050220_g_CopySceneMap = "xuanmuchang.nav"
x050220_g_CopySceneArea = "xuanmuchang_area.ini"
x050220_g_CopySceneMonsterIni = "xuanmuchang_monster.ini"

x050220_g_CopySceneType = FUBEN_HUANGJINZHILIAN		-- 副本类型，定义在ScriptGlobal.lua里面
x050220_g_LimitMembers = 1					-- 可以进副本的最小队伍人数
--x050220_g_LevelLimit = 30					-- 可以进入副本的最低级别
x050220_g_TickTime = 5						-- 回调脚本的时钟时间（单位：秒/次）
x050220_g_LimitTotalHoldTime = 360			-- 副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050220_g_CloseTick = 6						-- 副本关闭前倒计时（单位：次数）
x050220_g_NoUserTime = 30					-- 副本中没有人后可以继续保存的时间（单位：秒）

x050220_g_Fuben_X = 38
x050220_g_Fuben_Z = 220
x050220_g_Back_X = 295
x050220_g_Back_Z = 68

x050220_g_TakeTimes = 10											-- 每天最多领取次数
--**********************************
-- 任务入口函数
--**********************************
function x050220_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		if numText == x050220_g_NumText_Main then
			if x050220_CheckAccept( sceneId, selfId, targetId ) > 0 then
				--发送任务接受时显示的信息
				BeginEvent( sceneId )
					AddText( sceneId, "#{LLFB_80816_2}" )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
			end
		end
	else
		if numText == x050220_g_NumText_Main then
			local bDone = x050220_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				--AddText( sceneId, x050220_g_MissionName )
	
				if bDone == 1 then
					AddText( sceneId, x050220_g_SubmitInfo )
				else
						AddText( sceneId, "#{LLFB_80816_8}" )
						AddNumText( sceneId, x050220_g_ScriptId, "前往玄雷坡", 10, x050220_g_NumText_EnterCopyScene )
						EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			--DispatchMissionDemandInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId, bDone )
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
		elseif numText == x050220_g_NumText_EnterCopyScene then
			x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他的任务，没有返回 0，有返回 1
--**********************************
function x050220_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	for missionId = 1256+1, 1258 do
		if IsHaveMission( sceneId, selfId, missionId ) > 0 then
			return 1
		end
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050220_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	-- 不能有其他的任务
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050220_g_ScriptId, x050220_g_MissionName, 4, x050220_g_NumText_Main )
end

--**********************************
-- 检测接受条件
--**********************************
function x050220_CheckAccept( sceneId, selfId, targetId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他的任务
	if x050220_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end
	
	-- 一天只能领 x050220_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, nowDate )
	end

	--5次
	if takenTimes >= x050220_g_TakeTimes then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_3}" )
		return 0
	end

	-- 检测玩家是否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST )			-- 上一次放弃任务的时间(单位：一刻钟)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()												-- 当前时间(单位：一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位：一刻钟)
	--end modified by zhangguoxin 090208

	if iTime+1  >= CurTime then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_4}" )
		return 0
	end
	
	-- 等级达到75
	if GetLevel(sceneId, selfId) < 75 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 所有心法达到45
	if x050220_CheckAllXinfaLevel(sceneId, selfId, 45) == 0  then
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 身上任务数量是否达到上限20个
	if GetMissionCount( sceneId, selfId ) >= 20 then						
		x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_6}" )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x050220_OnAccept( sceneId, selfId, targetId )
	-- 加入任务到玩家列表
	AddMission( sceneId, selfId, x050220_g_MissionId, x050220_g_ScriptId, 1, 0, 0 )			-- kill、area、item
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	--需要扣除一次中间任务物品黄金之链
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	-- 一天只能领 x050220_g_TakeTimes 次
	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME )
	local takenTimes = floor( DayTimes/100000 )
	DayTimes = (takenTimes+1)*100000 + GetDayTime()
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_DAYTIME, DayTimes )

--	SetMissionEvent( sceneId, selfId, x050220_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )

	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsSmallMonster, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQu, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossNiuQi, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsBossWang, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_Param_sceneid, -1 )		-- 副本号置为 -1

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_8}" )
		AddNumText( sceneId, x050220_g_ScriptId, "前往玄雷坡", 10, x050220_g_NumText_EnterCopyScene )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050220_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
		-- 将自己传送到副本场景
			if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) == 2 then
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			elseif IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			else
				x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_7}" )
			end
			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_9}" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_10}" )
			return
		end
		
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		if not nearMemberCount or nearMemberCount < x050220_g_LimitMembers then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_11}" )
			return
		end

		if not teamMemberCount or teamMemberCount ~= nearMemberCount then
			x050220_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_12}" )
			return
		end
		
		local outmessage = "#{FB0}"
		local issatisfy = 1 --是否满足条件
		local memberID = 0
		local isAccept = 0 --是否有人已经接了任务
		local Acceptmessage = "" --已经接了任务的提示与其他公共提示不同
		for	i = 0, nearMemberCount - 1 do
			memberID = GetNearTeamMember( sceneId, selfId, i )
			outmessage = outmessage.."#r#B队员  "..GetName(sceneId, memberID)
			if GetLevel(sceneId, memberID) >= 75 then
				outmessage = outmessage.."#{FB1}"
			else
				outmessage = outmessage.."#{FB2}"
				issatisfy = 0
			end
			
			if x050220_CheckAllXinfaLevel(sceneId, memberID, 45) == 1 then
				outmessage = outmessage.."#{FB3}"
			else
				outmessage = outmessage.."#{FB4}"
				issatisfy = 0
			end
			
			if IsHaveMission( sceneId, memberID, x050220_g_MissionId ) > 0 then --是否有任务
				local misIndex = GetMissionIndexByID( sceneId, memberID, x050220_g_MissionId )

			 	if GetMissionParam( sceneId, memberID, misIndex, x050220_g_IsMissionOkFail ) == 0 then --是否是失败的任务
			 		if GetMissionParam( sceneId, memberID, misIndex, x050220_g_Param_sceneid ) == -1 then --是否是已接的任务
						outmessage = outmessage.."#{FB5}"
					else
						outmessage = outmessage.."#{FB6}"
						issatisfy = 0
						
						if isAccept == 0 then
							Acceptmessage = "#G"..GetName(sceneId, memberID)
						else
							Acceptmessage = Acceptmessage.."#W、#G"..GetName(sceneId, memberID)
						end
						isAccept = 1
					end
				else
					outmessage = outmessage.."#{FB6}"
					issatisfy = 0
				end
			else
				outmessage = outmessage.."#{FB6}"
				issatisfy = 0
			end
		end

		if isAccept == 1 then
			Acceptmessage = "#{FB7}"..Acceptmessage.."#{FB8}"
			x050220_NotifyFailBox( sceneId, selfId, targetId, Acceptmessage)
			return
		end
		
		if issatisfy == 0 then
			x050220_NotifyFailBox( sceneId, selfId, targetId, outmessage)
			return
		end
		
		--计算副本中怪的等级....
		local mylevel = 0
		local memId
		local tempMemlevel = 0
		local level0 = 0
		local level1 = 0
	
		for	i = 0, nearMemberCount - 1 do
			memId = GetNearTeamMember(sceneId, selfId, i)
			tempMemlevel = GetLevel(sceneId, memId)
			level0 = level0 + (tempMemlevel ^ 4 )
			level1 = level1 + (tempMemlevel ^ 3 )
		end
	
		if level1 == 0 then
			mylevel = 0
		else
			mylevel = level0/level1
		end
	
		if nearMemberCount == -1 then
			mylevel = GetLevel(sceneId, selfId)
		end
	
		--计算等级段....
		local PlayerMaxLevel = GetHumanMaxLevelLimit()
		local iniLevel
		if mylevel < 10 then
			iniLevel = 1
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor((mylevel-75)/5) + 1
			if iniLevel < 0 then
				iniLevel = 1
			elseif iniLevel > 10 then
				iniLevel = 10
			end
		else
			iniLevel = 10
		end
	
		local smallmonsterId = SmallMonsterIDTbl[1]
		if SmallMonsterIDTbl[iniLevel] then
			smallmonsterId = SmallMonsterIDTbl[iniLevel]
		end
		
		local NiuquId = NiuQuIDTbl[1]
		if NiuQuIDTbl[iniLevel] then
			NiuquId = NiuQuIDTbl[iniLevel]
		end
		
		local NiuqiId = NiuQiIDTbl[1]
		if NiuQiIDTbl[iniLevel] then
			NiuqiId = NiuQiIDTbl[iniLevel]
		end
		
		local BossWangID = BossWangIDTbl[1]
		if BossWangIDTbl[iniLevel] then
			BossWangID = BossWangIDTbl[iniLevel]
		end
		
		--PrintStr("smallmonsterId"..smallmonsterId.." NiuquId"..NiuquId.." NiuqiId"..NiuqiId.." BossWangID"..BossWangID.." mylevel"..mylevel.." iniLevel"..iniLevel)

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050220_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050220_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050220_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050220_g_CopySceneType )				-- 设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050220_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放，1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 杀小怪的数量
		LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 是否杀死牛区
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 是否杀死牛奇
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 是否刷出了boss王
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 如果要提醒的话，上次提醒时间（因为每2分提醒一次，需要记录一个上次提醒时间）
		LuaFnSetCopySceneData_Param( sceneId, 12, smallmonsterId )-- 
		LuaFnSetCopySceneData_Param( sceneId, 13, NiuquId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 14, NiuqiId )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 15, BossWangID )		-- 
		LuaFnSetCopySceneData_Param( sceneId, 16, mylevel )			-- 

		LuaFnSetSceneLoad_Area( sceneId, x050220_g_CopySceneArea )

		LuaFnSetSceneLoad_Monster( sceneId, x050220_g_CopySceneMonsterIni )

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050220_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
			AuditXinSanHuanCreateFuben( sceneId, selfId, 1 )
		else
			x050220_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050220_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050220_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	local misIndex
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050220_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, members[i], x050220_g_MissionId )

			if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
				--将任务的第1号数据设置为副本的场景号
				SetMissionByIndex( sceneId, members[i], misIndex, x050220_g_Param_sceneid, destsceneId )
		--		SetMissionEvent( sceneId, members[i], x050220_g_MissionId, 0 )			-- 关心杀怪事件
				NewWorld( sceneId, members[i], destsceneId, x050220_g_Fuben_X, x050220_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050220_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj死亡
--**********************************
function x050220_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果是宠物的话，把这个ID设置成主人ID
		selfId = GetPetCreator( sceneId, selfId )
	end
	
	if selfId == -1 then
		return
	end

	--if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
	--	return
	--end
	
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050220_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--取得杀死怪物的name
	local szName = GetName( sceneId, objId )
	if szName == x050220_g_SmallMonster then--小怪Group
		local KilledMonsterNum = LuaFnGetCopySceneData_Param( sceneId, 7 )
		KilledMonsterNum = KilledMonsterNum + 1
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "已杀死"..szName.."： "..KilledMonsterNum.."/60" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsSmallMonster, KilledMonsterNum )
			end
		end
		
		LuaFnSetCopySceneData_Param( sceneId, 7, KilledMonsterNum ) --设置杀小怪数量
	elseif szName == x050220_g_NiuQu then--牛曲
		LuaFnSetCopySceneData_Param( sceneId, 8, 1 ) --设置牛曲标志
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "已杀死"..szName.."： 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQu, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 9 ) --取得另一个boss标志
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --另一个boss没有死
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQi then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQi, "玄雷坡", "大哥，兄弟替你报仇！")
					MonsterTalk(sceneId,MonsterId,"玄雷坡", "大哥，兄弟替你报仇！")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_NiuQi then--牛奇
		LuaFnSetCopySceneData_Param( sceneId, 9, 1 ) --设置牛奇标志
		
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "已杀死"..szName.."： 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossNiuQi, 1 )
			end
		end
		
		local otherflag = LuaFnGetCopySceneData_Param( sceneId, 8 ) --取得另一个boss标志
		local nMonsterNum = GetMonsterCount(sceneId)

		if otherflag == 0 then --另一个boss没有死
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnSendSpecificImpactToUnit(sceneId,MonsterId,MonsterId,MonsterId,5960,0)
				if GetName( sceneId, MonsterId ) == x050220_g_NiuQu then
					--CallScriptFunction((200060), "Paopao",sceneId, x050220_g_NiuQu, "玄雷坡", "兄弟，大哥替你报仇！")
					MonsterTalk(sceneId,MonsterId,"玄雷坡", "兄弟，大哥替你报仇！")
				end
			end
		else
			for i=0, nMonsterNum-1 do
				local MonsterId = GetMonsterObjID(sceneId,i)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5959)
				LuaFnCancelSpecificImpact(sceneId,MonsterId,5960)
			end
		end
	elseif szName == x050220_g_BossWang then-- boss王阎
		local misIndex = 0
		
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050220_NotifyFailTips( sceneId, mems[i], "已杀死"..szName.."： 1/1" )
				misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
				SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsBossWang, 1 )
				AddMonsterDropItem( sceneId, objId, mems[i], x050220_g_huangjinzhilian )
			end
		end
		
		local BroadcastMsg = "#{LLFB_80816_17}#W#{_INFOUSR$N}#{LLFB_80816_18}"
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )--设置离开场景
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050220_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050220_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050220_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050220_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050220_g_MissionName )
		AddText( sceneId, "good 继续" )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050220_g_ScriptId, x050220_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050220_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050220_g_Param_sceneid )

	-- 设置放弃连环任务的时间
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--end modified by zhangguoxin 090208
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_1_LAST, CurTime )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x050220_g_MissionId )
	
	--需要扣除一次中间任务物品黄金之链
	local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian )
	if num > 0 then
		LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, num )
	end
	
	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050220_g_CopySceneType then											-- 如果在副本里删除任务，则直接传送回
		x050220_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050220_g_Back_X, x050220_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050220_OnCopySceneTimer( sceneId, nowTime )
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

--	local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )

	if leaveFlag == 1 then															-- 需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x050220_g_CloseTick then										-- 倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050220_g_CloseTick - leaveTickCount ) * x050220_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050220_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050220_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local misIndex = 0
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x050220_NotifyFailTips( sceneId, mems[i], "任务时间已到，离开场景...." )
				if IsHaveMission( sceneId, mems[i], x050220_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050220_g_MissionId )
					if GetMissionParam( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
						SetMissionByIndex( sceneId, mems[i], misIndex, x050220_g_IsMissionOkFail, 2 )	-- 如果没有完成就设置为失败
					end
				end
				x050220_Exit( sceneId, mems[i] )
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == 1 then									--开始的时候耍怪。地点A会有15个小怪和BOSS1牛曲，地点B会有20个小怪和BOSS2牛奇，地点C会有25个小怪。
	
		local smallmonsterId = LuaFnGetCopySceneData_Param( sceneId, 12 )
		local NiuquId = LuaFnGetCopySceneData_Param( sceneId, 13 )
		local NiuqiId = LuaFnGetCopySceneData_Param( sceneId, 14 )
		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
		for i = 1, getn( x050220_g_SmallMonsterAPos ) do
			if x050220_g_SmallMonsterAPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterAPos[i][1], x050220_g_SmallMonsterAPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterBPos ) do
			if x050220_g_SmallMonsterBPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterBPos[i][1], x050220_g_SmallMonsterBPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		for i = 1, getn( x050220_g_SmallMonsterCPos ) do
			if x050220_g_SmallMonsterCPos[i] then
				monsterID = LuaFnCreateMonster( sceneId, smallmonsterId, x050220_g_SmallMonsterCPos[i][1], x050220_g_SmallMonsterCPos[i][2], 14, -1, 050220 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050220_g_SmallMonster )
				LuaFnSendSpecificImpactToUnit(sceneId,monsterID,monsterID,monsterID,5959,0)
			end
		end
		
		monsterID = LuaFnCreateMonster( sceneId, NiuquId, 168, 184, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 ) --等级比一般小怪高2级
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQu )
		
		monsterID = LuaFnCreateMonster( sceneId, NiuqiId, 65, 34, 14, -1, 050220 )
		SetLevel( sceneId, monsterID, mylevel+2 )--等级比一般小怪高2级
		SetCharacterName( sceneId, monsterID, x050220_g_NiuQi )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的队伍号
		local oldsceneId

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050220_NotifyFailTips( sceneId, mems[i], "你不在正确的队伍中，离开场景...." )
				x050220_Exit( sceneId, mems[i] )
			end
		end
		
		local monsternum = LuaFnGetCopySceneData_Param( sceneId, 7 )				-- 杀小怪的数量
		local iskillNiuQu = LuaFnGetCopySceneData_Param( sceneId, 8 )				-- 是否杀死牛区
		local iskillNiuQi = LuaFnGetCopySceneData_Param( sceneId, 9 )				-- 是否杀死牛奇
		local isBossWang = LuaFnGetCopySceneData_Param( sceneId, 10 )				-- 是否刷出了boss王
		local NotifyTime = LuaFnGetCopySceneData_Param( sceneId, 11 )				-- 如果要提醒的话，上次提醒时间（因为每2分提醒一次，需要记录一个上次提醒时间）
		
		--每2分钟提示一次，单数计时
		local isPreNotify = 0
		if mod( TickCount*x050220_g_TickTime, 60 ) == 0 and mod( TickCount*x050220_g_TickTime+60, 120 ) == 0 then
			isPreNotify = 1
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					local Minute = floor( (360 - TickCount)*x050220_g_TickTime/60 )
					x050220_NotifyFailTips( sceneId, mems[i], "剩余"..Minute.."分钟" )
				end
			end	
		end

		--小于15分钟的时候，先杀干净了所有怪，需要每2分提醒一次boss王出现时间
		if TickCount < 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 then
			if NotifyTime == 0 then --首次提醒
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Minute = 0
						if 180 - TickCount < 12 then--小于1分钟按1分钟提示
							Minute = 1
						else
							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
						end
						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
					end
				end
				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
--			elseif TickCount - NotifyTime >= 24 then --后面的提醒
--				for	i = 0, membercount - 1 do
--					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
--						local Minute = 0
--						if 180 - TickCount < 12 then--小于1分钟按1分钟提示
--							Minute = 1
--						else
--							Minute = floor( (180 - TickCount)*x050220_g_TickTime/60 )
--						end
--						x050220_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_3}"..Minute.."#{LLFB_80819_4}" )
--					end
--				end
--				LuaFnSetCopySceneData_Param( sceneId, 11, TickCount )
			end
		--大于等于15分钟以后需要判断所有怪是否杀干净，杀干净如果没有出boss王就刷出来
		elseif TickCount >= 180 and monsternum >= 60 and iskillNiuQu == 1 and iskillNiuQi == 1 and isBossWang == 0 then
			local BossWangId = LuaFnGetCopySceneData_Param( sceneId, 15 )
			local mylevel = LuaFnGetCopySceneData_Param( sceneId, 16 )
		
			monsterID = LuaFnCreateMonster( sceneId, BossWangId, 200, 48, 14, 262, 050220 )
			SetLevel( sceneId, monsterID, mylevel+3 )--等级比一般小怪高3级
			SetCharacterName( sceneId, monsterID, x050220_g_BossWang )
			MonsterTalk(sceneId,monsterID,"玄雷坡","哇呀呀，何人敢闯我玄雷坡？！速来受死！")
			
			LuaFnSetCopySceneData_Param( sceneId, 10, 1 )
		end
		
	end
end

--**********************************
--检测是否可以提交
--**********************************
function x050220_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail ) ~= 1 then
		return 0
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050220_g_huangjinzhilian ) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050220_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050220_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x050220_CheckSubmit( sceneId, selfId ) == 1 then
		x050220_NotifyFailBox( sceneId, selfId, targetId, x050220_g_MissionComplete )
		if LuaFnDelAvailableItem( sceneId, selfId, x050220_g_huangjinzhilian, 1 ) > 0 then
			BeginAddItem( sceneId )
			AddItem( sceneId, x050220_g_heyuanxin, 1 )
			local ret = EndAddItem( sceneId, selfId )

			if ret > 0 then
				AddItemListToHuman(sceneId, selfId)
				
				DelMission( sceneId, selfId, x050220_g_MissionId )
				-- 任务或活动统计
				LuaFnAuditQuest(sceneId, selfId, "楼兰连环任务黄金之链")
			else
				x050220_NotifyFailTips( sceneId, selfId, "你的背包满了。")
			end
		end
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050220_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050220_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--检测心法是不够接任务
--**********************************
function x050220_CheckAllXinfaLevel(sceneId, selfId, level)
	local nMenpai = GetMenPai(sceneId, selfId)
	if nMenpai<0 or nMenpai>8   then
		return 0
	end
	
	for i=1, 6 do
		local nXinfaLevel = LuaFnGetXinFaLevel(sceneId, selfId, nMenpai*6 + i)
		if nXinfaLevel < level    then
			return 0
		end
	end
	return 1
end

--**********************************
-- 拾取处理 scene.lua的x888888_OnPlayerPickupItemFromDropBox调用到这里
--**********************************
function x050220_PickupItem(sceneId, selfId, itemId, bagidx )
	if IsHaveMission( sceneId, selfId, x050220_g_MissionId ) <= 0 then
		return
	end
	
	if itemId ~= x050220_g_huangjinzhilian then
		return
	end
	
	x050220_NotifyFailTips( sceneId, selfId, "已找到黄金之链： 1/1" )
	x050220_NotifyFailTips( sceneId, selfId, "任务目标完成" )
	misIndex = GetMissionIndexByID( sceneId, selfId, x050220_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsFindGoods, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050220_g_IsMissionOkFail, 1 )	-- 任务完成
end
