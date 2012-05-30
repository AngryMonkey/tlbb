--缥缈峰副本....   ____、飞翔 By：403413393 修复

--脚本号
x890063_g_ScriptId = 890063

x890063_g_CopySceneType = FUBEN_SHAOSHISHAN	--副本类型，定义在ScriptGlobal.lua里面

x890063_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x890063_g_NoUserTime	= 10			--副本中没有人后可以继续保存的时间（单位：秒）
x890063_g_Fuben_X			= 128			--进入副本的位置X
x890063_g_Fuben_Z			= 225			--进入副本的位置Z
x890063_g_FuBenTime		= 3*60*60	--副本关闭时间....

--BOSS表....
x890063_g_BOSSList =
{
	["JiuMoZhi_NPC"]				= { DataID=42196, Title="", posX=130, posY=171, Dir=0, BaseAI=3, AIScript=0, ScriptID=890070 },
	["JiuMoZhi_BOSS"]				= { DataID=42197, Title="", posX=130, posY=171, Dir=0, BaseAI=27, AIScript=0, ScriptID=890064 },

	["ZhuangJuXian_NPC"]		= { DataID=42198, Title="", posX=68, posY=121, Dir=0, BaseAI=3, AIScript=0, ScriptID=890071 },
	["ZhuangJuXian_BOSS"]		= { DataID=42199, Title="", posX=68, posY=121, Dir=0, BaseAI=27, AIScript=0, ScriptID=890065 },
	["JiangShi_BOSS"]			= { DataID=42208, Title="", posX=0, posY=0, Dir=0, BaseAI=28, AIScript=0, ScriptID=-1 },

	["MuRongFu_NPC"]				= { DataID=42200, Title="燕王后裔", posX=195, posY=86, Dir=11, BaseAI=3, AIScript=0, ScriptID=890072 },
	["MuRongFuLoss_NPC"]		= { DataID=42201, Title="燕王后裔", posX=117, posY=49, Dir=0, BaseAI=3, AIScript=0, ScriptID=890075 },
	["MuRongFu_BOSS"]			= { DataID=42201, Title="燕王后裔", posX=195, posY=86, Dir=11, BaseAI=27, AIScript=0, ScriptID=890066 },

	["YaoBoDang_BOSS"]		= { DataID=42202, Title="凶神", posX=129, posY=108, Dir=0, BaseAI=27, AIScript=0, ScriptID=890067 },
	["SiMaLing_BOSS"]	= { DataID=42203, Title="恶煞", posX=131, posY=109, Dir=0, BaseAI=27, AIScript=0, ScriptID=890068 },

	["YouDanZhi_BOSS"]		= { DataID=42204, Title="", posX=129, posY=126, Dir=0, BaseAI=0, AIScript=0, ScriptID=890074 },

	["LiFan_NPC"]				= { DataID=42205, Title="", posX=120, posY=115, Dir=27, BaseAI=3, AIScript=0, ScriptID=890073 },

	["DingChunQiu_BOSS"]		= { DataID=42207, Title="少室山室主", posX=129, posY=127, Dir=27, BaseAI=27, AIScript=0, ScriptID=890069 },
}

x890063_g_FightBOSSList =
{
	[1] = x890063_g_BOSSList["JiuMoZhi_BOSS"].DataID,
	[2] = x890063_g_BOSSList["ZhuangJuXian_BOSS"].DataID,
	[3] = x890063_g_BOSSList["MuRongFu_BOSS"].DataID,
	[4] = x890063_g_BOSSList["YaoBoDang_BOSS"].DataID,
	[5] = x890063_g_BOSSList["SiMaLing_BOSS"].DataID,
	[6] = x890063_g_BOSSList["DingChunQiu_BOSS"].DataID
}

--是否可以挑战某个BOSS的标记列表....
x890063_g_BattleFlagTbl = 
{
	["JiuMoZhi"]			= 8,	--是否可以挑战哈大霸...
	["ZhuangJuXian"]	= 9,	--是否可以挑战桑土公....
	["MuRongFu"]			= 10,	--是否可以挑战乌老大....
	["ShuangZi"]		= 11,	--是否可以挑战双子....
	["DingChunQiu"]		= 12,	--是否可以挑战李秋水....
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x890063_g_IDX_BattleFlag_JiuMoZhi			= 8
x890063_g_IDX_BattleFlag_ZhuangJuXian	= 9
x890063_g_IDX_BattleFlag_MuRongFu		= 10
x890063_g_IDX_BattleFlag_Shuangzi		= 11
x890063_g_IDX_BattleFlag_DingChunQiu	= 12

x890063_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x890063_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)

