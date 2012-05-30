--副本任务
--陈永仁引导副本

--************************************************************************
--MisDescBegin

--脚本号
x311004_g_ScriptId = 311004

--副本名称
x311004_g_CopySceneName="铜锣湾"

--任务号
x311004_g_MissionId = 4001

--目标NPC
x311004_g_Name = "陈永仁"

--是否是精英任务
x311004_g_IfMissionElite = 1

--任务归类
x311004_g_MissionKind = 1

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_PINPAN_HUAN
x311004_g_MissionRound = 1
--**********************************以上是动态****************************

--任务文本描述
x311004_g_MissionName="平定叛乱"
x311004_g_MissionInfo="我们已经掌握了五台山叛军的全部底细，你去和陈永仁联系，杀死全部叛军，一个不留！"  --任务描述
x311004_g_MissionTarget="在陈永仁的帮助下进入叛军营地，杀死1名叛军首领，13名叛军守卫，6名叛军门卫"	--任务目标
x311004_g_ContinueInfo="你要继续努力啊！"	--未完成任务的npc对话
x311004_g_MissionComplete="谢谢啊，俺们终于敢出门了"	--完成任务npc说话的话


--任务奖励
x311004_g_MoneyBonus=909

--MisDescEnd
--************************************************************************

--角色Mission变量说明
--0号：已经完成的环数，在接收任务时候赋值
--1号：当前任务是否完成(0未完成；1完成)
--2号：当前副本任务的场景号
--3号：接副本任务时候的队伍号
--4号：未用
--5号：未用
--6号：未用
--7号：未用

x311004_g_LimitMembers=1 --可以进副本的最小队伍人数
x311004_g_TickTime=5 --回调脚本的时钟时间（单位：秒/次）
x311004_g_LimitTotalHoldTime=120 --副本可以存活的时间（单位：次数）
x311004_g_CloseTick=6	--副本关闭前倒计时（单位：次数）
x311004_g_NoUserTime=300 --副本中没有人后可以继续保存的时间（单位：秒）
x311004_g_Fuben_X=57.6
x311004_g_Fuben_Z=107.3

--**********************************
--任务入口函数
--**********************************
function x311004_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0)  then	--如果玩家已经接了这个任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
		bDone = x311004_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311004_g_Name then		--是目标NPC
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,"准备好了吗！")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId)
		elseif bDone==1 then	--任务已经完成，并且在交任务的NPC上点击的事件
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,x311004_g_MissionComplete)
				AddText(sceneId,"你将得到：")
				AddMoneyBonus(sceneId,x311004_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId,bDone)
		end
    elseif x311004_CheckAccept(sceneId,selfId) > 0 then		--没有任务，满足任务接收条件
		if GetName(sceneId,targetId) ~= x311004_g_Name then
			--发送任务接受时显示的信息
			BeginEvent(sceneId)
				AddText(sceneId,x311004_g_MissionName)
				AddText(sceneId,x311004_g_MissionInfo)
				AddText(sceneId,"任务目标：")
				AddText(sceneId,x311004_g_MissionTarget)
				AddText(sceneId,"你将得到：")
				AddMoneyBonus(sceneId,x311004_g_MoneyBonus)
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x311004_g_ScriptId,x311004_g_MissionId)
		end
    end
end

--**********************************
--列举事件
--**********************************
function x311004_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0 then
		bDone = x311004_CheckSubmit( sceneId, selfId )
		if GetName(sceneId,targetId) == x311004_g_Name	and	bDone==0 then --任务NPC，任务没完成
			AddNumText(sceneId, x311004_g_ScriptId,x311004_g_MissionName);
		elseif	GetName(sceneId,targetId) ~= x311004_g_Name	and	bDone==1 then --交任务的NPC, 任务完成
			AddNumText(sceneId, x311004_g_ScriptId,x311004_g_MissionName);
		end
	--满足任务接收条件
    elseif x311004_CheckAccept(sceneId,selfId) > 0 then
		if GetName(sceneId,targetId) ~= x311004_g_Name then
			AddNumText(sceneId,x311004_g_ScriptId,x311004_g_MissionName);
		end
    end
end

