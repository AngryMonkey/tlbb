--��������
--�ͻ�ʧ���䷽

--************************************************************************
--MisDescBegin
--�ű���
x600042_g_ScriptId	= 600042
--�����
x600042_g_MissionId	= 1113
--Ŀ��NPC
x600042_g_Name			= "֣����"
--����ȼ�
x600042_g_MissionLevel		= 10000
--�������
x600042_g_MissionKind			= 50
--�Ƿ��Ǿ�Ӣ����
x600042_g_IfMissionElite	= 0

--********���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������******
--��ɫMission����˵��
x600042_g_IsMissionOkFail					= 0	--0 ������ɱ��
x600042_g_MissionParam_SubId			= 1	--1 ������ű��Ŵ��λ��
x600042_g_MissionParam_Phase			= 2	--2 �׶κţ��˺��������ֵ�ǰ����UI��������Ϣ
x600042_g_MissionParam_NpcId			= 3	--3 ����NPC��NPCId��
x600042_g_MissionParam_ItemId			= 4	--4 ������Ʒ�ı��
x600042_g_Param_sceneid						= 5	--5 ��ǰ��������ĳ�����
x600042_g_Param_StateId						= 6	--6 ״̬
x600042_g_Param_RandomPos					= 7	--7 ��᳡���е�������꣬ǰ��λΪX���꣬����λΪY����( XXX YYY )
--ѭ�����������������������������Ļ���
x600042_g_MissionRound						= 61
--**********************************�����Ƕ�̬****************************

--�����ı�����
x600042_g_MissionName			= "�о�����"
x600042_g_MissionInfo			= "�����������о�����"									--��������
x600042_g_MissionTarget		= "%f"																	--����Ŀ��
x600042_g_ContinueInfo		= "    �������û�����ô��"					--δ��������npc�Ի�
x600042_g_SubmitInfo			= "    �����չ����Σ�"								--���δ�ύʱ��npc�Ի�
x600042_g_MissionComplete	= "    �������ã��о������ּӿ��˲��١�"--�������npc˵���Ļ�

x600042_g_Parameter_Item_IDRandom = { { id = 4, num = 1 } }

x600042_g_StrForePart			= 2

--���������ַ�����ʽ��������
x600042_g_FormatList			= {
	"",
	"    ���������ҳ��ڹ�ȡ��%2i���ͽ���%1n��",			--1 �����д���䷽
	"    ��ȡ����%2i���ͽ���%1n��",										--2 �ҵ�NPC
	"    ������ɣ����Ե������ܹ��Ƕ���ȡ�����ˡ�"	--3 �ͻ�
}

--ͨ�ó�������ű�
x600042_g_CityMissionScript	= 600001
x600042_g_ConstructionScript= 600040
x600042_g_TransScript				= 400900

--������

--MisDescEnd
--************************************************************************

x600042_g_NPCOffset				= 44	--����ڼ��� NPC ��ƫ����
x600042_g_NPCOffsetEx			= 261	--����ڼ��� NPC ��ƫ���� modi:lby20071126

--�׶�����
x600042_g_PhaseKey				= {}
x600042_g_PhaseKey["cpd"]	= 1		--�����д���䷽
x600042_g_PhaseKey["npc"]	= 2		--�ҵ�NPC
x600042_g_PhaseKey["end"]	= 3		--�ͻ�

--�����䷽
x600042_g_itmNeed					= { 40004291 }
--ʧ������
x600042_g_itmDirect				= 40004290

