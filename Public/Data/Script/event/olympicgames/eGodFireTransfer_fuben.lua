--新圣火传递....
--打怪副本....

--脚本号
x808094_g_ScriptId = 808094

x808094_g_CopySceneType = FUBEN_GODFIRE	--副本类型，定义在ScriptGlobal.lua里面

x808094_g_TickTime		= 5			--回调脚本的时钟时间（单位：秒/次）
x808094_g_NoUserTime	= 300		--副本中没有人后可以继续保存的时间（单位：秒）
x808094_g_Fuben_X			= 65		--进入副本的位置X
x808094_g_Fuben_Z			= 65		--进入副本的位置Z


--怪物刷点....
x808094_g_SmallMonsterPos ={ {x=48,z=50},{x=48,z=38},{x=59,z=50},{x=48,z=62},{x=37,z=50} }
x808094_g_BossMonsterPos ={ x=48, z=50 }

--副本数据表....
x808094_g_FubenDataTbl ={ }

x808094_g_FubenDataTbl[1] =
{

	NPCName = "苏飞", MissionId = 1002,
	MonsterName = "篮球", BossName = "小乔乔", BossTitle = "“空中飞人”", FubenName = "进入篮球场",
	MapFile = "lanqiuchang.nav", AreaFile = "lanqiuchang_area.ini", MonsterFile = "lanqiuchang_monster.ini",

	SmallMonsterId =
	{
		9590,9591,9592,9593,9594,9595,9596,9597,9598,9599,
		39571,39572,39573,39574,39575,39576,39577,39578,39579,39580
	},

	BossMonsterId =
	{
		9560,9561,9562,9563,9564,9565,9566,9567,9568,9569,
		39541,39542,39543,39544,39545,39546,39547,39548,39549,39550
	}

}

x808094_g_FubenDataTbl[2] =
{

	NPCName = "刀尧", MissionId = 1006,
	MonsterName = "排球", BossName = "小蕊蕊", BossTitle = "“玻璃美人”", FubenName = "进入排球场",
	MapFile = "paiqiuchang.nav", AreaFile = "paiqiuchang_area.ini", MonsterFile = "paiqiuchang_monster.ini",

	SmallMonsterId =
	{
		9600,9601,9602,9603,9604,9605,9606,9607,9608,9609,
		39581,39582,39583,39584,39585,39586,39587,39588,39589,39590
	},

	BossMonsterId =
	{
		9570,9571,9572,9573,9574,9575,9576,9577,9578,9579,
		39551,39552,39553,39554,39555,39556,39557,39558,39559,39560
	}

}

x808094_g_FubenDataTbl[3] =
{

	NPCName = "周无畏", MissionId = 1010,
	MonsterName = "足球", BossName = "小齐齐", BossTitle = "“盘球大师”", FubenName = "进入足球场",
	MapFile = "zuqiuchang.nav", AreaFile = "zuqiuchang_area.ini", MonsterFile = "zuqiuchang_monster.ini",

	SmallMonsterId =
	{
		9610,9611,9612,9613,9614,9615,9616,9617,9618,9619,
		39591,39592,39593,39594,39595,39596,39597,39598,39599,39600
	},

	BossMonsterId =
	{
		9580,9581,9582,9583,9584,9585,9586,9587,9588,9589,
		39561,39562,39563,39564,39565,39566,39567,39568,39569,39570
	}

}


--**********************************
--任务入口函数....
--**********************************
function x808094_OnDefaultEvent( sceneId, selfId, targetId )

	local NumText = GetNumText()
	if NumText ~= 1 and NumText ~= 2 and NumText ~= 3 then
		return
	end

	local npcName = LuaFnGetName( sceneId, targetId )
	local CopySceneData = x808094_g_FubenDataTbl[ NumText ]
	if npcName ~= CopySceneData.NPCName then
		return
	end

	--检测是否可以进入副本....
	local ret, msg = x808094_CheckCanEnter( sceneId, selfId, targetId, NumText )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--建立副本....
	BeginEvent(sceneId)
		AddText(sceneId,"#{XSHCD_20080418_059}")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	x808094_MakeCopyScene( sceneId, selfId, NumText )

