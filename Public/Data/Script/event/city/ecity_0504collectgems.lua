-- �ռ���ʯ
--MisDescBegin
-- �ű���
x600027_g_ScriptId = 600027

--�����
x600027_g_MissionId = 1110

--����Ŀ��npc
x600027_g_Name = "١ܽ��"

--�������
x600027_g_MissionKind = 50

--����ȼ�
x600027_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600027_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600027_g_IsMissionOkFail			=0	--0 ������ɱ��[ֵ���ܱ�]
x600027_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��[ֵ���ܱ�]
x600027_g_GemCount					=2	--2 ��Ҫ�ı�ʯ����
x600027_g_GemSerialNum				=3	--3 ��Ҫ�ı�ʯ

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600027_g_MissionName = "��������"
x600027_g_MissionInfo = ""			--��������
x600027_g_MissionTarget = "    ��%s��%i�����������١ܽ�� ( 148, 96 )����"	--����Ŀ��
x600027_g_ContinueInfo = "    �������û�����ô��"					--δ��������npc�Ի�
x600027_g_SubmitInfo = "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600027_g_MissionComplete = "    �������á�"							--�������npc˵���Ļ�

x600027_g_Parameter_Item_AllRandom = { { id = 3, num = 2 } }

x600027_g_StrForePart = 2
x600027_g_Offset = 35													-- Suppose to ��, ����ڼ�����Ʒ�е�ƫ����

x600027_g_MissionRound = 55

-- ͨ�ó�������ű�
x600027_g_CityMissionScript = 600001
x600027_g_ExpandScript = 600023

x600027_g_StrList = { " 0 ", " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 10 " }

--������


--MisDescEnd
--**********************************
--������ں���
--**********************************
function x600027_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		--���������������Ϣ
		local bDone = x600027_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600027_g_SubmitInfo
		else
			strText = x600027_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600027_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId, bDone )
	--���������������
	elseif x600027_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600027_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600027_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600027_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) > 0 then
		AddNumText( sceneId, x600027_g_ScriptId, x600027_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600027_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������Ӧ�����õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600027_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_XIANYA )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600027_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600027_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600027_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600027_g_Offset + 3
	else													-- 5
		nPos = 161
	end

	return nPos
end

--**********************************
--������ҵȼ��õ���Ҫ��Ѱ�ı�ʯ����
--**********************************
function x600027_GetMissionItemCount( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nCount

	if nPlayerLevel < 55 then								-- 40 ~ 54
		nCount = 1
	elseif nPlayerLevel < 70 then							-- 55 ~ 69
		nCount = random(2)
	elseif nPlayerLevel < 85 then							-- 70 ~ 84
		nCount = random(2)
	else													-- 85 ~ 100
		nCount = random(3)
	end

	return nCount
end

--**********************************
--����
--**********************************
function x600027_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 40 then
		CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600027_g_MissionId, x600027_g_ScriptId, 0, 0, 1 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600027_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600027_g_ExpandScript, "OnAccept", sceneId, selfId, targetId, x600027_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600027_GetMissionItemIndex( sceneId, selfId ) )
	local nCount = x600027_GetMissionItemCount( sceneId, selfId )

	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemSerialNum, nitemId )
	SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_GemCount, nCount )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    ����Ϊ�˽ύ�������ͣ���Ҫ����һЩ����Ʒ������ȥ������%d��%s����", nCount, strItemName )
		else
			missionInfo = format( "    ������Ҫ%d��%s���ύ������ʿ����%s���������Ī���ˡ���", nCount, strItemName, strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    �����������" .. x600027_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- ��������Ƿ����д���Ʒ
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600027_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--����
--**********************************
function x600027_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600027_g_ExpandScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600027_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600027_g_MissionName )
		AddText( sceneId, x600027_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600027_g_ScriptId, x600027_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600027_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600027_g_ExpandScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < nCountNeeded then
			ret = 0
		end
	end

	return ret
end

--**********************************
--�ύ
--**********************************
function x600027_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600027_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600027_CheckSubmit( sceneId, selfId ) == 1 then
		-- �۶���
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
		local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum >= nCountNeeded then
			LuaFnDelAvailableItem( sceneId, selfId, demandItemId, nCountNeeded )
		else											-- ֻ��Ϊ�ݴ������ϲ����ܷ���
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600027_g_ExpandScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600027_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600027_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600027_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600027_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemSerialNum )
	local nCountNeeded = GetMissionParam( sceneId, selfId, misIndex, x600027_g_GemCount )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText = format( "�õ�%s %d/%d", strItemName, nItemNum, nCountNeeded )

		if nItemNum <= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 0 )
		end

		if nItemNum >= nCountNeeded then
			SetMissionByIndex( sceneId, selfId, misIndex, x600027_g_IsMissionOkFail, 1 )
		end
		if (strText and nItemNum <= nCountNeeded) then
			CallScriptFunction( x600027_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
		end
	end
end
