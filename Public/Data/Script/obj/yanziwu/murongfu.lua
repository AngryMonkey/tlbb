-- 402254
-- Ľ�ݸ�

x402254_TBL = 
{
IDX_TimerPrepare = 1,
IDX_TimerInterval = 2,
IDX_FlagCombat = 1,
BossSkill = 1002,
PrepareTime = 60000,
SkillInterval = 60000,
BossBuff = 9998
}

-- �����Կ�ʼ�����Ŀ���
x402254_g_bWangyuyanSpeak = 24
x402254_g_DuanAndWangFlag = 29

--**********************************
-- �Լ�����
--**********************************
function x402254_OnDie( sceneId, selfId, killerId )

	LuaFnNpcChat(sceneId, selfId, 0, "�ѵ��Ҵ���ĸ�����ҵ���վ�ֻ�ǻ���һ�Σ�")

	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- ֹͣ����
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
	
	-- ɾ���������̵���
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "������")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����ʯ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "������")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "���Ƴ�")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "��˼��")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "�쵤��")
	
	x402254_TipAllHuman( sceneId, "Ľ�ݸ��ѱ���ܣ��ַ�������ɹ�����ӳ��ڻص�̫����" )
	
	--LuaFnDeleteMonster(sceneId, selfId)
	
	-- �����繫��
--#w���ӳ�����#P��#{_BOSS0}������ȴ��ʹ������������Ұ�ש��ʹ���ӡ����ƹ�����ʯ�ҡ����������ã����ڽ�#{_BOSS0}��ô�ܣ���Ķ��ӣ�һ�ٹ����������롣
--#w���ӳ�����#P���������#{_BOSS0}��ս���գ�����������ѧ�����У���ʱ�书���ǣ�#{_BOSS0}�ֵв�����ֻ����Ķ��ӣ����������ݡ�
--#w���ӳ�����#P�����������ǲ�����˳��ᢣ���ʹ����������������ȳ²ֵ���ʮ����֮�󣬴��#{_BOSS0}ֻ��ʹ�õ���ʮ�߼���֮زز�ˡ�
	
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
	end
		--������˶����ȡ�ӳ���ID....
	local nLeaderId = GetTeamLeader(sceneId, playerID)
	if nLeaderId < 1   then
		nLeaderId = playerID
	end
	local str = ""
	local ran = random(3)
	if ran == 1  then
		str = format("#W#{_INFOUSR%s}#P��#{_BOSS0}������ȴ��ʹ������������Ұ�ש��ʹ���ӡ����ƹ�����ʯ�ҡ����������ã����ڽ�#{_BOSS0}��ô�ܣ���Ķ��ӣ�һ�ٹ����������롣", GetName(sceneId,nLeaderId))
	elseif ran == 2  then
		str = format("#W#{_INFOUSR%s}#P���������#{_BOSS0}��ս���գ�����������ѧ�����У���ʱ�书���ǣ�#{_BOSS0}�ֵв�����ֻ����Ķ��ӣ����������ݡ�", GetName(sceneId,nLeaderId))
	else
		str = format("#W#{_INFOUSR%s}#P�����������ǲ�����˳��ᢣ���ʹ����������������ɳ²ֵ���ʮ����֮�󣬴��#{_BOSS0}ֻ��ʹ�õ���ʮ�߼���֮زز�ˡ�", GetName(sceneId,nLeaderId))
	end
	
	BroadMsgByChatPipe(sceneId, nLeaderId, str, 4)
	
	
end

--**********************************
-- ����
--**********************************
function x402254_OnHeartBeat(sceneId, selfId, nTick)

	-- ��Ľ�ݸ�Ѫ������50%��ʱ���� ������ ������ͬʱ������
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
			--PrintNum(1)
			-- ��� Ľ�ݸ� Ѫ���ڶ��٣�����ô����
			if LuaFnGetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak) == 0  then
				if GetHp(sceneId, selfId)*2 <= GetMaxHp(sceneId, selfId) then
					LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 1)
				end
			end
		else
			--PrintNum(2)
		end
	end

--	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then
--		if(1==MonsterAI_GetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat)) then
--			--Countdown TimerPrepare
--			local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare)
--			if(0<TimePrepare) then
--				TimePrepare = TimePrepare - nTick;
--				MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, TimePrepare)
--			else
--				local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval)
--				if(0<TimeInterval) then
--					--Countdown TimerInterval
--					TimeInterval = TimeInterval - nTick;
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, TimeInterval)
--				else
--					MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, x402254_TBL.SkillInterval)
--					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
--					if(-1~=nTarget) then
--						local posX, posZ = GetWorldPos(sceneId,nTarget)
--						local fDir = 0.0
--						LuaFnUnitUseSkill(sceneId, selfId, x402254_TBL.BossSkill, nTarget, posX, posZ, fDir)			
--						LuaFnNpcChat(sceneId, selfId, 0, "����������ϵ�����ɣ�")
--					end
--				end
--			end
--		end
--	end
end

--**********************************
-- ��ʼ��
--**********************************
function x402254_OnInit(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)
end

--**********************************
-- ɱ�����
--**********************************
function x402254_OnKillCharacter(sceneId, selfId, targetId)
--	if(-1~=targetId) then
--		local szTarget = GetName(sceneId, targetId)
--		LuaFnNpcChat(sceneId, selfId, 0, szTarget .. "�������������ʮ��������үүҲֻ����·һ����")
--	end
end

--**********************************
-- ����ս��
--**********************************
function x402254_OnEnterCombat(sceneId, selfId, enmeyId)
	if(0<x402254_TBL.BossBuff) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x402254_TBL.BossBuff, 0)
	end
	
	-- ����ս��״̬��
	LuaFnNpcChat(sceneId, selfId, 0, "�����󱲣����һ��Ҹ�����ƣ�����������")
	
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, x402254_TBL.PrepareTime)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 1)
	
	CallScriptFunction((200060), "Paopao",sceneId, "����", "������", "������㿴����������գ������һ��������ߺ���")
	CallScriptFunction((200060), "Paopao",sceneId, "������", "������", "��粻�ߣ���Ҳ�����ߵģ���Ҫ���������硣")

end

--**********************************
-- ����ս��
--**********************************
function x402254_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerPrepare, 0)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x402254_TBL.IDX_TimerInterval, 0)
	MonsterAI_SetBoolParamByIndex(sceneId, selfId, x402254_TBL.IDX_FlagCombat, 0)

	-- ɾ���������̵���
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "������")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����ʯ")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "����")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "������")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "���Ƴ�")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "��˼��")
	CallScriptFunction((401040), "ClearMonsterByName",sceneId, "�쵤��")

	-- �����ڳ�����������ЩNpc
	CallScriptFunction((401040), "CreateMonster_11",sceneId)

	-- ֹͣ����
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_bWangyuyanSpeak, 0)
	LuaFnSetCopySceneData_Param(sceneId, x402254_g_DuanAndWangFlag, 0)
end

--**********************************
--��ʾ���и��������
--**********************************
function x402254_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		BeginEvent(sceneId)
			AddText(sceneId, Str)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId, PlayerId)
	end
end
