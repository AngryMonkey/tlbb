-- 连环副本任务
-- 玄佛珠

--************************************************************************
--MisDescBegin

-- 脚本号
x050221_g_ScriptId = 050221

-- 任务号
x050221_g_MissionId = 1257					--1256 黄金之链--1257 玄佛珠--1258 熔岩之地

-- 任务目标 NPC
x050221_g_Name = "刘盾"

--任务归类
x050221_g_MissionKind = 8

--任务等级
x050221_g_MissionLevel = 10000

-- 任务文本描述
x050221_g_MissionName = "玄佛珠"
x050221_g_MissionInfo = "    "														-- 任务描述
x050221_g_MissionTarget = "    #{LLFBM_80918_2}"						-- 任务目标
--x050221_g_ContinueInfo = "    你们准备好了就请前去竹林消灭红熊王！"					-- 未完成任务的npc对话
x050221_g_SubmitInfo = "#{LLFB_80816_43}"										-- 提交时的答复
x050221_g_MissionComplete = "#{LLFB_80902_2}"	--完成任务npc说的话

x050221_g_IsMissionOkFail = 0														-- 0 号索引：当前任务是否完成(0未完成；1完成；2失败)
x050221_g_IsBossYaoWang = 1															-- 1 号索引：杀boss洪棘妖王的数量
x050221_g_IsFindGoods = 2																-- 2 号索引：是否找到玄佛珠
x050221_g_Param_sceneid = 3															-- 3 号索引：当前任务数据的3位置设置为场景ID

x050221_g_Custom	= { {id="已杀死：#r  洪棘妖王",num=1},{id="已找到：#r  玄佛珠",num=1} }

--MisDescEnd
--************************************************************************

--x050221_g_huangjinzhilian = 40004453	--黄金之链
x050221_g_heyuanxin = 40004460	--何悦的信
x050221_g_xuanfouzhu = 40004454	--玄佛珠

--x050221_g_yimouzhufeng = 	--引魔珠（风）
--x050221_g_yimouzhuyan = 	--引魔珠（焰）
--x050221_g_yimouzhudi = 	--引魔珠（地）
--x050221_g_yimouzhuxuan = 	--引魔珠（玄）
--x050221_g_yimouzhudu = 	--引魔珠（毒）

x050221_g_Monster15ID = "毒障小怪"			--小怪
x050221_g_Monster10ID = "泽地毒蛛"			--小怪

x050221_g_BossID = {"撕风魔","破焰尊者","裂地行者","武玄将","五毒魔使"}
x050221_g_YinMoZhuID = {40004456,40004459,40004458,40004455,40004457}

x050221_g_BossYaoWang = "洪棘妖王"			-- boss洪棘妖王

Monster15IDTbl = {13080,13081,13082,13083,13084,13085,13086,13087,13088,13089}			--15小怪
Monster10IDTbl = {13100,13101,13102,13103,13104,13105,13106,13107,13108,13109}			--10小怪

BossIDTbl = {{13120,13121,13122,13123,13124,13125,13126,13127,13128,13129},	--风boss
{13200,13201,13202,13203,13204,13205,13206,13207,13208,13209},						--焰boss
{13140,13141,13142,13143,13144,13145,13146,13147,13148,13149},					--地boss
{13160,13161,13162,13163,13164,13165,13166,13167,13168,13169},						--玄boss
{13180,13181,13182,13183,13184,13185,13186,13187,13188,13189}}						--毒boss

BossYaoWangIDTbl = {13220,13221,13222,13223,13224,13225,13226,13227,13228,13229}		-- boss洪棘妖王

x050221_g_BossTalk = {"何人敢打扰吾休息？！", --boss说话
"此处将是尔等长眠之地！",
"擅闯吾之领地者死！",
"又来一个送死的！",
"哈哈，终于又可以伸展手脚了！"}

x050221_g_YaoWangTalk = "何方小辈敢杀吾孩儿，可敢前来受死？！"			-- boss洪棘妖王说话

x050221_g_Pos = {{left={130,191},right={137,200}},--风
 {left={68,132},right={77,142}},--焰
 {left={77,65},right={87,73}},--地
 {left={176,158},right={188,169}},--玄
 {left={175,62},right={188,72}}}--毒

x050221_g_BossYaoWangPos ={127,118}

