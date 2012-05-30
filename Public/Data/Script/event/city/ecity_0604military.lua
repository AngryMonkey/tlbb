-- 单人副本

-- 国防任务 刺杀贪官
--MisDescBegin
-- 脚本号
x600034_g_ScriptId = 600034

--任务号
x600034_g_MissionId = 1109

--任务目标npc
x600034_g_Name = "武大威"

--任务归类
x600034_g_MissionKind = 50

--任务等级
x600034_g_MissionLevel = 10000

--是否是精英任务
x600034_g_IfMissionElite = 0

--下面几项是动态显示的内容，用于在任务列表中动态显示任务情况**********************
x600034_g_IsMissionOkFail = 0							-- 任务完成标记

--以上是动态**************************************************************

--任务变量第一位用来存储随机得到的脚本号
--任务文本描述
x600034_g_MissionName = "刺杀贪官"
x600034_g_MissionInfo = ""													--任务描述
x600034_g_MissionTarget = "    贪官%s%s现作%s，他欺压百姓，怨声载道，我已经安排了%n了解到了情报，行刺他的任务就交给你了。"	--任务目标
x600034_g_ContinueInfo = "    你的任务还没有完成么？"						--未完成任务的npc对话
x600034_g_MissionComplete = "    干得不错，甚好甚好。"						--完成任务npc说话的话
x600034_g_MissionRound = 79

-- 通用城市任务脚本
x600034_g_CityMissionScript = 600001
x600034_g_MilitaryScript = 600030

x600034_g_StrForePart=4

x600034_g_StrList = {[0]="李",
										 [1]="赵",
										 [2]="周",
										 [3]="韩",
										 [4]="邓",
										 [5]="廉",
										 [6]="洁",
										 [7]="政",
										 [8]="勤",
										 [9]="文",
										 [10]="侍郎",
										 [11]="中书侍郎",
										 [12]="枢密院使",
										 [13]="枢密院副使",
										 [14]="御史中丞",
								  	 [15]="御史大夫",
								  	 [16]="右谏议大夫",
								  	 [17]="左谏议大夫",
								  	 [18]="中书舍人",
										 }

--MisDescEnd

x600034_g_Pos = {{x=10,z=11},{x=31,z=13},{x=52,z=11},
								 {x=31,z=27},{x=14,z=34},{x=48,z=34},
								 {x=31,z=40},{x=14,z=49},{x=31,z=45},
								 {x=50,z=49}}

--副本名称
x600034_g_CopySceneName = "衙门"
x600034_g_CopySceneType = FUBEN_GUOFANG	--副本类型，定义在ScriptGlobal.lua里面
x600034_g_CopySceneMap = "yamen.nav"
x600034_g_LimitMembers = 1					--可以进副本的最小队伍人数
x600034_g_TickTime = 5							--回调脚本的时钟时间（单位：秒/次）
x600034_g_LimitTotalHoldTime = 480	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x600034_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x600034_g_CloseTick = 3							--副本关闭前倒计时（单位：次数）
x600034_g_NoUserTime = 10						--副本中没有人后可以继续保存的时间（单位：秒）
x600034_g_DeadTrans = 0							--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x600034_g_Fuben_X = 50							--进入副本的位置X
x600034_g_Fuben_Z = 10							--进入副本的位置Z
x600034_g_Back_X = 47								--源场景位置X
x600034_g_Back_Z = 92								--源场景位置Z
x600034_g_NeedMonsterGroupID = 1		--Boss 的组号
x600034_g_TotalNeedKillBoss = 11		--需要杀死Boss数量



