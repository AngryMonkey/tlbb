--副本任务
--消灭在矿场捣乱的小贼

--************************************************************************
--MisDescBegin

--脚本号
x600009_g_ScriptId = 600009

--任务号
x600009_g_MissionId = 1106

--目标NPC
x600009_g_Name = "朱世友"

--任务等级
x600009_g_MissionLevel = 10000

--任务归类
x600009_g_MissionKind = 50

--是否是精英任务
x600009_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明
x600009_g_IsMissionOkFail			=0	--0 任务完成标记
x600009_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600009_g_Param_sceneid				=2	--2号：当前副本任务的场景号

--循环任务的数据索引，里面存着已做的环数
x600009_g_MissionRound = 40
--**********************************以上是动态****************************

--任务文本描述
x600009_g_MissionName = "发展任务"
x600009_g_MissionInfo = ""													--任务描述
x600009_g_MissionTarget = "    护送 %n 到 %s%s 附近。"						--任务目标
x600009_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600009_g_SubmitInfo = "    事情进展得如何？"								--完成未提交时的npc对话
x600009_g_MissionComplete = "    干得不错，甚好甚好。"						--完成任务npc说话的话

x600009_g_StrForePart = 3

x600009_g_FamilyNameStart = 0												-- x600009_g_StrList 中的姓的起始位置
x600009_g_FamilyNameCount = 13												-- x600009_g_StrList 中的姓的数量
x600009_g_StrList = { [0] = "周", [1] = "赵", [2] = "杨", [3] = "韩", [4] = "林", [5] = "郭", [6] = "孟",
			  [7] = "常", [8] = "吴", [9] = "崔", [10] = "金", [11] = "薛", [12] = "关",
			  [13] = "燕", [14] = "婷", [15] = "霖", [16] = "琴", [17] = "倩", [18] = "璇",
			  [19] = "巧巧", [20] = "莺莺", [21] = "思思", [22] = "印儿", [23] = "月儿",
			  [24] = "雪儿", [25] = "宛儿",
}

-- 通用城市任务脚本
x600009_g_CityMissionScript = 600001
x600009_g_DevelopmentScript = 600007

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600009_g_CopySceneName = "牧场"

x600009_g_CopySceneType = FUBEN_CONVOYPET	--副本类型，定义在ScriptGlobal.lua里面

x600009_g_CopySceneMap = "muchang.nav"
x600009_g_Exit = "muchang_area.ini"
x600009_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x600009_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x600009_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x600009_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x600009_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x600009_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x600009_g_Fuben_X = 70					--进入副本的位置X
x600009_g_Fuben_Z = 113					--进入副本的位置Z
x600009_g_Back_X = 129					--源场景位置X
x600009_g_Back_Z = 99					--源场景位置Z

x600009_g_PetList = {
	PetNpcId = { 300464, 300465, 300466, 300467, 300468 },
	[10] = { 1940, 1950, 1960, 1970, 1980 },
	[20] = { 1941, 1951, 1961, 1971, 1981 },
	[30] = { 1942, 1952, 1962, 1972, 1982 },
	[40] = { 1943, 1953, 1963, 1973, 1983 },
	[50] = { 1944, 1954, 1964, 1974, 1984 },
	[60] = { 1945, 1955, 1965, 1975, 1985 },
	[70] = { 1946, 1956, 1966, 1976, 1986 },
	[80] = { 1947, 1957, 1967, 1977, 1987 },
	[90] = { 1948, 1958, 1968, 1978, 1988 },
	[100] = { 1949, 1959, 1969, 1979, 1989 },
}

--**********************************
--任务入口函数
--**********************************
function x600009_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local bDone = x600009_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600009_g_SubmitInfo
		else
			strText = x600009_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		if bDone == 0 and GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 2 then		--任务未完成
			if GetNumText() == 1 then
				x600009_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600009_g_MissionName )
					x600009_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		else											--任务已经完成或失败
			BeginEvent( sceneId )
				AddText( sceneId, x600009_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId, bDone )
		end
	--满足任务接收条件
	elseif x600009_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600009_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600009_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--列举事件
