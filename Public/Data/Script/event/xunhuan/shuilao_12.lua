--副本任务
--水牢
--10个犯人头目，各统领5只小怪

--************************************************************************
--MisDescBegin
--脚本号
x232002_g_ScriptId	= 232002
--副本名称
x232002_g_CopySceneName	= "水牢"
--任务号
x232002_g_MissionId			= 1213
--上一个任务的ID
x232002_g_MissionIdPre	= 1212
--目标NPC
x232002_g_Name					= "呼延庆"
--是否是精英任务
x232002_g_IfMissionElite= 1
--任务等级
x232002_g_MissionLevel	= 10000
--任务归类
x232002_g_MissionKind		= 1
--任务文本描述
x232002_g_MissionName			= "水牢"
--任务描述
x232002_g_MissionInfo			= "#{event_xunhuan_0006}"
--任务目标
x232002_g_MissionTarget		= "  太湖水寨的呼延庆#{_INFOAIM67,77,4,呼延庆}让你杀死10个犯人头目和50个小怪物。"
--未完成任务的npc对话
x232002_g_ContinueInfo		= "  你是否已经杀死10个凶悍的犯人头目，以及诸多小怪物？"
--完成任务npc说话的话
x232002_g_MissionComplete	= "  水牢终于守住了，我们以后千万不能掉以轻心。"
--任务奖励
x232002_g_MoneyBonus			= 1000
--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_SHUILAO_HUAN
--任务是否已经完成
--MissionRound =
--**********************************以上是动态****************************
--角色Mission变量说明
x232002_g_IsMissionOkFail	= 0	--0号：当前任务是否完成(0未完成；1完成)
x232002_g_MissionRound		= 5	--Define MD_BAIMASI_HUAN from ScriptGlobal.lua
x232002_g_DemandKill			= { {id=367,num=60} }
x232002_g_Param_killcount	= 1	--1号：杀死任务怪的数量
x232002_g_Param_sceneid		= 2	--2号：当前副本任务的场景号
x232002_g_Param_teamid		= 3	--3号：接副本任务时候的队伍号
x232002_g_Param_time			= 4	--4号：完成副本所用时间(单位：秒)
--6号：具体副本事件脚本占用
--7号：具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x232002_g_CopySceneType			= FUBEN_SHUILAO	--副本类型，定义在ScriptGlobal.lua里面
x232002_g_LimitMembers			= 1		--可以进副本的最小队伍人数
x232002_g_TickTime					= 5		--回调脚本的时钟时间（单位：秒/次）
x232002_g_LimitTotalHoldTime= 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x232002_g_CloseTick					= 6		--副本关闭前倒计时（单位：次数）
x232002_g_NoUserTime				= 300	--副本中没有人后可以继续保存的时间（单位：秒）
x232002_g_Fuben_X						= 95	--进入副本的位置X
x232002_g_Fuben_Z						= 89	--进入副本的位置Z
x232002_g_Back_X						= 52	--源场景位置X
x232002_g_Back_Z						= 96	--源场景位置Z
x232002_g_NeedMonsterGroupID= 1		--需要杀死的Boss的GroupID
x232002_g_TotalNeedKillBoss	= 60	--需要杀死Boss数量

--副本数据索引对照
x232002_g_keySD					=
{
	["typ"]	= 0,	--设置副本类型
	["spt"]	= 1,	--设置副本场景事件脚本号
	["tim"]	= 2,	--设置定时器调用次数
	["scn"]	= 3,	--设置副本入口场景号, 初始化
	["cls"]	= 4,	--设置副本关闭标志, 0开放，1关闭
	["dwn"]	= 5,	--设置离开倒计时次数
	["tem"]	= 6,	--保存队伍号
	["kil"]	= 7,	--杀死Boss的数量
	["lev"]	= 8,	--怪物自适应等级
}