--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x890063_g_IDX_PMFTimerStep			= 15
x890063_g_IDX_PMFTimerScriptID	= 16

--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x890063_g_IDX_MuRongFuDieStep				= 17
x890063_g_IDX_MuRongFuDieScriptID		= 18
x890063_g_IDX_MuRongFuDiePosX				=	19
x890063_g_IDX_MuRongFuDiePosY				=	20


--**********************************
--任务入口函数....
--**********************************
function x890063_OnDefaultEvent( sceneId, selfId, targetId )

	--检测是否可以进入副本....
	local ret, msg = x890063_CheckCanEnter( sceneId, selfId, targetId )
	if 1 ~= ret then
		BeginEvent(sceneId)
			AddText(sceneId,msg)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--关闭NPC对话窗口....
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)

	x890063_MakeCopyScene( sceneId, selfId )

end

--**********************************
--列举事件
--**********************************
function x890063_OnEnumerate( sceneId, selfId, targetId )

	AddNumText( sceneId, x890063_g_ScriptId, "#cFF0000鏖战少室山", 10, 1 )

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x890063_CheckCanEnter( sceneId, selfId, targetId )

	--是否有队伍....
	if LuaFnHasTeam(sceneId,selfId) ~= 1 then
		return 0, "#{PMF_20080521_02}"
	end

	--是不是队长....
	if GetTeamLeader(sceneId,selfId) ~= selfId then
		return 0, "#{PMF_20080521_03}"
	end

	--人数是否够....
	if GetTeamSize(sceneId,selfId) < 1 then
		return 0, "#{PMF_20080521_04}"
	end

	--是否都在附近....
	local NearTeamSize = GetNearTeamCount(sceneId,selfId)
	if GetTeamSize(sceneId,selfId) ~= NearTeamSize then
		return 0, "#{PMF_20080521_05}"
	end

	local Humanlist = {}
	local nHumanNum = 0

	--是否有人不够90级....
	for i=0, NearTeamSize-1 do
		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		if GetLevel( sceneId, PlayerId ) < 90 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    队伍当中的"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "的修为尚浅\，还是不要去为妙。"
		return 0, msg

	end


	--是否有人今天做过3次了....
	nHumanNum = 0
	local CurDayTime = GetDayTime()
	for i=0, NearTeamSize-1 do

		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
		local lastTime = GetMissionData( sceneId, PlayerId, MD_SHUANGXIANGPAO_LASTTIME )
		local lastDayTime = floor( lastTime / 100 )
		local lastDayCount = mod( lastTime, 100 )
	
		if CurDayTime > lastDayTime then
			lastDayTime = CurDayTime
			lastDayCount = 0
		end

		if lastDayCount >= 3 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end

	end

	if nHumanNum > 0 then

		local msg = "    "
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "本日已经挑战过3次少室山了。"
		return 0, msg

	end

	return 1

end

--**********************************
--创建副本....
--**********************************
function x890063_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "cangjingge_80JQTZ.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x890063_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x890063_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x890063_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x890063_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_JiuMoZhi, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_ZhuangJuXian, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_MuRongFu, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_Shuangzi, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_BattleFlag_DingChunQiu, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "cangjingge_80JQTZ_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "cangjingge_80JQTZ_monster.ini" )

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
function x890063_OnCopySceneReady( sceneId, destsceneId )

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

	--统计创建副本次数....
	--AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x890063_OnCopySceneTimer( sceneId, nowTime )

	x890063_TickFubenLife( sceneId, nowTime )

	x890063_TickPMFTimer( sceneId, nowTime )

	x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	x890063_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--有玩家进入副本事件....
