--飘渺峰 乌老大AI

--A	【金灯万盏】毒属性群攻....
--B 【麻痹毒药】普通技能....全副本随机挑一个人对其释放空技能....再给其加个buff....
--C 【绿波香露】对自己使用一个空技能....同时在当前敌人脚下放个陷阱....
--D 【毒性变换】每隔5秒给全副本所有人加一个buff....

--全程都带有免疫制定技能的buff....
--20秒后开始循环释放ABC技能....冷却20秒....
--每5秒使用一次D....
--BOSS死亡或脱离战斗会给所有人清除D的buff....


--脚本号
x402266_g_ScriptId	= 402266

--副本逻辑脚本号....
x402266_g_FuBenScriptId = 402263

--免疫Buff....
x402266_Buff_MianYi1	= 10472	--免疫一些负面效果....
x402266_Buff_MianYi2	= 10471	--免疫普通隐身....

--ABC技能....
x402266_SkillA			= 1030
x402266_SkillB			= 1032
x402266_BuffB				= 10244
x402266_SkillC			= 1031
x402266_SpeObjC			= 54
x402266_SkillABC_CD	=	20000

--D技能....
x402266_BuffD				= 10249
x402266_SkillD_CD		= 5000


--AI Index....
x402266_IDX_CD_SkillABC		= 1	--ABC技能的CD....
x402266_IDX_CurSkillIndex	= 2	--接下来该使用ABC中的哪个技能....
x402266_IDX_CD_SkillD			= 3	--D技能的CD....

x402266_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x402266_OnInit(sceneId, selfId)
	--重置AI....
	x402266_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x402266_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag ) then
		return
	end

	--ABC技能心跳....
	if 1 == x402266_TickSkillABC( sceneId, selfId, nTick ) then
		return
	end

	--D技能心跳....
	if 1 == x402266_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x402266_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402266_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402266_Buff_MianYi2, 0 )

	--重置AI....
	x402266_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x402266_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x402266_ResetMyAI( sceneId, selfId )

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

	--创建对话NPC....
	local MstId = CallScriptFunction( x402266_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--杀死敌人....
--**********************************
function x402266_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x402266_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x402266_ResetMyAI( sceneId, selfId )

	--删除自己....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--开启乌老大死亡的计时器....
	local x,z = GetWorldPos( sceneId, selfId )
	CallScriptFunction( x402266_g_FuBenScriptId, "OpenWuLaoDaDieTimer", sceneId, 4, x402266_g_ScriptId, x, z )

	--设置已经挑战过乌老大....
	CallScriptFunction( x402266_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "WuLaoDa", 2 )

	--如果还没有挑战过双子则可以挑战双子....
	if 2 ~= CallScriptFunction( x402266_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" )	then
		CallScriptFunction( x402266_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 1 )
	end
	
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
		str = format("#{_INFOUSR%s}#{PMF_8812_03}", playerName); --乌老大
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--重置AI....
--**********************************
function x402266_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillABC, x402266_SkillABC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillD, x402266_SkillD_CD )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag, 0 )

	--给所有人清除D的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402266_BuffD )
		end
	end

end


--**********************************
--ABC技能心跳....
--**********************************
function x402266_TickSkillABC( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillABC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillABC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillABC, x402266_SkillABC_CD-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex, 2 )
			return x402266_UseSkillA( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex, 3 )
			return x402266_UseSkillB( sceneId, selfId )
		elseif CurSkill == 3 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex, 1 )
			return x402266_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D技能心跳....
--**********************************
function x402266_TickSkillD( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillD, x402266_SkillD_CD-(nTick-cd) )
		return x402266_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--使用A技能....
--**********************************
function x402266_UseSkillA( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillA, selfId, x, z, 0, 1 )
	return 1

end


--**********************************
--使用B技能....
--**********************************
function x402266_UseSkillB( sceneId, selfId )

	--副本中有效的玩家的列表....
	local PlayerList = {}

	--将有效的人加入列表....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--随机挑选一个玩家....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--对其使用技能....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillB, PlayerId, x, z, 0, 1 )

	--给其加buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402266_BuffB, 0 )

	return 1

end


--**********************************
--使用C技能....
--**********************************
function x402266_UseSkillC( sceneId, selfId )

	--获得当前敌人....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--在该敌人脚下放个陷阱....
	local x,z = GetWorldPos( sceneId, enemyId )
	CreateSpecialObjByDataIndex( sceneId, selfId, x402266_SpeObjC, x, z, 0 )

	--喊话....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_17}" )

	--对自己使用一个只有特效的空技能....
	x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillC, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--使用D技能....
--**********************************
function x402266_UseSkillD( sceneId, selfId )

	--给副本里所有人加buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x402266_BuffD, 0 )
		end
	end

end


--**********************************
--乌老大死亡计时器OnTimer....
--用于控制死亡后延迟刷出战败乌老大....
--**********************************
function x402266_OnHaDaBaDieTimer( sceneId, step, posX, posY )

	if 1 == step then
		--创建战败的乌老大NPC....
		local MstId = CallScriptFunction( x402266_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDaLoss_NPC", posX, posY )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )
		SetPatrolId(sceneId, MstId, 0)
	end

end