x050221_g_BossPos ={{132,196},{72,135},{83,72},{182,166},{181,72}}
x050221_g_monster15Pos = {{132,199},{136,200},{138,196},{135,192},{134,189},{128,192},{127,197},{126,202},{142,202},{142,196},{140,190},{124,195},{136,187},{130,204},{143,192},
{75,136},{74,144},{77,138},{68,142},{64,138},{69,128},{79,128},{79,131},{82,139},{76,146},{65,143},{73,133},{73,129},{64,133},{71,140},
{85,73},{82,75},{77,75},{78,79},{79,68},{80,66},{84,64},{87,67},{89,69},{74,70},{76,62},{80,60},{88,62},{89,76},{93,68},
{183,168},{182,172},{178,168},{179,163},{177,160},{180,158},{187,160},{189,163},{190,168},{185,156},{174,166},{191,161},{178,173},{187,173},{191,172},
{184,74},{182,78},{179,75},{179,83},{190,76},{194,74},{191,63},{188,60},{180,61},{177,62},{173,68},{194,62},{175,74},{184,58},{171,63}
}

x050221_g_monster10Pos = {{132,199},{136,200},{138,196},{135,192},{134,189},{128,192},{127,197},{126,202},{142,202},{142,196},
{75,136},{74,144},{77,138},{68,142},{64,138},{69,128},{79,128},{79,131},{82,139},{76,146},
{85,73},{82,75},{77,75},{78,79},{79,68},{80,66},{84,64},{87,67},{89,69},{74,70},
{183,168},{182,172},{178,168},{179,163},{177,160},{180,158},{187,160},{189,163},{190,168},{185,156},
{184,74},{182,78},{179,75},{179,83},{190,76},{194,74},{191,63},{188,60},{180,61},{177,62}
}

x050221_g_NumText_Main = 1					-- 接任务的选项
x050221_g_NumText_EnterCopyScene = 2		-- 要求进入副本的选项

x050221_g_CopySceneMap = "dumuchang.nav"
x050221_g_CopySceneArea = "dumuchang_area.ini"
x050221_g_CopySceneMonsterIni = "dumuchang_monster.ini"

x050221_g_CopySceneType = FUBEN_XUANFOUZHU		-- 副本类型，定义在ScriptGlobal.lua里面
x050221_g_LimitMembers = 1					-- 可以进副本的最小队伍人数
x050221_g_TickTime = 5						-- 回调脚本的时钟时间（单位：秒/次）
x050221_g_LimitTotalHoldTime = 360			-- 副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050221_g_CloseTick = 6						-- 副本关闭前倒计时（单位：次数）
x050221_g_NoUserTime = 30					-- 副本中没有人后可以继续保存的时间（单位：秒）

x050221_g_Fuben_X = 220
x050221_g_Fuben_Z = 217
x050221_g_Back_X = 122
x050221_g_Back_Z = 56

x050221_g_TakeTimes = 10											-- 每天最多领取次数
--**********************************
-- 任务入口函数
--**********************************
function x050221_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050221_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end
	
	local numText = GetNumText()

	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) == 0 then
		if numText == x050221_g_NumText_Main then
			if LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_heyuanxin ) < 1 then
				BeginEvent( sceneId )
				AddText( sceneId, "#{LLFB_80816_21}" )
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			elseif x050221_CheckAccept( sceneId, selfId, targetId ) > 0 then
				--发送任务接受时显示的信息
				BeginEvent( sceneId )
					AddText( sceneId, "#{LLFB_80816_22}" )
				EndEvent( )
				DispatchMissionInfo( sceneId, selfId, targetId, x050221_g_ScriptId, x050221_g_MissionId )
			end
		end
	else
		if numText == x050221_g_NumText_Main then
			local bDone = x050221_CheckSubmit( sceneId, selfId )

			BeginEvent( sceneId )
				--AddText( sceneId, x050221_g_MissionName )
	
				if bDone == 1 then
					AddText( sceneId, x050221_g_SubmitInfo )
				else
						AddText( sceneId, "#{LLFB_80816_24}" )
						AddNumText( sceneId, x050221_g_ScriptId, "前往毒障泽地", 10, x050221_g_NumText_EnterCopyScene )
						EndEvent( sceneId )
					DispatchEventList( sceneId, selfId, targetId )
					return
				end
			EndEvent( )
			--DispatchMissionDemandInfo( sceneId, selfId, targetId, x050221_g_ScriptId, x050221_g_MissionId, bDone )
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x050221_g_ScriptId, x050221_g_MissionId )
		elseif numText == x050221_g_NumText_EnterCopyScene then
			x050221_AcceptEnterCopyScene( sceneId, selfId, targetId )
		end
	end
