-- 402030
-- 剿匪副本  帮派福利，效率副本
-- 玩家进入副本会被扣除数值，
-- 玩家死亡，在入口复活，正常死亡消耗

--************************************************************************
--MisDescBegin
--脚本号
x402030_g_ScriptId = 402030
x402030_g_Name = "齐煞云"

x402030_TIME_2000_01_03_ = 946828868
--MisDescEnd
--************************************************************************

x402030_g_Item = 40004426

--副本名称
x402030_g_CopySceneName = "镜湖水寨"

x402030_g_CopySceneType = FUBEN_JIAOFEI	--副本类型，定义在ScriptGlobal.lua里面

x402030_g_CopySceneMap = "jiaofei.nav"
x402030_g_Exit = "jiaofei.ini"
x402030_g_LimitMembers = 1				--可以进副本的最小队伍人数
x402030_g_TickTime = 1						--回调脚本的时钟时间（单位：秒/次）
x402030_g_LimitTotalHoldTime = 360--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x402030_g_LimitTimeSuccess = 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x402030_g_CloseTick = 3						--副本关闭前倒计时（单位：次数）
x402030_g_NoUserTime = 300				--副本中没有人后可以继续保存的时间（单位：秒）
x402030_g_DeadTrans = 0						--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x402030_g_Fuben_X = 33						--进入副本的位置X
x402030_g_Fuben_Z = 168						--进入副本的位置Z
x402030_g_Back_X = 66							--源场景位置X
x402030_g_Back_Z = 56							--源场景位置Z
x402030_g_Back_SceneId = 5				--源场景Id

x402030_g_BossPoint={x=137, z=41}

x402030_g_MonsterPoint={
							{x=31, z=165},{x=36, z=162},{x=37, z=158},{x=32, z=154},
							{x=31, z=148},{x=34, z=142},{x=41, z=142},{x=48, z=143},
							{x=56, z=147},{x=62, z=151},{x=68, z=154},{x=73, z=157},
							{x=80, z=161},{x=88, z=163},{x=95, z=162},{x=103, z=163},
							{x=114, z=163},{x=111, z=157},{x=104, z=152},{x=94, z=147},
							{x=87, z=142},{x=81, z=136},{x=74, z=133},{x=68, z=125},
							{x=62, z=122},{x=54, z=115},{x=48, z=110},{x=43, z=103},
							{x=38, z=97},{x=36, z=89},{x=43, z=86},{x=48, z=87},
							{x=51, z=92},{x=57, z=90},{x=64, z=93},{x=69, z=96},
							{x=75, z=101},{x=82, z=105},{x=91, z=112},{x=97, z=117},
							{x=101, z=121},{x=108, z=125},{x=112, z=129},{x=116, z=133},
							{x=123, z=137},{x=131, z=143},{x=136, z=146},{x=139, z=150},
							{x=146, z=153},{x=153, z=151},{x=157, z=144},{x=153, z=139},
							{x=149, z=135},{x=149, z=130},{x=155, z=128},{x=159, z=124},
							{x=159, z=118},{x=153, z=116},{x=151, z=111},{x=142, z=108},
							{x=134, z=106},{x=126, z=104},{x=120, z=101},{x=114, z=96},
							{x=106, z=91},{x=99, z=86},{x=92, z=81},{x=86, z=77},
							{x=81, z=73},{x=76, z=71},{x=71, z=68},{x=65, z=66},
							{x=62, z=64},{x=58, z=61},{x=53, z=59},{x=49, z=57},
							{x=45, z=55},{x=42, z=49},{x=36, z=46},{x=38, z=38},
							{x=45, z=35},{x=52, z=36},{x=61, z=35},{x=70, z=36},
							{x=79, z=37},{x=87, z=44},{x=95, z=49},{x=101, z=53},
							{x=111, z=56},{x=119, z=56},{x=128, z=55},{x=139, z=53},
							{x=147, z=41},{x=153, z=47},{x=157, z=55},{x=156, z=63},
							{x=151, z=64},{x=145, z=63},{x=140, z=63},{x=129, z=63},
							}