--接取任务的最低等级
x232002_g_minLevel			= 20
--需要配置小怪物
x232002_g_namMonster		= "普通犯人"
x232002_g_typMonster		= --普通犯人10~100级
	{ 2490, 2491, 2492, 2493, 2494,
		2495, 2496, 2497, 2498, 2499 }

--1/20的几率给于宝石奖励
x232002_g_gemList				= { 50101001, 50101002, 50111001, 50111002 }
x232002_g_gemRate				= 20
					
x232002_g_IsMissionOkFailPre	= 0	--0号：平定任务是否完成(0未完成；1完成)

x232002_g_MaxSameIPNum = 3
--**********************************
--任务入口函数
--**********************************
function x232002_OnDefaultEvent( sceneId, selfId, targetId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--如果玩家已经接了这个任务
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then

		local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local	bDone			= x232002_CheckSubmit( sceneId, selfId )
		--任务未完成
		if bDone == 0 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, "  准备好了吗？" )
			EndEvent()
			DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
		--任务已经完成
		elseif bDone == 1 then
			BeginEvent( sceneId )
				AddText( sceneId, x232002_g_MissionName )
				AddText( sceneId, x232002_g_ContinueInfo )
				AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId, bDone )
		end

	else

		--发送任务接受时显示的信息
		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionName )
			AddText( sceneId, x232002_g_MissionInfo )
			AddText( sceneId, "#{M_MUBIAO}" )
			AddText( sceneId, x232002_g_MissionTarget )
			AddText( sceneId, " " )
			AddMoneyBonus( sceneId, x232002_g_MoneyBonus )
		EndEvent( )
		DispatchMissionInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )

	end

end

--**********************************
--列举事件
--**********************************
function x232002_OnEnumerate( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x232002_g_MissionIdPre ) == 0 then
		x232002_MsgBox( sceneId, selfId, targetId, "  我的兄弟呼延豹去苏州搬救兵去了，你看到他了吗？" )
		return
	else
		if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 1 then
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
			local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) == 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 1 then
					x232002_MsgBox( sceneId, selfId, targetId, "  你可以回苏州找我的兄弟呼延豹领取奖励了！" )
					return
			end
			if GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail ) ~= 1
				and GetMissionParam( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre ) == 2 then
					x232002_MsgBox( sceneId, selfId, targetId, "  很遗憾，你的平定任务失败了！" )
					return
			end
		end
	end

	AddNumText( sceneId, x232002_g_ScriptId, x232002_g_MissionName, 4, -1 )

end

