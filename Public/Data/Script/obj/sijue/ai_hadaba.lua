--Ʈ��� �����AI

--A �������ߡ����Լ���һ���ռ���....���з�������ҼӶ���buff....
--B ������֮ʹ�����Լ��Ӳ����ƶ�˫������buff....
--C ������֮ʹ�����Լ����ܵ��˺��ӱ�buff....
--D ��˿���֮ʹ�����Լ��ӱ�������Ƶ�buff....
--E ����񡿸��Լ���һ������buff....

--ȫ�̶����������ƶ����ܵ�buff....
--20���ʼʹ��A����....��ȴ20��....
--25���ʼѭ���ͷ�BCD����....��ȴ�ֱ���20..20..30....
--5���Ӻ�����ģʽ....ֹͣʹ��ABCD....���ABCD��buff....ʹ��E����....

--�ű���
x910005_g_ScriptId	= 910005

--�����߼��ű���....
x910005_g_FuBenScriptId = 002939

--buff....
x910005_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x910005_Buff_MianYi2	= 10471	--������ͨ����....
x910005_Skill_A			=	1024
x910005_Buff_A			= 10230
x910005_Skill_B			=	1025
x910005_Buff_B			= 10231
x910005_Skill_C			=	1026
x910005_Buff_C			= 10232
x910005_Skill_D			=	1027
x910005_Buff_D			= 10233
x910005_Buff_E1			= 10234
x910005_Buff_E2			= 10235

--�����ͷ�ʱ���....
x910005_UseSkillList =
{
	{ 10,  "A" },
	{ 15,  "B" },
	{ 20,  "A" },
	{ 25,  "C" },
	{ 30,  "A" },
	{ 35,  "D" },
	{ 40,  "A" },
	{ 45,  "B" },
	{ 50, "A" },
	{ 55, "C" },
	{ 120, "A" },
	{ 135, "D" },
	{ 140, "A" },
	{ 160, "A" },
	{ 165, "B" },
	{ 180, "A" },
	{ 185, "C" },
	{ 200, "A" },
	{ 205, "D" },
	{ 220, "A" },
	{ 235, "B" },
	{ 240, "A" },
	{ 255, "C" },
	{ 260, "A" },
	{ 275, "D" },
	{ 280, "A" },
	{ 300, "E" }
}


--AI Index....
x910005_IDX_CombatTime		= 1	--����ս���ļ�ʱ��....���ڼ�¼�Ѿ�����ս���೤ʱ����....
x910005_IDX_UseSkillIndex	= 2	--��������ʹ�ü��ܱ��еĵڼ�������....

x910005_IDX_CombatFlag 			= 1	--�Ƿ���ս��״̬�ı�־....
x910005_IDX_IsKuangBaoMode	= 2	--�Ƿ��ڿ�ģʽ�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x910005_OnInit(sceneId, selfId)
	--����AI....
	x910005_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x910005_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x910005_IDX_CombatFlag ) then
		return
	end

	--��״̬����Ҫ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x910005_IDX_IsKuangBaoMode ) then
		return
	end

	--==================================
	--���ݽ�Ŀ���ͷż���....
	--==================================

	--���ս��ʱ����Ѿ�ִ�е����ܱ��еĵڼ���....
	local CombatTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910005_IDX_CombatTime )
	local NextSkillIndex = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910005_IDX_UseSkillIndex )
	--�ۼӽ���ս����ʱ��....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910005_IDX_CombatTime, CombatTime + nTick )

	--����Ѿ�ִ�������ż��ܱ���ʹ�ü���....
	if NextSkillIndex < 1 or NextSkillIndex > getn( x910005_UseSkillList ) then
		return
	end

	--����Ѿ�������������ܵ�ʱ����ʹ�ü���....
	local SkillData = x910005_UseSkillList[NextSkillIndex]
	if ( CombatTime + nTick ) >= SkillData[1]*1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x910005_IDX_UseSkillIndex, NextSkillIndex+1 )
		x910005_UseMySkill( sceneId, selfId, SkillData[2] )
	end


end


