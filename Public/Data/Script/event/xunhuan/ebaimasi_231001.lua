--副本任务
--珍珑棋局

--************************************************************************
--MisDescBegin

--脚本号
x231001_g_ScriptId = 231001

--副本名称
x231001_g_CopySceneName="珍珑棋局"

--任务号
x231001_g_MissionId = 4013

--上一个任务的ID
x231001_g_MissionIdPre = 4011

--目标NPC
x231001_g_Name = "王积薪"

--是否是精英任务
x231001_g_IfMissionElite = 1

--任务等级
x231001_g_MissionLevel = 10000

--任务归类
x231001_g_MissionKind = 1

--任务文本描述
x231001_g_MissionName="珍珑棋局"
x231001_g_MissionInfo="杀死棋盘上所有的108枚棋子，将王积薪从珍珑棋局的控制中解救出来。"  --任务描述
x231001_g_MissionTarget="杀死108枚棋子。"	--任务目标
x231001_g_ContinueInfo="你已经杀死108枚棋子了吗？"	--未完成任务的npc对话
x231001_g_MissionComplete="谢谢啊，我终于从无胜负的棋局中解脱出来了。"	--完成任务npc说话的话

--任务奖励
x231001_g_MoneyBonus=5000

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_LINGLONG_HUAN
--任务是否已经完成
--MissionRound =
--**********************************以上是动态****************************
--角色Mission变量说明
x231001_g_IsMissionOkFail	= 0	--0号：当前任务是否完成(0未完成；1完成)
x231001_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
--x231001_g_DemandKill		= { {id=700,num=108} }
x231001_g_Custom					= { {id="已杀死：#r棋子",num=108} }
x231001_g_Param_killcount	=	1	--1号：杀死任务怪的数量
x231001_g_Param_sceneid		= 2	--2号：当前副本任务的场景号
x231001_g_Param_teamid		= 3	--3号：接副本任务时候的队伍号
x231001_g_Param_time			= 4	--4号：完成副本所用时间(单位：秒)
--6号：具体副本事件脚本占用
--7号：具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x231001_g_CopySceneType=FUBEN_ZHENGLONG	--副本类型，定义在ScriptGlobal.lua里面
x231001_g_LimitMembers=1			--可以进副本的最小队伍人数
x231001_g_TickTime=5				--回调脚本的时钟时间（单位：秒/次）
x231001_g_LimitTotalHoldTime=360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x231001_g_LimitTimeSuccess=500		--副本时间限制（单位：次数），如果此时间到了，任务完成
x231001_g_CloseTick=6				--副本关闭前倒计时（单位：次数）
x231001_g_NoUserTime=300			--副本中没有人后可以继续保存的时间（单位：秒）
x231001_g_Fuben_X=40				--进入副本的位置X
x231001_g_Fuben_Z=45				--进入副本的位置Z
x231001_g_Relive_X=68				--副本复活的位置X
x231001_g_Relive_Z=90				--副本复活的位置Z
x231001_g_Back_X=268				--源场景位置X
x231001_g_Back_Z=87					--源场景位置Z
x231001_g_TotalNeedKill=108		--需要杀死怪物数量

x231001_g_StartTick=36 --开始出怪的时间
x231001_g_A_B=7000	--由不可攻击状态变成可攻击状态的时间(单位：毫秒)
x231001_g_B_C=15000	--由可攻击状态变成人形怪物的时间(单位：毫秒)
x231001_g_MoTypeCount=9 --怪物组数量
x231001_g_Black_A={701,701,701,701,701,701,701,701,701}
x231001_g_Black_B={1780,1781,1782,1783,1784,1785,1786,1787,1788}
x231001_g_Black_C={1800,1801,1802,1803,1804,1805,1806,1807,1808}
x231001_g_White_A={700,700,700,700,700,700,700,700,700}
x231001_g_White_B={1770,1771,1772,1773,1774,1775,1776,1777,1778}
x231001_g_White_C={1790,1791,1792,1793,1794,1795,1796,1797,1798}
x231001_g_LastBoss={1850,1851,1852,1853,1854,1855,1856,1857,1858}
x231001_g_mListCount=1 --可以用于选择的棋谱数量
x231001_g_mListSize=100 --每个棋谱拥有的步数
--棋谱数据
x231001_g_mList = {}
x231001_g_mList[1]= {288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,180}
x231001_g_mList[2]= {288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,180}
x231001_g_mList[3]= {288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,180}
x231001_g_mList[4]= {288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,180}
x231001_g_mList[5]= {288,72,301,60,111,70,167,318,316,280,262,296,319,315,337,317,309,173,43,45,40,59,41,61,24,62,230,44,58,77,39,128,129,147,148,92,93,74,91,73,336,335,279,297,261,312,105,90,103,67,65,83,102,123,104,101,140,120,64,63,161,144,184,287,306,249,250,269,270,268,212,307,289,305,325,324,326,229,210,248,192,174,87,47,108,109,145,259,343,285,182,172,157,137,76,96,112,126,146,180}