--**********************************
--检测接受条件
--**********************************
function x232002_CheckAccept( sceneId, selfId, targetId )

	if LuaFnGetLevel( sceneId, selfId ) < x232002_g_minLevel then
		x232002_NotifyTip( sceneId, selfId, "阁下的等级太低，犯人比较厉害，" )
		x232002_NotifyTip( sceneId, selfId, "还是等你到了"..x232002_g_minLevel.."级之后再来找我吧。" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "水牢里面犯人众多，你一个人势单力薄，" )
		x232002_NotifyTip( sceneId, selfId, "还是多叫几个帮手再来吧。" )
		return 0
	end

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x232002_NotifyTip( sceneId, selfId, "你不是队长，" )
		x232002_NotifyTip( sceneId, selfId, "只有队长才能决定是否接受我的委托。" )
		return 0
	end

	--取得玩家附近的队友数量（包括自己）
	local	numMem	= GetNearTeamCount( sceneId, selfId )
	if numMem ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x232002_NotifyTip( sceneId, selfId, "你有队员不在旁边。" )
		return 0
	end

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, selfId, "水牢里面犯人众多，" )
		x232002_NotifyTip( sceneId, selfId, "最少你们得有"..x232002_g_LimitMembers.."位同伴我才放心让你们去。" )
		return 0
	end

	--检测小队中是否有人任务记录已满, 队友是否已经接过此任务
	local member
	local i
	local misIndex
	--增加IP判断
	local hostIp=""
	local IPList={}
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x232002_g_MissionIdPre ) <= 0 then
			x232002_NotifyTip( sceneId, selfId, "队伍中有人没有接水牢任务。" )
			return 0
		end

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		if GetMissionParam( sceneId, member, misIndex, 6 ) ~= 1 then
			x232002_NotifyTip( sceneId, selfId, "队伍中有人接了别的平定任务。" )
			return 0
		end
		
		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFailPre ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "队伍中已经有人完成了平定任务。" )
			x232002_MsgBox( sceneId, selfId, targetId, "  非常感谢您帮我平定了水牢的叛乱，请回到苏州找我的兄弟领取奖励吧，小小礼物不成敬意。" )
			return 0
		end

		if GetMissionParam( sceneId, member, misIndex, x232002_g_IsMissionOkFail ) == 1 then
			x232002_NotifyTip( sceneId, selfId, "队伍中有人已经完成了这个任务。" )
			return 0
		end

		--队友身上任务数量是否达到上限20个
		if GetMissionCount( sceneId, member ) >= 20 then
			x232002_NotifyTip( sceneId, selfId, "队伍中有人的任务记录已满。" )
			return 0
		end

		if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
			--队友是否已经接过此任务或者另外一个任务
			x232002_NotifyTip( sceneId, selfId, "队伍中有人已经接了此任务。" )
			return 0
		end
		
		hostIp = GetHostIP(sceneId, member)
		IPList[i]=hostIp
		
	end
	local sameIPNum = 1
	for	i=0, numMem-1 do
		local nTemp = 1
		for j=0,numMem-1 do
			if IPList[i] == IPList[j] and i ~= j then
				nTemp = nTemp + 1
			end
		end
		if sameIPNum < nTemp then
			sameIPNum = nTemp
		end			
	end

	if sameIPNum >= x232002_g_MaxSameIPNum then
		--x232002_NotifyTip( sceneId, selfId, "#{SLIP_090714_1}" )
		x232002_MsgBox( sceneId, selfId, targetId, "#{SLIP_090714_1}" )
		return 0
	end

	return 1
end

--**********************************
--接受
--**********************************
function x232002_OnAccept( sceneId, selfId, targetId )

	local teamid = GetTeamId( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) > 0 then
		local misIndex 		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
		local misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		local copysceneid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )
		local saveteamid	= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_teamid )
		--进过副本
		if copysceneid >= 0 and teamid == saveteamid then
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, selfId, "任务失败，请放弃重新接取" )
				SetMissionByIndex( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail, 2 )
				SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 2 )
			end
			return
		end
	end

	--判断接收条件
	if x232002_CheckAccept( sceneId, selfId, targetId ) == 0 then
		return
	end

	--加入任务到玩家列表
	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		--给每个队伍成员加入任务
		AddMission( sceneId, member, x232002_g_MissionId, x232002_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )
		--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_IsMissionOkFail, 0 )
		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, -1 )
		--将任务的第3号数据队伍号
		SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_teamid, teamid )
		
		misIndexPre = GetMissionIndexByID( sceneId, member, x232002_g_MissionIdPre )
		SetMissionByIndex( sceneId, member, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

	x232002_MakeCopyScene( sceneId, selfId, numMem )
end

--**********************************
--放弃
--**********************************
function x232002_OnAbandon( sceneId, selfId )

	local misIndex		= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local copyscene		= GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid )

	x232002_NotifyTip( sceneId, selfId, "任务失败！" )
	x232002_MissionFailExe( sceneId, selfId )

	--如果在副本里删除任务，则直接传送回
	if sceneId == copyscene then
		--取得副本入口场景号
		local	oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, 3 )
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
	end

end

