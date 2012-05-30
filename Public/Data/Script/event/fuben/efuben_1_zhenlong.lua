--副本任务
--珍珑棋局

--************************************************************************
--MisDescBegin

--脚本号
x401000_g_ScriptId = 401000

--副本名称
x401000_g_CopySceneName="珍珑棋局"

--任务号
x401000_g_MissionId = 1053

--目标NPC
x401000_g_Name = "珍珑"

--是否是精英任务
x401000_g_IfMissionElite = 1

--任务归类
x401000_g_MissionKind = 1

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_LINGLONG_HUAN
x401000_g_MissionRound = 13
--**********************************以上是动态****************************

--任务文本描述
x401000_g_MissionName="珍珑棋局"
x401000_g_MissionInfo="杀死全部怪物，一个不留！"  --任务描述
x401000_g_MissionTarget="杀死全部怪物"	--任务目标
x401000_g_ContinueInfo="你要继续努力啊！"	--未完成任务的npc对话
x401000_g_MissionComplete="谢谢啊，俺们终于敢出门了"	--完成任务npc说话的话


--任务奖励
x401000_g_MoneyBonus=7777

--MisDescEnd
--************************************************************************

--角色Mission变量说明
x401000_g_Param_huan		=0	--0号：已经完成的环数，在接收任务时候赋值
x401000_g_Param_ok			=1	--1号：当前任务是否完成(0未完成；1完成)
x401000_g_Param_sceneid		=2	--2号：当前副本任务的场景号
x401000_g_Param_teamid		=3	--3号：接副本任务时候的队伍号
x401000_g_Param_killcount	=4	--4号：杀死任务怪的数量
x401000_g_Param_time		=5	--5号：完成副本所用时间(单位：秒)
--6号：未用
--7号：未用

x401000_g_CopySceneType=FUBEN_EXAMPLE	--副本类型，定义在ScriptGlobal.lua里面
x401000_g_LimitMembers=1			--可以进副本的最小队伍人数
x401000_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x401000_g_LimitTotalHoldTime=360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x401000_g_LimitTimeSuccess=500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x401000_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x401000_g_NoUserTime=300			--副本中没有人后可以继续保存的时间（单位：秒）
x401000_g_DeadTrans=1				--死亡转移模式，0：死亡后还可以继续在副本，1：死亡后被强制移出副本
x401000_g_Fuben_X=64				--进入副本的位置X
x401000_g_Fuben_Z=64				--进入副本的位置Z
x401000_g_Back_X=234				--源场景位置X
x401000_g_Back_Z=69					--源场景位置Z
x401000_g_TotalNeedKill=10			--需要杀死怪物数量

x401000_g_StartTick=5 --开始出怪的时间
x401000_g_A_B=7000	--由不可攻击状态变成可攻击状态的时间(单位：毫秒)
x401000_g_B_C=15000	--由可攻击状态变成人形怪物的时间(单位：毫秒)
x401000_g_MoTypeCount=9 --怪物组数量
x401000_g_Black_A={559,559,559,559,559,559,559,559,559}
x401000_g_Black_B={865,866,867,868,869,870,871,872,873}
x401000_g_Black_C={883,884,885,886,887,888,889,890,891}
x401000_g_White_A={558,558,558,558,558,558,558,558,558}
x401000_g_White_B={874,875,876,877,878,879,880,881,882}
x401000_g_White_C={892,893,894,895,896,897,898,899,900}
x401000_g_LastBoss={3010,3020,3040,3050,3070,3080,3100,3110,3140}
x401000_g_mListCount=1 --可以用于选择的棋谱数量
x401000_g_mListSize=100 --每个棋谱拥有的步数
--棋谱数据
x401000_g_mList1=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x401000_g_mList2=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x401000_g_mList3=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x401000_g_mList4=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}
x401000_g_mList5=	{288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,127}