-- 一般小怪		
x402030_g_SmallMonsterId={2510,2511,2512,2513,2514,2515,2516,2517,2518,2519,32510,32511,32512,32513,32514,32515,32516,32517,32518,32519}
-- 精英怪
x402030_g_MiddleMonsterId={2520,2521,2522,2523,2524,2525,2526,2527,2528,2529,32520,32521,32522,32523,32524,32525,32526,32527,32528,32529}
-- BOSS怪
x402030_g_BossMonsterId={2530,2531,2532,2533,2534,2535,2536,2537,2538,2539,32530,32531,32532,32533,32534,32535,32536,32537,32538,32539}

x402030_g_SmallMonsterName 		= "镜湖水匪"
x402030_g_MiddleMonsterName		= "镜湖水匪精英"
x402030_g_BossMonsterName			= "镜湖水匪头领"
x402030_g_MinHumanCount = 3

--**********************************
--任务入口函数
--**********************************
function x402030_OnDefaultEvent( sceneId, selfId, targetId )
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#{function_help_096}");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetName(sceneId, targetId) ~= x402030_g_Name  then
		return
	end

	-- 根据玩家的情况，将玩家送到不同的副本
	-- 1，检查活动时间 （每周六的下午1：00到10：00之间）
	local nWeek = GetTodayWeek()
	if nWeek~=6  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  剿匪只有在每周六的下午13：00到22：00之间进行，请到时候再来参加。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end
	
	--begin modified by zhangguoxin 090207
	--local nHour = GetHourTime()
	--local temp = floor(nHour/100)*100
	--if nHour - temp < 52  or nHour - temp >= 88   then
	local nQuarter = mod(GetQuarterTime(),100);
	if nQuarter < 52 or nQuarter >= 88 then
	--end modified by zhangguoxin 090207
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  剿匪只有在每周六的下午13：00到22：00之间进行，请到时候再来参加。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		return
	end

	-- 2，检测玩家是不是组队了
	if GetTeamSize(sceneId,selfId) < x402030_g_MinHumanCount  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  镜湖水匪人多势众，阁下单枪匹马实在太危险了，建议最少3个人组队前来方可参加。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	-- 3，检测玩家是不是队长
	if GetTeamLeader(sceneId,selfId) ~= selfId    then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  只有队长才能领取剿匪任务。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 4，检测是不是人都到位了
	if GetTeamSize(sceneId,selfId) ~= GetNearTeamCount(sceneId,selfId)  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  对不起，您有队员不在附近，无法领取任务。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 先检测队长自己是不是足够条件进副本
	--  先做完队长的个人检测之后，再检测队员是不是够条件
	if LuaFnGetAvailableItemCount(sceneId, selfId, x402030_g_Item) < 1  then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  对不起，您身上没有携带银纰令箭，无法参与此次剿匪行动。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	local nTimes = GetMissionData(sceneId,selfId, MD_JIAOFEI_TIMES) 
	local nPreTime = GetMissionData(sceneId,selfId, MD_JIAOFEI_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
		nTimes = 0
		nPreTime = nCurTime
		SetMissionData(sceneId, selfId, MD_JIAOFEI_TIMES, nTimes)
		SetMissionData(sceneId, selfId, MD_JIAOFEI_PRE_TIME, nPreTime)
	end
	if nTimes >= 1   then
		BeginEvent(sceneId)
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  您今天已经参加过剿匪行动了，请下周再来参加。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--5，检测队伍里头的每个玩家是不是身上都有这个物品了
	local ret = 1
	local nPlayerNum = GetNearTeamCount(sceneId,selfId)

	local strName = {}
	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""
	
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		if LuaFnGetAvailableItemCount(sceneId,nPlayerId,x402030_g_Item) < 1  then
			ret = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
	end
	
	local nCount = 0
	if ret == 0  then
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
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  您队伍中有成员（" .. szAllName .. "）身上没有携带银纰令箭。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	strName[1] = ""
	strName[2] = ""
	strName[3] = ""
	strName[4] = ""
	strName[5] = ""
	strName[6] = ""

	--6,检测玩家今天内是不是进行过3次剿匪
	for i=0, nPlayerNum-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		
		nTimes = GetMissionData(sceneId,nPlayerId, MD_JIAOFEI_TIMES) 
		nPreTime = GetMissionData(sceneId,nPlayerId, MD_JIAOFEI_PRE_TIME)
		
		-- 看时间是不是过了一天，过了就先更新
		if (nCurTime - nPreTime  >= 3600*24)  or
			 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
			nTimes = 0
			nPreTime = nCurTime
			SetMissionData(sceneId, nPlayerId, MD_JIAOFEI_TIMES, nTimes)
			SetMissionData(sceneId, nPlayerId, MD_JIAOFEI_PRE_TIME, nPreTime)
		end

		if nTimes >= 1   then
			ret = 0
			strName[i+1] = GetName(sceneId, nPlayerId)
		end
	end
	
	nCount = 0
	if ret == 0  then
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
			AddText(sceneId,"#B镜湖剿匪");
			AddText(sceneId,"  您队伍中有成员（" .. szAllName .. "）今天已经参加过剿匪行动。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	-- 所有的检测通过，现在开始扣物品
	x402030_MakeCopyScene(sceneId, selfId)
end

--**********************************
--列举事件
--**********************************
function x402030_OnEnumerate( sceneId, selfId, targetId )
	-- 最好在这里做一个名字判定
	if GetName(sceneId, targetId) == x402030_g_Name  then
		AddNumText( sceneId, x402030_g_ScriptId, "送我去镜湖水寨",10 ,-1  )
		AddNumText( sceneId, x402030_g_ScriptId, "关于镜湖剿匪",8 ,1  )
		
	end
	
end

--**********************************
--检测接受条件
--**********************************
function x402030_CheckAccept( sceneId, selfId )
	
end

--**********************************
--询问玩家是否要进入副本
--**********************************
function x402030_AskEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--接受
--**********************************
function x402030_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--玩家同意进入副本
--**********************************
function x402030_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
--创建副本
--**********************************
function x402030_MakeCopyScene( sceneId, selfId )
	
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
	LuaFnSetSceneLoad_Map(sceneId, "jiaofei.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402030_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x402030_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x402030_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402030_g_ScriptId);--将1号数据设置为副本场景事件脚本号
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
	
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 1;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10);
	else
		iniLevel = PlayerMaxLevel/10;
	end

	-- 使用副本变量8，9，10来保存怪物编号
	LuaFnSetCopySceneData_Param(sceneId, 8, x402030_g_SmallMonsterId[iniLevel]) --小怪ID
	LuaFnSetCopySceneData_Param(sceneId, 9, x402030_g_MiddleMonsterId[iniLevel])--精英ID
	LuaFnSetCopySceneData_Param(sceneId,10, x402030_g_BossMonsterId[iniLevel]) 	--BossID
	
	-- 使用第11位，记录怪物实际的等级
	LuaFnSetCopySceneData_Param(sceneId,11, mylevel)
	
	--设置场景中的各种Npc和区域
	LuaFnSetSceneLoad_Area( sceneId, "jiaofei_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "jiaofei_monster.ini" )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--副本事件
--**********************************
function x402030_OnCopySceneReady( sceneId, destsceneId )

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
		x402030_GotoScene(sceneId, leaderObjId, destsceneId)
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			x402030_GotoScene(sceneId, leaderObjId, destsceneId)
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				x402030_GotoScene(sceneId, mems[i], destsceneId)
			end
		end
	end

end

function x402030_GotoScene(sceneId, ObjId, destsceneId)
	-- 记录次数
	local nTimes = GetMissionData(sceneId,ObjId, MD_JIAOFEI_TIMES) 
	local nPreTime = GetMissionData(sceneId,ObjId, MD_JIAOFEI_PRE_TIME)
	local nCurTime = LuaFnGetCurrentTime()
	-- 看时间是不是过了一天，过了就先更新
	if (nCurTime - nPreTime  >= 3600*24)  or
		 (floor((nCurTime-x402030_TIME_2000_01_03_)/(3600*24)) ~= floor((nPreTime-x402030_TIME_2000_01_03_)/(3600*24)))   then
		nTimes = 0
		nPreTime = nCurTime
	end
	SetMissionData(sceneId, ObjId, MD_JIAOFEI_TIMES, nTimes+1)
	SetMissionData(sceneId, ObjId, MD_JIAOFEI_PRE_TIME, nPreTime)
	
	NewWorld( sceneId, ObjId, destsceneId, x402030_g_Fuben_X, x402030_g_Fuben_Z) ;
	
	-- 统计信息
	LuaFnAuditJiaoFei(sceneId, ObjId)

end


--**********************************
--有玩家进入副本事件
--**********************************
function x402030_OnPlayerEnter( sceneId, selfId )
	
	-- 进入副本内的玩家，现要检测玩家是不是已经扣过物品
	local selfGuid = LuaFnObjId2Guid( sceneId, selfId )
	local nHumanCount = LuaFnGetCopySceneData_Param(sceneId, 27)
	if 	LuaFnGetCopySceneData_Param(sceneId, 21) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 22) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 23) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 24) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 25) ~= selfGuid  and
			LuaFnGetCopySceneData_Param(sceneId, 26) ~= selfGuid  then
				
		if DelItem(sceneId, selfId, x402030_g_Item, 1) == 0  then
			NewWorld( sceneId, selfId, x402030_g_Back_SceneId, x402030_g_Back_X, x402030_g_Back_Z) ;
			return
		end
		
		LuaFnSetCopySceneData_Param(sceneId, 21+nHumanCount, selfGuid)
		LuaFnSetCopySceneData_Param(sceneId, 27, nHumanCount+1)
	end

	-- 3,设置死亡事件
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x402030_g_Fuben_X, x402030_g_Fuben_Z )
	
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x402030_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--放弃
--**********************************
function x402030_OnAbandon( sceneId, selfId )
	