--************************************************************************
--�������
x600042_g_CopySceneName	= "�м�"				--��������
x600042_g_CopySceneType	= FUBEN_SHIJI1	--�������ͣ�������ScriptGlobal.lua����
x600042_g_CopySceneMap	= "shiji_1.nav"
x600042_g_Exit					= "shiji_1_area.ini"
x600042_g_TickTime			= 5					--�ص��ű���ʱ��ʱ�䣨��λ����/�Σ�
x600042_g_LimitTotalHoldTime	= 360	--�������Դ���ʱ�䣨��λ��������,�����ʱ�䵽�ˣ������񽫻�ʧ��
x600042_g_LimitTimeSuccess		= 500	--����ʱ�����ƣ���λ���������������ʱ�䵽�ˣ��������
x600042_g_CloseTick			= 6					--�����ر�ǰ����ʱ����λ��������
x600042_g_NoUserTime		= 300				--������û���˺���Լ��������ʱ�䣨��λ���룩
x600042_g_DeadTrans			= 0					--����ת��ģʽ��0�������󻹿��Լ����ڸ�����1��������ǿ���Ƴ�����
x600042_g_MonsterCount	= 10				--��С��������
x600042_g_Fuben_X				= 43				--���븱����λ��X
x600042_g_Fuben_Z				= 45				--���븱����λ��Z
x600042_g_MonsterGroupId= 0					--С��
x600042_g_BossGroupId		= 1					--Boss

--��������������
x600042_g_keyParam			=
{
	["typ"]	= 0,	--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	["sid"]	= 1,	--��1����������Ϊ���������¼��ű���
	["tim"]	= 2,	--���ö�ʱ�����ô���
	["ent"]	= 3,	--���ø�����ڳ�����, ��ʼ��
	["cls"]	= 4,	--���ø����رձ�־, 0���ţ�1�ر�
	["dwn"]	= 5,	--�����뿪����ʱ����
	["tem"]	= 6,	--���������
	["px"]	= 7,	--��ҳ���ʱ��X����
	["pz"]	= 8,	--��ҳ���ʱ��Z����
}

--�������
x600042_g_lstBossName		=
{
	["fst"]	=
	{
		"���", "˾��", "ŷ��", "����", "�ʸ�",
		"˾ͽ", "ξ��", "����", "����", "����",
		"����", "½��",	"�Ϲ�"
	},
	["mid"]	=
	{	
		"��", "��", "ƽ", "��", "��",
		"��", "��", "��", "��", "��",
		"��", "��", "��"
	},
	["lst"]	=
	{
		"��", "��", "��", "��", "��",
		"»", "��", "��", "ҹ", "��",
		"��", "��", "��"
	}
}

--��᳡���е��������
x600042_g_posRandom			=
{
	{ 50, 51 }, { 54, 92 }, { 85, 99 }, {110, 100}, {152, 84 },
	{140, 54 }, { 99, 50 }, { 84, 43 }, { 66, 56 }, { 99, 83 },
	{ 39, 129}, { 60, 130}, { 60, 150}, { 80, 150}, {100, 150},
	{ 80, 130}, {120, 130}, {120, 150}, {140, 130}, {140, 150},
	{155, 140}, { 45, 64 }
}

--**********************************
--������ں���
--**********************************
function x600042_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

	--����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) > 0 then
		local bDone = x600042_CheckSubmit( sceneId, selfId )
		local strText

		if bDone == 1 then
			strText = x600042_g_SubmitInfo
		else
			strText = x600042_g_ContinueInfo
		end

		BeginEvent( sceneId )
			AddText( sceneId, x600042_g_MissionName )
			AddText( sceneId, strText )
		EndEvent( )
		DispatchMissionDemandInfo( sceneId, selfId, targetId, x600042_g_ScriptId, x600042_g_MissionId, bDone )

	--δ�Ӵ����������������������
	elseif x600042_CheckAccept( sceneId, selfId ) > 0 then
		x600042_OnAccept( sceneId, selfId, targetId )
	end

end

--**********************************
--�о��¼�
--**********************************
function x600042_OnEnumerate( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

   --����ѽӴ�����
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) > 0 then
		AddNumText( sceneId, x600042_g_ScriptId, x600042_g_MissionName,3,-1 )
	end

end

--**********************************
--����������
--**********************************
function x600042_CheckAccept( sceneId, selfId )

	local	ret	= CallScriptFunction( x600042_g_ConstructionScript, "CheckAccept", sceneId, selfId )
	return ret

end

