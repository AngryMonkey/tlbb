--副本任务
--牧场
--

--************************************************************************
--MisDescBegin
--脚本号
x808032_g_ScriptId	= 808032
--副本名称
x808032_g_CopySceneName	= "丐帮总舵"
--任务号
x808032_g_MissionId			= 1250
--上一个任务的ID
x808032_g_MissionIdPre	= 0
--目标NPC
x808032_g_Name					= "偷袭门派"
--是否是精英任务
x808032_g_IfMissionElite= 1
--任务等级
x808032_g_MissionLevel	= 10000
--任务归类
x808032_g_MissionKind		= 1
--任务文本描述
x808032_g_MissionName			= "偷袭门派"
--任务描述
x808032_g_MissionInfo			= "  "
--任务目标
x808032_g_MissionTarget		= "  杀死所有的怪物即可完成任务。"
--未完成任务的npc对话
x808032_g_ContinueInfo		= "  "
--完成任务npc说话的话
x808032_g_MissionComplete	= "  "

--********下面几项是动态显示的内容，用于在任务列表中动态显示任务情况******
--循环任务的数据索引，里面存着已做的环数 MD_SHUILAO_HUAN
--任务是否已经完成
--**********************************以上是动态****************************
--角色Mission变量说明
x808032_g_Param_IsMissionOkFail	= 0						--0号：当前任务是否完成(0未完成；1完成)
x808032_g_Param_killmonstercount	= 1					--1号：杀死任务小怪的数量
x808032_g_Param_killbosscount	= 2							--2号：杀死任务boss怪的数量
x808032_g_Param_sceneid		= 3									--3号：当前副本任务的场景号
x808032_g_Param_teamid		= 4									--4号：接副本任务时候的队伍号
x808032_g_Param_time			= 5									--5号：完成副本所用时间(单位：秒)
																							--6号：具体副本事件脚本占用
																							--7号：具体副本事件脚本占用
--MisDescEnd
--************************************************************************

x808032_g_CopySceneType			= FUBEN_GAIBANG1	--副本类型，定义在ScriptGlobal.lua里面
x808032_g_LimitMembers			= 1		--可以进副本的最小队伍人数
x808032_g_TickTime					= 5		--回调脚本的时钟时间（单位：秒/次）
x808032_g_LimitTotalHoldTime= 360	--副本可以存活的时间（单位：次数）,如果此时间到了，则任务将会失败
x808032_g_LimitTimeSuccess	= 500	--副本时间限制（单位：次数），如果此时间到了，任务完成
x808032_g_CloseTick					= 6		--副本关闭前倒计时（单位：次数）
x808032_g_NoUserTime				= 300	--副本中没有人后可以继续保存的时间（单位：秒）
x808032_g_Fuben_X						= 92	--进入副本的位置X
x808032_g_Fuben_Z						= 153	--进入副本的位置Z
x808032_g_Back_X						= 92	--源场景位置X
x808032_g_Back_Z						= 153	--源场景位置Z
x808032_g_Totalkillmonstercount	= 30	--需要杀死monster数量
x808032_g_Totalkillbosscount	= 1	--需要杀死Boss数量

--副本数据索引对照
x808032_g_keySD					= {}
x808032_g_keySD["typ"]	= 0		--设置副本类型
x808032_g_keySD["spt"]	= 1		--设置副本场景事件脚本号
x808032_g_keySD["tim"]	= 2		--设置定时器调用次数
x808032_g_keySD["scn"]	= 3		--设置副本入口场景号, 初始化
x808032_g_keySD["cls"]	= 4		--设置副本关闭标志, 0开放，1关闭
x808032_g_keySD["dwn"]	= 5		--设置离开倒计时次数
x808032_g_keySD["tem"]	= 6		--保存队伍号
x808032_g_keySD["x"]	= 7			--人物在入口场景中的x位置
x808032_g_keySD["z"]	= 8			--人物在入口场景中的z位置
x808032_g_keySD["killedmonsternum"]	= 9		--杀死喽罗的数量
x808032_g_keySD["killedbossnum"]	= 10		--杀死Boss的数量
x808032_g_keySD["mp"]	= 11		--记录当前副本的 门派

