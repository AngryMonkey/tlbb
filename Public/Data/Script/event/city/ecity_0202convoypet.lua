--��������
--�����ڿ󳡵��ҵ�С��

--************************************************************************
--MisDescBegin

--�ű���
x600009_g_ScriptId = 600009

--�����
x600009_g_MissionId = 1106

--Ŀ��NPC
x600009_g_Name = "������"

--����ȼ�
x600009_g_MissionLevel = 10000

--�������
x600009_g_MissionKind = 50

--�Ƿ��Ǿ�Ӣ����
x600009_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600009_g_IsMissionOkFail			=0	--0 ������ɱ��
x600009_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��
x600009_g_Param_sceneid				=2	--2�ţ���ǰ��������ĳ�����

--ѭ�����������������������������Ļ���
x600009_g_MissionRound = 40
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600009_g_MissionName = "��չ����"
x600009_g_MissionInfo = ""													--��������
x600009_g_MissionTarget = "    ���� %n �� %s%s ������"						--����Ŀ��
x600009_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600009_g_SubmitInfo = "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600009_g_MissionComplete = "    �ɵò����������á�"						--�������npc˵���Ļ�

x600009_g_StrForePart = 3

x600009_g_FamilyNameStart = 0												-- x600009_g_StrList �е��յ���ʼλ��
x600009_g_FamilyNameCount = 13												-- x600009_g_StrList �е��յ�����
x600009_g_StrList = { [0] = "��", [1] = "��", [2] = "��", [3] = "��", [4] = "��", [5] = "��", [6] = "��",
			  [7] = "��", [8] = "��", [9] = "��", [10] = "��", [11] = "Ѧ", [12] = "��",
			  [13] = "��", [14] = "��", [15] = "��", [16] = "��", [17] = "ٻ", [18] = "�",
			  [19] = "����", [20] = "ݺݺ", [21] = "˼˼", [22] = "ӡ��", [23] = "�¶�",
			  [24] = "ѩ��", [25] = "���",
}

-- ͨ�ó�������ű�
x600009_g_CityMissionScript = 600001
x600009_g_DevelopmentScript = 600007

--������

--MisDescEnd
--************************************************************************

--��������
x600009_g_CopySceneName = "����"

x600009_g_CopySceneType = FUBEN_CONVOYPET	--�������ͣ�������ScriptGlobal.lua����

x600009_g_CopySceneMap = "muchang.nav"
x600009_g_Exit = "muchang_area.ini"
x600009_g_TickTime = 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600009_g_LimitTotalHoldTime = 360		--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600009_g_LimitTimeSuccess = 500		--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600009_g_CloseTick = 3					--�����ر�ǰ����ʱ����λ��������
x600009_g_NoUserTime = 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x600009_g_DeadTrans = 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600009_g_Fuben_X = 70					--���븱����λ��X
x600009_g_Fuben_Z = 113					--���븱����λ��Z
x600009_g_Back_X = 129					--Դ����λ��X
x600009_g_Back_Z = 99					--Դ����λ��Z

x600009_g_PetList = {
	PetNpcId = { 300464, 300465, 300466, 300467, 300468 },
	[10] = { 1940, 1950, 1960, 1970, 1980 },
	[20] = { 1941, 1951, 1961, 1971, 1981 },
	[30] = { 1942, 1952, 1962, 1972, 1982 },
	[40] = { 1943, 1953, 1963, 1973, 1983 },
	[50] = { 1944, 1954, 1964, 1974, 1984 },
	[60] = { 1945, 1955, 1965, 1975, 1985 },
	[70] = { 1946, 1956, 1966, 1976, 1986 },
	[80] = { 1947, 1957, 1967, 1977, 1987 },
	[90] = { 1948, 1958, 1968, 1978, 1988 },
	[100] = { 1949, 1959, 1969, 1979, 1989 },
}

