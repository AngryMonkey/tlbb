--Ʈ��� ����ˮAI

--A ��С���๦�����Լ��ø��ռ���....�ٸ������һ�����ʧ��....
--B �����衿���Լ���һ���ռ���....������15s�����θ�ȫ������Ҽ��˺�ֵ�𽥼Ӵ���˺�buff....
--C �����ѡ����Լ���һ����buff�ļ���....
--D �����������Լ��ø��ռ���....�ٸ��������ҽ��·Ÿ�����....
--E ���񱩡����Լ��ӷ���buff....����ʹ����������....

--ȫ�̶����������ƶ����ܵ�buff....
--ս����ʼͬʱÿ��10����A����....
--��HP��Ϊ66%��33%ʱ�ֱ�ʹ��B����....B���ܵĳ���ʱ����....��������CD���˲�ʹ��....
--ÿ��20����C����....
--ÿ��20����D����....


--�ű���
x402282_g_ScriptId	= 402282

--�����߼��ű���....
x402282_g_FuBenScriptId = 402276


--�����ض�����buff....
x402282_Buff_MianYi1	= 10472	--����һЩ����Ч��....
x402282_Buff_MianYi2	= 10471	--������ͨ����....

--AС���๦....
x402282_SkillA_ID			= 1042
x402282_SkillA_Buff		=	10271
x402282_SkillA_CD			= 10000

--B����....
x402282_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047, 1048 }
x402282_SkillB_WeatherTbl = { 11, 12, 13, 14, 15, 16 }
x402282_SkillB_TalkTbl =
{
	"#{PMF_20080530_10}",
	"#{PMF_20080530_11}",
	"#{PMF_20080530_12}",
	"#{PMF_20080530_13}",
	"#{PMF_20080530_14}",
	"#{PMF_20080530_15}"
}

x402282_SkillB_Text =
{
	"#{PMFTS_80917_5}",
	"#{PMFTS_80917_3}",
	"#{PMFTS_80917_6}",
	"#{PMFTS_80917_1}",
	"#{PMFTS_80917_2}",
	"#{PMFTS_80917_4}"
}

x402282_SkillB_BuffIDTbl =	--�򵥰���翷�ʹ���˺������˵İ汾....
{
	[1] = {19808,19809,19810,19811,19812,19813,19814,19815,19816,19817,19818,19819,19820,19821,19822},
	[2] = {19823,19824,19825,19826,19827,19828,19829,19830,19831,19832,19833,19834,19835,19836,19837},
	[3] = {19838,19839,19840,19841,19842,19843,19844,19845,19846,19847,19848,19849,19850,19851,19852},
	[4] = {19853,19854,19855,19856,19857,19858,19859,19860,19861,19862,19863,19864,19865,19866,19867},
	[5] = {19868,19869,19870,19871,19872,19873,19874,19875,19876,19877,19878,19879,19880,19881,19882},
	[6] = {19883,19884,19885,19886,19887,19888,19889,19890,19891,19892,19893,19894,19895,19896,19897}
}

--C����....
x402282_SkillC_ID		= 1049
x402282_SkillC_CD		= 20000

--D����....
x402282_SkillD_ID		= 1050
x402282_SkillD_CD		= 20000
x402282_SkillD_SpecObj = 73	--�򵥰���翷�ʹ���˺������˵İ汾....

--E��....
x402282_SkillE_Buff1	= 10234
x402282_SkillE_Buff2	= 10235
--��ʼ�����״̬��ʱ��....
x402282_EnterKuangBaoTime	= 10*60*1000


--AI Index....
x402282_IDX_StopWatch						= 1	--���....
x402282_IDX_SkillA_CD						= 2	--A���ܵ�CDʱ��....
x402282_IDX_SkillB_HPStep				= 3	--Ѫ������....
x402282_IDX_SkillB_Step					= 4	--B���ܵ�Step....0=δ���� 15=buff1 14=buff2 ���� 1=buff15
x402282_IDX_SkillB_Type					= 5	--��ǰ����ʹ���������͵Ľ���....
x402282_IDX_SkillC_CD						= 6	--C���ܵ�CDʱ��....
x402282_IDX_SkillD_CD						= 7	--C���ܵ�CDʱ��....
x402282_IDX_KuangBaoTimer				= 8	--�񱩵ļ�ʱ��....


x402282_IDX_CombatFlag 			= 1	--�Ƿ���ս��״̬�ı�־....
x402282_IDX_IsKuangBaoMode	= 2	--�Ƿ��ڿ�ģʽ�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x402282_OnInit(sceneId, selfId)
	--����AI....
	x402282_ResetMyAI( sceneId, selfId )