--**********************************
function x600009_OnEnumerate( sceneId, selfId, targetId )
	--local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	--SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )
	
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		AddNumText( sceneId, x600009_g_ScriptId, x600009_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600009_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x600009_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    牧场的 %s%s 走失了 %s，麻烦你护送 %s 回到它主人那里。",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName, strPetName )
	else
		missionInfo = format( "    听说 %s%s 不小心走失了 %s，如果你能帮她送回，我想她会很开心的。",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName )
	end

	AddText( sceneId, missionInfo )
	AddNumText( sceneId, x600009_g_ScriptId, "进入牧场", 10, 1 )
end

--**********************************
--接受
--**********************************
function x600009_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 30 then
			CallScriptFunction( x600009_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600009_g_MissionId, x600009_g_ScriptId, 0, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 ) -- 注册 x600009_OnLockedTarget 事件
		CallScriptFunction( x600009_g_DevelopmentScript, "OnAccept", sceneId, selfId, targetId, x600009_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		-- 护送B到AA附近。
		local PetNpcId = x600009_g_PetList.PetNpcId[random( getn(x600009_g_PetList.PetNpcId) )]
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart, PetNpcId )

		local girlFamilyNameIndex = random( x600009_g_FamilyNameStart, x600009_g_FamilyNameStart + x600009_g_FamilyNameCount - 1 )
		local girlNameIndex = random( x600009_g_FamilyNameStart, getn(x600009_g_StrList) - x600009_g_FamilyNameCount ) + x600009_g_FamilyNameCount
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 1, girlFamilyNameIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 2, girlNameIndex )

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x600009_g_MissionName )
			x600009_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    你接受了任务：" .. x600009_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600009_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

		--changed by xindefeng
		--副本新机制:无论什么原因,在未完成任务而出副本,副本不对玩家身上的任务做任何改动(设置失败或者删除任务),而玩家再进该副本时,都要重新初始化任务数据,而且副本都要重新创建
		--if copysceneid >= 0 then												--进过副本
		--	--将自己传送到副本场景
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600009_g_Fuben_X, x600009_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_Param_sceneid, -1 )		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		x600009_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600009_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600009_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600009_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600009_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600009_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600009_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数为0
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Boss的数量

	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < 100 then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = 100
	end

	LuaFnSetSceneLoad_Area( sceneId, x600009_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "muchang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel ) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local PetList = x600009_g_PetList[iniLevel]
	local petMonsterId = nil
	local i = 1

	if not PetList then
		x600009_NotifyFailTips( sceneId, selfId, "没有适合你护送的珍兽" )
		return
	end

	for i = 1, getn( x600009_g_PetList.PetNpcId ) do
		if x600009_g_PetList.PetNpcId[i] == PetNpcId then
			petMonsterId = PetList[i]
			break
		end
	end

	if not petMonsterId then
		x600009_NotifyFailTips( sceneId, selfId, "没有找到适合你护送的珍兽" )
		return
	end

	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 3, petMonsterId )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600009_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600009_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end

end

--**********************************
--副本事件
--**********************************
function x600009_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600009_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600009_g_MissionId )

		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600009_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600009_g_Fuben_X, x600009_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600009_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x600009_NotifyFailTips( sceneId, selfId, "你当前未接此任务" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
		return
	end

	--祝凯 2008-03-06
	--不应该出现这种情况....需要检测是否是本任务....
	local misIdx = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local scriptId = GetMissionParam( sceneId, selfId, misIdx, 1 )
	if x600009_g_ScriptId == scriptId then
		--进入副本就启动计时器 --add by xindefeng
		StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
	else
		local msg = format( "CityMission_OnTimer_Error x600009_OnPlayerEnter %0X,%d,%d real scriptId = %d", LuaFnObjId2Guid( sceneId, selfId ), sceneId, selfId, scriptId )
		MissionLog( sceneId, msg )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	-- 设置护送宠物属性
	local i
	local monsterId
	local petFlag = 0
	for i = 0, monstercount - 1 do
		monsterId = GetMonsterObjID( sceneId, i )
		if GetName( sceneId, monsterId ) == strPetName then
			petFlag = 1
		end

		if GetName( sceneId, monsterId ) == "少女" then
			SetCharacterName( sceneId, monsterId, x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex] )
		end
	end
	
	if petFlag == 0 then
		monsterId = LuaFnCreateMonster( sceneId, petMonsterId, x600009_g_Fuben_X, x600009_g_Fuben_Z, 0, 0, -1 )
		SetLevel( sceneId, monsterId, GetLevel( sceneId, selfId ) )			-- 调整级别
		SetUnitReputationID(sceneId, selfId, monsterId, GetUnitReputationID(sceneId, selfId, selfId)) --设定为玩家势力ID,和玩家友好

		local pAttack = 0													-- 物理攻击
		local pDefense = 0													-- 物理防御
		local mDefense = 0													-- 内功防御
		local maxHP = 0														-- 气血值

		pAttack = LuaFnGetBaseAttackPhysics( sceneId, monsterId )
		pAttack = floor( pAttack * ( 80 + random(40) ) / 100 - pAttack )
		pAttack = pAttack + LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId, pAttack )

		pDefense = LuaFnGetBaseDefencePhysics( sceneId, monsterId )
		pDefense = floor( pDefense * ( 80 + random(40) ) / 100 - pDefense )
		pDefense = pDefense + LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId, pDefense )

		mDefense = LuaFnGetBaseDefenceMagic( sceneId, monsterId )
		mDefense = floor( mDefense * ( 80 + random(40) ) / 100 - mDefense )
		mDefense = mDefense + LuaFnGetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId, mDefense )

		maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
		maxHP = floor( maxHP * ( 80 + random(40) ) / 100 - maxHP )
		maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
		RestoreHp( sceneId, monsterId )
	end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600009_OnHumanDie( sceneId, selfId, killerId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	x600009_NotifyFailTips( sceneId, selfId, "任务失败！" )
	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )			-- 任务失败
	LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

	if x600009_g_DeadTrans == 1 then														--死亡后需要被强制踢出场景
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
--放弃
--**********************************
function x600009_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600009_g_DevelopmentScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果在副本里删除任务，则直接传送回
		x600009_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600009_BackToCity( sceneId, selfId )
	--可以用原来的方法,但是会提示两遍"任务失败",所以修改 --changed by xindefeng
	--CallScriptFunction( x600009_g_CityMissionScript, "BackToCity", sceneId, selfId, x600009_g_MissionId, x600009_g_Back_X, x600009_g_Back_Z )	
	
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--如果任务未成功
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--设置任务失败
		end
	end
	
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取得进入副本时所在场景号
	CallScriptFunction( 400900, "TransferFunc", sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )	--传送
