-- 帮派战争 add by hukai
--************************************************************************
--MisDescBegin

-- 脚本号
x402047_g_ScriptId = 402047

-- 任务目标 NPC
x402047_g_Name = "周然"

-- 任务文本描述
x402047_g_MissionName = "前往涿鹿古战场"
x402047_g_SubmitInfo = "#{BHXZ_081103_115}"									-- 提交时的对话

--MisDescEnd
--************************************************************************

x402047_g_NumText_EnterCopyScene = 1		-- 要求进入副本的选项
x402047_g_GetPrizeTitle = 2							-- 领取称号的选项
x402047_g_GetPrizeTitle_Kill = 3				-- 领取称号（杀人次数最多，连斩狂客）的选项
x402047_g_GetPrizeTitle_Flag = 4				-- 领取称号（占领旗帜最多，超级旗手）的选项
x402047_g_GetPrizeTitle_Source = 5			-- 领取称号（采集资源最多，搜宝专家）的选项

x402047_g_CopySceneMap = "zhuluKVK.nav"
x402047_g_CopySceneArea = "zhuluKVK_area.ini"
x402047_g_CopySceneMonsterIni = "zhuluKVK_monster.ini"

x402047_g_CopySceneType = FUBEN_BANGZHAN		-- 副本类型，定义在ScriptGlobal.lua里面
x402047_g_MaxMembers = 25					-- 本帮可以进副本的最大人数  --tt50777 人数上限由80人修改为25人
x402047_g_TickTime = 1						-- 回调脚本的时钟时间（单位：秒/次）
x402047_g_StartPoint = 60*5+5						-- 开始记分时间（单位：次数）为了显示出还剩5分所以加了5s
x402047_g_LimitTotalHoldTime = 60*40 + x402047_g_StartPoint	-- 副本可以存活的时间（单位：次数）,如果此时间到了，则帮战结束
x402047_g_CloseTick = 30+1						-- 副本关闭前倒计时（单位：次数）
x402047_g_NoUserTime = 10					-- 副本中没有人后可以继续保存的时间（单位：秒）
x402047_g_PvpRuler = 3						--副本竞技规则
x402047_g_BackTick = 10						-- 倒计时（单位：次数）

x402047_g_TankMaxEnemyNum = 15			--有效范围内战车起效果的最大敌方数目
x402047_g_TankMaxFriendNum = 20			--有效范围内战车起效果的最大本方数目

x402047_g_Fuben_A_X = 47--A帮（挑战方）入口
x402047_g_Fuben_A_Z = 39
x402047_g_Fuben_B_X = 203 --B帮（应战方）入口
x402047_g_Fuben_B_Z = 215

x402047_g_ALive_A_X = 51--A帮（挑战方）复活点
x402047_g_ALive_A_Z = 26
x402047_g_ALive_B_X = 205 --B帮（应战方）复活点
x402047_g_ALive_B_Z = 227

x402047_g_Back_X = 262 --普通出口
x402047_g_Back_Z = 51

x402047_g_Exit_SceneID = 409 --传出场景ID
x402047_g_Win_X = 32 --获胜方出口
x402047_g_Win_Z = 16
x402047_g_Fail_X = 32 --失败方出口
x402047_g_Fail_Z = 41

x402047_g_Win_PerHonour = 100 --获胜方每个人获得的荣誉值
x402047_g_Fail_TotalHonour = 2000 --失败方总共获得的荣誉值上限！！注意是总共的！！
x402047_g_Fail_PerMaxHonour = 100 --失败方每个人获得的荣誉值上限

x402047_g_PrizeMsg = {"#{BHXZ_081103_120}",
											"#{BHXZ_081103_121}",
											"#{BHXZ_081103_122}"}

x402047_g_FailMsg = "#{BHXZ_081103_123}"

x402047_g_PrizeFlag = {MF_BangZhan_Kill_Flag, MF_BangZhan_Flag_Flag, MF_BangZhan_Source_Flag}
x402047_g_PrizeBuff = {31549, 31548, 31547} --奖励buff

--称号奖励
x402047_g_PrizeTitle = {{AwardPos = 15, SetPos = 39, Index = 252}, --奖励的索引，设置位置的索引，称号索引
												{AwardPos = 16, SetPos = 40, Index = 253},
												{AwardPos = 17, SetPos = 41, Index = 254}}

x402047_g_GuildPoint_KillOtherPlayer = 0						--杀人积分规则索引，表GuildWarPoint.txt的ID
x402047_g_GuildPoint_KillTower = 2									--塔积分规则索引，表GuildWarPoint.txt的ID
x402047_g_GuildPoint_KillTankPlayer = 3							--杀战车玩家积分规则索引，表GuildWarPoint.txt的ID
x402047_g_GuildPoint_KillPlatform = 5								--战台积分规则索引，表GuildWarPoint.txt的ID

x402047_g_IsSetOverFlag = 9										--是否算了结束积分(副本tick在传出副本后没有马上结束，要在后面的tick中不走结束领奖流程)在32个副本数据中的索引
x402047_g_OpenFlagSelfIDIndex = 10						--当前正在操作旗台的selfid在32个副本数据中的索引
x402047_g_OpenFlagStartTime = 11							--当前正在操作旗台的开始时间在32个副本数据中的索引
x402047_g_FlagRemainedTime = 12								--旗帜升起以后的剩余时间在32个副本数据中的索引
x402047_g_A_FirstTankManSelfID = 13						--A帮变化成战车的玩家的selfid在32个副本数据中的索引
x402047_g_A_SecondTankManSelfID = 14					--A帮变化成战车的玩家的selfid在32个副本数据中的索引
x402047_g_B_FirstTankManSelfID = 15						--B帮变化成战车的玩家的selfid在32个副本数据中的索引
x402047_g_B_SecondTankManSelfID = 16					--B帮变化成战车的玩家的selfid在32个副本数据中的索引
x402047_g_A_FirstTankBuff = 17								--A帮变化成战车的BuffID在32个副本数据中的索引
x402047_g_A_SecondTankBuff = 18								--A帮变化成战车的BuffID在32个副本数据中的索引
x402047_g_B_FirstTankBuff = 19								--B帮变化成战车的BuffID在32个副本数据中的索引
x402047_g_B_SecondTankBuff = 20								--B帮变化成战车的BuffID在32个副本数据中的索引
x402047_g_A_FirstTankPos = 21									--A帮变化成战车的Pos在32个副本数据中的索引
x402047_g_A_SecondTankPos = 22								--A帮变化成战车的Pos在32个副本数据中的索引
x402047_g_B_FirstTankPos = 23									--B帮变化成战车的Pos在32个副本数据中的索引
x402047_g_B_SecondTankPos = 24								--B帮变化成战车的Pos在32个副本数据中的索引
x402047_g_A_TankColdTime = 25									--A帮战车冷却时间在32个副本数据中的索引
x402047_g_B_TankColdTime = 26									--B帮战车冷却时间在32个副本数据中的索引
x402047_g_A_BroadcastTick = 27								--A帮堡垒血量播放计数在32个副本数据中的索引
x402047_g_B_BroadcastTick = 28								--B帮堡垒血量播放计数在32个副本数据中的索引

--帮战数据索引，对应程序中的 enum GUILDWAR_INT_ARRAY
x402047_g_A_numIndex = 0
x402047_g_B_numIndex = 1
x402047_g_A_KillManNumIndex = 12							--A帮杀人数在帮战数组中的索引
x402047_g_B_KillManNumIndex = 13							--B帮杀人数在帮战数组中的索引
x402047_g_A_KillBuildingNumIndex = 14					--A帮拆毁建筑次数在帮战数组中的索引
x402047_g_B_KillBuildingNumIndex = 15					--B帮拆毁建筑次数在帮战数组中的索引
--x402047_g_A_FlagNumIndex = 16									--A帮占领大旗次数在帮战数组中的索引
--x402047_g_B_FlagNumIndex = 17									--B帮占领大旗次数在帮战数组中的索引
x402047_g_A_TotalPointIndex = 18							--A帮总积分在帮战数组中的索引
x402047_g_B_TotalPointIndex = 19							--B帮总积分在帮战数组中的索引

--个人积分数据索引，对应程序enum GUILDWAR_INT_INDEX
x402047_g_Human_TotalPointIndex = 0						--个人总积分索引
x402047_g_Human_KillManIndex = 1							--个人杀人数索引
x402047_g_Human_KillBuildingIndex = 2					--个人拆毁建筑次数索引
x402047_g_Human_FlagIndex = 3									--个人占领大旗次数索引
x402047_g_Human_ResourceNumIndex = 4					--个人交纳资源个数索引

x402047_g_TankBuff = {31577, 31578, 31579, 31580, 31581,	--蚩尤驾驶buff
											31582, 31583, 31584, 31585, 31586}	--炎黄驾驶buff

x402047_g_AttrBuff = {31567, 31568, 31569, 31570, 31571,	--蚩尤战车buff
											31572, 31573, 31574, 31575, 31576}	--炎黄战车buff

--x402047_g_TankAttackBuff = {31587, 31594, 31601, 31608}		--战车攻击buff
x402047_g_PanGuTankAttackBuff = 31551											--盘古战车攻击buff

x402047_g_LightBuff = {79, 80, 81, 82}	--战车闪光buff

x402047_g_TankFriendBuff = {{31553,31554}, {31556,31557}, {31559,31560}, {31562,31563}}		--战车加给己方目标的buff
x402047_g_TankEnemyBuff = {31552, 31555, 31558, 31561}		--战车加给敌对目标的buff

x402047_g_ImmuneControlBuff = 10474							--NPC免疫控制buff
x402047_g_SheepBuff = 31550											--变羊buff

--x402047_g_TankSkillID = {1116, 1123, 1130, 1137, 0,	--蚩尤战车技能ID
--												1116, 1123, 1130, 1137, 0}	--炎黄战车技能ID

x402047_g_TankID = {13334, 13335, 13336, 13337, 13338,	--可点击蚩尤战车NPC的ID
										13339, 13340, 13341, 13342, 13343}	--可点击炎黄战车NPC的ID

