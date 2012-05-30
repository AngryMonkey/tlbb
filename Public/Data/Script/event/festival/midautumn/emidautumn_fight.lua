-- 中秋任务

--************************************************************************
--MisDescBegin

-- 脚本号
x050010_g_ScriptId = 050010

-- 任务号
x050010_g_MissionId = 396					-- 395 - 399

--上一个任务的ID
x050010_g_MissionIdPre = 395

-- 任务目标npc
x050010_g_Name = "杨文广"

--任务归类
x050010_g_MissionKind = 3

--任务等级
x050010_g_MissionLevel = 10000

-- 任务文本描述
x050010_g_MissionName = "击杀一品堂"
x050010_g_MissionInfo = "    好，拳拳报国之心令人钦佩，这就带你前往战区。"			--任务描述
x050010_g_MissionTarget = "    击杀来自一品堂的高手或头目。"						-- 任务目标
x050010_g_ContinueInfo = "    阁下身上似乎并没有令牌，交字从何谈起？"				--未完成任务的npc对话
x050010_g_MissionComplete = "    甚好甚好，为国效力，乃我辈应为之事。"				--完成任务npc说的话

x050010_g_IsMissionOkFail = 0				-- 0号：当前任务是否完成(0未完成；1完成)
x050010_g_Param_sceneid = 1					-- 1号：当前副本任务的场景号

-- 任务奖励

--MisDescEnd
--************************************************************************

x050010_g_ControlScript = 050009

x050010_g_NumText_Main = 1				-- 击退一品堂高手入侵
x050010_g_NumText_SubmitBooty = 2		-- 交一品堂令牌
x050010_g_NumText_Question = 3			-- 中秋积分有什么用

x050010_g_CopySceneMap = "bianguan_1.nav"
x050010_g_CopySceneArea = "bianguan_1_area.ini"

x050010_g_CopySceneType = FUBEN_BIANGUAN	--副本类型，定义在ScriptGlobal.lua里面
x050010_g_LimitMembers = 3					--可以进副本的最小队伍人数
x050010_g_TickTime = 5						--回调脚本的时钟时间（单位：秒/次）
x050010_g_LimitTotalHoldTime = 240			--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x050010_g_CloseTick = 3						--副本关闭前倒计时（单位：次数）
x050010_g_NoUserTime = 300					--副本中没有人后可以继续保存的时间（单位：秒）

x050010_g_Fuben_X = 29
x050010_g_Fuben_Z = 49

x050010_g_BackInfo = { sceneId = 8, x = 252, z = 146 }

x050010_g_MonsterGroupID = 1
x050010_g_BossGroupID = 2					--需要杀死的Boss的GroupID

x050010_g_CopySceneInfo = {}
x050010_g_CopySceneInfo[1] = { odds = 65, bossScore = 3, monsterScore = 1, bootyOdds = 30 }
x050010_g_CopySceneInfo[2] = { odds = 85, bossScore = 5, monsterScore = 1, bootyOdds = 50 }
x050010_g_CopySceneInfo[3] = { odds = 95, bossScore = 7, monsterScore = 1, bootyOdds = 70 }
x050010_g_CopySceneInfo[4] = { odds = 100, bossScore = 10, monsterScore = 1, bootyOdds = 100 }

x050010_g_Booty = 40004302

x050010_g_StdExpTbl = {
	30, 36, 42, 48, 54, 60, 66, 72, 78, 101, 108, 115, 122, 130,
	137, 144, 151, 158, 166, 202, 210, 218, 227, 235, 244, 252,
	260, 269, 277, 326, 336, 346, 355, 365, 374, 384, 394, 403,
	413, 475, 486, 497, 508, 518, 529, 540, 551, 562, 572, 648,
	660, 672, 684, 696, 708, 720, 732, 744, 756, 845, 858, 871,
	884, 898, 911, 924, 937, 950, 964, 1066, 1080, 1094, 1109,
	1123, 1138, 1152, 1166, 1181, 1195, 1310, 1326, 1342, 1357,
	1373, 1388, 1404, 1420, 1435, 1451, 1579, 1596, 1613, 1630,
	1646, 1663, 1680, 1697, 1714, 1730, 1872, 1890, 1908, 1926,
	1944, 1962, 1980, 1998, 2016, 2034, 2189, 2208, 2227, 2246,
	2266, 2285, 2304, 2323, 2342, 2362, 2530,
}