--接取任务的最低等级
x808032_g_minLevel			= 20
--需要配置小怪物
x808032_g_typMonster		= 749	--水鬼探子
--门派id
x808032_g_MenPaiID		= MP_GAIBANG

x808032_g_NianNum = 5
x808032_g_NianPos = {
											{x=83  ,y=140 },
											{x=69  ,y=119 },
											{x=76  ,y=99  },
											{x=46  ,y=120 },
											{x=39  ,y=110 },
										}
--x808032_g_NianShou = {12200,12201,12202,12203,12204,12205,12206,12207,12208,12209,12210,12211}
--**********************************
--任务入口函数
--**********************************
function x808032_OnDefaultEvent( sceneId, selfId, targetId )

	x808032_OnAccept( sceneId, selfId, targetId )


end

--**********************************
--列举事件
--**********************************
function x808032_OnEnumerate( sceneId, selfId, targetId )

	local	MenPaiID	=	GetMenPai(sceneId, selfId)
	if(MenPaiID ~= x808032_g_MenPaiID) then
		x808032_NotifyTip( sceneId, selfId, "我来是找丐帮麻烦的，你不是丐帮的弟子，请速速走开。" )
		return
	end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808032_g_minLevel then
	  x808032_NotifyTip( sceneId, selfId, "你的等级太低了，根本不够我看的，还是20级之后再来找我吧。" )
		return
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "区区一个人就想来挑战我，我根本不屑与你动手。" )
		return
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808032_g_LimitMembers then
	  x808032_NotifyTip( sceneId, selfId, "想要挑战我至少也得上来三个吧，就这点人？也太瞧不起我了。" )
	  return
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "想要挑战我？叫你们的队长来吧。" )
		return
	end
	--PrintNum(5)

	-- 取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808032_NotifyTip( sceneId, selfId, "您队伍中有队员不在附近，请集合后再找我送你进入活动。" )
		return
	end

	local namenum = 0;
	local notifyString = "您队伍中有成员(";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808032_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..")等级不足。";	
	if(namenum>0) then
		x808032_NotifyTip( sceneId, selfId, notifyString )
		return
	end

	BeginEvent( sceneId )
		AddText( sceneId, "既然你们不怕死，我也就没有必要留什么情面了，小的们，过来给他们点厉害尝尝。" )
		AddNumText( sceneId, x808032_g_ScriptId, "难道我还怕你不成……" ,10 ,0)
  EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--检测接受条件
--**********************************
function x808032_CheckAccept( sceneId, selfId )
	local	MenPaiID	=	GetMenPai(sceneId, selfId)
	if(MenPaiID ~= x808032_g_MenPaiID) then
		x808032_NotifyTip( sceneId, selfId, "我来是找星宿麻烦的，你不是星宿的弟子，请速速走开。" )
		return 0;
	end

	local	lev	= GetLevel( sceneId, selfId )
	if lev < x808032_g_minLevel then
	  x808032_NotifyTip( sceneId, selfId, "你的等级太低了，根本不够我看的，还是20级之后再来找我吧。" )
		return 0
	end

	if LuaFnHasTeam( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "区区一个人就想来挑战我，我根本不屑与你动手。" )
		return 0
	end
	--PrintNum(3)

	if GetTeamSize( sceneId, selfId ) < x808032_g_LimitMembers then
	  x808032_NotifyTip( sceneId, selfId, "想要挑战我至少也得上来三个吧，就这点人？也太瞧不起我了。" )
	  return 0
	end
	--PrintNum(4)

	if LuaFnIsTeamLeader( sceneId, selfId ) == 0 then
		x808032_NotifyTip( sceneId, selfId, "想要挑战我？叫你们的队长来吧。" )
		return 0
	end
	--PrintNum(5)

	-- 取得玩家附近的队友数量（包括自己）
	local nearteammembercount = GetNearTeamCount( sceneId, selfId )
	if nearteammembercount ~= LuaFnGetTeamSize( sceneId, selfId ) then
		x808032_NotifyTip( sceneId, selfId, "您队伍中有队员不在附近，请集合后再找我送你进入活动。" )
		return 0
	end
	
	local namenum = 0;
	local notifyString = "您队伍中有成员(";
	for i=0, nearteammembercount-1  do
		local nPlayerId = GetNearTeamMember(sceneId,selfId, i)
		local	lev	= GetLevel( sceneId, nPlayerId )
		local	nam	= GetName( sceneId, nPlayerId )
		
		if(lev<x808032_g_minLevel) then
			notifyString = notifyString..nam.." ";
			namenum = 1;
		end
	end
	notifyString = notifyString..")等级不足。";	
	if(namenum>0) then
		x808032_NotifyTip( sceneId, selfId, notifyString )
		return 0
	end
	return 1
