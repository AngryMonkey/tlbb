-- 连环副本任务
-- 熔岩之地

--************************************************************************
--MisDescBegin

-- 脚本号
x050222_g_ScriptId = 050222

-- 任务号
x050222_g_MissionId = 1258					--1256 黄金之链--1257 玄佛珠--1258 熔岩之地

-- 任务目标 NPC
x050222_g_Name = "何悦"

--任务归类
x050222_g_MissionKind = 8

--任务等级
x050222_g_MissionLevel = 10000

-- 任务文本描述
x050222_g_MissionName = "熔岩之地"
x050222_g_MissionInfo = "    "														-- 任务描述
x050222_g_MissionTarget = "    #{LLFBM_80918_3}"						-- 任务目标
--x050222_g_ContinueInfo = "    "					-- 未完成任务的npc对话
x050222_g_SubmitInfo = "#{LLFB_80816_53}"										-- 提交时的答复
--x050222_g_MissionComplete = "   #{LLFB_80816_53}"	--完成任务npc说的话

x050222_g_IsMissionOkFail = 0														-- 0 号位置：当前任务是否完成(0未完成；1完成；2失败)
x050222_g_IsKillBossFire = 1														-- 1 号位置：杀死火焰妖魔数量(0和1)
x050222_g_Param_sceneid = 3															-- 3 号位置：当前任务数据的3位置设置为场景ID

-- 任务完成情况,内容动态刷新,从任务参数的第1位开始
x050222_g_Custom	= { {id="已杀死：#r  火焰妖魔",num=1} }

--MisDescEnd
--************************************************************************

--x050222_g_huangjinzhilian = 40004453	--黄金之链
--x050222_g_heyuanxin = 40004460	--何悦的信
x050222_g_xuanfouzhu = 40004454	--玄佛珠

x050222_g_MonsterSuiCong = "妖魔随从"			--小怪妖魔随从
x050222_g_BossHuoYanYao = "火焰妖魔"			-- boss火焰妖魔

MonsterSuiCongIDTbl = {13240,13241,13242,13243,13244,13245,13246,13247,13248,13249}			--小怪妖魔随从
BossHuoYanYaoIDTbl = {13260,13261,13262,13263,13264,13265,13266,13267,13268,13269}		-- boss火焰妖魔

x050222_g_BossHuoYanYaoPos ={67,48}

x050222_g_MonsterSuiCongPos = {{187,	176},{172,	187},{187,	165},{164,	174},{148,	185},{152,	193},{144,	160},{208,	154},{151,	174},{134,	155},
{181,	168},{177,	146},{143,	128},{153,	124},{151,	113},{171,	117},{187,	94},{191,	80},{204,	97},{212,	102},
{207,	60},{191,	54},{184,	61},{162,	49},{152,	53},{143,	77},{149,	72},{147,	77},{106,	214},{97,	218},
{89,	202},{78,	208},{74,	204},{65,	212},{45,	203},{70,	174},{84,	164},{75,	151},{62,	150},{68,	142},
{58,	118},{69,	115},{89,	113},{98,	110},{91,	98},{54,	114},{43,	105},{52,	99},{69,	105}, --减少1个
{80,	84},{85,	81},{97,	89},{105,	76},{51,	80},{45,	73},{80,	74},{97,	62},{50,	60},{69,	55},
{73,	51},{44,	49},{56,	42},{48,	32},{43,	34},{67,	28},{77,	35},{85,	38},{102,	31},--减少1个
{106,	40},{108,	49},{72,	39},{186,	156},{147,	199},{137,	211},{130,	190},{139,	163},{211,	175},{216,	177},
{220,	167},{67,	88},{64,	91},{91,	130},{85,	133},{179,	101},--减少4个
{186,	104},{139,	91},{215,	88},{176,	53},{135,	96},{139,	52},{135,	56},{133,	206},--减少2个
{221,	198},{215,	192},{206,	199},{194,	205},{191,	213},{196,	193},{185,	198},{205,	182},{220,	184},{177,	207},
{188,	184},{172,	210},{172,	196},{226,	173},{175,	177},{177,	185},{197,	200},{205,	188},{224,	194},{182,	194},
{201,	170},{212,	171},{160,	196},{159,	210},{205,	160},{220,	159},{165,	182},{149,	215},{174,	165},{157,	179},
{143,	205},{137,	198},{144,	191},{155,	167},{178,	154},{195,	151},{213,	151},{135,	171},{142,	166},{157,	151},
{158,	60},{173,	64},{201,	45},{190,	34},{199,	66},{161,	77},{141,	83},{156,	107},{162,	119},{203,	89},
{177,	91},{195,	115},{134,	74},{144,	119},{162,	98},{190,	71},{141,	57},{211,	62},{159,	42},{196,	85},
{71,	45},{49,	50},{65,	58},{80,	54},{82,	46},{74,	60},{56,	60},{62,	42},{52,	40},{80,	33},
{84,	57},{43,	56},{46,	38},{63,	51},{68,	65},{58,	68},{85,	66},{94,	51},{71,	75},{53,	88},
{102,	210},{91,	215},{71,	195},{62,	214},{51,	203},{66,	184},{84,	157},{52,	211},{77,	169},{76,	134},
{214,	189},{221,	187},{207,	197},{217,	197},{201,	202},{221,	204},{208,	209},{215,	210}--加8个
}