--**********************************
--������ҵȼ��õ���ӦMissionNPC_HashTable.txt�е�ѡ����Ϣ
--**********************************
function x600042_GetMissionNPCKey( sceneId, selfId )

	local nPlayerLevel = GetLevel( sceneId, selfId )
	local nPos
	if nPlayerLevel < 30 then				-- 10 ~ 29 Level
		nPos = 0
	elseif nPlayerLevel < 50 then		-- 30 ~ 49 Level
		nPos = 1
	elseif nPlayerLevel < 70 then		-- 50 ~ 69 Level
		nPos = 2
	--else														-- 70 ~ 100 Level
	--	nPos = 3
	--end
	--return nPos + x600042_g_NPCOffset
	elseif	nPlayerLevel < 100 then		-- 70 ~ 100 Level
		nPos = 3
	elseif nPlayerLevel < 120 then		-- 100 ~ 120 Level	modi:lby20071126
		nPos = 0
	else 															-- >=120 Level
		nPos = 1
		
	end
	
	if nPlayerLevel < 100 then
		return nPos + x600042_g_NPCOffset
	else
		return nPos + x600042_g_NPCOffsetEx
	end

end

--**********************************
--����
--**********************************
function x600042_OnAccept( sceneId, selfId, targetId )

	--û������ſ���������
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) == 0 then
		if GetLevel( sceneId, selfId ) < 10 then
			x600042_NotifyFailTips( sceneId, selfId, "�ȼ�����" )
			return
		end
		
		if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 then
			x600042_NotifyFailTips( sceneId, selfId, "��������Ҫ����һ��������Ʒ�ռ�" )
			return
		end

		--������������б�
		--LuaFnAddMission����˵����
		--sceneId, selfId, misId(������), scriptId, k(�Ƿ�ص�x600042_OnKillObject), e(�Ƿ�ص�OnEnterArea), i(�Ƿ�ص�OnItemChange)
		--����˵����������������misId��ŵ����񣬳ɹ�����1
		AddMission( sceneId, selfId, x600042_g_MissionId, x600042_g_ScriptId, 1, 0, 1 )	-- kill��area��item
		if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
			return
		end

		--�޸��������misId��ŵ�������Ӧ�¼�
		--eventId�����ýű���ţ�0 KillObj, 1 EnterArea, 2 ItemChanged, 3 PetChanged, 4 LockedTarget
		--ע�� x600042_OnLockedTarget �¼�
		SetMissionEvent( sceneId, selfId, x600042_g_MissionId, 4 )
		CallScriptFunction( x600042_g_ConstructionScript, "OnAccept", sceneId, selfId, targetId, x600042_g_ScriptId )
		local misIndex	= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )

		--�������һ�����õ���Ʒ
		local	nItemId					= x600042_g_itmNeed[ random( getn(x600042_g_itmNeed) ) ]
		local _, strItemName	= GetItemInfoByItemId( nItemId )

		--ѡ������NPC
		local nNpcId, strNpcName, strNpcSceneDesc, _, nPosX, nPosZ, _, nGender = GetOneMissionNpc( x600042_GetMissionNPCKey( sceneId, selfId ) )

		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["cpd"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId, nNpcId )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId, nItemId )

		--��ʾ���ݸ�������Ѿ�����������
		local	sex
		if nGender == 0 then
			sex	= "��"
		else
			sex	= "��"
		end
		local	missionInfo	= format( "    %s���������񽻸����ˣ�����Ϊ%s��%s��%d��%d���о�����%s����׼���ͽ���%sʱʧ�ԣ����������ŵ��Ʋ⣬Ӧ�����ڹ���Ϊ��������������ҳ��ڹ�ȡ��%s����Լ�ͽ������ǵĿͻ�����ȥ�ٻء�",
				GetName( sceneId, selfId), strNpcSceneDesc, strNpcName, nPosX, nPosZ, strItemName, sex, strItemName )
		BeginEvent( sceneId )
			AddText( sceneId, x600042_g_MissionName )
			AddText( sceneId, missionInfo )
			AddText( sceneId, "#r    �����������" .. x600042_g_MissionName )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

		--�ṩ������Ʒ��ʧ������
		if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) <= 0 then
			local pos = LuaFnTryRecieveItem( sceneId, selfId, x600042_g_itmDirect, QUALITY_MUST_BE_CHANGE)
			if pos == -1 then
				x600042_NotifyFailTips( sceneId, selfId, "�����ռ䲻��" )
				return
			end
		end
		
		--���ý��븱�����������
		local	pos		= x600042_g_posRandom[ random( getn(x600042_g_posRandom) ) ]
		local	tmp		= pos[1] * 1000 + pos[2]
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_Param_RandomPos, tmp )

	end

