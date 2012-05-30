-- 402253
-- �粨��

x402253_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9999
}

x402253_g_BuffId = 10175

function x402253_OnDie( sceneId, selfId, killerId )

	-- �Լ�������ʱ�����Լ����ֵܿ�
	local nNpcNum = GetMonsterCount(sceneId)
	for i=0, nNpcNum-1 do
		local nNpcId = GetMonsterObjID(sceneId,i)
		if GetName(sceneId, nNpcId)  == "��ұ��" or
			 GetName(sceneId, nNpcId)  == "�˰ٴ�" or
			 GetName(sceneId, nNpcId)  == "����ͬ" or
			 GetName(sceneId, nNpcId)  == "�粨��"   then
			
			if selfId~= nNpcId  then
				-- ��ӿ�buff 
				if GetHp(sceneId, nNpcId) > 100  then
					LuaFnSendSpecificImpactToUnit(sceneId, nNpcId, nNpcId, nNpcId, x402253_g_BuffId, 0 )
					CallScriptFunction((200060), "Paopao",sceneId, GetName(sceneId, nNpcId), "������", "����ͬ��ͬ��ͬ����������ͬ��ͬ��ͬ������")
				end
			end
			
		end
	end

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402253_TBL.IDX_FlagCombat, 0)
end

function x402253_OnHeartBeat(sceneId, selfId, nTick)
--	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
--		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402253_TBL.IDX_FlagCombat)) then
--			--Countdown TimerPrepare
--			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare)
--			if(0<TimePrepare) then
--				TimePrepare = TimePrepare - nTick;
--				MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare, TimePrepare)
--			else
--				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval)
--				if(0<TimeInterval) then
--					--Countdown TimerInterval
--					TimeInterval = TimeInterval - nTick;
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, TimeInterval)
--				else
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, x402253_TBL.SkillInterval)
--					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
--					if(-1~=nTarget) then
--						local posX, posZ = GetWorldPos(sceneId,nTarget)
--						local fDir = 0.0
--						LuaFnUnitUseSkill(sceneId, selfId, x402253_TBL.BossSkill, nTarget, posX, posZ, fDir)			
--						LuaFnNpcChat(sceneId, selfId, 0, "����������ϵ�����ɣ�")
--					end
--				end
--			end
--		end
--	end
end

function x402253_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402253_TBL.IDX_FlagCombat, 0)
end

function x402253_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)		
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "�������������ʮ��������үүҲֻ����·һ����")
--	end
end

function x402253_OnEnterCombat(sceneId, selfId, enmeyId)
--	if(0<x402253_TBL.BossBuff) then
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402253_TBL.BossBuff, 0)
--	end
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare, x402253_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402253_TBL.IDX_FlagCombat, 1)
end

function x402253_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402253_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402253_TBL.IDX_FlagCombat, 0)

	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x402253_g_BuffId) == 1  then
		LuaFnCancelSpecificImpact(sceneId, selfId, x402253_g_BuffId)
	end
end