x402047_g_PhysicsAttack_Buff = {{value = 16000, buff = 31587},{value = 18000, buff = 31588},{value = 20000, buff = 31589},{value = 22500, buff = 31590},
																{value = 26000, buff = 31591},{value = 30000, buff = 31592},{value = 300000, buff = 31593}}

x402047_g_MagicAttack_Buff = {{value = 16000, buff = 31594},{value = 18000, buff = 31595},{value = 20000, buff = 31596},{value = 22500, buff = 31597},
															{value = 26000, buff = 31598},{value = 30000, buff = 31599},{value = 300000, buff = 31600}}

x402047_g_ColdFire_Buff = {{value = 100, buff = 31601},{value = 230, buff = 31602},{value = 420, buff = 31603},{value = 840, buff = 31604},
													{value = 1680, buff = 31605},{value = 2380, buff = 31606},{value = 200000, buff = 31607}}

x402047_g_LightPoison_Buff = {{value = 100, buff = 31608},{value = 230, buff = 31609},{value = 420, buff = 31610},{value = 840, buff = 31611},
															{value = 1680, buff = 31612},{value = 2380, buff = 31613},{value = 200000, buff = 31614}}

x402047_g_LingShiID = {30900051,30900052,30900053,30900054,30900055}	--灵石ID

x402047_g_TankName = {"青龙战车","白虎战车","朱雀战车","玄武战车","盘古战车","青龙战车","白虎战车","朱雀战车","玄武战车","盘古战车"}

x402047_g_ColdTime = 60									--战车冷却时间

--阵营NPC
x402047_g_A_Platform = "炎黄台"
x402047_g_A_FenXiang_Tower = "炎黄焚香塔"
x402047_g_A_LuoXing_Tower = "炎黄落星塔"
x402047_g_A_Flag = "炎黄战旗"

x402047_g_B_Platform = "蚩尤台"
x402047_g_B_FenXiang_Tower = "蚩尤焚香塔"
x402047_g_B_LuoXing_Tower = "蚩尤落星塔"
x402047_g_B_Flag = "蚩尤战旗"

--**********************************
-- 任务入口函数
--**********************************
function x402047_OnDefaultEvent( sceneId, selfId, targetId )	-- 点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x402047_g_Name then		-- 判断该npc是否是对应任务的npc
		return
	end
	
	local numText = GetNumText()
	
	if numText == x402047_g_NumText_EnterCopyScene then
			x402047_AcceptEnterCopyScene( sceneId, selfId, targetId )
	elseif numText == x402047_g_GetPrizeTitle then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_116}")
			AddNumText(sceneId, x402047_g_ScriptId, "连斩狂客", 4, x402047_g_GetPrizeTitle_Kill)
			AddNumText(sceneId, x402047_g_ScriptId, "超级旗手", 4, x402047_g_GetPrizeTitle_Flag)
			AddNumText(sceneId, x402047_g_ScriptId, "搜宝专家", 4, x402047_g_GetPrizeTitle_Source)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif numText == x402047_g_GetPrizeTitle_Kill then
		local bHave = GetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[1])
		
		if bHave == 1 then
			SetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[1], 0)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402047_g_PrizeBuff[1], 0 )
			
			LuaFnAwardTitle( sceneId, selfId, x402047_g_PrizeTitle[1].AwardPos, x402047_g_PrizeTitle[1].Index, 7*24) --有效期一周
			SetCurTitle(sceneId, selfId, x402047_g_PrizeTitle[1].SetPos, x402047_g_PrizeTitle[1].Index)
			LuaFnDispatchAllTitle(sceneId, selfId)
			
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_145}".."‘连斩狂客’".."#{BHXZ_081103_146}" )
			if GetHumanGuildID(sceneId, selfId) ~= -1 then --没有帮派的时候不发帮派公告
				local message = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#{BHXZ_090116_01}",LuaFnGetName(sceneId, selfId))
				BroadMsgByChatPipe(sceneId, selfId, message, 6);
			end
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("type=%d", 1)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_TITLE_BUFF, guid, log)
		else
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_117}" )
		end
	elseif numText == x402047_g_GetPrizeTitle_Flag then
		local bHave = GetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[2])
		
		if bHave == 1 then
			SetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[2], 0)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402047_g_PrizeBuff[2], 0 )
			
			LuaFnAwardTitle( sceneId, selfId, x402047_g_PrizeTitle[2].AwardPos, x402047_g_PrizeTitle[2].Index, 7*24) --有效期一周
			SetCurTitle(sceneId, selfId, x402047_g_PrizeTitle[2].SetPos, x402047_g_PrizeTitle[2].Index)
			LuaFnDispatchAllTitle(sceneId, selfId)
			
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_145}".."‘超级旗手’".."#{BHXZ_081103_146}" )
			if GetHumanGuildID(sceneId, selfId) ~= -1 then --没有帮派的时候不发帮派公告
				local message = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#{BHXZ_090116_02}",LuaFnGetName(sceneId, selfId))
				BroadMsgByChatPipe(sceneId, selfId, message, 6);
			end
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("type=%d", 2)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_TITLE_BUFF, guid, log)
		else
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_117}" )
		end
	elseif numText == x402047_g_GetPrizeTitle_Source then
		local bHave = GetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[3])
		
		if bHave == 1 then
			SetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[3], 0)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402047_g_PrizeBuff[3], 0 )
			
			LuaFnAwardTitle( sceneId, selfId, x402047_g_PrizeTitle[3].AwardPos, x402047_g_PrizeTitle[3].Index, 7*24) --有效期一周
			SetCurTitle(sceneId, selfId, x402047_g_PrizeTitle[3].SetPos, x402047_g_PrizeTitle[3].Index)
			LuaFnDispatchAllTitle(sceneId, selfId)
			
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_145}".."‘搜宝专家’".."#{BHXZ_081103_146}" )
			if GetHumanGuildID(sceneId, selfId) ~= -1 then --没有帮派的时候不发帮派公告
				local message = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#{BHXZ_090116_03}",LuaFnGetName(sceneId, selfId))
				BroadMsgByChatPipe(sceneId, selfId, message, 6);
			end
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("type=%d", 3)
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_TITLE_BUFF, guid, log)
		else
			x402047_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081103_117}" )
		end
	end
	
end

--**********************************
-- 列举事件
--**********************************
function x402047_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x402047_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	AddNumText( sceneId, x402047_g_ScriptId, x402047_g_MissionName, 4, x402047_g_NumText_EnterCopyScene )
	AddNumText( sceneId, x402047_g_ScriptId, "领取称号", 4, x402047_g_GetPrizeTitle )
end

--**********************************
-- 请求进入副本场景
--**********************************
function x402047_AcceptEnterCopyScene( sceneId, selfId, targetId )
	
	--变羊状态无法帮战，防止第一个帮战玩家是变羊，他又无法传送进场景，这时别人没有马上进去，副本没人就over了哈哈
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402047_g_SheepBuff) == 1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_105}" )
		return
	end
	
	--是否有帮战称号没有领取
	for i = 1, getn(x402047_g_PrizeFlag) do
		if GetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[i]) == 1 then
			x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_106}" )
			return
		end
	end
	
	--还没有加入帮会
	local guildid = GetHumanGuildID(sceneId, selfId)
	if guildid == -1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_19}" )
		return
	end
	
	--没有和其他帮派达成征讨关系
	local guildIDApply,guildIDApplied,CopySceneId = GetGuildWarApply(sceneId, guildid)
	if not guildIDApply or not guildIDApplied or not CopySceneId or guildIDApply == -1 or guildIDApplied == -1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_18}" )
		return
	end

	if CopySceneId >= 0 then --场景初始化完成之后直接可以进去
		if guildid == guildIDApply then
			local GuildInt = GetGuildIntNum( CopySceneId, guildid, x402047_g_A_numIndex )
			if GuildInt >= x402047_g_MaxMembers or GuildInt == -1 then --本帮副本人数满了，这里取出的人数不一定准确
				x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_107}" )
				return
			end
			
			BeginEvent(sceneId)
			AddText( sceneId, x402047_g_SubmitInfo )
			EndEvent()
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x402047_g_ScriptId, 0 ) --任务号写0
		else
			local GuildInt = GetGuildIntNum( CopySceneId, guildid, x402047_g_B_numIndex )
			if GuildInt >= x402047_g_MaxMembers or GuildInt == -1 then --本帮副本人数满了，这里取出的人数不一定准确
				x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_107}" )
				return
			end
			
			BeginEvent(sceneId)
			AddText( sceneId, x402047_g_SubmitInfo )
			EndEvent()
			DispatchMissionContinueInfo( sceneId, selfId, targetId, x402047_g_ScriptId, 0 ) --任务号写0
		end
		
		return
	end
	
	BeginEvent(sceneId)
	AddText( sceneId, x402047_g_SubmitInfo )
	EndEvent()
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x402047_g_ScriptId, 0 ) --任务号写0
end