end

--**********************************
-- 不能有其他的任务，没有返回 0，有返回 1
--**********************************
function x050221_CheckConflictMission( sceneId, selfId )
	local missionId = 0

	if IsHaveMission( sceneId, selfId, 1256 ) > 0 then
		return 1
	end
	
	if IsHaveMission( sceneId, selfId, 1258 ) > 0 then
		return 1
	end

	return 0
end

--**********************************
-- 列举事件
--**********************************
function x050221_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050221_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	-- 不能有其他的任务
	if x050221_CheckConflictMission( sceneId, selfId ) == 1 then
		return
	end

	AddNumText( sceneId, x050221_g_ScriptId, x050221_g_MissionName, 4, x050221_g_NumText_Main )
end

--**********************************
-- 检测接受条件
--**********************************
function x050221_CheckAccept( sceneId, selfId, targetId )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) > 0 then
		return 0
	end

	-- 不能有其他的任务
	if x050221_CheckConflictMission( sceneId, selfId ) == 1 then
		return 0
	end
	
	-- 一天只能领 x050221_g_TakeTimes 次
	local DayTimes, oldDate, nowDate, takenTimes

	DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_2_DAYTIME )
	oldDate = mod( DayTimes, 100000 )
	takenTimes = floor( DayTimes/100000 )

	nowDate = GetDayTime()
	if nowDate ~= oldDate then
		takenTimes = 0
		SetMissionData( sceneId, selfId, MD_XINSANHUAN_2_DAYTIME, nowDate )
	end

	--5次
	if takenTimes >= x050221_g_TakeTimes then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_3}" )
		return 0
	end

	-- 检测玩家是否符合刚放弃任务
	local iTime = GetMissionData( sceneId, selfId, MD_XINSANHUAN_2_LAST )			-- 上一次放弃任务的时间(单位：一刻钟)
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()												-- 当前时间(单位：一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(单位：一刻钟)
	--end modified by zhangguoxin 090208

	if iTime+1  >= CurTime then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_4}" )
		return 0
	end

	-- 等级达到75
	if GetLevel(sceneId, selfId) < 75 then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 所有心法达到45
	if x050221_CheckAllXinfaLevel(sceneId, selfId, 45) == 0  then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_5}" )
		return 0
	end

	-- 身上任务数量是否达到上限20个
	if GetMissionCount( sceneId, selfId ) >= 20 then						
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_6}" )
		return 0
	end
	
	-- 身上任务物品栏数量
	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x050221_NotifyFailTips( sceneId, selfId, "缺少一格任务物品空间" )
		return 0
	end
	
	if LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_heyuanxin ) < 1 then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_21}" )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x050221_OnAccept( sceneId, selfId, targetId )
	if LuaFnDelAvailableItem( sceneId, selfId, x050221_g_heyuanxin, 1 ) <= 0 then--需要扣除何悦的信
		x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_21}" )
		return
	end

	-- 加入任务到玩家列表
	AddMission( sceneId, selfId, x050221_g_MissionId, x050221_g_ScriptId, 1, 0, 0 )			-- kill、area、item
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) <= 0 then
		return
	end

	-- 一天只能领 x050221_g_TakeTimes 次
	local DayTimes = GetMissionData( sceneId, selfId, MD_XINSANHUAN_2_DAYTIME )
	local takenTimes = floor( DayTimes/100000 )
	DayTimes = (takenTimes+1)*100000 + GetDayTime()
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_2_DAYTIME, DayTimes )

--	SetMissionEvent( sceneId, selfId, x050221_g_MissionId, 4 ) -- 注册 OnLockedTarget 事件

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050221_g_MissionId )

	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_IsMissionOkFail, 0 )	-- 任务完成情况置为未完成
	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_Param_sceneid, -1 )		-- 副本号置为 -1
	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_IsBossYaoWang, 0 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_IsFindGoods, 0 )
	
	--需要扣除一次引魔珠，上次任务失败可能身上还有引魔珠存在
	for i = 1, getn( x050221_g_YinMoZhuID ) do
		local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_YinMoZhuID[i] )
		if num > 0 then
			LuaFnDelAvailableItem( sceneId, selfId, x050221_g_YinMoZhuID[i], num )
		end
	end
	
	--给引魔珠（风）
	BeginAddItem( sceneId )
	AddItem( sceneId, x050221_g_YinMoZhuID[1], 1 )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then
		x050221_NotifyFailBox( sceneId, selfId, targetId, "你的背包满了。" )
		return
	end
	AddItemListToHuman(sceneId, selfId)

	--显示内容告诉玩家已经接受了任务
	BeginEvent( sceneId )
		AddText( sceneId, "#{LLFB_80816_24}" )
		AddNumText( sceneId, x050221_g_ScriptId, "前往毒障泽地", 10, x050221_g_NumText_EnterCopyScene )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 请求进入副本场景