--**********************************
--任务入口函数
--**********************************
function x600034_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		-- 获得当前选中的Npc的名字
		local szCurNpc = GetName(sceneId,targetId)
		
		-- 任务中记录的Npc的名字
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
		
		local szNpcName = ""
		if nNpcId > 0  then
			_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
			
			if szCurNpc == szNpcName   then  -- 找对人了
				BeginEvent( sceneId )
					AddText( sceneId, "#Y刺杀贪官" )
					AddText( sceneId, "  很好很好 ，我现在将你送到他的衙门，希望你解决掉这个败类！" )
				EndEvent()
				DispatchEventList( sceneId, selfId, targetId )
				
				-- 设置任务完成标记
				x600034_AcceptEnterCopyScene( sceneId, selfId )
				return
			end
		end
	end

	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc是否是对应任务的npc
		return
	end

	--如果已接此任务
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		--发送任务需求的信息
		BeginEvent( sceneId )
			AddText( sceneId, x600034_g_MissionName )
			AddText( sceneId, x600034_g_ContinueInfo )
		EndEvent( )
		local bDone = x600034_CheckSubmit( sceneId, selfId )
		
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId, bDone )
	--满足任务接收条件
	elseif x600034_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600034_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600034_OnAccept( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
--列举事件
--**********************************
function x600034_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
   --如果已接此任务
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then
		AddNumText( sceneId, x600034_g_ScriptId, x600034_g_MissionName, 2 )
	end
end

--**********************************
--接受
--**********************************
function x600034_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	-- 取得一个随机的交任务的人
	local nLevel = GetLevel(sceneId, selfId)
	local nNpcId = 0
	local szNpcName = ""
	local szScene = ""
	local nScene = 0
	local nPosX = 0
	local nPosZ = 0
	local szNpcDesc =""
	local nSex = 0
	
	--从MissionNpc_HashTable.txt中获得Npc内容，
	nNpcId,szNpcName,szScene,nScene,nPosX,nPosZ,szNpcDesc,nSex = GetOneMissionNpc(42)

	--加入任务到玩家列表
	AddMission( sceneId, selfId, x600034_g_MissionId, x600034_g_ScriptId, 1, 0, 0 )	-- kill、area、item
	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) <= 0 then
		return
	end

	-- 随机出玩家的落脚点
	local nPos  = random( getn(x600034_g_Pos) )

	-- 随机出玩家的名字
	local nXing = random( 0, 4 )
	local nMing = random( 5, 9 )
	local nZhi  = random( 10, 18 )

	-- 设置这个任务需要关注NPC
	SetMissionEvent( sceneId,selfId, x600034_g_MissionId, 4)
	
	-- 记录下随机选中的NpcId
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	
	SetMissionByIndex(sceneId, selfId, misIndex, 3, nPos)
	SetMissionByIndex(sceneId, selfId, misIndex, 4, nXing)
	SetMissionByIndex(sceneId, selfId, misIndex, 5, nMing)
	SetMissionByIndex(sceneId, selfId, misIndex, 6, nZhi)
	SetMissionByIndex(sceneId, selfId, misIndex, 7, nNpcId)

	CallScriptFunction( x600034_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600034_g_ScriptId )

	--显示内容告诉玩家已经接受了任务
	local nTaSex
	if 	nSex == 0  then
		nTaSex = "她"
	else
		nTaSex = "他"
	end
	
	local missionInfo = "    贪官" .. x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] ..  
											"现作" .. x600034_g_StrList[nZhi] .. "，他欺压百姓，怨声载道，我已经安排了"
											 .. szScene .. szNpcName .. "（" .. nPosX .. "，" .. nPosZ .. 
											 "）了解到了情报，行刺他的任务就交给你了。"

	BeginEvent( sceneId )
		AddText( sceneId, "你接受了任务：" .. x600034_g_MissionName )
		AddText( sceneId, missionInfo )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检测接受条件
--**********************************
function x600034_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600034_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--检测是否可以提交
--**********************************
function x600034_CheckSubmit( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	if  GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) == 1  then
		return 1
	end 
	return 0
end

--**********************************
--放弃任务
--**********************************
function x600034_OnAbandon( sceneId, selfId )
	--删除玩家任务列表中对应的任务
	CallScriptFunction( x600034_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x600034_OnKillObject( sceneId, selfId, objdataId ,objId )

	local monsterName = GetName(sceneId, objId)
	
	-- 使用任务中记录的来判断是不是杀对了人
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
	local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
	local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
	local szNpcName = x600034_g_StrList[nXing] .. x600034_g_StrList[nMing]

	if monsterName == szNpcName   then
		-- 设置任务完成标记
		SetMissionByIndex(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 1)
		
		x600034_NotifyFailTips( sceneId, selfId, "已杀死" .. monsterName .. "：1/1"  )
		LuaFnSetCopySceneData_Param( sceneId, 11, 1 )
		LuaFnSetCopySceneData_Param( sceneId, 15, selfId )

	end
end

--**********************************
--继续
--**********************************
function x600034_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600034_g_MissionName )
		AddText( sceneId, x600034_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600034_g_ScriptId, x600034_g_MissionId )
end

--**********************************
--提交
--**********************************
function x600034_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600034_g_Name then		--判断该npc是否是对应任务的npc
		return
	end
	
	if x600034_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600034_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
-- 
--**********************************
function x600034_OnLockedTarget( sceneId, selfId, targetId, missionIndex )

	--判断当前的场景是不是副本，是副本就返回
	if LuaFnGetSceneType(sceneId) == 1  then
		return
	end

	-- 获得当前选中的Npc的名字
	local szCurNpc = GetName(sceneId,targetId)
	
	-- 任务中记录的Npc的名字
	local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
	local nNpcId = GetMissionParam(sceneId, selfId, misIndex, 7)
	
	local szNpcName = ""
	_,szNpcName = GetNpcInfoByNpcId(sceneId,nNpcId)
	
	if GetMissionParam(sceneId, selfId, misIndex, x600034_g_IsMissionOkFail) ~= 1   then
		if szCurNpc == szNpcName   then  -- 找对人了
			TAddNumText(sceneId, x600034_g_ScriptId, "送我去衙门", 10, -1,x600034_g_ScriptId); --[tx42329]
			TDispatchEventList(sceneId, selfId, targetId)
			return 1
		end
		return 0
	end
