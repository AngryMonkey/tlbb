--��������
--Ѱ�ҽ�������

--************************************************************************
--MisDescBegin
--�ű���
x600038_g_ScriptId	= 600038
--�����
x600038_g_MissionId	= 1111
--Ŀ��NPC
x600038_g_Name			= "֣����"
--����ȼ�
x600038_g_MissionLevel					= 10000
--�������
x600038_g_MissionKind						= 50
--�Ƿ��Ǿ�Ӣ����
x600038_g_IfMissionElite				= 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600038_g_IsMissionOkFail				= 0	--0 ������ɱ��
x600038_g_MissionParam_SubId		= 1	--1 ������ű��Ŵ��λ��
x600038_g_MissionParam_Phase		= 2	--2 �׶κ� �˺��������ֵ�ǰ����UI��������Ϣ
x600038_g_MissionParam_NpcId		= 3	--3 ���� NPC �� NPCId ��
x600038_g_MissionParam_ItemId		= 4	--4 ������Ʒ�ı��
x600038_g_MissionParam_MonsterId= 5	--5 ���� Monster �� NPCId ��
x600038_g_MissionParam_IsCarrier= 6	--6 �Ƿ�����������
--ѭ�����������������������������Ļ���
x600038_g_MissionRound					= 59
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600038_g_MissionName			= "��������"
x600038_g_MissionInfo			= "������������������"								--��������
x600038_g_MissionTarget		= "%f"																--����Ŀ��
x600038_g_ContinueInfo		= "    �������û�����ô��"				--δ��������npc�Ի�
x600038_g_SubmitInfo			= "    �����չ����Σ�"							--���δ�ύʱ��npc�Ի�
x600038_g_MissionComplete	= "    �������ã������Ľ����ּӿ��ˡ�"--�������npc˵���Ļ�

x600038_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600038_g_StrForePart			= 2

--���������ַ�����ʽ��������
x600038_g_FormatList			= {
	"",
	"    ����Ի�������������������¶��%2i���ɣ�����������%1n��Ϯ�����η�����������ٴ��ֵ�����֧Ԯ���¡�",	--1 ��Ԯ����
	"    %3n������%2i����Ҫ��ȥ�������",		--2 Ѱ�ҽ�������
	"    ��%2i�����������ܹܡ�"						--3 �ͻ�
}

--ͨ�ó�������ű�
x600038_g_CityMissionScript	= 600001
x600038_g_ConstructionScript= 600035

--������

--MisDescEnd
--************************************************************************

x600038_g_ItemOffset			= 39	--����ڼ�����Ʒ�е�ƫ����
x600038_g_NPCOffset				= 48	--����ڼ��� NPC ��ƫ����
x600038_g_MonsterOffset		= 43	--����ڼ��� Monster ��ƫ����

--�׶�����
--�������10%���ʵ���������Ʒ���ڵ���ļ����У�50%����������ȡ����Ʒ����50%����"��Ԯ����"
x600038_g_PhaseKey				= {}
x600038_g_PhaseKey["mal"]	= 1		--��Ԯ���ţ��������ţ�ˢ��������������NPC��׷��������Ʒ
x600038_g_PhaseKey["fnd"]	= 2		--Ѱ�ҽ������ϣ�ֱ�ӵ���������Ʒ
x600038_g_PhaseKey["end"]	= 3		--�ͻ�

--�������
x600038_g_RandomSeed			= 100
--���伸��
x600038_g_DropOdds				= 10
--��Ԯ����
x600038_g_itmMail					= 40004287

--**********************************
--������ں���
--**********************************
function x600038_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) > 0 then
		local bDone = x600038_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600038_g_SubmitInfo
		else
			strText = x600038_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600038_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600038_g_ScriptId, x600038_g_MissionId, bDone )

	--δ�Ӵ����������������������
	elseif x600038_CheckAccept( sceneId, selfId ) > 0 then
		x600038_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--�о��¼�
--**********************************
function x600038_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) > 0 then
		AddNumText( sceneId, x600038_g_ScriptId, x600038_g_MissionName,3,-1 )
	end

end