--**********************************
--������ں���
--**********************************
function x600009_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local bDone = x600009_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600009_g_SubmitInfo
		else
			strText = x600009_g_ContinueInfo
		end

		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		if bDone == 0 and GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 2 then		--����δ���
			if GetNumText() == 1 then
				x600009_AcceptEnterCopyScene( sceneId, selfId )
			else
				BeginEvent( sceneId )
					AddText( sceneId, x600009_g_MissionName )
					x600009_AskEnterCopyScene( sceneId, selfId )
				EndEvent( )
				DispatchEventList( sceneId, selfId, targetId )
			end
		else											--�����Ѿ���ɻ�ʧ��
			BeginEvent( sceneId )
				AddText( sceneId, x600009_g_MissionName )
				AddText( sceneId, strText )
			EndEvent( )
			DispatchMissionDemandInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId, bDone )
		end
	--���������������
	elseif x600009_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600009_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600009_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600009_OnEnumerate( sceneId, selfId, targetId )
	--local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	--SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )
	
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		AddNumText( sceneId, x600009_g_ScriptId, x600009_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600009_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--ѯ������Ƿ�Ҫ���븱��
--**********************************
function x600009_AskEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then	-- û������
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	local missionInfo
	if random(2) == 1 then
		missionInfo = format( "    ������ %s%s ��ʧ�� %s���鷳�㻤�� %s �ص����������",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName, strPetName )
	else
		missionInfo = format( "    ��˵ %s%s ��С����ʧ�� %s��������ܰ����ͻأ���������ܿ��ĵġ�",
			x600009_g_StrList[girlFamilyNameIndex], x600009_g_StrList[girlNameIndex], strPetName )
	end

	AddText( sceneId, missionInfo )
	AddNumText( sceneId, x600009_g_ScriptId, "��������", 10, 1 )
end

--**********************************
--����
--**********************************
function x600009_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then					--û������ſ���������
		if GetLevel( sceneId, selfId ) < 30 then
			CallScriptFunction( x600009_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		AddMission( sceneId, selfId, x600009_g_MissionId, x600009_g_ScriptId, 0, 0, 0 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 ) -- ע�� x600009_OnLockedTarget �¼�
		CallScriptFunction( x600009_g_DevelopmentScript, "OnAccept", sceneId, selfId, targetId, x600009_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )

		-- ����B��AA������
		local PetNpcId = x600009_g_PetList.PetNpcId[random( getn(x600009_g_PetList.PetNpcId) )]
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart, PetNpcId )

		local girlFamilyNameIndex = random( x600009_g_FamilyNameStart, x600009_g_FamilyNameStart + x600009_g_FamilyNameCount - 1 )
		local girlNameIndex = random( x600009_g_FamilyNameStart, getn(x600009_g_StrList) - x600009_g_FamilyNameCount ) + x600009_g_FamilyNameCount
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 1, girlFamilyNameIndex )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 2, girlNameIndex )

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x600009_g_MissionName )
			x600009_AskEnterCopyScene( sceneId, selfId )
			AddText( sceneId, "#r    �����������" .. x600009_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--���ͬ����븱��
--**********************************
function x600009_AcceptEnterCopyScene( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then					--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		local copysceneid = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

		--changed by xindefeng
		--�����»���:����ʲôԭ��,��δ��������������,��������������ϵ��������κθĶ�(����ʧ�ܻ���ɾ������),������ٽ��ø���ʱ,��Ҫ���³�ʼ����������,���Ҹ�����Ҫ���´���
		--if copysceneid >= 0 then												--��������
		--	--���Լ����͵���������
		--	if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
		--		NewWorld( sceneId, selfId, copysceneid, x600009_g_Fuben_X, x600009_g_Fuben_Z )
		--		return
		--	end
		--end

		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 0 )	--������ĵ�0����������Ϊ0,��ʾδ��ɵ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_Param_sceneid, -1 )		--������ĵ�2����������Ϊ-1, ���ڱ��渱���ĳ�����
		x600009_MakeCopyScene( sceneId, selfId )
	end
end

--**********************************
--��������
--**********************************
function x600009_MakeCopyScene( sceneId, selfId )
	local mylevel = GetLevel( sceneId, selfId )

	local leaderguid = LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600009_g_CopySceneMap )						--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600009_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600009_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, 0, x600009_g_CopySceneType )				--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, 1, x600009_g_ScriptId )					--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, 2, 0 )							--���ö�ʱ�����ô���Ϊ0
	LuaFnSetCopySceneData_Param( sceneId, 3, -1 )							--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 0 )							--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, 5, 0 )							--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, 7, 0 )							--ɱ��Boss������

	local iniLevel
	if mylevel < 10 then
		iniLevel = 10
	elseif mylevel < 100 then
		iniLevel = floor( mylevel/10 ) * 10
	else
		iniLevel = 100
	end

	LuaFnSetSceneLoad_Area( sceneId, x600009_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "muchang_monster_" .. iniLevel .. ".ini" )

	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel ) --����CopyScene_LevelGap �� scene.lua �и�ֵ

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local PetList = x600009_g_PetList[iniLevel]
	local petMonsterId = nil
	local i = 1

	if not PetList then
		x600009_NotifyFailTips( sceneId, selfId, "û���ʺ��㻤�͵�����" )
		return
	end

	for i = 1, getn( x600009_g_PetList.PetNpcId ) do
		if x600009_g_PetList.PetNpcId[i] == PetNpcId then
			petMonsterId = PetList[i]
			break
		end
	end

	if not petMonsterId then
		x600009_NotifyFailTips( sceneId, selfId, "û���ҵ��ʺ��㻤�͵�����" )
		return
	end

	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 3, petMonsterId )

	local bRetSceneID = LuaFnCreateCopyScene( sceneId )						--��ʼ����ɺ���ô�����������
	if bRetSceneID > 0 then
		x600009_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600009_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end

