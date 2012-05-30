-- 城市内政任务主事件脚本
-- 脚本号
x600001_g_ScriptId = 600001

-- 环数上限
x600001_g_MaxRound = 10

-- 部分任务参数
x600001_g_IsMissionOkFail = 0						-- 任务完成标记
x600001_g_MissionParam_SubId = 1					-- 子任务脚本号存放位置
x600001_g_TransScript = 400900

-- 每天玩家能做的最多的帮派任务次数
x600001_g_CountLimiti = 50
x600001_TIME_2000_01_03_ = 946828868
x600001_g_SpecBonus = {
	1,
	1,
	1,
	2,
	2,
	3,
	3,
	4,
	4,
	5,
}

x600001_g_HighRate_Param = 0.8;			-- 按70级玩家的10%调成8%
x600001_g_LowRate_Param = 0.875;		-- 按70级玩家的40%调成35%
--低级熔炼符
x600001_g_GemMeltingLowRandTbl = {
  [50] = 3428,[51] = 3457,[52] = 3485,[53] = 3514,[54] = 3542,
  [55] = 3571,[56] = 3600,[57] = 3628,[58] = 3657,[59] = 3685,
  [60] = 3714,[61] = 3742,[62] = 3771,[63] = 3800,[64] = 3828,
  [65] = 3857,[66] = 3885,[67] = 3914,[68] = 3942,[69] = 3971,
  [70] = 4000,[71] = 4028,[72] = 4057,[73] = 4085,[74] = 4114,
  [75] = 4142,[76] = 4171,[77] = 4200,[78] = 4228,[79] = 4257,
  [80] = 4285,[81] = 4314,[82] = 4342,[83] = 4371,[84] = 4400,
  [85] = 4428,[86] = 4457,[87] = 4485,[88] = 4514,[89] = 4542,
  [90] = 4571,[91] = 4600,[92] = 4628,[93] = 4657,[94] = 4685,
  [95] = 4714,[96] = 4742,[97] = 4771,[98] = 4800,[99] = 4828,
  [100] = 4857,[101] = 4885,[102] = 4914,[103] = 4942,[104] = 4971,
  [105] = 5000,[106] = 5028,[107] = 5057,[108] = 5085,[109] = 5114,
  [110] = 5142,[111] = 5171,[112] = 5200,[113] = 5228,[114] = 5257,
  [115] = 5285,[116] = 5314,[117] = 5342,[118] = 5371,[119] = 5400,
  [120] = 5428,[121] = 5457,[122] = 5485,[123] = 5514,[124] = 5542,
  [125] = 5571,[126] = 5600,[127] = 5628,[128] = 5657,[129] = 5685,
  [130] = 5714,[131] = 5742,[132] = 5771,[133] = 5800,[134] = 5828,
  [135] = 5857,[136] = 5885,[137] = 5914,[138] = 5942,[139] = 5971,
  [140] = 6000,[141] = 6028,[142] = 6057,[143] = 6085,[144] = 6114,
  [145] = 6142,[146] = 6171,[147] = 6200,[148] = 6228,[149] = 6257,
  [150] = 6285,
}

--高级熔炼符
x600001_g_GemMeltingHighRandTbl = {
  [50] = 857,[51] = 864,[52] = 871,[53] = 878,[54] = 885,
  [55] = 892,[56] = 900,[57] = 907,[58] = 914,[59] = 921,
  [60] = 928,[61] = 935,[62] = 942,[63] = 950,[64] = 957,
  [65] = 964,[66] = 971,[67] = 978,[68] = 985,[69] = 992,
  [70] = 1000,[71] = 1007,[72] = 1014,[73] = 1021,[74] = 1028,
  [75] = 1035,[76] = 1042,[77] = 1050,[78] = 1057,[79] = 1064,
  [80] = 1071,[81] = 1078,[82] = 1085,[83] = 1092,[84] = 1100,
  [85] = 1107,[86] = 1114,[87] = 1121,[88] = 1128,[89] = 1135,
  [90] = 1142,[91] = 1150,[92] = 1157,[93] = 1164,[94] = 1171,
  [95] = 1178,[96] = 1185,[97] = 1192,[98] = 1200,[99] = 1207,
  [100] = 1214,[101] = 1221,[102] = 1228,[103] = 1235,[104] = 1242,
  [105] = 1250,[106] = 1257,[107] = 1264,[108] = 1271,[109] = 1278,
  [110] = 1285,[111] = 1292,[112] = 1300,[113] = 1307,[114] = 1314,
  [115] = 1321,[116] = 1328,[117] = 1335,[118] = 1342,[119] = 1350,
  [120] = 1357,[121] = 1364,[122] = 1371,[123] = 1378,[124] = 1385,
  [125] = 1392,[126] = 1400,[127] = 1407,[128] = 1414,[129] = 1421,
  [130] = 1428,[131] = 1435,[132] = 1442,[133] = 1450,[134] = 1457,
  [135] = 1464,[136] = 1471,[137] = 1478,[138] = 1485,[139] = 1492,
  [140] = 1500,[141] = 1507,[142] = 1514,[143] = 1521,[144] = 1528,
  [145] = 1535,[146] = 1542,[147] = 1550,[148] = 1557,[149] = 1564,
  [150] = 1571,
}