end

--**********************************
--接受
--**********************************
function x808032_OnAccept( sceneId, selfId, targetId )
	if x808032_CheckAccept( sceneId, selfId ) == 0 then
		return
	end
	local teamid = GetTeamId( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x808032_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x808032_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_sceneid )
		local saveteamid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_teamid )
		--进过副本
		if copysceneid >= 0 and teamid == saveteamid then
			--将自己传送到副本场景
			if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
				NewWorld( sceneId, selfId, copysceneid, x808032_g_Fuben_X, x808032_g_Fuben_Z )
			else
				x808032_NotifyTip( sceneId, selfId, "任务失败，请放弃重新接取" )
				SetMissionByIndex( sceneId, selfId, misIndex, x808032_g_Param_IsMissionOkFail, 2 )
				DelMission(sceneId, selfId, x808032_g_MissionId);
			end
			return
		end
	end

	--加入任务到玩家列表
	--取得玩家附近的队友数量（包括自己）
	local numMem	= GetNearTeamCount( sceneId, selfId )
	local member
	local i
	local misIndex
	for i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i );
		if IsMissionFull(sceneId, member) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, "队伍中有人任务已满！");
			EndEvent()
			DispatchMissionTips(sceneId, selfId);
			return
		end
	end
	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, member, x808032_g_MissionId ) > 0 then
			--删掉先
			DelMission( sceneId, member, x808032_g_MissionId);
		end


		--给每个队伍成员加入任务
		AddMission( sceneId, member, x808032_g_MissionId, x808032_g_ScriptId, 1, 0, 0 )

		misIndex = GetMissionIndexByID( sceneId, member, x808032_g_MissionId )
		--将任务的第0号数据设置为0,表示未完成的任务
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_IsMissionOkFail, 0 )
		--将任务的第2号数据设置为-1, 用于保存副本的场景号
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_sceneid, -1 )
		--将任务的第3号数据队伍号
		SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_teamid, teamid )
	end
	x808032_MakeCopyScene( sceneId, selfId, numMem )
	LuaFnDeleteMonster( sceneId, targetId)
end

--**********************************
--放弃
--**********************************
function x808032_OnAbandon( sceneId, selfId )
	--不在场景的不做此操作
	if LuaFnIsObjValid( sceneId, selfId ) ~= 1 then
		return
	end

	--处于无法执行逻辑的状态
	if LuaFnIsCanDoScriptLogic( sceneId, selfId ) ~= 1 then
		return
	end

	--不是在副本中直接删除任务
	local misIndex = GetMissionIndexByID( sceneId, selfId, x808032_g_MissionId )
	local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x808032_g_Param_sceneid )

	if(copysceneid ~= sceneId) then
		DelMission( sceneId, selfId, x808032_g_MissionId )
		return
	end

	local leaderguid = LuaFnGetCopySceneData_TeamLeader( sceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	--找不到该玩家
	if leaderObjId == -1 then
		DelMission( sceneId, selfId, x808032_g_MissionId )
		return
	end

	--此时一定在副本中，可以获得入口场景号
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取得副本入口场景号
	if(selfId == leaderObjId) then
		--队长放弃，全部传出副本
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
		local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
		local mems = {}
		local i
		for	i=0, membercount-1 do
			mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
		end
		--将当前副本场景里的所有人传送回原来进入时候的场景
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808032_g_MissionId )
				x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
				z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
				NewWorld( sceneId, mems[i], oldsceneId, x, z )
			end
		end
	else
	--自己不是队长只是自己放弃，只把自己传出副本
		DelMission( sceneId, selfId, x808032_g_MissionId )
		x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
	end

