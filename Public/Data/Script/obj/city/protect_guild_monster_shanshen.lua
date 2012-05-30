-- 805045
-- ɽ��boss


x805045_IDX_BossFightingState	= 20

x805045_SKILL_TBL = 
{
	[1]	=	{
				IDX_TimerPrepare 	= 1,
				IDX_TimerInterval 	= 2,
				IDX_Count			= 3,
				IDX_State			= 4,	
				BossSkill			= 1101,
				AlarmTime 			= 0,
				SkillCondition		= 0,						--0:cooldown�����ͷ�	1:Ѫ������
				SkilCoolDown		= 20000,
				SkillBlood			= 0,						--Ѫ�����ڸ�ֵʱ�ͷ�
				TargetType			= 1,						--0:��ǰtarget  1:������
				TargetCord			= 0,						--0:��ǰtarget	1:�Լ�
				MsgAlarmType		= 0,						--0:Npc˵��		1:������ʾ
				MsgAlarm			= "",
				MsgFire				= "%s,����ɽ����ٻ���",
				BuffList			= {154, 5945, 5946}				--buffЧ��
			},
		
	[2]	=	{
				IDX_TimerPrepare 	= 5,
				IDX_TimerInterval 	= 6,
				IDX_Count			= 7,
				IDX_State			= 8,	
				BossSkill			= 1102,
				AlarmTime 			= 1000,
				SkillCondition		= 0,						--0:cooldown�����ͷ�	1:Ѫ������
				SkilCoolDown		= 25000,
				SkillBlood			= 0,						--Ѫ�����ڸ�ֵʱ�ͷ�
				TargetType			= 0,						--0:��ǰtarget  1:������
				TargetCord			= 1,						--0:��ǰtarget	1:�Լ�
				MsgAlarmType		= 0,						--0:Npc˵��		1:������ʾ
				MsgAlarm			= "����ɽ��ķ�ŭ��",
				MsgFire				= ""
			},

	[3]	=	{
				IDX_TimerPrepare 	= 9,
				IDX_TimerInterval 	= 10,
				IDX_Count			= 11,
				IDX_State			= 12,	
				BossSkill			= 1103,
				AlarmTime 			= 1000,
				SkillCondition		= 1,						--0:cooldown�����ͷ�	1:Ѫ������
				SkilCoolDown		= 0,
				SkillBlood			= 50,						--Ѫ�����ڸ�ֵʱ�ͷ�
				TargetType			= 0,						--0:��ǰtarget  1:������
				TargetCord			= 2,						--0:��ǰtarget	1:�Լ�	2:�ٻ�����
				MsgAlarmType		= 0,						--0:Npc˵��		1:������ʾ
				MsgAlarm			= "�Ҳ���һ������ս��������",
				MsgFire				= ""
			},
		
}



--�����б�
x805045_g_monster_list = {
	[1]={
			StageId=1,
			MonsterList={
				{mType=9626,	x=128, 	z=98,	aiType=25,	aiScript=-1,	scriptId=805044	},
			}
		},
}


--����������������
x805045_g_keySD					= {}
x805045_g_keySD["typ"]			= 0		--���ø�������
x805045_g_keySD["spt"]			= 1		--���ø��������¼��ű���
x805045_g_keySD["tim"]			= 2		--���ö�ʱ�����ô���
x805045_g_keySD["currStage"]	= 3		--���ö�ʱ�����ô���
x805045_g_keySD["scn"]			= 4		--���ø�����ڳ�����, ��ʼ��
x805045_g_keySD["cls"]			= 5		--���ø����رձ�־, 0���ţ�1�ر�
x805045_g_keySD["dwn"]			= 6		--�����뿪����ʱ����
x805045_g_keySD["tem"]			= 7		--��������
x805045_g_keySD["x"]			= 8			--��������ڳ����е�xλ��
x805045_g_keySD["z"]			= 9			--��������ڳ����е�zλ��
x805045_g_keySD["killMonsterNum"]	= 10		--ɱ����������
x805045_g_keySD["genMonsterNum"]	= 11			--���ɹ�������
x805045_g_keySD["playerLevel"]	= 12		--��¼��ǰ�����ļ���

