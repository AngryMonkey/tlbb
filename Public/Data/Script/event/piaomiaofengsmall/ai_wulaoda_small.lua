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
x402279_g_ScriptId	= 402279

--�����߼��ű���....
x402279_g_FuBenScriptId = 402276

--����Buff....
x402279_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x402279_Buff_MianYi2	= 10471	--������ͨ����....

--ABC����....
x402279_SkillA			= 1111	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_SkillB			= 1112	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_BuffB				= 19803	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_SkillC			= 1113	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_SpeObjC			= 72	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_SkillABC_CD	=	20000

--D����....
x402279_BuffD				= 19801	--�򵥰���翷�ʹ���˺������˵İ汾....
x402279_SkillD_CD		= 5000


--AI Index....
x402279_IDX_CD_SkillABC		= 1	--ABC���ܵ�CD....
x402279_IDX_CurSkillIndex	= 2	--��������ʹ��ABC�е��ĸ�����....
x402279_IDX_CD_SkillD			= 3	--D���ܵ�CD....

x402279_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x402279_OnInit(sceneId, selfId)
	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

end


--**********************************
--����....
--**********************************
function x402279_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag ) then
		return
	end

	--ABC��������....
	if 1 == x402279_TickSkillABC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402279_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x402279_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402279_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402279_Buff_MianYi2, 0 )

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x402279_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x402279_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x402279_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402279_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402279_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	SetCharacterDieTime( sceneId, selfId, 3000 )

	--�������ϴ������ļ�ʱ��....
	local x,z = GetWorldPos( sceneId, selfId )
	CallScriptFunction( x402279_g_FuBenScriptId, "OpenWuLaoDaDieTimer", sceneId, 4, x402279_g_ScriptId, x, z )

	--�����Ѿ���ս�����ϴ�....
	CallScriptFunction( x402279_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "WuLaoDa", 2 )

	--�����û����ս��˫���������ս˫��....
	if 2 ~= CallScriptFunction( x402279_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "ShuangZi" )	then
		CallScriptFunction( x402279_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 1 )
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
		str = format("#{_INFOUSR%s}#{XPM_8724_4}", playerName);      --���ϴ�
		AddGlobalCountNews( sceneId, str )
	end

end


--**********************************
--����AI....
--**********************************
function x402279_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, x402279_SkillABC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, x402279_SkillD_CD )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402279_IDX_CombatFlag, 0 )

	--�����������D��buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x402279_BuffD )
		end
	end

end


--**********************************
--ABC��������....
--**********************************
function x402279_TickSkillABC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillABC, x402279_SkillABC_CD-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 2 )
			return x402279_UseSkillA( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 3 )
			return x402279_UseSkillB( sceneId, selfId )
		elseif CurSkill == 3 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CurSkillIndex, 1 )
			return x402279_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D��������....
--**********************************
function x402279_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402279_IDX_CD_SkillD, x402279_SkillD_CD-(nTick-cd) )
		return x402279_UseSkillD( sceneId, selfId )

	end

end


--**********************************
--ʹ��A����....
--**********************************
function x402279_UseSkillA( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillA, selfId, x, z, 0, 1 )
	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x402279_UseSkillB( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillB, PlayerId, x, z, 0, 1 )

	--�����buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402279_BuffB, 0 )

	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x402279_UseSkillC( sceneId, selfId )

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
	CreateSpecialObjByDataIndex( sceneId, selfId, x402279_SpeObjC, x, z, 0 )

	--����....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_17}" )

	--���Լ�ʹ��һ��ֻ����Ч�Ŀռ���....
	x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402279_SkillC, selfId, x, z, 0, 1 )

	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x402279_UseSkillD( sceneId, selfId )

	--�������������˼�buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x402279_BuffD, 0 )
		end
	end

end


--**********************************
--���ϴ�������ʱ��OnTimer....
--���ڿ����������ӳ�ˢ��ս�����ϴ�....
--**********************************
function x402279_OnHaDaBaDieTimer( sceneId, step, posX, posY )

	if 1 == step then
		--����ս�ܵ����ϴ�NPC....
		local MstId = CallScriptFunction( x402279_g_FuBenScriptId, "CreateBOSS", sceneId, "WuLaoDaLoss_NPC", posX, posY )
		SetUnitReputationID( sceneId, MstId, MstId, 0 )
		SetPatrolId(sceneId, MstId, 0)
	end

end