end

--**********************************
--列举事件....
--**********************************
function x808094_OnEnumerate( sceneId, selfId, targetId )

	local npcName = LuaFnGetName( sceneId, targetId )

	for i, fubenData in x808094_g_FubenDataTbl do

		if npcName == fubenData.NPCName then
			if IsHaveMission( sceneId, selfId, fubenData.MissionId ) > 0 then
				local misIndex = GetMissionIndexByID( sceneId, selfId, fubenData.MissionId )
				if 0 == GetMissionParam( sceneId, selfId, misIndex, 0 ) then
					AddNumText( sceneId, x808094_g_ScriptId, fubenData.FubenName, 10, i )
				end
			end
		end

	end

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x808094_CheckCanEnter( sceneId, selfId, targetId, fubenType )

	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{XSHCD_20080418_053}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{XSHCD_20080418_054}"
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 3  then
		return 0, "#{XSHCD_20080418_055}"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{XSHCD_20080418_056}"
	end

	--检测是不是大家都有任务....
	local CopySceneData = x808094_g_FubenDataTbl[ fubenType ]
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )

		if IsHaveMission( sceneId, PlayerId, CopySceneData.MissionId ) <= 0 then
			return 0, "#{XSHCD_20080418_057}"
		end

		local misIndex = GetMissionIndexByID( sceneId, PlayerId, CopySceneData.MissionId )
		if 1 == GetMissionParam( sceneId, PlayerId, misIndex, 0 ) then
			return 0, "#{XSHCD_20080418_058}"
		end

	end

	return 1

end

