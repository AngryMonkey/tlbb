--��������
--Ѱ�ҽ��蹤��

--************************************************************************
--MisDescBegin

--�ű���
x600036_g_ScriptId = 600036

--�����
x600036_g_MissionId = 1111

--Ŀ��NPC
x600036_g_Name = "֣����"

--����ȼ�
x600036_g_MissionLevel = 10000

--�������
x600036_g_MissionKind = 50

--�Ƿ��Ǿ�Ӣ����
x600036_g_IfMissionElite = 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��

x600036_g_IsMissionOkFail			=0	--0 ������ɱ��
x600036_g_MissionParam_SubId		=1	--1 ������ű��Ŵ��λ��
x600036_g_MissionParam_Phase		=2	--2 �׶κ� �˺��������ֵ�ǰ����UI��������Ϣ
x600036_g_MissionParam_NpcId		=3	--3 ���� NPC �� NPCId ��
x600036_g_MissionParam_ItemId		=4	--4 ������Ʒ�ı��
x600036_g_MissionParam_MonsterId	=5	--5 ���� Monster �� NPCId ��

--ѭ�����������������������������Ļ���
x600036_g_MissionRound = 59
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600036_g_MissionName = "��������"
x600036_g_MissionInfo = "������������������"								--��������
x600036_g_MissionTarget = "%f"												--����Ŀ��
x600036_g_ContinueInfo = "    �������û�����ô��"						--δ��������npc�Ի�
x600036_g_SubmitInfo = "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600036_g_MissionComplete = "    �������ã������Ľ����ּӿ��ˡ�"			--�������npc˵���Ļ�

x600036_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600036_g_StrForePart = 2

--���������ַ�����ʽ��������
x600036_g_FormatList = {
	"",
	"    ǰ��%1n��ȡ%2i��",					-- 1
	"    ��%2i�����������ܹܡ�",			-- 2
	"    ǰ��%1n��ȡ%2i��",					-- 3
	"    ǰ��%1n��ȡ%2i��",					-- 4
	"    %3n������%2i����Ҫ��ȥ�������",	-- 5
	"    ��%2i�����������ܹܡ�",			-- 6
}

-- ͨ�ó�������ű�
x600036_g_CityMissionScript = 600001
x600036_g_ConstructionScript = 600035

--������

--MisDescEnd
--************************************************************************

x600036_g_ItemOffset = 29				-- Suppose to 29, ����ڼ�����Ʒ�е�ƫ����
x600036_g_NPCOffset = 34				-- Suppose to 34, ����ڼ��� NPC ��ƫ����
x600036_g_NPCOffsetEx	= 257 		--����ڼ��� NPC ��ƫ�������� modi:lby20071126
x600036_g_MonsterOffset = 43		-- Suppose to 43, ����ڼ��� Monster ��ƫ����

x600036_g_subScriptId = 600037
x600036_g_subMissionId = 1112

x600036_g_FamilyNamesList = { "��", "Ǯ", "��", "��", "��", "��", "֣", "��", "��", "��", "��", "κ", "��", "��", "��", "��", "��", "��", "��", "��", "��", "��", "ʩ", "��", }

--**********************************
--������ں���
--**********************************
function x600036_OnDefaultEvent( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		local bDone = x600036_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600036_g_SubmitInfo
		else
			strText = x600036_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId, bDone )

	--���������������
	elseif x600036_CheckAccept( sceneId, selfId ) > 0 then
		x600036_OnAccept( sceneId, selfId, targetId )
	end
end

--**********************************
--�о��¼�
--**********************************
function x600036_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) > 0 then
		AddNumText( sceneId, x600036_g_ScriptId, x600036_g_MissionName,3,-1 )
	end
end

--**********************************
--����������
--**********************************
function x600036_CheckAccept( sceneId, selfId )
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret
end

--**********************************
--������ҵȼ��õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600036_GetMissionItemIndex( sceneId, selfId )
	return x600036_g_ItemOffset
