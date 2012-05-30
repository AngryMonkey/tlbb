--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x223901_g_ScriptId = 223901

--副本名称
x223901_g_CopySceneName="灵性峰"

--任务号
x223901_g_MissionId = 1076

--目标NPC
x223901_g_Name = ""

--是否是精英任务
x223901_g_IfMissionElite = 1

--任务归类
x223901_g_MissionKind = 23

--任务等级
x223901_g_MissionLevel = 10000

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_MURENXIANG_HUAN
--g_MissionRound =
--**********************************以上是动态****************************

--任务文本描述
x223901_g_MissionName="灵性峰"
x223901_g_MissionInfo="#{MPFB_081023_19}"  --任务描述
x223901_g_MissionTarget="#{MPFB_081023_20}"	--任务目标
x223901_g_ContinueInfo="你要继续努力啊！"	--未完成任务的npc对话
x223901_g_MissionComplete="谢谢啊。"	--完成任务npc说话的话
--任务需要杀死的怪
x223901_g_Parameter_Kill_CountRandom = { { id = 1700081, numNeeded = 6, numKilled = 4 } }

--任务奖励

--MisDescEnd
--************************************************************************

--角色Mission变量说明
x223901_g_Param_huan		=0	--0号：已经完成的环数，在接收任务时候赋值
x223901_g_Param_ok			=1	--1号：当前任务是否完成(0未完成；1完成)
x223901_g_Param_sceneid		=2	--2号：当前副本任务的场景号
x223901_g_Param_teamid		=3	--3号：接副本任务时候的队伍号
x223901_g_Param_killcount	=4	--4号：杀死任务怪的数量
x223901_g_Param_time		=5	--5号：完成副本所用时间(单位：秒)
--6号：未用
--7号：未用

x223901_g_CopySceneType=FUBEN_LINGXINGFENG	--副本类型，定义在ScriptGlobal.lua里面
x223901_g_LimitMembers=1			--可以进副本的最小队伍人数
x223901_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x223901_g_LimitTotalHoldTime=360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x223901_g_LimitTimeSuccess=500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x223901_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x223901_g_NoUserTime=300			--副本中没有人后可以继续保存的时间（单位：秒）
x223901_g_DeadTrans=0				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x223901_g_Fuben_X=42				--进入副本的位置X
x223901_g_Fuben_Z=46				--进入副本的位置Z
x223901_g_Back_X=59				--源场景位置X
x223901_g_Back_Z=71					--源场景位置Z
x223901_g_TotalNeedKill=10			--需要杀死怪物数量

--**********************************
--任务入口函数
--**********************************
function x223901_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x223901_g_MissionId) > 0)  then	--如果玩家已经接了这个任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)
		bDone = x223901_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,"任务失败，请放弃重新接取。");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x223901_g_MissionName)
				AddText(sceneId,x223901_g_MissionComplete)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x223901_g_ScriptId,x223901_g_MissionId,bDone)
		end
  elseif x223901_CheckAccept(sceneId,selfId) > 0 then		--没有任务，满足任务接收条件
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x223901_g_MissionName)
			AddText(sceneId,x223901_g_MissionInfo)
			AddText(sceneId,"任务目标：")
			AddText(sceneId,x223901_g_MissionTarget)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x223901_g_ScriptId,x223901_g_MissionId)
				
  end
end

--**********************************
--列举事件
--**********************************
function x223901_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x223901_g_MissionId) > 0 then
		AddNumText(sceneId, x223901_g_ScriptId,x223901_g_MissionName);
	--满足任务接收条件
  else
		local ret = CallScriptFunction(229000, "IsFubenMission",sceneId, selfId, targetId)
			if ret > 0 then
				AddNumText(sceneId,x223901_g_ScriptId,x223901_g_MissionName,10,0);
			end

    end
end