end


--**********************************
--����....
--**********************************
function x402282_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402282_IDX_CombatFlag ) then
		return
	end

	--��״̬����Ҫ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402282_IDX_IsKuangBaoMode ) then
		return
	end

	--A��������....
	if 1 == x402282_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B��������....
	if 1 == x402282_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C��������....
	if 1 == x402282_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402282_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E��������....
	if 1 == x402282_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--�������....
	x402282_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--����ս��....
--**********************************
function x402282_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402282_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402282_Buff_MianYi2, 0 )

	--����AI....
	x402282_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402282_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x402282_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402282_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x402282_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402282_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402282_ResetMyAI( sceneId, selfId )

	--�����Ѿ���ս������ˮ....
	CallScriptFunction( x402282_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "LiQiuShui", 2 )
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
		str = format("#{XPM_8724_7}#{_INFOUSR%s}#{XPM_8724_8}", playerName);   --����ˮ
		AddGlobalCountNews( sceneId, str )
	end
end


--**********************************
--����AI....
--**********************************
function x402282_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillC_CD, x402282_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillD_CD, x402282_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402282_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402282_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A��������....
--**********************************
function x402282_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillA_CD, x402282_SkillA_CD-(nTick-cd) )
		return x402282_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B��������....
--**********************************
function x402282_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent <= 0.3333 then
		CurStep = 2
	elseif CurPercent <= 0.6666 then
		CurStep = 1
	end

	if CurStep > LastStep then

		--���ò���....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step, 15 )
		local JianWuType = random( getn(x402282_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Type, JianWuType )

		--����....
		MonsterTalk(sceneId, -1, "", x402282_SkillB_TalkTbl[JianWuType] )

		MonsterTalk(sceneId, -1, "", x402282_SkillB_Text[JianWuType] )

		--��ȫ�����̻�....
		LuaFnSetSceneWeather(sceneId, x402282_SkillB_WeatherTbl[JianWuType], 15000 )

		--���Լ�ʹ�ÿռ���....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x402282_SkillB_SkillIDTbl[JianWuType], selfId, x, z, 0, 1 )

		return 1

	end

	return 0

end

--**********************************
--C��������....
--**********************************
function x402282_TickSkillC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillC_CD, x402282_SkillC_CD-(nTick-cd) )
		return x402282_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D��������....
--**********************************
function x402282_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillD_CD, x402282_SkillD_CD-(nTick-cd) )
		return x402282_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E��������....
--**********************************
function x402282_TickSkillE( sceneId, selfId, nTick )

	--���������B�������ȵȴ�....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--����Ƿ��˿񱩵�ʱ��....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_KuangBaoTimer )
	if kbTime < x402282_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402282_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402282_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402282_SkillE_Buff2, 0 )
		return 1

	end

end

--**********************************
--�������....
--**********************************
function x402282_TickStopWatch( sceneId, selfId, nTick )

	--����ÿ��Ż�ִ��һ��....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--���輼���߼�....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--Ѱ�ҷ�����....
		local bossId = CallScriptFunction( x402282_g_FuBenScriptId, "FindBOSS", sceneId, "FuMinYi_NPC" )
		if bossId <= 0 then
			return 0
		end

		--�÷����Ǹ���Ҽ�buff....
		local buffTbl = x402282_SkillB_BuffIDTbl[skillType]
		local buffId = buffTbl[16-buffStep]
		local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
		for i=0, nHumanCount-1 do
			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, i)
			if LuaFnIsObjValid(sceneId, nHumanId) == 1 and LuaFnIsCanDoScriptLogic(sceneId, nHumanId) == 1 and LuaFnIsCharacterLiving(sceneId, nHumanId) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, bossId, bossId, nHumanId, buffId, 0 )
			end
		end

	end

	if buffStep > 0 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--ʹ��A����....
--**********************************
function x402282_UseSkillA( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step ) > 0 then
		return 0
	end

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

	--���Լ�ʹ��һ���ռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402282_SkillA_ID, selfId, x, z, 0, 1 )

	--����Ҽ�ʧ��buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402282_SkillA_Buff, 0 )

	return 1

end

--**********************************
--ʹ��C����....
--**********************************
function x402282_UseSkillC( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402282_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--ʹ��D����....
--**********************************
function x402282_UseSkillD( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402282_IDX_SkillB_Step ) > 0 then
		return 0
	end

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

	--ʹ�ÿռ���....
	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402282_SkillD_ID, selfId, x, z, 0, 1 )

	--�ڸ���ҽŵ��·�����....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x402282_SkillD_SpecObj, x, z, 0)

	return 1

end