--**********************************
--提交，需要重新判断每个条件
--**********************************
function x402047_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x402047_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	--变羊状态无法帮战，防止第一个帮战玩家是变羊，他又无法传送进场景，这时别人没有马上进去，副本没人就over了哈哈
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402047_g_SheepBuff) == 1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_105}" )
		return
	end
	
	--是否有帮战称号没有领取
	for i = 1, getn(x402047_g_PrizeFlag) do
		if GetMissionFlag(sceneId, selfId, x402047_g_PrizeFlag[i]) == 1 then
			x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_106}" )
			return
		end
	end
	
	--还没有加入帮会
	local guildid = GetHumanGuildID(sceneId, selfId)
	if guildid == -1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_19}" )
		return
	end
	
	--没有和其他帮派达成征讨关系
	local guildIDApply,guildIDApplied,CopySceneId = GetGuildWarApply(sceneId, guildid)
	if not guildIDApply or not guildIDApplied or not CopySceneId or guildIDApply == -1 or guildIDApplied == -1 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_18}" )
		return
	end

	if CopySceneId >= 0 then --场景初始化完成之后直接可以进去
		if guildid == guildIDApply then
			local GuildInt = GetGuildIntNum( CopySceneId, guildid, x402047_g_A_numIndex )
			if GuildInt >= x402047_g_MaxMembers or GuildInt == -1 then --本帮副本人数满了，这里取出的人数不一定准确
				x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_107}" )
				return
			end
			
			NewWorld( sceneId, selfId, CopySceneId, x402047_g_Fuben_A_X, x402047_g_Fuben_A_Z )
		else
			local GuildInt = GetGuildIntNum( CopySceneId, guildid, x402047_g_B_numIndex )
			if GuildInt >= x402047_g_MaxMembers or GuildInt == -1 then --本帮副本人数满了，这里取出的人数不一定准确
				x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_107}" )
				return
			end
			
			NewWorld( sceneId, selfId, CopySceneId, x402047_g_Fuben_B_X, x402047_g_Fuben_B_Z )
		end
		
		return
	end

	local firstmenguid = LuaFnObjId2Guid( sceneId, selfId ) --帮战副本中第一个进入的人不一定是帮主或者副帮主或队长
	LuaFnSetSceneLoad_Map( sceneId, x402047_g_CopySceneMap )						-- 地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, firstmenguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x402047_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_PvpRuler( sceneId, x402047_g_PvpRuler )
	LuaFnSetCopySceneData_Timer( sceneId, x402047_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x402047_g_CopySceneType )			-- 设置副本类型数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x402047_g_ScriptId )					-- 将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							-- 设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							-- 设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							-- 设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							-- 设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, guildIDApply*10000+guildIDApplied )-- 帮派ID取值范围是0~1024，所以10000以上A帮ID，10000以下B帮ID
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							-- 是否开始记分
	LuaFnSetCopySceneData_Param( sceneId, 8, 0 )							-- 暂时未用
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_IsSetOverFlag, 0 )				-- 是否算了结束积分
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_OpenFlagSelfIDIndex, 0 )	-- 当前正在操作旗台的selfid
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_OpenFlagStartTime, 0 )	-- 当前正在操作旗台的开始时间
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_FlagRemainedTime, 0 )	-- 旗帜升起以后的剩余时间
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID, 0 )	--A帮变化成战车的玩家的selfid
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankManSelfID, 0 )--A帮变化成战车的玩家的selfid
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankManSelfID, 0 )	--B帮变化成战车的玩家的selfid
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankManSelfID, 0 )--B帮变化成战车的玩家的selfid
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff, 0 )	--A帮变化成战车的BuffID
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankBuff, 0 )	--A帮变化成战车的BuffID
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankBuff, 0 )	--B帮变化成战车的BuffID
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankBuff, 0 )	--B帮变化成战车的BuffID
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos, 0 )	  --A帮变化成战车的Pos
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankPos, 0 )	--A帮变化成战车的Pos
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankPos, 0 ) 	--B帮变化成战车的Pos
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankPos, 0 )	--B帮变化成战车的Pos
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_TankColdTime, 0 )	  --A帮战车冷却时间
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_TankColdTime, 0 )	  --B帮战车冷却时间
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_BroadcastTick, 0 )	--A帮堡垒血量播放计数
	LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_BroadcastTick, 0 )	--B帮堡垒血量播放计数
	
	LuaFnSetSceneLoad_Area( sceneId, x402047_g_CopySceneArea )

	LuaFnSetSceneLoad_Monster( sceneId, x402047_g_CopySceneMonsterIni )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						-- 初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x402047_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
		SetGuildWarApplySceneID(sceneId, guildid, bRetSceneID)
		NotifyGuildBattle(sceneId,selfId,0,guildIDApply,guildIDApplied);
		local log = format("HumanGuildID=%d,Apply_GuildID=%d,Applied_GuildID=%d", guildid, guildIDApply, guildIDApplied)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_CREATEFUBEN, firstmenguid, log)
	else
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_17}" ) --副本数量已达上限
	end
end

--**********************************
--副本事件
--**********************************
function x402047_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )				-- 设置副本入口场景号

	local firstmanguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local firstmanObjId = LuaFnGuid2ObjId( sceneId, firstmanguid )

	if firstmanObjId == -1 then											-- 找不到该玩家
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, firstmanObjId ) ~= 1 then		-- 处于无法执行逻辑的状态
		return
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	--local Bguildid = mod(totalguildid, 10000)
	local guildid = GetHumanGuildID(sceneId, firstmanObjId)
	
	--SetGuildWarApplySceneID(sceneId, Aguildid, destsceneId)
	
	--这个玩家进入场景
	if guildid == Aguildid then
		NewWorld( sceneId, firstmanObjId, destsceneId, x402047_g_Fuben_A_X, x402047_g_Fuben_A_Z )
	else
		NewWorld( sceneId, firstmanObjId, destsceneId, x402047_g_Fuben_B_X, x402047_g_Fuben_B_Z )
	end
	
end

--**********************************
--有玩家进入副本事件
--**********************************
function x402047_OnPlayerEnter( sceneId, selfId )
	--战车玩家重新上线的时候是先走这里，然后才走取消战车buff。因此这个地方玩家的战车buf还是存在的，需要手动取消。
	local buf = x402047_HaveTankBuff( sceneId, selfId )
	if buf ~= 0 then
		LuaFnCancelSpecificImpact(sceneId,selfId,buf)
	end
	
	local guildid = GetHumanGuildID(sceneId, selfId)
	if x402047_IsGuildFull( sceneId, guildid ) == 1 then --本帮副本人数满了
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081103_107}" )
		SetCanChangeScene(sceneId, selfId, 1)--手动设置注意这个接口的用法，其他地方不要乱使用
		x402047_Exit(sceneId, selfId)
		return
	end
	
	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 and LuaFnGetCopySceneData_Param( sceneId, 5 ) >= x402047_g_CloseTick then
		x402047_NotifyFailTips( sceneId, selfId, "本次帮会征讨已经结束了。" )
		SetCanChangeScene(sceneId, selfId, 1)--手动设置注意这个接口的用法，其他地方不要乱使用
		x402047_Exit(sceneId, selfId)
		return
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	
	if guildid == Aguildid then
		if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 1 then --如果帮战已经开始则直接设置阵营
			SetUnitCampID(sceneId, selfId, selfId, 10+Aguildid)
		end
		SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%10", -1, "0", sceneId, x402047_g_ALive_A_X, x402047_g_ALive_A_Z, x402047_g_ScriptId )
	elseif guildid == Bguildid then
		if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 1 then --如果帮战已经开始则直接设置阵营
			SetUnitCampID(sceneId, selfId, selfId, 11+Aguildid)
		end
		SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%10", -1, "0", sceneId, x402047_g_ALive_B_X, x402047_g_ALive_B_Z, x402047_g_ScriptId )
	else  --把判断写严格一些。举例：玩家帮战副本下线，然后帮主踢出这个玩家，这次帮战没有结束的时候玩家重新上线的时候应该不能进入副本场景
		x402047_NotifyFailTips( sceneId, selfId, "你不在正确的帮派中，无法进入！" )
		SetCanChangeScene(sceneId, selfId, 1)--手动设置注意这个接口的用法，其他地方不要乱使用
		x402047_Exit(sceneId, selfId)
		return
	end
	
	--强制顶出帮派称号，添加提示
	if GetCurTitle(sceneId, selfId) ~= 23 then
		x402047_NotifyFailTips( sceneId, selfId, "#{BHXZ_081205_1}" )
		Msg2Player(sceneId, selfId, "#{BHXZ_081205_1}" , MSG2PLAYER_PARA)
	end
	SetCurTitle(sceneId, selfId, 23, 0)
end

--**********************************
--obj死亡
--**********************************
function x402047_OnDie( sceneId, objId, selfId )--这个selfId可能是宠物
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
	if fubentype ~= x402047_g_CopySceneType then
		return
	end

	--是否开始记分
	local isStartPoint = LuaFnGetCopySceneData_Param( sceneId, 7 )
	if isStartPoint == 0 then
		return
	end

--	--副本关闭标志
--	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
--	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
--		return
--	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--取得杀死NPC的name
	local szName = GetName( sceneId, objId )
	if szName == x402047_g_A_FenXiang_Tower or szName == x402047_g_A_LuoXing_Tower then			--A塔
		if x402047_IsCommonBGuild( sceneId, selfId ) == 0 then
			return
		end
		local humanguildid = GetHumanGuildID(sceneId, selfId)
		local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTower)
		x402047_AddBGuildPoint(sceneId, selfId, humanguildid, point)
		local alreadynum = GetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillBuildingNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillBuildingNumIndex, alreadynum+1 )
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_KillBuildingIndex, 1 )
	elseif szName == x402047_g_B_FenXiang_Tower or szName == x402047_g_B_LuoXing_Tower then	--B塔
		if x402047_IsCommonAGuild( sceneId, selfId ) == 0 then
			return
		end
		local humanguildid = GetHumanGuildID(sceneId, selfId)
		local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTower)
		x402047_AddAGuildPoint(sceneId, selfId, humanguildid, point)
		local alreadynum = GetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillBuildingNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillBuildingNumIndex, alreadynum+1 )
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_KillBuildingIndex, 1 )
	elseif szName == x402047_g_A_Platform then		--A台
		if x402047_IsCommonBGuild( sceneId, selfId ) == 0 then
			return
		end
		local humanguildid = GetHumanGuildID(sceneId, selfId)
		local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillPlatform)
		x402047_AddBGuildPoint(sceneId, selfId, humanguildid, point)
		local alreadynum = GetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillBuildingNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillBuildingNumIndex, alreadynum+1 )
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_KillBuildingIndex, 1 )
	elseif szName == x402047_g_B_Platform then		--B台
		if x402047_IsCommonAGuild( sceneId, selfId ) == 0 then
			return
		end
		local humanguildid = GetHumanGuildID(sceneId, selfId)
		local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillPlatform)
		x402047_AddAGuildPoint(sceneId, selfId, humanguildid, point)
		local alreadynum = GetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillBuildingNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillBuildingNumIndex, alreadynum+1 )
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_KillBuildingIndex, 1 )
	end
	
	local msg = LuaFnGetGuildName(sceneId, selfId).."#{BHXZ_081103_125}"..GetName(sceneId, selfId).."#{BHXZ_081103_126}"..szName.."。"
	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
			x402047_NotifyFailTips(sceneId, mems[i], msg)
			Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
		end
	end