--**********************************
--����������
--**********************************
function x600038_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600038_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--������ҵȼ��õ���ӦMissionItem_HashTable.txt�еĵ�Ԫ����
--**********************************
function x600038_GetMissionItemIndex( sceneId, selfId )

	return x600038_g_ItemOffset

end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600038_GetMissionNPCKey( sceneId, selfId )

	return x600038_g_NPCOffset

end

--**********************************
--����
--**********************************
function x600038_OnAccept( sceneId, selfId, targetId )

	--û������ſ���������
	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600038_NotifyFailTips( sceneId, selfId, "�ȼ�����" )
			return
		end

		--������������б�
		--LuaFnAddMission����˵����
		--sceneId, selfId, misId(������), scriptId, k(�Ƿ�ص�x600038_OnKillObject), e(�Ƿ�ص�OnEnterArea), i(�Ƿ�ص�OnItemChange)
		--����˵����������������misId��ŵ����񣬳ɹ�����1
		AddMission( sceneId, selfId, x600038_g_MissionId, x600038_g_ScriptId, 1, 0, 1 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) <= 0 then
			return
		end

		--�޸��������misId��ŵ�������Ӧ�¼�
		--eventId�����ýű���ţ�0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--ע�� x600038_OnLockedTarget �¼�
--	SetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		CallScriptFunction( x600038_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600038_g_ScriptId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )

		local nitemId, strItemName = GetOneMissionItem( x600038_GetMissionItemIndex( sceneId, selfId ) )
		--ѡ������NPC
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600038_GetMissionNPCKey( sceneId, selfId ) )
		--ѡ�񹥻�Monster
		local nMonsterId, strMonsterName, strMonsterSceneDesc, _, _, _, _, _, nLevel = LuaFnGetLevelMatchingMonster( x600038_g_MonsterOffset, GetLevel( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["fnd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId, nitemId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_MonsterId, nMonsterId )
		--�Ƿ�����������
		--����ǣ�����᲻�ϵ���"��Ԯ����"����ʱҪ����ұ������һ�θ�����
		if random( 2 ) <= 1 then
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 0 )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 1 )
		end

		--��ʾ���ݸ�������Ѿ�����������
		local	missionInfo	= format( "    %s�����������ã����ձ������������%s;��%sʱ�������������%s����ȥ�������������գ�����ȥȡ�أ��������󣬻������г�л��",
				GetName( sceneId, selfId ), strItemName, strMonsterSceneDesc, strMonsterName )
		BeginEvent( sceneId )
			AddText( sceneId, x600038_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    �����������" .. x600038_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

end

--**********************************
--������һ������
--**********************************
function x600038_OnLockedTarget( sceneId, selfId, objId )

	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) < 1 then
		return		--û�и�����
	end

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local nNpcId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_NpcId )
	local _, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then
		return		--�Ҵ�����
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
		x600038_NotifyFailTips( sceneId, selfId, "��������Ҫ����һ��������Ʒ�ռ�" )
		return
	end

	local itemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( itemId )

	local Phase = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase )

	--��Ԯ����
	if Phase == x600038_g_PhaseKey["mal"] then
		local pos = LuaFnTryRecieveItem( sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE )
		if pos == -1 then
			x600038_NotifyFailTips( sceneId, selfId, "�����ռ䲻��" )
			return
		end

		local missionInfo = format( "    ����%s����������ȡ�ã���ô˵�����ǰ��Ļ��ˣ�Ҳ�ã������ͽ��������ǣ��´ο�ҪС���ˡ�",
				strDemandItemName )
		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		DelItem( sceneId, selfId, x600038_g_itmMail, 1 )

		--�������
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 1 )
		x600038_NotifyFailTips( sceneId, selfId, "�������" )

	--�������
	else
		return
	end

end

--**********************************
--����
--**********************************
function x600038_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600038_g_MissionId ) <= 0 then
		return
	end

	--ɾ����Ʒ
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end
	if GetItemCount( sceneId, selfId, x600038_g_itmMail ) > 0 then
		DelItem( sceneId, selfId, x600038_g_itmMail, 1 )
	end

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600038_g_ConstructionScript, "OnAbandon", sceneId, selfId )

