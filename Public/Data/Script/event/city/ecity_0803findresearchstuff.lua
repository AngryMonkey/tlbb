--��������
--�ҵ�ԭ��

--************************************************************************
--MisDescBegin
--�ű���
x600043_g_ScriptId	= 600043
--�����
x600043_g_MissionId	= 1113
--Ŀ��NPC
x600043_g_Name			= "֣����"
--����ȼ�
x600043_g_MissionLevel					= 10000
--�������
x600043_g_MissionKind						= 50
--�Ƿ��Ǿ�Ӣ����
x600043_g_IfMissionElite				= 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600043_g_IsMissionOkFail				= 0	--0 ������ɱ��
x600043_g_MissionParam_SubId		= 1	--1 ������ű��Ŵ��λ��
x600043_g_MissionParam_Phase		= 2	--2 �׶κ� �˺��������ֵ�ǰ����UI��������Ϣ
x600043_g_MissionParam_NpcId		= 3	--3 ���� NPC �� NPCId ��
x600043_g_MissionParam_ItemId		= 4	--4 ������Ʒ�ı��
x600043_g_MissionParam_MonsterId= 5	--5 ���� Monster �� NPCId ��
x600043_g_MissionParam_IsCarrier= 6	--6 �Ƿ�����������
--ѭ�����������������������������Ļ���
x600043_g_MissionRound					= 61
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600043_g_MissionName			= "�о�����"
x600043_g_MissionInfo			= "�����������о�����"									--��������
x600043_g_MissionTarget		= "%f"																	--����Ŀ��
x600043_g_ContinueInfo		= "    �������û�����ô��"					--δ��������npc�Ի�
x600043_g_SubmitInfo			= "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600043_g_MissionComplete	= "    �������ã��о������ּӿ��˲��١�"--�������npc˵���Ļ�

x600043_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600043_g_StrForePart			= 2

--���������ַ�����ʽ��������
x600043_g_FormatList			= {
	"",
	"    �ҵ�%2i�����������ܹܡ�",	--1 Ѱ��������Ʒ
	"    ��%2i�����������ܹܡ�"			--2 �ͻ�
}

--ͨ�ó�������ű�
x600043_g_CityMissionScript	= 600001
x600043_g_ConstructionScript= 600040

--������

--MisDescEnd
--************************************************************************

x600043_g_ItemOffset			= 31	--����ڼ�����Ʒ�е�ƫ����

--�׶�����
x600043_g_PhaseKey				= {}
x600043_g_PhaseKey["fnd"]	= 1		--Ѱ��������Ʒ
x600043_g_PhaseKey["end"]	= 2		--�ͻ�

--**********************************
--������ں���
--**********************************
function x600043_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		local bDone = x600043_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600043_g_SubmitInfo
		else
			strText = x600043_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId, bDone )

	--δ�Ӵ����������������������
	elseif x600043_CheckAccept( sceneId, selfId ) > 0 then
		x600043_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--�о��¼�
--**********************************
function x600043_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) > 0 then
		AddNumText( sceneId, x600043_g_ScriptId, x600043_g_MissionName,3,-1 )
	end

end

--**********************************
--����������
--**********************************
function x600043_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600043_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--������Ӧ�����õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600043_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_SHUFANG )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600043_g_ItemOffset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600043_g_ItemOffset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600043_g_ItemOffset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600043_g_ItemOffset + 3
	else													-- 5
		nPos = 160
	end

	return nPos
end

--**********************************
--����
--**********************************
function x600043_OnAccept( sceneId, selfId, targetId )

	--û������ſ���������
	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600043_NotifyFailTips( sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		--LuaFnAddMission����˵����
		--sceneId, selfId, misId(������), scriptId, k(�Ƿ�ص�x600043_OnKillObject), e(�Ƿ�ص�OnEnterArea), i(�Ƿ�ص�OnItemChange)
		--����˵����������������misId��ŵ����񣬳ɹ�����1
		AddMission( sceneId, selfId, x600043_g_MissionId, x600043_g_ScriptId, 0, 0, 1 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
			return
		end

		--�޸��������misId��ŵ�������Ӧ�¼�
		--eventId�����ýű���ţ�0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--ע�� OnLockedTarget �¼�
--	SetMissionEvent( sceneId, selfId, x600043_g_MissionId, 4 )
		CallScriptFunction( x600043_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600043_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600043_GetMissionItemIndex( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId, nitemId )
		--�Ƿ�����������
		--����ǣ�����᲻�ϵ���"��������"����ʱҪ����ұ������һ�θ�����
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_IsCarrier, 0 )

		--��ʾ���ݸ�������Ѿ�����������
		local	missionInfo	= format( "    �������о������У��������鷳������Ҫ%s����ԭ�ϣ�����������ͷ������������",
				strItemName )
		BeginEvent( sceneId )
			AddText( sceneId, x600043_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    �����������" .. x600043_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		-- ��������Ƿ����д���Ʒ
		if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
			x600043_OnItemChanged( sceneId, selfId, nitemId )
		end
	end

end

--**********************************
--����
--**********************************
function x600043_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600043_g_MissionId ) <= 0 then
		return
	end

	--��ͨ��Ʒ����Ҫɾ��

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600043_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--����
--**********************************
function x600043_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600043_g_MissionName )
		AddText( sceneId, x600043_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600043_g_ScriptId, x600043_g_MissionId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600043_CheckSubmit( sceneId, selfId, selectRadioId )

	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600043_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--�ύ
--**********************************
function x600043_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600043_g_Name then
		return
	end

	if x600043_CheckSubmit( sceneId, selfId ) == 1 then
		--�۶���
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--�ɹ��ύ
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--ֻ��Ϊ�ݴ������ϲ����ܷ���
			SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
			x600043_NotifyFailTips( sceneId, selfId, "����ʧ��" )
			return
		end

		CallScriptFunction( x600043_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--ɱ����������
--**********************************
function x600043_OnKillObject( sceneId, selfId, objdataId, objId )
end

--**********************************
--���������¼�
--**********************************
function x600043_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600043_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600043_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600043_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if nItemNum > 0 then
		strText = format( "�õ� %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_MissionParam_Phase, x600043_g_PhaseKey["end"] )
	else
		strText = format( "ʧȥ %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600043_g_IsMissionOkFail, 0 )
	end

	if strText ~= nil then
		x600043_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x600043_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
