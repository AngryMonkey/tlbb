--飘渺峰 不平道人AI

--F	【暗雷】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时让BOSS给其周围人加伤寒buff并喊话....
--G 【精算】给自己用一个加buff的技能....
--H 【烟花】对自己用一个空技能....再给玩家加个结束后会回调脚本的buff....回调时喊话....
--I	【朋友】卓不凡死时给自己用一个加buff的技能....


--全程都带有免疫制定技能的buff....
--每隔30秒对随机玩家随机使用FH....
--每隔45秒对自己使用G....
--死亡或脱离战斗时给所有玩家清除FH的buff....
--死亡时寻找不平道人....设置其需要使用狂暴技能....
--死亡时发现不平道人已经死了....则创建另一个BOSS....


--脚本号
x890068_g_ScriptId	= 890068

--副本逻辑脚本号....
x890068_g_FuBenScriptId = 890063

--免疫Buff....
x890068_Buff_MianYi1	= 10472	--免疫一些负面效果....
x890068_Buff_MianYi2	= 10471	--免疫普通隐身....

--技能....
x890068_SkillID_F		= 1037
x890068_BuffID_F1		= 10255
x890068_BuffID_F2		= 10256
x890068_SkillID_G		= 589
x890068_SkillID_H		= 599
x890068_BuffID_H		= 18204
x890068_SkillID_I		= 635
x890068_BuffID_I1		= 6781
x890068_BuffID_I2		= 6781

x890068_SkillCD_FH	=	30000
x890068_SkillCD_G		=	45000


x890068_MyName			= "司马林"	--自己的名字....
x890068_BrotherName = "姚伯当"		--兄弟的名字....


--AI Index....
x890068_IDX_KuangBaoMode	= 1	--狂暴模式....0未狂暴 1需要进入狂暴 2已经进入狂暴
x890068_IDX_CD_SkillFH		= 2	--FH技能的CD....
x890068_IDX_CD_SkillG			= 3	--G技能的CD....
x890068_IDX_CD_Talk				= 4	--FH技能喊话的CD....

x890068_IDX_CombatFlag 		= 1	--是否处于战斗状态的标志....


--**********************************
--初始化....
--**********************************
function x890068_OnInit(sceneId, selfId)
	--重置AI....
	x890068_ResetMyAI( sceneId, selfId )
end


--**********************************
--心跳....
--**********************************
function x890068_OnHeartBeat(sceneId, selfId, nTick)

	--检测是不是死了....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--检测是否不在战斗状态....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag ) then
		return
	end

	--FH技能心跳....
	if 1 == x890068_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G技能心跳....
	if 1 == x890068_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I技能心跳....
	if 1 == x890068_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--进入战斗....
--**********************************
function x890068_OnEnterCombat(sceneId, selfId, enmeyId)

	--加初始buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi2, 0 )

	--重置AI....
	x890068_ResetMyAI( sceneId, selfId )

	--设置进入战斗状态....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 1 )

end


--**********************************
--离开战斗....
--**********************************
function x890068_OnLeaveCombat(sceneId, selfId)

	--重置AI....
	x890068_ResetMyAI( sceneId, selfId )

	--遍历场景里所有的怪....寻找兄弟并将其删除....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--删除自己....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--杀死敌人....
--**********************************
function x890068_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--死亡....
--**********************************
function x890068_OnDie( sceneId, selfId, killerId )

	--重置AI....
	x890068_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--遍历场景里所有的怪....寻找兄弟....给其设置需要使用狂暴技能....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x890068_IDX_KuangBaoMode, 1 )
		end
	end

	--如果没找到兄弟则说明就剩自己一个了....
	if 0 == bFind then
		--创建端木元....
		local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "YouDanZhi_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{CJG_101231_244}")
		--设置已经挑战过双子....
		CallScriptFunction( x890068_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--重置AI....
--**********************************
function x890068_ResetMyAI( sceneId, selfId )

	--重置参数....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, x890068_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, x890068_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 0 )

	--给所有玩家清除FH的buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890068_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890068_BuffID_H )
		end
	end

end


--**********************************
--FH技能心跳....
--**********************************
function x890068_TickSkillFH( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, x890068_SkillCD_FH-(nTick-cd) )

		--随机使用FH....
		if random(100) < 50 then
			return x890068_UseSkillF( sceneId, selfId )
		else
			return x890068_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G技能心跳....
--**********************************
function x890068_TickSkillG( sceneId, selfId, nTick )

	--更新技能CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, x890068_SkillCD_G-(nTick-cd) )
		return x890068_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I技能心跳....
--**********************************
function x890068_TickSkillI( sceneId, selfId, nTick )

	--获得当前狂暴mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--如果不需要狂暴或者已经狂暴了则返回....
		return 0

	elseif CurMode == 1 then

		--如果需要狂暴则使用狂暴技能....
		local ret =  x890068_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--使用F技能....
--**********************************
function x890068_UseSkillF( sceneId, selfId )

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

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_F, selfId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890068_BuffID_F1, 0 )

	return 1

end


--**********************************
--使用G技能....
--**********************************
function x890068_UseSkillG( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_G, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{CJG_101231_218}" )
	return 1

end


--**********************************
--使用H技能....
--**********************************
function x890068_UseSkillH( sceneId, selfId )

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

	--对自己使用空技能....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_H, selfId, x, z, 0, 1 )

	--给玩家加结束后回调脚本的buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890068_BuffID_H, 0 )

	return 1

end


--**********************************
--使用I技能....
--**********************************
function x890068_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{CJG_101231_230}" )

	return 1

end


--**********************************
--暗雷和烟花的buff结束的时候回调本接口....
--**********************************
function x890068_OnImpactFadeOut( sceneId, selfId, impactId )

	--寻找BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--没找到则返回....
	if bossId == -1 then
		return
	end

	--如果是烟花的buff则让BOSS喊话....
	if impactId == x890068_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{CJG_101231_166}"..GetName( sceneId, selfId ).."#{CJG_101231_168}" )
		return
	end

	--如果是暗雷的buff....则让BOSS给附近的玩家加一个伤害的buff并喊话....
	if impactId == x890068_BuffID_F1 then

		MonsterTalk( sceneId, -1, "", "#{CJG_101231_85}"..GetName( sceneId, selfId ).."#{CJG_101231_84}" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 8*8 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890068_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