--**********************************
--任务入口函数
--**********************************
function x401000_OnDefaultEvent( sceneId, selfId, targetId )
	if( IsHaveMission(sceneId,selfId,x401000_g_MissionId) > 0)  then	--如果玩家已经接了这个任务
		misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)
		bDone = x401000_CheckSubmit( sceneId, selfId )
		if bDone==0 then						--任务未完成
			BeginEvent(sceneId)
				AddText(sceneId,x401000_g_MissionName)
				AddText(sceneId,"准备好了吗！")
			EndEvent( )
			DispatchMissionInfo(sceneId,selfId,targetId,x401000_g_ScriptId,x401000_g_MissionId)
		elseif bDone==1 then					--任务已经完成
			BeginEvent(sceneId)
				AddText(sceneId,x401000_g_MissionName)
				AddText(sceneId,x401000_g_MissionComplete)
				AddText(sceneId,"你将得到：")
				AddMoneyBonus(sceneId,x401000_g_MoneyBonus)
			EndEvent( )
			DispatchMissionDemandInfo(sceneId,selfId,targetId,x401000_g_ScriptId,x401000_g_MissionId,bDone)
		end
    elseif x401000_CheckAccept(sceneId,selfId) > 0 then		--没有任务，满足任务接收条件
		--发送任务接受时显示的信息
		BeginEvent(sceneId)
			AddText(sceneId,x401000_g_MissionName)
			AddText(sceneId,x401000_g_MissionInfo)
			AddText(sceneId,"任务目标：")
			AddText(sceneId,x401000_g_MissionTarget)
			AddText(sceneId,"你将得到：")
			AddMoneyBonus(sceneId,x401000_g_MoneyBonus)
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x401000_g_ScriptId,x401000_g_MissionId)
    end
end

--**********************************
--列举事件
--**********************************
function x401000_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务
	if IsHaveMission(sceneId,selfId,x401000_g_MissionId) > 0 then
		AddNumText(sceneId, x401000_g_ScriptId,x401000_g_MissionName,3,-1)
	--满足任务接收条件
    elseif x401000_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId,x401000_g_ScriptId,x401000_g_MissionName,4,-1);
    end
end

--**********************************
--检测接受条件
--**********************************
function x401000_CheckTeamLeader( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断是否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"你需要加入一支队伍。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
	
	if	nearteammembercount<x401000_g_LimitMembers	then
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
function x401000_CheckAccept( sceneId, selfId )
	if	GetTeamId( sceneId, selfId)<0	then	--判断是否有队伍
		BeginEvent(sceneId)
	  		AddText(sceneId,"你需要加入一支队伍。");
	  	EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return	0
	end
	
	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 

	if	nearteammembercount<x401000_g_LimitMembers	then
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
		elseif IsHaveMission(sceneId,mems[i],x401000_g_MissionId)>0 then
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
function x401000_OnAccept( sceneId, selfId )
	
	local teamid = GetTeamId( sceneId, selfId)
	
	if( IsHaveMission(sceneId,selfId,x401000_g_MissionId) > 0)  then	--已经有任务的
		misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)
		copysceneid = GetMissionParam( sceneId, selfId, misIndex, x401000_g_Param_sceneid)
		saveteamid = GetMissionParam( sceneId, selfId, misIndex, x401000_g_Param_teamid)
		
		if copysceneid>=0 and teamid==saveteamid then --进过副本
			--将自己传送到副本场景
			NewWorld( sceneId, selfId, copysceneid, x401000_g_Fuben_X, x401000_g_Fuben_Z) ;
		else
			BeginEvent(sceneId)
				AddText(sceneId,"条件不符！");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	else
		--加入任务到玩家列表
		if x401000_CheckAccept(sceneId,selfId) <= 0 then	--判断接收条件
			return 0
		end

		--取得玩家附近的队友数量（包括自己）
		local	nearteammembercount = GetNearTeamCount( sceneId, selfId) 
		local mems = {}
		for	i=0,nearteammembercount-1 do
			mems[i] = GetNearTeamMember(sceneId, selfId, i)
			--给每个队伍成员加入任务
			AddMission( sceneId, mems[i], x401000_g_MissionId, x401000_g_ScriptId, 1, 0, 0 )
			
			misIndex = GetMissionIndexByID( sceneId, mems[i], x401000_g_MissionId )
			
			local huan = GetMissionData(sceneId,selfId,x401000_g_MissionRound)
			
			--将任务的第0号数据设置为已经完成的
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_huan,huan)
			
			--将任务的第1号数据设置为0,表示未完成的任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_ok,0)
			
			--将任务的第2号数据设置为-1, 用于保存副本的场景号
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_sceneid,-1)

			--将任务的第3号数据队伍号
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_teamid,teamid)
		end
		
		x401000_MakeCopyScene( sceneId, selfId, nearteammembercount ) ;
	end