end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600036_GetMissionNPCKey( sceneId, selfId )
	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos

	if nPlayerLevel < 30 then								-- 10 ~ 30
		nPos = 0
	elseif nPlayerLevel < 50 then							-- 30 ~ 50
		nPos = 1
	elseif nPlayerLevel < 70 then							-- 50 ~ 70
		nPos = 2
	--else													-- 70 ~ 100
	--	nPos = 3
	--end

	--return nPos + x600036_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600036_g_NPCOffset
	else
		return nPos + x600036_g_NPCOffsetEx
	end
end

--**********************************
--����
--**********************************
function x600036_OnAccept( sceneId, selfId, targetId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) == 0 then					--û������ſ���������
		if GetLevel( sceneId, selfId ) < 10 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		AddMission( sceneId, selfId, x600036_g_MissionId, x600036_g_ScriptId, 0, 0, 0 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) <= 0 then
			return
		end

		SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 ) -- ע�� x600036_OnLockedTarget �¼�
		CallScriptFunction( x600036_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600036_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600036_GetMissionItemIndex( sceneId, selfId ) )
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600036_GetMissionNPCKey( sceneId, selfId ) )
		local PlayerGender = GetSex( sceneId, selfId )
		local rank

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 1 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId, nitemId )

		if PlayerGender == 0 then
			rank = "��Ů"
		elseif PlayerGender == 1 then
			rank = "����"
		else
			rank = "����"
		end

		--��ʾ���ݸ�������Ѿ�����������
		BeginEvent( sceneId )
			AddText( sceneId, x600036_g_MissionName )
			local missionInfo = format( "    �ڹ���%sʦ��������ʧ����%s������%sǰ��%s%s��%d��%d������ȡ�����Ǹм���",
				x600036_g_FamilyNamesList[random(getn(x600036_g_FamilyNamesList))], strItemName, rank,
				strNpcSceneDesc, strNpcName, nPosX, nPosZ )

			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    �����������" .. x600036_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--������һ������
--**********************************
function x600036_OnLockedTarget( sceneId, selfId, objId )
	if IsHaveMission( sceneId, selfId, x600036_g_MissionId ) < 1 then
		return		-- û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then			-- �Ҵ�����
		return
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600036_NotifyFailTips( sceneId, selfId, "��������Ҫ����һ��������Ʒ�ռ�" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase )

	local PlayerGender = GetSex( sceneId, selfId )
	local rank

	if PlayerGender == 0 then
		rank = "��Ů"
	else
		rank = "����"
	end

	if Phase == 1 then				-- �ս����������� NPC
		-- 8 �ɻ���ֱ�Ӹ���������Ʒ��������ɣ�1 �ɻ������������1 �ɻ����ɱ������
		local rand = random(100)	-- ֱ���������
		if rand <= 80 then
			local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE )
			if pos == -1 then
				CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�����ռ䲻��" )
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- �������

			local missionInfo = format( "    ��Ȼ��%s��ȡ���Ե�Ч��������%s����Ц�ɡ�",
				rank, strDemandItemName )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		elseif rand <= 90 then		-- ���ɸ�������
			--������������б�
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill��area��item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end

			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 3 )
			local subMisIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_subMissionId )
			SetMissionByIndex( sceneId, selfId, subMisIndex, 2, 10 )						--��Ҫɱ���Ĺ��������������ͻ���ʹ��

			CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )

			return
		else						-- ����ɱ������
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 5 )

			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 0 )					-- ע�� KillObj �¼�
			SetMissionEvent( sceneId, selfId, x600036_g_MissionId, 2 )					-- ע�� itemchange �¼�
			local myLevel = GetLevel( sceneId, selfId )
			local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )

--		PrintStr( "�ҵļ���: " .. myLevel .. "���ֵļ���: " .. nLevel )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_MonsterId, nMonsterId )

			strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "��", "" )
			local missionInfo = format( "    ��ѽ�����ǲ��ɣ�%s�����У�ǰЩ��·��%sʱ�������������%s����ȥ�����%sԸ���ȥ��ء�",
				strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

			TAddText( sceneId, missionInfo )

			ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
			return
		end
	elseif Phase == 3 then			-- �����˸�������
			--������������б�
		if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
			AddMission( sceneId, selfId, x600036_g_subMissionId, x600036_g_subScriptId, 1, 0, 0 )	-- kill��area��item
			if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) <= 0 then
				return
			end
		end

		CallScriptFunction( x600036_g_subScriptId, "OnEnumerate", sceneId, selfId, objId )
		return
	elseif Phase == 4 then			-- �������������
		-- ɾ���������񣬸���������Ʒ
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE)
		if pos == -1 then
			CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, "�����ռ䲻��" )
			return
		end

		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 2 )
		SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )		-- �������

		local missionInfo = format( "    ��л%s�ε�Ԯ�֣����%s��ʻع��ɡ�",
			rank, strDemandItemName )

		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600036_g_MissionId, 4 )
		return
	elseif Phase == 5 then			-- �Ѿ�������ɱ������
		local myLevel = GetLevel( sceneId, selfId )
		local nMonsterId, strMonsterName, strMonsterSceneDesc = LuaFnGetLevelMatchingMonster( x600036_g_MonsterOffset, myLevel )
		strMonsterSceneDesc	= gsub( strMonsterSceneDesc, "��", "" )
		local missionInfo = format( "    ��ѽ�����ǲ��ɣ�%s�����У�ǰЩ��·��%sʱ�������������%s����ȥ�����%sԸ���ȥ��ء�",
			strDemandItemName, strMonsterSceneDesc, strMonsterName, rank )

		TAddText( sceneId, missionInfo )
		return
	else							-- �������
		return
	end
end

--**********************************
--����
--**********************************
function x600036_OnAbandon( sceneId, selfId )
	if IsHaveMission( sceneId, selfId, x600036_g_subMissionId ) == 1 then
		x600036_NotifyFailTips( sceneId, selfId, "���ȷ���������������" )
		return		-- û�и�����
	end

	--ɾ����Ʒ
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600036_g_ConstructionScript, "OnAbandon", sceneId, selfId )
end

--**********************************
--����
--**********************************
function x600036_OnContinue( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, x600036_g_MissionName )
		AddText( sceneId, x600036_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600036_g_ScriptId, x600036_g_MissionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600036_CheckSubmit( sceneId, selfId, selectRadioId )
	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600036_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret
end

--**********************************
--�ύ
--**********************************
function x600036_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	if GetName( sceneId, targetId ) ~= x600036_g_Name then		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		return
	end

	if x600036_CheckSubmit( sceneId, selfId ) == 1 then
		-- �۶���
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else											-- ֻ��Ϊ�ݴ������ϲ����ܷ���
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600036_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end
end

--**********************************
--ɱ����������
--**********************************
function x600036_OnKillObject( sceneId, selfId, objdataId, objId )
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )		--ȡ�������������ӵ�з���Ȩ������
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		curOwner = GetMonsterOwnerID( sceneId, objId, i )				--ȡ��ӵ�з���Ȩ���˵�objId
		if IsHaveMission( sceneId, curOwner, x600036_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600036_g_MissionId ) == x600036_g_ScriptId then		--��������ӵ������
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600036_g_MissionId )

		 	if GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_Phase ) ~= 5 then
		 		return
		 	end

			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600036_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
			-- һ�����ʴ������������Ʒ
				if GetItemCount( sceneId, curOwner, demandItemId ) < 1 then
					--if random( 100 ) > 10 then
						--return
					--end

					AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
				end
			end
		end
	end
end

--**********************************
--���������¼�
--**********************************
function x600036_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600036_OnItemChanged( sceneId, selfId, itemdataId )
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600036_g_MissionId )

	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600036_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if strItemName == strDemandItemName then
		local nItemNum = GetItemCount( sceneId, selfId, itemdataId )
		local strText
		if nItemNum > 0 then
			strText = format( "�ѵõ� %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_MissionParam_Phase, 6 )
		else
			strText = format( "ʧȥ %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600036_g_IsMissionOkFail, 0 )
		end

		CallScriptFunction( x600036_g_CityMissionScript, "NotifyFailTips", sceneId, selfId, strText )
	end
end

function x600036_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
