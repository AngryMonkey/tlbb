--Ʈ��� ׿����AI

--A	����â��ʹ��һ���ռ���....�ٰ�����setdamage....
--B ����ס����Լ���һ����buff�ļ���....
--C �����������Լ���һ����buff�ļ���....
--D	�����ѡ���ƽ������ʱ���Լ���һ����buff�ļ���....


--ȫ�̶����������ƶ����ܵ�buff....
--ÿ��40��Ե�ǰ����ʹ��A....
--ÿ��30������ʹ��BC....
--����ʱѰ�Ҳ�ƽ����....��������Ҫʹ�ÿ񱩼���....
--����ʱ���ֲ�ƽ�����Ѿ�����....�򴴽���һ��BOSS....


--�ű���
x402267_g_ScriptId	= 402267

--�����߼��ű���....
x402267_g_FuBenScriptId = 402263

--����Buff....
x402267_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x402267_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x402267_SkillID_A		= 1033
x402267_SkillID_B		= 1034
x402267_SkillID_C		= 1035
x402267_SkillID_D		= 1036

x402267_BuffID_D1		= 10253
x402267_BuffID_D2		= 10254

x402267_SkillCD_A		=	40000
x402267_SkillCD_BC	=	30000

x402267_SkillA_Damage =
{
	[0] = 23815,
	[1] = 16570,
	[2] = 18820,
	[3] = 11978,
	[4] = 13170,
	[5] = 15610,
	[6] = 14496,
	[7] = 15240,
	[8] = 14070,
	[9] = 99999
}

x402267_BrotherName = "��ƽ����"	--�ֵܵ�����....


--AI Index....
x402267_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1��Ҫ����� 2�Ѿ������
x402267_IDX_CurSkillIndex	= 2	--��������ʹ��BC�е��ĸ�����....
x402267_IDX_CD_SkillA			= 3	--A���ܵ�CD....
x402267_IDX_CD_SkillBC		= 4	--BC���ܵ�CD....

x402267_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x402267_OnInit(sceneId, selfId)
	--����AI....
	x402267_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x402267_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402267_IDX_CombatFlag ) then
		return
	end

	--A��������....
	if 1 == x402267_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--BC��������....
	if 1 == x402267_TickSkillBC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402267_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x402267_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402267_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402267_Buff_MianYi2, 0 )

	--����AI....
	x402267_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402267_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x402267_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402267_ResetMyAI( sceneId, selfId )

	--�������������еĹ�....Ѱ���ֵܲ�����ɾ��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402267_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x402267_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402267_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402267_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--�������������еĹ�....Ѱ���ֵ�....����������Ҫʹ�ÿ񱩼���....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x402267_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x402267_IDX_KuangBaoMode, 1 )
		end
	end

	--���û�ҵ��ֵ���˵����ʣ�Լ�һ����....
	if 0 == bFind then
		--������ľԪ....
		local MstId = CallScriptFunction( x402267_g_FuBenScriptId, "CreateBOSS", sceneId, "DuanMuYuan_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{PMF_20080521_18}")
		--�����Ѿ���ս��˫��....
		CallScriptFunction( x402267_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--����AI....
--**********************************
function x402267_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillA, x402267_SkillCD_A )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillBC, x402267_SkillCD_BC )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402267_IDX_CombatFlag, 0 )

end


--**********************************
--A��������....
--**********************************
function x402267_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillA )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillA, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillA, x402267_SkillCD_A-(nTick-cd) )
		return x402267_UseSkillA( sceneId, selfId )
	end

end


--**********************************
--BC��������....
--**********************************
function x402267_TickSkillBC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillBC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillBC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CD_SkillBC, x402267_SkillCD_BC-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402267_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CurSkillIndex, 2 )
			return x402267_UseSkillB( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_CurSkillIndex, 1 )
			return x402267_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D��������....
--**********************************
function x402267_TickSkillD( sceneId, selfId, nTick )

	--��õ�ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402267_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�������Ҫ�񱩻����Ѿ������򷵻�....
		return 0

	elseif CurMode == 1 then

		--�����Ҫ����ʹ�ÿ񱩼���....
		local ret =  x402267_UseSkillD( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x402267_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��A����....
--**********************************
function x402267_UseSkillA( sceneId, selfId )

	--��õ�ǰ����....
	local enemyId = GetMonsterCurEnemy( sceneId, selfId )
	if enemyId <= 0 then
		return 0
	end
	if GetCharacterType( sceneId, enemyId ) == 3 then
		enemyId = GetPetCreator( sceneId, enemyId )
	end

	--ʹ��һ���ռ���....
	local x,z = GetWorldPos( sceneId, enemyId )
	LuaFnUnitUseSkill( sceneId, selfId, x402267_SkillID_A, enemyId, x, z, 0, 1 )

	--�����ɿ�Ѫ....
	local MenPai = GetMenPai( sceneId, enemyId )
	local Damage = x402267_SkillA_Damage[ MenPai ]
	IncreaseHp( sceneId, enemyId, -Damage )

	--����....
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_18}"..GetName(sceneId,enemyId).."#{PMF_20080530_19}" )

	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x402267_UseSkillB( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402267_SkillID_B, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_20}" )
	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x402267_UseSkillC( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402267_SkillID_C, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_21}" )
	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x402267_UseSkillD( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402267_BuffID_D1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402267_BuffID_D2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402267_SkillID_D, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_22}" )
	return 1

end