end

--**********************************
--������һ������
--**********************************
function x600042_OnLockedTarget( sceneId, selfId, objId )

	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) < 1 then
		return		--û�и�����
	end

	local misIndex			= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local nNpcId				= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId )
	local _, strNpcName	= GetNpcInfoByNpcId(sceneId, nNpcId )
	if GetName( sceneId, objId ) ~= strNpcName then
		return		--�Ҵ�����
	end

	local itemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	local _, strDemandItemName	= GetItemInfoByItemId( itemId )

	local Phase		= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase )
	if Phase == x600042_g_PhaseKey["npc"] then
		if GetItemCount( sceneId, selfId, itemId ) < 1 then
			return
		end

		local	missionInfo	= format( "    ̫���ˣ���л�������������ѣ��ڴ��´κ�����" )
		TAddText( sceneId, missionInfo )

		ResetMissionEvent( sceneId, selfId, x600042_g_MissionId, 4 )
		DelItem( sceneId, selfId, itemId, 1 )

		--�������
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["end"] )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_IsMissionOkFail, 1 )
		x600042_NotifyFailTips( sceneId, selfId, "�������" )

	-- �������
	else
		return
	end

end

--**********************************
--����
--**********************************
function x600042_OnAbandon( sceneId, selfId )

	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
		return
	end

	--ɾ����Ʒ
	local misIndex		= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local demandItemId= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	if GetItemCount( sceneId, selfId, demandItemId ) > 0 then
		DelItem( sceneId, selfId, demandItemId, 1 )
	end
	if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) > 0 then
		DelItem( sceneId, selfId, x600042_g_itmDirect, 1 )
	end

	--ɾ����������б��ж�Ӧ������
	CallScriptFunction( x600042_g_ConstructionScript, "OnAbandon", sceneId, selfId )

	--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
	if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
		x600042_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ�" )
		x600042_BackToCity( sceneId, selfId )
	end

end

--**********************************
--����
--**********************************
function x600042_OnContinue( sceneId, selfId, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, x600042_g_MissionName )
		AddText( sceneId, x600042_g_MissionComplete )
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, x600042_g_ScriptId, x600042_g_MissionId )

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x600042_CheckSubmit( sceneId, selfId, selectRadioId )

	--�ж������Ƿ��Ѿ����
	local ret = CallScriptFunction( x600042_g_ConstructionScript, "CheckSubmit", sceneId, selfId )
	return ret

end

