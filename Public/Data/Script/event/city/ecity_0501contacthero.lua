-- ��ʶ��������
--MisDescBegin
-- �ű���
x600024_g_ScriptId = 600024

--�����
x600024_g_MissionId = 1110

--����Ŀ��npc
x600024_g_Name = "١ܽ��"

--�������
x600024_g_MissionKind = 50

--����ȼ�
x600024_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600024_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600024_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600024_g_MissionName = "��������"
x600024_g_MissionInfo = "    ��������Ҫ %s �ˣ�ȥ���������ɣ�"			--��������
x600024_g_MissionTarget = "    ���ύ�Ÿ�%n��"							--����Ŀ��
x600024_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600024_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600024_g_MissionComplete = "    ���������±�����������ڽ���������˲��١�"		--�������npc˵���Ļ�

x600024_g_StrForePart = 5
x600024_g_NPCOffset = 30												-- Suppose to 30, ����ڼ��� NPC ��ƫ����
x600024_g_NPCOffsetEx	= 255 										--����ڼ��� NPC ��ƫ�������� modi:lby20071126

x600024_g_MissionRound = 55

-- ͨ�ó�������ű�
x600024_g_CityMissionScript = 600001
x600024_g_ExpandScript = 600023

--������

--MisDescEnd

x600024_g_TargetNPC = x600024_g_StrForePart
x600024_g_MissionItem = 40004256

x600024_g_Pronoun = {}
x600024_g_Pronoun[0] = "��"
x600024_g_Pronoun[1] = "��"

--**********************************
--������ں���
--**********************************
function x600024_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) > 0 then
		--���������������Ϣ
		local bDone = x600024_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600024_g_SubmitInfo
		else
			strText = x600024_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600024_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600024_g_ScriptId, x600024_g_MissionId, bDone )
	--���������������
	elseif x600024_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600024_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600024_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600024_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) > 0 then
		AddNumText( sceneId, x600024_g_ScriptId, x600024_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600024_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600024_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600024_GetMissionNPCKey( sceneId, selfId )
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

	--return nPos + x600024_g_NPCOffset
	elseif	nPlayerLevel < 100 then					-- 85 ~ 99 Level
		nPos = 3
	elseif nPlayerLevel < 115 then					-- 100 ~ 119 Level	modi:lby20071126
		nPos = 0
	else 																		-- >=115 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600024_g_NPCOffset
	else
		return nPos + x600024_g_NPCOffsetEx
	end
end

--**********************************
--����
--**********************************
function x600024_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600024_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	local pos = LuaFnTryRecieveItem( sceneId, selfId, x600024_g_MissionItem, QUALITY_MUST_BE_CHANGE )
	if pos == -1 then
		CallScriptFunction( x600024_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�����ռ䲻��" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600024_g_MissionId, x600024_g_ScriptId, 0, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600024_g_MissionId, 4 ) -- ע�� x600024_OnLockedTarget �¼�

	CallScriptFunction( x600024_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600024_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600024_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, nScene, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600024_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600024_g_TargetNPC, nNpcId )

	strNpcScene = gsub( strNpcScene, "��", "" )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		local rand = random( 2 )

		if rand == 1 then
			missionInfo = format( "    Ϊ�˲�ʶ%s������Ӣ��Ҳ��Ȼ������ȥ%s������ݽύ�Ž���%s��%d��%d����",
				strNpcName, strNpcScene, strNpcName, nPosX, nPosZ )
		else
			missionInfo = format( "    %s��%d��%d���ڽ�����С�������������Ǻ����ô���ȥ%s���ύ�Ž���%s��",
				strNpcName, nPosX, nPosZ, strNpcScene, x600024_g_Pronoun[nGender] )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "    �����������" .. x600024_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600024_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600024_g_ExpandScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600024_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600024_g_MissionName )
		AddText( sceneId, x600024_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600024_g_ScriptId, x600024_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600024_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600024_g_ExpandScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600024_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600024_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600024_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600024_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600024_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600024_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600024_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--������һ������
--**********************************
function x600024_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600024_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600024_g_MissionId )		--�õ�������20�������е����к�
	if GetMissionParam( sceneId, selfId, misIndex, x600024_g_IsMissionOkFail ) > 0 then
		return		-- �����������
	end

	local nNpcId, strNpcName, PosX, PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600024_g_TargetNPC )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- ��ʱ���Ƚ�λ��
	if GetName( sceneId, objId ) == strNpcName then
		if DelItem( sceneId, selfId, x600024_g_MissionItem, 1 ) == 1 then
			-- ���������Ѿ����
			SetMissionByIndex( sceneId, selfId, misIndex, x600024_g_IsMissionOkFail, 1 )
			-- ��������� x600024_OnLockedTarget �¼��б���������������ٹ��Ĵ����¼�
			ResetMissionEvent( sceneId, selfId, x600024_g_MissionId, 4 )

			local rand = random( 2 )
			local strText

			if rand == 1 then
				strText = format( "    ��˵���������屡���죬����Ҫ��Ч��֮���������������������ǡ�" )
			else
				strText = format( "    �����ˣ�Ϊ���Ч������%s֮���ҡ�", strNpcName )
			end

			TAddText( sceneId, strText )
		end
	end
end