-- 任务奖励

--**********************************
-- 被任务入口函数调用
--**********************************
function x600001_DoDefaultEvent( sceneId, selfId, targetId, missionId, subMissionScriptId )
	-- 如果玩家已经接了该任务
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		subMissionScriptId = GetMissionParam( sceneId, selfId, misIndex, x600001_g_MissionParam_SubId )

		CallScriptFunction( subMissionScriptId, "OnDefaultEvent", sceneId, selfId, targetId )
	else
		-- 如果是疲劳状态
		local efsRet = LuaFnIsExceedingFatigueState( sceneId, selfId );
		if not efsRet or efsRet == 1 then
			x600001_NotifyFailTips( sceneId, selfId, "疲劳状态下不能接受任务。" )
			return
		end

		-- 如果未接该任务
		if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
			x600001_NotifyFailTips( sceneId, selfId, "此任务需要至少一格任务物品空间" )
			return
		end

		-- 取得玩家附近的队友数量（包括自己）
		local i = 0
		local mems = { selfId }
		local nearteammembercount = 1

		-- if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
		--	if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then					-- 是队长
		--		nearteammembercount = GetNearTeamCount( sceneId, selfId )
		--		for i=0, nearteammembercount-1 do
		--			mems[i+1] = GetNearTeamMember(sceneId, selfId, i)
		--		end
		--	end
		-- end

		for i=1, nearteammembercount do
			CallScriptFunction( subMissionScriptId, "OnDefaultEvent", sceneId, mems[i], targetId )
		end
	end
end

--**********************************
-- 供检测接受条件的任务函数调用
--**********************************
function x600001_DoCheckAccept( sceneId, selfId, missionId, timeParam )
	-- 已经接过则不符合条件
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		return 0
	end

	-- 检测是否任务已经达到 20 个，如果到了，则不能接
	if GetMissionCount( sceneId, selfId ) >= 20 then
		return -2
	end

	-- 检测玩家是否符合接受任务的条件
	--begin modified by zhangguoxin 090207
	local iTime = GetMissionData( sceneId, selfId, timeParam )					-- 上一次放弃任务的时间(一刻种)
	--local CurTime = GetHourTime()												-- 当前时间(一刻钟)
	local CurTime = GetQuarterTime()												-- 当前时间(一刻钟)
	--end modified by zhangguoxin 090207
	if iTime == CurTime then
		return -1
	end

	return 1
end

--**********************************
-- 接受，仅供子任务调用设置公共参数
--**********************************
function x600001_DoAccept( sceneId, selfId, scriptId, missionId, roundParam )
	--加入任务到玩家列表
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )				-- 得到任务的序列号
	SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail, 0 )	-- 根据序列号把任务变量的第0位置0 (任务完成情况)
	SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_MissionParam_SubId, scriptId )	-- 根据序列号把任务变量的第1位置为任务脚本号

	--得到环数
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )
	--环数增加1
	MissionRound = mod( MissionRound, x600001_g_MaxRound )
	SetMissionData( sceneId, selfId, roundParam, MissionRound + 1 )
end

--**********************************
-- 放弃，仅供子任务调用
--**********************************
function x600001_DoAbandon( sceneId, selfId, missionId, timeParam, roundParam )
	DelMission( sceneId, selfId, missionId )
	--begin modified by zhangguoxin 090207
	--local CurTime = GetHourTime()													-- 当前时间
	local CurTime = GetQuarterTime()													-- 当前时间
	--begin modified by zhangguoxin 090207
	-- 设置放弃循环任务的时间
	SetMissionData( sceneId, selfId, timeParam, CurTime )
	-- 清环数
	SetMissionData( sceneId, selfId, roundParam, 0 )