--**********************************
--�ύ
--**********************************
function x600042_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if GetName( sceneId, targetId ) ~= x600042_g_Name then
		return
	end

	if x600042_CheckSubmit( sceneId, selfId ) == 1 then
		CallScriptFunction( x600042_g_ConstructionScript, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
	end

end

--**********************************
--ɱ����������
--**********************************
function x600042_OnKillObject( sceneId, selfId, objdataId, objId )

	--�Ƿ�������Ҫ�ĸ���
	local	fubentype = LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"] )
	if fubentype ~= x600042_g_CopySceneType then
		return
	end

	--ֻ����Boss
	if GetMonsterGroupID( sceneId, objId ) ~= x600042_g_BossGroupId then
		return
	end
	
	--ȡ�������������ӵ�з���Ȩ������
	local allOwnersCount = GetMonsterOwnerCount( sceneId, objId )
	local curOwner
	local misIndex, demandItemId

	--ֻ����ӳ�
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( sceneId )
	for i = 0, allOwnersCount - 1 do
		--ȡ��ӵ�з���Ȩ���˵�objId
		curOwner = GetMonsterOwnerID( sceneId, objId, i )
		--��������ӵ������
		if IsHaveMission( sceneId, curOwner, x600042_g_MissionId ) > 0 and leaderguid == LuaFnGetGUID( sceneId, curOwner ) then
			misIndex = GetMissionIndexByID( sceneId, curOwner, x600042_g_MissionId )
			demandItemId = GetMissionParam( sceneId, curOwner, misIndex, x600042_g_MissionParam_ItemId )

			AddMonsterDropItem( sceneId, objId, curOwner, demandItemId )
		end
	end

end

--**********************************
--���������¼�
--**********************************
function x600042_OnEnterZone( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x600042_OnItemChanged( sceneId, selfId, itemdataId )

	local misIndex			= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )
	local _, strItemName= GetItemInfoByItemId( itemdataId )
	local demandItemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )
	local _, strDemandItemName	= GetItemInfoByItemId( demandItemId )

	if itemdataId ~= demandItemId then
		return
	end

	local nItemNum	= GetItemCount( sceneId, selfId, itemdataId )
	local strText		= nil
	if nItemNum > 0 then
		strText = format( "�õ� %s", strItemName )
		
		--ɾ������
		if GetItemCount( sceneId, selfId, x600042_g_itmDirect ) > 0 then
			DelItem( sceneId, selfId, x600042_g_itmDirect, 1 )
		end
		
		--����ڸ�����ɾ��������ֱ�Ӵ��ͻ�
		if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
			x600042_OnFinished( sceneId )
		end
	else
--	strText = format( "ʧȥ %s", strItemName )
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_IsMissionOkFail, 0 )
	end
	
	if strText ~= nil then
		x600042_NotifyFailTips( sceneId, selfId, strText )
	end

end

--**********************************
--ʹ��ʧ������
--���븱����Ѱ�������䷽
--**********************************
function x600042_OnItemUse( sceneId, selfId )

	--������ſ���������
	if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) <= 0 then
		return
	end
	
	local	misIndex	= GetMissionIndexByID( sceneId, selfId, x600042_g_MissionId )

	--����ڸ����������½���
	if sceneId == GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid ) then
		return
	end
	
	--�����رձ�־
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	--��������Ѿ����óɹر�״̬����ɱ����Ч
	if leaveFlag == 1 then
		x600042_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ���������½�ȡ" )
		return
	end

	--��᳡���е��������
	local	idCity= CityGetSelfCityID( sceneId, selfId )
	local	tmp		= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_RandomPos )
	local	ranX	= floor( tmp / 1000 )
	local	ranZ	= floor( tmp ) - floor( tmp / 1000 ) * 1000
	local	curX	= GetHumanWorldX( sceneId, selfId )
	local	curZ	= GetHumanWorldZ( sceneId, selfId )
	local	str		= format( "���ģ�%d��%d�������ƺ�������������ʲô", ranX, ranZ )
	if idCity ~= sceneId or curX < (ranX-5) or curX > (ranX+5) or curZ < (ranZ-5) or curZ > (ranZ+5) then
		x600042_NotifyFailTips( sceneId, selfId, str )
		return
	end

	local	copysceneid	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_sceneid )

	--��������
	if copysceneid > 0 then
		--���Լ����͵���������
		if IsCanEnterCopyScene( copysceneid, GetHumanGUID( sceneId, selfId ) ) == 1 then
			NewWorld( sceneId, selfId, copysceneid, x600042_g_Fuben_X, x600042_g_Fuben_Z )
		-- ֻҪ������û����ɣ�����ʧ�ܣ���Ҫ����
		else
			x600042_NotifyFailTips( sceneId, selfId, "����ʧ�ܣ���������½�ȡ" )
		end
		return
	end

	--������������б�
	local	nNpcId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_NpcId )
	local	nItemId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_MissionParam_ItemId )

	local	StateId	= GetMissionParam( sceneId, selfId, misIndex, x600042_g_Param_StateId )
	if StateId == 1 then
		x600042_NotifyFailTips( sceneId, selfId, "���������У�" )
	else
		SetMissionByIndex( sceneId, selfId, misIndex, x600042_g_Param_StateId, 1 )
		x600042_MakeCopyScene( sceneId, selfId )
	end