x050222_g_NumText_Main = 1					-- 接任务的选项
x050222_g_NumText_EnterCopyScene = 2		-- 要求进入副本的选项

x050222_g_CopySceneMap = "huomuchang.nav"
x050222_g_CopySceneArea = "huomuchang_area.ini"
x050222_g_CopySceneMonsterIni = "huomuchang_monster.ini"

x050222_g_CopySceneType = FUBEN_RONGYANZHIDI		-- 副本类型，定义在ScriptGlobal.lua里面
x050222_g_LimitMembers = 1					-- 可以进副本的最小队伍人数
x050222_g_TickTime = 5						-- 回调脚本的时钟时间（单位：秒/次）
x050222_g_LimitTotalHoldTime = 360			-- 副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050222_g_CloseTick = 6						-- 副本关闭前倒计时（单位：次数）
x050222_g_NoUserTime = 30					-- 副本中没有人后可以继续保存的时间（单位：秒）

x050222_g_Fuben_X = 217
x050222_g_Fuben_Z = 221
x050222_g_Back_X = 295
x050222_g_Back_Z = 68

x050222_g_TakeTimes = 10											-- 每天最多领取次数
--**********************************
-- 任务入口函数
--**********************************
function x050222_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050222_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end

	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) == 0 then
		if numText == x050222_g_NumText_Main then
			if LuaFnGetAvailableItemCount( sceneId, selfId, x050222_g_xuanfouzhu ) < 1 then
				BeginEvent( sceneId )
				AddText( sceneId, "#{LLFB_80816_44}" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			elseif x050222_CheckAccept( sceneId, selfId, targetId ) > 0 then
				--发送任务接受时显示的信息
				BeginEvent( sceneId )
					AddText( sceneId, "#{LLFB_80816_45}" )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050222_g_ScriptId, x050222_g_MissionId )
			end
		end
	else
		if numText == x050222_g_NumText_Main then
			local bDone = x050222_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				--AddText( sceneId, x050222_g_MissionName )
	
				if bDone == 1 then
					AddText( sceneId, x050222_g_SubmitInfo )
				else
						AddText( sceneId, "#{LLFB_80816_47}" )
						AddNumText( sceneId, x050222_g_ScriptId, "前往熔岩之地", 10, x050222_g_NumText_EnterCopyScene )
						EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			--DispatchMissionDemandInfo( sceneId, selfId, targetId, x050222_g_ScriptId, x050222_g_MissionId, bDone )
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x050222_g_ScriptId, x050222_g_MissionId )
		elseif numText == x050222_g_NumText_EnterCopyScene then
			x050222_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他的任务，没有返回 0，有返回 1