end

----**********************************
----杀死怪物或玩家
----**********************************
--function x402047_OnKillObject( sceneId, selfId, objdataId, objId )						-- 参数意思：场景号、玩家objId、怪物表位置号、怪物objId
--end

--**********************************
-- 玩家复活
--**********************************
function x402047_OnRelive(sceneId, selfId)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 78, 100 )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x402047_OnHumanDie( sceneId, selfId, killerId ) --这个killerId有可能是对方NPC比如塔，而不一定是玩家selfId
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x402047_g_CopySceneType then
		return
	end
	
	--是否开始记分
	local isStartPoint = LuaFnGetCopySceneData_Param( sceneId, 7 )
	if isStartPoint == 0 then
		return
	end
	
--	--副本关闭标志，这个值得考虑一下
--	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
--	if leaveFlag == 1 then														-- 如果副本已经被置成关闭状态，则杀怪无效
--		return
--	end
	
	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local humanguildid = GetHumanGuildID(sceneId, selfId) --死亡玩家帮派
	
	if humanguildid == Aguildid then --死亡玩家是A帮的
		local objType = GetCharacterType( sceneId, killerId )
		local otherselfId = 0
		
		if objType == 1 then --如果杀死他的是玩家
			otherselfId = killerId
		elseif objType == 3 then --如果杀死他的是其他玩家的宠物
			otherselfId = GetPetCreator( sceneId, killerId )
			if otherselfId == -1 then
				otherselfId = 0
			end
		else --如果杀死他的是对方NPC比如塔
			otherselfId = 0
		end
		
		--设置帮派杀人数目
		local alreadykillnum = GetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillManNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_B_KillManNumIndex, alreadykillnum+1 )
		
		local Tankbuf = x402047_HaveTankBuff( sceneId, selfId )
		
		--设置个人杀人数目，增加帮贡
		if otherselfId > 0 then
			x402047_AddHumanGuildArrayInt( sceneId, otherselfId, x402047_g_Human_KillManIndex, 1 )
			--CityChangeAttr(sceneId, otherselfId, GUILD_CONTRIB_POINT, 1)
			if Tankbuf == 0 then --非战车玩家才发送这个系统消息
				Msg2Player(sceneId, otherselfId, "#{BHXZ_081103_127}"..GetName(sceneId, selfId).."。" , MSG2PLAYER_PARA)
			end
		end
		
		if Tankbuf and Tankbuf ~= 0 then --战车玩家死亡
			if selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID ) then
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos, 0 )
				--PrintStr(" A first ")
			elseif selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_SecondTankManSelfID ) then
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankManSelfID, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankBuff, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankPos, 0 )
				--PrintStr(" A Second ")
			end
			LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_TankColdTime, x402047_g_ColdTime )
			local tankpoint = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTankPlayer)
			x402047_AddBGuildPoint(sceneId, otherselfId, Bguildid, tankpoint)
			
			local msg = ""
			if otherselfId > 0 then
				msg = LuaFnGetGuildName(sceneId, otherselfId).."#{BHXZ_081103_125}"..GetName(sceneId, otherselfId).."#{BHXZ_081103_126}"..x402047_g_TankName[Tankbuf-x402047_g_AttrBuff[1]+1].."。"
			else
				msg = LuaFnGetGuildName(sceneId, selfId).."#{BHXZ_081103_125}"..x402047_g_TankName[Tankbuf-x402047_g_AttrBuff[1]+1].."已经被对方摧毁了。"
			end
			for i = 0, num - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x402047_NotifyFailTips(sceneId, mems[i], msg)
					Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
				end
			end
		else --非战车玩家死亡
			local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillOtherPlayer)
			x402047_AddBGuildPoint(sceneId, otherselfId, Bguildid, point)
		end
	elseif humanguildid == Bguildid then --死亡玩家是B帮的
		local objType = GetCharacterType( sceneId, killerId )
		local otherselfId = 0
		
		if objType == 1 then --如果杀死他的是玩家
			otherselfId = killerId
		elseif objType == 3 then --如果杀死他的是其他玩家的宠物
			otherselfId = GetPetCreator( sceneId, killerId )
			if otherselfId == -1 then
				otherselfId = 0
			end
		else --如果杀死他的是对方NPC比如塔
			otherselfId = 0
		end
		
		--设置帮派杀人数目
		local alreadykillnum = GetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillManNumIndex )
		SetGuildIntNum( sceneId, humanguildid, x402047_g_A_KillManNumIndex, alreadykillnum+1 )
		
		local Tankbuf = x402047_HaveTankBuff( sceneId, selfId )
		
		--设置个人杀人数目，增加帮贡
		if otherselfId > 0 then
			x402047_AddHumanGuildArrayInt( sceneId, otherselfId, x402047_g_Human_KillManIndex, 1 )
			--CityChangeAttr(sceneId, otherselfId, GUILD_CONTRIB_POINT, 1)
			if Tankbuf == 0 then --非战车玩家才发送这个系统消息
				Msg2Player(sceneId, otherselfId, "#{BHXZ_081103_127}"..GetName(sceneId, selfId).."。" , MSG2PLAYER_PARA)
			end
		end
		
		if Tankbuf and Tankbuf ~= 0 then --战车玩家死亡
			if selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_B_FirstTankManSelfID ) then
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankManSelfID, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankBuff, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankPos, 0 )
				--PrintStr(" B first ")
			elseif selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_B_SecondTankManSelfID ) then
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankManSelfID, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankBuff, 0 )
				LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankPos, 0 )
				--PrintStr(" B Second ")
			end
			LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_TankColdTime, x402047_g_ColdTime )
			local tankpoint = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTankPlayer)
			x402047_AddAGuildPoint(sceneId, otherselfId, Aguildid, tankpoint)
			
			local msg = ""
			if otherselfId > 0 then
				msg = LuaFnGetGuildName(sceneId, otherselfId).."#{BHXZ_081103_125}"..GetName(sceneId, otherselfId).."#{BHXZ_081103_126}"..x402047_g_TankName[Tankbuf-x402047_g_AttrBuff[1]+1].."。"
			else
				msg = LuaFnGetGuildName(sceneId, selfId).."#{BHXZ_081103_125}"..x402047_g_TankName[Tankbuf-x402047_g_AttrBuff[1]+1].."已经被对方摧毁了。"
			end
			for i = 0, num - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x402047_NotifyFailTips(sceneId, mems[i], msg)
					Msg2Player(sceneId, mems[i], msg, MSG2PLAYER_PARA)
				end
			end
		else --非战车玩家死亡
			local point = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillOtherPlayer)
			x402047_AddAGuildPoint(sceneId, otherselfId, Aguildid, point)
		end
	end
	
end

--**********************************
-- 通知本帮玩家帮战积分
--**********************************
function x402047_NotifyPoint( sceneId, humanguildid, point )
	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	
	for i = 0, num - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	for i = 0, num - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 and GetHumanGuildID(sceneId, mems[i]) == humanguildid then		-- 不在场景的不做此操作，不逻辑的不操作
			x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_66}"..point )
		end
	end
end

--**********************************
--离开副本
--**********************************
function x402047_Exit( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				-- 取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x402047_g_Back_X, x402047_g_Back_Z )
end