end

--**********************************
--创建副本
--**********************************
function x808032_MakeCopyScene( sceneId, selfId, nearmembercount )

	local mems = {}
	local mylevel = 0
	local i

-- 	PrintStr("sdlf")

	local member, mylevel, numerator, denominator = 0, 0, 0, 0

	for	i = 0, nearmembercount - 1 do
		member = GetNearTeamMember( sceneId, selfId, i )
		numerator = numerator + GetLevel( sceneId, member ) ^ 4
		denominator = denominator + GetLevel( sceneId, member ) ^ 3
		mems[i] = member
	end

	if denominator <= 0 then
		mylevel = 0
	else
		mylevel = numerator / denominator
	end

	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = PlayerMaxLevel
	end

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	--地图是必须选取的，而且必须在Config/SceneInfo.ini里配置好
	LuaFnSetSceneLoad_Map( sceneId, "gaibang_1.nav" )
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x808032_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x808032_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["typ"], x808032_g_CopySceneType )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["spt"], x808032_g_ScriptId )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tim"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["scn"], -1 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tem"], GetTeamId( sceneId, selfId ) )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"], 0 )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["mp"], MP_GAIBANG )

	local x,z = GetWorldPos( sceneId, selfId )

--	PrintStr("  "..x..z.." ")

	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["x"], x808032_g_Back_X )
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["z"], x808032_g_Back_Z )

	LuaFnSetSceneLoad_Monster( sceneId, "gaibang_1_monster_" .. iniLevel .. ".ini" )
	LuaFnSetCopySceneData_Param(sceneId, CopyScene_LevelGap, mylevel - iniLevel) --级别差，CopyScene_LevelGap 在 scene.lua 中赋值
  LuaFnSetCopySceneData_Param(sceneId, 13, mylevel)
  
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--初始化完成后调用创建副本函数
	if bRetSceneID > 0 then
		x808032_NotifyTip( sceneId, selfId, "副本创建成功！" )
	else
		x808032_NotifyTip( sceneId, selfId, "副本数量已达上限，请稍候再试！" )

		--删除玩家任务列表中对应的任务
		for	i=0, nearmembercount-1 do
			DelMission( sceneId, mems[i], x808032_g_MissionId )
		end
	end

end

--**********************************
--继续
--**********************************
function x808032_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x808032_CheckSubmit( sceneId, selfId, selectRadioId )


end

