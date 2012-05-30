--副本任务
--木人

--************************************************************************
--MisDescBegin

--脚本号
x210222_g_ScriptId = 210222

--副本名称
x210222_g_CopySceneName="后花园"
x210222_g_CopySceneMap = "newbie_2.nav"
x210222_g_CopySceneMonster = "newbie_2_monster.ini"

--任务号
x210222_g_MissionId = 702

--上一个任务的ID
x210222_g_MissionIdPre = 701

--目标NPC
x210222_g_Name = "劫匪"

--是否是精英任务
x210222_g_IfMissionElite = 1

--任务归类
x210222_g_MissionKind = 13

--任务等级
x210222_g_MissionLevel = 7

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_MURENXIANG_HUAN
--g_MissionRound = 9
--**********************************以上是动态****************************

--任务文本描述
x210222_g_MissionName="后花园"
x210222_g_MissionInfo="#{event_dali_0032}"  --任务描述
x210222_g_MissionTarget="进入后花园。"	--任务目标
x210222_g_ContinueInfo="进入后花园"	--未完成任务的npc对话
x210222_g_MissionComplete="  任务完成"	--完成任务npc说话的话
x210222_g_SignPost = {x = 275, z = 50, tip = "黄眉僧"}
x210222_g_PetDataID=558	--任务宠物的编号

--角色Mission变量说明
x210222_g_Param_huan		=0	--0号：已经完成的环数，在接收任务时候赋值
x210222_g_IsMissionOkFail	=1	--1号：当前任务是否完成(0未完成；1完成)
x210222_g_Param_sceneid		=2	--2号：当前副本任务的场景号
x210222_g_Param_guid		=3	--3号：接副本任务时候的玩家GUID
x210222_g_Param_killcount	=4	--4号：杀死任务怪的数量
x210222_g_Param_time		=5	--5号：完成副本所用时间(单位：秒)
--6号：未用
--7号：未用

--任务奖励
x210222_g_MoneyBonus=2

--MisDescEnd
--************************************************************************

x210222_g_CopySceneType=FUBEN_MURENXIANG_7	--副本类型，定义在ScriptGlobal.lua里面
x210222_g_LimitMembers=1			--可以进副本的最小队伍人数
x210222_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x210222_g_LimitTotalHoldTime=360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x210222_g_LimitTimeSuccess=500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x210222_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x210222_g_NoUserTime=300			--副本中没有人后可以继续保存的时间（单位：秒）
x210222_g_DeadTrans=0				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x210222_g_Fuben_X=44				--进入副本的位置X
x210222_g_Fuben_Z=54				--进入副本的位置Z
x210222_g_Back_X=275				--源场景位置X
x210222_g_Back_Z=50					--源场景位置Z
x210222_g_TotalNeedKill=0			--需要杀死怪物数量
x210222_g_MissionIdPre=701			--需要提前拥有的任务

--**********************************
--任务入口函数
--**********************************
function x210222_OnDefaultEvent( sceneId, selfId, targetId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0  then	--如果玩家已经接了这个任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		bDone = x210222_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,"准备好了吗！")
				AddMoneyBonus( sceneId, x210222_g_MoneyBonus )
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x210222_g_MissionName)
				AddText(sceneId,x210222_g_MissionComplete)
				--AddText(sceneId,"你将得到：")
				--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId,bDone)
		end
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then		--没有任务，满足任务接收条件
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionName)
			AddText(sceneId,x210222_g_MissionInfo)
			--AddText(sceneId,"任务目标：")
			--AddText(sceneId,x210222_g_MissionTarget)
			--AddText(sceneId,"你将得到：")
			--AddMoneyBonus(sceneId,x210222_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210222_g_ScriptId,x210222_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x210222_OnEnumerate( sceneId, selfId, targetId )
	if IsMissionHaveDone(sceneId,selfId,x210222_g_MissionId) > 0 then
		return
	end
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0 then
		AddNumText(sceneId, x210222_g_ScriptId,x210222_g_MissionName,2,-1);
	--满足任务接收条件
    elseif x210222_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x210222_g_ScriptId,x210222_g_MissionName,1,-1);
    end
end

--**********************************
--检测接受条件
--**********************************
function x210222_CheckAccept( sceneId, selfId )
	if IsHaveMission(sceneId,selfId,x210222_g_MissionIdPre) <= 0    then
		return 0
	end

	local petcount = LuaFnGetPetCount(sceneId, selfId) --取得宠物数量
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --取得宠物编号
		if petdataid==x210222_g_PetDataID then
			return	0
		end
	end

	return 1
end