--**********************************
--检测接受条件
--**********************************
function x223901_CheckAccept( sceneId, selfId )
	if GetMissionCount( sceneId, selfId) >= 20 then	--队友身上任务数量是否达到上限20个
		BeginEvent(sceneId)
			AddText(sceneId,"你的任务记录已满。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	elseif IsHaveMission(sceneId,selfId,x223901_g_MissionId)>0 then
		--队友是否已经接过此任务或者另外一个任务
		BeginEvent(sceneId)
			AddText(sceneId,"你已经接到了这个任务。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return 0
	end

	return	1
end

--**********************************
--接受
--**********************************
function x223901_OnAccept( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x223901_g_MissionId) > 0)  then	--已经有任务的
		misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x223901_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x223901_g_Param_teamid)
		
		if copysceneid > 0 then --进过副本
			BeginEvent(sceneId)
				AddText(sceneId,"任务失败，请放弃重新接取。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	else
		--加入任务到玩家列表
		if x223901_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		AddMission( sceneId, selfId, x223901_g_MissionId, x223901_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, selfId, x223901_g_MissionId )

		--将任务的第1号数据设置为0,表示未完成的任务
		SetMissionByIndex(sceneId,selfId,misIndex,x223901_g_Param_ok,0)

		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		SetMissionByIndex(sceneId,selfId,misIndex,x223901_g_Param_sceneid,-1)

		SetMissionByIndex(sceneId, selfId,misIndex,6,10)
		
		x223901_MakeCopyScene( sceneId, selfId) ;
	end
	CallScriptFunction(229000, "SetFubenMissionSucc", sceneId, selfId, targetId)
end

--**********************************
--放弃
--**********************************
function x223901_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x223901_g_Param_sceneid)

	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x223901_g_MissionId )

	if sceneId==copyscene then --如果在副本里删除任务，则直接传送回
		--BeginEvent(sceneId)
		--	AddText(sceneId,"任务失败！");
		--EndEvent(sceneId)
		--DispatchMissionTips(sceneId,selfId)

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

		NewWorld( sceneId, selfId, oldsceneId, x223901_g_Back_X, x223901_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x223901_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mylevel = GetLevel(sceneId,selfId)

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "lingxingfeng.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x223901_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x223901_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x223901_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x223901_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量

	--师门任务....去别的门派的副本任务....40级(含)以上的玩家使用经验高的怪....
	local isMoreExpFuben = 0
	local iniLevel
	for i, v in MENPAI_SHIMEN_MISID do
		if IsHaveMission(sceneId,selfId,v) > 0 then
			local	misIndex = GetMissionIndexByID(sceneId,selfId,v)
			local missionType = GetMissionParam(sceneId, selfId, misIndex, 1)
			if missionType == 8 and mylevel >= 40 then
				isMoreExpFuben = 1
			end
		end
	end

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	if isMoreExpFuben == 0 then
		if mylevel < 10 then
			iniLevel = 10
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end
		LuaFnSetSceneLoad_Monster( sceneId, "lingxingfeng_monster_" .. iniLevel .. ".ini" )
	else
		if mylevel < 50 then
			iniLevel = 40
		elseif mylevel < PlayerMaxLevel then
			iniLevel = floor( mylevel/10 ) * 10
		else
			iniLevel = PlayerMaxLevel
		end
		LuaFnSetSceneLoad_Monster( sceneId, "lingxingfeng_20monster_" .. iniLevel .. ".ini" )
	end

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

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
--继续
--**********************************
function x223901_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x223901_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x223901_g_ScriptId, x223901_g_MissionId)
	end

end