end

--**********************************
--�����¼�
--**********************************
function x600009_OnCopySceneReady( sceneId, destsceneId )
	LuaFnSetCopySceneData_Param( destsceneId, 3, sceneId )					--���ø�����ڳ�����
	local leaderguid = LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId = LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then			-- �����޷�ִ���߼���״̬
		return
	end

	if IsHaveMission( sceneId, leaderObjId, x600009_g_MissionId ) > 0 then			--������ſ���������
		local misIndex = GetMissionIndexByID( sceneId, leaderObjId, x600009_g_MissionId )

		--������ĵ�2����������Ϊ�����ĳ�����
		SetMissionByIndex( sceneId, leaderObjId, misIndex, x600009_g_Param_sceneid, destsceneId )
		NewWorld( sceneId, leaderObjId, destsceneId, x600009_g_Fuben_X, x600009_g_Fuben_Z )
	end
end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600009_OnPlayerEnter( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		x600009_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
		return
	end

	--ף�� 2008-03-06
	--��Ӧ�ó����������....��Ҫ����Ƿ��Ǳ�����....
	local misIdx = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local scriptId = GetMissionParam( sceneId, selfId, misIdx, 1 )
	if x600009_g_ScriptId == scriptId then
		--���븱����������ʱ�� --add by xindefeng
		StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
	else
		local msg = format( "CityMission_OnTimer_Error x600009_OnPlayerEnter %0X,%d,%d real scriptId = %d", LuaFnObjId2Guid( sceneId, selfId ), sceneId, selfId, scriptId )
		MissionLog( sceneId, msg )
		return
	end

	local monstercount = GetMonsterCount( sceneId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )

	-- ���û��ͳ�������
	local i
	local monsterId
	local petFlag = 0
	for i = 0, monstercount - 1 do
		monsterId = GetMonsterObjID( sceneId, i )
		if GetName( sceneId, monsterId ) == strPetName then
			petFlag = 1
		end

		if GetName( sceneId, monsterId ) == "��Ů" then
			SetCharacterName( sceneId, monsterId, x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex] )
		end
	end
	
	if petFlag == 0 then
		monsterId = LuaFnCreateMonster( sceneId, petMonsterId, x600009_g_Fuben_X, x600009_g_Fuben_Z, 0, 0, -1 )
		SetLevel( sceneId, monsterId, GetLevel( sceneId, selfId ) )			-- ��������
		SetUnitReputationID(sceneId, selfId, monsterId, GetUnitReputationID(sceneId, selfId, selfId)) --�趨Ϊ�������ID,������Ѻ�

		local pAttack = 0													-- ������
		local pDefense = 0													-- �������
		local mDefense = 0													-- �ڹ�����
		local maxHP = 0														-- ��Ѫֵ

		pAttack = LuaFnGetBaseAttackPhysics( sceneId, monsterId )
		pAttack = floor( pAttack * ( 80 + random(40) ) / 100 - pAttack )
		pAttack = pAttack + LuaFnGetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_AttackPhysics( sceneId, monsterId, pAttack )

		pDefense = LuaFnGetBaseDefencePhysics( sceneId, monsterId )
		pDefense = floor( pDefense * ( 80 + random(40) ) / 100 - pDefense )
		pDefense = pDefense + LuaFnGetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefencePhysics( sceneId, monsterId, pDefense )

		mDefense = LuaFnGetBaseDefenceMagic( sceneId, monsterId )
		mDefense = floor( mDefense * ( 80 + random(40) ) / 100 - mDefense )
		mDefense = mDefense + LuaFnGetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_DefenceMagic( sceneId, monsterId, mDefense )

		maxHP = LuaFnGetMaxBaseHp( sceneId, monsterId )
		maxHP = floor( maxHP * ( 80 + random(40) ) / 100 - maxHP )
		maxHP = maxHP + LuaFnGetLifeTimeAttrRefix_MaxHP( sceneId, monsterId )
		LuaFnSetLifeTimeAttrRefix_MaxHP( sceneId, monsterId, maxHP )
		RestoreHp( sceneId, monsterId )
	end