--**********************************
--任务入口函数
--**********************************
function x231001_OnDefaultEvent( sceneId, selfId, targetId )

	if GetName( sceneId, targetId ) ~= x231001_g_Name then						--判断该npc是否是对应任务的npc
		return
	end

	if IsHaveMission( sceneId, selfId, x231001_g_MissionId ) > 0 then			--如果玩家已经接了这个任务
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionId )
		local bDone = x231001_CheckSubmit( sceneId, selfId )
		if bDone == 0 then												--任务未完成
			BeginEvent( sceneId )
				AddText( sceneId, x231001_g_MissionName )
				AddText( sceneId, "准备好了吗！" )
			EndEvent( )
			DispatchMissionInfo( sceneId, selfId, targetId, x231001_g_ScriptId, x231001_g_MissionId )
		elseif bDone == 1 then											--任务已经完成
			BeginEvent( sceneId )
				AddText( sceneId, x231001_g_MissionName )
				AddText( sceneId, x231001_g_ContinueInfo )
				AddMoneyBonus( sceneId, x231001_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x231001_g_ScriptId, x231001_g_MissionId, bDone )
		end
--elseif x231001_CheckAccept( sceneId, selfId ) > 0 then						--没有任务，满足任务接收条件
	else
		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x231001_g_MissionName )
			AddText( sceneId, x231001_g_MissionInfo )
			AddText( sceneId, "任务目标：" )
			AddText( sceneId, x231001_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x231001_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x231001_g_ScriptId, x231001_g_MissionId )
	end
end

--**********************************
--列举事件
--**********************************
function x231001_OnEnumerate( sceneId, selfId, targetId )
	--如果已接此任务或者满足任务接收条件
--if IsHaveMission( sceneId, selfId, x231001_g_MissionId ) > 0 or x231001_CheckAccept( sceneId, selfId ) > 0 then
	if IsHaveMission( sceneId, selfId, x231001_g_MissionIdPre ) == 0 then
		x231001_MsgBox( sceneId, selfId, targetId, "  白马寺的智清大师在等你！" )
		return
	else
		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x231001_g_MissionIdPre )
		if GetMissionParam( sceneId, selfId, misIndex, x231001_g_IsMissionOkFail ) == 1 then
			x231001_MsgBox( sceneId, selfId, targetId, "  你可以回白马寺找智清大师领取奖励了！" )
			return
		end
	end

	AddNumText( sceneId, x231001_g_ScriptId, x231001_g_MissionName,4,-1 )
end

--**********************************
--检测接受条件
--**********************************
function x231001_CheckAccept( sceneId, selfId )
	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x231001_NotifyFailTips( sceneId, selfId, "你需要加入一支队伍。" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x231001_NotifyFailTips( sceneId, selfId, "你不是队长。" )
		return 0
	end

	--取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x231001_NotifyFailTips( sceneId, selfId, "你有队员不在旁边。" )
		return 0
	end

	if nearteammembercount < x231001_g_LimitMembers then
		x231001_NotifyFailTips( sceneId, selfId, "你的队伍人数不足。" )
		return 0
	end


	--检测小队中是否有人任务记录已满, 队友是否已经接过此任务
	local member
	local i
	local misIndex

	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x231001_g_MissionIdPre ) <= 0 then
			x231001_NotifyFailTips( sceneId, selfId, "队伍中有人没有接白马寺任务。" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x231001_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 7 ) ~= 1 then
			x231001_NotifyFailTips( sceneId, selfId, "队伍中有人接了别的白马寺任务。" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x231001_g_IsMissionOkFail ) == 1 then
			x231001_NotifyFailTips( sceneId, selfId, "队伍中有人已经完成了这个任务。" )
			return 0
		end

		if GetMissionCount( sceneId, member ) >= 20 then						--队友身上任务数量是否达到上限20个
			x231001_NotifyFailTips( sceneId, selfId, "队伍中有人的任务记录已满。" )
			return 0
		end

		if IsHaveMission( sceneId, member, x231001_g_MissionId ) > 0 then
			--队友是否已经接过此任务或者另外一个任务
			x231001_NotifyFailTips( sceneId, selfId, "队伍中有人已经接了此任务。" )
			return 0
		end
	end

	return 1
end

