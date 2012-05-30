-- Ѱ�ҿ�ʯ����
--MisDescBegin
-- �ű���
x600003_g_ScriptId = 600003

--�����
x600003_g_MissionId = 1105

--����Ŀ��npc
x600003_g_Name = "��Ӧ��"

--�������
x600003_g_MissionKind = 50

--����ȼ�
x600003_g_MissionLevel = 10000

--�Ƿ��Ǿ�Ӣ����
x600003_g_IfMissionElite = 0

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************
x600003_g_IsMissionOkFail = 0							-- ������ɱ��

--�����Ƕ�̬**************************************************************

--���������һλ�����洢����õ��Ľű���

--�����ı�����
x600003_g_MissionName = "��������"
x600003_g_MissionInfo = ""													--��������
x600003_g_MissionTarget = "    Ѱ��%i�����������е���Ӧ�� ( 65, 55 )��"	--����Ŀ��
x600003_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600003_g_SubmitInfo = "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600003_g_MissionComplete = "    �ɵò����������á�"						--�������npc˵���Ļ�

x600003_g_Parameter_Item_IDRandom = { { id = 5, num = 1 } }

x600003_g_StrForePart = 5
x600003_g_Offset = 6														-- Suppose to 6, ����ڼ�����Ʒ�е�ƫ����

x600003_g_MissionRound = 38

-- ͨ�ó�������ű�
x600003_g_CityMissionScript = 600001
x600003_g_EngineeringScript = 600002

--������

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x600003_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x600003_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600003_g_MissionId ) > 0 then
		local bDone = x600003_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600003_g_SubmitInfo
		else
			strText = x600003_g_ContinueInfo
		end

		--���������������Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, x600003_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600003_g_ScriptId, x600003_g_MissionId, bDone )
	--���������������
	elseif x600003_CheckAccept( sceneId, selfId ) > 0 then
		local nTemp = CallScriptFunction( x600003_g_CityMissionScript, "CanDoMisToDay", sceneId, selfId )
		if nTemp == 1   then
			x600003_OnAccept( sceneId, selfId, targetId )
		end
	end
end

--**********************************
--�о��¼�
--**********************************
function x600003_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600003_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600003_g_MissionId ) > 0 then
		AddNumText( sceneId, x600003_g_ScriptId, x600003_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600003_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600003_g_EngineeringScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������Ӧ�����ȼ��õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600003_GetMissionItemIndex( sceneId, selfId )
	local nBuildingLevel = CityGetBuildingLevel( sceneId, selfId, sceneId, CITY_BUILDING_DUANTAI )
	local nPos

	if nBuildingLevel == 0 then								-- 1
		nPos = x600003_g_Offset
	elseif nBuildingLevel == 1 then							-- 2
		nPos = x600003_g_Offset + 1
	elseif nBuildingLevel == 2 then							-- 3
		nPos = x600003_g_Offset + 2
	elseif nBuildingLevel == 3 then							-- 4
		nPos = x600003_g_Offset + 3
	else													-- 5
		nPos = 157
	end

	return nPos
end

--**********************************
--����
--**********************************
function x600003_OnAccept( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600003_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if GetLevel( sceneId, selfId ) < 20 then
		CallScriptFunction( x600003_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
		return
	end

	--������������б�
	AddMission( sceneId, selfId, x600003_g_MissionId, x600003_g_ScriptId, 0, 0, 1 )	-- kill��area��item
	if IsHaveMission( sceneId, selfId, x600003_g_MissionId ) <= 0 then
		return
	end

	CallScriptFunction( x600003_g_EngineeringScript, "OnAccept", sceneId, selfId, targetId, x600003_g_ScriptId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600003_g_MissionId )
	local nitemId, strItemName, _ = GetOneMissionItem( x600003_GetMissionItemIndex( sceneId, selfId ) )

	SetMissionByIndex( sceneId, selfId, misIndex, x600003_g_StrForePart, nitemId )

	--��ʾ���ݸ�������Ѿ�����������
	BeginEvent( sceneId )
		local missionInfo
		if random(2) == 1 then
			missionInfo = format( "    ���������о����ֿ�ʯ�����ڻ�ȱ��#Y%s#W��ϣ�����ܰ���������", strItemName )
		else
			missionInfo = format( "    ��˵#Y%s#W��Ӳ�ޱȣ�������Ҫ֪��ԭ���ͷ������Ѱ�������г�л��", strItemName )
		end

		AddText( sceneId, missionInfo )
		AddText( sceneId, "#r    �����������" .. x600003_g_MissionName )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	-- ��������Ƿ����д���Ʒ
	if LuaFnGetAvailableItemCount( sceneId, selfId, nitemId ) > 0 then
		x600003_OnItemChanged( sceneId, selfId, nitemId )
	end
end

--**********************************
--����
--**********************************
function x600003_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600003_g_EngineeringScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600003_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600003_g_MissionName )
		AddText( sceneId, x600003_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600003_g_ScriptId, x600003_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600003_CheckSubmit( sceneId, selfId )
	local ret = CallScriptFunction( x600003_g_EngineeringScript, "CheckSubmit", sceneId, selfId )

	if ret == 1 then
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600003_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600003_g_StrForePart )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum < 1 then
			ret = 0
		end
	end

	return ret
end

--**********************************
--�ύ
--**********************************
function x600003_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600003_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600003_CheckSubmit( sceneId, selfId ) == 1 then
		-- �۶���
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600003_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600003_g_StrForePart )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			local ret = LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 )
			if ret < 1 then
				return
			end
		else											-- ֻ��Ϊ�ݴ������ϲ����ܷ���
			SetMissionByIndex( sceneId, selfId, misIndex, x600003_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600003_g_EngineeringScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600003_OnKillObject( sceneId, selfId, objdataId, objId )	--������˼�������š����objId�������λ�úš�����objId
end

--**********************************
--���������¼�
--**********************************
function x600003_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600003_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600003_g_MissionId )

	local _, strItemName, _ = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600003_g_StrForePart )
	local _, strDemandItemName, _ = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "�ѵõ� %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600003_g_IsMissionOkFail, 1 )
		else
			strText = format( "ʧȥ %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600003_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600003_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end