--**********************************
function x050221_AcceptEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) > 0 then					-- 有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x050221_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x050221_g_Param_sceneid )
		if copysceneid >= 0 then												-- 进过副本
		-- 将自己传送到副本场景
			if GetMissionParam( sceneId, selfId, misIndex, x050221_g_IsMissionOkFail ) == 2 then
				x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_23}" )
			elseif IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x050221_g_Fuben_X, x050221_g_Fuben_Z )
			else
				x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_23}" )
			end
			return
		end

		if LuaFnHasTeam( sceneId, selfId ) == 0 then
			x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_25}" )
			return
		end

		if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
			x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_10}" )
			return
		end
		
		local teamMemberCount = GetTeamMemberCount(sceneId, selfId);
		local nearMemberCount = GetNearTeamCount(sceneId, selfId);
		if not nearMemberCount or nearMemberCount < x050221_g_LimitMembers then
			x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_26}" )
			return
		end

		if not teamMemberCount or teamMemberCount ~= nearMemberCount then
			x050221_NotifyFailBox( sceneId, selfId, targetId, "#{LLFB_80816_12}" )
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
			
			if x050221_CheckAllXinfaLevel(sceneId, memberID, 45) == 1 then
				outmessage = outmessage.."#{FB3}"
			else
				outmessage = outmessage.."#{FB4}"
				issatisfy = 0
			end
			
			if IsHaveMission( sceneId, memberID, x050221_g_MissionId ) > 0 then
				local misIndex = GetMissionIndexByID( sceneId, memberID, x050221_g_MissionId )

			 	if GetMissionParam( sceneId, memberID, misIndex, x050221_g_IsMissionOkFail ) == 0 then
			 		if GetMissionParam( sceneId, memberID, misIndex, x050221_g_Param_sceneid ) == -1 then
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
			x050221_NotifyFailBox( sceneId, selfId, targetId, Acceptmessage)
			return
		end
		
		if issatisfy == 0 then
			x050221_NotifyFailBox( sceneId, selfId, targetId, outmessage)
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
		LuaFnSetSceneLoad_Map( sceneId, x050221_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
		LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
		LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050221_g_NoUserTime * 1000 )
		LuaFnSetCopySceneData_Timer( sceneId, x050221_g_TickTime * 1000 )
		LuaFnSetCopySceneData_Param( sceneId, 0, x050221_g_CopySceneType )				-- 设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
		LuaFnSetCopySceneData_Param( sceneId, 1, x050221_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
		LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
		LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
		LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放，1关闭
		LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
		LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	-- 保存队伍号
		LuaFnSetCopySceneData_Param( sceneId, 7, mylevel )				-- 队伍的基础等级
		LuaFnSetCopySceneData_Param( sceneId, 8, iniLevel )				-- 
		LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							-- 风
		LuaFnSetCopySceneData_Param( sceneId, 10, 0 )							-- 焰
		LuaFnSetCopySceneData_Param( sceneId, 11, 0 )							-- 地
		LuaFnSetCopySceneData_Param( sceneId, 12, 0 )							-- 玄
		LuaFnSetCopySceneData_Param( sceneId, 13, 0 )							-- 毒
		LuaFnSetCopySceneData_Param( sceneId, 14, 0 )							-- 是否杀死破焰尊者
		LuaFnSetCopySceneData_Param( sceneId, 15, 0 )							-- 是否引出洪棘妖王
		LuaFnSetCopySceneData_Param( sceneId, 16, 0 )							-- 首次提醒时间

		LuaFnSetSceneLoad_Area( sceneId, x050221_g_CopySceneArea )

		LuaFnSetSceneLoad_Monster( sceneId, x050221_g_CopySceneMonsterIni )

		local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
		if bRetSceneID > 0 then
			x050221_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
			AuditXinSanHuanCreateFuben( sceneId, selfId, 2 )
		else
			x050221_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
		end
	end
end

--**********************************
--副本事件
--**********************************
function x050221_OnCopySceneReady( sceneId, destsceneId )
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
		if IsHaveMission( sceneId, member, x050221_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	local misIndex
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050221_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, members[i], x050221_g_MissionId )
			if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
				--将任务的第1号数据设置为副本的场景号

				SetMissionByIndex( sceneId, members[i], misIndex, x050221_g_Param_sceneid, destsceneId )
		--		SetMissionEvent( sceneId, members[i], x050221_g_MissionId, 0 )			-- 关心杀怪事件
				NewWorld( sceneId, members[i], destsceneId, x050221_g_Fuben_X, x050221_g_Fuben_Z )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050221_OnPlayerEnter( sceneId, selfId )
end

--**********************************
--obj死亡
--**********************************
function x050221_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
	local objType = GetCharacterType( sceneId, selfId )
	if objType == 3 then --如果是宠物的话，把这个ID设置成主人ID
		selfId = GetPetCreator( sceneId, selfId )
	end
	
	if selfId == -1 then
		return
	end
	
	--if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) <= 0 then
	--	return
	--end
	
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050221_g_CopySceneType then
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
	
	for i = 1, getn( x050221_g_BossID ) do
		if szName == x050221_g_BossID[i] then
		
			local dropthing = 0
			if i == 1 then--风
				dropthing = x050221_g_YinMoZhuID[3]
			elseif i == 2 then--焰
			elseif i == 3 then--地
				dropthing = x050221_g_YinMoZhuID[5]
			elseif i == 4 then--玄
				dropthing = x050221_g_YinMoZhuID[2]
			elseif i == 5 then--毒
				dropthing = x050221_g_YinMoZhuID[4]
			end
			
			for j = 0, num - 1 do
				if LuaFnIsObjValid( sceneId, mems[j] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[j] ) == 1 then						-- 不在场景的不做此操作
					x050221_NotifyFailTips( sceneId, mems[j], "已杀死"..x050221_g_BossID[i].."： 1/1" )
				end
			end
			
			if i == 2 then--杀死了破焰尊者
				LuaFnSetCopySceneData_Param( sceneId, 14, 1 )
			else
				for j = 0, num - 1 do
					if LuaFnIsObjValid( sceneId, mems[j] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[j] ) == 1 then						-- 不在场景的不做此操作
						AddMonsterDropItem( sceneId, objId, mems[j], dropthing )
					end
				end
			end
			
			return
		end
	end
	
	if szName == x050221_g_BossYaoWang then
		local misIndex = 0
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then						-- 不在场景的不做此操作
				--x050221_NotifyFailTips( sceneId, mems[i], "任务目标完成" )
				x050221_NotifyFailTips( sceneId, mems[i], "已杀死"..x050221_g_BossYaoWang.."： 1/1" )
				if IsHaveMission( sceneId, mems[i], x050221_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050221_g_MissionId )
					SetMissionByIndex( sceneId, mems[i], misIndex, x050221_g_IsBossYaoWang, 1 )--设置杀boss标志				
					--SetMissionByIndex( sceneId, mems[i], misIndex, x050221_g_IsMissionOkFail, 1 )	-- 任务完成
				end
				AddMonsterDropItem( sceneId, objId, mems[i], x050221_g_xuanfouzhu )
			end
		end
		
		local BroadcastMsg = "#{LLFB_80816_41}#W#{_INFOUSR$N}#{LLFB_80816_42}"
		BroadcastMsg = gsub( BroadcastMsg, "%$N", GetName( sceneId, selfId ) )
		BroadMsgByChatPipe( sceneId, selfId, BroadcastMsg, 4 )
		
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )--设置离开场景
		return
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050221_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050221_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--离开副本
--**********************************
function x050221_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x050221_g_Back_X, x050221_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x050221_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x050221_g_MissionName )
		AddText( sceneId, "good 继续" )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x050221_g_ScriptId, x050221_g_MissionId )
