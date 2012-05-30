--飘渺峰 卓不凡AI

--A	【剑芒】使用一个空技能....再按门派setdamage....
--B 【金甲】给自己用一个加buff的技能....
--C 【明镜】给自己用一个加buff的技能....
--D	【朋友】不平道人死时给自己用一个加buff的技能....


--全程都带有免疫制定技能的buff....
--每隔40秒对当前敌人使用A....
--每隔30秒轮流使用BC....
--死亡时寻找不平道人....设置其需要使用狂暴技能....
--死亡时发现不平道人已经死了....则创建另一个BOSS....


--脚本号
x402086_g_ScriptId	= 402086

--副本逻辑脚本号....
x402086_g_FuBenScriptId = 402080

--免疫Buff....
x402086_Buff_MianYi1	= 10472	--免疫一些负面效果....
x402086_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x402086_SkillID_A		= 1033
x402086_SkillID_B		= 1034
x402086_SkillID_C		= 1035
x402086_SkillID_D		= 1036

x402086_BuffID_D1		= 10253
x402086_BuffID_D2		= 10254

x402086_SkillCD_A		=	40000
x402086_SkillCD_BC	=	30000

x402086_SkillA_Damage =
{
	[0] = 23815,
	[1] = 16570,
	[2] = 18820,
	[3] = 11978,
	[4] = 13170,
	[5] = 15610,
	[6] = 14496,
	[7] = 15240,
	[8] = 14070,
	[9] = 99999
}

x402086_BrotherName = "不平道人"	--兄弟的名字....


--AI Index....
x402086_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x402086_IDX_CurSkillIndex	= 2	--接下来该使用BC中的哪个技能....
x402086_IDX_CD_SkillA			= 3	--A技能的CD....
x402086_IDX_CD_SkillBC		= 4	--BC技能的CD....

x402086_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x402086_OnInit(sceneId, selfId)
	--重置AI....
	x402086_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x402086_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402086_IDX_CombatFlag ) then
		return
	end

	--A技能心跳....
	if 1 == x402086_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--BC技能心跳....
	if 1 == x402086_TickSkillBC( sceneId, selfId, nTick ) then
		return
	end

	--D技能心跳....
	if 1 == x402086_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x402086_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402086_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402086_Buff_MianYi2, 0 )

	--重置AI....
	x402086_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402086_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x402086_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x402086_ResetMyAI( sceneId, selfId )

	--遍历场景里所有的怪....寻找兄弟并将其删除....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402086_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x402086_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x402086_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x402086_ResetMyAI( sceneId, selfId )

--	local bFind = 0

	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
--	local nMonsterNum = GetMonsterCount(sceneId)
--	for i=0, nMonsterNum-1 do
--		local MonsterId = GetMonsterObjID(sceneId,i)
--		if x402086_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
--			bFind = 1
--			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x402086_IDX_KuangBaoMode, 1 )
--		end
--	end

	--如果没找到兄弟则说明就剩自己一个了....
--	if 0 == bFind then
		--创建端木元....
--		local MstId = CallScriptFunction( x402086_g_FuBenScriptId, "CreateBOSS", sceneId, "DuanMuYuan_BOSS", -1, -1 )
--		LuaFnNpcChat(sceneId, MstId, 0, "#{PMF_20080521_18}")
		--设置已经挑战过双子....
		CallScriptFunction( x402086_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ZhuoBuFan", 2 )
--如果还没有挑战过双子则可以挑战双子....
	if 2 ~= CallScriptFunction( x402086_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "LiQiuShui" )	then
		CallScriptFunction( x402086_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "LiQiuShui", 1 )
	end
--	end

end


--**********************************
--重置AI....
--**********************************
function x402086_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillA, x402086_SkillCD_A )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillBC, x402086_SkillCD_BC )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402086_IDX_CombatFlag, 0 )

end


--**********************************
--A技能心跳....
--**********************************
function x402086_TickSkillA( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillA )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillA, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillA, x402086_SkillCD_A-(nTick-cd) )
		return x402086_UseSkillA( sceneId, selfId )
	end

end


--**********************************
--BC技能心跳....
--**********************************
function x402086_TickSkillBC( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillBC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillBC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CD_SkillBC, x402086_SkillCD_BC-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402086_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CurSkillIndex, 2 )
			return x402086_UseSkillB( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_CurSkillIndex, 1 )
			return x402086_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D技能心跳....
--**********************************
function x402086_TickSkillD( sceneId, selfId, nTick )

	--获得当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402086_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不需要狂暴或者已经狂暴了则返回....
		return 0

	elseif CurMode == 1 then

		--如果需要狂暴则使用狂暴技能....
		local ret =  x402086_UseSkillD( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402086_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用A技能....
--**********************************
function x402086_UseSkillA( sceneId, selfId )

	--获得当前敌人....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--使用一个空技能....
	local x,z = GetWorldPos( sceneId, enemyId )
	LuaFnUnitUseSkill( sceneId, selfId, x402086_SkillID_A, enemyId, x, z, 0, 1 )

	--按门派扣血....
	local MenPai = GetMenPai( sceneId, enemyId )
	local Damage = x402086_SkillA_Damage[ MenPai ]
	IncreaseHp( sceneId, enemyId, -Damage )

	--喊话....
	MonsterTalk( sceneId, -1, "", "#ccc9933[耶律焱]"..GetName(sceneId,enemyId).."#W看我的独门奇术" )

	return 1

end


--**********************************
--使用B技能....
--**********************************
function x402086_UseSkillB( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402086_SkillID_B, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#ccc9933[耶律焱]#W我一向内外兼修，你能奈我何？" )
	return 1

end


--**********************************
--使用C技能....
--**********************************
function x402086_UseSkillC( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402086_SkillID_C, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#ccc9933[耶律焱]#W再看我的内外兼修，你又能奈我何？" )
	return 1

end


--**********************************
--使用D技能....
--**********************************
function x402086_UseSkillD( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402086_BuffID_D1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402086_BuffID_D2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402086_SkillID_D, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#ccc9933[耶律焱]#W我一招错，步步错，我死不瞑目！" )
	return 1

end
