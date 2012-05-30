--Ʈ��� ���ϴ�AI

--A	�������յ��������Ⱥ��....
--B ����Զ�ҩ����ͨ����....ȫ���������һ���˶����ͷſռ���....�ٸ���Ӹ�buff....
--C ���̲���¶�����Լ�ʹ��һ���ռ���....ͬʱ�ڵ�ǰ���˽��·Ÿ�����....
--D �����Ա任��ÿ��5���ȫ���������˼�һ��buff....

--ȫ�̶����������ƶ����ܵ�buff....
--20���ʼѭ���ͷ�ABC����....��ȴ20��....
--ÿ5��ʹ��һ��D....
--BOSS����������ս��������������D��buff....


--�ű���
x402266_g_ScriptId	= 402266

--�����߼��ű���....
x402266_g_FuBenScriptId = 402263

--����Buff....
x402266_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x402266_Buff_MianYi2	= 10471	--������ͨ����....

--ABC����....
x402266_SkillA			= 1030
x402266_SkillB			= 1032
x402266_BuffB				= 10244
x402266_SkillC			= 1031
x402266_SpeObjC			= 54
x402266_SkillABC_CD	=	20000

--D����....
x402266_BuffD				= 10249
x402266_SkillD_CD		= 5000


--AI Index....
x402266_IDX_CD_SkillABC		= 1	--ABC���ܵ�CD....
x402266_IDX_CurSkillIndex	= 2	--��������ʹ��ABC�е��ĸ�����....
x402266_IDX_CD_SkillD			= 3	--D���ܵ�CD....

x402266_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x402266_OnInit(sceneId, selfId)
	--����AI....
	x402266_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x402266_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag ) then
		return
	end

	--ABC��������....
	if 1 == x402266_TickSkillABC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402266_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x402266_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402266_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402266_Buff_MianYi2, 0 )

	--����AI....
	x402266_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x402266_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402266_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x402266_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x402266_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402266_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402266_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--�������ϴ������ļ�ʱ��....
	local x,z = GetWorldPos( sceneId, selfId )
	CallScriptFunction( x402266_g_FuBenScriptId, "OpenWuLaoDaDieTimer", sceneId, 4, x402266_g_ScriptId, x, z )

	--�����Ѿ���ս�����ϴ�....
	CallScriptFunction( x402266_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "WuLaoDa", 2 )

	--�����û����ս��˫���������ս˫��....
	if 2 ~= CallScriptFunction( x402266_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" )	then
		CallScriptFunction( x402266_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 1 )
	end
	
	-- zchw ȫ�򹫸�
	local	playerName	= GetName( sceneId, killerId )
	
	--ɱ��������ǳ������ȡ�����˵�����....
	local playerID = killerId
	local objType = GetCharacterType( sceneId, killerId )
	if objType == 3 then
		playerID = GetPetCreator( sceneId, killerId )
		playerName = GetName( sceneId, playerID )
	end
	
	--��������������ȡ�ӳ�������....
	local leaderID = GetTeamLeader( sceneId, playerID )
	if leaderID ~= -1 then
		playerName = GetName( sceneId, leaderID )
	end
	
	if playerName ~= nil then
		str = format("#{_INFOUSR%s}#{PMF_8812_03}", playerName); --���ϴ�
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--����AI....
--**********************************
function x402266_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillABC, x402266_SkillABC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402266_IDX_CD_SkillD, x402266_SkillD_CD )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402266_IDX_CombatFlag, 0 )

	--�����������D��buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402266_BuffD )
		end
	end

end


--**********************************
--ABC��������....
--**********************************
function x402266_TickSkillABC( sceneId, selfId, nTick )

	--���¼���CD....
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
--D��������....
--**********************************
function x402266_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
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
--ʹ��A����....
--**********************************
function x402266_UseSkillA( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillA, selfId, x, z, 0, 1 )
	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x402266_UseSkillB( sceneId, selfId )

	--��������Ч����ҵ��б�....
	local PlayerList = {}

	--����Ч���˼����б�....
	local numPlayer = 0
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[numPlayer+1] = nHumanId
			numPlayer = numPlayer + 1
		end
	end

	--�����ѡһ�����....
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--����ʹ�ü���....
	local x,z = GetWorldPos( sceneId, PlayerId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillB, PlayerId, x, z, 0, 1 )

	--�����buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402266_BuffB, 0 )

	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x402266_UseSkillC( sceneId, selfId )

	--��õ�ǰ����....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--�ڸõ��˽��·Ÿ�����....
	local x,z = GetWorldPos( sceneId, enemyId )
	CreateSpecialObjByDataIndex( sceneId, selfId, x402266_SpeObjC, x, z, 0 )

	--����....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_17}" )

	--���Լ�ʹ��һ��ֻ����Ч�Ŀռ���....
	x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402266_SkillC, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x402266_UseSkillD( sceneId, selfId )

	--�������������˼�buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x402266_BuffD, 0 )
		end
	end

end


--**********************************
--���ϴ�������ʱ��OnTimer....
--���ڿ����������ӳ�ˢ��ս�����ϴ�....
--**********************************
function x402266_OnHaDaBaDieTimer( sceneId, step, posX, posY )

	if 1 == step then
		--����ս�ܵ����ϴ�NPC....
		local MstId = CallScriptFunction( x402266_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDaLoss_NPC", posX, posY )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )
		SetPatrolId(sceneId, MstId, 0)
	end

end