--**********************************
--创建副本
--**********************************
function x232002_MakeCopyScene( sceneId, selfId, nearmembercount )

	--指数参数
	local	param0	= 4;
	local	param1	= 3;

	--最终结果
	local	mylevel	= 0;

	--临时变量
	local mems		= {};
	local	tempMemlevel = 0;
	local	level0 = 0;
	local	level1 = 0;
	for	i = 0, nearmembercount - 1 do
		mems[i]	= GetNearTeamMember(sceneId, selfId, i);
		tempMemlevel = GetLevel(sceneId, mems[i]);
		level0	= level0 + (tempMemlevel ^ param0);
		level1	= level1 + (tempMemlevel ^ param1);
	end

	if level1 == 0 then
		mylevel = x232002_g_minLevel;
	else
		mylevel = level0/level1;
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "shuilao.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x232002_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x232002_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["typ"], x232002_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["spt"], x232002_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["kil"], 0 )

  local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel;
	if mylevel < 10 then
		iniLevel = 10;
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10) * 10;
	else
		iniLevel = PlayerMaxLevel;
	end
	LuaFnSetSceneLoad_Monster( sceneId, "shuilao_monster_" .. iniLevel .. ".ini" )
	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel )	--级别差，CopyScene_LevelGap 在 scene.lua 中赋值
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["lev"], mylevel )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )	--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x232002_NotifyTip( sceneId, selfId, "副本创建成功！" )
	else
		--x232002_NotifyTip( sceneId, selfId, "副本数量已达上限，请稍候再试！" )

		--删除玩家任务列表中对应的任务
		for	i=0, nearmembercount-1 do
			x232002_NotifyTip( sceneId, mems[i], "副本数量已达上限，请稍候再试！" )
			DelMission( sceneId, mems[i], x232002_g_MissionId )
			
			misIndexPre	= GetMissionIndexByID( sceneId, mems[i], x232002_g_MissionIdPre )
			SetMissionByIndex( sceneId, mems[i], misIndexPre, x232002_g_IsMissionOkFailPre, 0 )
		end
	end

end

--**********************************
--继续
--**********************************
function x232002_OnContinue( sceneId, selfId, targetId )

	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x232002_g_Param_sceneid ) >= 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "  恭喜，你将得到#{_MONEY"..x232002_g_MoneyBonus.."}的奖励！" )
		EndEvent( sceneId )
		DispatchMissionContinueInfo( sceneId, selfId, targetId, x232002_g_ScriptId, x232002_g_MissionId )
	end

end

--**********************************
--检测是否可以提交
--**********************************
function x232002_CheckSubmit( sceneId, selfId, selectRadioId )

	--判断任务是否已经完成
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionId )
	local	ret				= GetMissionParam( sceneId, selfId, misIndex, x232002_g_IsMissionOkFail )
	if ret == 1 then
		return 1
	else
		return 0
	end

end

--**********************************
--提交
--**********************************
function x232002_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--判断该npc是否是对应任务的npc
	if LuaFnGetName( sceneId, targetId ) ~= x232002_g_Name then
		return
	end

	--已经完成任务了
	if x232002_CheckSubmit( sceneId, selfId, selectRadioId ) > 0 then
		--取得总共做过的环数
		--local iHuan	= GetMissionData( sceneId, selfId, 10 )

		--任务奖励
		AddMoney( sceneId, selfId, x232002_g_MoneyBonus )
		nSeed	= random( getn( x232002_g_gemList ) )
		sName	= GetName( sceneId, selfId )
		if random( x232002_g_gemRate ) == 1 then
			nPos		= LuaFnTryRecieveItem( sceneId, selfId, x232002_g_gemList[ nSeed ], 1 )
			if nPos ~= -1 then
				sTran	= GetBagItemTransfer( sceneId, selfId, nPos )
				if random( 2 ) == 1 then
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."}因平定水牢叛乱有功，特被奖励#{_INFOMSG"..sTran.."}一颗。" )
				else
					AddGlobalCountNews( sceneId, "#{_INFOUSR"..sName.."}平定水牢之后，在水牢的角落里面发现了一颗#{_INFOMSG"..sTran.."}。" )
				end
			end
		end

		BeginEvent( sceneId )
			AddText( sceneId, x232002_g_MissionComplete )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		--设置任务已经被完成过
		DelMission( sceneId, selfId, x232002_g_MissionId )
		--得到任务的序列号
		local	misIndexPre	= GetMissionIndexByID( sceneId, selfId, x232002_g_MissionIdPre )
		--根据序列号把任务变量的第1位置1 (任务完成情况)
		SetMissionByIndex( sceneId, selfId, misIndexPre, x232002_g_IsMissionOkFailPre, 1 )
	end