--**********************************
--任务入口函数
--**********************************
function x050010_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	if GetName( sceneId, targetId ) ~= x050010_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if GetNumText() == x050010_g_NumText_Main then
		x050010_AskEnterCopyScene( sceneId, selfId, targetId )
	elseif GetNumText() == x050010_g_NumText_SubmitBooty then
		x050010_SubmitBooty( sceneId, selfId, targetId )
	elseif GetNumText() == x050010_g_NumText_Question then
		x050010_AnswerQuestion( sceneId, selfId, targetId )
	else
		return
	end
end

--**********************************
--发布主任务
--**********************************
function x050010_AskEnterCopyScene( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionIdPre ) <= 0 then			-- 没有任务
		return
	end

	-- 取得玩家附近的队友数量（包括自己）
	local i, nearteammembercount, member
	local members = {}
	local validmembercount = 0
	if LuaFnHasTeam( sceneId, selfId ) ~= 0 then
		if LuaFnIsTeamLeader( sceneId, selfId ) ~= 0 then					-- 是队长
			nearteammembercount = GetNearTeamCount( sceneId, selfId )
			for i=0, nearteammembercount-1 do
				member = GetNearTeamMember( sceneId, selfId, i )
				if IsHaveMission( sceneId, member, x050010_g_MissionIdPre ) > 0
				 and GetMissionCount( sceneId, selfId ) < 20 then			-- 有任务
					validmembercount = validmembercount + 1
					members[validmembercount] = member
				end
			end
		else																-- 队员
			x050010_NotifyFailBox( sceneId, selfId, targetId, "    请尊队的队长来找我吧。" )
			return
		end
	end

	if validmembercount < x050010_g_LimitMembers then
		x050010_NotifyFailBox( sceneId, selfId, targetId, "    敌势甚强，你孤身恐难取胜，至少需要" ..
						x050010_g_LimitMembers .. "人我才会送你们去。" )
		return
	else
		x050010_NotifyFailBox( sceneId, selfId, targetId, "    好，拳拳报国之心令人钦佩，这就带你前往战区。" )
	end

	-- 所有之前的任务数据清空
	local misIndex
	local mylevel = 0
	for i = 1, validmembercount do
		if IsHaveMission( sceneId, members[i], x050010_g_MissionId ) == 0 then				-- 没有任务
			AddMission( sceneId, members[i], x050010_g_MissionId, x050010_g_ScriptId, 1, 0, 0 )		-- kill、area、item
		end

		misIndex = GetMissionIndexByID( sceneId, members[i], x050010_g_MissionId )
		SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_IsMissionOkFail, 0 )	-- 任务置为未完成
		SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_Param_sceneid, -1 )		-- 副本场景置为 -1

		if mylevel < GetLevel( sceneId, members[i] ) then							-- 得到最大级别
			mylevel = GetLevel( sceneId, members[i] )
		end
	end

	-- 创建副本
	local subCopySceneType = random( 100 )
	for i = 1, 4 do
		if subCopySceneType <= x050010_g_CopySceneInfo[i].odds then
			subCopySceneType = i
			break
		end
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x050010_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x050010_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x050010_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x050010_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x050010_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, subCopySceneType )				--保存副本怪物类型号
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Boss的数量

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x050010_g_CopySceneArea )

	local monsterINI = "bianguan_" .. subCopySceneType .. "_monster_" .. iniLevel .. ".ini"
	LuaFnSetSceneLoad_Monster( sceneId, monsterINI )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x050010_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x050010_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end
