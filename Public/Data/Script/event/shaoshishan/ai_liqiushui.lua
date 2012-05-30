--飘渺峰 李秋水AI

--A 【小无相功】给自己用个空技能....再给随机给一个玩家失明....
--B 【剑舞】给自己用一个空技能....接下来15s内依次给全副本玩家加伤害值逐渐加大的伤害buff....
--C 【洒脱】给自己用一个清buff的技能....
--D 【冰爆】给自己用个空技能....再给随机给玩家脚下放个陷阱....
--E 【狂暴】给自己加疯狂的buff....不再使用其他技能....

--全程都带有免疫制定技能的buff....
--战斗开始同时每隔10秒用A技能....
--当HP降为66%和33%时分别使用B技能....B技能的持续时间内....其它技能CD到了不使用....
--每隔20秒用C技能....
--每隔20秒用D技能....


--脚本号
x890069_g_ScriptId	= 890069

--副本逻辑脚本号....
x890069_g_FuBenScriptId = 890063


--免疫特定技能buff....
x890069_Buff_MianYi1	= 10472	--免疫一些负面效果....
x890069_Buff_MianYi2	= 10471	--免疫普通隐身....

--A小无相功....
x890069_SkillA_ID			= 1042
x890069_SkillA_Buff		=	10271
x890069_SkillA_CD			= 80000

--B剑舞....
x890069_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047, 1048 }
x890069_SkillB_WeatherTbl = { 11, 12, 13, 14, 15, 16 }
x890069_SkillB_TalkTbl =
{
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！",
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！",
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！",
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！",
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！",
	"你们这些人真的很无聊，让你们瞧瞧我#Y丁春秋#W的厉害！"
}

x890069_SkillB_BuffIDTbl =
{
	[1] = {10280,10281,10282,10283,10284,10285,10286,10287,10288,10289,10290,10291,10292,10293,10294},
	[2] = {10295,10296,10297,10298,10299,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309},
	[3] = {10310,10311,10312,10313,10314,10315,10316,10317,10318,10319,10320,10321,10322,10323,10324},
	[4] = {10325,10326,10327,10328,10329,10330,10331,10332,10333,10334,10335,10336,10337,10338,10339},
	[5] = {10340,10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353,10354},
	[6] = {10355,10356,10357,10358,10359,10360,10361,10362,10363,10364,10365,10366,10367,10368,10369}
}

--C洒脱....
x890069_SkillC_ID		= 645
x890069_SkillC_CD		= 20000

--D冰爆....
x890069_SkillD_ID		= 643
x890069_SkillD_CD		= 20000
x890069_SkillD_SpecObj = 59

--E狂暴....
x890069_SkillE_Buff1	= 10234
x890069_SkillE_Buff2	= 10235
--开始进入狂暴状态的时间....
x890069_EnterKuangBaoTime	= 10*60*1000


--AI Index....
x890069_IDX_StopWatch						= 1	--秒表....
x890069_IDX_SkillA_CD						= 2	--A技能的CD时间....
x890069_IDX_SkillB_HPStep				= 3	--血量级别....
x890069_IDX_SkillB_Step					= 4	--B技能的Step....0=未发动 15=buff1 14=buff2 …… 1=buff15
x890069_IDX_SkillB_Type					= 5	--当前正在使用哪种类型的剑舞....
x890069_IDX_SkillC_CD						= 6	--C技能的CD时间....
x890069_IDX_SkillD_CD						= 7	--C技能的CD时间....
x890069_IDX_KuangBaoTimer				= 8	--狂暴的计时器....


x890069_IDX_CombatFlag 			= 1	--是否处于战斗状态的标志....
x890069_IDX_IsKuangBaoMode	= 2	--是否处于狂暴模式的标志....


--**********************************
--初始化....
--**********************************
function x890069_OnInit(sceneId, selfId)
	--重置AI....
	x890069_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x890069_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag ) then
		return
	end

	--狂暴状态不需要走逻辑....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890069_IDX_IsKuangBaoMode ) then
		return
	end

	--A技能心跳....
	if 1 == x890069_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B技能心跳....
	if 1 == x890069_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C技能心跳....
	if 1 == x890069_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D技能心跳....
	if 1 == x890069_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E技能心跳....
	if 1 == x890069_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--秒表心跳....
	x890069_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--进入战斗....
