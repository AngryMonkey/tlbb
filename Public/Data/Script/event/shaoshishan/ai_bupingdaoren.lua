--Ʈ��� ��ƽ����AI

--F	�����ס����Լ���һ���ռ���....�ٸ���ҼӸ��������ص��ű���buff....�ص�ʱ��BOSS������Χ�˼��˺�buff������....
--G �����㡿���Լ���һ����buff�ļ���....
--H ���̻������Լ���һ���ռ���....�ٸ���ҼӸ��������ص��ű���buff....�ص�ʱ����....
--I	�����ѡ�׿������ʱ���Լ���һ����buff�ļ���....


--ȫ�̶����������ƶ����ܵ�buff....
--ÿ��30������������ʹ��FH....
--ÿ��45����Լ�ʹ��G....
--����������ս��ʱ������������FH��buff....
--����ʱѰ�Ҳ�ƽ����....��������Ҫʹ�ÿ񱩼���....
--����ʱ���ֲ�ƽ�����Ѿ�����....�򴴽���һ��BOSS....


--�ű���
x890068_g_ScriptId	= 890068

--�����߼��ű���....
x890068_g_FuBenScriptId = 890063

--����Buff....
x890068_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x890068_Buff_MianYi2	= 10471	--������ͨ����....

--����....
x890068_SkillID_F		= 1037
x890068_BuffID_F1		= 10255
x890068_BuffID_F2		= 10256
x890068_SkillID_G		= 589
x890068_SkillID_H		= 599
x890068_BuffID_H		= 18204
x890068_SkillID_I		= 635
x890068_BuffID_I1		= 6781
x890068_BuffID_I2		= 6781

x890068_SkillCD_FH	=	30000
x890068_SkillCD_G		=	45000


x890068_MyName			= "˾����"	--�Լ�������....
x890068_BrotherName = "Ҧ����"		--�ֵܵ�����....


--AI Index....
x890068_IDX_KuangBaoMode	= 1	--��ģʽ....0δ�� 1��Ҫ����� 2�Ѿ������
x890068_IDX_CD_SkillFH		= 2	--FH���ܵ�CD....
x890068_IDX_CD_SkillG			= 3	--G���ܵ�CD....
x890068_IDX_CD_Talk				= 4	--FH���ܺ�����CD....

x890068_IDX_CombatFlag 		= 1	--�Ƿ���ս��״̬�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x890068_OnInit(sceneId, selfId)
	--����AI....
	x890068_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x890068_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag ) then
		return
	end

	--FH��������....
	if 1 == x890068_TickSkillFH( sceneId, selfId, nTick ) then
		return
	end

	--G��������....
	if 1 == x890068_TickSkillG( sceneId, selfId, nTick ) then
		return
	end

	--I��������....
	if 1 == x890068_TickSkillI( sceneId, selfId, nTick ) then
		return
	end

end


--**********************************
--����ս��....
--**********************************
function x890068_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_Buff_MianYi2, 0 )

	--����AI....
	x890068_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x890068_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x890068_ResetMyAI( sceneId, selfId )

	--�������������еĹ�....Ѱ���ֵܲ�����ɾ��....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) then
			LuaFnDeleteMonster( sceneId, MonsterId )
		end
	end

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x890068_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x890068_OnDie( sceneId, selfId, killerId )

	--����AI....
	x890068_ResetMyAI( sceneId, selfId )

	local bFind = 0

	--�������������еĹ�....Ѱ���ֵ�....����������Ҫʹ�ÿ񱩼���....
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_BrotherName == GetName( sceneId, MonsterId ) and LuaFnIsCharacterLiving(sceneId, MonsterId) == 1 then
			bFind = 1
			MonsterAI_SetIntParamByIndex( sceneId, MonsterId, x890068_IDX_KuangBaoMode, 1 )
		end
	end

	--���û�ҵ��ֵ���˵����ʣ�Լ�һ����....
	if 0 == bFind then
		--������ľԪ....
		local MstId = CallScriptFunction( x890068_g_FuBenScriptId, "CreateBOSS", sceneId, "YouDanZhi_BOSS", -1, -1 )
		LuaFnNpcChat(sceneId, MstId, 0, "#{CJG_101231_244}")
		--�����Ѿ���ս��˫��....
		CallScriptFunction( x890068_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "ShuangZi", 2 )
	end

end


--**********************************
--����AI....
--**********************************
function x890068_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, x890068_SkillCD_FH )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, x890068_SkillCD_G )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_Talk, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x890068_IDX_CombatFlag, 0 )

	--������������FH��buff....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 then
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890068_BuffID_F1 )
			LuaFnCancelSpecificImpact( sceneId, nHumanId, x890068_BuffID_H )
		end
	end

end


