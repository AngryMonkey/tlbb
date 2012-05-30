-- 005117
-- 镜湖BOSS
-- 数据表

x005117_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9999
}


function x005117_OnDie( sceneId, selfId, killerId )
	LuaFnNpcChat(sceneId, selfId, 0, "十八年后，爷爷我又是一条好汉！")
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005117_TBL.IDX_FlagCombat, 0)
end

function x005117_OnHeartBeat(sceneId, selfId, nTick)
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x005117_TBL.IDX_FlagCombat)) then
			--Countdown TimerPrepare
			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare)
			if(0<TimePrepare) then
				TimePrepare = TimePrepare - nTick;
				MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare, TimePrepare)
			else
				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval)
				if(0<TimeInterval) then
					--Countdown TimerInterval
					TimeInterval = TimeInterval - nTick;
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, TimeInterval)
				else
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, x005117_TBL.SkillInterval)
					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					if(-1~=nTarget) then
						local posX, posZ = GetWorldPos(sceneId,nTarget)
						local fDir = 0.0
						LuaFnUnitUseSkill(sceneId, selfId, x005117_TBL.BossSkill, nTarget, posX, posZ, fDir)			
						LuaFnNpcChat(sceneId, selfId, 0, "尝尝浔阳江上的烈焰吧！")
					end
				end
			end
		end
	end
end

function x005117_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005117_TBL.IDX_FlagCombat, 0)
end

function x005117_OnKillCharacter(sceneId, selfId, targetId)
	if(-1~=targetId) then
		local szTarget = GetName(sceneId, targetId)		
		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "，你就算再厉害十倍，遇上爷爷也只有死路一条！")
	end
end

function x005117_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x005117_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x005117_TBL.BossBuff, 0)
	end
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare, x005117_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005117_TBL.IDX_FlagCombat, 1)
end

function x005117_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x005117_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x005117_TBL.IDX_FlagCombat, 0)
end