--**********************************
function x050222_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	if IsHaveMission( sceneId, selfId, 1256 ) > 0 then
		return 1
	end
	
	if IsHaveMission( sceneId, selfId, 1257 ) > 0 then
		return 1
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050222_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050222_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	-- 不能有其他的任务
	if x050222_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050222_g_ScriptId, x050222_g_MissionName, 4, x050222_g_NumText_Main )
end

--**********************************
-- 检测接受条件
--**********************************
function x050222_CheckAccept( sceneId, selfId, targetId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他的任务
	if x050222_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end
	
	-- 一天只能领 x050222_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_3_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_3_DAYTIME, nowDate )
	end

	--5次
	if takenTimes >= x050222_g_TakeTimes then
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_3}" )
		return 0
	end

	-- 检测玩家是否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_XINSANHUAN_3_LAST )			-- 上一次放弃任务的时间(单位：一刻钟)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()												-- 当前时间(单位：一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位：一刻钟)
	--end modified by zhangguoxin 090208

	if iTime+1  >= CurTime then
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_4}" )
		return 0
	end

	-- 等级达到75
	if GetLevel(sceneId, selfId) < 75 then
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 所有心法达到45
	if x050222_CheckAllXinfaLevel(sceneId, selfId, 45) == 0  then
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 身上任务数量是否达到上限20个
	if GetMissionCount( sceneId, selfId ) >= 20 then						
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_6}" )
		return 0
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050222_g_xuanfouzhu ) < 1 then
		x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_44}" )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x050222_OnAccept( sceneId, selfId, targetId )
	-- 加入任务到玩家列表
	AddMission( sceneId, selfId, x050222_g_MissionId, x050222_g_ScriptId, 1, 0, 0 )			-- kill、area、item
	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) <= 0 then
		return
	end

	-- 一天只能领 x050222_g_TakeTimes 次
	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_3_DAYTIME )
	local takenTimes = floor( DayTimes/100000 )
	DayTimes = (takenTimes+1)*100000 + GetDayTime()
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_3_DAYTIME, DayTimes )

--	SetMissionEvent( sceneId, selfId, x050222_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050222_g_MissionId )

	SetMissionByIndex( sceneId, selfId, misIndex, x050222_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
	SetMissionByIndex( sceneId, selfId, misIndex, x050222_g_IsKillBossFire, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050222_g_Param_sceneid, -1 )		-- 副本号置为 -1

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80816_47}" )
			AddNumText( sceneId, x050222_g_ScriptId, "前往熔岩之地", 10, x050222_g_NumText_EnterCopyScene )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050222_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050222_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050222_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
		-- 将自己传送到副本场景
			if GetMissionParam( sceneId, selfId, misIndex, x050222_g_IsMissionOkFail ) == 2 then
				x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_46}" )--提示任务失败
			elseif IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050222_g_Fuben_X, x050222_g_Fuben_Z )
			else
				x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_46}" )--提示任务失败
			end
			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_48}" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_10}" )
			return
		end
		
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		if not nearMemberCount or nearMemberCount < x050222_g_LimitMembers then
			x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_49}" )
			return
		end

		if not teamMemberCount or teamMemberCount ~= nearMemberCount then
			x050222_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_12}" )
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
			
			if x050222_CheckAllXinfaLevel(sceneId, memberID, 45) == 1 then
				outmessage = outmessage.."#{FB3}"
			else
				outmessage = outmessage.."#{FB4}"
				issatisfy = 0
			end
			
			if IsHaveMission( sceneId, memberID, x050222_g_MissionId ) > 0 then
				local misIndex = GetMissionIndexByID( sceneId, memberID, x050222_g_MissionId )

			 	if GetMissionParam( sceneId, memberID, misIndex, x050222_g_IsMissionOkFail ) == 0 then
			 		if GetMissionParam( sceneId, memberID, misIndex, x050222_g_Param_sceneid ) == -1 then
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
			x050222_NotifyFailBox( sceneId, selfId, targetId, Acceptmessage)
			return
		end
		
		if issatisfy == 0 then
			x050222_NotifyFailBox( sceneId, selfId, targetId, outmessage)
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

		local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
		LuaFnSetSceneLoad_Map( sceneId, x050222_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050222_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050222_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050222_g_CopySceneType )				-- 设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050222_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放，1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, mylevel )				-- 队伍的基础等级
		LuaFnSetCopySceneData_Param( sceneId, 8, iniLevel )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 
		LuaFnSetCopySceneData_Param( sceneId, 13, 0 )							-- 

		LuaFnSetSceneLoad_Area( sceneId, x050222_g_CopySceneArea )

		LuaFnSetSceneLoad_Monster( sceneId, x050222_g_CopySceneMonsterIni )

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050222_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
			AuditXinSanHuanCreateFuben( sceneId, selfId, 3 )
		else
			x050222_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050222_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050222_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	local misIndex  
	for i = 1, validmembercount do 
		if IsHaveMission( sceneId, members[i], x050222_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, members[i], x050222_g_MissionId )
			if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
				--将任务的第1号数据设置为副本的场景号  
				SetMissionByIndex( sceneId, members[i], misIndex, x050222_g_Param_sceneid, destsceneId )
		--		SetMissionEvent( sceneId, members[i], x050222_g_MissionId, 0 )			-- 关心杀怪事件
				NewWorld( sceneId, members[i], destsceneId, x050222_g_Fuben_X, x050222_g_Fuben_Z )
			end  
		end
	end  
