--缥缈峰副本....

--脚本号
x402082_g_ScriptId = 402082

x402082_g_CopySceneType = FUBEN_BINGSHENGQIZHEN	--副本类型，定义在ScriptGlobal.lua里面

x402082_g_TickTime		= 1				--回调脚本的时钟时间（单位：秒/次）
x402082_g_NoUserTime	= 300			--副本中没有人后可以继续保存的时间（单位：秒）
x402082_g_Fuben_X			= 128			--进入副本的位置X
x402082_g_Fuben_Z			= 141			--进入副本的位置Z
x402082_g_FuBenTime		= 3*60*60	--副本关闭时间....

--BOSS表....
x402082_g_BOSSList =
{
	["HaDaBa_NPC"]				= { DataID=15106, Title="", posX=50, posY=53, Dir=0, BaseAI=3, AIScript=0, ScriptID=402075 },--萧逸风
	["HaDaBa1_BOSS"]				= { DataID=15106, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa2_BOSS"]				= { DataID=15107, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa3_BOSS"]				= { DataID=15108, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa4_BOSS"]				= { DataID=15109, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["HaDaBa5_BOSS"]				= { DataID=15110, Title="", posX=50, posY=53, Dir=0, BaseAI=27, AIScript=0, ScriptID=402070 },
	["fengzhenshouwei1_BOSS"]				= { DataID=15103, Title="", posX=42, posY=53, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei2_BOSS"]				= { DataID=15103, Title="", posX=51, posY=45, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei3_BOSS"]				= { DataID=15103, Title="", posX=58, posY=50, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei4_BOSS"]				= { DataID=15103, Title="", posX=57, posY=60, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["fengzhenshouwei5_BOSS"]				= { DataID=15103, Title="", posX=49, posY=59, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },

	["SangTuGong_NPC"]		= { DataID=15126, Title="", posX=173, posY=36, Dir=0, BaseAI=3, AIScript=0, ScriptID=402076 },--萧如筠
	["SangTuGong1_BOSS"]		= { DataID=15126, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong2_BOSS"]		= { DataID=15127, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong3_BOSS"]		= { DataID=15128, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong4_BOSS"]		= { DataID=15129, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["SangTuGong5_BOSS"]		= { DataID=15130, Title="", posX=173, posY=36, Dir=0, BaseAI=27, AIScript=0, ScriptID=402071 },
	["linzhenshouwei1_BOSS"]				= { DataID=15123, Title="", posX=168, posY=34, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei2_BOSS"]				= { DataID=15123, Title="", posX=173, posY=29, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei3_BOSS"]				= { DataID=15123, Title="", posX=178, posY=35, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei4_BOSS"]				= { DataID=15123, Title="", posX=177, posY=41, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei5_BOSS"]				= { DataID=15123, Title="", posX=167, posY=39, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["JiangShi_BOSS"]			= { DataID=15143, Title="", posX=0, posY=0, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },

	["WuLaoDa_NPC"]				= { DataID=15131, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402077 },--萧如蔚
	["WuLaoDa1_BOSS"]		= { DataID=15131, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa2_BOSS"]		= { DataID=15132, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa3_BOSS"]		= { DataID=15133, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa4_BOSS"]		= { DataID=15134, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["WuLaoDa5_BOSS"]		= { DataID=15135, Title="", posX=173, posY=99, Dir=0, BaseAI=3, AIScript=0, ScriptID=402072 },
	["linzhenshouwei6_BOSS"]				= { DataID=15123, Title="", posX=166, posY=101, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei7_BOSS"]				= { DataID=15123, Title="", posX=172, posY=96, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei8_BOSS"]				= { DataID=15123, Title="", posX=176, posY=100, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei9_BOSS"]				= { DataID=15123, Title="", posX=175, posY=104, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["linzhenshouwei10_BOSS"]				= { DataID=15123, Title="", posX=170, posY=104, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["WuLaoDaLoss_NPC"]			= { DataID=15131, Title="", posX=117, posY=49, Dir=11, BaseAI=27, AIScript=0, ScriptID=402079 },

	["ZhuoBuFan_NPC"]			= { DataID=15171, Title="", posX=192, posY=195, Dir=0, BaseAI=3, AIScript=0, ScriptID=402078 },--耶律焱
	["ZhuoBuFan1_BOSS"]		= { DataID=15171, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan2_BOSS"]		= { DataID=15172, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan3_BOSS"]		= { DataID=15173, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan4_BOSS"]		= { DataID=15174, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["ZhuoBuFan5_BOSS"]		= { DataID=15175, Title="", posX=192, posY=195, Dir=0, BaseAI=27, AIScript=0, ScriptID=402073 },
	["huozhenshouwei1_BOSS"]				= { DataID=15168, Title="", posX=186, posY=195, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei2_BOSS"]				= { DataID=15168, Title="", posX=192, posY=190, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei3_BOSS"]				= { DataID=15168, Title="", posX=196, posY=193, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei4_BOSS"]				= { DataID=15168, Title="", posX=195, posY=197, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["huozhenshouwei5_BOSS"]				= { DataID=15168, Title="", posX=187, posY=199, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["BuPingDaoRen_BOSS"]	= { DataID=9545, Title="蛟王", posX=129, posY=31, Dir=0, BaseAI=27, AIScript=261, ScriptID=402268 },

	["DuanMuYuan_BOSS"]		= { DataID=9547, Title="", posX=125, posY=36, Dir=0, BaseAI=0, AIScript=0, ScriptID=402274 },

	["LiQiuShui_NPC"]				= { DataID=15186, Title="", posX=52, posY=203, Dir=11, BaseAI=3, AIScript=0, ScriptID=402079 },--耶律连城
	["LiQiuShui1_BOSS"]		= { DataID=15186, Title="契丹大将军", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui2_BOSS"]		= { DataID=15187, Title="契丹大将军", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui3_BOSS"]		= { DataID=15188, Title="契丹大将军", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui4_BOSS"]		= { DataID=15189, Title="契丹大将军", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["LiQiuShui5_BOSS"]		= { DataID=15190, Title="契丹大将军", posX=52, posY=203, Dir=11, BaseAI=27, AIScript=0, ScriptID=402074 },
	["yuanshen_BOSS"]				= { DataID=15198, Title="", posX=50, posY=200, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
	["tiegu_BOSS"]				= { DataID=15183, Title="", posX=54, posY=206, Dir=0, BaseAI=0, AIScript=0, ScriptID=-1 },
}

x402082_g_FightBOSSList =
{
	[1] = x402082_g_BOSSList["HaDaBa1_BOSS"].DataID,
	[2] = x402082_g_BOSSList["HaDaBa2_BOSS"].DataID,
	[3] = x402082_g_BOSSList["HaDaBa3_BOSS"].DataID,
	[4] = x402082_g_BOSSList["HaDaBa4_BOSS"].DataID,
	[5] = x402082_g_BOSSList["HaDaBa5_BOSS"].DataID,
	[6] = x402082_g_BOSSList["SangTuGong1_BOSS"].DataID,
	[7] = x402082_g_BOSSList["SangTuGong2_BOSS"].DataID,
	[8] = x402082_g_BOSSList["SangTuGong3_BOSS"].DataID,
	[9] = x402082_g_BOSSList["SangTuGong4_BOSS"].DataID,
	[10] = x402082_g_BOSSList["SangTuGong5_BOSS"].DataID,	
	[11] = x402082_g_BOSSList["WuLaoDa1_BOSS"].DataID,
	[12] = x402082_g_BOSSList["WuLaoDa2_BOSS"].DataID,
	[13] = x402082_g_BOSSList["WuLaoDa3_BOSS"].DataID,
	[14] = x402082_g_BOSSList["WuLaoDa4_BOSS"].DataID,
	[15] = x402082_g_BOSSList["WuLaoDa5_BOSS"].DataID,
	[16] = x402082_g_BOSSList["ZhuoBuFan1_BOSS"].DataID,
	[17] = x402082_g_BOSSList["ZhuoBuFan2_BOSS"].DataID,
	[18] = x402082_g_BOSSList["ZhuoBuFan3_BOSS"].DataID,
	[19] = x402082_g_BOSSList["ZhuoBuFan4_BOSS"].DataID,
	[20] = x402082_g_BOSSList["ZhuoBuFan5_BOSS"].DataID,
	[21] = x402082_g_BOSSList["LiQiuShui1_BOSS"].DataID,
	[22] = x402082_g_BOSSList["LiQiuShui2_BOSS"].DataID,
	[23] = x402082_g_BOSSList["LiQiuShui3_BOSS"].DataID,
	[24] = x402082_g_BOSSList["LiQiuShui4_BOSS"].DataID,
	[25] = x402082_g_BOSSList["LiQiuShui5_BOSS"].DataID,
	
}

--是否可以挑战某个BOSS的标记列表....
x402082_g_BattleFlagTbl = 
{
	["HaDaBa"]			= 8,	--是否可以挑战哈大霸...
	["SangTuGong"]	= 9,	--是否可以挑战桑土公....
	["WuLaoDa"]			= 10,	--是否可以挑战乌老大....
	["ZhuoBuFan"]		= 11,	--是否可以挑战卓不凡....
	["LiQiuShui"]		= 12,	--是否可以挑战李秋水....
}

--场景变量索引....是否可以挑战某个BOSS的标记....
-- 0=不能挑战 1=可以挑战 2=已经挑战过了
x402082_g_IDX_BattleFlag_Hadaba			= 8
x402082_g_IDX_BattleFlag_Sangtugong	= 9
x402082_g_IDX_BattleFlag_Wulaoda		= 10
x402082_g_IDX_BattleFlag_ZhuoBuFan		= 11
x402082_g_IDX_BattleFlag_Liqiushui	= 12

x402082_g_IDX_FuBenOpenTime		= 13	--副本建立的时间....
x402082_g_IDX_FuBenLifeStep		= 14	--副本生命期的step....(包括建立NPC....关闭倒计时提示....)

--场景变量索引....通用的缥缈峰计时器....主要用于激活BOSS战斗....
x402082_g_IDX_PMFTimerStep			= 15
x402082_g_IDX_PMFTimerScriptID	= 16

--场景变量索引....乌老大死亡的计时器....用于处理死亡逻辑....
x402082_g_IDX_WuLaoDaDieStep				= 17
x402082_g_IDX_WuLaoDaDieScriptID		= 18
x402082_g_IDX_WuLaoDaDiePosX				=	19
x402082_g_IDX_WuLaoDaDiePosY				=	20


--**********************************
--任务入口函数....
--**********************************
function x402082_OnDefaultEvent( sceneId, selfId, targetId )

	--检测是否可以进入副本....
	local ret, msg = x402082_CheckCanEnter( sceneId, selfId, targetId )
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

	x402082_MakeCopyScene( sceneId, selfId )

end

--**********************************
--列举事件
--**********************************
function x402082_OnEnumerate( sceneId, selfId, targetId )

--	AddNumText( sceneId, x402082_g_ScriptId, "挑战缥缈峰", 10, 1 )

end

--**********************************
--检测是否可以进入此副本....
--**********************************
function x402082_CheckCanEnter( sceneId, selfId, targetId )

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
		if GetLevel( sceneId, PlayerId ) < 80 then
			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
			nHumanNum = nHumanNum + 1
		end
	end

	if nHumanNum > 0 then

		local msg = "    队伍当中的"
		for i=0, nHumanNum-2 do
			msg = msg .. Humanlist[i] .. "，"
		end
		msg = msg .. Humanlist[nHumanNum-1] .. "的修为尚浅，还是不要去为妙。"
		return 0, msg

	end


	--是否有人今天做过3次了....
--	nHumanNum = 0
--	local CurDayTime = GetDayTime()
--	for i=0, NearTeamSize-1 do

--		local PlayerId = GetNearTeamMember( sceneId, selfId, i )
--		local lastTime = GetMissionData( sceneId, PlayerId, MD_PIAOMIAOFENG_LASTTIME )
--		local lastDayTime = floor( lastTime / 100 )
--		local lastDayCount = mod( lastTime, 100 )
	
--		if CurDayTime > lastDayTime then
--			lastDayTime = CurDayTime
--			lastDayCount = 0
--		end

--		if lastDayCount >= 5 then
--			Humanlist[nHumanNum] = GetName( sceneId, PlayerId )
--			nHumanNum = nHumanNum + 1
--		end

--	end

--	if nHumanNum > 0 then

--		local msg = "    "
--		for i=0, nHumanNum-2 do
--			msg = msg .. Humanlist[i] .. "，"
--		end
--		msg = msg .. Humanlist[nHumanNum-1] .. "本日已经挑战过5次缥缈峰了。"
--		return 0, msg

--	end

	return 1

end

--**********************************
--创建副本....
--**********************************
function x402082_MakeCopyScene( sceneId, selfId )

	local x = 0
	local z = 0
	x,z = LuaFnGetWorldPos(sceneId,selfId)
	leaderguid=LuaFnObjId2Guid(sceneId,selfId)

	LuaFnSetSceneLoad_Map(sceneId, "BattleField.nav")
	LuaFnSetCopySceneData_TeamLeader(sceneId, leaderguid)
	LuaFnSetCopySceneData_NoUserCloseTime(sceneId, x402082_g_NoUserTime*1000)
	LuaFnSetCopySceneData_Timer(sceneId, x402082_g_TickTime*1000)
	LuaFnSetCopySceneData_Param(sceneId, 0, x402082_g_CopySceneType)
	LuaFnSetCopySceneData_Param(sceneId, 1, x402082_g_ScriptId)
	LuaFnSetCopySceneData_Param(sceneId, 2, 0)
	LuaFnSetCopySceneData_Param(sceneId, 3, sceneId)
	LuaFnSetCopySceneData_Param(sceneId, 4, x)
	LuaFnSetCopySceneData_Param(sceneId, 5, z)
	LuaFnSetCopySceneData_Param(sceneId, 6, GetTeamId(sceneId,selfId))
	LuaFnSetCopySceneData_Param(sceneId, 7, 0)

	for i=8, 31 do
		LuaFnSetCopySceneData_Param(sceneId, i, 0)
	end

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Hadaba, 1 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Sangtugong, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Wulaoda, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_ZhuoBuFan, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_BattleFlag_Liqiushui, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenOpenTime, LuaFnGetCurrentTime() )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 0 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, -1 )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, -1 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, 0 )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, 0 )

	LuaFnSetSceneLoad_Area( sceneId, "BattleField_area.ini" )
	LuaFnSetSceneLoad_Monster( sceneId, "BattleField_monster.ini" )

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
function x402082_OnCopySceneReady( sceneId, destsceneId )

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
	AuditPMFCreateFuben( sceneId, leaderObjId )

	if LuaFnHasTeam( sceneId, leaderObjId ) == 0  then
		NewWorld( sceneId, leaderObjId, destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z) ;
	else
		if IsCaptain(sceneId, leaderObjId) == 0  then
			NewWorld( sceneId, leaderObjId, destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z) ;
		else
			local	nearteammembercount = GetNearTeamCount( sceneId, leaderObjId) 
			local mems = {}
			for	i=0,nearteammembercount-1 do
				mems[i] = GetNearTeamMember(sceneId, leaderObjId, i)
				NewWorld( sceneId, mems[i], destsceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z)
			end
		end		
	end

end

--**********************************
--副本场景定时器事件....
--**********************************
function x402082_OnCopySceneTimer( sceneId, nowTime )

	x402082_TickFubenLife( sceneId, nowTime )

	x402082_TickPMFTimer( sceneId, nowTime )

	x402082_TickWuLaoDaDieTimer( sceneId, nowTime )

	x402082_TickJianWuArea( sceneId, nowTime )

end

--**********************************
--有玩家进入副本事件....
--**********************************
function x402082_OnPlayerEnter( sceneId, selfId )

	--设置死亡事件....
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", sceneId, x402082_g_Fuben_X, x402082_g_Fuben_Z )

	--设置挑战过一次缥缈峰....
--	local lastTime = GetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_LASTTIME )
--	local lastDayTime = floor( lastTime / 100 )
--	local lastDayCount = mod( lastTime, 100 )
--	local CurDayTime = GetDayTime()

--	if CurDayTime > lastDayTime then
--		lastDayTime = CurDayTime
--		lastDayCount = 0
--	end

--	lastDayCount = lastDayCount + 1
--	lastTime = lastDayTime * 100 + lastDayCount
--	SetMissionData( sceneId, selfId, MD_PIAOMIAOFENG_LASTTIME, lastTime )

end

--**********************************
--有玩家在副本中死亡事件....
--**********************************
function x402082_OnHumanDie( sceneId, selfId, killerId )
	
end

--**********************************
--提示所有副本内玩家....
--**********************************
function x402082_TipAllHuman( sceneId, Str )

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
function x402082_TickFubenLife( sceneId, nowTime )

	local openTime = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenOpenTime )
	local leftTime = openTime + x402082_g_FuBenTime - LuaFnGetCurrentTime()
	local lifeStep = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep )

	if lifeStep == 15 then

		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 16 )

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
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 15 )
		x402082_TipAllHuman( sceneId, "副本将在1秒后关闭。" )
		return
	end

	if lifeStep == 13 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 14 )
		x402082_TipAllHuman( sceneId, "副本将在2秒后关闭。" )
		return
	end

	if lifeStep == 12 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 13 )
		x402082_TipAllHuman( sceneId, "副本将在3秒后关闭。" )
		return
	end

	if lifeStep == 11 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 12 )
		x402082_TipAllHuman( sceneId, "副本将在4秒后关闭。" )
		return
	end

	if lifeStep == 10 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 11 )
		x402082_TipAllHuman( sceneId, "副本将在5秒后关闭。" )
		return
	end

	if leftTime <= 10 and lifeStep == 9 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 10 )
		x402082_TipAllHuman( sceneId, "副本将在10秒后关闭。" )
		return
	end

	if leftTime <= 30 and lifeStep == 8 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 9 )
		x402082_TipAllHuman( sceneId, "副本将在30秒后关闭。" )
		return
	end

	if leftTime <= 60 and lifeStep == 7 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 8 )
		x402082_TipAllHuman( sceneId, "副本将在1分钟后关闭。" )
		return
	end

	if leftTime <= 120 and lifeStep == 6 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 7 )
		x402082_TipAllHuman( sceneId, "副本将在2分钟后关闭。" )
		return
	end

	if leftTime <= 180 and lifeStep == 5 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 6 )
		x402082_TipAllHuman( sceneId, "副本将在3分钟后关闭。" )
		return
	end

	if leftTime <= 300 and lifeStep == 4 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 5 )
		x402082_TipAllHuman( sceneId, "副本将在5分钟后关闭。" )
		return
	end

	if leftTime <= 900 and lifeStep == 3 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 4 )
		x402082_TipAllHuman( sceneId, "副本将在15分钟后关闭。" )
		return
	end

	if leftTime <= 1800 and lifeStep == 2 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 3 )
		x402082_TipAllHuman( sceneId, "副本将在30分钟后关闭。" )
		return
	end

	if leftTime <= 3600 and lifeStep == 1 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 2 )
		x402082_TipAllHuman( sceneId, "副本将在60分钟后关闭。" )
		return
	end

	--初始化副本内的NPC....
	if lifeStep == 0 then

		local MstId = x402082_CreateBOSS( sceneId, "HaDaBa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "SangTuGong_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "WuLaoDa_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "ZhuoBuFan_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		MstId = x402082_CreateBOSS( sceneId, "LiQiuShui_NPC", -1, -1 )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )

		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_FuBenLifeStep, 1 )

		return
	end