--**********************************
-- �Լ�����
--**********************************
function x805045_OnDie( sceneId, selfId, killerId )

	local killNum = LuaFnGetCopySceneData_Param( sceneId, x805045_g_keySD["killMonsterNum"] )	
	killNum = killNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805045_g_keySD["killMonsterNum"], killNum )	
	
	--ȫ�򹫸�
	local	nam_ply	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		nam_ply = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		nam_ply = GetName( sceneId, leaderID )
	end
	

	local cityName = LuaFnCityGetNameBySceneId( sceneId )

	local message;
	message = format("#cff99cc#{_INFOUSR%s}���ǿ�У��������չ���˼��׿����%s����ս��ɽ������۽����޷����ˣ�������ڷ����˴ݻٳ��еļƻ���", nam_ply, cityName );
	BroadMsgByChatPipe(sceneId, selfId, message, 4);

end

--**********************************
-- ����
--**********************************
function x805045_OnHeartBeat(sceneId, selfId, nTick)
	if(1==LuaFnIsCharacterLiving(sceneId, selfId)  and MonsterAI_GetIntParamByIndex(sceneId, selfId, x805045_IDX_BossFightingState)==1 ) then

		local i = 0;
		for i = 1, getn(x805045_SKILL_TBL) do
			local TimeInterval = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerInterval)
			local nCount = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_Count)
			local nState = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_State)
			
			if nState == 0 then
				if x805045_SKILL_TBL[i].SkillCondition == 0 then
					if 0<TimeInterval then
						TimeInterval = TimeInterval - nTick;
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerInterval, TimeInterval)
					else
						nState = 1
					end
				end
				
				if x805045_SKILL_TBL[i].SkillCondition == 1   then
					if nCount==0 then
						--x805045_TipAllHuman(sceneId, GetHp(sceneId, selfId) .. "/" .. GetMaxHp(sceneId, selfId))
						if GetHp(sceneId, selfId) < (GetMaxHp(sceneId, selfId)*x805045_SKILL_TBL[i].SkillBlood)/100 then
							nState = 1	
						end
					end
				end
			end
			
			if nState == 1 then
				if( TimeInterval <=0 and x805045_SKILL_TBL[i].MsgAlarm ~= "") then
					if x805045_SKILL_TBL[i].MsgAlarmType == 0 then
						LuaFnNpcChat(sceneId, selfId, 1, x805045_SKILL_TBL[i].MsgAlarm)
					elseif x805045_SKILL_TBL[i].MsgAlarmType == 1 then
						x805045_TipAllHuman(sceneId, x805045_SKILL_TBL[i].MsgAlarm)
					end
				end
				
				nState = 2
			end
			
			
			if nState == 2 then
				--Countdown TimerPrepare
				local TimePrepare = MonsterAI_GetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerPrepare)
				if(0<TimePrepare) then
					TimePrepare = TimePrepare - nTick;
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerPrepare, TimePrepare)
				else
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerPrepare, x805045_SKILL_TBL[i].AlarmTime)
					MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerInterval, x805045_SKILL_TBL[i].SkilCoolDown)
					
					local nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					
					if x805045_SKILL_TBL[i].TargetType == 1 then
						nTarget = x805045_RandPlayer(sceneId)
					else 
						nTarget = LuaFnGetTargetObjID(sceneId, selfId)
					end
					
					if(-1~=nTarget) then
						
						if (x805045_SKILL_TBL[i].MsgFire ~= "") then
							local msgFire = format(x805045_SKILL_TBL[i].MsgFire, LuaFnGetName(sceneId, nTarget) )
							LuaFnNpcChat(sceneId, selfId, 1, msgFire)
						end
						
						local posX, posZ = GetWorldPos(sceneId,nTarget)
						local fDir = 0.0
						
						if (x805045_SKILL_TBL[i].TargetCord == 1) then
							posX, posZ = GetWorldPos(sceneId,selfId)
						end
						
						if (x805045_SKILL_TBL[i].TargetCord == 2) then
							posX, posZ = GetWorldPos(sceneId,selfId)
							x805045_GenObj(sceneId, 1, posX, posZ - 1)
						end
						
						LuaFnUnitUseSkill(sceneId, selfId, x805045_SKILL_TBL[i].BossSkill, nTarget, posX, posZ, fDir)
						
						if x805045_SKILL_TBL[i].BuffList ~= nil then
							local bidx = 0
							for bidx=1, getn(x805045_SKILL_TBL[i].BuffList) do
								LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, nTarget, x805045_SKILL_TBL[i].BuffList[bidx], 0)
							end
						end
						
						MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_Count, nCount + 1)	
					end
					
					nState = 0
				end
			end
			
			MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_State, nState)
		end
		
	end

end