--**********************************
--创建副本....
--**********************************
function x808094_MakeCopyScene( sceneId, selfId, fubenType )

	local fubenData = x808094_g_FubenDataTbl[ fubenType ]

	--计算副本中怪的等级....
	local mylevel = 0
	local memId
	local tempMemlevel = 0
	local level0 = 0
	local level1 = 0

	local nearmembercount = GetNearTeamCount(sceneId,selfId)
	for	i = 0, nearmembercount - 1 do
		memId = GetNearTeamMember(sceneId, selfId, i)
		tempMemlevel = GetLevel(sceneId, memId)
		level0 = level0 + (tempMemlevel ^ 4 )
		level1 = level1 + (tempMemlevel ^ 3 )
	end

	if level1 == 0 then
		mylevel = 0
	else
		mylevel = level0/level1
	end

	if nearmembercount == -1 then
		mylevel = GetLevel(sceneId, selfId)
	end

	--计算等级段....
	local PlayerMaxLevel = GetHumanMaxLevelLimit()
	local iniLevel
	if mylevel < 10 then
		iniLevel = 1
	elseif mylevel < PlayerMaxLevel then
		iniLevel = floor(mylevel/10)
	else
		iniLevel = PlayerMaxLevel/10
	end

	local x
	local z
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, fubenData.MapFile )
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x808094_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x808094_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x808094_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x808094_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	local monsterIdTbl = fubenData.SmallMonsterId
	local monsterId = monsterIdTbl[1]
	if monsterIdTbl[iniLevel] then
		monsterId = monsterIdTbl[iniLevel]
	end

	local bossIdTbl = fubenData.BossMonsterId
	local bossId = bossIdTbl[1]
	if bossIdTbl[iniLevel] then
		bossId = bossIdTbl[iniLevel]
	end

	LuaFnSetCopySceneData_Param(sceneId, 8, monsterId )	--小怪ID....
	LuaFnSetCopySceneData_Param(sceneId, 9, bossId )		--BOSSID....
	LuaFnSetCopySceneData_Param(sceneId, 10, mylevel )	--副本自适应等级....
	LuaFnSetCopySceneData_Param(sceneId, 11, 0 )				--杀怪数....
	LuaFnSetCopySceneData_Param(sceneId, 12, 0 )				--step....
	LuaFnSetCopySceneData_Param(sceneId, 13, fubenType )--副本类型....

	LuaFnSetSceneLoad_Area( sceneId, fubenData.AreaFile )
	LuaFnSetSceneLoad_Monster( sceneId, fubenData.MonsterFile )

	local bRetSceneID = LuaFnCreateCopyScene(sceneId)
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
--副本事件....
--**********************************
function x808094_OnCopySceneReady( sceneId, destsceneId )

	--进入副本的规则
	-- 1，如果这个玩家没有组队，就传送这个玩家自己进入副本
	-- 2, 如果玩家有队伍，但是玩家不是队长，就传送自己进入副本
	-- 3，如果玩家有队伍，并且这个玩家是队长，就传送自己和附近队友一起进去

	LuaFnSetCopySceneData_Param(destsceneId, 3, sceneId) --设置副本入口场景号
	leaderguid  = LuaFnGetCopySceneData_TeamLeader(destsceneId)
	leaderObjId = LuaFnGuid2ObjId(sceneId,leaderguid)

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x808094_g_Fuben_X, x808094_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x808094_g_Fuben_X, x808094_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x808094_g_Fuben_X, x808094_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x808094_OnCopySceneTimer( sceneId, nowTime )

	local nStep = LuaFnGetCopySceneData_Param(sceneId, 12 )

	--如果刚开始则刷小怪....
	if nStep == 0 then
		x808094_CreateSmallMonster( sceneId )
		LuaFnSetCopySceneData_Param(sceneId, 12, 1 )	--增加nStep....
	end

	--如果杀死了BOSS则倒计时关闭....
	if nStep == 2 then
		x808094_TipAllHuman( sceneId, "副本将在30秒后关闭" )
		LuaFnSetCopySceneData_Param(sceneId, 12, 3 )
	end

	if nStep == 3 then
		LuaFnSetCopySceneData_Param(sceneId, 12, 4 )
	end

	if nStep == 4 then
		x808094_TipAllHuman( sceneId, "副本将在20秒后关闭" )
		LuaFnSetCopySceneData_Param(sceneId, 12, 5 )
	end

	if nStep == 5 then
		LuaFnSetCopySceneData_Param(sceneId, 12, 6 )
	end

	if nStep == 6 then
		x808094_TipAllHuman( sceneId, "副本将在10秒后关闭" )
		LuaFnSetCopySceneData_Param(sceneId, 12, 7 )
	end

	if nStep == 7 then
		x808094_TipAllHuman( sceneId, "副本将在5秒后关闭" )
		LuaFnSetCopySceneData_Param(sceneId, 12, 8 )
	end

	--时间到了踢人....
	if nStep == 8 then
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		local oldSceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )
		local oldX = LuaFnGetCopySceneData_Param( sceneId, 4 )
		local oldZ = LuaFnGetCopySceneData_Param( sceneId, 5 )
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				NewWorld( sceneId, PlayerId, oldSceneId, oldX, oldZ )
			end
		end
		LuaFnSetCopySceneData_Param(sceneId, 12, 9 )
	end

end