end

--**********************************
--Tick缥缈峰计时器....
--**********************************
function x402082_TickPMFTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep )
	if step <= 0 then
		return
	end
	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnPMFTimer", sceneId, step )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, -1 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, step )
	end

end

--**********************************
--开启缥缈峰计时器....
--**********************************
function x402082_OpenPMFTimer( sceneId, allstep, ScriptID )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerScriptID, ScriptID )

end

--**********************************
--当前缥缈峰计时器是否激活....
--**********************************
function x402082_IsPMFTimerRunning( sceneId )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_PMFTimerStep )
	if step > 0 then
		return 1
	else
		return 0
	end

end

--**********************************
--Tick乌老大死亡计时器....
--**********************************
function x402082_TickWuLaoDaDieTimer( sceneId, nowTime )

	local step = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep )
	if step <= 0 then
		return
	end

	local scriptID = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID )
	local posX = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX )
	local posY = LuaFnGetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY )

	--回调指定脚本的OnTimer....
	CallScriptFunction( scriptID, "OnHaDaBaDieTimer", sceneId, step, posX, posY )

	--如果已经走完所有step则关闭计时器....
	step = step - 1
	if step <= 0 then
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, -1 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, 0 )
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, 0 )
	else
		LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, step )
	end

end

--**********************************
--开启乌老大死亡计时器....
--**********************************
function x402082_OpenWuLaoDaDieTimer( sceneId, allstep, ScriptID, posX, posY )

	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieStep, allstep )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDieScriptID, ScriptID )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosX, posX )
	LuaFnSetCopySceneData_Param( sceneId, x402082_g_IDX_WuLaoDaDiePosY, posY )