--**********************************
-- ��ʼ��
--**********************************
function x805045_OnInit(sceneId, selfId)
	local i = 0;
	for i = 1, getn(x805045_SKILL_TBL) do
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerPrepare, x805045_SKILL_TBL[i].AlarmTime)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_TimerInterval, x805045_SKILL_TBL[i].SkilCoolDown)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_SKILL_TBL[i].IDX_Count, 0)
		MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_IDX_BossFightingState, 0)
	end
	
	local genNum = LuaFnGetCopySceneData_Param( sceneId, x805045_g_keySD["genMonsterNum"] )	
	genNum = genNum + 1
	LuaFnSetCopySceneData_Param( sceneId, x805045_g_keySD["genMonsterNum"], genNum )
	
	LuaFnNpcChat(sceneId, selfId, 1, "ɽ������ϣ�����ð����")
end

--**********************************
-- ɱ�����
--**********************************
function x805045_OnKillCharacter(sceneId, selfId, targetId)

end

--**********************************
-- ����ս��
--**********************************
function x805045_OnEnterCombat(sceneId, selfId, enmeyId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_IDX_BossFightingState, 1)
end

--**********************************
-- ����ս��
--**********************************
function x805045_OnLeaveCombat(sceneId, selfId)
	MonsterAI_SetIntParamByIndex(sceneId, selfId, x805045_IDX_BossFightingState, 0)
end

--**********************************
--��ʾ���и��������
--**********************************
function x805045_TipAllHuman( sceneId, Str )
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


function x805045_GenObj( sceneId, listid, x, z )
	if x805045_g_monster_list[listid] == nil then
		return
	end
	
    local IndexList = x805045_g_monster_list[listid].MonsterList
    local IndexListSize = getn( IndexList )
    
    local i=1
    local str
    for i=1, IndexListSize do        
		local MonsterId = x805045_CreateNpc( sceneId, IndexList[i].mType, x, z, IndexList[i].aiType, IndexList[i].aiScript, IndexList[i].scriptId )
    end
end

--���ѡ��һ�����
function x805045_RandPlayer( sceneId )
	-- ��ó�����ͷ��������
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	
	-- û���˵ĳ���
	if nHumanNum < 1 then
		return -1
	end
	
	local nHumanAliveNum = 0
	for i=0, nHumanNum-1  do
		local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsCharacterLiving( sceneId, PlayerId) == 1 then
			nHumanAliveNum = nHumanAliveNum + 1
		end
	end
	
	if nHumanAliveNum < 1 then
		return -1
	end
	
	local rPlayerIndex = random( nHumanAliveNum )
	
	local ind = 0
	local round = 2 * nHumanNum  --���ѭ����
	while round > 0 do
		local PlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, ind )
		if LuaFnIsCharacterLiving( sceneId, PlayerId) == 1 and LuaFnIsObjValid( sceneId, PlayerId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, PlayerId ) == 1 then
			if rPlayerIndex > 0 then
				rPlayerIndex = rPlayerIndex - 1
			else
				return PlayerId
			end
		end
		
		ind = ind + 1
		if ind >= nHumanNum then
			ind = 0
		end
		
		round = round - 1
	end

	
	return -1
end


--**********************************
-- ͨ�ô������ﺯ��
--**********************************
function x805045_CreateNpc(sceneId, NpcId, x, y, Ai, AiFile, Script)
	local PlayerLevel = LuaFnGetCopySceneData_Param( sceneId, x805045_g_keySD["playerLevel"])
	local ModifyLevel = 0
	
	--PrintStr("  "..PlayerLevel.." "..x.." "..y.." ")
	
	if PlayerLevel > 80   then
		ModifyLevel = 1
	end
	if PlayerLevel > 90   then
		ModifyLevel = 2
	end
	if PlayerLevel > 100   then         
		ModifyLevel = 3
	end
	if PlayerLevel > 110   then         
		ModifyLevel = 4
	end
	if PlayerLevel > 120   then         
		ModifyLevel = 5
	end
	if PlayerLevel > 130   then         
		ModifyLevel = 6
	end
	if PlayerLevel > 140   then         
		ModifyLevel = 7
	end
	local nNpcId = NpcId + ModifyLevel-1
	local nMonsterId = LuaFnCreateMonster(sceneId, nNpcId, x, y, Ai, AiFile, Script)
	SetLevel(sceneId, nMonsterId, PlayerLevel)
	
	-- ����û�����óƺţ��оͼӳƺ�
	--x805042_SetNpcTitle(sceneId, nMonsterId)
	local strNpcName = GetName(sceneId, nNpcId )
	if (strNpcName == "��ɽ��") or (strNpcName == "ɽ��") then
			SetCharacterTitle(sceneId, nNpcId, "��ʯͷ���ˡ�")
	end
	
	return nMonsterId
end
