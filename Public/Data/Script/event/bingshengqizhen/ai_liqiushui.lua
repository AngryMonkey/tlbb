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
x402087_g_ScriptId	= 402087

--�����߼��ű���....
x402087_g_FuBenScriptId = 402080


--�����ض�����buff....
x402087_Buff_MianYi1	= 10473	--����һЩ����Ч��....
x402087_Buff_MianYi2	= 10471	--������ͨ����....

--AС���๦....
x402087_SkillA_ID			= 1042
x402087_SkillA_Buff		=	10271
x402087_SkillA_CD			= 10000

--B����....
x402087_SkillB_SkillIDTbl = { 1043, 1044, 1045, 1046, 1047, 1048 }
x402087_SkillB_WeatherTbl = { 11, 12, 13, 14, 15, 16 }
x402087_SkillB_TalkTbl =
{
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�",
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�",
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�",
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�",
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�",
	"#ccc9933[Ү������]#Wս���ϲ������������һ���У�"
}

x402087_SkillB_Text =
{
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�",
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�",
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�",
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�",
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�",
	"#ccc9933[Ү������]#W���п����ɣ����п����֣����ã�¶������ˣ�"
}

x402087_SkillB_BuffIDTbl =
{
	[1] = {10280,10281,10282,10283,10284,10285,10286,10287,10288,10289,10290,10291,10292,10293,10294},
	[2] = {10295,10296,10297,10298,10299,10300,10301,10302,10303,10304,10305,10306,10307,10308,10309},
	[3] = {10310,10311,10312,10313,10314,10315,10316,10317,10318,10319,10320,10321,10322,10323,10324},
	[4] = {10325,10326,10327,10328,10329,10330,10331,10332,10333,10334,10335,10336,10337,10338,10339},
	[5] = {10340,10341,10342,10343,10344,10345,10346,10347,10348,10349,10350,10351,10352,10353,10354},
	[6] = {10355,10356,10357,10358,10359,10360,10361,10362,10363,10364,10365,10366,10367,10368,10369}
}

--C����....
x402087_SkillC_ID		= 1049
x402087_SkillC_CD		= 20000

--D����....
x402087_SkillD_ID		= 1050
x402087_SkillD_CD		= 20000
x402087_SkillD_SpecObj = 59

--E��....
x402087_SkillE_Buff1	= 10234
x402087_SkillE_Buff2	= 10235
--��ʼ�����״̬��ʱ��....
x402087_EnterKuangBaoTime	= 10*60*1000


--AI Index....
x402087_IDX_StopWatch						= 1	--���....
x402087_IDX_SkillA_CD						= 2	--A���ܵ�CDʱ��....
x402087_IDX_SkillB_HPStep				= 3	--Ѫ������....
x402087_IDX_SkillB_Step					= 4	--B���ܵ�Step....0=δ���� 15=buff1 14=buff2 ���� 1=buff15
x402087_IDX_SkillB_Type					= 5	--��ǰ����ʹ���������͵Ľ���....
x402087_IDX_SkillC_CD						= 6	--C���ܵ�CDʱ��....
x402087_IDX_SkillD_CD						= 7	--C���ܵ�CDʱ��....
x402087_IDX_KuangBaoTimer				= 8	--�񱩵ļ�ʱ��....


x402087_IDX_CombatFlag 			= 1	--�Ƿ���ս��״̬�ı�־....
x402087_IDX_IsKuangBaoMode	= 2	--�Ƿ��ڿ�ģʽ�ı�־....


--**********************************
--��ʼ��....
--**********************************
function x402087_OnInit(sceneId, selfId)
	--����AI....
	x402087_ResetMyAI( sceneId, selfId )
end