--**********************************
--FH��������....
--**********************************
function x890068_TickSkillFH( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH )
	if cd > nTick then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, cd-nTick )
		return 0

	else

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillFH, x890068_SkillCD_FH-(nTick-cd) )

		--���ʹ��FH....
		if random(100) < 50 then
			return x890068_UseSkillF( sceneId, selfId )
		else
			return x890068_UseSkillH( sceneId, selfId )
		end

	end

end


--**********************************
--G��������....
--**********************************
function x890068_TickSkillG( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_CD_SkillG, x890068_SkillCD_G-(nTick-cd) )
		return x890068_UseSkillG( sceneId, selfId )
	end

end


--**********************************
--I��������....
--**********************************
function x890068_TickSkillI( sceneId, selfId, nTick )

	--��õ�ǰ��mode....
	local CurMode = MonsterAI_GetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode )

	if CurMode == 0 or CurMode == 2 then

		--�������Ҫ�񱩻����Ѿ������򷵻�....
		return 0

	elseif CurMode == 1 then

		--�����Ҫ����ʹ�ÿ񱩼���....
		local ret =  x890068_UseSkillI( sceneId, selfId )
		if ret == 1 then
			MonsterAI_SetIntParamByIndex( sceneId, selfId, x890068_IDX_KuangBaoMode, 2 )
			return 1
		else
			return 0
		end

	end

end


--**********************************
--ʹ��F����....
--**********************************
function x890068_UseSkillF( sceneId, selfId )

	--��������Ч����ҵ��б�....
	local PlayerList = {}

	--����Ч���˼����б�....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[i+1] = nHumanId
		end
	end

	--�����ѡһ�����....
	local numPlayer = getn(PlayerList)
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_F, selfId, x, z, 0, 1 )

	--����Ҽӽ�����ص��ű���buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890068_BuffID_F1, 0 )

	return 1

end


--**********************************
--ʹ��G����....
--**********************************
function x890068_UseSkillG( sceneId, selfId )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_G, selfId, x, z, 0, 1 )
	MonsterTalk( sceneId, -1, "", "#{CJG_101231_218}" )
	return 1

end


--**********************************
--ʹ��H����....
--**********************************
function x890068_UseSkillH( sceneId, selfId )

	--��������Ч����ҵ��б�....
	local PlayerList = {}

	--����Ч���˼����б�....
	local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	for i=0, nHumanCount-1 do
		local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
		if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
			PlayerList[i+1] = nHumanId
		end
	end

	--�����ѡһ�����....
	local numPlayer = getn(PlayerList)
	if numPlayer <= 0 then
		return 0
	end
	local PlayerId = PlayerList[ random(numPlayer) ]

	--���Լ�ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_H, selfId, x, z, 0, 1 )

	--����Ҽӽ�����ص��ű���buff....
	LuaFnSendSpecificImpactToUnit( sceneId, PlayerId, PlayerId, PlayerId, x890068_BuffID_H, 0 )

	return 1

end


--**********************************
--ʹ��I����....
--**********************************
function x890068_UseSkillI( sceneId, selfId )

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_BuffID_I1, 5000 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x890068_BuffID_I2, 5000 )

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x890068_SkillID_I, selfId, x, z, 0, 1 )

	MonsterTalk( sceneId, -1, "", "#{CJG_101231_230}" )

	return 1

end


--**********************************
--���׺��̻���buff������ʱ��ص����ӿ�....
--**********************************
function x890068_OnImpactFadeOut( sceneId, selfId, impactId )

	--Ѱ��BOSS....
	local bossId = -1
	local nMonsterNum = GetMonsterCount(sceneId)
	for i=0, nMonsterNum-1 do
		local MonsterId = GetMonsterObjID(sceneId,i)
		if x890068_MyName == GetName( sceneId, MonsterId ) then
			bossId = MonsterId
		end
	end

	--û�ҵ��򷵻�....
	if bossId == -1 then
		return
	end

	--������̻���buff����BOSS����....
	if impactId == x890068_BuffID_H then
		MonsterTalk( sceneId, -1, "", "#{CJG_101231_166}"..GetName( sceneId, selfId ).."#{CJG_101231_168}" )
		return
	end

	--����ǰ��׵�buff....����BOSS����������Ҽ�һ���˺���buff������....
	if impactId == x890068_BuffID_F1 then

		MonsterTalk( sceneId, -1, "", "#{CJG_101231_85}"..GetName( sceneId, selfId ).."#{CJG_101231_84}" )

		local x = 0
		local z = 0
		local xx = 0
		local zz = 0
		x,z = GetWorldPos( sceneId,selfId )
		local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanNum-1  do
			local PlayerId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, PlayerId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, PlayerId) == 1 and LuaFnIsCharacterLiving(sceneId, PlayerId) == 1 and PlayerId ~= selfId then
				xx,zz = GetWorldPos(sceneId,PlayerId)
				if (x-xx)*(x-xx) + (z-zz)*(z-zz) < 8*8 then
					LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, PlayerId, x890068_BuffID_F2, 0 )
				end
			end
		end

		return

	end

end