--**********************************
--接受
--**********************************
function x231001_OnAccept( sceneId, selfId )

	local teamid = GetTeamId( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x231001_g_MissionId ) > 0 then					--已经有任务的
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_teamid )

		if copysceneid >= 0 and teamid == saveteamid then						--进过副本
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x231001_g_Fuben_X, x231001_g_Fuben_Z )
			else
				x231001_NotifyFailTips( sceneId, selfId, "任务失败，请放弃重新接取" )
				SetMissionByIndex( sceneId, selfId, misIndex, x231001_g_IsMissionOkFail, 2 )
			end

			return
		end
	end

	--加入任务到玩家列表
	if x231001_CheckAccept( sceneId, selfId ) == 0 then									--判断接收条件
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--给每个队伍成员加入任务
		AddMission( sceneId, member, x231001_g_MissionId, x231001_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x231001_g_MissionId )

		SetMissionByIndex( sceneId, member, misIndex, x231001_g_IsMissionOkFail, 0 )	--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, member, misIndex, x231001_g_Param_sceneid, -1 )		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		SetMissionByIndex( sceneId, member, misIndex, x231001_g_Param_teamid, teamid )	--将任务的第3号数据队伍号
	end

	x231001_MakeCopyScene( sceneId, selfId, nearteammembercount )
end

--**********************************
--放弃
--**********************************
function x231001_OnAbandon( sceneId, selfId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x231001_g_MissionId )

	if sceneId == copyscene then										--如果在副本里删除任务，则直接传送回
		x231001_NotifyFailTips( sceneId, selfId, "任务失败！" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
	end
end

--**********************************
--创建副本
--**********************************
function x231001_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

	for	i=0, nearmembercount-1 do
		mems[i] = GetNearTeamMember( sceneId, selfId, i )
		mylevel = mylevel + GetLevel( sceneId, mems[i] )
	end

	mylevel = mylevel/nearmembercount

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, "zhenlong.nav" )						--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x231001_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x231001_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x231001_g_CopySceneType )				--设置副本数据，这里将0号索引的数据设置为999，用于表示副本号999(数字自定义)
	LuaFnSetCopySceneData_Param( sceneId, 1, x231001_g_ScriptId )					--将1号数据设置为副本场景事件脚本号
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--设置定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--设置副本入口场景号, 初始化
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--设置副本关闭标志, 0开放，1关闭
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--设置离开倒计时次数
	LuaFnSetCopySceneData_Param( sceneId, 6, GetTeamId( sceneId, selfId ) )	--保存队伍号
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--杀死Boss的数量
	LuaFnSetCopySceneData_Param( sceneId, 8, random(1, x231001_g_mListCount) )		--选用的棋谱
	LuaFnSetCopySceneData_Param( sceneId, 9, 0 )							--已经下了的步数

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	LuaFnSetCopySceneData_Param( sceneId, 10, iniLevel / 10 )				--记录所产生的怪物组

	LuaFnSetSceneLoad_Monster( sceneId, "zhenlong_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x231001_NotifyFailTips( sceneId, selfId, "副本创建成功！" )
	else
		x231001_NotifyFailTips( sceneId, selfId, "副本数量已达上限，请稍候再试！" )

		--删除玩家任务列表中对应的任务
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x231001_g_MissionId )
		end
	end
end

--**********************************
--继续
--**********************************
function x231001_OnContinue( sceneId, selfId, targetId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x231001_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "恭喜，你将得到#{_MONEY"..x231001_g_MoneyBonus.."}的奖励！" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x231001_g_ScriptId, x231001_g_MissionId )
	end
end