--**********************************
--����....
--**********************************
function x402087_OnHeartBeat(sceneId, selfId, nTick)

	--����ǲ�������....
	if LuaFnIsCharacterLiving(sceneId, selfId) ~= 1 then
		return
	end

	--����Ƿ���ս��״̬....
	if 0 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402087_IDX_CombatFlag ) then
		return
	end

	--��״̬����Ҫ���߼�....
	if 1 == MonsterAI_GetBoolParamByIndex( sceneId, selfId, x402087_IDX_IsKuangBaoMode ) then
		return
	end

	--A��������....
	if 1 == x402087_TickSkillA( sceneId, selfId, nTick ) then
		return
	end

	--B��������....
	if 1 == x402087_TickSkillB( sceneId, selfId, nTick ) then
		return
	end

	--C��������....
	if 1 == x402087_TickSkillC( sceneId, selfId, nTick ) then
		return
	end

	--D��������....
	if 1 == x402087_TickSkillD( sceneId, selfId, nTick ) then
		return
	end

	--E��������....
	if 1 == x402087_TickSkillE( sceneId, selfId, nTick ) then
		return
	end

	--�������....
	x402087_TickStopWatch( sceneId, selfId, nTick )

end


--**********************************
--����ս��....
--**********************************
function x402087_OnEnterCombat(sceneId, selfId, enmeyId)

	--�ӳ�ʼbuff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402087_Buff_MianYi1, 0 )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402087_Buff_MianYi2, 0 )

	--����AI....
	x402087_ResetMyAI( sceneId, selfId )

	--���ý���ս��״̬....
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402087_IDX_CombatFlag, 1 )

end


--**********************************
--�뿪ս��....
--**********************************
function x402087_OnLeaveCombat(sceneId, selfId)

	--����AI....
	x402087_ResetMyAI( sceneId, selfId )

	--ɾ���Լ�....
	LuaFnDeleteMonster( sceneId, selfId )

end


--**********************************
--ɱ������....
--**********************************
function x402087_OnKillCharacter(sceneId, selfId, targetId)

end


--**********************************
--����....
--**********************************
function x402087_OnDie( sceneId, selfId, killerId )

	--����AI....
	x402087_ResetMyAI( sceneId, selfId )

	--�����Ѿ���ս������ˮ....
	CallScriptFunction( x402087_g_FuBenScriptId, "SetBossBattleFlag", sceneId, "LiQiuShui", 2 )

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
		str = format("#P�߹ش���ϲѶ��#{_INFOUSR%s}#P�ʱ�ͻϮ#Y[Ү������]#P��Ѩ����������������һս�����ȫʤ��#Y[Ү������]#P��������ԭӢ�۵��£�#{_INFOUSR%s}���Ʊ�ʥ���󣬿������飬������ΪӢ�ۻ����ɡ�", playerName, playerName); --����ˮ
		AddGlobalCountNews( sceneId, str )
	end
	
end


--**********************************
--����AI....
--**********************************
function x402087_ResetMyAI( sceneId, selfId )

	--���ò���....
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_StopWatch, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillA_CD, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_HPStep, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step, 0 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Type, 1 )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillC_CD, x402087_SkillC_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillD_CD, x402087_SkillD_CD )
	MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_KuangBaoTimer, 0 )

	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402087_IDX_CombatFlag, 0 )
	MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402087_IDX_IsKuangBaoMode, 0 )

end

--**********************************
--A��������....
--**********************************
function x402087_TickSkillA( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillA_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillA_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillA_CD, x402087_SkillA_CD-(nTick-cd) )
		return x402087_UseSkillA( sceneId, selfId )
	end

end

--**********************************
--B��������....
--**********************************
function x402087_TickSkillB( sceneId, selfId, nTick )

	local CurPercent = GetHp( sceneId, selfId ) / GetMaxHp( sceneId, selfId )
	local LastStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_HPStep )
	local CurStep = 0
	if CurPercent <= 0.3333 then
		CurStep = 2
	elseif CurPercent <= 0.6666 then
		CurStep = 1
	end

	if CurStep > LastStep then

		--���ò���....
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_HPStep, CurStep )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step, 15 )
		local JianWuType = random( getn(x402087_SkillB_SkillIDTbl) )
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Type, JianWuType )

		--����....
		MonsterTalk(sceneId, -1, "", x402087_SkillB_TalkTbl[JianWuType] )
		
		MonsterTalk(sceneId, -1, "", x402087_SkillB_Text[JianWuType] )
		--��ȫ�����̻�....
		LuaFnSetSceneWeather(sceneId, x402087_SkillB_WeatherTbl[JianWuType], 15000 )

		--���Լ�ʹ�ÿռ���....
		local x,z = GetWorldPos( sceneId, selfId )
		LuaFnUnitUseSkill( sceneId, selfId, x402087_SkillB_SkillIDTbl[JianWuType], selfId, x, z, 0, 1 )

		return 1

	end

	return 0