end

--**********************************
-- 放弃所有城市任务
--**********************************
function x600001_AbandonCityMissions( sceneId, selfId )
	local missionList1 = { 1112 }	-- 优先级最高的
	local missionList2 = { 1105, 1106, 1107, 1108, 1110, 1109, 1111, 1113, 1140, 1141, 1142 }	-- 次优先级的

	local scriptId = -1

	for i, mission in missionList1 do
		scriptId = GetScriptIDByMissionID( sceneId, selfId, mission )
		if scriptId ~= -1 then
			CallScriptFunction( scriptId, "OnAbandon", sceneId, selfId )
		end
	end

	for i, mission in missionList2 do
		scriptId = GetScriptIDByMissionID( sceneId, selfId, mission )
		if scriptId ~= -1 then
			CallScriptFunction( scriptId, "OnAbandon", sceneId, selfId )
		end
	end
end

--**********************************
-- 供任务函数调用检测是否可以提交
--**********************************
function x600001_DoCheckSubmit( sceneId, selfId, missionId )
	if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )				-- 得到任务的序列号
	if GetMissionParam( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail ) == 1 then
		return 1
	end

	return  0
end

--**********************************
-- 提交，仅供子任务调用
--**********************************
function x600001_DoSubmit( sceneId, selfId, missionId, roundParam )
	DelMission( sceneId, selfId, missionId )

	local MissionName = {}															-- 任务名称表
	MissionName[MD_CITY_ENGINEERING_ROUND] = "工程"									-- 工程
	MissionName[MD_CITY_DEVELOPMENT_ROUND] = "发展"									-- 发展
	MissionName[MD_CITY_SCITECH_ROUND] = "科技"		   								-- 科技
	MissionName[MD_CITY_MARKET_ROUND] = "市集"		   								-- 市集
	MissionName[MD_CITY_EXPAND_ROUND] = "扩张"		   								-- 扩张
	MissionName[MD_CITY_MILITARY_ROUND] = "国防"									-- 国防
	
	if MissionName[roundParam] then
		--得到环数
		local MissionRound = GetMissionData( sceneId, selfId, roundParam )
		--今天的总环数
		local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)+1
		local nNowTime = LuaFnGetCurrentTime()
		local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

		if (nNowTime-nPreTime > 60*60*24) or
		 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
			nCount = 1
		end
		BeginEvent( sceneId )
			AddText( sceneId, "#{BHRW_081124_01}"..MissionName[roundParam].."任务"..MissionRound.."#{BHRW_081124_02}"..nCount.."/"..x600001_g_CountLimiti.."#{BHRW_081124_03}")
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
	end

	--得到环数
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )
	if MissionName[roundParam] and x600001_g_MaxRound <= MissionRound then
		local str = format( "@*;SrvMsg;GLD:#Y经过#{_INFOUSR%s}#Y的不懈努力，终于连续完成了#R%d#Y轮%s任务。",
			GetName( sceneId, selfId ), x600001_g_MaxRound, MissionName[roundParam] )

		BroadMsgByChatPipe( sceneId, selfId, str, 6 )
	end
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600001_BackToCity( sceneId, selfId, missionId, xPos, zPos )
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then							--如果进入副本前删除任务，则直接传送回
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		if GetMissionParam( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail ) ~= 1 then
			x600001_NotifyFailTips( sceneId, selfId, "任务失败！" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600001_g_IsMissionOkFail, 2 )	--设置任务数据
		end
	end

	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取得副本入口场景号
	CallScriptFunction( x600001_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, xPos, zPos )
end