--**********************************
--提交
--**********************************
function x808032_OnSubmit( sceneId, selfId, targetId, selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x808032_OnKillObject( sceneId, selfId, objdataId, objId )

	--是否是副本
	local sceneType = LuaFnGetSceneType( sceneId )
	if sceneType ~= 1 then
		return
	end

	--是否是所需要的副本
	local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
	if fubentype ~= x808032_g_CopySceneType then
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

	local killedmonsternumber = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"] )			--杀死monster的数量
	local killedbossnumber = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"] )			--杀死boss的数量

	local MonsterName = GetName(sceneId, objId)
	local	isBoss

	if(MonsterName == "喽啰")then
		killedmonsternumber = killedmonsternumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedmonsternum"], killedmonsternumber )					--设置杀死monster的数量
		isBoss = 0

		if killedmonsternumber ==  x808032_g_Totalkillmonstercount then

			local	Selflev	= GetLevel( sceneId, selfId )
			local PlayerMaxLevel = GetHumanMaxLevelLimit()
			local monsterLevel=0
			if Selflev < 10 then
				monsterLevel = 0
			elseif Selflev < 110 then
				monsterLevel = floor( Selflev/10 ) + 3670 - 1
			elseif Selflev < PlayerMaxLevel then
				monsterLevel = floor( Selflev/10 ) + 33670 - 11
			else
				monsterLevel = 9
			end
			local tmpMonsterId = LuaFnCreateMonster( sceneId, monsterLevel, 59, 66, 14, 138, -1 )
			local tmpsMessage = format("可恶，眼看着我们就要偷袭成功了，既然这样，就别怪我不客气了。")
			MonsterTalk(sceneId, tmpMonsterId, x808032_g_CopySceneName, tmpsMessage)
			local szName = GetName(sceneId, tmpMonsterId)
			if szName == "恶霸"   then
				SetCharacterTitle(sceneId, tmpMonsterId, "“书山有路”")
			end
		end

	elseif ( MonsterName == "恶霸" ) then
		killedbossnumber = killedbossnumber + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["killedbossnum"], killedbossnumber )					--设置杀死boss的数量
		isBoss = 1
	end



	-------------------------------------------------------------------------------
	local membercount = LuaFnGetCopyScene_HumanCount(sceneId);
	local memId
	local teamLeaderName;
	local firstMemName;
	local firstMemId;

	teamLeaderName = ""
	for	i = 0, membercount - 1 do
		memId = LuaFnGetCopyScene_HumanObjId(sceneId, i);
		if LuaFnIsObjValid( sceneId, memId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, memId ) == 1 then
			local teamLeaderFlag = LuaFnIsTeamLeader(sceneId, memId);
			if teamLeaderFlag and teamLeaderFlag == 1 then
				teamLeaderName = LuaFnGetName(sceneId, memId);
				break;
			end
		end
	end

	if isBoss==1 and teamLeaderName ~= "" then
		local message;
		local randMessage = random(3);

		if randMessage == 1 then
			message = format("#B#{_INFOUSR%s}#{TouXi_00}#G#{MP_gaibang}#{TouXi_01}", teamLeaderName );
		elseif randMessage == 2 then
			message = format("#G#{MP_gaibang}#{TouXi_02}#{_INFOUSR%s}#{TouXi_03}#B#{_INFOUSR%s}#{TouXi_04}", teamLeaderName, teamLeaderName );
		else
			message = format("#{TouXi_05}#G#{MP_gaibang}#{TouXi_06}#{_INFOUSR%s}#{TouXi_07}", teamLeaderName );
		end

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
	end
	-------------------------------------------------------------------------------



	local i
	local misIndex
	local humanObjId
	local	mppoint

	if (killedmonsternumber < x808032_g_Totalkillmonstercount ) or (killedbossnumber < x808032_g_Totalkillbosscount )then
		local strText = format( "已杀死喽啰： %d/%d 已杀死恶霸： %d/%d" , killedmonsternumber, x808032_g_Totalkillmonstercount, killedbossnumber, x808032_g_Totalkillbosscount )
		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )				--取得当前场景里人的objId
		if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then				--不在场景的不做此操作
				x808032_NotifyTip( sceneId, humanObjId, strText )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808032_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end

				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808032_g_MissionId )					--取得任务数据索引值
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killmonstercount, killedmonsternumber )	--设置任务数据
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killbosscount, killedbossnumber )	--设置任务数据
			end
		end
	else

		--设置任务完成标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )

		--取得已经执行的定时次数
		local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )
		local strText = format( "已杀死喽啰： %d/%d 已杀死恶霸： %d/%d", x808032_g_Totalkillmonstercount, x808032_g_Totalkillmonstercount, x808032_g_Totalkillbosscount, x808032_g_Totalkillbosscount)
		local strText2 = format( "任务完成，将在%d秒后传送到入口位置", x808032_g_CloseTick * x808032_g_TickTime )

		for i=0, num-1 do
			humanObjId = LuaFnGetCopyScene_HumanObjId( sceneId, i )									--取得当前场景里人的objId

			if LuaFnIsObjValid( sceneId, humanObjId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, humanObjId ) == 1 then				--不在场景的不做此操作
				misIndex = GetMissionIndexByID( sceneId, humanObjId, x808032_g_MissionId)					--取得任务数据索引值

				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killmonstercount, killedmonsternumber )	--设置任务数据
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_killbosscount, killedbossnumber )	--设置任务数据

				--将任务的第1号数据设置为1,表示完成的任务
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_IsMissionOkFail, 1 )					--设置任务数据
				--完成副本所用时间
				SetMissionByIndex( sceneId, humanObjId, misIndex, x808032_g_Param_time, TickCount * x808032_g_TickTime )	--设置任务数据

				x808032_NotifyTip( sceneId, humanObjId, strText )
				x808032_NotifyTip( sceneId, humanObjId, strText2 )

				local	MenPaiID	=	GetMenPai(sceneId, humanObjId)
				if(MenPaiID == x808032_g_MenPaiID) then
					if isBoss == 0 then
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+1
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					else
						mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
						mppoint = mppoint+5
						SetHumanMenpaiPoint(sceneId, humanObjId, mppoint)
					end
				end

			end
		end
	end