--**********************************
--玩家离开的时候清理身上的灵石物品
--**********************************
function x402047_ClearLingShi( sceneId, selfId )
	for i = 1, getn( x402047_g_LingShiID ) do
		local num = LuaFnGetAvailableItemCount( sceneId, selfId, x402047_g_LingShiID[i] )
		if num > 0 then
			LuaFnDelAvailableItem( sceneId, selfId, x402047_g_LingShiID[i], num )
		end
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x402047_OnCopySceneTimer( sceneId, nowTime )
	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						-- 取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							-- 设置新的定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	
	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	--local i

	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	--旗帜剩余时间
	local FlagRemainTime = LuaFnGetCopySceneData_Param( sceneId, x402047_g_FlagRemainedTime )
	if FlagRemainTime > 0 then
		FlagRemainTime = FlagRemainTime - 1
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_FlagRemainedTime, FlagRemainTime )
		if FlagRemainTime <= 0 then --时间到了旗帜消失
			local nMonsterNum = GetMonsterCount(sceneId)
			for i=0, nMonsterNum-1 do
				local nMonsterId = GetMonsterObjID(sceneId,i)
				local MonsterName = GetName(sceneId, nMonsterId)
				if MonsterName == x402047_g_A_Flag or MonsterName == x402047_g_B_Flag then
					LuaFnDeleteMonster(sceneId, nMonsterId)
					
					local msg = MonsterName.."#{BHXZ_081103_128}"
					for j = 0, membercount - 1 do
						if LuaFnIsObjValid( sceneId, mems[j] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[j] ) == 1 then
							x402047_NotifyFailTips(sceneId, mems[j], msg)
							Msg2Player(sceneId, mems[j], msg, MSG2PLAYER_PARA)
						end
					end
				end
			end
		end
	end
	
	--战车冷却时间
	local AColdTime = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_TankColdTime )
	if AColdTime > 0 then
		AColdTime = AColdTime - 1
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_TankColdTime, AColdTime )
	end
	local BColdTime = LuaFnGetCopySceneData_Param( sceneId, x402047_g_B_TankColdTime )
	if BColdTime > 0 then
		BColdTime = BColdTime - 1
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_TankColdTime, BColdTime )
	end
	
	--NPC加免疫控制
	if TickCount == 1 then
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			local name = GetName(sceneId, nNpcId)
			if name == x402047_g_A_Platform or name == x402047_g_A_FenXiang_Tower or name == x402047_g_A_LuoXing_Tower or
				name == x402047_g_B_Platform or name == x402047_g_B_FenXiang_Tower or name == x402047_g_B_LuoXing_Tower then
				LuaFnSendSpecificImpactToUnit( sceneId, nNpcId, nNpcId, nNpcId, x402047_g_ImmuneControlBuff, 0 )
			end
		end
	end
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	
	--堡垒血量公告
	if 1 then
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			local name = GetName(sceneId, nNpcId)
			local broadcast = 0
			local setindex = 0
			local guild = 0
			local iscontinue = 1 --没有continue语句??
			
			if name == x402047_g_A_Platform then
				broadcast = LuaFnGetCopySceneData_Param(sceneId, x402047_g_A_BroadcastTick)
				setindex = x402047_g_A_BroadcastTick
				guild = Aguildid
			elseif name == x402047_g_B_Platform then
				broadcast = LuaFnGetCopySceneData_Param(sceneId, x402047_g_B_BroadcastTick)
				setindex = x402047_g_B_BroadcastTick
				guild = Bguildid
			else
				iscontinue = 0
			end
			
			if iscontinue == 1 then
				local nMaxHp = GetMaxHp(sceneId, nNpcId)
				local nHp = GetHp(sceneId, nNpcId)
				local downpercent = ""
				
				if nHp <= nMaxHp*0.9 and broadcast == 0 then
					downpercent = "90％"
					LuaFnSetCopySceneData_Param( sceneId, setindex, 1 )
				elseif nHp <= nMaxHp*0.5 and broadcast == 1 then
					downpercent = "50％"
					LuaFnSetCopySceneData_Param( sceneId, setindex, 2 )
				elseif nHp <= nMaxHp*0.1 and broadcast == 2 then
					downpercent = "10％"
					LuaFnSetCopySceneData_Param( sceneId, setindex, 3 )
				end
				
				if downpercent ~= "" then
					local msg = "#{BHXZ_081103_148}"..name.."#{BHXZ_081103_149}"..downpercent.."#{BHXZ_081103_150}"
					for j = 0, membercount - 1 do
						if LuaFnIsObjValid( sceneId, mems[j] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[j] ) == 1 and GetHumanGuildID(sceneId, mems[j]) == guild then
							x402047_NotifyFailTips(sceneId, mems[j], msg)
							Msg2Player(sceneId, mems[j], msg, MSG2PLAYER_PARA)
						end
					end
				end
			end
		end
	end
	
	--TickCount = (x402047_g_LimitTotalHoldTime-x402047_g_CloseTick)
	if leaveFlag == 1 then															-- 需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )
		
		if leaveTickCount >= x402047_g_CloseTick then										-- 倒计时间到，大家都出去吧
			local IsSetOverFlag = LuaFnGetCopySceneData_Param(sceneId, x402047_g_IsSetOverFlag)
			
			if IsSetOverFlag == 0 then
				LuaFnSetCopySceneData_Param(sceneId, x402047_g_IsSetOverFlag, 1)
				
				local Apoint = GetGuildIntNum( sceneId, Aguildid, x402047_g_A_TotalPointIndex )
				local Bpoint = GetGuildIntNum( sceneId, Bguildid, x402047_g_B_TotalPointIndex )
				
				--帮派奖励的循环，需要先找到A帮到底多少人，B帮到底多少人。还要找到xx最多的玩家以记录MissionData，稍后他可以领奖和buff。
				local AGuildcount = 0
				local BGuildcount = 0
				local KillMax = 0
				local FlagMax = 0
				local SourceMax = 0
				local PrizeSelfId = {0,0,0}
				for i=0, membercount-1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						NotifyBattleScore(sceneId, mems[i])
						local guildid = GetHumanGuildID(sceneId, mems[i])
						local KillNum = GetHumanGuildInt( sceneId, mems[i], x402047_g_Human_KillManIndex )
						local FlagNum = GetHumanGuildInt( sceneId, mems[i], x402047_g_Human_FlagIndex )
						local SourceNum = GetHumanGuildInt( sceneId, mems[i], x402047_g_Human_ResourceNumIndex )
						
						--统计xx次数
						if KillNum > KillMax then
							KillMax = KillNum
							PrizeSelfId[1] = mems[i]
						end
						if FlagNum > FlagMax then
							FlagMax = FlagNum
							PrizeSelfId[2] = mems[i]
						end
						if SourceNum > SourceMax then
							SourceMax = SourceNum
							PrizeSelfId[3] = mems[i]
						end
						
						--统计每个帮派的人数
						if guildid == Aguildid then
							AGuildcount = AGuildcount + 1
						elseif guildid == Bguildid then
							BGuildcount = BGuildcount + 1
						end
					end
				end
				--计算两个的效率和计算一个的差不多，所以索性全部计算出来
				local AFailHonour = 0
				if AGuildcount ~= 0 then --避免发生除0错误
					AFailHonour = floor(x402047_g_Fail_TotalHonour/AGuildcount)
				end
				local BFailHonour = 0
				if BGuildcount ~= 0 then --避免发生除0错误
					BFailHonour = floor(x402047_g_Fail_TotalHonour/BGuildcount)
				end
				if AFailHonour > x402047_g_Fail_PerMaxHonour then
					AFailHonour = x402047_g_Fail_PerMaxHonour
				end
				if BFailHonour > x402047_g_Fail_PerMaxHonour then
					BFailHonour = x402047_g_Fail_PerMaxHonour
				end
				
				local isAWin = 0
				if Apoint > Bpoint then --如果平分则判宣战方失败
					isAWin = 1
					
					local log = format("WinGuildID=%d,WinTotalHonour=%d,FailGuildID=%d,FailTotalHonour=%d", Aguildid, x402047_g_Win_PerHonour*AGuildcount, Bguildid, BFailHonour*BGuildcount)					
					ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_HONOUR, -1, log)
				else
					isAWin = 0
					local log = format("WinGuildID=%d,WinTotalHonour=%d,FailGuildID=%d,FailTotalHonour=%d", Bguildid, x402047_g_Win_PerHonour*BGuildcount, Aguildid, AFailHonour*AGuildcount)
					ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_HONOUR, -1, log)
				end
				
				--个人奖励，发送邮件，因为一次帮战一个玩家有可能获得多个称号，所以用了多个flag
				for i = 1, getn(PrizeSelfId) do
					if PrizeSelfId[i] ~= 0 then
						SetMissionFlag(sceneId, PrizeSelfId[i], x402047_g_PrizeFlag[i], 1)
						LuaFnSendSystemMail(sceneId, GetName(sceneId, PrizeSelfId[i]), x402047_g_PrizeMsg[i])
					end
				end
				
				--将当前副本场景里的所有人传送回原来进入时候的场景。传送操作一定是最后一步，因为传送切场景的时候不能进行逻辑处理了
				for i=0, membercount-1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Tankbuf = x402047_HaveTankBuff( sceneId, mems[i] )
						if Tankbuf and Tankbuf ~= 0 then --战车玩家取消buff
							LuaFnCancelSpecificImpact(sceneId,mems[i],Tankbuf)
						end
						x402047_ClearLingShi( sceneId, mems[i] )
						--清理个人临时帮战数据
						for j = x402047_g_Human_TotalPointIndex, x402047_g_Human_ResourceNumIndex do
							SetHumanGuildInt(sceneId, mems[i], j, 0)
						end
						
						local guildid = GetHumanGuildID(sceneId, mems[i])
						if guildid == Aguildid then --是A帮成员
							if isAWin == 1 then --A帮获胜
								x402047_AddHonour( sceneId, mems[i], x402047_g_Win_PerHonour )
								NewWorld( sceneId, mems[i], x402047_g_Exit_SceneID, x402047_g_Win_X, x402047_g_Win_Z )
							else
								x402047_AddHonour( sceneId, mems[i], AFailHonour )
								SetCurTitle(sceneId, mems[i], 23, 0) --失败方强制顶出帮派称号
								LuaFnSendSystemMail(sceneId, GetName(sceneId, mems[i]), x402047_g_FailMsg) --变羊邮件
								LuaFnSendSpecificImpactToUnit(sceneId, mems[i], mems[i], mems[i], x402047_g_SheepBuff, 0 )
								NewWorld( sceneId, mems[i], x402047_g_Exit_SceneID, x402047_g_Fail_X, x402047_g_Fail_Z )
							end
						elseif guildid == Bguildid then --是B帮成员
							if isAWin == 0 then --B帮获胜
								x402047_AddHonour( sceneId, mems[i], x402047_g_Win_PerHonour )
								NewWorld( sceneId, mems[i], x402047_g_Exit_SceneID, x402047_g_Win_X, x402047_g_Win_Z )
							else
								x402047_AddHonour( sceneId, mems[i], BFailHonour )
								SetCurTitle(sceneId, mems[i], 23, 0)  --失败方强制顶出帮派称号
								LuaFnSendSystemMail(sceneId, GetName(sceneId, mems[i]), x402047_g_FailMsg) --变羊邮件
								LuaFnSendSpecificImpactToUnit(sceneId, mems[i], mems[i], mems[i], x402047_g_SheepBuff, 0 )
								NewWorld( sceneId, mems[i], x402047_g_Exit_SceneID, x402047_g_Fail_X, x402047_g_Fail_Z )
							end
						else --不在正确帮派？？
							x402047_Exit( sceneId, mems[i] )
						end
					end
				end
			else--不能让玩家重新进入走领奖流程，不能清理帮派ID因为结束后还要用到帮派ID！！playerenter加了如果已经关闭则马上传出副本
				for i=0, membercount-1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						local Tankbuf = x402047_HaveTankBuff( sceneId, mems[i] )
						if Tankbuf and Tankbuf ~= 0 then --战车玩家取消buff
							LuaFnCancelSpecificImpact(sceneId,mems[i],Tankbuf)
						end
						x402047_ClearLingShi( sceneId, mems[i] )
						--清理个人临时帮战数据
						for j = x402047_g_Human_TotalPointIndex, x402047_g_Human_ResourceNumIndex do
							SetHumanGuildInt(sceneId, mems[i], j, 0)
						end
						
						x402047_Exit( sceneId, mems[i] )
					end
				end
			end
			
			return
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x402047_g_CloseTick - leaveTickCount ) * x402047_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
					x402047_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
			
			--这个地方不需要return
		end
	end
	
	if TickCount == (x402047_g_LimitTotalHoldTime-x402047_g_CloseTick) then		-- 设置副本关闭标志，开始通知
		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x402047_g_StartPoint then --开始记分
		
		--设置记分标志
		LuaFnSetCopySceneData_Param( sceneId, 7, 1 )
		
		--设置玩家阵营，并通知玩家帮战开始
		for i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_108}" )
				Msg2Player(sceneId, mems[i], "#{BHXZ_081103_108}", MSG2PLAYER_PARA)
				
				local guildid = GetHumanGuildID(sceneId, mems[i])
				if guildid == Aguildid then
					SetUnitCampID(sceneId, mems[i], mems[i], 10+Aguildid)
				elseif guildid == Bguildid then
					SetUnitCampID(sceneId, mems[i], mems[i], 11+Aguildid)
				else
					x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_147}" )
					x402047_ClearLingShi( sceneId, mems[i] )
					x402047_Exit( sceneId, mems[i] )
				end
			end
		end
		
		--设置NPC阵营
		local nNpcNum = GetMonsterCount(sceneId)
		for i=0, nNpcNum-1 do
			local nNpcId = GetMonsterObjID(sceneId,i)
			local name = GetName(sceneId, nNpcId)
			if name == x402047_g_A_Platform or name == x402047_g_A_FenXiang_Tower or name == x402047_g_A_LuoXing_Tower then
				SetUnitCampID(sceneId,nNpcId, nNpcId, Aguildid+10)
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			elseif name == x402047_g_B_Platform or name == x402047_g_B_FenXiang_Tower or name == x402047_g_B_LuoXing_Tower then
				SetUnitCampID(sceneId,nNpcId, nNpcId, Aguildid+11)
				SetMonsterFightWithNpcFlag(sceneId, nNpcId, 1)
			end
		end
	else
		
		--帮战开始的提示
		if TickCount < x402047_g_StartPoint then
			local RemainTick = x402047_g_StartPoint - TickCount
			if mod(RemainTick, 60) == 0 then --每分钟提示
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_129}"..floor(RemainTick / 60).."#{BHXZ_081103_130}" )
					end
				end
			end
			if RemainTick <= x402047_g_BackTick then --倒计时提示
				for	i = 0, membercount - 1 do
					if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
						x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_129}"..RemainTick.."#{BHXZ_081103_131}" )
					end
				end
			end
		end
		
		--塔释放技能，每5s起一次作用，焚香塔不能同时放两个技能，所以后一秒在放一个技能
		local modtick = mod( TickCount, 5 )
		if TickCount >= x402047_g_StartPoint and modtick == 0 then
			local nNpcNum = GetMonsterCount(sceneId)
			local PosX = 0
			local PosZ = 0
			
			for i=0, nNpcNum-1 do
				local nNpcId = GetMonsterObjID(sceneId,i)
				local name = GetName(sceneId, nNpcId)
				if name == x402047_g_A_LuoXing_Tower or name == x402047_g_B_LuoXing_Tower then
					if GetHp(sceneId, nNpcId) > 0 then
						PosX,PosZ = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1067,nNpcId,PosX,PosZ,15,0)
					end
				elseif name == x402047_g_A_FenXiang_Tower or name == x402047_g_B_FenXiang_Tower then
					if GetHp(sceneId, nNpcId) > 0 then
						PosX,PosZ = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1068,nNpcId,PosX,PosZ,15,0)
					end
				end
			end
		end
		if TickCount >= x402047_g_StartPoint and modtick == 1 then
			local nNpcNum = GetMonsterCount(sceneId)
			local PosX = 0
			local PosZ = 0
			
			for i=0, nNpcNum-1 do
				local nNpcId = GetMonsterObjID(sceneId,i)
				local name = GetName(sceneId, nNpcId)
				if name == x402047_g_A_FenXiang_Tower or name == x402047_g_B_FenXiang_Tower then
					if GetHp(sceneId, nNpcId) > 0 then
						PosX,PosZ = GetWorldPos(sceneId,nNpcId)
						LuaFnUnitUseSkill(sceneId,nNpcId,1069,nNpcId,PosX,PosZ,15,0)
					end
				end
			end
		end
		
		--战车玩家是否掉线，以及战车坐标更新，每s更新一次
		local TankInfo = {{},{},{},{}}
		local modtick10 = mod( TickCount, 10 )
		local modtick12 = mod( TickCount, 12 )
		for i=0, 3 do
			local tankman = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID+i )
			local PosX = 0
			local PosZ = 0
			TankInfo[i+1].selfId = tankman
			TankInfo[i+1].type = 0
			TankInfo[i+1].impactfriendnum = 0
			TankInfo[i+1].impactenemynum = 0
			TankInfo[i+1].x = 0
			TankInfo[i+1].z = 0
			
			if tankman ~= 0 then
				if LuaFnIsObjValid( sceneId, tankman ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, tankman ) == 1 then
					local buff = x402047_HaveTankBuff( sceneId, tankman )
					if buff == 0 then
						TankInfo[i+1].type = 0
					else
						TankInfo[i+1].type = buff - x402047_g_AttrBuff[1] + 1
						if TankInfo[i+1].type > 5 then
							TankInfo[i+1].type = TankInfo[i+1].type - 5
						end
					end
					
					if buff == 0 then --战车玩家异常掉线
						local oldbuff = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff+i ) --取出副本内记录的buf
						local totalpos = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos+i ) --取出副本内记录的pos
						PosX = floor(totalpos / 10000)
						PosZ = mod(totalpos, 10000)
						
						if oldbuff > 0 then
							local selfIdindex = 0
							if i == 0 or i == 1 then --A帮战车
								selfIdindex = CallScriptFunction( 600051, "FindTankManIndex", sceneId, Aguildid, oldbuff-x402047_g_AttrBuff[1]+1 )
							else --B帮战车
								selfIdindex = CallScriptFunction( 600051, "FindTankManIndex", sceneId, Bguildid, oldbuff-x402047_g_AttrBuff[1]+1 )
							end
							if selfIdindex > 0 and PosX > 0 and PosZ > 0 then
								local monsterID = LuaFnCreateMonster( sceneId, x402047_g_TankID[oldbuff-x402047_g_AttrBuff[1]+1], PosX, PosZ, 3, -1, 402302 )
								LuaFnSendSpecificImpactToUnit( sceneId, monsterID, monsterID, monsterID, x402047_g_ImmuneControlBuff, 0 )
							end
						end
						
						LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID+i, 0 )
						LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff+i, 0 )
						LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos+i, 0 )
					else --更新坐标
						PosX,PosZ = GetWorldPos(sceneId,tankman)
						LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos+i, floor(PosX)*10000+floor(PosZ) )
						TankInfo[i+1].x = PosX
						TankInfo[i+1].z = PosZ
						
						--战车放光效
						if i == 0 or i == 1 then--A帮
							if modtick12 == 7 and TankInfo[i+1].type == 1 then
								LuaFnSendSpecificImpactToUnit( sceneId, tankman, tankman, tankman, x402047_g_LightBuff[TankInfo[i+1].type], 0 )
							elseif modtick10 == 8 and 2 <= TankInfo[i+1].type and TankInfo[i+1].type <= 4 then
								LuaFnSendSpecificImpactToUnit( sceneId, tankman, tankman, tankman, x402047_g_LightBuff[TankInfo[i+1].type], 0 )
							end
						else--B帮
							if modtick12 == 1 and TankInfo[i+1].type == 1 then
								LuaFnSendSpecificImpactToUnit( sceneId, tankman, tankman, tankman, x402047_g_LightBuff[TankInfo[i+1].type], 0 )
							elseif modtick10 == 3 and 2 <= TankInfo[i+1].type and TankInfo[i+1].type <= 4 then
								LuaFnSendSpecificImpactToUnit( sceneId, tankman, tankman, tankman, x402047_g_LightBuff[TankInfo[i+1].type], 0 )
							end
						end
						
					end
				else --ID不正确或者不能逻辑说明战车玩家已经掉线，需要做掉线处理
					local oldbuff = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff+i ) --取出副本内记录的buf
					local totalpos = LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos+i ) --取出副本内记录的pos
					PosX = floor(totalpos / 10000)
					PosZ = mod(totalpos, 10000)
					
					if oldbuff > 0 then
						local selfIdindex = 0
						if i == 0 or i == 1 then --A帮战车
							selfIdindex = CallScriptFunction( 600051, "FindTankManIndex", sceneId, Aguildid, oldbuff-x402047_g_AttrBuff[1]+1 )
						else --B帮战车
							selfIdindex = CallScriptFunction( 600051, "FindTankManIndex", sceneId, Bguildid, oldbuff-x402047_g_AttrBuff[1]+1 )
						end
						if selfIdindex > 0 and PosX > 0 and PosZ > 0 then
							local monsterID = LuaFnCreateMonster( sceneId, x402047_g_TankID[oldbuff-x402047_g_AttrBuff[1]+1], PosX, PosZ, 3, -1, 402302 )
							LuaFnSendSpecificImpactToUnit( sceneId, monsterID, monsterID, monsterID, x402047_g_ImmuneControlBuff, 0 )
						end
					end
					
					LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID+i, 0 )
					LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff+i, 0 )
					LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos+i, 0 )
				end --end if-else
			end --end if
		end --end for
		
		--定时检查队伍成员的帮派ID，如果不符合，则踢出副本
		--战车放技能
		local Acount = 0
		local Bcount = 0
		local AGuildName = ""
		local BGuildName = ""
		
		for	i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				local guildid = GetHumanGuildID(sceneId, mems[i])
				local Tankbuf = x402047_HaveTankBuff( sceneId, mems[i] )
				local isalive = LuaFnIsCharacterLiving( sceneId, mems[i] )
				local xx,zz = GetWorldPos(sceneId,mems[i])
				if guildid == Aguildid then
					Acount = Acount + 1
					if AGuildName == "" then
						AGuildName = LuaFnGetGuildName(sceneId, mems[i])
					end
					
					if modtick10 == 3 and Tankbuf == 0 and isalive == 1 then --白虎战车,朱雀战车,玄武战车
						for	j = 1, 2 do --对己方的效果
							if TankInfo[j].impactfriendnum < x402047_g_TankMaxFriendNum and (TankInfo[j].type == 2 or TankInfo[j].type == 3 or TankInfo[j].type == 4)
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][1], 0 )
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][2], 0 )
								TankInfo[j].impactfriendnum = TankInfo[j].impactfriendnum + 1
							end
						end
						
						for	j = 3, 4 do --对敌方的效果
							if (TankInfo[j].type == 2 or TankInfo[j].type == 3 or TankInfo[j].type == 4)
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								if TankInfo[j].impactenemynum < x402047_g_TankMaxEnemyNum then
									LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankEnemyBuff[TankInfo[j].type], 0 )
									TankInfo[j].impactenemynum = TankInfo[j].impactenemynum + 1
								end
								local Addbuff = x402047_AttackBuffByHuman( sceneId, TankInfo[j].selfId, TankInfo[j].type )
								LuaFnSendSpecificImpactBySkillToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], Addbuff, 0 )
							end
						end
					end
					if modtick12 == 1 and Tankbuf == 0 and isalive == 1 then --青龙战车
						for	j = 1, 2 do --对己方的效果
							if TankInfo[j].impactfriendnum < x402047_g_TankMaxFriendNum and TankInfo[j].type == 1
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][1], 0 )
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][2], 0 )
								TankInfo[j].impactfriendnum = TankInfo[j].impactfriendnum + 1
							end
						end
						
						for	j = 3, 4 do --对敌方的效果
							if TankInfo[j].type == 1 and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								if TankInfo[j].impactenemynum < x402047_g_TankMaxEnemyNum then
									LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankEnemyBuff[TankInfo[j].type], 0 )
									TankInfo[j].impactenemynum = TankInfo[j].impactenemynum + 1
								end
								local Addbuff = x402047_AttackBuffByHuman( sceneId, TankInfo[j].selfId, TankInfo[j].type )
								LuaFnSendSpecificImpactBySkillToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], Addbuff, 0 )
							end
						end
					end
				elseif guildid == Bguildid then
					Bcount = Bcount + 1
					if BGuildName == "" then
						BGuildName = LuaFnGetGuildName(sceneId, mems[i])
					end
					
					if modtick10 == 8 and Tankbuf == 0 and isalive == 1 then --白虎战车,朱雀战车,玄武战车
						for	j = 1, 2 do --对敌方的效果
							if (TankInfo[j].type == 2 or TankInfo[j].type == 3 or TankInfo[j].type == 4)
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								if TankInfo[j].impactenemynum < x402047_g_TankMaxEnemyNum then
									LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankEnemyBuff[TankInfo[j].type], 0 )
									TankInfo[j].impactenemynum = TankInfo[j].impactenemynum + 1
								end
								local Addbuff = x402047_AttackBuffByHuman( sceneId, TankInfo[j].selfId, TankInfo[j].type )
								LuaFnSendSpecificImpactBySkillToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], Addbuff, 0 )
							end
						end
						
						for	j = 3, 4 do --对己方的效果
							if TankInfo[j].impactfriendnum < x402047_g_TankMaxFriendNum and (TankInfo[j].type == 2 or TankInfo[j].type == 3 or TankInfo[j].type == 4)
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][1], 0 )
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][2], 0 )
								TankInfo[j].impactfriendnum = TankInfo[j].impactfriendnum + 1
							end
						end
					end
					if modtick12 == 7 and Tankbuf == 0 and isalive == 1 then --青龙战车
						for	j = 1, 2 do --对敌方的效果
							if TankInfo[j].type == 1 and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								if TankInfo[j].impactenemynum < x402047_g_TankMaxEnemyNum then
									LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankEnemyBuff[TankInfo[j].type], 0 )
									TankInfo[j].impactenemynum = TankInfo[j].impactenemynum + 1
								end
								local Addbuff = x402047_AttackBuffByHuman( sceneId, TankInfo[j].selfId, TankInfo[j].type )
								LuaFnSendSpecificImpactBySkillToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], Addbuff, 0 )
							end
						end
						
						for	j = 3, 4 do --对己方的效果
							if TankInfo[j].impactfriendnum < x402047_g_TankMaxFriendNum and TankInfo[j].type == 1 
							and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][1], 0 )
								LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, mems[i], x402047_g_TankFriendBuff[TankInfo[j].type][2], 0 )
								TankInfo[j].impactfriendnum = TankInfo[j].impactfriendnum + 1
							end
						end
					end
				else
					if Tankbuf and Tankbuf ~= 0 then --战车玩家不在正确帮派
						LuaFnCancelSpecificImpact(sceneId,mems[i],Tankbuf)
					end
					x402047_NotifyFailTips( sceneId, mems[i], "#{BHXZ_081103_147}" )
					x402047_ClearLingShi( sceneId, mems[i] )
					x402047_Exit( sceneId, mems[i] )
				end
			end
		end
		
		SetGuildIntNum( sceneId, Aguildid, x402047_g_A_numIndex, Acount )
		SetGuildIntNum( sceneId, Bguildid, x402047_g_B_numIndex, Bcount )
		
		--战斗进程公告播放功能10分，20分，30分
		if TickCount == (x402047_g_StartPoint+10*60) or TickCount == (x402047_g_StartPoint+20*60) or TickCount == (x402047_g_StartPoint+30*60) then
			local Apoint = GetGuildIntNum( sceneId, Aguildid, x402047_g_A_TotalPointIndex )
			local Bpoint = GetGuildIntNum( sceneId, Bguildid, x402047_g_B_TotalPointIndex )
			if AGuildName == "" then --如果这个帮派没人则无法取出帮派名称
				AGuildName = Aguildid.."号"
			end
			if BGuildName == "" then --如果这个帮派没人则无法取出帮派名称
				BGuildName = Bguildid.."号"
			end
			local leadmsg = ""
			if Apoint > Bpoint then
				leadmsg = AGuildName.."#{BHXZ_081103_132}"
			else
				leadmsg = BGuildName.."#{BHXZ_081103_132}"
			end
			local msg = "#{BHXZ_081103_133}"..floor((TickCount-x402047_g_StartPoint)/60).."#{BHXZ_081103_134}"..AGuildName.."#{BHXZ_081103_135}"..Acount.."#{BHXZ_081103_136}"..Apoint.."！"..BGuildName.."#{BHXZ_081103_135}"..Bcount.."#{BHXZ_081103_136}"..Bpoint.."！"..leadmsg
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then		-- 不在场景的不做此操作，不逻辑的不操作
					x402047_NotifyFailTips( sceneId, mems[i], msg )
					Msg2Player(sceneId, mems[i], msg , MSG2PLAYER_PARA)
				end
			end
		end
		
		--盘古战车放技能
		for j=1, 4 do
			if TankInfo[j].type == 5 and modtick10 == 4 then
				local nNpcNum = GetMonsterCount(sceneId)
				local attckindex = 0
				if j == 1 or j == 2 then
					attckindex = 3
				else
					attckindex = 1
				end
				
				for i=0, nNpcNum-1 do --攻击对方建筑
					local nNpcId = GetMonsterObjID(sceneId,i)
					local name = GetName(sceneId, nNpcId)
					local xx,zz = GetWorldPos(sceneId,nNpcId)
					
					if (((j == 3 or j == 4) and (name == x402047_g_A_LuoXing_Tower or name == x402047_g_A_FenXiang_Tower or name == x402047_g_A_Platform)) or
							((j == 1 or j == 2) and (name == x402047_g_B_LuoXing_Tower or name == x402047_g_B_FenXiang_Tower or name == x402047_g_B_Platform))) and
							GetHp(sceneId, nNpcId) > 0 and (TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
						LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, nNpcId, x402047_g_PanGuTankAttackBuff, 0 )
					end
				end
				
				for i=attckindex, attckindex+1 do --攻击对方战车
					local xx,zz = GetWorldPos(sceneId,TankInfo[i].selfId)
					
					if TankInfo[i].type ~= 0 and GetHp(sceneId, TankInfo[i].selfId) > 0 and
						(TankInfo[j].x-xx)*(TankInfo[j].x-xx) + (TankInfo[j].z-zz)*(TankInfo[j].z-zz) < 15*15 then
						LuaFnSendSpecificImpactToUnit( sceneId, TankInfo[j].selfId, TankInfo[j].selfId, TankInfo[i].selfId, x402047_g_PanGuTankAttackBuff, 0 )
					end
				end
			end
		end
		
	end