--**********************************
--怪物死亡....
--**********************************
function x808094_OnDie( sceneId, objId, killerId )

	local szName = GetName(sceneId, objId)

	local fubenType = LuaFnGetCopySceneData_Param( sceneId, 13 )
	if fubenType~=1 and fubenType~=2 and fubenType~=3 then
		return
	end
	local fubenData = x808094_g_FubenDataTbl[ fubenType ]


	--如果杀死的是小怪则增加计数....
	if szName == fubenData.MonsterName then

		--设置副本计数....
		local nKillNum = LuaFnGetCopySceneData_Param( sceneId, 11 )
		nKillNum = nKillNum + 1
		local str = "已击败"..szName.."："..nKillNum .."/5"
		x808094_TipAllHuman( sceneId, str )
		LuaFnSetCopySceneData_Param( sceneId, 11, nKillNum )

		--如果杀够了则创建大BOSS....
		if nKillNum == getn(x808094_g_SmallMonsterPos) then
			x808094_CreateBossMonster( sceneId )
		end

		--为所有人设置任务计数....
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				if IsHaveMission( sceneId, PlayerId, fubenData.MissionId ) > 0 then
					local misIndex = GetMissionIndexByID( sceneId, PlayerId, fubenData.MissionId )
					SetMissionByIndex( sceneId, PlayerId, misIndex, 1, nKillNum )
				end
			end
		end


	--如果杀死的是BOSS则关闭副本....
	elseif szName == fubenData.BossName then

		--关闭副本....
		LuaFnSetCopySceneData_Param(sceneId, 12, 2 )

		local str = "已击败"..szName
		x808094_TipAllHuman( sceneId, str )

		--为所有人设置任务计数....
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
				if IsHaveMission( sceneId, PlayerId, fubenData.MissionId ) > 0 then
					local misIndex = GetMissionIndexByID( sceneId, PlayerId, fubenData.MissionId )
					SetMissionByIndex( sceneId, PlayerId, misIndex, 2, 1 )
				end
			end
		end

	end


end

--**********************************
--有玩家进入副本事件....
--**********************************
function x808094_OnPlayerEnter( sceneId, selfId )

	--设置任务完成....
	local fubenType = LuaFnGetCopySceneData_Param( sceneId, 13 )
	if fubenType~=1 and fubenType~=2 and fubenType~=3 then
		return
	end
	local fubenData = x808094_g_FubenDataTbl[ fubenType ]

	if IsHaveMission( sceneId, selfId, fubenData.MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, fubenData.MissionId )
		SetMissionByIndex( sceneId, selfId, misIndex, 0, 1 )
	end

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x808094_g_Fuben_X, x808094_g_Fuben_Z )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x808094_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x808094_TipAllHuman( sceneId, Str )

	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			BeginEvent(sceneId)
				AddText(sceneId, Str)
			EndEvent(sceneId)
			DispatchMissionTips(sceneId, PlayerId)
		end
	end

end

--**********************************
--创建小怪....
--**********************************
function x808094_CreateSmallMonster( sceneId )

	local fubenType = LuaFnGetCopySceneData_Param( sceneId, 13 )
	if fubenType~=1 and fubenType~=2 and fubenType~=3 then
		return
	end
	local fubenData = x808094_g_FubenDataTbl[ fubenType ]

	local MstId = LuaFnGetCopySceneData_Param( sceneId, 8 )
	local MstLevel = LuaFnGetCopySceneData_Param( sceneId, 10 )

	for i, pos in x808094_g_SmallMonsterPos do
		local objId = LuaFnCreateMonster( sceneId, MstId, pos.x, pos.z, 3, 0, 808094 )
		SetLevel( sceneId, objId, MstLevel )
		SetCharacterName( sceneId, objId, fubenData.MonsterName )
	end

end

--**********************************
--创建BOSS....
--**********************************
function x808094_CreateBossMonster( sceneId )

	local fubenType = LuaFnGetCopySceneData_Param( sceneId, 13 )
	if fubenType~=1 and fubenType~=2 and fubenType~=3 then
		return
	end
	local fubenData = x808094_g_FubenDataTbl[ fubenType ]

	local MstId = LuaFnGetCopySceneData_Param( sceneId, 9 )
	local MstLevel = LuaFnGetCopySceneData_Param( sceneId, 10 )

	local objId = LuaFnCreateMonster( sceneId, MstId, x808094_g_BossMonsterPos.x, x808094_g_BossMonsterPos.z, 0, 0, 808094 )
	SetLevel( sceneId, objId, MstLevel )
	SetCharacterName( sceneId, objId, fubenData.BossName )
	SetCharacterTitle(sceneId, objId, fubenData.BossTitle)

end