end

--**********************************
--玩家同意进入副本
--**********************************
function x600034_AcceptEnterCopyScene( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600034_g_MissionId ) > 0 then					--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600034_g_MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600034_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
				
		x600034_MakeCopyScene( sceneId, selfId )		
		
	end
	
end

function x600034_MakeCopyScene( sceneId, selfId )

	local mylevel = GetLevel( sceneId, selfId )

	local nPox_X
	local nPos_Z
	nPox_X = GetHumanWorldX(sceneId,selfId)
	nPos_Z = GetHumanWorldZ(sceneId,selfId)

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600034_g_CopySceneMap )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600034_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600034_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600034_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600034_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, sceneId )				--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, nPox_X )					--保存当前场景编号
	LuaFnSetCopySceneData_Param( sceneId, 8, nPos_Z )					--进入的人次

	-- 清空副本变量
	for k=9, 15  do
		LuaFnSetCopySceneData_Param( sceneId, k, 0 )
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit() --modi:lby20071127
	
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetSceneLoad_Area( sceneId, "yamen_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "yamen_monster_" .. tostring(iniLevel) .. ".ini" )
	--LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	
	if bRetSceneID > 0 then
		x600034_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x600034_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )
	end
end

--**********************************
--副本事件
--**********************************
function x600034_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600034_g_MissionId ) > 0 then			--有任务才可以走这里
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600034_g_MissionId )

		-- 获得进入副本的位置
		local misIndex = GetMissionIndexByID(sceneId,leaderObjId,x600034_g_MissionId)
		local nPos = GetMissionParam(sceneId, leaderObjId, misIndex, 3)
		
		local nFuben_X = x600034_g_Pos[nPos].x
		local nFuben_Z = x600034_g_Pos[nPos].z
		
		NewWorld( sceneId, leaderObjId, destsceneId, nFuben_X, nFuben_Z )

	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x600034_OnPlayerEnter( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, 8, LuaFnGetCopySceneData_Param( sceneId, 8 ) + 1 )

	-- 需要在这里整理怪物的一些特点
	local nMonsterNum = GetMonsterCount(sceneId)
	
	local ii = 0
	local bHaveMonster = 0
	for ii=0, nMonsterNum-1 do
		local nMonsterId = GetMonsterObjID(sceneId,ii)
		
		if GetName(sceneId, nMonsterId)  == "官员"  then
		-- 把这个怪物的名字设置为需要的名字，呵呵
		local misIndex = GetMissionIndexByID(sceneId,selfId,x600034_g_MissionId)
		local nXing = GetMissionParam(sceneId, selfId, misIndex, 4)
		local nMing = GetMissionParam(sceneId, selfId, misIndex, 5)
		SetCharacterName(sceneId, nMonsterId, x600034_g_StrList[nXing] .. x600034_g_StrList[nMing] )
		end
	end

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x600034_OnHumanDie( sceneId, selfId, killerId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
end

function x600034_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x600034_OnCopySceneTimer( sceneId, nowTime )
	-- 如果玩家完成了任务，就开始倒计时，之后传玩家出去
	if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 3  then
		return
	end
	
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1    then
		return
	end
	
	local selfId1 = LuaFnGetCopyScene_HumanObjId(sceneId, 0)
	
	if LuaFnGetCopySceneData_Param( sceneId, 11 ) == 1   then
	
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 0  then
			LuaFnSetCopySceneData_Param( sceneId, 12, 1 )
			LuaFnSetCopySceneData_Param( sceneId, 13, nowTime )
			if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
				x600034_NotifyFailTips(sceneId, selfId1,"任务完成，你将在10秒后被传送出副本")
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 1  then
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 5000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 2 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_NotifyFailTips(sceneId, selfId1,"你将在5秒后被传送出副本")
				end
			end
		end
		
		if LuaFnGetCopySceneData_Param( sceneId, 12 ) == 2  then   
			if nowTime - LuaFnGetCopySceneData_Param( sceneId, 13 ) > 10000  then
				LuaFnSetCopySceneData_Param( sceneId, 12, 3 )
				if LuaFnIsObjValid(sceneId, selfId1) == 1 and LuaFnIsCanDoScriptLogic(sceneId, selfId1) == 1 then
					x600034_BackToCity( sceneId, selfId1 )
				end
			end
		end
		
	end
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x600034_BackToCity( sceneId, selfId )

	local nMonsterScene = LuaFnGetCopySceneData_Param( sceneId, 6 )
	local nPos_X = LuaFnGetCopySceneData_Param( sceneId, 7 )
	local nPos_Z = LuaFnGetCopySceneData_Param( sceneId, 8 )

	-- 传送玩家到这个位置去
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, nMonsterScene, nPos_X, nPos_Z)
end