end

--**********************************
--继续
--**********************************
function x600009_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600009_g_MissionName )
		AddText( sceneId, x600009_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600009_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600009_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600009_g_DevelopmentScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600009_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x600009_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600009_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件(scene.lua调用)
--**********************************
function x600009_OnCopySceneTimer( sceneId, nowTime )

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

		if leaveTickCount >= x600009_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x600009_g_CloseTick - leaveTickCount ) * x600009_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600009_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

--**********************************
--当锁定一个对象
--**********************************
function x600009_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local strGirlName = x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex]

	if GetMonsterDataID( sceneId, objId ) == petMonsterId then				-- 珍兽
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) > 0 then
			print( "这里有问题，珍兽会多次响应点击事件" )
		end

		------------------挪到x600009_OnPlayerEnter()去了,玩家一进入副本就启动时钟 changed by xindefeng----------------
		--启动该任务的任务时钟器
		--StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		--SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
		---------------------------------------------------------------------------------------------------------------
		
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 1 )	--设置标志:是否与护送宠物对话(即在副本是否已经开始护送?)
		SetPatrolId( sceneId, objId, 0 )									-- 设置巡逻路径
		return
	end

	if GetName( sceneId, objId ) == strGirlName then						-- 失女
		-- 设置任务已经完成
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) == 1 then
			-- 将该任务从 x600009_OnLockedTarget 事件列表中清除，该任务不再关心此类事件
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 )
			TAddText( sceneId, "    太好了，真是谢谢你哦。" )
			x600009_NotifyFailTips( sceneId, selfId, "任务完成" )
			LuaFnDeleteMonster( sceneId, objId )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		else
			local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
			local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )
			local strText = format( "    我的 %s 不见，呜呜呜，你能帮我找到它吗？", strPetName )
			TAddText( sceneId, strText )
		end
	end
end

--**********************************
--定时事件
--**********************************
function x600009_OnTimer( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- 没有该任务
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	
	--changed by xindefeng
	--该成玩家进入副本就启动计时器,但不设置(x600009_g_StrForePart + 4)Mission Para这样,玩家进入副本后,没有与护送宠物对话就出去了,那么也可以提示设置失败!	
	--玩家与护送宠物对话后由x600009_OnLockedTarget()设置(x600009_g_StrForePart + 4)Mission Para,设置路径标识玩家在副本中开始护送
	local sceneType = LuaFnGetSceneType( sceneId )	--是否是副本类型
	if sceneType ~= 1 then		
		--护送任务,任务没完成就出副本,就算任务失败!
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--任务成功否?
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--任务还没成功就出副本,因为是护送任务就设置任务失败
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )									--离开副本后要停止定时调用本函数
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--设置标志:是否与护送宠物对话(即在副本是否已经开始护送?)
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )																	--设置副本关闭标志
			x600009_NotifyFailTips( sceneId, selfId, "任务失败！" )												--提示失败
		end
		return
	end
	
	

	-- 只有触发了珍兽自动行走才会走到这里
	if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) == 1 then
		--是否是所需要的副本
		local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
		
		if fubentype == x600009_g_CopySceneType then			
			local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )
			local monstercount = GetMonsterCount( sceneId )
			local monsterId
			local i

			for i = 0, monstercount - 1 do
				monsterId = GetMonsterObjID( sceneId, i )
				if GetMonsterDataID( sceneId, monsterId ) == petMonsterId then		-- 判断是否成功
					local x, z = GetLastPatrolPoint( sceneId, 0 )
					local petX, petZ = GetWorldPos( sceneId, monsterId )

					if (x - petX) * (x - petX) + (z - petZ) * (z - petZ) < 4 then	-- 离终点不到 2 米
						SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 1 )
						ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )		-- 不再走此心跳
						LuaFnDeleteMonster( sceneId, monsterId )
					end
					return	--护送的宠物还在就直接返回
				end
			end
		end

		--护送过程中珍兽死亡算任务失败
		x600009_NotifyFailTips( sceneId, selfId, "任务失败！" )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )		-- 任务失败
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )		--设置副本关闭标志
		ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )						-- 不再走此心跳
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--设置标志:是否与护送宠物对话(即在副本是否已经开始护送?)	--add by xindefeng
	end
end

function x600009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
