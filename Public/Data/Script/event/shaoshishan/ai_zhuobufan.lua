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
x890067_g_ScriptId	= 890067

--�����߼��ű���....
x890067_g_FuBenScriptId = 890063

--����Buff....
x890067_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x890067_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x890067_SkillID_A		= 748
x890067_SkillID_B		= 750
x890067_SkillID_C		= 751
x890067_SkillID_D		= 635

x890067_BuffID_D1		= 6781
x890067_BuffID_D2		= 6781

x890067_SkillCD_A		=	40000
x890067_SkillCD_BC	=	30000

x890067_SkillA_Damage =
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

x890067_BrotherName = "˾����"	--�ֵܵ�����....


--AI Index....
x890067_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1��Ҫ����� 2�Ѿ������
x890067_IDX_CurSkillIndex	= 2	--��������ʹ��BC�е��ĸ�����....
x890067_IDX_CD_SkillA			= 3	--A���ܵ�CD....
x890067_IDX_CD_SkillBC		= 4	--BC���ܵ�CD....

x890067_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x890067_OnInit(sceneId, selfId)
	--����AI....
	x890067_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x890067_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890067_IDX_CombatFlag ) then
		return
	end

	--A��������....
	if 1 == x890067_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--BC��������....
	if 1 == x890067_TickSkillBC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x890067_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x890067_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890067_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890067_Buff_MianYi2, 0 )

	--����AI....
	x890067_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890067_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x890067_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x890067_ResetMyAI( sceneId, selfId )

	--�������������еĹ�....Ѱ���ֵܲ�����ɾ��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890067_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x890067_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x890067_OnDie( sceneId, selfId, killerId )

	--����AI....
	x890067_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--�������������еĹ�....Ѱ���ֵ�....����������Ҫʹ�ÿ񱩼���....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890067_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x890067_IDX_KuangBaoMode, 1 )
		end
	end

	--���û�ҵ��ֵ���˵����ʣ�Լ�һ����....
	if 0 == bFind then
		--������ľԪ....
		local MstId = CallScriptFunction( x890067_g_FuBenScriptId, "CreateBOSS", sceneId, "YouDanZhi_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{CJG_101231_244}")
		--�����Ѿ���ս��˫��....
		CallScriptFunction( x890067_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--����AI....
--**********************************
function x890067_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillA, x890067_SkillCD_A )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillBC, x890067_SkillCD_BC )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890067_IDX_CombatFlag, 0 )

end


--**********************************
--A��������....
--**********************************
function x890067_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillA )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillA, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillA, x890067_SkillCD_A-(nTick-cd) )
		return x890067_UseSkillA( sceneId, selfId )
	end

end


--**********************************
--BC��������....
--**********************************
function x890067_TickSkillBC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillBC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillBC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CD_SkillBC, x890067_SkillCD_BC-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890067_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CurSkillIndex, 2 )
			return x890067_UseSkillB( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_CurSkillIndex, 1 )
			return x890067_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D��������....
--**********************************
function x890067_TickSkillD( sceneId, selfId, nTick )

	--��õ�ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890067_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�������Ҫ�񱩻����Ѿ������򷵻�....
		return 0

	elseif CurMode == 1 then

		--�����Ҫ����ʹ�ÿ񱩼���....
		local ret =  x890067_UseSkillD( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890067_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��A����....
--**********************************
function x890067_UseSkillA( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x890067_SkillID_A, enemyId, x, z, 0, 1 )

	--�����ɿ�Ѫ....
	local MenPai = GetMenPai( sceneId, enemyId )
	local Damage = x890067_SkillA_Damage[ MenPai ]
	IncreaseHp( sceneId, enemyId, -Damage )

	--����....
	MonsterTalk( sceneId, -1, "", "#{CJG_101231_279}"..GetName(sceneId,enemyId).."#CJG_101231_280}" )

	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x890067_UseSkillB( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890067_SkillID_B, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{CJG_101231_281}" )
	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x890067_UseSkillC( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890067_SkillID_C, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{CJG_101231_283}" )
	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x890067_UseSkillD( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890067_BuffID_D1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890067_BuffID_D2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890067_SkillID_D, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{CJG_101231_308}" )
	return 1

end