--**********************************
-- 经验奖励值计算
-- 算法：当前任务种类比例*(玩家等级^比例)*环数+基数
--**********************************
function x600001_CalcExpBonus( sceneId, selfId, roundParam )
	local MissionTypeInfo = {}														-- 任务种类比例列表
	MissionTypeInfo[MD_CITY_ENGINEERING_ROUND] = 1									-- 工程
	MissionTypeInfo[MD_CITY_DEVELOPMENT_ROUND] = 1									-- 发展
	MissionTypeInfo[MD_CITY_SCITECH_ROUND] = 1      								-- 科技
	MissionTypeInfo[MD_CITY_MARKET_ROUND] = 1       								-- 市集
	MissionTypeInfo[MD_CITY_EXPAND_ROUND] = 1       								-- 扩张
	MissionTypeInfo[MD_CITY_CONSTRUCT_ROUND] = 1    								-- 建设
	MissionTypeInfo[MD_CITY_RESEARCH_ROUND] = 1     								-- 研究
	MissionTypeInfo[MD_CITY_MILITARY_ROUND] = 1										-- 国防

	local TypeScale = MissionTypeInfo[roundParam]									-- 当前任务种类比例
	if not TypeScale then															-- 非法任务类型
		return 0
	end
	
	--合法性检查
	--环数
	local MissionRound	= GetMissionData( sceneId, selfId, roundParam )
	local	LogInfo
	if MissionRound <= 0 or MissionRound > x600001_g_MaxRound then
		LogInfo	= format( "[CITY]: MissionRound error! sceneId=%d,GUID=%0X,rnd=%d,roundParam=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			MissionRound,
			roundParam )
		MissionLog( sceneId, LogInfo )
		return 0
	end

	local Level = GetLevel( sceneId, selfId )										-- 玩家等级
	local l_Exp = 1.75																-- 比例
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )				-- 环数
	local BaseExp = 0																-- 基数

	local Exp = TypeScale * ( Level ^ l_Exp ) * MissionRound + BaseExp				-- 等级 + 环数函数，受经验调节常数的影响

--	local citySceneId = CityGetSelfCityID( sceneId, selfId )
--	if CityGetMaintainStatus( sceneId, selfId, citySceneId ) == 3 then				-- 高维护状态
--		Exp = Exp / 2
--	end

	Exp = floor(Exp)

	return Exp
end

--**********************************
-- 帮会贡献计算
--**********************************
function x600001_CalcContribBonus( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound > 0 then
		--衰减系数
		local l_ContribBonus = 1
		local ContribBonus = 0

		ContribBonus = x600001_g_SpecBonus[MissionRound] * l_ContribBonus
		ContribBonus = floor(ContribBonus)
		return ContribBonus
	end

	return 0
end

--**********************************
-- 专业奖励值计算
--**********************************
function x600001_CalcSpecBonus( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= 5 then
		--衰减系数
		local l_SpecBonus = 1
		local SpecBonus = 0

		if MissionRound < 8 then
			SpecBonus = 1 * l_SpecBonus
		elseif MissionRound < 10 then
			SpecBonus = 2 * l_SpecBonus
		else
			SpecBonus = 3 * l_SpecBonus
		end

		SpecBonus = floor(SpecBonus)
		return SpecBonus
	end

	return 0
end

--**********************************
-- 随机奖励物品
--**********************************
function x600001_RandomItemAward( sceneId, selfId, roundParam, missionItemIdx )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= x600001_g_MaxRound then												-- 顶级有奖物品几率
		if random(100) > 2 then													-- 几率 2%
			return
		end

		local itemSN, itemName, itemDesc, bBroadCast = GetOneMissionBonusItem( missionItemIdx )
		if itemSN > -1 then
			local bagpos = TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
			if bagpos and bagpos ~= -1 then
				local MissionName = {}															-- 任务名称表
				MissionName[MD_CITY_ENGINEERING_ROUND] = "工程"									-- 工程
				MissionName[MD_CITY_DEVELOPMENT_ROUND] = "发展"									-- 发展
				MissionName[MD_CITY_SCITECH_ROUND] = "科技"		   								-- 科技
				MissionName[MD_CITY_MARKET_ROUND] = "市集"		   								-- 市集
				MissionName[MD_CITY_EXPAND_ROUND] = "扩张"		   								-- 扩张
				MissionName[MD_CITY_MILITARY_ROUND] = "国防"									-- 国防

				--得到环数
				if MissionName[roundParam] then
					local PlayerGender = GetSex( sceneId, selfId )
					local rank

					if PlayerGender == 0 then
						rank = "她"
					else
						rank = "他"
					end

					local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )

					local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#cffff00通过不懈努力，终于完成了10环%s任务，作为额外的奖励，%s获得了#{_INFOMSG%s}。",
						GetName( sceneId, selfId ), MissionName[roundParam], rank, itemInfo )

					BroadMsgByChatPipe( sceneId, selfId, str, 6 )
				end
			end
		end
	end
end