end

--**********************************
-- 战车buff取消时候回调的脚本函数
--**********************************
function x402047_OnImpactFadeOut( sceneId, selfId, impactId )
	
	local tanktype = impactId-x402047_g_AttrBuff[1]+1
	
	--这个要先写，意外情况下其他场景也可以取消这个buf
	LuaFnCancelSpecificImpact(sceneId,selfId,x402047_g_TankBuff[tanktype])
	LuaFnCancelSpecificImpact(sceneId,selfId,x402047_g_ImmuneControlBuff)
	--LuaFnCancelSpecificImpact(sceneId,selfId,impactId) --注释掉这个
	
	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end
	
	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= FUBEN_BANGZHAN then
		return
	end
	
	--是否开始帮战积分
	if LuaFnGetCopySceneData_Param( sceneId, 7 ) == 0 then
		return
	end
	
	--副本场景记录的战车玩家selfId
	local isAguild = 0
	if selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID ) then
		isAguild = 1
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankManSelfID, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankBuff, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_FirstTankPos, 0 )
	elseif selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_A_SecondTankManSelfID ) then
		isAguild = 1
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankManSelfID, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankBuff, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_SecondTankPos, 0 )
	elseif selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_B_FirstTankManSelfID ) then
		isAguild = 0
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankManSelfID, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankBuff, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_FirstTankPos, 0 )
	elseif selfId == LuaFnGetCopySceneData_Param( sceneId, x402047_g_B_SecondTankManSelfID ) then
		isAguild = 0
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankManSelfID, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankBuff, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_SecondTankPos, 0 )
	else --死亡的玩家在前面x402047_OnHumanDie已经清除了副本内的selfid，因此不会继续往下创建战车
		return
	end
	
	Msg2Player(sceneId, selfId, "#{BHXZ_081103_137}"..x402047_g_TankName[tanktype].."。" , MSG2PLAYER_PARA)
	
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )	-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	
	--血量少于20%直接算爆掉了，不创建战车，战车玩家下线规则还按照原地创建战车 #43231
	if GetHp(sceneId,selfId) >= floor(GetMaxHp(sceneId,selfId)*0.2) then
		--一定要找到一个可以放玩家selfId的地方才创建战车模型，防止产生出超过2辆的战车，还有战车类型不能重复
		local selfIdindex = CallScriptFunction( 600051, "FindTankManIndex", sceneId, isAguild, tanktype )
		if selfIdindex > 0 then
			local PosX,PosZ = GetWorldPos(sceneId,selfId)
			local monsterID = LuaFnCreateMonster( sceneId, x402047_g_TankID[tanktype], PosX, PosZ, 3, -1, 402302 )
			LuaFnSendSpecificImpactToUnit( sceneId, monsterID, monsterID, monsterID, x402047_g_ImmuneControlBuff, 0 )
		end
	else --设置冷却时间，提示信息，增加积分，设置帮派杀人数目
		--取得当前场景里的人数
		local num = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		
		for i = 0, num - 1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
		end
		
		local msg = GetName(sceneId, selfId).."#{BHXZ_090112_38}"
		for i = 0, num - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
				x402047_NotifyFailTips(sceneId, mems[i], msg)
			end
		end
		BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;GLD:#{BHXZ_090112_39}", 6); --帮派频道
		
		if isAguild == 1 then
			LuaFnSetCopySceneData_Param( sceneId, x402047_g_A_TankColdTime, x402047_g_ColdTime )
			local tankpoint = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTankPlayer)
			x402047_AddBGuildPoint(sceneId, 0, Bguildid, tankpoint)
			--设置帮派杀人数目
			local alreadykillnum = GetGuildIntNum( sceneId, Bguildid, x402047_g_B_KillManNumIndex )
			SetGuildIntNum( sceneId, Bguildid, x402047_g_B_KillManNumIndex, alreadykillnum+1 )
		else
			LuaFnSetCopySceneData_Param( sceneId, x402047_g_B_TankColdTime, x402047_g_ColdTime )
			local tankpoint = GetGuildWarPoint(sceneId, x402047_g_GuildPoint_KillTankPlayer)
			x402047_AddAGuildPoint(sceneId, 0, Aguildid, tankpoint)
			--设置帮派杀人数目
			local alreadykillnum = GetGuildIntNum( sceneId, Aguildid, x402047_g_A_KillManNumIndex )
			SetGuildIntNum( sceneId, Aguildid, x402047_g_A_KillManNumIndex, alreadykillnum+1 )
		end
	end
	
