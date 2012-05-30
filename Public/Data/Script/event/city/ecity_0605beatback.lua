-- ����ս
--MisDescBegin
-- �ű���
x600044_g_ScriptId = 600044

--�����
x600044_g_MissionId = 1109

--����Ŀ��npc
x600044_g_Name = "�����"

--�������
x600044_g_MissionKind = 50

--����ȼ�
x600044_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600044_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600044_g_IsMissionOkFail			= 0									--0 ������ɱ��[ֵ���ܱ�]
x600044_g_MissionParam_SubId		= 1									--1 ������ű��Ŵ��λ��[ֵ���ܱ�]

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600044_g_MissionName = "��������"
x600044_g_MissionInfo = "    ��������"									--��������
x600044_g_MissionTarget = "    ���������ɱ��%n��"						--����Ŀ��
x600044_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600044_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600044_g_MissionComplete = "    �ɵò����������á�"					--�������npc˵���Ļ�

x600044_g_StrForePart = 4

x600044_g_MissionRound = 79

x600044_g_Parameter_Kill_AllRandom = { { id = 4, numNeeded = 5, numKilled = 6 } }

-- ͨ�ó�������ű�
x600044_g_CityMissionScript = 600001
x600044_g_MilitaryScript = 600030

--������

--MisDescEnd

x600044_g_MonsterOffset = 43											-- Suppose to 43, ����ڼ��� Monster ��ƫ����

x600044_g_MissionParam_MonsterId = x600044_g_StrForePart
x600044_g_MissionParam_MonsterNeeded = x600044_g_StrForePart + 1
x600044_g_MissionParam_MonsterKilled = x600044_g_StrForePart + 2

--**********************************
--������ں���
--**********************************
function x600044_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		--���������������Ϣ
		local bDone = x600044_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600044_g_SubmitInfo
		else
			strText = x600044_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600044_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId, bDone )
	--���������������
	elseif x600044_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600044_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1 then
			x600044_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600044_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) > 0 then
		AddNumText( sceneId, x600044_g_ScriptId, x600044_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600044_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--����
--**********************************
function x600044_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	local myLevel = GetLevel( sceneId, selfId )

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600044_g_MissionId, x600044_g_ScriptId, 1, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600044_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600044_g_MilitaryScript, "OnAccept", sceneId, selfId, targetId, x600044_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600044_g_MissionId )
	local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600044_g_MonsterOffset, myLevel )

	local count = floor( myLevel/10 ) * 5 + 5
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterId, nMonsterId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600044_g_MissionParam_MonsterNeeded, count )

	strMonsterSceneDesc = gsub( strMonsterSceneDesc, "��", "" )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		missionInfo = format( "    �������ڳ���֮ʱ�������⵽%s��%s�����ԣ���ʱ���ǹ�С��ƶ���Ƶ�������ֻ����%s���׸#r    ���ڣ�%s�������Ѿ�ӵ�����㹻��������ȥ%sɱ��%d��%s����һ��Ư���ķ���ս��",
				strMonsterSceneDesc, strMonsterName, strMonsterName, GetName( sceneId, selfId ),
				strMonsterSceneDesc, count, strMonsterName )

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    �����������" .. x600044_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600044_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600044_g_MilitaryScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600044_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600044_g_MissionName )
		AddText( sceneId, x600044_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600044_g_ScriptId, x600044_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600044_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600044_g_MilitaryScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600044_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600044_g_Name then			--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600044_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600044_g_MilitaryScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600044_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--ȡ�������������ӵ�з���Ȩ������
	local curOwner, misIndex
	local nNpcId, strNpcName, nNeeded, nKilled
	local MonsterName = GetName( sceneId, objId )

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--ȡ��ӵ�з���Ȩ���˵�objId
		if IsHaveMission( sceneId, curOwner, x600044_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600044_g_MissionId ) == x600044_g_ScriptId then		--��������ӵ������
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600044_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId( sceneId, nNpcId )

			if MonsterName == strNpcName then
				nNeeded = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterNeeded )
				nKilled = GetMissionParam( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled )
				nKilled = nKilled + 1

				SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_MissionParam_MonsterKilled, nKilled )
				CallScriptFunction( x600044_g_CityMissionScript, "NotifyFailTips", sceneId, curOwner,
					format( "��ɱ��%s��%d/%d", MonsterName, nKilled, nNeeded ) )

				if nNeeded <= nKilled then
					SetMissionByIndex( sceneId, curOwner, misIndex, x600044_g_IsMissionOkFail, 1 )
					ResetMissionEvent( sceneId, curOwner, x600044_g_MissionId, 0 )	-- ���ٹ���ɱ��
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x600044_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600044_OnItemChanged( sceneId, selfId, itemdataId )
end
