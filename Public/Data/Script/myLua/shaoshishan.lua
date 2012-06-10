--002952

-- 少室山副本
-- 如意小子临时制作

--************************************************************************
--MisDescBegin
--脚本号
x002952_g_ScriptId = 002952
x002952_g_Name = "玄慈"


--MisDescEnd
--************************************************************************
x002952_TIME_2000_01_03_ = 946828868

x002952_g_SceneData_1 = 8   -- 记录副本刷怪到第几批

x002952_g_SceneData_3 = 9	-- 
x002952_g_SceneData_4 = 10	-- 
x002952_g_SceneData_5 = 11	-- 
x002952_g_SceneData_6 = 12	-- 

--x002952_g_SceneData_7 = 13	-- 玩家等级

x002952_g_SD_Monster_1 	 = 14			-- 暂未使用
x002952_g_SD_Monster_1_T = 15			-- 暂未使用


--x002952_g_SD_Monster_2 	 = 16
--x002952_g_SD_Monster_2_T = 17
--x002952_g_SD_Monster_3 	 = 18
--x002952_g_SD_Monster_3_T = 19

--x002952_g_KillMonsCount_Qincheng = 20
--x002952_g_KillMonsCount_Qinjia 	 = 21
--x002952_g_KillMonsCount_Lama		 = 22

-- 关闭副本的时间记录
x002952_g_CloseTime = 25

-- 副本失败的标记
x002952_g_MissionLost = 26

-- 控制系统提示的时间
x002952_g_SystemTipsTime = 28

--副本名称
x002952_g_CopySceneName = "少室山"
x002952_g_CopySceneType = FUBEN_DAZHAN_SSS	--副本类型，定义在ScriptGlobal.lua里面
x002952_g_CopySceneMap = "cangjingge_80JQTZ.nav"
x002952_g_LimitMembers = 1				--可以进副本的最小队伍人数
x002952_g_TickTime = 1					--回调脚本的时钟时间（单位：秒/次）
x002952_g_DayTime = 20					--一天内可以进入副本的次数
x002952_g_LimitTotalHoldTime = 360		--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x002952_g_LimitTimeSuccess = 500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x002952_g_CloseTick = 3					--副本关闭前倒计时（单位：次数）
x002952_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x002952_g_DeadTrans = 0					--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x002952_g_Fuben_X = 130					--进入副本的位置X
x002952_g_Fuben_Z = 204					--进入副本的位置Z
x002952_g_Back_X = 282					--源场景位置X
x002952_g_Back_Z = 228					--源场景位置Z
x002952_g_Back_SceneId = 2				--源场景Id

--**********************************
--任务入口函数
--**********************************
function x002952_OnDefaultEvent( sceneId, selfId, targetId )