--**********************************
-- 随机获得熔炼符
--**********************************
function x600001_RandomItemMeltingAward( sceneId, selfId, roundParam )
	local MissionRound = GetMissionData( sceneId, selfId, roundParam )

	if MissionRound >= x600001_g_MaxRound then												-- 顶级有奖物品几率
	
		local iPlayerLv = GetLevel(sceneId,selfId)											-- 判断玩家等级
		if (iPlayerLv < 50) or (iPlayerLv > 150) then
			return
		end
		
		local rand = random(10000)
		local rateHigh = x600001_g_GemMeltingHighRandTbl[iPlayerLv] * x600001_g_HighRate_Param;
		local rateLow = x600001_g_GemMeltingLowRandTbl[iPlayerLv] * x600001_g_LowRate_Param;
		local itemSN = -1
			
		if (rand < rateHigh) then																				-- 随机到高级熔炼符
				itemSN = 30900057
		else
				if (rand < rateLow) then																		-- 随机到低级熔炼符
					itemSN = 30900056 
				else
					return																										-- 啥都没随机到
				end
		end
		
		if itemSN > -1 then
			local bagpos = TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了
			if bagpos and bagpos ~= -1 then
				local MissionName = {}															-- 任务名称表
				MissionName[MD_CITY_ENGINEERING_ROUND] = "工程任务"									-- 工程
				MissionName[MD_CITY_DEVELOPMENT_ROUND] = "发展任务"									-- 发展
				MissionName[MD_CITY_SCITECH_ROUND] = "科技任务"		   								-- 科技
				MissionName[MD_CITY_MARKET_ROUND] = "市集任务"		   								-- 市集
				MissionName[MD_CITY_EXPAND_ROUND] = "扩张任务"		   								-- 扩张
				MissionName[MD_CITY_MILITARY_ROUND] = "国防任务"									-- 国防

				--得到环数
				if MissionName[roundParam] then
					local itemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
					
					if (itemSN == 30900057) then	--高级公告
						x600001_NotifyFailTips(sceneId, selfId,"#{JKBS_081021_025}" )
						
						local str = format( "#{_INFOUSR%s}#{JKBS_081021_026}#G%s#{JKBS_081021_027}#{_INFOMSG%s}#{JKBS_081021_028}",
						GetName( sceneId, selfId ), MissionName[roundParam], itemInfo )

						BroadMsgByChatPipe( sceneId, selfId, str, 4 )
					end
					
					if (itemSN == 30900056) then	--低级公告
						x600001_NotifyFailTips(sceneId, selfId,"#{JKBS_081021_024}" )
						
						local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#{JKBS_081027_029}#G%s#{JKBS_081027_030}#{_INFOMSG%s}#{JKBS_081027_031}",
						GetName( sceneId, selfId ), MissionName[roundParam],itemInfo )

						BroadMsgByChatPipe( sceneId, selfId, str, 6 )
					end
				end
			end
		end
	end
end

function x600001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 随机奖励物品
--**********************************
function x600001_CanDoMisToDay(sceneId, selfId)
	local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)
	local nNowTime = LuaFnGetCurrentTime()
	local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

	-- 如果已经经过了1天
	if (nNowTime-nPreTime > 60*60*24) or
	 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
		nCount = 0
		nPreTime = nNowTime
		SetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY, nCount)
		SetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME, nPreTime)
	end

	if nCount >= x600001_g_CountLimiti  then
		BeginEvent( sceneId )
			AddText( sceneId, "  对不起，您今天的任务已经累计完成了50次，想必一定很累了，还是去休息一会儿明天再来找我吧。" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, selfId )
		return 0
	end

	return 1
end

--**********************************
-- 玩家完成一次任务后，都记录一下次数和时间
--**********************************
function x600001_MissionComplete(sceneId, selfId)
	local nCount = GetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY)
	local nNowTime = LuaFnGetCurrentTime()
	local nPreTime = GetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME)

	if (nNowTime-nPreTime > 60*60*24) or
	 				(floor((nNowTime-x600001_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x600001_TIME_2000_01_03_)/(3600*24)))   then
		nCount = 0
	end

	SetMissionData(sceneId, selfId, MD_GUILD_MIS_COUNT_TODAY, nCount+1)
	SetMissionData(sceneId, selfId, MD_PRE_GUILD_MIS_TIME, nNowTime)
	
	if (nCount+1 == 50) then		--50环任务公告
			local str = format( "@*;SrvMsg;GLD:#Y#{_INFOUSR%s}#{BHRW_081029_01}",GetName( sceneId, selfId ))
			BroadMsgByChatPipe( sceneId, selfId, str, 6 )
	end

end