end

--**********************************
--放弃任务
--**********************************
function x050010_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) == 0 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x050010_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x050010_g_Param_sceneid )

	DelMission( sceneId, selfId, x050010_g_MissionId )

	if sceneId == copyscene then
		x050010_NotifyFailTips( sceneId, selfId, "任务失败！" )
		x050010_Exit( sceneId, selfId )
	end
end

--**********************************
--交一品堂令牌
--**********************************
function x050010_SubmitBooty( sceneId, selfId, targetId )
	local nItemNum = GetItemCount( sceneId, selfId, x050010_g_Booty )

	if nItemNum < 1 then
		x050010_NotifyFailBox( sceneId, selfId, targetId, x050010_g_ContinueInfo )
		return
	end

	-- 得到“怪物经验为匹配该等级怪正常经验*1.5”
	local exp = x050010_g_StdExpTbl[ GetLevel( sceneId, selfId ) ]
	if not exp then
		exp = 1
	end

	exp = exp * 1.5

	LuaFnDelAvailableItem( sceneId, selfId, x050010_g_Booty, 1 )
	AddExp( sceneId, selfId, exp )

	x050010_NotifyFailBox( sceneId, selfId, targetId, x050010_g_MissionComplete )

	local baoshi_lv1={	50101001,50101002,50102001,50102002,50102003,
						50102004,50103001,50104002,50111001,50111002,
						50112001,50112002,50112003,50112004,50113001,
						50113002,50113003,50113004,50113005,50114001,}
	local baoshiname_lv1={	"猫眼石（1级）","虎眼石（1级）","黄晶石（1级）","蓝晶石（1级）","红晶石（1级）",
							"绿晶石（1级）","紫玉（1级）","变石（1级）","石榴石（1级）","尖晶石（1级）",
							"黄玉（1级）","皓石（1级）","月光石（1级）","碧玺（1级）","黄宝石（1级）",
							"蓝宝石（1级）","绿宝石（1级）","红宝石（1级）","黑宝石（1级）","祖母绿（1级）",}
							
	local baoshi_lv2={	50201001,50201002,50202001,50202002,50202003,
						50202004,50203001,50204002,50211001,50211002,
						50212001,50212002,50212003,50212004,50213001,
						50213002,50213003,50213004,50213005,50214001,}
	local baoshiname_lv2={	"猫眼石（2级）","虎眼石（2级）","黄晶石（2级）","蓝晶石（2级）","红晶石（2级）",
							"绿晶石（2级）","紫玉（2级）","变石（2级）","石榴石（2级）","尖晶石（2级）",
							"黄玉（2级）","皓石（2级）","月光石（2级）","碧玺（2级）","黄宝石（2级）",
							"蓝宝石（2级）","绿宝石（2级）","红宝石（2级）","黑宝石（2级）","祖母绿（2级）",}
							
	local jianding={30508041,30508051,30507041,30507051,30506041,30506051}
	local jiandingname={"鉴定符5级","鉴定符6级","鉴定书5级","鉴定书6级","鉴定卷轴5级","鉴定卷轴6级"}

	local yirong={	30501007,30501008,30501009,30501010,30501011,
					30501012,30501013,30501014,30501015,30501016,}
	local yirongname={	"易容丹","易容丹","易容丹","易容丹","易容丹",
						"易容丹","易容丹","易容丹","易容丹","易容丹",}
						
	local lihua={30505023,30505024,30505025,30505026,}
	local lihuaname={"中字礼花","秋字礼花","快字礼花","乐字礼花",}

	local rdvalue = random( 10000 )
	local itemSN, itemName
	if rdvalue < 10 then	-- 0~0.1%
		local tp = random( 20 )
		itemSN=baoshi_lv2[tp]
		itemName=baoshiname_lv2[tp]
	elseif rdvalue < 10+100 then	--0.1%~1.1%
		itemSN=20307001
		itemName="染发剂"
	elseif rdvalue < 10+100+300 then 	--1.1%~4.1%
		local tp = random( 20 )
		itemSN=baoshi_lv1[tp]
		itemName=baoshiname_lv1[tp]
	elseif rdvalue < 10+100+300+500 then 	--4.1%~9.1%
		itemSN=30503011
		itemName="珍兽还童卷轴"
	elseif rdvalue < 10+100+300+500+500 then 	--9.1~14.1%
		local tp = random( 6 )
		itemSN=jianding[tp]
		itemName=jiandingname[tp]
	elseif rdvalue < 10+100+300+500+500+700 then 	--14.1%~21.1%
		local tp = random( 10 )
		itemSN=yirong[tp]
		itemName=yirongname[tp]
	elseif rdvalue < 10+100+300+500+500+700+1000 then 	--21.1%~31.1%
		local tp = random( 4 )
		itemSN=lihua[tp]
		itemName=lihuaname[tp]
	else
		return
	end

	-- 给予玩家随机奖励物品
	--local itemSN, itemName, _, bBroadCast = GetOneMissionBonusItem( 26 )
	if itemSN > -1 then
		TryRecieveItem( sceneId, selfId, itemSN, QUALITY_MUST_BE_CHANGE )					-- 放不下就没有了
	end

	local strText = GetName( sceneId, selfId ) .. "#Y在向杨文广交一品堂令" ..
					"牌时，幸运的得到朝庭嘉奖的#R" .. itemName .. "。"
	BroadMsgByChatPipe( sceneId, selfId, strText, 4 )