--下面这个if语句其实不必要	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			--AddText(sceneId,"#{yanziwu_info}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x002952_g_Name  then
		return
	end

	-- 根据玩家的情况，将玩家送到不同的副本
	-- 2，检测玩家是不是组队了
	if GetTeamSize(sceneId,selfId) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B挑战少室山");
			AddText(sceneId,"  此战凶险异常，不足3人我可不敢让你们进入。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3，检测玩家是不是队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B挑战少室山");
			AddText(sceneId,"  你必须是队长才行。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 4，检测是不是人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B挑战少室山");
			AddText(sceneId,"  还有队员不在附近。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5，检测队伍里头的每个玩家是不是都到60级了
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		if GetLevel(sceneId,nPlayerId) < 60  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B挑战少室山");
				AddText(sceneId,"  此战凶险异常，不足60级我可不敢让你们进入。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return
		end
	end

	-- 每天只能3次
	--MD_SSS_TIMES		=	246  -- 每天进入少室山的次数
	--MD_PRE_SSS_TIME	=	247  -- 上一次去少室山的时间

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	local nPlayerNum = GetNearTeamCount(sceneId,selfId)
	local bOk = 1
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		local nTimes = GetMissionData(sceneId,nPlayerId, MD_SSS_TIMES) 
		local nPreTime = GetMissionData(sceneId,nPlayerId, MD_PRE_SSS_TIME)
		local nCurTime = LuaFnGetCurrentTime()
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x002952_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x002952_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_SSS_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_PRE_SSS_TIME, nPreTime)
		end
		
		if nTimes >= x002952_g_DayTime then
			bOk = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
		
	end
	local nCount = 0

	if bOk == 0  then
		local szAllName = ""
		for i=1, 6  do
			if strName[i] ~= ""  then
				if nCount == 0  then
					szAllName = strName[i]
				else
					szAllName = szAllName .. "、" .. strName[i]
				end
				nCount = nCount+1
			end
		end
		BeginEvent(sceneId)
			AddText(sceneId,"#B挑战少室山");
			AddText(sceneId,"  你的队伍中" .. szAllName .. "今天已经参加过3次挑战少室山战役。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	
	end
	
	-- 所有的检测通过，
	x002952_MakeCopyScene(sceneId, selfId)
	
end

--**********************************
--列举事件
--**********************************
function x002952_OnEnumerate( sceneId, selfId, targetId )
	-- 最好在这里做一个名字判定
	if GetName(sceneId, targetId) == x002952_g_Name  then
		AddNumText( sceneId, x002952_g_ScriptId, "挑战少室山",10 ,-1  )
		AddNumText( sceneId, x002952_g_ScriptId, "关于挑战少室山",8 ,1  )
	end
end

--**********************************
--检测接受条件
--**********************************
function x002952_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x002952_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x002952_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x002952_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x002952_MakeCopyScene( sceneId, selfId )
	
	-- 使用队员的等级来算出怪物的等级
	local param0 = 4;
	local param1 = 3;

	--最终结果
	local mylevel = 0;

	--临时变量
	local memId;
	local tempMemlevel = 0;
	local level0 = 0;
	local level1 = 0;
	local i;
	
	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, memId);
		level0 = level0 + (tempMemlevel ^ param0);
		level1 = level1 + (tempMemlevel ^ param1);
	end
	
	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1;
	end
	
	if nearmembercount == -1  then  --没有队伍
		mylevel = GetLevel(sceneId, selfId)
	end
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "cangjingge_80JQTZ.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x002952_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x002952_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x002952_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x002952_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);		--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);	--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);		--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);		--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;	--杀死Boss的数量
	
	-- 剧情用到的变量清空
	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end
	
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < 100 then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = 10;
	end

	-- 使用第13位，记录怪物实际的等级
	LuaFnSetCopySceneData_Param(sceneId, x002952_g_SceneData_7, mylevel)
	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "cangjingge_80JQTZ_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangjingge_80JQTZ_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"少室山恶人已经引出来了！");
		else
			AddText(sceneId,"少室山恶人已经引出来了！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x002952_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个文件没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)
	
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- 处于无法执行逻辑的状态
		return
	end
	
	-- 检测玩家是不是有队伍
	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then   -- 没有队伍
		x002952_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x002952_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x002952_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x002952_GotoScene(sceneId, ObjId, destsceneId)
	NewWorld( sceneId, ObjId, destsceneId, x002952_g_Fuben_X, x002952_g_Fuben_Z) ;
end


--**********************************
--有玩家进入副本事件
--**********************************
function x002952_OnPlayerEnter( sceneId, selfId )
	-- 3,设置死亡事件
	
	-- 设置玩家的阵营为 109
	SetUnitCampID(sceneId, selfId, selfId, 109)
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x002952_g_Fuben_X, x002952_g_Fuben_Z )
	
	local nTimes = GetMissionData(sceneId,selfId, MD_SSS_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_PRE_SSS_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	
	SetMissionData(sceneId, selfId, MD_SSS_TIMES, nTimes+1) 
	SetMissionData(sceneId, selfId, MD_PRE_SSS_TIME, nCurTime)
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x002952_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x002952_OnAbandon( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x002952_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x002952_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x002952_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x002952_OnDie( sceneId, objId, killerId )
	
end

--**********************************
--提示所有副本内玩家
--**********************************
function x002952_TipAllHuman( sceneId, Str )
	-- 获得场景里头的所有人
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- 没有人的场景，什么都不做
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x002952_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x002952_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x002952_OnItemChanged( sceneId, selfId, itemdataId )
	
end