end

--**********************************
--����
--**********************************
function x600038_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600038_g_MissionName )
		AddText( sceneId, x600038_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600038_g_ScriptId, x600038_g_MissionId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600038_CheckSubmit( sceneId, selfId, selectRadioId )

	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600038_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--�ύ
--**********************************
function x600038_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600038_g_Name then
		return
	end

	if x600038_CheckSubmit( sceneId, selfId ) == 1 then
		--�۶���
		local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
		local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
		local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, demandItemId )

		if nItemNum > 0 then	--�ɹ��ύ
			if LuaFnDelAvailableItem( sceneId, selfId, demandItemId, 1 ) < 1 then
				return
			end
		else									--ֻ��Ϊ�ݴ������ϲ����ܷ���
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 0 )
			return
		end

		CallScriptFunction( x600038_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--ɱ����������
--**********************************
function x600038_OnKillObject( sceneId, selfId, objdataId, objId )

	--ȡ�������������ӵ�з���Ȩ������
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )
	local i, curOwner, misIndex, nNpcId, strNpcName
	local MonsterName = GetName( sceneId, objId )
	local demandItemId, demandItemCount

	for i = 0, allOwnersCount - 1 do
		--ȡ��ӵ�з���Ȩ���˵�objId
		curOwner = GetMonsterOwnerID( sceneId, objId, i )
		--��������ӵ������
		if IsHaveMission( sceneId, curOwner, x600038_g_MissionId ) > 0 and
		   GetScriptIDByMissionID( sceneId, curOwner, x600038_g_MissionId ) == x600038_g_ScriptId then
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600038_g_MissionId )
			nNpcId = GetMissionParam( sceneId, curOwner, misIndex, x600038_g_MissionParam_MonsterId )
			_, strNpcName = GetNpcInfoByNpcId(sceneId, nNpcId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600038_g_MissionParam_ItemId )

			if MonsterName == strNpcName then
				x600038_OnItemDrop( sceneId, selfId, objId, curOwner, demandItemId )
			end
		end
	end

end

--**********************************
--���������¼�
--**********************************
function x600038_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600038_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	local _, strItemName = GetItemInfoByItemId( itemdataId )
	local demandItemId = GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_ItemId )
	local _, strDemandItemName = GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId and itemdataId ~= x600038_g_itmMail then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if itemdataId == x600038_g_itmMail then
		if nItemNum > 0 then
			strText = format( "��õ�һ�����ţ��ƺ��������������ɿ�������" )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["mal"] )

			--�޸��������misId��ŵ�������Ӧ�¼�
			--eventId�����ýű���ţ�0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
			--ע�� x600038_OnLockedTarget �¼�
			SetMissionEvent( sceneId, selfId, x600038_g_MissionId, 4 )
		else
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier, 0 )
		end
	else
		if nItemNum > 0 then
			strText = format( "�õ� %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_MissionParam_Phase, x600038_g_PhaseKey["end"] )
		else
			strText = format( "ʧȥ %s", strItemName )
			SetMissionByIndex( sceneId, selfId, misIndex, x600038_g_IsMissionOkFail, 0 )
		end
	end

	if strText ~= nil then
		x600038_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--��Ʒ����
--**********************************
function x600038_OnItemDrop( sceneId, selfId, monsterId, curOwner, demandItemId )

	--һ�����ʴ������������Ʒ
	--if random( x600038_g_RandomSeed ) > x600038_g_DropOdds then
		--return
	--end

	--���������������
	local misIndex = GetMissionIndexByID( sceneId, selfId, x600038_g_MissionId )
	if GetMissionParam( sceneId, selfId, misIndex, x600038_g_MissionParam_IsCarrier ) == 1 then
		if GetItemCount( sceneId, curOwner, x600038_g_itmMail ) >= 1 then
			return	--�����Ѿ�����
		end
		AddMonsterDropItem( sceneId, monsterId, curOwner, x600038_g_itmMail )

	--ֱ�ӵ�������������Ʒ
	else
		AddMonsterDropItem( sceneId, monsterId, curOwner, demandItemId )
	end

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x600038_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