end

--**********************************
--发布具体任务
--**********************************
function x050010_AnswerQuestion( sceneId, selfId, targetId )
	local score = GetMissionData( sceneId, selfId, MD_MIDAUTUMN_SCORE )
	local strText = "    你当前的积分为" .. score .. "分，你可用中秋积" ..
					"分去找洛阳姜鲤（127，154）需要100分，苏州包世荣（" ..
					"190，168）需要200分，大理杜子腾（109，170）需要50" ..
					"0分来换取食材，再去找苏州（193，148）岳常圆传送到" ..
					"西湖来换中秋特殊物品。"
	x050010_NotifyFailBox( sceneId, selfId, targetId, strText )
end

--**********************************
--列举事件
--**********************************
function x050010_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x050010_g_Name then						--判断该npc是否是对应任务的npc
		return
	end

	if IsHaveMission( sceneId, selfId, x050010_g_MissionIdPre ) <= 0 then		-- 没有任务
		return
	end

	if CallScriptFunction( x050010_g_ControlScript, "IsMidAutumnPeriod", sceneId, selfId ) == 0 then
		return
	end

	AddNumText( sceneId, x050010_g_ScriptId, "击退一品堂高手入侵", -1, x050010_g_NumText_Main )
	AddNumText( sceneId, x050010_g_ScriptId, "交一品堂令牌", -1, x050010_g_NumText_SubmitBooty )
	AddNumText( sceneId, x050010_g_ScriptId, "中秋积分有什么用", -1, x050010_g_NumText_Question )
end