end

--**********************************
--放弃
--**********************************
function x050221_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050221_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050221_g_Param_sceneid )

	-- 设置放弃连环任务的时间
	--begin modified by zhangguoxin 090208
	--local CurTime = GetHourTime()											-- 当前时间
	local CurTime = GetQuarterTime()											-- 当前时间
	--begin modified by zhangguoxin 090208
	SetMissionData( sceneId, selfId, MD_XINSANHUAN_2_LAST, CurTime )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x050221_g_MissionId )
	
	--需要扣除中间任务物品，引魔珠
	for i = 1, getn( x050221_g_YinMoZhuID ) do
		local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_YinMoZhuID[i] )
		if num > 0 then
			LuaFnDelAvailableItem( sceneId, selfId, x050221_g_YinMoZhuID[i], num )
		end
	end
	
	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )

	if sceneId == copyscene and fubentype == x050221_g_CopySceneType then											-- 如果在副本里删除任务，则直接传送回
		x050221_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		-- 取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x050221_g_Back_X, x050221_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x050221_OnCopySceneTimer( sceneId, nowTime )
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

		if leaveTickCount >= x050221_g_CloseTick then										-- 倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050221_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050221_g_CloseTick - leaveTickCount ) * x050221_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x050221_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050221_g_LimitTotalHoldTime then									-- 副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local misIndex = 0
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x050221_NotifyFailTips( sceneId, mems[i], "任务时间已到，离开场景...." )
				if IsHaveMission( sceneId, mems[i], x050221_g_MissionId ) > 0 then
					misIndex = GetMissionIndexByID( sceneId, mems[i], x050221_g_MissionId )
					if GetMissionParam( sceneId, mems[i], misIndex, x050221_g_IsMissionOkFail ) ~= 1 then
						SetMissionByIndex( sceneId, mems[i], misIndex, x050221_g_IsMissionOkFail, 2 )	-- 如果没有完成就设置为失败
					end
				end
				x050221_Exit( sceneId, mems[i] )
			end
		end
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的队伍号

		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and oldteamid ~= GetTeamId( sceneId, mems[i] ) then
				x050221_NotifyFailTips( sceneId, mems[i], "你不在正确的队伍中，离开场景...." )
				x050221_Exit( sceneId, mems[i] )
			end
		end
		
		local isFireBoss = LuaFnGetCopySceneData_Param( sceneId, 14 )				-- 是否杀死破焰尊者
		local isYaoWang = LuaFnGetCopySceneData_Param( sceneId, 15 )			-- 是否引出洪棘妖王
		local NotifyTime = LuaFnGetCopySceneData_Param( sceneId, 16 )			-- 提醒时间
		
		--每2分钟提示一次，单数计时
		local isPreNotify = 0
		if mod( TickCount*x050221_g_TickTime, 60 ) == 0 and mod( TickCount*x050221_g_TickTime+60, 120 ) == 0 then
			isPreNotify = 1
			for	i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					local Minute = floor( (360 - TickCount)*x050221_g_TickTime/60 )
					x050221_NotifyFailTips( sceneId, mems[i], "剩余"..Minute.."分钟" )
				end
			end	
		end

		--小于15分钟的时候，杀死了破焰尊者，需要每2分提醒一次boss出现时间
		if TickCount < 180 and isFireBoss == 1 then
			if NotifyTime == 0 then --首次提醒
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Minute = 0
						if 180 - TickCount < 12 then--小于1分钟按1分钟提示
							Minute = 1
						else
							Minute = floor( (180 - TickCount)*x050221_g_TickTime/60 )
						end
						x050221_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_6}"..Minute.."#{LLFB_80819_7}" )
					end
				end
				LuaFnSetCopySceneData_Param( sceneId, 16, TickCount )