end

--**********************************
--Tick剑舞区域....
--只要玩家站在场景里的6个光柱内....每秒都能获得一个免疫剑舞的buff....
--**********************************
function x402082_TickJianWuArea( sceneId, nowTime )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then

			local x,z = GetWorldPos( sceneId, nHumanId )
			local buff1 = -1
			local buff2 = 10376

			if x>=62 and x<=66 and z>=214 and z<=218 then
				buff1 = 10370
			elseif x>=53 and x<=57 and z>=217 and z<=221 then
				buff1 = 10374
			elseif x>=43 and x<=47 and z>=214 and z<=218 then
				buff1 = 10375
			elseif x>=38 and x<=42 and z>=203 and z<=207 then
				buff1 = 10371
			elseif x>=42 and x<=46 and z>=193 and z<=197 then
				buff1 = 10373
			elseif x>=52 and x<=56 and z>=188 and z<=192 then
				buff1 = 10372
			end

			if buff1 ~= -1 then
				LuaFnSendSpecificImpactToUnit(sceneId, nHumanId, nHumanId, nHumanId, buff1, 0)
				LuaFnSendSpecificImpactToUnit(sceneId, nHumanId, nHumanId, nHumanId, buff2, 0)
			end

		end
	end

end

--**********************************
--创建指定BOSS....
--**********************************
function x402082_CreateBOSS( sceneId, name, x, y )

	local BOSSData = x402082_g_BOSSList[name]
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
	SetObjDir( sceneId, MstId, BOSSData.Dir )
	SetMonsterFightWithNpcFlag( sceneId, MstId, 0 )
	if BOSSData.Title ~= "" then
		SetCharacterTitle(sceneId, MstId, BOSSData.Title)
	end

	LuaFnSendSpecificImpactToUnit(sceneId, MstId, MstId, MstId, 152, 0)

	--统计创建BOSS....
	AuditPMFCreateBoss( sceneId, BOSSData.DataID )

	return MstId

end

--**********************************
--删除指定BOSS....
--**********************************
function x402082_DeleteBOSS( sceneId, name )

	local BOSSData = x402082_g_BOSSList[name]
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
function x402082_FindBOSS( sceneId, name )

	local BOSSData = x402082_g_BOSSList[name]
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
function x402082_CheckHaveBOSS( sceneId )

	local BossList = {}
	local nBossNum = 0

	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			local DataID = GetMonsterDataID( sceneId, MonsterId )
			for j, dataId in x402082_g_FightBOSSList do
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
function x402082_GetBossBattleFlag( sceneId, bossName )

	local idx = x402082_g_BattleFlagTbl[ bossName ]
	return LuaFnGetCopySceneData_Param( sceneId, idx )

end

--**********************************
--设置是否可以挑战某个BOSS的标记....
--**********************************
function x402082_SetBossBattleFlag( sceneId, bossName, bCan )

	local idx = x402082_g_BattleFlagTbl[ bossName ]
	LuaFnSetCopySceneData_Param( sceneId, idx, bCan )

end