end

--**********************************
--放弃
--**********************************
function x401000_OnAbandon( sceneId, selfId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x401000_g_Param_sceneid)
	
	--删除玩家任务列表中对应的任务
    DelMission( sceneId, selfId, x401000_g_MissionId )
	
	if sceneId==copyscene then --如果在副本里删除任务，则直接传送回
		BeginEvent(sceneId)
			AddText(sceneId,"任务失败！");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		
		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
		
		NewWorld( sceneId, selfId, oldsceneId, x401000_g_Back_X, x401000_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x401000_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	mylevel = 0 
	for	i=0,nearmembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, selfId, i)
		mylevel = mylevel+GetLevel(sceneId,mems[i])
	end
	mylevel = mylevel/nearmembercount
	
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)
	LuaFnSetSceneLoad_Map(sceneId, "zhenlong.nav"); --地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid);
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x401000_g_NoUserTime*1000);
	LuaFnSetCopySceneData_Timer(sceneId, x401000_g_TickTime*1000);
	LuaFnSetCopySceneData_Param(sceneId, 0, x401000_g_CopySceneType);--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param(sceneId, 1, x401000_g_ScriptId);--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param(sceneId, 2, 0);--设置定时器调用次数
	LuaFnSetCopySceneData_Param(sceneId, 3, -1);--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param(sceneId, 4, 0);--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param(sceneId, 5, 0);--设置离开倒计时次数
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId)); --保存队伍号
	LuaFnSetCopySceneData_Param(sceneId, 7, 0) ;--杀死怪的数量
	LuaFnSetCopySceneData_Param(sceneId, 8, random(1,x401000_g_mListCount)) ;--选用的棋谱
	LuaFnSetCopySceneData_Param(sceneId, 9, 0) ;--已经下了的步数

	
	if	mylevel<=10	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 1) ;--记录所产生的怪物组
	elseif	mylevel<=15	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 2) ;--记录所产生的怪物组
	elseif	mylevel<=20	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 3) ;--记录所产生的怪物组
	elseif	mylevel<=25	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 4) ;--记录所产生的怪物组
	elseif	mylevel<=30	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 5) ;--记录所产生的怪物组
	elseif	mylevel<=35	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 6) ;--记录所产生的怪物组
	elseif	mylevel<=40	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 7) ;--记录所产生的怪物组
	elseif	mylevel<=45	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 8) ;--记录所产生的怪物组
	elseif	mylevel<=50	 then
		LuaFnSetCopySceneData_Param(sceneId,10, 9) ;--记录所产生的怪物组
	end	
	

	local bRetSceneID = LuaFnCreateCopyScene(sceneId); --初始化完成后调用创建副本函数
	BeginEvent(sceneId)
		if bRetSceneID>0 then
			AddText(sceneId,"副本创建成功！");
		else
			AddText(sceneId,"副本数量已达上限，请稍候再试！");
			--删除玩家任务列表中对应的任务
			DelMission( sceneId, selfId, x401000_g_MissionId )
		end
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

--**********************************
--继续
--**********************************
function x401000_OnContinue( sceneId, selfId, targetId )

	misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401000_g_Param_sceneid)>=1	then
		DispatchMissionContinueInfo(sceneId, selfId, targetId, x401000_g_ScriptId, x401000_g_MissionId)
	end

end

--**********************************
--检测是否可以提交
--**********************************
function x401000_CheckSubmit( sceneId, selfId )
	local bRet = CallScriptFunction( SCENE_SCRIPT_ID, "CheckSubmit", sceneId, selfId, x401000_g_MissionId )
	if bRet ~= 1 then
		return 0
	end

--判断任务是否已经完成
	misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)
	if	GetMissionParam( sceneId, selfId, misIndex, x401000_g_Param_ok)>=1 then 
		return	1
	else
		return	0
	end
end