--			elseif TickCount - NotifyTime >= 24 then --后面的提醒
--				for	i = 0, membercount - 1 do
--					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
--						local Minute = 0
--						if 180 - TickCount < 12 then--小于1分钟按1分钟提示
--							Minute = 1
--						else
--							Minute = floor( (180 - TickCount)*x050221_g_TickTime/60 )
--						end
--						x050221_NotifyFailTips( sceneId, mems[i], "#{LLFB_80819_6}"..Minute.."#{LLFB_80819_7}" )
--					end
--				end
--				LuaFnSetCopySceneData_Param( sceneId, 16, TickCount )
			end
		--大于等于15分钟
		elseif TickCount >= 180 and isFireBoss == 1 and isYaoWang == 0 then
			local mylevel = LuaFnGetCopySceneData_Param( sceneId, 7 )
			local iniLevel = LuaFnGetCopySceneData_Param( sceneId, 8 )

			local YaoWangID = BossYaoWangIDTbl[1]
			if BossYaoWangIDTbl[iniLevel] then
				YaoWangID = BossYaoWangIDTbl[iniLevel]
			end

			local monsterID = LuaFnCreateMonster( sceneId, YaoWangID, x050221_g_BossYaoWangPos[1], x050221_g_BossYaoWangPos[2], 14, 268, 050221 )
			SetLevel( sceneId, monsterID, mylevel+3 )--等级比一般小怪高3级
			SetCharacterName( sceneId, monsterID, x050221_g_BossYaoWang )
			MonsterTalk(sceneId,monsterID,"毒障泽地",x050221_g_YaoWangTalk)
			
			LuaFnSetCopySceneData_Param( sceneId, 15, 1 )
		end
	end