end

--**********************************
-- 回城，只有城市任务副本可以调用此接口
--**********************************
function x402030_BackToCity( sceneId, selfId )
	
end

--**********************************
--继续
--**********************************
function x402030_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--检测是否可以提交
--**********************************
function x402030_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--提交
--**********************************
function x402030_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x402030_OnDie( sceneId, objId, killerId )
	
	local nMonster1 = LuaFnGetCopySceneData_Param(sceneId, 17)
	local nMonster2 = LuaFnGetCopySceneData_Param(sceneId, 18)
	local nMonster3 = LuaFnGetCopySceneData_Param(sceneId, 19)
	
	if GetName(sceneId, objId) == x402030_g_SmallMonsterName  then
		nMonster1 = nMonster1 + 1
		LuaFnSetCopySceneData_Param(sceneId, 17, nMonster1)
		x402030_TipAllHuman( sceneId, "已杀死" .. x402030_g_SmallMonsterName .. "：" .. tostring(nMonster1) .. "/200")
		
	elseif GetName(sceneId, objId) == x402030_g_MiddleMonsterName  then
		nMonster2 = nMonster2 + 1
		LuaFnSetCopySceneData_Param(sceneId, 18, nMonster2)
		x402030_TipAllHuman( sceneId, "已杀死" .. x402030_g_MiddleMonsterName .. "：" .. tostring(nMonster2) .. "/10")
		
	elseif GetName(sceneId, objId) == x402030_g_BossMonsterName  then
		nMonster3 = nMonster3 + 1
		LuaFnSetCopySceneData_Param(sceneId, 19, nMonster3)
		x402030_TipAllHuman( sceneId, "已杀死" .. x402030_g_BossMonsterName .. "：" .. tostring(nMonster3) .. "/2")
		
		-- 发送世界消息
		
			--杀死怪物的是宠物则获取其主人的ID....
		local playerID = killerId
		local objType = GetCharacterType( sceneId, killerId )
		if objType == 3 then
			playerID = GetPetCreator( sceneId, killerId )
		end
			--如果组了队则获取队长的ID....
		local nLeaderId = GetTeamLeader(sceneId, playerID)
		if nLeaderId < 1   then
			nLeaderId = playerID
		end
		
		local str = ""
		str = format("#{_INFOUSR%s}#P率队在#G镜湖匪寨#P挑战#Y%s#P。道高一尺，魔高一丈，双方混战多时，#W#{_INFOUSR%s}#P奋起神威，将#Y%s#P斩于匪寨之中！", GetName(sceneId,nLeaderId), "#{_BOSS43}", GetName(sceneId,nLeaderId), "#{_BOSS43}")
		BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
		
		-- 为每个在副本内的玩家都做一个杀boss的记录
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1  do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			SetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME,
											GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME)+1 )

			if GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 6  then
				AwardTitle(sceneId, nHumanId, 13, 237)
				SetCurTitle(sceneId, nHumanId, 13, 237)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 18  then
				AwardTitle(sceneId, nHumanId, 13, 238)
				SetCurTitle(sceneId, nHumanId, 13, 238)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 50  then
				AwardTitle(sceneId, nHumanId, 13, 239)
				SetCurTitle(sceneId, nHumanId, 13, 239)
				DispatchAllTitle(sceneId, nHumanId)
				
			elseif GetMissionData(sceneId,nHumanId,MD_JIAOFEI_KILL_BOSS_TIME) == 100  then
				AwardTitle(sceneId, nHumanId, 13, 240)
				SetCurTitle(sceneId, nHumanId, 13, 240)
				DispatchAllTitle(sceneId, nHumanId)
			end

		end
	end