--**********************************
--提交
--**********************************
function x401000_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x401000_CheckSubmit( sceneId, selfId, selectRadioId )>0 then		--已经完成任务了
	
		local	iHuan=GetMissionData(sceneId,selfId,MD_LINGLONG_HUAN)	--取得总共做过的环数
		iHuan=iHuan+1
		local iDayCount=GetMissionData(sceneId,selfId,MD_LINGLONG_DAYCOUNT)
		local iDayTime = mod(iDayCount,100000)	--上一次交任务的时间
		local iDayHuan = floor(iDayCount/100000) --当天内完成的任务环数
		
		local CurDaytime = GetDayTime()
		
		if CurDaytime==iDayTime then --上次完成任务是同一天内
			iDayHuan = iDayHuan+1
		else
			iDayTime = CurDaytime
			iDayHuan = 1
		end
		iDayCount = iDayHuan*100000+iDayTime
		
		--添加任务奖励
		money = 100*iDayHuan
		AddMoney(sceneId,selfId,money );
		
		--设置循环任务的环数
		SetMissionData(sceneId,selfId,MD_LINGLONG_HUAN,iHuan)
		SetMissionData(sceneId,selfId,MD_LINGLONG_DAYCOUNT,iDayCount)
		
		BeginEvent(sceneId)
			strText_M = format("你得到%d金钱",money)
	  		strText = format("任务完成，当前为第%d环",iDayHuan)
	  		AddText(sceneId,strText);
	  		AddText(sceneId,strText_M);
	  	EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	  	
		--设置任务已经被完成过
		DelMission( sceneId,selfId,  x401000_g_MissionId )
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x401000_OnKillObject( sceneId, selfId, objdataId ,objId )
	
	--是否是副本
	sceneType = LuaFnGetSceneType(sceneId) ;
	if sceneType~=1 then
		return
	end 
	--是否是所需要的副本
	fubentype = LuaFnGetCopySceneData_Param(sceneId,0)
	if fubentype~=x401000_g_CopySceneType then
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
	
	if killednumber<x401000_g_TotalNeedKill then

		BeginEvent(sceneId)
			strText = format("已杀 %d/%d", killednumber, x401000_g_TotalNeedKill )
			AddText(sceneId,strText);
		EndEvent(sceneId)

		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)--取得当前场景里人的objId
			DispatchMissionTips(sceneId,humanObjId)

			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401000_g_MissionId) --取得任务数据索引值
			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401000_g_Param_killcount) --取得已经杀了的怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401000_g_Param_killcount,killedcount) --设置任务数据
		end
	elseif killednumber>=x401000_g_TotalNeedKill then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1)
		
		--取得已经执行的定时次数
		TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;
		
		for i=0,num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId(sceneId,i)	--取得当前场景里人的objId
			misIndex = GetMissionIndexByID(sceneId,humanObjId,x401000_g_MissionId)--取得任务数据索引值

			local killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x401000_g_Param_killcount) --取得已经杀了的怪物数
			killedcount = killedcount +1 ;
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401000_g_Param_killcount,killedcount) --设置任务数据
			
			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401000_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,humanObjId,misIndex,x401000_g_Param_time,TickCount*x401000_g_TickTime)--设置任务数据

			BeginEvent(sceneId)
				strText = format("任务完成，将在%d秒后传送到入口位置", x401000_g_CloseTick*x401000_g_TickTime )
				AddText(sceneId,strText);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,humanObjId)
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x401000_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x401000_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x401000_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId);--设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId) ;	
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid);

	--取得玩家附近的队友数量（包括自己）
	local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
	local mems = {}
	for	i=0,nearteammembercount-1 do
		mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
		misIndex = GetMissionIndexByID(sceneId,mems[i],x401000_g_MissionId)
		
		--将任务的第2号数据设置为副本的场景号
		SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_sceneid,destsceneId)
				
		NewWorld( sceneId, mems[i], destsceneId, x401000_g_Fuben_X, x401000_g_Fuben_Z) ;
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x401000_OnPlayerEnter( sceneId, selfId )
	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x401000_g_Fuben_X, x401000_g_Fuben_Z );
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x401000_OnHumanDie( sceneId, selfId, killerId )
	if x401000_g_DeadTrans==1 then --死亡后需要被强制踢出场景
	
		misIndex = GetMissionIndexByID(sceneId,selfId,x401000_g_MissionId)--取得任务数据索引值
		
		--将任务的第1号数据设置为1,表示完成的任务
		SetMissionByIndex(sceneId,selfId,misIndex,x401000_g_Param_ok,1)--设置任务数据
		local TickCount = LuaFnGetCopySceneData_Param(sceneId, 2) ;--取得已经执行的定时次数
		--完成副本所用时间
		SetMissionByIndex(sceneId,selfId,misIndex,x401000_g_Param_time,TickCount*x401000_g_TickTime)--设置任务数据

		oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x401000_g_Back_X, x401000_g_Back_Z )
	end