end

--**********************************
--��������
--**********************************
function x600042_MakeCopyScene( sceneId, selfId )

	--ȡ������ߵȼ�
	local	mylevel	= GetLevel( sceneId, selfId )
	local	iniLevel= 0
	if mylevel < 10 then
		iniLevel	= 10
	elseif mylevel < 100 then
		iniLevel	= floor( mylevel/10 ) * 10
	else
		iniLevel	= 100
	end

	local	leaderguid	= LuaFnObjId2Guid( sceneId, selfId )
	LuaFnSetSceneLoad_Map( sceneId, x600042_g_CopySceneMap )							--��ͼ�Ǳ���ѡȡ�ģ����ұ�����Config/SceneInfo.ini�����ú�
	LuaFnSetCopySceneData_TeamLeader( sceneId, leaderguid )
	LuaFnSetCopySceneData_NoUserCloseTime( sceneId, x600042_g_NoUserTime * 1000 )
	LuaFnSetCopySceneData_Timer( sceneId, x600042_g_TickTime * 1000 )
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"], x600042_g_CopySceneType )			--���ø������ݣ����ｫ0����������������Ϊ999�����ڱ�ʾ������999(�����Զ���)
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["sid"], x600042_g_ScriptId )						--��1����������Ϊ���������¼��ű���
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"], 0 )	--���ö�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"], -1 )	--���ø�����ڳ�����, ��ʼ��
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 0 )	--���ø����رձ�־, 0���ţ�1�ر�
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"], 0 )	--�����뿪����ʱ����
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tem"], GetTeamId( sceneId, selfId ) )	--��������

	local	x, z				= LuaFnGetWorldPos( sceneId, selfId )
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["px"], x )		--��ҳ���ʱ���λ��
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"], z )		--��ҳ���ʱ���λ��

	LuaFnSetSceneLoad_Area( sceneId, x600042_g_Exit )
	LuaFnSetSceneLoad_Monster( sceneId, "shiji_1_monster_" .. iniLevel .. ".ini" )
	--����CopyScene_LevelGap �� scene.lua �и�ֵ
	LuaFnSetCopySceneData_Param( sceneId, CopyScene_LevelGap, mylevel - iniLevel - 10 )

	--��ʼ����ɺ���ô�����������
	local bRetSceneID = LuaFnCreateCopyScene( sceneId )
	if bRetSceneID > 0 then
		x600042_NotifyFailTips( sceneId, selfId, "���������ɹ���" )
	else
		x600042_NotifyFailTips( sceneId, selfId, "���������Ѵ����ޣ����Ժ����ԣ�" )
	end

end

--**********************************
--�����¼�
--**********************************
function x600042_OnCopySceneReady( sceneId, destsceneId )

	--���ø�����ڳ�����
	LuaFnSetCopySceneData_Param( destsceneId, x600042_g_keyParam["ent"], sceneId )
	local leaderguid	= LuaFnGetCopySceneData_TeamLeader( destsceneId )
	local leaderObjId	= LuaFnGuid2ObjId( sceneId, leaderguid )

	if leaderObjId == -1 then
		return
	end

	--�����޷�ִ���߼���״̬
	if LuaFnIsCanDoScriptLogic( sceneId, leaderObjId ) ~= 1 then
		return
	end

	local	misIndex	= GetMissionIndexByID( sceneId, leaderObjId, x600042_g_MissionId )
	--���ø����ĳ�����
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x600042_g_Param_sceneid, destsceneId )
	SetMissionByIndex( sceneId, leaderObjId, misIndex, x600042_g_Param_StateId, 0 )

	NewWorld( sceneId, leaderObjId, destsceneId, x600042_g_Fuben_X, x600042_g_Fuben_Z )

end