--**********************************
--检测是否可以提交
--**********************************
function x223901_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x223901_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务是否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x223901_g_Param_ok)>=1 then
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x223901_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if x223901_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经完成任务了
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x223901_g_MissionId )

		CallScriptFunction(229000, "SetFubenMissionSucc", sceneId, selfId, targetId)		
		
		BeginEvent(sceneId)
			strText = "#{MPFB_081023_21}"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x223901_OnKillObject( sceneId, selfId, objdataId ,objId )

	--是否是副本
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end
	--是否是所需要的副本
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x223901_g_CopySceneType then
		return
	end
	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;
	if 	leaveFlag==1 then --如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	--取得当前场景里的人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)

	killednumber = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死怪的数量
	killednumber = killednumber+1
	LuaFnSetCopySceneData_Param(sceneId, 7, killednumber) ;--设置杀死怪的数量

	if killednumber<x223901_g_TotalNeedKill then

		BeginEvent(sceneId)
			strText = format("已杀死怪物： %d/%d", killednumber, x223901_g_TotalNeedKill )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取得当前场景里人的objId
			DispatchMissionTips(sceneId,humanObjId)

			misIndex = GetMissionIndexByID(sceneId,humanObjId,x223901_g_MissionId) --取得任务数据索引值
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x223901_g_Param_killcount) --取得已经杀了的怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x223901_g_Param_killcount,killedcount) --设置任务数据
		end
	elseif killednumber>=x223901_g_TotalNeedKill then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)

		--取得已经执行的定时次数
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取得当前场景里人的objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x223901_g_MissionId)--取得任务数据索引值

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x223901_g_Param_killcount) --取得已经杀了的怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x223901_g_Param_killcount,killedcount) --设置任务数据

			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,x223901_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,humanObjId,misIndex,x223901_g_Param_time,TickCount*x223901_g_TickTime)--设置任务数据

			BeginEvent(sceneId)
				AddText(sceneId,"任务完成，你将被传送到入口位置");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
			
			DelMission( sceneId, humanObjId, x223901_g_MissionId )
			--local oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
			--NewWorld( sceneId, humanObjId, oldsceneId, x223901_g_Back_X, x223901_g_Back_Z )
			
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x223901_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x223901_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x223901_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	misIndex = GetMissionIndexByID(sceneId,leaderObjId,x223901_g_MissionId)

	--将任务的第2号数据设置为副本的场景号
	SetMissionByIndex(sceneId,leaderObjId,misIndex,x223901_g_Param_sceneid,destsceneId)

	NewWorld( sceneId, leaderObjId, destsceneId, x223901_g_Fuben_X, x223901_g_Fuben_Z) ;
end

--**********************************
--有玩家进入副本事件
--**********************************
function x223901_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x223901_g_Fuben_X, x223901_g_Fuben_Z );
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x223901_OnHumanDie( sceneId, selfId, killerId )
	if x223901_g_DeadTrans==1 then --死亡后需要被强制踢出场景

		misIndex = GetMissionIndexByID(sceneId,selfId,x223901_g_MissionId)--取得任务数据索引值

		--将任务的第1号数据设置为1,表示完成的任务
		SetMissionByIndex(sceneId,selfId,misIndex,x223901_g_Param_ok,1)--设置任务数据
		
		--副本时钟读取及设置
		local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
	
		--完成副本所用时间
		SetMissionByIndex(sceneId,selfId,misIndex,x223901_g_Param_time,TickCount*x223901_g_TickTime)--设置任务数据

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x223901_g_Back_X, x223901_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x223901_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
	TickCount = TickCount+1 ;
	LuaFnSetCopySceneData_Param(sceneId, 2, TickCount);--设置新的定时器调用次数

	--副本关闭标志
	leaveFlag = LuaFnGetCopySceneData_Param(sceneId, 4) ;

	if leaveFlag == 1 then --需要离开

		--离开倒计时间的读取和设置
		leaveTickCount = LuaFnGetCopySceneData_Param(sceneId, 5) ;
		leaveTickCount = leaveTickCount+1 ;
		LuaFnSetCopySceneData_Param(sceneId, 5, leaveTickCount) ;

		if leaveTickCount == x223901_g_CloseTick then --倒计时间到，大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x223901_g_Back_X, x223901_g_Back_Z )
			end

		elseif leaveTickCount<x223901_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
	  			BeginEvent(sceneId)
	  				strText = format("你将在%d秒后离开场景!", (x223901_g_CloseTick-leaveTickCount)*x223901_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
	  		end
			end
		end
	elseif TickCount == x223901_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  			BeginEvent(sceneId)
  				AddText(sceneId,"任务时间到，完成!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
			end
			misIndex = GetMissionIndexByID(sceneId,mems[i],x223901_g_MissionId)--取得任务数据索引值
			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x223901_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,mems[i],misIndex,x223901_g_Param_time,TickCount*x223901_g_TickTime)--设置任务数据
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	elseif TickCount == x223901_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x223901_g_MissionId );--任务失败,删除之
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  			BeginEvent(sceneId)
  				AddText(sceneId,"任务失败，超时!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  		end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;

	end
end