end

--**********************************
-- 是否有战车buff，有返回buffID没有返回0
--**********************************
function x402047_HaveTankBuff( sceneId, selfId )
	for i = 1, getn( x402047_g_AttrBuff ) do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402047_g_AttrBuff[i]) == 1 then
			return x402047_g_AttrBuff[i]
		end
	end
	return 0
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x402047_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x402047_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 是否本帮进入副本的人数超过上限 x402047_g_MaxMembers 人
--**********************************
function x402047_IsGuildFull( sceneId, guildid )
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	
	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	--local i
	
	for i = 0, membercount - 1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end
	
	local Acount = 0
	local Bcount = 0
	for	i = 0, membercount - 1 do
		if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, mems[i] ) == 1 then
			local guildid = GetHumanGuildID(sceneId, mems[i])
			if guildid == Aguildid then
				Acount = Acount + 1
			end
		end
	end
	Bcount = membercount - Acount
	
	if guildid == Aguildid then
		if Acount > x402047_g_MaxMembers then
			return 1
		else
			return 0
		end
	elseif guildid == Bguildid then
		if Bcount > x402047_g_MaxMembers then
			return 1
		else
			return 0
		end
	else --应该不会走到这里来，这个函数调用后面的逻辑部分有准确的是否在帮派中的判断，因此这里返回0表示通过
		return 0
	end
	