--**********************************
function x890063_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x890063_g_Fuben_X, x890063_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
	local lastTime = GetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME )
	local lastDayTime = floor( lastTime / 100 )
	local lastDayCount = mod( lastTime, 100 )
	local CurDayTime = GetDayTime()

	if CurDayTime > lastDayTime then
		lastDayTime = CurDayTime
		lastDayCount = 0
	end

	lastDayCount = lastDayCount + 1
	lastTime = lastDayTime * 100 + lastDayCount
	SetMissionData( sceneId, selfId, MD_SHUANGXIANGPAO_LASTTIME, lastTime )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x890063_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x890063_TipAllHuman( sceneId, Str )

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
--Tick副本生命期....
--**********************************
function x890063_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x890063_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 16 )

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

		return

	end

	if lifeStep == 14 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 15 )
		x890063_TipAllHuman( sceneId, "副本将在1秒後关闭。" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 14 )
		x890063_TipAllHuman( sceneId, "副本将在2秒後关闭。" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 13 )
		x890063_TipAllHuman( sceneId, "副本将在3秒後关闭。" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 12 )
		x890063_TipAllHuman( sceneId, "副本将在4秒後关闭。" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 11 )
		x890063_TipAllHuman( sceneId, "副本将在5秒後关闭。" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 10 )
		x890063_TipAllHuman( sceneId, "副本将在10秒後关闭。" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 9 )
		x890063_TipAllHuman( sceneId, "副本将在30秒後关闭。" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 8 )
		x890063_TipAllHuman( sceneId, "副本将在1分钟後关闭。" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 7 )
		x890063_TipAllHuman( sceneId, "副本将在2分钟後关闭。" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 6 )
		x890063_TipAllHuman( sceneId, "副本将在3分钟後关闭。" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 5 )
		x890063_TipAllHuman( sceneId, "副本将在5分钟後关闭。" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 4 )
		x890063_TipAllHuman( sceneId, "副本将在15分钟後关闭。" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 3 )
		x890063_TipAllHuman( sceneId, "副本将在30分钟後关闭。" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 2 )
		x890063_TipAllHuman( sceneId, "副本将在60分钟後关闭。" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then

		local MstId = x890063_CreateBOSS( sceneId, "JiuMoZhi_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "ZhuangJuXian_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "MuRongFu_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x890063_CreateBOSS( sceneId, "LiFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick缥缈峰计时器....
--**********************************
function x890063_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x890063_OpenPMFTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerScriptID, ScriptID )

end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x890063_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x890063_TickMuRongFuDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnJiuMoZhiDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x890063_OpenMuRongFuDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x890063_g_IDX_MuRongFuDiePosY, posY )

end

--**********************************
--Tick剑舞区域....
--只要玩家站在场景里的6个光柱内....每秒都能获得一个免疫剑舞的buff....
--**********************************
function x890063_TickJianWuArea( sceneId, nowTime )


end

--**********************************
--创建指定BOSS....
--**********************************
function x890063_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x890063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local posX = 0
	local posY = 0
	if x ~= -1 and y ~= -1 then
		posX = x
		posY = y
	else
		posX = BOSSData.posX
		posY = BOSSData.posY
	end

	local MstId = LuaFnCreateMonster( sceneId, BOSSData.DataID, posX, posY, BOSSData.BaseAI, BOSSData.AIScript, BOSSData.ScriptID )
	--SetUnitReputationID(sceneId, selfId, nMonsterId, 29)   --by yaya
	SetUnitCampID(sceneId, MstId, MstId, 110)

	--SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--统计创建BOSS....
	--AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--删除指定BOSS....
--**********************************
function x890063_DeleteBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
	if not BOSSData then
		return
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			--LuaFnDeleteMonster( sceneId, MonsterId )
			LuaFnSendSpecificImpactToUnit(sceneId, MonsterId, MonsterId, MonsterId, 152, 0)
			SetCharacterDieTime( sceneId, MonsterId, 1000 )
		end
	end

end

--**********************************
--寻找指定BOSS....
--**********************************
function x890063_FindBOSS( sceneId, name )

	local BOSSData = x890063_g_BOSSList[name]
	if not BOSSData then
		return -1
	end

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if BOSSData.DataID == GetMonsterDataID( sceneId, MonsterId ) then
			return MonsterId
		end
	end

	return -1

end

--**********************************
--检测当前是否已经存在一个BOSS了....
--**********************************
function x890063_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x890063_g_FightBOSSList do
				if DataID == dataId then
					BossList[nBossNum] = GetName( sceneId, MonsterId )
					nBossNum = nBossNum + 1
				end
			end
		end
	end

	if nBossNum > 0 then
		local msg = "正与"
		for i=0, nBossNum-2 do
			msg = msg .. BossList[i] .. "，"
		end
		msg = msg .. BossList[nBossNum-1] .. "战斗中"
		return 1, msg
	end

	return 0, ""

end

--**********************************
--获取是否可以挑战某个BOSS的标记....
--**********************************
function x890063_GetBossBattleFlag( sceneId, bossName )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--设置是否可以挑战某个BOSS的标记....
--**********************************
function x890063_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x890063_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end