end

--**********************************
--������ڸ����������¼�
--**********************************
function x600009_OnHumanDie( sceneId, selfId, killerId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) == 0 then				--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
		return
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	x600009_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
	SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )			-- ����ʧ��
	LuaFnSetCopySceneData_Param( sceneId, 4, 1 )

	if x600009_g_DeadTrans == 1 then														--��������Ҫ��ǿ���߳�����
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )				--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
--����
--**********************************
function x600009_OnAbandon( sceneId, selfId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local copyscene = GetMissionParam( sceneId, selfId, misIndex, x600009_g_Param_sceneid )

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600009_g_DevelopmentScript, "OnAbandon", sceneId, selfId )

	if sceneId == copyscene then											--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		x600009_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )		--ȡ�ø�����ڳ�����
		NewWorld( sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
	end
end

--**********************************
-- �سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600009_BackToCity( sceneId, selfId )
	--������ԭ���ķ���,���ǻ���ʾ����"����ʧ��",�����޸� --changed by xindefeng
	--CallScriptFunction( x600009_g_CityMissionScript, "BackToCity", sceneId, selfId, x600009_g_MissionId, x600009_g_Back_X, x600009_g_Back_Z )	
	
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--�������δ�ɹ�
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--��������ʧ��
		end
	end
	
	local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )					--ȡ�ý��븱��ʱ���ڳ�����
	CallScriptFunction( 400900, "TransferFunc", sceneId, selfId, oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )	--����
end

--**********************************
--����
--**********************************
function x600009_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600009_g_MissionName )
		AddText( sceneId, x600009_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600009_g_ScriptId, x600009_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600009_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600009_g_DevelopmentScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600009_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600009_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600009_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600009_g_DevelopmentScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600009_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x600009_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600009_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--����������ʱ���¼�(scene.lua����)
--**********************************
function x600009_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	local TickCount = LuaFnGetCopySceneData_Param( sceneId, 2 )						--ȡ���Ѿ�ִ�еĶ�ʱ����
	TickCount = TickCount + 1
	LuaFnSetCopySceneData_Param( sceneId, 2, TickCount )							--�����µĶ�ʱ�����ô���

	--�����رձ�־
	local leaveFlag = LuaFnGetCopySceneData_Param( sceneId, 4 )

	local membercount = LuaFnGetCopyScene_HumanCount( sceneId )
	local mems = {}
	local i

	for i=0, membercount-1 do
		mems[i] = LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	if leaveFlag == 1 then															--��Ҫ�뿪
		--�뿪����ʱ��Ķ�ȡ������
		local leaveTickCount = LuaFnGetCopySceneData_Param( sceneId, 5 )
		leaveTickCount = leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, 5, leaveTickCount )

		if leaveTickCount >= x600009_g_CloseTick then										--����ʱ�䵽����Ҷ���ȥ��
			local oldsceneId = LuaFnGetCopySceneData_Param( sceneId, 3 )			--ȡ�ø�����ڳ�����

			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, x600009_g_Back_X, x600009_g_Back_Z )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			local strText = format( "�㽫�� %d ����뿪����", ( x600009_g_CloseTick - leaveTickCount ) * x600009_g_TickTime )

			for i=0, membercount-1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600009_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end
	end
end