--**********************************
function x890069_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_Buff_MianYi2, 0 )

	--重置AI....
	x890069_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x890069_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x890069_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x890069_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x890069_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x890069_ResetMyAI( sceneId, selfId )

	--设置已经挑战过李秋水....
	CallScriptFunction( x890069_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "DingChunQiu", 2 )

	-- zchw 全球公告
	local	playerName	= GetName( sceneId, killerId )
	
	--杀死怪物的是宠物则获取其主人的名字....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--如果玩家组队了则获取队长的名字....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("少室山上一阵雷鸣电闪，轰隆隆的雷声从天空传来，#G原来是#{_INFOUSR%s}带领的队伍正和丁春秋激战。#W激战中，丁春秋一不留神，被#{_INFOUSR%s}一下戳中了死穴，一头栽在地上，倒地不起。众人连忙上前抢夺其掉落的财宝！", playerName, playerName); --李秋水
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--重置AI....
--**********************************
function x890069_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillC_CD, x890069_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillD_CD, x890069_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A技能心跳....
--**********************************
function x890069_TickSkillA( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillA_CD, x890069_SkillA_CD-(nTick-cd) )
		return x890069_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B技能心跳....
--**********************************
function x890069_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent <= 0.3333 then
		CurStep = 2
	elseif CurPercent <= 0.6666 then
		CurStep = 1
	end

	if CurStep > LastStep then

		--设置参数....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step, 15 )
		local JianWuType = random( getn(x890069_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Type, JianWuType )

		--喊话....
		MonsterTalk(sceneId, -1, "", x890069_SkillB_TalkTbl[JianWuType] )

		--放全场景烟花....
		LuaFnSetSceneWeather(sceneId, x890069_SkillB_WeatherTbl[JianWuType], 15000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 9, 130, 127, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 9, 130, 125, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 11, 130, 129, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 11, 137, 132, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 11, 138, 121, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 11, 121, 121, 3000 )
		CreateSpecialObjByDataIndex(sceneId, selfId, 11, 120, 133, 3000 )

		--对自己使用空技能....
		--local x,z = GetWorldPos( sceneId, selfId )
		--LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillB_SkillIDTbl[JianWuType], selfId, x, z, 0, 1 )

		return 1

	end

	return 0

end

--**********************************
--C技能心跳....
--**********************************
function x890069_TickSkillC( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillC_CD, x890069_SkillC_CD-(nTick-cd) )
		return x890069_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D技能心跳....
--**********************************
function x890069_TickSkillD( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillD_CD, x890069_SkillD_CD-(nTick-cd) )
		return x890069_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E技能心跳....
--**********************************
function x890069_TickSkillE( sceneId, selfId, nTick )

	--如果正在用B技能则先等待....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--检测是否到了狂暴的时候....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoTimer )
	if kbTime < x890069_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890069_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890069_SkillE_Buff2, 0 )
		return 1

	end

end

--**********************************
--秒表心跳....
--**********************************
function x890069_TickStopWatch( sceneId, selfId, nTick )

	--限制每秒才会执行一次....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--剑舞技能逻辑....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--寻找符敏仪....
		local bossId = CallScriptFunction( x890069_g_FuBenScriptId, "FindBOSS", sceneId, "LiFan_NPC" )
		if bossId <= 0 then
			return 0
		end

		--让符敏仪给玩家加buff....
		local buffTbl = x890069_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--使用A技能....
--**********************************
function x890069_UseSkillA( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[i+1] = nHumanId
		end
	end

	--随机挑选一个玩家....
	local numPlayer = getn(PlayerList)
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对自己使用一个空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillA_ID, selfId, x, z, 0, 1 )

	--给玩家加失明buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x890069_SkillA_Buff, 0 )

	return 1

end

--**********************************
--使用C技能....
--**********************************
function x890069_UseSkillC( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--使用D技能....
--**********************************
function x890069_UseSkillD( sceneId, selfId )

	--如果正在用B技能则跳过....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x890069_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[i+1] = nHumanId
		end
	end

	--随机挑选一个玩家....
	local numPlayer = getn(PlayerList)
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890069_SkillD_ID, selfId, x, z, 0, 1 )

	--在该玩家脚底下放陷阱....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x890069_SkillD_SpecObj, x, z, 0)

	return 1

end