--**********************************
--����ҽ��븱���¼�
--**********************************
function x600042_OnPlayerEnter( sceneId, selfId )

	--������븱��ǰɾ��������ֱ�Ӵ��ͻ�
--if IsHaveMission( sceneId, selfId, x600042_g_MissionId ) == 0 then
--	x600042_NotifyFailTips( sceneId, selfId, "�㵱ǰδ�Ӵ�����" )
--	x600042_BackToCity( sceneId, selfId )
--	return
--end

	--���������󸴻��λ��
	SetPlayerDefaultReliveInfo( sceneId, selfId, "%10", -1, "0", 77, 20, 38 )

end

--**********************************
--������ڸ����������¼�
--**********************************
function x600042_OnHumanDie( sceneId, selfId, killerId )
end

--**********************************
--�سǣ�ֻ�г������񸱱����Ե��ô˽ӿ�
--**********************************
function x600042_BackToCity( sceneId, selfId )

	--ȡ�ø�����ڳ�����
	local oldsceneId	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"] )
	local x	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["px"] )
	local z	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"] )
	CallScriptFunction( x600042_g_TransScript, "TransferFunc", sceneId, selfId, oldsceneId, x, z )

end

--**********************************
--����������ʱ���¼�
--**********************************
function x600042_OnCopySceneTimer( sceneId, nowTime )

	--����ʱ�Ӷ�ȡ������
	--ȡ���Ѿ�ִ�еĶ�ʱ����
	local	TickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"] )
	TickCount				= TickCount + 1
	--�����µĶ�ʱ�����ô���
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["tim"], TickCount )

	--Boss����
	local	namFst		= x600042_g_lstBossName[ "fst" ]
	local	namMid		= x600042_g_lstBossName[ "mid" ]
	local	namLst		= x600042_g_lstBossName[ "lst" ]
	if TickCount == 1 then
		local	BossName= format( "%s%s%s",
			namFst[ random( getn(namFst) ) ], namMid[ random( getn(namMid) ) ], namLst[ random( getn(namLst) ) ] )
		local monstercount = GetMonsterCount( sceneId )
		local monsterId
		for i = 0, monstercount - 1 do
			--�ҵ�Boss
			monsterId		= GetMonsterObjID( sceneId, i )
			if GetMonsterGroupID( sceneId, monsterId ) == x600042_g_BossGroupId then
				SetCharacterName( sceneId, monsterId, BossName )
			end
		end
		
		--ˢ�¹���ȼ�
--	x600042_RefreshMonster( sceneId )
	end

	local membercount	= LuaFnGetCopyScene_HumanCount( sceneId )
	local	leaderguid	= LuaFnGetCopySceneData_TeamLeader( sceneId )
	local mems	= {}
	for i = 0, membercount - 1 do
		mems[i]		= LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	--�����رձ�־
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	local	Back_X		= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["px"] )	--��ҳ���ʱ���λ��
	local	Back_Z		= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["pz"] )	--��ҳ���ʱ���λ��
	local	leaveTickCount
	local	oldsceneId= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["ent"] )
	local	strText

	--û���˵�ʱ��رո���
	--��Ҫ�뿪
	if leaveFlag == 1 then

		--�뿪����ʱ��Ķ�ȡ������
		leaveTickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"] )
		leaveTickCount	= leaveTickCount + 1
		LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"], leaveTickCount )

		--����ʱ�䵽����Ҷ���ȥ��
		if leaveTickCount >= x600042_g_CloseTick then
			--����ǰ����������������˴��ͻ�ԭ������ʱ��ĳ���
			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					NewWorld( sceneId, mems[i], oldsceneId, Back_X, Back_Z )
				end
			end
		else
			--֪ͨ��ǰ����������������ˣ������رյ���ʱ��
			strText	= format( "�㽫�� %d ����뿪����", ( x600042_g_CloseTick - leaveTickCount ) * x600042_g_TickTime )

			for i = 0, membercount - 1 do
				if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
					x600042_NotifyFailTips( sceneId, mems[i], strText )
				end
			end
		end

	--������ʱ�����Ƶ���
	elseif TickCount >= x600042_g_LimitTotalHoldTime then

		--�˴����ø���������ʱ�����Ƶ��������ʱ�䵽����...
		leaveTickCount	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["dwn"] )
		strText	= format( "�㽫�� %d ����뿪����", ( x600042_g_CloseTick - leaveTickCount ) * x600042_g_TickTime )

		for i = 0, membercount - 1 do
			if LuaFnIsObjValid( sceneId, mems[i] ) == 1 then
				if leaderguid == LuaFnGetGUID( sceneId, mems[i] ) then
					x600042_NotifyFailTips( sceneId, mems[i], "ʱ���ѵ�������ʧ��" )
				end

				x600042_NotifyFailTips( sceneId, mems[i], strText )
			end
		end
		--���ø����رձ�־
		LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )

	else
		--û�˾͹ر�
		if membercount < 1 and TickCount > x600042_g_NoUserTime then
			LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )
			return
		end

	end