--**********************************
--副本事件
--**********************************
function x050010_OnCopySceneReady( sceneId, destsceneId )
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
	local i, nearteammembercount, member
	local members = {}
	local validmembercount = 0

	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )
	for i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )
		if IsHaveMission( sceneId, member, x050010_g_MissionId ) > 0 then		-- 有任务
			validmembercount = validmembercount + 1
			members[validmembercount] = member
		end
	end

	if validmembercount < x050010_g_LimitMembers then
		x050010_NotifyFailTips( sceneId, leaderObjId, "你的队伍人数不足。" )
		return
	end

	local misIndex
	for i = 1, validmembercount do
		misIndex = GetMissionIndexByID( sceneId, members[i], x050010_g_MissionId )

		if LuaFnIsCanDoScriptLogic( sceneId, members[i] ) == 1 then			-- 处于可以执行逻辑的状态
			--将任务的第1号数据设置为副本的场景号
			SetMissionByIndex( sceneId, members[i], misIndex, x050010_g_Param_sceneid, destsceneId )
	--		SetMissionEvent( sceneId, members[i], x050010_g_MissionId, 0 )			-- 关心杀怪事件
			NewWorld( sceneId, members[i], destsceneId, x050010_g_Fuben_X, x050010_g_Fuben_Z )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x050010_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", x050010_g_BackInfo.sceneId, x050010_g_BackInfo.x, x050010_g_BackInfo.z )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050010_OnKillObject( sceneId, selfId, objdataId, objId )						--参数意思：场景号、玩家objId、怪物表位置号、怪物objId
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) == 0 then
		return
	end

	-- 杀了 Boss 就算赢
	local SceneType = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local CopySceneInfo = x050010_g_CopySceneInfo[SceneType]
	if not CopySceneInfo then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x050010_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	local score, gainScore
	local gameWin = 0

	--取得杀死怪物的GroupID
	local GroupID = GetMonsterGroupID( sceneId, objId )
	if x050010_g_MonsterGroupID == GroupID then
		gainScore = CopySceneInfo.monsterScore
	elseif x050010_g_BossGroupID == GroupID then
		gainScore = CopySceneInfo.bossScore
		gameWin = 1
	end

	--取得当前场景里的人数
	local i, humanObjId
	local num = LuaFnGetCopyScene_HumanCount( sceneId )
	local strText = "你获得了中秋积分" .. gainScore .. "分。"
	local strText2 = "你成功的击退这一轮来自一品堂高手的冲击。"
	for i = 0, num - 1 do
		humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )					--取得当前场景里人的objId

		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then						--不在场景的不做此操作
			score = GetMissionData( sceneId, humanObjId, MD_MIDAUTUMN_SCORE )
			score = score + gainScore
			SetMissionData( sceneId, humanObjId, MD_MIDAUTUMN_SCORE, score )
			x050010_NotifyFailTips( sceneId, humanObjId, strText )
			Msg2Player( sceneId, humanObjId, strText, MSG2PLAYER_PARA )

			if gameWin == 1 then
				Msg2Player( sceneId, humanObjId, strText2, MSG2PLAYER_PARA )
				if random( 100 ) <= CopySceneInfo.bootyOdds then
					AddMonsterDropItem( sceneId, objId, humanObjId, x050010_g_Booty )
				end
			end
		end
	end

	if gameWin == 1 then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )							--设置副本关闭标志, 0开放，1关闭
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x050010_OnHumanDie( sceneId, selfId, killerId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) > 0 then
		DelMission( sceneId, selfId, x050010_g_MissionId )								-- 删除此任务
	end
end

--**********************************
--离开副本
--**********************************
function x050010_Exit( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x050010_g_MissionId ) > 0 then
	--	local misIndex = GetMissionIndexByID( sceneId, selfId, x050010_g_MissionId )
	--	ResetMissionEvent( sceneId, selfId, x050010_g_MissionId, 0 )					-- 不关心杀怪事件
		DelMission( sceneId, selfId, x050010_g_MissionId )								-- 删除此任务
	end

	NewWorld( sceneId, selfId, x050010_g_BackInfo.sceneId, x050010_g_BackInfo.x, x050010_g_BackInfo.z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x050010_OnCopySceneTimer( sceneId, nowTime )
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

		if leaveTickCount >= x050010_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050010_Exit( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x050010_g_CloseTick - leaveTickCount ) * x050010_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x050010_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x050010_g_LimitTotalHoldTime then									--副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x050010_NotifyFailTips( sceneId, mems[i], "任务超时，离开场景" )
				x050010_Exit( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		if GetMonsterCount( sceneId ) < 1 then
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		end
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x050010_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x050010_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
