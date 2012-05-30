--副本任务
--杀死建设工地寻衅头领

--************************************************************************
--MisDescBegin

--脚本号
x600039_g_ScriptId = 600039

--任务号
x600039_g_MissionId = 1111

--目标NPC
x600039_g_Name = "郑无名"

--任务等级
x600039_g_MissionLevel = 10000

--任务归类
x600039_g_MissionKind = 50

--是否是精英任务
x600039_g_IfMissionElite = 0

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--角色Mission变量说明

x600039_g_IsMissionOkFail			=0	--0 任务完成标记
x600039_g_MissionParam_SubId		=1	--1 子任务脚本号存放位置
x600039_g_Param_sceneid				=2	--2 当前副本任务的场景号
x600039_g_MissionParam_BossIndex	=3	--3 某 Boss 的名字索引
x600039_g_Param_Killed				=4	--4 已杀死的数量
x600039_g_Param_Needed				=5	--5 需杀死的数量

--循环任务的数据索引，里面存着已做的环数
x600039_g_MissionRound = 59
--**********************************以上是动态****************************

--任务文本描述
x600039_g_MissionName = "建设任务"
x600039_g_MissionInfo = ""													--任务描述
x600039_g_MissionTarget = "    找到江湖人称%s的头领和他带来的寻衅小辈并杀死他们。"				--任务目标
x600039_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600039_g_SubmitInfo = "    事情进展得如何？"								--完成未提交时的npc对话
x600039_g_MissionComplete = "    甚好，甚好，建筑的进度又加快了。"			--完成任务npc说话的话

x600039_g_Parameter_Kill_CountRandom = { { id = 300471, numNeeded = 5, numKilled = 4 } }

x600039_g_StrForePart = 3

x600039_g_StrList = {
	[0 ] = "",
	[1 ] = "小太岁",
	[2 ] = "赛太岁",
	[3 ] = "活太岁",
	[4 ] = "病太岁",
	[5 ] = "当值太岁",
	[6 ] = "青面太岁",
	[7 ] = "血手太岁",
	[8 ] = "八面太岁",
	[9 ] = "恶手阎罗",
	[10] = "小阎罗",
	[11] = "赛阎罗",
	[12] = "活阎罗",
	[13] = "病阎罗",
	[14] = "九头阎罗",
	[15] = "金眼阎罗",
	[16] = "金掌霸王",
	[17] = "铁拳霸王",
	[18] = "泼霸王",
	[19] = "病霸王",
	[20] = "小霸王",
	[21] = "赛霸王",
	[22] = "活霸王",
}

-- 通用城市任务脚本
x600039_g_CityMissionScript = 600001
x600039_g_ConstructionScript = 600035

--任务奖励

--MisDescEnd
--************************************************************************

--副本名称
x600039_g_CopySceneName = "工地"

x600039_g_CopySceneType = FUBEN_GONGDI	--副本类型，定义在ScriptGlobal.lua里面

x600039_g_CopySceneMap = "gongdi.nav"
x600039_g_Exit = "gongdi_area.ini"

x600039_g_MonsterCount = 10				--怪物数量

x600039_g_TickTime = 5					--回调脚本的时钟时间（单位：秒/次）
x600039_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x600039_g_NoUserTime = 120				--副本中没有人后可以继续保存的时间（单位：秒）

x600039_g_BossGroupId = 51				--boss怪
x600039_g_Fuben_X = 32					--进入副本的位置X
x600039_g_Fuben_Z = 50					--进入副本的位置Z
x600039_g_Back_X = 100					--源场景位置X
x600039_g_Back_Z = 57					--源场景位置Z

--**********************************
--任务入口函数
--**********************************
function x600039_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		local bDone = x600039_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600039_g_SubmitInfo
		else
			strText = x600039_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		if bDone == 0 then				--任务未完成
			if GetNumText() == 1 then	-- 这里是点击进入副本
				x600039_AcceptEnterCopyScene( sceneId, selfId )
				return
			end

			BeginEvent( sceneId )		-- 显示任务接取界面
				AddText( sceneId, x600039_g_MissionName )
				x600039_AskEnterCopyScene( sceneId, selfId )
			EndEvent( )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId, bDone )

	--满足任务接收条件
	elseif x600039_CheckAccept( sceneId, selfId ) > 0 then
		x600039_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x600039_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then
		AddNumText( sceneId, x600039_g_ScriptId, x600039_g_MissionName,3,-1 )
	end
end

--**********************************
--检测接受条件
--**********************************
function x600039_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x600039_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then	-- 没有任务
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
	local missionInfo = format( "    你来的正巧，这段时间建设现场总有一伙人寻衅闹事，为首的江湖人称%s，你的任务是将寻衅者统统都干掉，%s，你要加油啊。",
		x600039_g_StrList[BossIndex], GetName( sceneId, selfId ) )

	AddText( sceneId, missionInfo )

	AddNumText( sceneId, x600039_g_ScriptId, "进入工地", 10, 1 )
end