end

--**********************************
--ˢ�¹���ȼ�
--**********************************
function x600042_RefreshMonster( sceneId )

	--------------------------------------------------------------
	--��������е���ߵȼ�
	local	maxLev		= 0
	--�ҵ��ӳ�
	local	GuidLeader= LuaFnGetCopySceneData_TeamLeader( sceneId )
	local	idLeader	= LuaFnGuid2ObjId( sceneId, GuidLeader )
	--�ӳ��ڳ�����
	if idLeader ~= -1 then
		maxLev			= GetLevel( sceneId, idLeader )
	else
		return
	end
	--------------------------------------------------------------

	--ȡ�ô˳����еĹ�������
	local	numMon= GetMonsterCount( sceneId )
	--�����ObjId
	local idMon, idGrp
	for i=0, numMon-1 do
		idMon	= GetMonsterObjID( sceneId, i )
		idGrp	= GetMonsterGroupID( sceneId, idMon )
		if idGrp == x600042_g_BossGroupId or idGrp == x600042_g_MonsterGroupId then
			--���ù���ȼ�Ϊ�������������ȼ�+1
			SetLevel( sceneId, idMon, maxLev+1 )
		end
	end

end

--**********************************
--�����������
--**********************************
function x600042_OnFinished( sceneId )

	--�Ƿ�������Ҫ�ĸ���
	local	fubentype	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["typ"] )
	if fubentype ~= x600042_g_CopySceneType then
		return
	end

	--�����رձ�־
	local	leaveFlag	= LuaFnGetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"] )
	--��������Ѿ����óɹر�״̬����ɱ����Ч
	if leaveFlag == 1 then
		return
	end

	local memCount= LuaFnGetCopyScene_HumanCount( sceneId )
	local mems		= {}
	for i = 0, memCount - 1 do
		mems[i]			= LuaFnGetCopyScene_HumanObjId( sceneId, i )
	end

	local	leaderguid= LuaFnGetCopySceneData_TeamLeader( sceneId )
	--���ж�Ա��Ҫ��ȥ
	for i = 0, memCount - 1 do
		x600042_NotifyFailTips( sceneId, mems[i], "�׶�������ɣ����ذ��" )

		if leaderguid == LuaFnGetGUID( sceneId, mems[i] ) then
			local	misIndex	= GetMissionIndexByID( sceneId, mems[i], x600042_g_MissionId )
			--������һ�׶�����
			SetMissionByIndex( sceneId, mems[i], misIndex, x600042_g_MissionParam_Phase, x600042_g_PhaseKey["npc"] )
		end
	end

	--���ø����رձ�־
	LuaFnSetCopySceneData_Param( sceneId, x600042_g_keyParam["cls"], 1 )
	local	strText		= format( "%d ��󽫴��͵����λ��", x600042_g_CloseTick * x600042_g_TickTime )
	for i = 0, memCount - 1 do
		x600042_NotifyFailTips( sceneId, mems[i], strText )
	end

end

--**********************************
--��Ŀ��ʾ
--**********************************
function x600042_NotifyFailTips( sceneId, selfId, Tip )

	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