end

--**********************************
--杀死怪物或玩家
--**********************************
function x232002_OnKillObject( sceneId, selfId, objdataId, objId )

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x232002_g_CopySceneType then
		return
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )
	--如果副本已经被置成关闭状态，则杀怪无效
	if leaveFlag == 1 then
		return
	end

	--取得当前场景里的人数
	local num = LuaFnGetCopyScene_HumanCount( sceneId )

	--取得杀死怪物的GroupID,用于判断是否是所需要杀掉的Boss
	local GroupID = GetMonsterGroupID( sceneId, objId )
	--不是所需要的Boss
	if GetMonsterNamebyDataId( objdataId ) ~= x232002_g_namMonster and GroupID ~= x232002_g_NeedMonsterGroupID then
		return
	end

	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, 7 )			--杀死Boss的数量
	killedbossnumber = killedbossnumber + 1
	LuaFnSetCopySceneData_Param( sceneId, 7, killedbossnumber )					--设置杀死Boss的数量

	local i
	local misIndex
	local humanObjId
	--local killedcount

	if killedbossnumber < x232002_g_TotalNeedKillBoss then

		local strText = format( "已杀死囚犯： %d/%d", killedbossnumber, x232002_g_TotalNeedKillBoss )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--取得当前场景里人的objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then					--不在场景的不做此操作
				x232002_NotifyTip( sceneId, humanObjId, strText )

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId )					--取得任务数据索引值
				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--取得已经杀了的怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, killedbossnumber )	--设置任务数据
			end
		end
	elseif killedbossnumber >= x232002_g_TotalNeedKillBoss then
		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

		--取得已经执行的定时次数
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "已杀死囚犯： %d/%d", x232002_g_TotalNeedKillBoss, x232002_g_TotalNeedKillBoss )
		local strText2 = format( "任务完成，将在%d秒后传送到入口位置", x232002_g_CloseTick * x232002_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--取得当前场景里人的objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 then										--不在场景的不做此操作
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x232002_g_MissionId)					--取得任务数据索引值

				--killedcount = GetMissionParam( sceneId, humanObjId, misIndex, x232002_g_Param_killcount )	--取得已经杀了的怪物数
				--killedcount = killedcount + 1
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_killcount, x232002_g_TotalNeedKillBoss )	--设置任务数据

				--将任务的第1号数据设置为1,表示完成的任务
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_IsMissionOkFail, 1 )					--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, humanObjId, misIndex, x232002_g_Param_time, TickCount * x232002_g_TickTime )	--设置任务数据

				x232002_NotifyTip( sceneId, humanObjId, strText )
				x232002_NotifyTip( sceneId, humanObjId, strText2 )
			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x232002_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x232002_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x232002_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )

	local leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )
	--找不到该玩家
	if leaderObjId == -1 then
		return
	end

	--处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, leaderObjId )

	if numMem < x232002_g_LimitMembers then
		x232002_NotifyTip( sceneId, leaderObjId, "你的队伍人数不足。" )
		return
	end

	local member
	local misIndex
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态
			if IsHaveMission( sceneId, member, x232002_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x232002_g_MissionId )

				--将任务的第2号数据设置为副本的场景号
				SetMissionByIndex( sceneId, member, misIndex, x232002_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
			else
				x232002_NotifyTip( sceneId, member, "你当前未接此任务" )
			end
		end
	end

end

--**********************************
--有玩家进入副本事件
--**********************************
function x232002_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x232002_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x232002_NotifyTip( sceneId, selfId, "你当前未接此任务" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--取得副本入口场景号
		NewWorld( sceneId, selfId, oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
		return
	end

	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x232002_g_Fuben_X, x232002_g_Fuben_Z )
end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x232002_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--副本场景定时器事件
--**********************************
function x232002_OnCopySceneTimer( sceneId, nowTime )

	--副本时钟读取及设置
	--取得已经执行的定时次数
	local TickCount	= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x232002_g_keySD["tim"], TickCount )

	if TickCount == 1 then
		--刚刚开启场景时，在每个Boss周围刷出数只小怪
		local	iniLevel= LuaFnGetCopySceneData_Param( sceneId, x232002_g_keySD["lev"] )
		x232002_RefreshMonster( sceneId, iniLevel )
	end

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--需要离开
	if leaveFlag == 1 then
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount == x232002_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		elseif leaveTickCount < x232002_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在%d秒后离开场景!", (x232002_g_CloseTick-leaveTickCount) * x232002_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == 1 then
		local	CloseMin	= floor( x232002_g_LimitTotalHoldTime * x232002_g_TickTime / 60 )
		if CloseMin > 0 then
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x232002_NotifyTip( sceneId, mems[i], "副本将在"..CloseMin.."分钟后关闭!" )
				end
			end
		end
	elseif TickCount >= x232002_g_LimitTotalHoldTime then						--副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				x232002_NotifyTip( sceneId, mems[i], "任务失败，超时!" )
				--任务失败,删除之
				x232002_MissionFailExe( sceneId, mems[i] )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, 6 )		--取得保存的队伍号
		local oldsceneId

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x232002_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					--任务失败,删除之
					x232002_NotifyTip( sceneId, mems[i], "任务失败，你不在正确的队伍中!" )
					x232002_MissionFailExe( sceneId, mems[i] )

					oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )	--取得副本入口场景号
					NewWorld( sceneId, mems[i], oldsceneId, x232002_g_Back_X, x232002_g_Back_Z )
				end
			end
		end

	end