end

--**********************************
--进入区域事件
--**********************************
function x808032_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808032_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--副本事件
--**********************************
function x808032_OnCopySceneReady( sceneId, destsceneId )

	--设置副本入口场景号
	LuaFnSetCopySceneData_Param( destsceneId, x808032_g_keySD["scn"], sceneId )
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

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
	local member
	local misIndex

	misIndex = GetMissionIndexByID( sceneId, leaderObjId, x808032_g_MissionId )
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x808032_g_Param_sceneid, destsceneId )
	NewWorld( sceneId, leaderObjId, destsceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )
	
	--活动统计
	LuaFnAuditQuest(sceneId, leaderObjId, x808032_g_MissionName.."-"..x808032_g_CopySceneName)

	for	i=0, numMem-1 do
		member = GetNearTeamMember( sceneId, leaderObjId, i )

		if LuaFnIsCanDoScriptLogic( sceneId, member ) == 1 then			-- 处于可以执行逻辑的状态
			if IsHaveMission( sceneId, member, x808032_g_MissionId ) > 0 then
				misIndex = GetMissionIndexByID( sceneId, member, x808032_g_MissionId )

				--将任务的第2号数据设置为副本的场景号
				SetMissionByIndex( sceneId, member, misIndex, x808032_g_Param_sceneid, destsceneId )

				NewWorld( sceneId, member, destsceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )
				
				--活动统计
				LuaFnAuditQuest(sceneId, member, x808032_g_MissionName.."-"..x808032_g_CopySceneName)
	
			else
				x808032_NotifyTip( sceneId, member, "你当前未接此任务" )
			end
		end
	end
end

--**********************************
--有玩家进入副本事件
--**********************************
function x808032_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x808032_g_MissionId ) == 0 then				--如果进入副本前删除任务，则直接传送回
		x808032_NotifyTip( sceneId, selfId, "你当前未接此任务" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )		--取得副本入口场景号
		x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
		z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
		NewWorld( sceneId, selfId, oldsceneId, x, z )
		return
	end


	--设置死亡后复活点位置
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808032_g_Fuben_X, x808032_g_Fuben_Z )

end

--**********************************
--有玩家在副本中死亡事件
--**********************************
function x808032_OnHumanDie( sceneId, selfId, killerId )
--	x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
--	z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
--	NewWorld( sceneId, selfId, oldsceneId, x, z )
end

--**********************************
--副本场景定时器事件
--**********************************
function x808032_OnCopySceneTimer( sceneId, nowTime )
	