end

--**********************************
--副本场景定时器事件
--**********************************
function x401000_OnCopySceneTimer( sceneId, nowTime )
	
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
		
		if leaveTickCount == x401000_g_CloseTick then --倒计时间到，大家都出去吧
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
			
			--将当前副本场景里的所有人传送回原来进入时候的场景
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				NewWorld( sceneId, mems[i], oldsceneId, x401000_g_Back_X, x401000_g_Back_Z )
			end
			
		elseif leaveTickCount<x401000_g_CloseTick then
		
			oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号

			--通知当前副本场景里的所有人，场景关闭倒计时间
			local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
			local mems = {}
			for	i=0,membercount-1 do
				mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
				if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
	  			BeginEvent(sceneId)
	  				strText = format("你将在%d秒后离开场景!", (x401000_g_CloseTick-leaveTickCount)*x401000_g_TickTime )
	  				AddText(sceneId,strText);
	  			EndEvent(sceneId)
	  			DispatchMissionTips(sceneId,mems[i])
	  		end
			end
		end
	elseif TickCount == x401000_g_LimitTimeSuccess then
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
  			
			misIndex = GetMissionIndexByID(sceneId,mems[i],x401000_g_MissionId)--取得任务数据索引值
			--将任务的第1号数据设置为1,表示完成的任务
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_ok,1)--设置任务数据
			--完成副本所用时间
			SetMissionByIndex(sceneId,mems[i],misIndex,x401000_g_Param_time,TickCount*x401000_g_TickTime)--设置任务数据
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	elseif TickCount == x401000_g_LimitTotalHoldTime then --副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			DelMission( sceneId, mems[i], x401000_g_MissionId );--任务失败,删除之
			if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  			BeginEvent(sceneId)
  				AddText(sceneId,"任务失败，超时!");
  			EndEvent(sceneId)
  			DispatchMissionTips(sceneId,mems[i])
  		end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param(sceneId, 4, 1) ;
		
	else 
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
		local mems = {}
		for	i=0,membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if IsHaveMission(sceneId,mems[i],x401000_g_MissionId) > 0 then
				oldteamid = LuaFnGetCopySceneData_Param(sceneId, 6) ; --取得保存的队伍号
				if oldteamid ~= GetTeamId(sceneId,mems[i]) then
				
					DelMission( sceneId, mems[i], x401000_g_MissionId );--任务失败,删除之
					if LuaFnIsObjValid(sceneId, mems[i]) == 1 and LuaFnIsCanDoScriptLogic(sceneId, mems[i]) == 1 then
  					BeginEvent(sceneId)
  						AddText(sceneId,"任务失败，你不在正确的队伍中!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
  				end	
 					oldsceneId = LuaFnGetCopySceneData_Param(sceneId, 3) ;--取得副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, x401000_g_Back_X, x401000_g_Back_Z )
  				end
  			end
		end
		
		--怪物控制逻辑
		if TickCount>=x401000_g_StartTick and membercount>0 then --时间到，开始出怪
		
			mgroup = LuaFnGetCopySceneData_Param(sceneId,10) ;--记录所产生的怪物组
			if mgroup > x401000_g_MoTypeCount then
				print( "Error! " )
				mgroup = 1
			end
		
			--变化怪物
			local monsterobjid = -1
			monstercount = GetMonsterCount(sceneId)
			for i=0, monstercount-1 do
				monsterobjid = GetMonsterObjID(sceneId,i)
				if LuaFnIsCharacterLiving(sceneId, monsterobjid)>0 then --活的怪物
					monstertype = GetMonsterDataID(sceneId, monsterobjid) --怪物类型
					mcreatetime = GetObjCreateTime(sceneId, monsterobjid) --怪物创建时间
					local PosX,PosZ=LuaFnGetWorldPos(sceneId, monsterobjid)
					PosX=floor(PosX)
					PosZ=floor(PosZ)
					
					if monstertype==x401000_g_Black_A[mgroup] then
						if nowTime>=mcreatetime+x401000_g_A_B then --需要将怪物变成B状态了
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x401000_g_Black_B[mgroup],PosX,PosZ,7,0,-1)
						end
					elseif monstertype==x401000_g_Black_B[mgroup] then
						if nowTime>=mcreatetime+x401000_g_A_B+x401000_g_B_C then --需要将怪物变成C状态了
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x401000_g_Black_C[mgroup],PosX,PosZ,5,0,-1)
						end
					elseif monstertype==x401000_g_White_A[mgroup] then
						if nowTime>=mcreatetime+x401000_g_A_B then --需要将怪物变成B状态了
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x401000_g_White_B[mgroup],PosX,PosZ,7,0,-1)
						end
					elseif monstertype==x401000_g_White_B[mgroup] then
						if nowTime>=mcreatetime+x401000_g_A_B+x401000_g_B_C then --需要将怪物变成C状态了
							LuaFnDeleteMonster(sceneId, monsterobjid)
							LuaFnCreateMonster(sceneId,x401000_g_White_C[mgroup],PosX,PosZ,5,0,-1)
						end
					else
					end
				else
				end
			end
		
			if TickCount==x401000_g_StartTick then
				local membercount = LuaFnGetCopyScene_HumanCount(sceneId)
				local mems = {}
				for	i=0,membercount-1 do
					mems[i] = LuaFnGetCopyScene_HumanObjId(sceneId,i)
  					BeginEvent(sceneId)
  						AddText(sceneId,"战斗开始了!");
  					EndEvent(sceneId)
  					DispatchMissionTips(sceneId,mems[i])
				end
			end
			
			QiPu = LuaFnGetCopySceneData_Param(sceneId, 8) ;--取得棋谱
			PressStep = LuaFnGetCopySceneData_Param(sceneId, 9) ;--取得已经下了的步数
			if PressStep<x401000_g_mListSize then
				PressStep = PressStep+1 ;
				local QiPuValue = 0 
				if QiPu==1 then
					QiPuValue = x401000_g_mList1[PressStep]
				elseif QiPu==2 then
					QiPuValue = x401000_g_mList2[PressStep]
				elseif QiPu==3 then
					QiPuValue = x401000_g_mList3[PressStep]
				elseif QiPu==4 then
					QiPuValue = x401000_g_mList4[PressStep]
				else
					QiPuValue = x401000_g_mList5[PressStep]
				end
				
				--根据棋谱生成怪物
				local xPos,zPos=x401000_IndexToPos(QiPuValue)
				MonsterType = mod(PressStep,2)
				mobjid = 0
				if PressStep==x401000_g_mListSize then --最后一个刷的特殊怪物
					mobjid = LuaFnCreateMonster(sceneId,x401000_g_LastBoss[mgroup],xPos,zPos,3,0,-1)
				else
					if MonsterType==0 then
						mobjid = LuaFnCreateMonster(sceneId,x401000_g_Black_A[mgroup],xPos,zPos,3,0,-1)
					else
						mobjid = LuaFnCreateMonster(sceneId,x401000_g_White_A[mgroup],xPos,zPos,3,0,-1)
					end
				end
				--print(QiPu,PressStep,QiPuValue,MonsterType,mobjid)
				
				LuaFnSetCopySceneData_Param(sceneId, 9, PressStep);--设置新的定时器调用次数
			end				
		end
	end
end

function x401000_GetDisplayPos( x, z )
	return x*3+36+1,z*3+36+1
end

function x401000_IndexToPos( index )
	xP = floor(index/19)
	zP = mod(index,19)
	return xP*3+36+1,zP*3+36+1
end