end

--**********************************
--提示所有副本内玩家
--**********************************
function x402030_TipAllHuman( sceneId, Str )
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
function x402030_OnKillObject( sceneId, selfId, objdataId, objId )
	
end

--**********************************
--进入区域事件
--**********************************
function x402030_OnEnterZone( sceneId, selfId, zoneId )
	
end

--**********************************
--道具改变
--**********************************
function x402030_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--副本场景定时器事件
--**********************************
function x402030_OnCopySceneTimer( sceneId, nowTime )
	
	-- 计时器主要要按照时间来安排刷怪
	local nPreTime = LuaFnGetCopySceneData_Param(sceneId, 12)
	local nCurTime = LuaFnGetCurrentTime()
	local nStep = LuaFnGetCopySceneData_Param(sceneId, 13)

	local SmallMonsterId	= LuaFnGetCopySceneData_Param(sceneId, 8)
	local MiddleMonsterId	= LuaFnGetCopySceneData_Param(sceneId, 9)
	local BossMonsterId		= LuaFnGetCopySceneData_Param(sceneId,10)
	
	local nMonsterLevel = LuaFnGetCopySceneData_Param(sceneId,11)

	-- 第一次执行计时器	
	if nPreTime == 0 then
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, 1)
		return
	end
	
	-- 现按照简单的每10秒刷一次怪
	if 	(nStep<20  	and nStep>  0 and nCurTime-nPreTime >= 9) or
			(nStep<40 	and nStep>=20 and nCurTime-nPreTime >= 8) or
			(nStep<60 	and nStep>=40 and nCurTime-nPreTime >= 7) or
			(nStep<=100 and nStep>=60	and nCurTime-nPreTime >= 6) then
			
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
		
		-- 怪物生成点
		local Point = x402030_g_MonsterPoint[nStep]
	
		-- 怪物ID
		if 	nStep==10 or nStep==30 or nStep==50 or nStep==70 or nStep==90 or
				nStep==20 or nStep==40 or nStep==60 or nStep==80 or nStep==100 then
			-- 小boss只刷一个
			local nNpc1 = LuaFnCreateMonster(sceneId, MiddleMonsterId, Point.x+random(2), Point.z, 17, 0, 402030)
			SetLevel(sceneId, nNpc1, nMonsterLevel)
			SetNPCAIType(sceneId, nNpc1, 0)
			SetCharacterTitle(sceneId, nNpc1, "头目")
		end
		
		local nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x+random(2), Point.z, 17, 0, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		
		nNpc1 = LuaFnCreateMonster(sceneId, SmallMonsterId, Point.x, Point.z+random(2), 17, 0, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
	
	elseif nStep==101 then
		LuaFnSetCopySceneData_Param(sceneId, 12, nCurTime)
		LuaFnSetCopySceneData_Param(sceneId, 13, nStep + 1)
		
		local nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402030_g_BossPoint.x, x402030_g_BossPoint.z, 17, 123, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterTitle(sceneId, nNpc1, "“铁锤水上漂”")
		
		nNpc1 = LuaFnCreateMonster(sceneId, BossMonsterId, x402030_g_BossPoint.x+2, x402030_g_BossPoint.z+1, 17, 123, 402030)
		SetLevel(sceneId, nNpc1, nMonsterLevel)
		SetNPCAIType(sceneId, nNpc1, 0)
		SetCharacterTitle(sceneId, nNpc1, "“铁锤水上漂”")
		
	else
		return
	end
	
end