end

--**********************************
--检测是否可以提交
--**********************************
function x050221_CheckSubmit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050221_g_MissionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x050221_g_IsMissionOkFail ) ~= 1 then
		return 0
	end

	if LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_xuanfouzhu ) < 1 then
		return 0
	end

	return 1
end

--**********************************
--提交
--**********************************
function x050221_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x050221_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	if x050221_CheckSubmit( sceneId, selfId ) == 1 then
		x050221_NotifyFailBox( sceneId, selfId, targetId, x050221_g_MissionComplete )

		--需要扣除一次中间任务物品引魔珠，没有就不管它
		for i = 1, getn( x050221_g_YinMoZhuID ) do
			local num = LuaFnGetAvailableItemCount( sceneId, selfId, x050221_g_YinMoZhuID[i] )
			if num > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, x050221_g_YinMoZhuID[i], num )
			end
		end

		DelMission( sceneId, selfId, x050221_g_MissionId )
		-- 任务或活动统计
		LuaFnAuditQuest(sceneId, selfId, "楼兰连环任务玄佛珠")
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x050221_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x050221_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--检测心法是不够接任务
--**********************************
function x050221_CheckAllXinfaLevel(sceneId, selfId, level)
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
--判断产生monster函数，由引魔珠脚本338510~338514调用到这里
--**********************************
function x050221_IsMonster(sceneId, selfId, flag)

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_31}" )
		return 0
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050221_g_CopySceneType then
		x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_31}" )
		return 0
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	local nAliveMonsterNum = nMonsterNum
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if (LuaFnIsCharacterLiving( sceneId, MonsterId ) == 0) or (GetName(sceneId,MonsterId) == "任道清") then
			nAliveMonsterNum = nAliveMonsterNum - 1
		end
	end
	if nAliveMonsterNum > 0 then
		--PrintStr(nMonsterNum)
		x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80819_5}" )
		return 0
	end

	local posX,posZ = GetWorldPos(sceneId, selfId)
	local inpostype = -1
	
	for i = 1, getn( x050221_g_Pos ) do
		if x050221_g_Pos[i].left[1] <= posX and posX <= x050221_g_Pos[i].right[1] and x050221_g_Pos[i].left[2] <= posZ and posZ <= x050221_g_Pos[i].right[2] then
			inpostype = i
			break
		end
	end
	
	if inpostype == -1 then
		x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_31}" )
		return 0
	end
	
	return 1
end
	