end

--**********************************
--C��������....
--**********************************
function x402087_TickSkillC( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillC_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillC_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillC_CD, x402087_SkillC_CD-(nTick-cd) )
		return x402087_UseSkillC( sceneId, selfId )
	end

end

--**********************************
--D��������....
--**********************************
function x402087_TickSkillD( sceneId, selfId, nTick )

	--���¼���CD....
	local cd = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillD_CD )
	if cd > nTick then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillD_CD, cd-nTick )
		return 0
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillD_CD, x402087_SkillD_CD-(nTick-cd) )
		return x402087_UseSkillD( sceneId, selfId )
	end

end

--**********************************
--E��������....
--**********************************
function x402087_TickSkillE( sceneId, selfId, nTick )

	--���������B�������ȵȴ�....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step ) > 0 then
		return 0
	end

	--����Ƿ��˿񱩵�ʱ��....
	local kbTime = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_KuangBaoTimer )
	if kbTime < x402087_EnterKuangBaoTime then

		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_KuangBaoTimer, kbTime+nTick )
		return 0

	else

		MonsterAI_SetBoolParamByIndex( sceneId, selfId, x402087_IDX_IsKuangBaoMode, 1 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402087_SkillE_Buff1, 0 )
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x402087_SkillE_Buff2, 0 )
		return 1

	end

end

--**********************************
--�������....
--**********************************
function x402087_TickStopWatch( sceneId, selfId, nTick )

	--����ÿ��Ż�ִ��һ��....
	local time = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_StopWatch )
	if (time + nTick) > 1000 then
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_StopWatch, time+nTick-1000 )
	else
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_StopWatch, time+nTick )
		return
	end


	-------------------------
	--���輼���߼�....
	-------------------------
	local buffStep = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step )
	local skillType = MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Type )
	if buffStep >= 1 and buffStep <= 15 then

		--Ѱ�ҷ�����....
		local bossId = CallScriptFunction( x402087_g_FuBenScriptId, "FindBOSS", sceneId, "LiQiuShui_NPC" )
		if bossId <= 0 then
			return 0
		end

		--�÷����Ǹ���Ҽ�buff....
		local buffTbl = x402087_SkillB_BuffIDTbl[skillType]
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
		MonsterAI_SetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step, buffStep-1 )
	end


end

--**********************************
--ʹ��A����....
--**********************************
function x402087_UseSkillA( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step ) > 0 then
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
	LuaFnUnitUseSkill( sceneId, selfId, x402087_SkillA_ID, selfId, x, z, 0, 1 )

	--����Ҽ�ʧ��buff....
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, PlayerId, x402087_SkillA_Buff, 0 )

	return 1

end

--**********************************
--ʹ��C����....
--**********************************
function x402087_UseSkillC( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step ) > 0 then
		return 0
	end

	local x,z = GetWorldPos( sceneId, selfId )
	LuaFnUnitUseSkill( sceneId, selfId, x402087_SkillC_ID, selfId, x, z, 0, 1 )
	return 1

end

--**********************************
--ʹ��D����....
--**********************************
function x402087_UseSkillD( sceneId, selfId )

	--���������B����������....
	if MonsterAI_GetIntParamByIndex( sceneId, selfId, x402087_IDX_SkillB_Step ) > 0 then
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
	LuaFnUnitUseSkill( sceneId, selfId, x402087_SkillD_ID, selfId, x, z, 0, 1 )

	--�ڸ���ҽŵ��·�����....
	x,z = GetWorldPos( sceneId, PlayerId )
	CreateSpecialObjByDataIndex(sceneId, selfId, x402087_SkillD_SpecObj, x, z, 0)

	return 1

end