--	local once = LuaFnGetCopySceneData_Param( sceneId, 16 )
--
--	if (once == 0) then
--		LuaFnSetCopySceneData_Param(sceneId, 16, 1)
--		local mylevel = LuaFnGetCopySceneData_Param( sceneId, 13 )
--		
--		local PlayerMaxLevel = GetHumanMaxLevelLimit()
--		local iniLevel;
--		if mylevel < 10 then
--			iniLevel = 10;
--		elseif mylevel < PlayerMaxLevel then
--			iniLevel = floor(mylevel/10) * 10;
--		else
--			iniLevel = PlayerMaxLevel;
--		end
--	 
--		local iNianShouIdx = iniLevel / 10
--	
--		for i=1,x808032_g_NianNum do
--			local objId = LuaFnCreateMonster( sceneId, x808032_g_NianShou[iniLevel/10], x808032_g_NianPos[i].x, x808032_g_NianPos[i].y, 1, 272, -1 )
--			SetLevel( sceneId, objId, mylevel )
--			LuaFnSendSpecificImpactToUnit(sceneId, objId, objId, objId, 10472, 0); -- zchw
--		end  
--	end
	
	--副本时钟读取及设置
	--取得已经执行的定时次数
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["tim"] )
	TickCount = TickCount + 1
	--设置新的定时器调用次数
	LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["tim"], TickCount )

	--副本关闭标志
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["cls"] )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	if membercount==0 and leaveFlag~=1 then
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
		return
	end



	for	i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--需要离开
	if leaveFlag == 1 then
		--离开倒计时间的读取和设置
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"] )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["dwn"], leaveTickCount )

		if leaveTickCount == x808032_g_CloseTick then										--倒计时间到，大家都出去吧
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取得副本入口场景号

			--将当前副本场景里的所有人传送回原来进入时候的场景
			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					DelMission( sceneId, mems[i], x808032_g_MissionId )
					x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end

		--	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )

		elseif leaveTickCount < x808032_g_CloseTick then
			--通知当前副本场景里的所有人，场景关闭倒计时间
			local strText = format( "你将在%d秒后离开场景!", (x808032_g_CloseTick-leaveTickCount) * x808032_g_TickTime )

			for	i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x808032_NotifyTip( sceneId, mems[i], strText )
				end
			end
		end
	elseif TickCount == x808032_g_LimitTimeSuccess then
		--此处设置有时间限制的任务完成处理
		local misIndex
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then

			DelMission( sceneId, mems[i], x808032_g_MissionId )

				x808032_NotifyTip( sceneId, mems[i], "任务时间到，完成!" )

				--取得任务数据索引值
				misIndex = GetMissionIndexByID( sceneId, mems[i], x808032_g_MissionId )
				--将任务的第1号数据设置为1,表示完成的任务
				--设置任务数据
				SetMissionByIndex( sceneId, mems[i], misIndex, x808032_g_Param_IsMissionOkFail, 1 )
				--完成副本所用时间
				SetMissionByIndex( sceneId, mems[i], misIndex, x808032_g_Param_time, TickCount * x808032_g_TickTime )	--设置任务数据
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
	elseif TickCount == x808032_g_LimitTotalHoldTime then						--副本总时间限制到了
		--此处设置副本任务有时间限制的情况，当时间到后处理...
		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				DelMission( sceneId, mems[i], x808032_g_MissionId )				--任务失败,删除之
				x808032_NotifyTip( sceneId, mems[i], "任务失败，超时!" )
			end
		end

		--设置副本关闭标志
		LuaFnSetCopySceneData_Param( sceneId, x808032_g_keySD["cls"], 1 )
	else
		--定时检查队伍成员的队伍号，如果不符合，则踢出副本
		local oldteamid = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["tem"] )		--取得保存的队伍号
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["scn"] )	--取得副本入口场景号

		for	i=0, membercount-1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 and IsHaveMission( sceneId, mems[i], x808032_g_MissionId ) > 0 then
				if oldteamid ~= GetTeamId( sceneId, mems[i] ) then
					DelMission( sceneId, mems[i], x808032_g_MissionId )			--任务失败,删除之
					x808032_NotifyTip( sceneId, mems[i], "任务失败，你不在正确的队伍中!" )

					x = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["x"] )
					z = LuaFnGetCopySceneData_Param( sceneId, x808032_g_keySD["z"] )
					NewWorld( sceneId, mems[i], oldsceneId, x, z )
				end
			end
		end

	end
end

--**********************************
--醒目提示
--**********************************
function x808032_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--对话窗口信息提示
--**********************************
function x808032_MsgBox( sceneId, selfId, targetId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--醒目提示
--**********************************
function x808032_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