function x050221_GenerateMonster(sceneId, selfId, flag)

	local posX,posZ = GetWorldPos(sceneId, selfId)
	local inpostype = -1
	
	for i = 1, getn( x050221_g_Pos ) do
		if x050221_g_Pos[i].left[1] <= posX and posX <= x050221_g_Pos[i].right[1] and x050221_g_Pos[i].left[2] <= posZ and posZ <= x050221_g_Pos[i].right[2] then
			inpostype = i
			break
		end
	end
	
	if inpostype == -1 then
		x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_31}" )
		return
	end

	local ret = 0 --返回值，1引魔珠会消失，0不会消失
	if flag >= 1 and flag <= 5 then
		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 7 )
		local iniLevel = LuaFnGetCopySceneData_Param( sceneId, 8 )
		local isboss = LuaFnGetCopySceneData_Param( sceneId, 8+flag )
		local monsterID = 0
		
		local monster15ID = Monster15IDTbl[1]
		if Monster15IDTbl[iniLevel] then
			monster15ID = Monster15IDTbl[iniLevel]
		end
		
		local monster10ID = Monster10IDTbl[1]
		if Monster10IDTbl[iniLevel] then
			monster10ID = Monster10IDTbl[iniLevel]
		end
		
		local bossID = BossIDTbl[flag][1]
		if BossIDTbl[flag][iniLevel] then
			bossID = BossIDTbl[flag][iniLevel]
		end
		
		--PrintStr("monster15ID "..monster15ID.."monster10ID "..monster10ID.."bossID "..bossID)

		if inpostype == flag then--地点优先，是否杀boss其次
			if isboss == 0 then--没有引出boss
				for i = (flag-1)*15+1,flag*15  do
					monsterID = LuaFnCreateMonster( sceneId, monster15ID, x050221_g_monster15Pos[i][1], x050221_g_monster15Pos[i][2], 14, -1, 050221 )
					SetLevel( sceneId, monsterID, mylevel )
					SetCharacterName( sceneId, monsterID, x050221_g_Monster15ID )
				end
			
				local extAIScript = -1
				if flag == 1 then--风
					extAIScript = 263
				elseif flag == 2 then--焰
					extAIScript = 267
				elseif flag == 3 then--地
					extAIScript = 264
				elseif flag == 4 then--玄
					extAIScript = 265
				elseif flag == 5 then--毒
					extAIScript = 266
				end

				monsterID = LuaFnCreateMonster( sceneId, bossID, x050221_g_BossPos[flag][1], x050221_g_BossPos[flag][2], 14, extAIScript, 050221 )
				SetLevel( sceneId, monsterID, mylevel+2 )--等级比一般小怪高2级
				SetCharacterName( sceneId, monsterID, x050221_g_BossID[flag] )
				MonsterTalk(sceneId,monsterID,"毒障泽地",x050221_g_BossTalk[flag])
				
				LuaFnSetCopySceneData_Param( sceneId, 8+flag, 1)
				
				if flag == 1 then--风
					x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_29}" )
				elseif flag == 2 then--焰
					x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_38}" )
				elseif flag == 3 then--地
					x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_32}" )
				elseif flag == 4 then--玄
					x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_34}" )
				elseif flag == 5 then--毒
					x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_36}" )
				end
				
				ret = 1
			else--已经引出boss
				for i = (flag-1)*10+1,flag*10  do
					monsterID = LuaFnCreateMonster( sceneId, monster10ID, x050221_g_monster10Pos[i][1], x050221_g_monster10Pos[i][2], 14, -1, 050221 )
					SetLevel( sceneId, monsterID, mylevel )
					SetCharacterName( sceneId, monsterID, x050221_g_Monster10ID )
				end
				
				x050221_NotifyFailTips( sceneId, selfId, x050221_g_BossID[flag].."#{LLFB_80816_28}" )
			end
		else--不是正确地点
			for i = (inpostype-1)*10+1,inpostype*10  do--在使用地引出10个小怪，而不是在引魔珠的原来地方
				monsterID = LuaFnCreateMonster( sceneId, monster10ID, x050221_g_monster10Pos[i][1], x050221_g_monster10Pos[i][2], 14, -1, 050221 )
				SetLevel( sceneId, monsterID, mylevel )
				SetCharacterName( sceneId, monsterID, x050221_g_Monster10ID )
			end
			
			if flag == 1 then--风
				x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_30}" )
			elseif flag == 2 then--焰
				x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_39}" )
			elseif flag == 3 then--地
				x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_33}" )
			elseif flag == 4 then--玄
				x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_35}" )
			elseif flag == 5 then--毒
				x050221_NotifyFailTips( sceneId, selfId, "#{LLFB_80816_37}" )
			end
		end
	end

	return ret
end

--**********************************
-- 拾取处理 scene.lua的x888888_OnPlayerPickupItemFromDropBox调用到这里
--**********************************
function x050221_PickupItem(sceneId, selfId, itemId, bagidx )
	if IsHaveMission( sceneId, selfId, x050221_g_MissionId ) <= 0 then
		return
	end
	
	if itemId ~= x050221_g_xuanfouzhu then
		return
	end
	
	x050221_NotifyFailTips( sceneId, selfId, "已找到玄佛珠： 1/1" )
	x050221_NotifyFailTips( sceneId, selfId, "任务目标完成" )
	misIndex = GetMissionIndexByID( sceneId, selfId, x050221_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_IsFindGoods, 1 )
	SetMissionByIndex( sceneId, selfId, misIndex, x050221_g_IsMissionOkFail, 1 )	-- 任务完成
end
