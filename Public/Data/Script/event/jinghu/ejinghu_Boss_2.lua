-- 005118
-- ¾µºþBOSS¸ú°à1
-- Êý¾Ý±í

x005118_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1004,
PrepareTime = 30000,
SkillInterval = 60000,
BossBuff = 9999
}


function x005118_OnDie( sceneId, selfId, killerId )
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005118_TBL.IDX_FlagCombat, 0)
end

function x005118_OnHeartBeat(sceneId, selfId, nTick)
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x005118_TBL.IDX_FlagCombat)) then
			--Countdown TimerPrepare
			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare)
			if(0<TimePrepare) then
				TimePrepare = TimePrepare - nTick;
				MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare, TimePrepare)
			else
				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval)
				if(0<TimeInterval) then
					--Countdown TimerInterval
					TimeInterval = TimeInterval - nTick;
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, TimeInterval)
				else
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, x005118_TBL.SkillInterval)
					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					if(-1~=nTarget) then
						local posX, posZ = GetWorldPos(sceneId,nTarget)
						local fDir = 0.0
						LuaFnUnitUseSkill(sceneId, selfId, x005118_TBL.BossSkill, nTarget, posX, posZ, fDir)			
					end
				end
			end
		end
	end
end

function x005118_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005118_TBL.IDX_FlagCombat, 0)
end

function x005118_OnKillCharacter(sceneId, selfId, targetId)
end

function x005118_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x005118_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x005118_TBL.BossBuff, 0)
	end
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare, x005118_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005118_TBL.IDX_FlagCombat, 1)
end

function x005118_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005118_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005118_TBL.IDX_FlagCombat, 0)
end
