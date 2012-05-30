-- 805044
-- ɽ��boss

x805044_SKILL_TBL = 
{
	[1]	=	{
				IDX_TimerAlarm 	= 1,
				IDX_TimerInterval 	= 2,
				IDX_Count			= 3,
				IDX_State			= 4,						--
				BossSkill			= 1100,
				AlarmTime 			= 0,
				SkillCondition		= 1,						--0:cooldown�����ͷ�	1:Ѫ������
				SkilCoolDown		= 0,
				SkillBlood			= 10,						--Ѫ�����ڸ�ֵʱ�ͷ�
				TargetType			= 0,						--0:��ǰtarget  1:������
				TargetCord			= 1,						--0:��ǰtarget	1:�Լ�
				MsgAlarmType		= 0,						--0:Npc˵��		1:������ʾ
				MsgAlarm			= "ɽ���ŭ�Ŀ�����Χ����",
				MsgFire				= "",
			}
}


--����������������
x805044_g_keySD					= {}
x805044_g_keySD["typ"]			= 0		--���ø�������
x805044_g_keySD["spt"]			= 1		--���ø��������¼��ű���
x805044_g_keySD["tim"]			= 2		--���ö�ʱ�����ô���
x805044_g_keySD["currStage"]	= 3		--���ö�ʱ�����ô���
x805044_g_keySD["scn"]			= 4		--���ø�����ڳ�����, ��ʼ��
x805044_g_keySD["cls"]			= 5		--���ø����رձ�־, 0���ţ�1�ر�
x805044_g_keySD["dwn"]			= 6		--�����뿪����ʱ����
x805044_g_keySD["tem"]			= 7		--��������
x805044_g_keySD["x"]			= 8			--��������ڳ����е�xλ��
x805044_g_keySD["z"]			= 9			--��������ڳ����е�zλ��
x805044_g_keySD["killMonsterNum"]	= 10		--ɱ����������
x805044_g_keySD["genMonsterNum"]	= 11			--���ɹ�������
x805044_g_keySD["playerLevel"]	= 12		--��¼��ǰ�����ļ���

--**********************************
-- �Լ�����
--**********************************
function x805044_OnDie( sceneId, selfId, killerId )
	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["killMonsterNum"] )	
	killNum = killNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805044_g_keySD["killMonsterNum"], killNum )	
	
	local currStage = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["currStage"] )
	
	if currStage == 1 then
		local genNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"] )	
		x805044_TipAllHuman(sceneId, "��ɱ��ɽ��  "..killNum.." / "..genNum )
	end
end

--**********************************
-- ����
--**********************************
function x805044_OnHeartBeat(sceneId, selfId, nTick)

	if(1==LuaFnIsCharacterLiving(sceneId, selfId)) then

		local i = 0;
		for i = 1, getn(x805044_SKILL_TBL) do
			local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval)
			local nCount = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count)
			local nState = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State)
			
			if nState == 0 then
				if x805044_SKILL_TBL[i].SkillCondition == 0 then
					if 0<TimeInterval then
						TimeInterval = TimeInterval - nTick;
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, TimeInterval)
					else
						nState = 1
					end
				end
				
				if x805044_SKILL_TBL[i].SkillCondition == 1   then
					if nCount==0 then
						--x805044_TipAllHuman(sceneId, GetHp(sceneId, selfId) .. "/" .. GetMaxHp(sceneId, selfId))
						if GetHp(sceneId, selfId) < (GetMaxHp(sceneId, selfId)*x805044_SKILL_TBL[i].SkillBlood)/100 then
							nState = 1	
						end
					end
				end
			end
			
			if nState == 1 then
				if( TimeInterval <=0 and x805044_SKILL_TBL[i].MsgAlarm ~= "") then
					if x805044_SKILL_TBL[i].MsgAlarmType == 0 then
						LuaFnNpcChat(sceneId, selfId, 1, x805044_SKILL_TBL[i].MsgAlarm)
					elseif x805044_SKILL_TBL[i].MsgAlarmType == 1 then
						x805044_TipAllHuman(sceneId, x805044_SKILL_TBL[i].MsgAlarm)
					end
				end
				
				nState = 2
			end
			
			
			if nState == 2 then
				--Countdown TimerPrepare
				local TimeAlarm = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm)
				if(0<TimeAlarm) then
					TimeAlarm = TimeAlarm - nTick;
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, TimeAlarm)
				else
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, x805044_SKILL_TBL[i].AlarmTime)
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, x805044_SKILL_TBL[i].SkilCoolDown)
					
					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					
					if x805044_SKILL_TBL[i].TargetType == 1 then
						nTarget = x805044_RandPlayer(sceneId)
					else 
						nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					end
					
					if(-1~=nTarget) then
						
						if (x805044_SKILL_TBL[i].MsgFire ~= "") then
							local msgFire = format(x805044_SKILL_TBL[i].MsgFire, LuaFnGetName(sceneId, nTarget) )
							LuaFnNpcChat(sceneId, selfId, 1, msgFire)
						end
						
						local posX, posZ = GetWorldPos(sceneId,nTarget)
						local fDir = 0.0
						
						if (x805044_SKILL_TBL[i].TargetCord == 1) then
							posX, posZ = GetWorldPos(sceneId,selfId)
						end
						
						LuaFnUnitUseSkill(sceneId, selfId, x805044_SKILL_TBL[i].BossSkill, nTarget, posX, posZ, fDir)
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count, nCount + 1)	
					end
					
					nState = 0
				end
			end
			
			MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State, nState)
		end
		
	end
end

--**********************************
-- ��ʼ��
--**********************************
function x805044_OnInit(sceneId, selfId)
	local i = 0;
	for i = 1, getn(x805044_SKILL_TBL) do
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerAlarm, x805044_SKILL_TBL[i].AlarmTime)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_TimerInterval, x805044_SKILL_TBL[i].SkilCoolDown)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_Count, 0)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805044_SKILL_TBL[i].IDX_State, 0)
	end
	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"] )	
	genNum = genNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805044_g_keySD["genMonsterNum"], genNum )
end

--**********************************
-- ɱ�����
--**********************************
function x805044_OnKillCharacter(sceneId, selfId, targetId)

end

--**********************************
-- ����ս��
--**********************************
function x805044_OnEnterCombat(sceneId, selfId, enmeyId)

end

--**********************************
-- ����ս��
--**********************************
function x805044_OnLeaveCombat(sceneId, selfId)

end

--**********************************
--��ʾ���и��������
--**********************************
function x805044_TipAllHuman( sceneId, Str )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ�����ʲô������
	if nHumanNum < 1 then
		return
	end
	
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

--���ѡ��һ�����
function x805044_RandPlayer( sceneId )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ���
	if nHumanNum < 1 then
		return -1
	end
	
	
	local rPlayerIndex = random( nHumanNum )

	local PlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, rPlayerIndex )
	return PlayerId
end