end  

--**********************************  
--有玩家进入副本事件  
--**********************************  
function x050222_OnPlayerEnter( sceneId, selfId )  
end

--**********************************
--obj死亡
--**********************************
function x050222_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果是宠物的话，把这个ID设置成主人ID
		selfId = GetPetCreator( sceneId, selfId )
	end
	
	if selfId == -1 then
		return
	end
	
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050222_g_CopySceneType then
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

	if szName == x050222_g_BossHuoYanYao then
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				x050222_NotifyFailTips( sceneId, mems[i], "任务目标完成" )
				x050222_NotifyFailTips( sceneId, mems[i], "已杀死"..x050222_g_BossHuoYanYao.."： 1/1" )
				if IsHaveMission( sceneId, mems[i], x050222_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050222_g_MissionId )
					SetMissionByIndex( sceneId, mems[i], misIndex, x050222_g_IsKillBossFire, 1 )
					SetMissionByIndex( sceneId, mems[i], misIndex, x050222_g_IsMissionOkFail, 1 )	-- 任务完成
				end
			end
		end

		local BroadcastMsg = "#W#{_INFOUSR$N}#{LLFB_80816_51}#{LLFB_80816_52}"
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
		
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )--设置离开场景
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050222_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050222_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050222_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050222_g_Back_X, x050222_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050222_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050222_g_MissionName )
		AddText( sceneId, "good 继续" )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050222_g_ScriptId, x050222_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050222_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) == 0 then
		return
	end
	
	--需要扣除玄佛珠，只扣一个
	if LuaFnDelAvailableItem( sceneId, selfId, x050222_g_xuanfouzhu, 1 ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050222_g_MissionId )
		local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050222_g_Param_sceneid )
	
		-- 设置放弃连环任务的时间
		--begin modified by zhangguoxin 090208
		--local CurTime = GetHourTime()											-- 当前时间
		local CurTime = GetQuarterTime()											-- 当前时间
		--end modified by zhangguoxin 090208
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_3_LAST, CurTime )
	
		--删除玩家任务列表中对应的任务
		DelMission( sceneId, selfId, x050222_g_MissionId )
		
		--是否是所需要的副本
		local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	
		if sceneId == copyscene and fubentype == x050222_g_CopySceneType then											-- 如果在副本里删除任务，则直接传送回
			x050222_NotifyFailTips( sceneId, selfId, "任务失败！" )
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取得副本入口场景号
			NewWorld( sceneId, selfId, oldsceneId, x050222_g_Back_X, x050222_g_Back_Z )
		end
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050222_OnCopySceneTimer( sceneId, nowTime )
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

		if leaveTickCount >= x050222_g_CloseTick then										-- 倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050222_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050222_g_CloseTick - leaveTickCount ) * x050222_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050222_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050222_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local misIndex = 0
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x050222_NotifyFailTips( sceneId, mems[i], "任务时间已到，离开场景...." )
				if IsHaveMission( sceneId, mems[i], x050222_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050222_g_MissionId )
					if GetMissionParam( sceneId, mems[i], misIndex, x050222_g_IsMissionOkFail ) ~= 1 then
						SetMissionByIndex( sceneId, mems[i], misIndex, x050222_g_IsMissionOkFail, 2 )	-- 如果没有完成就设置为失败
					end
				end
				x050222_Exit( sceneId, mems[i] )
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == 1 then									-- 刷怪
		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 7 )
		local iniLevel = LuaFnGetCopySceneData_Param( sceneId, 8 )

		local HuoYanYaoID = BossHuoYanYaoIDTbl[1]
		if BossHuoYanYaoIDTbl[iniLevel] then
			HuoYanYaoID = BossHuoYanYaoIDTbl[iniLevel]
		end
		
		local SuiCongID = MonsterSuiCongIDTbl[1]
		if MonsterSuiCongIDTbl[iniLevel] then
			SuiCongID = MonsterSuiCongIDTbl[iniLevel]
		end

		local monsterID = LuaFnCreateMonster( sceneId, HuoYanYaoID, x050222_g_BossHuoYanYaoPos[1], x050222_g_BossHuoYanYaoPos[2], 14, 269, 050222 )
		SetLevel( sceneId, monsterID, mylevel+3 )--等级比一般小怪高3级
		SetCharacterName( sceneId, monsterID, x050222_g_BossHuoYanYao )
		MonsterTalk(sceneId,monsterID,"熔岩之地","擅入此地者，必将燃为灰烬！")
		
		for i = 1, getn( x050222_g_MonsterSuiCongPos ) do
			monsterID = LuaFnCreateMonster( sceneId, SuiCongID, x050222_g_MonsterSuiCongPos[i][1], x050222_g_MonsterSuiCongPos[i][2], 14, -1, 050222 )
			SetLevel( sceneId, monsterID, mylevel )
			SetCharacterName( sceneId, monsterID, x050222_g_MonsterSuiCong )
		end

	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的队伍号

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050222_NotifyFailTips( sceneId, mems[i], "你不在正确的队伍中，离开场景...." )
				x050222_Exit( sceneId, mems[i] )
			end
		end
		
		--每2分钟提示一次，单数计时
		if mod( TickCount*x050222_g_TickTime, 60 ) == 0 and mod( TickCount*x050222_g_TickTime+60, 120 ) == 0 then
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					local Minute = floor( (360 - TickCount)*x050222_g_TickTime/60 )
					x050222_NotifyFailTips( sceneId, mems[i], "剩余"..Minute.."分钟" )
				end
			end	
		end
		
	end
end

--**********************************
--检测是否可以提交
--**********************************
function x050222_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050222_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050222_g_MissionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050222_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	if LuaFnGetAvailableItemCount( sceneId, selfId, x050222_g_xuanfouzhu ) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050222_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050222_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	if x050222_CheckSubmit( sceneId, selfId ) == 1 then
		--x050222_NotifyFailBox( sceneId, selfId, targetId, x050222_g_MissionComplete )
		if LuaFnDelAvailableItem( sceneId, selfId, x050222_g_xuanfouzhu, 1 ) > 0 then--需要扣除玄佛珠，只扣一个
			DelMission( sceneId, selfId, x050222_g_MissionId )
		
			local exp = GetLevel( sceneId, selfId ) * 3323 - 45613 --参考了老三环副本的经验计算
			--获得经验
			if exp < 1 then
				exp = 1
			end
			AddExp(sceneId, selfId, exp)

			-- 任务或活动统计
			LuaFnAuditQuest(sceneId, selfId, "楼兰连环任务熔岩之地")
		end
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050222_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050222_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--检测心法是不够接任务
--**********************************
function x050222_CheckAllXinfaLevel(sceneId, selfId, level)
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