--**********************************
--检测接受条件
--**********************************
function x311004_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断是否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"你需要加入一支队伍。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x311004_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"你的队伍人数不足。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--只有队长才能接任务
		BeginEvent(sceneId)
	  		AddText(sceneId,"你不是队长。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	return nearteammembercount
end

--**********************************
--检测接受条件
--**********************************
function x311004_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断是否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"你需要加入一支队伍。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x311004_g_LimitMembers	then
		BeginEvent(sceneId)
	  		AddText(sceneId,"你的队伍人数不足。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	if	LuaFnIsTeamLeader( sceneId, selfId)==0	then	--只有队长才能接任务
		BeginEvent(sceneId)
	  		AddText(sceneId,"你不是队长。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	 0
	end
	
	--检测小队中是否有人任务记录已满, 队友是否已经接过此任务
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		if GetMissionCount( sceneId, mems[i]) >= 20 then	--队友身上任务数量是否达到上限20个
			BeginEvent(sceneId)
				AddText(sceneId,"队伍中有人的任务记录已满。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		elseif IsHaveMission(sceneId,mems[i],x311004_g_MissionId)>0 or IsHaveMission(sceneId,mems[i],4002)>0 then
			--队友是否已经接过此任务或者另外一个任务
			BeginEvent(sceneId)
				AddText(sceneId,"队伍中有人已经接了此任务。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	return	1
end

--**********************************
--接受
--**********************************
function x311004_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x311004_g_MissionId) > 0)  then	--已经有任务的
		misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, 2)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, 3)
		
		if copysceneid<0 then --还没有进过副本
			nearmembercount = x311004_CheckTeamLeader( sceneId, selfId )
			if nearmembercount>0 then --有队伍，人数足够，为队长, 返回值为人数
			--队长创建副本场景
				x311004_MakeCopyScene( sceneId, selfId, nearmembercount ) ;
			end
		elseif teamid==saveteamid then
			--将自己传送到副本场景
			NewWorld( sceneId, selfId, copysceneid, x311004_g_Fuben_X, x311004_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"条件不符！");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--加入任务到玩家列表
		if x311004_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--取得玩家附近的队友数量（包括自己）
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--给每个队伍成员加入任务
			AddMission( sceneId, mems[i], x311004_g_MissionId, x311004_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x311004_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,x311004_g_MissionRound)
			
			--将任务的第0号数据设置为已经完成的
			SetMissionByIndex(sceneId,mems[i],misIndex,0,huan)
			
			--将任务的第1号数据设置为0,表示未完成的任务
			SetMissionByIndex(sceneId,mems[i],misIndex,1,0)
			
			--将任务的第2号数据设置为-1, 用于保存副本的场景号
			SetMissionByIndex(sceneId,mems[i],misIndex,2,-1)

			--将任务的第3号数据队伍号
			SetMissionByIndex(sceneId,mems[i],misIndex,3,teamid)
		end
	end
end

--**********************************
--放弃
--**********************************
function x311004_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, 2)
	
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x311004_g_MissionId )
	
	if sceneId==copyscene then --如果在副本里删除任务，则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"任务失败！");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
		
		NewWorld( sceneId, selfId, oldsceneId, 127, 28 )
	end
end

--**********************************
--创建副本
--**********************************
function x311004_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "_pingpan_1.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x311004_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x311004_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, 999);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x311004_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, 0);--杀死的叛军1的数量
	LuaFnSetCopySceneData_Param(sceneId, 7, 0);--杀死的叛军2的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, 0);--杀死的叛军3的数量
	
	if	mylevel<=40	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_1_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,536);--杀死的叛军1的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,529);--杀死的叛军2的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,538);--杀死的叛军3的怪物类型
	elseif	mylevel<=55	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_40_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1825);--杀死的叛军1的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1835);--杀死的叛军2的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,539);--杀死的叛军3的怪物类型
	elseif	mylevel<=70	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_55_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1845);--杀死的叛军1的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1850);--杀死的叛军2的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,540);--杀死的叛军3的怪物类型
	elseif	mylevel<=85	 then
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_70_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,517);--杀死的叛军1的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,518);--杀死的叛军2的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,541);--杀死的叛军3的怪物类型
	else
		LuaFnSetSceneLoad_Monster(sceneId, "_pingpan_85_monster.ini")
		LuaFnSetCopySceneData_Param(sceneId, 9,1955);--杀死的叛军1的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,10,1950);--杀死的叛军2的怪物类型
		LuaFnSetCopySceneData_Param(sceneId,11,542);--杀死的叛军3的怪物类型
	end	
	
	LuaFnSetCopySceneData_Param(sceneId,12,GetTeamId(sceneId,selfId)); --保存队伍号

	local bRetSceneID = LuaFnCreateCopyScene(); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本创建失败！");
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--继续
--**********************************
function x311004_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 2)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x311004_g_ScriptId, x311004_g_MissionId)
	end

end

