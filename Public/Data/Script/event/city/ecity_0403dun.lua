-- ��ծ��֪ͨȡ������
--MisDescBegin
-- �ű���
x600020_g_ScriptId = 600020

--�����
x600020_g_MissionId = 1108

--����Ŀ��npc
x600020_g_Name = "����"

--�������
x600020_g_MissionKind = 50

--����ȼ�
x600020_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600020_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600020_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600020_g_MissionName = "�м�����"
x600020_g_MissionInfo = "    ��������Ҫ %s �ˣ�ȥ���������ɣ�"			--��������
x600020_g_MissionTarget = "    ֪ͨ%n����%s��"							--����Ŀ��
x600020_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600020_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600020_g_MissionComplete = "    �ɵò����������á�"					--�������npc˵���Ļ�

x600020_g_StrForePart = 5
x600020_g_Offset = 21													-- Suppose to 21, ����ڼ��� NPC ��ƫ����
x600020_g_OffsetEx	= 251 										--����ڼ��� NPC ��ƫ�������� modi:lby20071126
x600020_g_MissionRound = 44

-- ͨ�ó�������ű�
x600020_g_CityMissionScript = 600001
x600020_g_MarketScript = 600017

x600020_g_StrList = { "����Ƿ��", "��ȡ��" }

--������

--MisDescEnd

x600020_g_Pronoun = {}
x600020_g_Pronoun[0] = "��"
x600020_g_Pronoun[1] = "��"

--**********************************
--������ں���
--**********************************
function x600020_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) > 0 then
		--���������������Ϣ
		local bDone = x600020_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600020_g_SubmitInfo
		else
			strText = x600020_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600020_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600020_g_ScriptId, x600020_g_MissionId, bDone )
	--���������������
	elseif x600020_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600020_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600020_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600020_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) > 0 then
		AddNumText( sceneId, x600020_g_ScriptId, x600020_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600020_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600020_g_MarketScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600020_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nPos = 0
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nPos = 1
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nPos = 2
	--else													-- 85 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600020_g_Offset
	elseif	nPlayerLevel < 100 then					-- 85 ~ 99 Level
		nPos = 3
	elseif nPlayerLevel < 120 then					-- 100 ~ 119 Level	modi:lby20071126
		nPos = 0
	else 																		-- >=114 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600020_g_Offset
	else
		return nPos + x600020_g_OffsetEx
	end
	
end

--**********************************
--����
--**********************************
function x600020_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600020_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600020_g_MissionId, x600020_g_ScriptId, 0, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600020_g_MissionId, 4 ) -- ע�� x600020_OnLockedTarget �¼�

	CallScriptFunction( x600020_g_MarketScript, "OnAccept", sceneId, selfId, targetId, x600020_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600020_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600020_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_StrForePart, nNpcId )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		local rand = random(2)

		SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_StrForePart + 1, rand - 1 )

		if rand == 1 then
			missionInfo = format( "    %s%s��%d��%d��Ƿ�˱��ǵ��ʣ�����ε������Ǵ������Ÿ�%s����%s���컹���ǡ�",
				strNpcScene, strNpcName, nPosX, nPosZ, x600020_g_Pronoun[nGender], x600020_g_Pronoun[nGender] )
		else
			missionInfo = format( "    %s%s��%d��%d���Ѿ����˿�鷳��ȥ֪ͨ%s������ȡ���ɡ�",
				strNpcScene, strNpcName, nPosX, nPosZ, x600020_g_Pronoun[nGender] )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    �����������" .. x600020_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600020_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600020_g_MarketScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600020_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600020_g_MissionName )
		AddText( sceneId, x600020_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600020_g_ScriptId, x600020_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600020_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600020_g_MarketScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600020_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600020_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600020_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600020_g_MarketScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600020_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600020_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600020_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--������һ������
--**********************************
function x600020_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600020_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600020_g_MissionId )		--�õ�������20�������е����к�
	if GetMissionParam( sceneId, selfId, misIndex, x600020_g_IsMissionOkFail ) > 0 then
		return		-- �����������
	end

	local nNpcId
	local strNpcName
	local PosX
	local PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600020_g_StrForePart )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- ��ʱ���Ƚ�λ��
	if GetName( sceneId, objId ) == strNpcName then
		local misType
		misType = GetMissionParam( sceneId, selfId, misIndex, x600020_g_StrForePart + 1 )
		misType = misType + 1

		-- ���������Ѿ����
		SetMissionByIndex( sceneId, selfId, misIndex, x600020_g_IsMissionOkFail, 1 )
		-- ��������� x600020_OnLockedTarget �¼��б���������������ٹ��Ĵ����¼�
		ResetMissionEvent( sceneId, selfId, x600020_g_MissionId, 4 )
		if misType == 1 then
			TAddText( sceneId, "    �úã���ת���´��ƹ����ͽ�������ϡ�" )
		else
			TAddText( sceneId, "    �úã���������䳵ȡ����" )
		end
	end
end