end

--**********************************
--是否是A帮玩家，NPC obj脚本调用到这里
--**********************************
function x402047_IsCommonAGuild( sceneId, selfId )
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local humanguildid = GetHumanGuildID(sceneId, selfId)
	
	if Aguildid == humanguildid then
		return 1
	end
	
	return 0
end

--**********************************
--是否是B帮玩家，NPC obj脚本调用到这里
--**********************************
function x402047_IsCommonBGuild( sceneId, selfId )
	local totalguildid = LuaFnGetCopySceneData_Param( sceneId, 6 )					-- 取得保存的帮派ID合体
	local Aguildid = floor(totalguildid / 10000)
	local Bguildid = mod(totalguildid, 10000)
	local humanguildid = GetHumanGuildID(sceneId, selfId)

	if Bguildid == humanguildid then
		return 1
	end
	
	return 0
end

--**********************************
--增加A帮积分并通知A帮玩家，杀人、建筑、大旗、灵石NPC脚本调用到这里
--**********************************
function x402047_AddAGuildPoint( sceneId, selfId, guildid, addpoint )
	local point = GetGuildIntNum( sceneId, guildid, x402047_g_A_TotalPointIndex )
	point = point + addpoint
	x402047_NotifyPoint( sceneId, guildid, point ) --通知玩家帮派
	SetGuildIntNum( sceneId, guildid, x402047_g_A_TotalPointIndex, point )--保存积分
	if selfId > 0 then --杀人的是对方NPC则这里是0，切换战车属性的时候也是0，血量20%以下离开战车也是0
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_TotalPointIndex, addpoint )
	end
end

--**********************************
--增加B帮积分并通知B帮玩家，杀人、建筑、大旗、灵石NPC脚本调用到这里
--**********************************
function x402047_AddBGuildPoint( sceneId, selfId, guildid, addpoint )
	local point = GetGuildIntNum( sceneId, guildid, x402047_g_B_TotalPointIndex )
	point = point + addpoint
	x402047_NotifyPoint( sceneId, guildid, point ) --通知玩家帮派
	SetGuildIntNum( sceneId, guildid, x402047_g_B_TotalPointIndex, point )--保存积分
	if selfId > 0 then --杀人的是对方NPC则这里是0，切换战车属性的时候也是0，血量20%以下离开战车也是0
		x402047_AddHumanGuildArrayInt( sceneId, selfId, x402047_g_Human_TotalPointIndex, addpoint )
	end
end

--**********************************
--增加个人积分数据
--**********************************
function x402047_AddHumanGuildArrayInt( sceneId, selfId, ArrayIntIndex, addvalue )
	local value = GetHumanGuildInt( sceneId, selfId, ArrayIntIndex )
	value = value + addvalue
	SetHumanGuildInt( sceneId, selfId, ArrayIntIndex, value )
end

--**********************************
--增加个人荣誉值
--**********************************
function x402047_AddHonour( sceneId, selfId, addHonour )
	if addHonour > 0 then
		local Honour = GetHonour( sceneId, selfId )
		Honour = Honour + addHonour
		SetHonour( sceneId, selfId, Honour )
	end
end

--**********************************
-- 清除场景内的XX怪
--**********************************
function x402047_ClearMonsterByName(sceneId, szName)
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nMonsterId)== szName  then
			LuaFnDeleteMonster(sceneId, nMonsterId)
		end
	end
end

--**********************************
--根据战车类型以及个人属性返回一个要加给对方的攻击buff
--**********************************
function x402047_AttackBuffByHuman( sceneId, selfId, TankType )
	
	if TankType == 1 then --青龙战车
		local PhysicsAttack = GetHumanAttr(sceneId, selfId, 1)
		local nMax = getn( x402047_g_PhysicsAttack_Buff )
		
		for i = 1, nMax do
			if PhysicsAttack <= x402047_g_PhysicsAttack_Buff[i].value then
				return x402047_g_PhysicsAttack_Buff[i].buff
			end
		end
		
		if PhysicsAttack >= x402047_g_PhysicsAttack_Buff[nMax].value then
			return x402047_g_PhysicsAttack_Buff[nMax].buff
		end
		
	elseif TankType == 2 then --白虎战车
		local MagicAttack = GetHumanAttr(sceneId, selfId, 2)
		local nMax = getn( x402047_g_MagicAttack_Buff )
		
		for i = 1, nMax do
			if MagicAttack <= x402047_g_MagicAttack_Buff[i].value then
				return x402047_g_MagicAttack_Buff[i].buff
			end
		end
		
		if MagicAttack >= x402047_g_MagicAttack_Buff[nMax].value then
			return x402047_g_MagicAttack_Buff[nMax].buff
		end
		
	elseif TankType == 3 then --朱雀战车
		local cold = GetHumanAttr(sceneId, selfId, 3)
		local fire = GetHumanAttr(sceneId, selfId, 4)
		local nMax = getn( x402047_g_ColdFire_Buff )
		
		for i = 1, nMax do
			if (cold+fire) <= x402047_g_ColdFire_Buff[i].value then
				return x402047_g_ColdFire_Buff[i].buff
			end
		end
		
		if (cold+fire) >= x402047_g_ColdFire_Buff[nMax].value then
			return x402047_g_ColdFire_Buff[nMax].buff
		end
		
	elseif TankType == 4 then --玄武战车
		local light = GetHumanAttr(sceneId, selfId, 5)
		local poison = GetHumanAttr(sceneId, selfId, 6)
		local nMax = getn( x402047_g_LightPoison_Buff )
		
		for i = 1, nMax do
			if (light+poison) <= x402047_g_LightPoison_Buff[i].value then
				return x402047_g_LightPoison_Buff[i].buff
			end
		end
		
		if (light+poison) >= x402047_g_LightPoison_Buff[nMax].value then
			return x402047_g_LightPoison_Buff[nMax].buff
		end
		
	end
	
	return 0
end