--**********************************
--接受
--**********************************
function x600039_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then					--没有任务才可以走这里
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600039_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "等级不够" )
			return
		end

		--加入任务到玩家列表
		AddMission( sceneId, selfId, x600039_g_MissionId, x600039_g_ScriptId, 1, 0, 0 )	-- kill、area、item
		if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) <= 0 then
			return
		end

		CallScriptFunction( x600039_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600039_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

		--PrintStr( "The count of x600039_g_StrList should be 22, the actual value is " .. getn(x600039_g_StrList) )
		-- 随机一个门派
		local BossIndex = random( getn(x600039_g_StrList) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex, BossIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Needed, x600039_g_MonsterCount )		-- 仅供客户端使用

		--显示内容告诉玩家已经接受了任务
		BeginEvent( sceneId )
			AddText( sceneId, x600039_g_MissionName )
			x600039_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    你接受了任务：" .. x600039_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600039_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
		--local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

		--if copysceneid >= 0 and GetMissionParam( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail ) == 0 then												--进过副本
		--	--将自己传送到副本场景
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600039_g_Fuben_X, x600039_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_sceneid, -1 )		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		x600039_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--创建副本
--**********************************
function x600039_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600039_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600039_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600039_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600039_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600039_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, 0 )							--是否已经杀死了boss
	LuaFnSetCopySceneData_Param( sceneId, 7, x600039_g_MonsterCount )				--剩余弟子的数量

 local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
 
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, x600039_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "gongdi_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x600039_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600039_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end

end

--**********************************
--副本事件
--**********************************
function x600039_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600039_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600039_g_MissionId )

		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600039_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600039_g_Fuben_X, x600039_g_Fuben_Z )
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600039_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x600039_NotifyFailTips( sceneId, selfId, "你当前未接此任务" )
		x600039_BackToCity( sceneId, selfId )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local monsterId, i
	for i = 0, monstercount - 1 do
		-- 找到 Boss = monsterId
		monsterId = GetMonsterObjID( sceneId, i )
		local GroupID = GetMonsterGroupID( sceneId, monsterId )
		if GroupID == x600039_g_BossGroupId then
			local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
			local BossIndex = GetMissionParam( sceneId, selfId, misIndex, x600039_g_MissionParam_BossIndex )
			SetCharacterName( sceneId, monsterId, x600039_g_StrList[BossIndex] )
			break
		end
	end
	
	-- hongyu
	-- 在玩家进入场景的时候，把玩家的相关任务杀人数设置为 1
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, 0 )	--设置任务数据
	-- end
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600039_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--放弃
--**********************************
function x600039_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_sceneid )

	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600039_g_ConstructionScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--如果在副本里删除任务，则直接传送回
		x600039_NotifyFailTips( sceneId, selfId, "任务失败！" )
		x600039_BackToCity( sceneId, selfId )
	end
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600039_BackToCity( sceneId, selfId )
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--取得副本入口场景号
	NewWorld( sceneId, selfId, oldsceneId, x600039_g_Back_X, x600039_g_Back_Z )
end

--**********************************
--继续
--**********************************
function x600039_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600039_g_MissionName )
		AddText( sceneId, x600039_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600039_g_ScriptId, x600039_g_MissionId )
end

--**********************************
--检测是否可以提交
--**********************************
function x600039_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local ret = CallScriptFunction( x600039_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--提交
--**********************************
function x600039_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600039_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	if x600039_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600039_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600039_OnKillObject( sceneId, selfId, objdataId, objId )
	if IsHaveMission( sceneId, selfId, x600039_g_MissionId ) == 0 then
		return
	end

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600039_g_MissionId )

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x600039_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	local monstercount = GetMissionParam( sceneId, selfId, misIndex, x600039_g_Param_Killed )
	monstercount = monstercount + 1
	SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_Param_Killed, monstercount )	--设置任务数据

	local strText = format( "已杀死寻衅者：%d/%d", monstercount, x600039_g_MonsterCount )
	x600039_NotifyFailTips( sceneId, selfId, strText )

	if monstercount >= x600039_g_MonsterCount then
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		strText = format( "任务完成，将在 %d 秒后传送到入口位置", x600039_g_CloseTick * x600039_g_TickTime )

		--将任务的第1号数据设置为1,表示完成的任务
		SetMissionByIndex( sceneId, selfId, misIndex, x600039_g_IsMissionOkFail, 1 )	--设置任务数据

		x600039_NotifyFailTips( sceneId, selfId, strText )
	end
end

--**********************************
--进入区域事件
--**********************************
function x600039_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x600039_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600039_OnCopySceneTimer( sceneId, nowTime )

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

		if leaveTickCount >= x600039_g_CloseTick then										--倒计时间到，大家都出去吧
			--将当前副本场景里的所有人传送回原来进入时候的场景
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_BackToCity( sceneId, mems[i] )
				end
			end
		else
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在 %d 秒后离开场景", ( x600039_g_CloseTick - leaveTickCount ) * x600039_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600039_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

function x600039_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