--**********************************
--检测是否可以提交
--**********************************
function x231001_CheckSubmit( sceneId, selfId, selectRadioId )
	--判断任务是否已经完成
	local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionId )
	local	ret	= GetMissionParam( sceneId, selfId, misIndex, x231001_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--提交
--**********************************
function x231001_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if GetName( sceneId, targetId ) ~= x231001_g_Name then								--判断该npc是否是对应任务的npc
		return
	end

	if x231001_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then					--已经完成任务了
		--local iHuan = GetMissionData( sceneId, selfId, 10 )					--取得总共做过的环数
		--添加任务奖励
		local money = x231001_g_MoneyBonus
		AddMoney( sceneId, selfId, money )
		BeginEvent( sceneId )
			AddText( sceneId, x231001_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--设置任务已经被完成过
		DelMission( sceneId, selfId, x231001_g_MissionId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x231001_g_MissionIdPre )	--得到任务的序列号
		SetMissionByIndex( sceneId, selfId, misIndex, x231001_g_IsMissionOkFail, 1 )	--根据序列号把任务变量的第1位置1 (任务完成情况)
	end
end

--**********************************
--杀死怪物或玩家
--**********************************
function x231001_OnKillObject( sceneId, selfId, objdataId ,objId )

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x231001_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	if leaveFlag == 1 then														--如果副本已经被置成关闭状态，则杀怪无效
		return
	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	local killednumber = LuaFnGetCopySceneData_Param( sceneId, 7 )				--杀死怪的数量
	killednumber = killednumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killednumber )						--设置杀死Boss的数量

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killednumber < x231001_g_TotalNeedKill then

		local strText = format( "已杀死棋子： %d/%d", killednumber, x231001_g_TotalNeedKill )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--取得当前场景里人的objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--不在场景的不做此操作
				x231001_NotifyFailTips( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231001_g_MissionId )					--取得任务数据索引值
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231001_g_Param_killcount )	--取得已经杀了的怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231001_g_Param_killcount, killednumber )	--设置任务数据
			end
		end
	elseif killednumber >= x231001_g_TotalNeedKill then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--取得已经执行的定时次数
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "已杀死棋子： %d/%d", x231001_g_TotalNeedKill, x231001_g_TotalNeedKill )
		local strText2 = format( "任务完成，将在%d秒后传送到入口位置", x231001_g_CloseTick * x231001_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--取得当前场景里人的objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--不在场景的不做此操作
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x231001_g_MissionId)					--取得任务数据索引值

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x231001_g_Param_killcount )	--取得已经杀了的怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231001_g_Param_killcount, x231001_g_TotalNeedKill )	--设置任务数据

				--将任务的第1号数据设置为1,表示完成的任务
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231001_g_IsMissionOkFail, 1 )					--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, humanObjId, misIndex, x231001_g_Param_time, TickCount * x231001_g_TickTime )	--设置任务数据

				x231001_NotifyFailTips( sceneId, humanObjId, strText )
				x231001_NotifyFailTips( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x231001_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x231001_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x231001_OnCopySceneReady( sceneId, destsceneId )

	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )							--设置副本入口场景号
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then											-- 找不到该玩家
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then		-- 处于无法执行逻辑的状态
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, leaderObjId )

	if nearteammembercount < x231001_g_LimitMembers then
		x231001_NotifyFailTips( sceneId, leaderObjId, "你的队伍人数不足。" )
		return
	end

	local member
	local misIndex
	for	i=0, nearteammembercount-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态
			if IsHaveMission( sceneId, member, x231001_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x231001_g_MissionId )

				--将任务的第2号数据设置为副本的场景号
				SetMissionByIndex( sceneId, member, misIndex, x231001_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x231001_g_Fuben_X, x231001_g_Fuben_Z )
			else
				x231001_NotifyFailTips( sceneId, member, "你当前未接此任务" )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x231001_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x231001_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x231001_NotifyFailTips( sceneId, selfId, "你当前未接此任务" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
		return
	end

	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x231001_g_Relive_X, x231001_g_Relive_Z )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x231001_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x231001_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--取得已经执行的定时次数
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--设置新的定时器调用次数

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--需要离开
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x231001_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
				end
			end
		elseif leaveTickCount < x231001_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在%d秒后离开场景!", (x231001_g_CloseTick-leaveTickCount) * x231001_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x231001_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x231001_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x231001_NotifyFailTips( sceneId, mems[i], "任务时间到，完成!" )

				misIndex = GetMissionIndexByID( sceneId, mems[i], x231001_g_MissionId )		--取得任务数据索引值
				--将任务的第1号数据设置为1,表示完成的任务
				SetMissionByIndex( sceneId, mems[i], misIndex, x231001_g_IsMissionOkFail, 1 )		--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, mems[i], misIndex, x231001_g_Param_time, TickCount * x231001_g_TickTime )	--设置任务数据
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	elseif TickCount == x231001_g_LimitTotalHoldTime then									--副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x231001_g_MissionId )							--任务失败,删除之
				x231001_NotifyFailTips( sceneId, mems[i], "任务失败，超时!" )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )					--取得保存的队伍号
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x231001_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x231001_g_MissionId )						--任务失败,删除之
					x231001_NotifyFailTips( sceneId, mems[i], "任务失败，你不在正确的队伍中!" )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--取得副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, x231001_g_Back_X, x231001_g_Back_Z )
				end
			end
		end

		--怪物控制逻辑
		if TickCount >= x231001_g_StartTick and membercount > 0 then						--时间到，开始出怪
			local mgroup = LuaFnGetCopySceneData_Param( sceneId, 10 )				--记录所产生的怪物组
			if mgroup > x231001_g_MoTypeCount then
				--print( "Error! " )
				mgroup = 1
			end

			--变化怪物
			local monsterobjid = -1
			local monstercount = GetMonsterCount( sceneId )
			local monstertype
			local newMonsterType = -1
			local newAIType = -1
			local mcreatetime
			local PosX
			local PosZ
			local LevelGap = LuaFnGetCopySceneData_Param( sceneId, CopyScene_LevelGap )
			for i=0, monstercount-1 do
				monsterobjid = GetMonsterObjID( sceneId, i )
				if LuaFnIsCharacterLiving( sceneId, monsterobjid ) > 0 then			--活的怪物
					monstertype = GetMonsterDataID( sceneId, monsterobjid )			--怪物类型
					mcreatetime = GetObjCreateTime( sceneId, monsterobjid )			--怪物创建时间
					PosX, PosZ = LuaFnGetWorldPos( sceneId, monsterobjid )
					PosX = floor( PosX )
					PosZ = floor( PosZ )

					if monstertype == x231001_g_Black_A[mgroup] then
						if nowTime >= mcreatetime + x231001_g_A_B then						--需要将怪物变成B状态了
							newMonsterType = x231001_g_Black_B[mgroup]
							newAIType = 7
						end
					elseif monstertype == x231001_g_Black_B[mgroup] then
						if nowTime >= mcreatetime + x231001_g_A_B + x231001_g_B_C then				--需要将怪物变成C状态了
							newMonsterType = x231001_g_Black_C[mgroup]
							newAIType = 5
						end
					elseif monstertype == x231001_g_White_A[mgroup] then
						if nowTime >= mcreatetime + x231001_g_A_B then						--需要将怪物变成B状态了
							newMonsterType = x231001_g_White_B[mgroup]
							newAIType = 7
						end
					elseif monstertype == x231001_g_White_B[mgroup] then
						if nowTime >= mcreatetime + x231001_g_A_B + x231001_g_B_C then				--需要将怪物变成C状态了
							newMonsterType = x231001_g_White_C[mgroup]
							newAIType = 5
						end
					end

					if newMonsterType ~= -1 and monstertype ~= x231001_g_LastBoss[mgroup] then
						LuaFnDeleteMonster( sceneId, monsterobjid )
						monsterobjid = LuaFnCreateMonster( sceneId, newMonsterType, PosX, PosZ, newAIType, 0, -1 )
						SetLevel( sceneId, monsterobjid, GetLevel( sceneId, monsterobjid ) + LevelGap )
					end
				end
			end

			if TickCount == x231001_g_StartTick then
				for	i=0, membercount-1 do
					x231001_NotifyFailTips( sceneId, mems[i], "战斗开始了!" )
				end
			end

			local QiPu = LuaFnGetCopySceneData_Param( sceneId, 8 )					--取得棋谱
			local PressStep = LuaFnGetCopySceneData_Param( sceneId, 9 )				--取得已经下了的步数
			if PressStep < x231001_g_mListSize then
				PressStep = PressStep + 1
				local QiPuValue = 0

				if QiPu >= 1 and QiPu <= getn(x231001_g_mList) then
					QiPuValue = x231001_g_mList[QiPu][PressStep]
				else
					QiPuValue = x231001_g_mList[getn(x231001_g_mList)][PressStep]
				end

				--根据棋谱生成怪物
				PosX, PosZ = x231001_IndexToPos( QiPuValue )
				MonsterType = mod( PressStep, 2 )

				newAIType = 3
				if PressStep == x231001_g_mListSize then									--最后一个刷的特殊怪物
					newMonsterType = x231001_g_LastBoss[mgroup]
					newAIType = 0
				else
					if MonsterType == 0 then
						newMonsterType = x231001_g_Black_A[mgroup]
					else
						newMonsterType = x231001_g_White_A[mgroup]
					end
				end

				monsterobjid = LuaFnCreateMonster( sceneId, newMonsterType, PosX, PosZ, newAIType, -1, -1 )
				SetLevel( sceneId, monsterobjid, GetLevel( sceneId, monsterobjid ) + LevelGap )
				--print( QiPu, PressStep, QiPuValue, MonsterType, monsterobjid )

				LuaFnSetCopySceneData_Param( sceneId, 9, PressStep )				--设置新的定时器调用次数
			end
		end
	end
end

function x231001_IndexToPos( index )
	xP = floor( index/19 )
	zP = mod( index, 19 )
	return xP*3 + 36 + 1, zP*3 + 36 + 1
end

function x231001_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent(sceneId)
		AddText(sceneId, Tip)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--对话窗口信息提示
--**********************************
function x231001_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
