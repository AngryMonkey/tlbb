-- �����ʵ���ֲƷ
--MisDescBegin
-- �ű���
x600010_g_ScriptId = 600010

--�����
x600010_g_MissionId = 1106

--����Ŀ��npc
x600010_g_Name = "������"

--�������
x600010_g_MissionKind = 50

--����ȼ�
x600010_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600010_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600010_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600010_g_MissionName = "��չ����"
x600010_g_MissionInfo = "    ��������Ҫ %s �ˣ�ȥ���������ɣ�"			--��������
x600010_g_MissionTarget = "    ��%i�͸�%n��"							--����Ŀ��
x600010_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600010_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600010_g_MissionComplete = "    �ɵò����������á�"					--�������npc˵���Ļ�

x600010_g_StrForePart = 5
x600010_g_ItemOffset = 19												-- Suppose to 19, ����ڼ�����Ʒ�е�ƫ����
x600010_g_NPCOffset = 12												-- Suppose to 12, ����ڼ��� NPC ��ƫ����
x600010_g_NPCOffsetEx = 247											-- Suppose to 12, ����ڼ��� NPC ��ƫ����

x600010_g_MissionRound = 40

-- ͨ�ó�������ű�
x600010_g_CityMissionScript = 600001
x600010_g_DevelopmentScript = 600007

--������

--MisDescEnd

x600010_g_Pronoun = {}
x600010_g_Pronoun[0] = "��"
x600010_g_Pronoun[1] = "��"

--**********************************
--������ں���
--**********************************
function x600010_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600010_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600010_g_MissionId ) > 0 then
		--���������������Ϣ
		local bDone = x600010_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600010_g_SubmitInfo
		else
			strText = x600010_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600010_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600010_g_ScriptId, x600010_g_MissionId, bDone )
	--���������������
	elseif x600010_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600010_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600010_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600010_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600010_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600010_g_MissionId ) > 0 then
		AddNumText( sceneId, x600010_g_ScriptId, x600010_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600010_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600010_g_DevelopmentScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵȼ��õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600010_GetMissionItemIndex( sceneId, selfId )
	return x600010_g_ItemOffset
end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600010_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 45 then								-- 30 ~ 44
		nPos = 0
	elseif nPlayerLevel < 60 then							-- 45 ~ 59
		nPos = 1
	elseif nPlayerLevel < 75 then							-- 60 ~ 74
		nPos = 2
	--else													-- 75 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600010_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 125 then		-- 100 ~ 125 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600010_g_NPCOffset
	else
		return nPos + x600010_g_NPCOffsetEx
	end
end

--**********************************
--����
--**********************************
function x600010_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600010_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 30 then
		CallScriptFunction( x600010_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	local nitemId, strItemName, _ = GetOneMissionItem( x600010_GetMissionItemIndex( sceneId, selfId ) )
	local pos = LuaFnTryRecieveItem( sceneId, selfId, nitemId, QUALITY_MUST_BE_CHANGE )
	if pos == -1 then
		CallScriptFunction( x600010_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�����ռ䲻��" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600010_g_MissionId, x600010_g_ScriptId, 0, 0, 0 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600010_g_MissionId ) <= 0 then
		return
	end

	SetMissionEvent( sceneId, selfId, x600010_g_MissionId, 4 ) -- ע�� x600010_OnLockedTarget �¼�

	CallScriptFunction( x600010_g_DevelopmentScript, "OnAccept", sceneId, selfId, targetId, x600010_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600010_g_MissionId )
	local nNpcId, strNpcName, strNpcScene, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600010_GetMissionNPCKey( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600010_g_StrForePart, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600010_g_StrForePart + 1, nNpcId )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		local rand = random(2)

		if rand == 1 then
			missionInfo = format( "    ����#Y%s#W���� %s%s��%d��%d��ǰ�������������ﶩ�Ļ�����������һ�ˡ�",
				strItemName, strNpcScene, strNpcName, nPosX, nPosZ )
		else
			missionInfo = format( "    %s%s��%d��%d�����������ﶩ����#Y%s#W�������������ȥ��",
				strNpcScene, strNpcName, nPosX, nPosZ, strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    �����������" .. x600010_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--����
--**********************************
function x600010_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600010_g_DevelopmentScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600010_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600010_g_MissionName )
		AddText( sceneId, x600010_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600010_g_ScriptId, x600010_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600010_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600010_g_DevelopmentScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600010_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600010_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600010_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600010_g_DevelopmentScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600010_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600010_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600010_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--������һ������
--**********************************
function x600010_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600010_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600010_g_MissionId )		--�õ�������20�������е����к�
	if GetMissionParam( sceneId, selfId, misIndex, x600010_g_IsMissionOkFail ) > 0 then
		return		-- �����������
	end

	local nNpcId
	local strNpcName
	local PosX
	local PosZ

	nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600010_g_StrForePart + 1 )
	_, strNpcName, _, PosX, PosZ = GetNpcInfoByNpcId(sceneId, nNpcId )

	-- ��ʱ���Ƚ�λ��
	if GetName( sceneId, objId ) == strNpcName then
		local nItemId
		nItemId = GetMissionParam( sceneId, selfId, misIndex, x600010_g_StrForePart )

		if DelItem( sceneId, selfId, nItemId, 1 ) == 1 then
			-- ���������Ѿ����
			SetMissionByIndex( sceneId, selfId, misIndex, x600010_g_IsMissionOkFail, 1 )
			-- ��������� x600010_OnLockedTarget �¼��б���������������ٹ��Ĵ����¼�
			ResetMissionEvent( sceneId, selfId, x600010_g_MissionId, 4 )
			TAddText( sceneId, "    ̫�ã���������һ�����ڴ��´κ�����" )
		end
	end
end


function x600010_OnTimer( sceneId, selfId )

	--ף�� 2008-03-06
	--��Ӧ�ó����������....
	ResetMissionEvent( sceneId, selfId, x600010_g_MissionId, 5 )
	local msg = format( "CityMission_OnTimer_Error x600010_OnTimer %0X,%d,%d", LuaFnObjId2Guid( sceneId, selfId ), sceneId, selfId )
	MissionLog( sceneId, msg )

end