--**********************************
--������һ������
--**********************************
function x600009_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	local girlFamilyNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 1 )
	local girlNameIndex = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 2 )
	local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )

	local strGirlName = x600009_g_StrList[girlFamilyNameIndex] .. x600009_g_StrList[girlNameIndex]

	if GetMonsterDataID( sceneId, objId ) == petMonsterId then				-- ����
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) > 0 then
			print( "���������⣬���޻�����Ӧ����¼�" )
		end

		------------------Ų��x600009_OnPlayerEnter()ȥ��,���һ���븱��������ʱ�� changed by xindefeng----------------
		--���������������ʱ����
		--StartMissionTimer( sceneId, selfId, x600009_g_MissionId )
		--SetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )
		---------------------------------------------------------------------------------------------------------------
		
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 1 )	--���ñ�־:�Ƿ��뻤�ͳ���Ի�(���ڸ����Ƿ��Ѿ���ʼ����?)
		SetPatrolId( sceneId, objId, 0 )									-- ����Ѳ��·��
		return
	end

	if GetName( sceneId, objId ) == strGirlName then						-- ʧŮ
		-- ���������Ѿ����
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) == 1 then
			-- ��������� x600009_OnLockedTarget �¼��б���������������ٹ��Ĵ����¼�
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 4 )
			TAddText( sceneId, "    ̫���ˣ�����лл��Ŷ��" )
			x600009_NotifyFailTips( sceneId, selfId, "�������" )
			LuaFnDeleteMonster( sceneId, objId )
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )
		else
			local PetNpcId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart )
			local _, strPetName = GetNpcInfoByNpcId(sceneId, PetNpcId )
			local strText = format( "    �ҵ� %s �����������أ����ܰ����ҵ�����", strPetName )
			TAddText( sceneId, strText )
		end
	end
end

--**********************************
--��ʱ�¼�
--**********************************
function x600009_OnTimer( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600009_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600009_g_MissionId )
	
	--changed by xindefeng
	--�ó���ҽ��븱����������ʱ��,��������(x600009_g_StrForePart + 4)Mission Para����,��ҽ��븱����,û���뻤�ͳ���Ի��ͳ�ȥ��,��ôҲ������ʾ����ʧ��!	
	--����뻤�ͳ���Ի�����x600009_OnLockedTarget()����(x600009_g_StrForePart + 4)Mission Para,����·����ʶ����ڸ����п�ʼ����
	local sceneType = LuaFnGetSceneType( sceneId )	--�Ƿ��Ǹ�������
	if sceneType ~= 1 then		
		--��������,����û��ɾͳ�����,��������ʧ��!
		if GetMissionParam( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail ) ~= 1 then	--����ɹ���?
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )	--����û�ɹ��ͳ�����,��Ϊ�ǻ����������������ʧ��
			ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )									--�뿪������Ҫֹͣ��ʱ���ñ�����
			SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--���ñ�־:�Ƿ��뻤�ͳ���Ի�(���ڸ����Ƿ��Ѿ���ʼ����?)
			LuaFnSetCopySceneData_Param( sceneId, 4, 1 )																	--���ø����رձ�־
			x600009_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )												--��ʾʧ��
		end
		return
	end
	
	

	-- ֻ�д����������Զ����߲Ż��ߵ�����
	if GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 4 ) == 1 then
		--�Ƿ�������Ҫ�ĸ���
		local fubentype = LuaFnGetCopySceneData_Param( sceneId, 0 )
		
		if fubentype == x600009_g_CopySceneType then			
			local petMonsterId = GetMissionParam( sceneId, selfId, misIndex, x600009_g_StrForePart + 3 )
			local monstercount = GetMonsterCount( sceneId )
			local monsterId
			local i

			for i = 0, monstercount - 1 do
				monsterId = GetMonsterObjID( sceneId, i )
				if GetMonsterDataID( sceneId, monsterId ) == petMonsterId then		-- �ж��Ƿ�ɹ�
					local x, z = GetLastPatrolPoint( sceneId, 0 )
					local petX, petZ = GetWorldPos( sceneId, monsterId )

					if (x - petX) * (x - petX) + (z - petZ) * (z - petZ) < 4 then	-- ���յ㲻�� 2 ��
						SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 1 )
						ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )		-- �����ߴ�����
						LuaFnDeleteMonster( sceneId, monsterId )
					end
					return	--���͵ĳ��ﻹ�ھ�ֱ�ӷ���
				end
			end
		end

		--���͹�������������������ʧ��
		x600009_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_IsMissionOkFail, 2 )		-- ����ʧ��
		LuaFnSetCopySceneData_Param( sceneId, 4, 1 )		--���ø����رձ�־
		ResetMissionEvent( sceneId, selfId, x600009_g_MissionId, 5 )						-- �����ߴ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600009_g_StrForePart + 4, 0 )	--���ñ�־:�Ƿ��뻤�ͳ���Ի�(���ڸ����Ƿ��Ѿ���ʼ����?)	--add by xindefeng
	end
end

function x600009_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
