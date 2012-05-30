-- 402255
-- 王语嫣

x402255_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9999
}

x402255_g_DuanAndWangFlag = 29

function x402255_OnDie( sceneId, selfId, killerId )
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402255_TBL.IDX_FlagCombat, 0)
end

function x402255_OnDefaultEvent( sceneId, selfId, targetId )
	
end

function x402255_OnHeartBeat(sceneId, selfId, nTick)
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, 1)) then
			if GetHp(sceneId, selfId) <= GetMaxHp(sceneId, selfId) - 100 then
				--PrintNum(LuaFnGetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag))
				if LuaFnGetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag) == 0  then
					LuaFnSetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag, 1)
					
					-- 段誉改变AiFlie
					local nMonsterNum = GetMonsterCount(sceneId)
					for i=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,i)
						if GetName(sceneId, nMonsterId)== "段誉"  then
							--if GetAIScriptID(sceneId, nMonsterId) == 245  then
								SetAIScriptID(sceneId, nMonsterId, 246)
							--end
						end
					end
				end
			end
			
		else
			if GetHp(sceneId, selfId) <= GetMaxHp(sceneId, selfId) - 100 then
				--PrintNum(LuaFnGetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag))
				if LuaFnGetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag) == 0  then
					LuaFnSetCopySceneData_Param(sceneId, x402255_g_DuanAndWangFlag, 1)
					-- 段誉改变AiFlie
					local nMonsterNum = GetMonsterCount(sceneId)
					for i=0, nMonsterNum-1 do
						local nMonsterId = GetMonsterObjID(sceneId,i)
						if GetName(sceneId, nMonsterId)== "段誉"  then
							--PrintNum(GetAIScriptID(sceneId, nMonsterId))
							--if GetAIScriptID(sceneId, nMonsterId) == 245  then
								SetAIScriptID(sceneId, nMonsterId, 246)
							--end
						end
					end
				end
			end
			--PrintNum(2)
		end

	end

--	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
--		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402255_TBL.IDX_FlagCombat)) then
--			--Countdown TimerPrepare
--			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare)
--			if(0<TimePrepare) then
--				TimePrepare = TimePrepare - nTick;
--				MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare, TimePrepare)
--			else
--				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval)
--				if(0<TimeInterval) then
--					--Countdown TimerInterval
--					TimeInterval = TimeInterval - nTick;
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, TimeInterval)
--				else
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, x402255_TBL.SkillInterval)
--					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
--					if(-1~=nTarget) then
--						local posX, posZ = GetWorldPos(sceneId,nTarget)
--						local fDir = 0.0
--						LuaFnUnitUseSkill(sceneId, selfId, x402255_TBL.BossSkill, nTarget, posX, posZ, fDir)			
--						LuaFnNpcChat(sceneId, selfId, 0, "尝尝浔阳江上的烈焰吧！")
--					end
--				end
--			end
--		end
--	end
end

function x402255_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402255_TBL.IDX_FlagCombat, 0)
end

function x402255_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)		
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "，你就算再厉害十倍，遇上爷爷也只有死路一条！")
--	end
end

function x402255_OnEnterCombat(sceneId, selfId, enmeyId)
--	if(0<x402255_TBL.BossBuff) then
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402255_TBL.BossBuff, 0)
--	end
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare, x402255_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402255_TBL.IDX_FlagCombat, 1)
end

function x402255_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402255_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402255_TBL.IDX_FlagCombat, 0)
end