--**********************************
--检测是否可以提交
--**********************************
function x311004_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x311004_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务是否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x311004_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, 1)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x311004_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x311004_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经完成任务了
	
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x311004_g_MissionId )
		
		local	i=GetMissionData(sceneId,selfId,x311004_g_MissionRound)
		if	i>=10	then
			i=1
		else
			i=i+1
		end
		
		--添加任务奖励
		money = 100*i+x311004_g_MoneyBonus
		AddMoney(sceneId,selfId,money );
		
		--设置循环任务的环数
		SetMissionData(sceneId,selfId,x311004_g_MissionRound,i)
		
		BeginEvent(sceneId)
			strText_M = format("你得到%d金钱",money)
	  		strText = format("平叛任务完成，当前为第%d环",i)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x311004_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--取得当前场景里的人数
	num = LuaFnGetCopyScene_HumanCount(sceneId)
	
	killednumber_1 = LuaFnGetCopySceneData_Param(sceneId, 6) ;--杀死叛军的数量
	killednumber_2 = LuaFnGetCopySceneData_Param(sceneId, 7) ;--杀死叛军的数量
	killednumber_3 = LuaFnGetCopySceneData_Param(sceneId, 8) ;--杀死叛军的数量
	killednumber = killednumber_1+killednumber_2+killednumber_3
	IsKillOK=0		
	if killednumber<20 then
		needkilled_1 = LuaFnGetCopySceneData_Param(sceneId, 9) ;--杀死叛军的怪物类型
		needkilled_2 = LuaFnGetCopySceneData_Param(sceneId,10) ;--杀死叛军的怪物类型
		needkilled_3 = LuaFnGetCopySceneData_Param(sceneId,11) ;--杀死叛军的怪物类型

		BeginEvent(sceneId)
		if objdataId==needkilled_1 then
			killednumber_1 = killednumber_1+1
			strText = format("已杀死叛军门卫%d/6", killednumber_1 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_2 then
			killednumber_2 = killednumber_2+1
			BeginEvent(sceneId)
			strText = format("已杀死叛军守卫%d/13", killednumber_2 )
			AddText(sceneId,strText);
			IsKillOK=1
		elseif objdataId==needkilled_3 then
			killednumber_3 = killednumber_3+1
			strText = format("已杀死叛军首领%d/1", killednumber_3 )
			AddText(sceneId,strText);
			IsKillOK=1
		end
		EndEvent(sceneId)

		if IsKillOK==1 then
			for i=0,num-1 do
				humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取得当前场景里人的objId
				DispatchMissionTips(sceneId,humanObjId)
			end
			
			LuaFnSetCopySceneData_Param(sceneId, 6, killednumber_1);--设置杀死的叛军的数量
			LuaFnSetCopySceneData_Param(sceneId, 7, killednumber_2);--设置杀死的叛军的数量
			LuaFnSetCopySceneData_Param(sceneId, 8, killednumber_3);--设置杀死的叛军的数量
		end
	end
	
	killednumber = killednumber_1+killednumber_2+killednumber_3
	if killednumber>=20 and IsKillOK==1 then
	
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取得当前场景里人的objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x311004_g_MissionId)--取得任务数据索引值

			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,1,1)--设置任务数据

			BeginEvent(sceneId)
				strText = format("任务完成，将在%d秒后传送到入口位置", x311004_g_CloseTick*x311004_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x311004_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x311004_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x311004_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x311004_g_MissionId)
		
		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex(sceneId,mems[i],misIndex,2,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x311004_g_Fuben_X, x311004_g_Fuben_Z) ;
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x311004_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x311004_g_Fuben_X, x311004_g_Fuben_Z );
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x311004_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x311004_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x311004_g_CloseTick then --倒计时间到，大家都出去吧
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
			
			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
			end
			
		elseif leaveTickCount<x311004_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
	  			BeginEvent(sceneId)
	  				strText = format("你将在%d秒后离开场景!", (x311004_g_CloseTick-leaveTickCount)*x311004_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
			end
		end
	elseif TickCount == x311004_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x311004_g_MissionId );--任务失败,删除之

  			BeginEvent(sceneId)
  				AddText(sceneId,"任务失败，超时!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	else 
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if IsHaveMission(sceneId,mems[i],x311004_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 12) ; --取得保存的队伍号
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x311004_g_MissionId );--任务失败,删除之

  					BeginEvent(sceneId)
  						AddText(sceneId,"任务失败，你不在正确的队伍中!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  					
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, 127, 28 )
  				end
  			end
		end
		
	end
end

