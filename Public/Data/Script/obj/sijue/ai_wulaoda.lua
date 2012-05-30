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
x910007_g_ScriptId	= 910007

--�����߼��ű���....
x910007_g_FuBenScriptId = 002939

--����Buff....
x910007_Buff_MianYi1	= 10473	--����һЩ����Ч��....
x910007_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x910007_SkillID_A		= 1033
x910007_SkillID_B		= 1034
x910007_SkillID_C		= 1035
x910007_SkillID_D		= 1036

x910007_BuffID_D1		= 10253
x910007_BuffID_D2		= 10254

x910007_SkillCD_A		=	40000
x910007_SkillCD_BC	=	30000

x910007_SkillA_Damage =
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

x910007_BrotherName = "��ƽ����"	--�ֵܵ�����....


--AI Index....
x910007_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1��Ҫ����� 2�Ѿ������
x910007_IDX_CurSkillIndex	= 2	--��������ʹ��BC�е��ĸ�����....
x910007_IDX_CD_SkillA			= 3	--A���ܵ�CD....
x910007_IDX_CD_SkillBC		= 4	--BC���ܵ�CD....

x910007_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x910007_OnInit(sceneId, selfId)
	--����AI....
	x910007_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x910007_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x910007_IDX_CombatFlag ) then
		return
	end

	--A��������....
	if 1 == x910007_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--BC��������....
	if 1 == x910007_TickSkillBC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x910007_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x910007_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910007_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910007_Buff_MianYi2, 0 )

	--����AI....
	x910007_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910007_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x910007_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x910007_ResetMyAI( sceneId, selfId )

	--�������������еĹ�....Ѱ���ֵܲ�����ɾ��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x910007_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x910007_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x910007_OnDie( sceneId, selfId, killerId )

	--����AI....
	x910007_ResetMyAI( sceneId, selfId )

--	local bFind = 0

	--�������������еĹ�....Ѱ���ֵ�....����������Ҫʹ�ÿ񱩼���....
--	local nMonsterNum = GetMonsterCount(sceneId)
--	for i=0, nMonsterNum-1 do
--		local MonsterId = GetMonsterObjID(sceneId,i)
--		if x910007_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
--			bFind = 1
--			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x910007_IDX_KuangBaoMode, 1 )
--		end
--	end

	--���û�ҵ��ֵ���˵����ʣ�Լ�һ����....
--	if 0 == bFind then
		--������ľԪ....
--		local MstId = CallScriptFunction( x910007_g_FuBenScriptId, "CreateBOSS", sceneId, "DuanMuYuan_BOSS", -1, -1 )
--		LuaFnNpcChat(sceneId, MstId, 0, "#{PMF_20080521_18}")
		--�����Ѿ���ս��˫��....
--		CallScriptFunction( x910007_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
--	end
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
		str = format("#{_INFOUSR%s}#P���ڶ�������ľ�ׯ#P��׷��#Y[����]#P�ʹ�......#Y[����]#Pͻ�����ಡ�������������", playerName); --���ϴ�
		AddGlobalCountNews( sceneId, str )
	end


end


--**********************************
--����AI....
--**********************************
function x910007_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CurSkillIndex, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillA, x910007_SkillCD_A )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillBC, x910007_SkillCD_BC )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x910007_IDX_CombatFlag, 0 )

end


--**********************************
--A��������....
--**********************************
function x910007_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillA )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillA, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillA, x910007_SkillCD_A-(nTick-cd) )
		return x910007_UseSkillA( sceneId, selfId )
	end

end


--**********************************
--BC��������....
--**********************************
function x910007_TickSkillBC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillBC )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillBC, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CD_SkillBC, x910007_SkillCD_BC-(nTick-cd) )

		local CurSkill = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910007_IDX_CurSkillIndex )
		if CurSkill == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CurSkillIndex, 2 )
			return x910007_UseSkillB( sceneId, selfId )
		elseif CurSkill == 2 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_CurSkillIndex, 1 )
			return x910007_UseSkillC( sceneId, selfId )
		end

	end

end


--**********************************
--D��������....
--**********************************
function x910007_TickSkillD( sceneId, selfId, nTick )

	--��õ�ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x910007_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�������Ҫ�񱩻����Ѿ������򷵻�....
		return 0

	elseif CurMode == 1 then

		--�����Ҫ����ʹ�ÿ񱩼���....
		local ret =  x910007_UseSkillD( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x910007_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��A����....
--**********************************
function x910007_UseSkillA( sceneId, selfId )

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
	LuaFnUnitUseSkill( sceneId, selfId, x910007_SkillID_A, enemyId, x, z, 0, 1 )

	--�����ɿ�Ѫ....
	local MenPai = GetMenPai( sceneId, enemyId )
	local Damage = x910007_SkillA_Damage[ MenPai ]
	IncreaseHp( sceneId, enemyId, -Damage )

	--����....
	MonsterTalk( sceneId, -1, "", "#ccc9933[����]"..GetName(sceneId,enemyId).."#W������������֪����ô���ġ�" )

	return 1

end


--**********************************
--ʹ��B����....
--**********************************
function x910007_UseSkillB( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x910007_SkillID_B, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#ccc9933[����]#W��ɱ�Ϸ����ѡ�" )
	return 1

end


--**********************************
--ʹ��C����....
--**********************************
function x910007_UseSkillC( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x910007_SkillID_C, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#ccc9933[����]#WС�ӣ����Ϸ����ԣ��㻹���˵�..." )
	return 1

end


--**********************************
--ʹ��D����....
--**********************************
function x910007_UseSkillD( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910007_BuffID_D1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x910007_BuffID_D2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x910007_SkillID_D, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{PMF_20080530_22}" )
	return 1

end