--**********************************
--接受
--**********************************
function x210222_OnAccept( sceneId, selfId )

	local selfguid = LuaFnGetGUID( sceneId, selfId)

	if( IsHaveMission(sceneId,selfId,x210222_g_MissionId) > 0)  then	--已经有任务的
		misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
		saveguid = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_guid)

		if copysceneid>=0 and selfguid==saveguid then --进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x210222_g_Fuben_X, x210222_g_Fuben_Z )
			else
				x210222_NotifyFailTips( sceneId, selfId, "副本已关闭，请放弃此任务后重新接取" )
			end
		else
			x210222_NotifyFailTips( sceneId, selfId, "请重新接此任务。" )
		end
	else
		--加入任务到玩家列表
		if x210222_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--给每个队伍成员加入任务
		AddMission( sceneId, selfId, x210222_g_MissionId, x210222_g_ScriptId, 0, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, selfId, x210222_g_MissionId )

		--将任务的第1号数据设置为0,表示未完成的任务
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_IsMissionOkFail,0)

		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_sceneid,-1)

		--将任务的第3号数据队伍号
		SetMissionByIndex(sceneId,selfId,misIndex,x210222_g_Param_guid,selfguid)
		Msg2Player( sceneId, selfId,"#Y接受任务：后花园",MSG2PLAYER_PARA )
		CallScriptFunction( SCENE_SCRIPT_ID, "AskTheWay", sceneId, selfId, sceneId, x210222_g_SignPost.x, x210222_g_SignPost.z, x210222_g_SignPost.tip )
		x210222_MakeCopyScene( sceneId, selfId, 0 )
	end
end

--**********************************
--放弃
--**********************************
function x210222_OnAbandon( sceneId, selfId )
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x210222_g_MissionId )

	if sceneId==copyscene then --如果在副本里删除任务，则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"你结束了后花园的探险，返回大理城！");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x210222_MakeCopyScene( sceneId, selfId, nearmembercount )

	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, x210222_g_CopySceneMap); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x210222_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x210222_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x210222_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x210222_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, leaderguid); --保存玩家号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死Boss的数量
	LuaFnSetSceneLoad_Monster(sceneId, x210222_g_CopySceneMonster)	--7级后花园捉宠副本

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
			--删除玩家任务列表中对应的任务
			DelMission( sceneId, selfId, x210222_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

end

--**********************************
--继续
--**********************************
function x210222_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_Param_sceneid)>=1	then
		BeginEvent(sceneId)
			AddText(sceneId,x210222_g_MissionComplete);
		EndEvent(sceneId)
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x210222_g_ScriptId, x210222_g_MissionId)
	end

end

--**********************************
--检测是否可以提交
--**********************************
function x210222_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x210222_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务是否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x210222_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x210222_g_IsMissionOkFail)>=1 then
		return	1
	else
		return	0
	end
	return 0
end

--**********************************
--提交
--**********************************
function x210222_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x210222_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		-- 已经完成任务了
		--添加任务奖励
		money = x210222_g_MoneyBonus									-- *iDayHuan
		AddMoney(sceneId,selfId,money );

		BeginEvent(sceneId)
	  		AddText(sceneId,"任务完成")
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)

		--设置任务已经被完成过
		DelMission( sceneId, selfId, x210222_g_MissionId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x210222_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--进入区域事件
--**********************************
function x210222_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x210222_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x210222_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) == 1 then			-- 处于可以执行逻辑的状态
		if IsHaveMission( sceneId, leaderObjId, x210222_g_MissionId ) > 0 then
			misIndex = GetMissionIndexByID( sceneId, leaderObjId, x210222_g_MissionId )

			--将任务的第2号数据设置为副本的场景号
			SetMissionByIndex( sceneId, leaderObjId, misIndex, x210222_g_Param_sceneid, destsceneId )

			NewWorld( sceneId, leaderObjId, destsceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z )
		else
			x210222_NotifyFailTips( sceneId, leaderObjId, "你当前未接此任务" )
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x210222_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x210222_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x210222_NotifyFailTips( sceneId, selfId, "你当前未接此任务，返回大理城" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
		return
	end

	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x210222_g_Fuben_X, x210222_g_Fuben_Z );
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x210222_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x210222_OnCopySceneTimer( sceneId, nowTime )

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

		if leaveTickCount == x210222_g_CloseTick then --倒计时间到，大家都出去吧

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x210222_g_Back_X, x210222_g_Back_Z )
			end

		elseif leaveTickCount<x210222_g_CloseTick then

			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
	  		local strText = format("你将在%d秒后离开场景!", (x210222_g_CloseTick-leaveTickCount)*x210222_g_TickTime )
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x210222_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x210222_g_MissionId );--任务失败,删除之

  			BeginEvent(sceneId)
  				AddText(sceneId,"任务失败，超时!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
	end
end

function x210222_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