end

--**********************************
--醒目提示
--**********************************
function x232002_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x232002_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--在每个Boss周围刷出数只小怪
--**********************************
function x232002_RefreshMonster( sceneId, iniLevel )

	local	ini		= floor( iniLevel / 10 )
	if ini <= 0 then
		ini	= 1
	elseif ini > 10 then
		ini	= 10
	end
	local	typ		= x232002_g_typMonster[ini]	--怪物编号
	local	nai		= 0													--智能编号
	local	px, py														--场景位置

	--取得此场景中的怪物数量
	local	numMon= GetMonsterCount( sceneId )
	--怪物的ObjId
	local idMon
	--怪物分布
	local	lstLay	= { {-1,-1}, {1,-1}, {-1,1}, {1,1}, {0,0} }
	for i=0, numMon-1 do
		idMon				= GetMonsterObjID( sceneId, i )
		local	x, y
		x, y				= LuaFnGetWorldPos( sceneId, idMon )
		
		--创建周边小怪
		local	objId
		local	untLay
		for _, untLay in lstLay do
			px	= floor( x ) + untLay[1]
			py	= floor( y ) + untLay[2]
			objId = LuaFnCreateMonster( sceneId, typ, px, py, nai, -1, -1 )
			SetLevel( sceneId, objId, iniLevel )
		end
	end

end

--**********************************
--任务失败
--**********************************
function x232002_MissionFailExe( sceneId, selfId )

	--删除玩家任务列表中对应的任务
	DelMission( sceneId, selfId, x232002_g_MissionId )
	DelMission( sceneId, selfId, x232002_g_MissionIdPre )

	x232002_NotifyTip( sceneId, selfId, "任务被系统自动删除！" )
	
	--得到环数
	local	MissionRound= GetMissionData( sceneId, selfId, MD_BAIMASI_HUAN )
	--环数增加1
	-- SetMissionData( sceneId, selfId, MD_BAIMASI_HUAN, MissionRound + 1 )

end