--**********************************
--����ս��....
--**********************************
function x910005_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_MianYi2, 0 )

	--����AI....
	x910005_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910005_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x910005_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x910005_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

	--�����Ի�NPC....
	local MstId = CallScriptFunction( x910005_g_FuBenScriptId, "CreateBOSS", sceneId, "HaDaBa_NPC", -1, -1 )
	SetUnitReputationID( sceneId, MstId, MstId, 0 )

end


--**********************************
--ɱ������....
--**********************************
function x910005_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x910005_OnDie( sceneId, selfId, killerId )

	--����AI....
	x910005_ResetMyAI( sceneId, selfId )

	--�����Ѿ���ս�������....
--	CallScriptFunction( x910005_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "HaDaBa", 2 )

	--�����û����ս��ɣ�����������սɣ����....
	if 2 ~= CallScriptFunction( x910005_g_FuBenScriptId, "GetBossBattleFlag", sceneId, "SangTuGong" ) then
		CallScriptFunction( x910005_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "SangTuGong", 1 )
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
		str = format("#{_INFOUSR%s}#P���ľ�ׯ#P����#Y[��ī]#P��ǿ���ţ�һ�Ƕ��⣬������������ȭ......#Y[��ī]#P�յֲ�ס���������ľ���֮�ϡ�", playerName); --�����
		AddGlobalCountNews( sceneId, str )
	end

end


--**********************************
--����AI....
--**********************************
function x910005_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910005_IDX_CombatTime, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910005_IDX_UseSkillIndex, 1 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910005_IDX_IsKuangBaoMode, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910005_IDX_CombatFlag, 0 )

	--���buff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_D )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_E1 )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_E2 )

end


--**********************************
--BOSSʹ�ü���....
--**********************************
function x910005_UseMySkill( sceneId, selfId, skill )

	if skill == "A" then

		x910005_SkillA_NaLiZou( sceneId, selfId )

	elseif skill == "B" then

		MonsterTalk(sceneId, -1, "", "#ccc9933[��ī]#W���ϣ����ϣ��Ⱥ���..." )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x910005_Skill_B, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_B, 2000 )

	elseif skill == "C" then

		MonsterTalk(sceneId, -1, "", "#ccc9933[��ī]#W�����ˣ�ͷ�����͵�..." )
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x910005_Skill_C, selfId, x, z, 0, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_C, 0 )

	elseif skill == "D" then

		local enemyId = GetMonsterCurEnemy( sceneId, selfId )
		if enemyId > 0 then
			if GetCharacterType( sceneId, enemyId ) == 3 then
				enemyId = GetPetCreator( sceneId, enemyId )
			end
			MonsterTalk(sceneId, -1, "", "#ccc9933[��ī]#W�ҿ�ʼ�����ˣ����������..." )
			local x,z = GetWorldPos( sceneId, selfId )
			LuaFnUnitUseSkill( sceneId, selfId, x910005_Skill_D, selfId, x, z, 0, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, enemyId, selfId, x910005_Buff_D, 0 )
		end

	elseif skill == "E" then

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910005_IDX_IsKuangBaoMode, 1 )
		x910005_SkillE_KuangBao( sceneId, selfId )

	end

end


--**********************************
--�����߼���....�Է�������Ҽ�buff....
--**********************************

function x910005_SkillA_NaLiZou( sceneId, selfId )

	MonsterTalk(sceneId, -1, "", "#ccc9933[��ī]#W���ҵĶ�����..." )

	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do

		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			if GetMenPai(sceneId,nHumanId) ~= MP_SHAOLIN then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, nHumanId, x910005_Buff_A, 0 )
				local x,z = GetWorldPos( sceneId, selfId )
				LuaFnUnitUseSkill( sceneId, selfId, x910005_Skill_A, selfId, x, z, 0, 0 )
			end
		end

	end

end


--**********************************
--�񱩼���....
--**********************************
function x910005_SkillE_KuangBao( sceneId, selfId )

	--ȡ��BCD��buff....
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_B )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_C )
	LuaFnCancelSpecificImpact( sceneId, selfId, x910005_Buff_D )

	--�ӿ�buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_E1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910005_Buff_E2, 0 )

end
