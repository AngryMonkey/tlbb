-- ��������(������һ���Ͷ�ʹ�����LUA���޸���ע��ͨ����)

MOD_EVENT = 006672

x006668_g_duanyanqiId = 002016 --[tx43452]

x006668_g_IsMissionOkFail = 0							-- ������ɱ��
x006668_g_SongXinFlag = 1									-- ������ɱ��

-- ����˳��洢һЩ�漰���ͻ�������Ŀ����ʾ�Ķ�̬��Ϣ
-- �������κ�����£�ÿһ�ֿ���������������ֻ��һ�������
-- ��ͬʱ���ֻ��ӵ�� 1 ����� NPC�������1 �������Ʒ�� 1 ���������
-- λ�ð�������˳��洢�������������� NPC������� NPC ռ�ݵ�һ����������
-- ���������Ʒռ�ݵ�һ���������ݣ���������
-- ��ֵ��ò�Ҫ�޸ģ���ʹҪ�޸�ҲҪ�Ϳͻ��˵Ľ������֣�SetTableMissionInfo��ͬʱ�޸�
x006668_g_StrForePart = 5

--����η����б�_MissType	1.ɱ������	2.��������	3.̽������	4.Ѱ������	5.��������
x006668_g_MissionTypeList	=	{ {StartIdx = 1000000, EndIdx = 1009999, ScriptId = 006666},
															{StartIdx = 1010000, EndIdx = 1019999, ScriptId = 006668},
															{StartIdx = 1020000, EndIdx = 1029999, ScriptId = 006669},
															{StartIdx = 1030000, EndIdx = 1039999, ScriptId = 006667},
															{StartIdx = 1050000, EndIdx = 1059999, ScriptId = 006671} }

--**********************************
-- ��ȡ��̬����Ŀ�� NPC �Ĵ洢λ��
-- ����Ǿ�̬����Ŀ�� NPC���򷵻� -1
--**********************************
function x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	local _, _, isTargetDynamic = TGetTargetNpcInfo( missionIndex )

	if not isTargetDynamic or isTargetDynamic ~= 1 then					-- �� NPC �Ǿ�̬ NPC
		return -1
	end

	return x006668_g_StrForePart
end

--**********************************
-- ��ȡ��̬����Ŀ�� NPC �� NPCID
-- ����Ǿ�̬����Ŀ�� NPC���򷵻� -1
--**********************************
function x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local loc = x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	if loc == -1 then
		return -1
	end

	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	return GetMissionParam( sceneId, selfId, misIndex, loc )
end

--**********************************
-- ��ȡ��̬������Ʒ�� ItemIndex
-- ����Ǿ�̬������Ʒ���򷵻� -1
--**********************************
function x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	local ItemCount, _, _, _, _, _, _, _, _, _, _, _, _, Item, Count, bGiveFlag = TGetSongXinInfo( missionIndex )

	if not Item or Item <= 0 then
		return -1
	end

	local nOffset = 0
	if x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex ) ~= -1 then
		nOffset = nOffset + 1
	end

	return x006668_g_StrForePart + nOffset
end

--**********************************
-- ��ȡ��̬������Ʒ�� ItemIndex
-- ����Ǿ�̬������Ʒ���򷵻� -1
--**********************************
function x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
	local loc = x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if loc == -1 then
		return -1
	end

	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	return GetMissionParam( sceneId, selfId, misIndex, loc )
end

--**********************************
-- �۳�������Ʒ���ɹ����� 1��ʧ�ܷ��� 0
--**********************************
function x006668_TakeOutMissionItem( sceneId, selfId, missionIndex )
	local ItemCount = 0
	local item, count, bGiveFlag = 1, 2, 3

	-- Mission Items
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	local itemList = {}

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	if ItemCount > 0 then
		-- mi[5][1], mi[5][2], mi[5][3] �������Ʒ��
		if mi[5][item] > 0 then
			-- mi[5][item] ��ת��
			mi[5][item] = GetOneMissionItem( mi[5][item] )
			tinsert( itemList, { mi[5][item], mi[5][count] } )
			ItemCount = ItemCount - 1
		end																-- ���¶�ȡ�̶�������Ʒ

		for i = 1, ItemCount do
			tinsert( itemList, { mi[i][item], mi[i][count] } )
		end

		for i = 1, getn( itemList ) do
			if itemList[i][item] > 0 then
				if LuaFnGetAvailableItemCount( sceneId, selfId, itemList[i][item] ) < itemList[i][count] then
					return 0
				end
			end
		end

		for i = 1, getn( itemList ) do
			if itemList[i][item] > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, itemList[i][item], itemList[i][count] )
			end
		end
	end

	return 1
end

--**********************************
-- ������ں���
--**********************************
function x006668_OnDefaultEvent( sceneId, selfId, targetId, missionIndex )		-- ����������ִ�д˽ű�
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local _, missionInfo, missionContinue = TGetMissionDesc( missionIndex )
	local npcId = -1
	local itemIndex = -1

	-- ���������������Ϣ
	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		local _, targetNPCName, isTargetDynamic, targetDuologue = TGetTargetNpcInfo( missionIndex )
		local _, completeNpcName = TGetCompleteNpcInfo( missionIndex )
		local szNpcName = GetName( sceneId, targetId )
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

		-- �������Ŀ�� NPC ��������� NPC ����ͬһ����
		if targetNPCName ~= completeNpcName then
			local bAchieveMission = 0

			-- �����ǰ NPC ������Ŀ�� NPC
			if not isTargetDynamic or isTargetDynamic ~= 1 then			-- �� NPC �Ǿ�̬ NPC
				if szNpcName == targetNPCName then
					bAchieveMission = 1
				end
			else
				npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
				local _, strNpcName = GetNpcInfoByNpcId(sceneId, npcId )
				if strNpcName == szNpcName then
					bAchieveMission = 1
				end
			end

			-- ��������ɣ�����ʾ����Ŀ�� NPC �԰�
			if bAchieveMission == 1 then
				-- �����Ҫ������Ʒ�������ܹ�ɾ������ɹ�
				if x006668_TakeOutMissionItem( sceneId, selfId, missionIndex ) == 1 then
					-- ��ʾĿ�� NPC ����Ի�
					local strText = CallScriptFunction( MOD_EVENT, "GetRandomDuologue", sceneId, missionIndex, targetDuologue )
					if strText ~= "" then
						itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
						strText = CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, strText, npcId, itemIndex, "" )
						x006668_NotifyFailBox( sceneId, selfId, targetId, strText )
					end
					
					if (missionIndex >= 1010243 and missionIndex <= 1010250) or
						 (missionIndex >= 1010402 and missionIndex <= 1010409) or
						 (missionIndex >= 1018000 and missionIndex <= 1018033) or
						 (missionIndex >= 1018050 and missionIndex <= 1018084) or
						 (missionIndex >= 1018100 and missionIndex <= 1018155) or
						 (missionIndex >= 1018200 and missionIndex <= 1018235) or
						 (missionIndex >= 1018300 and missionIndex <= 1018311) or
						 (missionIndex >= 1018350 and missionIndex <= 1018352) or
						 (missionIndex >= 1018360 and missionIndex <= 1018367) or
						 (missionIndex >= 1018400 and missionIndex <= 1018455) or
						 (missionIndex >= 1018500 and missionIndex <= 1018504) or
						 (missionIndex >= 1018530 and missionIndex <= 1018541) or
						 (missionIndex >= 1018560 and missionIndex <= 1018566) then
							BeginEvent( sceneId )
								AddText( sceneId, "����Ŀ���Ѵ�ɣ�" )
							EndEvent( sceneId )
							DispatchMissionTips( sceneId, selfId )
					end
			

					SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail, 1 )
					return
				end
			end
		elseif GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail ) ~= 1 then
			-- �������Ŀ�� NPC ��������� NPC ��ͬһ���ˣ���������һﻹû���������
			if x006668_TakeOutMissionItem( sceneId, selfId, missionIndex ) == 1 then
				SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail, 1 )
			end
		end

		-- �����ǰ NPC ��������� NPC������ԭ��������ʾ����԰��Լ��ύ����
		if completeNpcName == szNpcName then
			local bHaveContinue = TIsHaveContinue( missionIndex )

			if bHaveContinue <= 0 then									-- ֱ��������ɽ���
				x006668_OnContinue( sceneId, selfId, targetId, missionIndex )
			else														-- ת��Continue����
				local bDone = x006668_CheckSubmit( sceneId, selfId, missionIndex )
				npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
				itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )

				BeginEvent( sceneId )
					AddText( sceneId, missionName )
					AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionContinue, npcId, itemIndex, "" ) )
				EndEvent( )
				DispatchMissionDemandInfo( sceneId, selfId, targetId, missionIndex, missionId, bDone )
			end
		end
	elseif CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) > 0 then
		local _, acceptNpcName = TGetAcceptNpcInfo( missionIndex )
		if acceptNpcName == "" then										-- ��������Զ���ȡ
			if x006668_OnAccept( sceneId, selfId, targetId, missionIndex ) ~= 1 then
				return
			end

			npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
			itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )
		end

		--�����������ʱ��ʾ����Ϣ
		BeginEvent( sceneId )
			AddText( sceneId, missionName )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionInfo, npcId, itemIndex, "" ) )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )
		EndEvent( )

		if acceptNpcName == "" then										-- ��������Զ���ȡ
			DispatchEventList( sceneId, selfId, targetId )
		else
			DispatchMissionInfo( sceneId, selfId, targetId, missionIndex, missionId )
		end
	end
end

--**********************************
-- �о��¼�
--**********************************
function x006668_OnEnumerate( sceneId, selfId, targetId, missionIndex )
	CallScriptFunction( MOD_EVENT, "DoEnumerate", sceneId, selfId, targetId, missionIndex )
end

--**********************************
-- ѡ��
--**********************************
function x006668_OnLockedTarget( sceneId, selfId, targetId, missionIndex )
	local targetNpcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local targetNPCName

	if targetNpcId ~= -1 then
		_, targetNPCName = GetNpcInfoByNpcId(sceneId, targetNpcId )
	else
		_, targetNPCName = TGetTargetNpcInfo( missionIndex )
	end

	local szNpcName = GetName( sceneId, targetId )
	local _, completeNpcName = TGetCompleteNpcInfo( missionIndex )
	if szNpcName == targetNPCName then
		local missionId = TGetMissionIdByIndex( missionIndex )
		local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
		if completeNpcName ~= targetNPCName and GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail ) == 1 then
			return															-- �Ѿ�����˾Ͳ��ٶԻ���
		end
		
		--if completeNpcName == targetNPCName then
			SetMissionByIndex( sceneId, selfId, misIndex, x006668_g_SongXinFlag, 1 )
		--end
	end

	if szNpcName == targetNPCName or szNpcName == completeNpcName then
		-- �Ҷ��˿�
		local missionName = TGetMissionName( missionIndex )
		-- �Ƿ�Ϊѭ������
		if TIsMissionRoundable( missionIndex ) == 1 then
			TAddNumText( sceneId, missionIndex, missionName, 4, -1 )
		else
			TAddNumText( sceneId, missionIndex, missionName, 2, -1 )
		end
		TDispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
-- ���ܣ����� 1 ��ʾ��ȡ�ɹ��������ʾʧ��
--**********************************
function x006668_OnAccept( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local ItemCount = 0

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone( sceneId, selfId, missionId ) > 0
	 and TIsMissionRoundable( missionIndex ) ~= 1 then
		return 0
	end

	if CallScriptFunction( MOD_EVENT, "CheckAccept", sceneId, selfId, missionIndex ) <= 0 then
		return 0
	end

	local strText

	-- ����Ƿ������Ѿ��ﵽ 20 ����������ˣ����ܽ�
	if GetMissionCount( sceneId, selfId ) >= 20 then
		strText = "#Y���������־�Ѿ����ˡ�"
		-- x006668_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
		return 0
	end

	local item, count, bGiveFlag = 1, 2, 3
	-- Mission Items
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	local bAddItem = 0

	if ItemCount > 0 then
		BeginAddItem( sceneId )

		-- mi[5][1], mi[5][2], mi[5][3] �������Ʒ��
		if mi[5][item] > 0 then
			-- mi[5][item] ��ת��������һ��Ҫ������Ϊ�Ժ�Ҫ�õ�
			mi[5][item] = GetOneMissionItem( mi[5][item] )

			if mi[5][bGiveFlag] > 0 then
				AddItem( sceneId, mi[5][item], mi[5][count] )
				bAddItem = 1
			end

			ItemCount = ItemCount - 1
		end																-- ���¶�ȡ�̶�������Ʒ

		for i = 1, ItemCount do
			if mi[i][bGiveFlag] > 0 then
				AddItem( sceneId, mi[i][item], mi[i][count] )
				bAddItem = 1
			end
		end

		if bAddItem > 0 then
			local ret = EndAddItem( sceneId, selfId )
			if ret <= 0 then
				strText = "#Y������񱳰��Ѿ����ˡ�"
				-- x006668_NotifyFailTips( sceneId, selfId, strText )
				Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
				return 0
			end
		end
	end

	local ret = AddMission( sceneId, selfId, missionId, missionIndex, 0, 0, 0 )	-- kill��area��item
	if ret ~= 1 then
		return 0
	end

	SetMissionEvent( sceneId, selfId, missionId, 4 )

	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )
	local targetNpcStoreLocation, itemStoreLocation
	local _, targetNPCName, isTargetDynamic = TGetTargetNpcInfo( missionIndex )

	-- �����ǰ NPC ������Ŀ�� NPC
	targetNpcStoreLocation = x006668_GetTNpcStoreLoc( sceneId, selfId, targetId, missionIndex )
	if targetNpcStoreLocation ~= -1 then					-- �� NPC �Ƕ�̬ NPC
		local nNpcId, _, _, nScene, nPosX, nPosZ = GetOneMissionNpc( tonumber(targetNPCName) )
		SetMissionByIndex( sceneId, selfId, misIndex, targetNpcStoreLocation, nNpcId )
	end

	-- �����ǰ������Ʒ�Ƕ�̬
	itemStoreLocation = x006668_GetTItemStoreLoc( sceneId, selfId, targetId, missionIndex )
	if itemStoreLocation ~= -1 then
		SetMissionByIndex( sceneId, selfId, misIndex, itemStoreLocation, mi[5][item] )
	end

	if bAddItem > 0 then
		AddItemListToHuman( sceneId, selfId )
	end

	strText = "#Y��������" .. missionName
	-- x006668_NotifyFailTips( sceneId, selfId, strText )
	Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	return 1
end

--**********************************
-- ����
--**********************************
function x006668_OnAbandon( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local ItemCount = 0
	local item, count, bGiveFlag = 1, 2, 3

	-- ɾ��������Ʒ
	local mi = { { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, { -1, 0, 0 }, }

	ItemCount, mi[1][1], mi[1][2], mi[1][3], mi[2][1], mi[2][2], mi[2][3], mi[3][1], mi[3][2], mi[3][3],
		mi[4][1], mi[4][2], mi[4][3], mi[5][1], mi[5][2], mi[5][3] = TGetSongXinInfo( missionIndex )

	if ItemCount > 0 then
		-- mi[5][1], mi[5][2], mi[5][3] �������Ʒ��
		if mi[5][item] > 0 then
			-- mi[5][item] ��ת��
			mi[5][item] = GetOneMissionItem( mi[5][item] )
			LuaFnDelAvailableItem( sceneId, selfId, mi[5][item], mi[5][count] )
			ItemCount = ItemCount - 1
		end																-- ���¶�ȡ�̶�������Ʒ

		for i = 1, ItemCount do
			if mi[i][item] > 0 then
				LuaFnDelAvailableItem( sceneId, selfId, mi[i][item], mi[i][count] )
			end
		end
	end

	-- �ͷ����۳���ϵֵ
	CallScriptFunction( MOD_EVENT, "PunishRelationShip", sceneId, selfId, missionIndex )

	-- �ͷ���һ��ʱ�䲻�ý�����
	CallScriptFunction( MOD_EVENT, "AcceptTimeLimit", sceneId, selfId, missionIndex )

	-- ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, missionId )
end

--**********************************
-- ����
--**********************************
function x006668_OnContinue( sceneId, selfId, targetId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )
	local missionTarget, _, _, missionComplete = TGetMissionDesc( missionIndex )
	local npcId = x006668_GetTargetNpcId( sceneId, selfId, targetId, missionIndex )
	local itemIndex = x006668_GetTargetItemIndex( sceneId, selfId, targetId, missionIndex )

	BeginEvent( sceneId )
		AddText( sceneId, missionName )
		--[tx43452]
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			--AddText( sceneId, "#{M_MUBIAO}#r" )
			--AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			--CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )	
		local ret = CallScriptFunction(x006668_g_duanyanqiId, "NPCTalkOnFirstSubmission", sceneId, selfId, missionIndex, 0 )
		if ret == 0 then
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionComplete, npcId, itemIndex, "" ) )
			AddText( sceneId, "#{M_MUBIAO}#r" )
			AddText( sceneId, CallScriptFunction( MOD_EVENT, "FormatDuologue", sceneId, selfId, missionTarget, npcId, itemIndex, "" ) )
			CallScriptFunction( MOD_EVENT, "DisplayBonus", sceneId, missionIndex, selfId )		
		end
		--[/tx43452]
	EndEvent( )
	DispatchMissionContinueInfo( sceneId, selfId, targetId, missionIndex, missionId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x006668_CheckSubmit( sceneId, selfId, missionIndex )
	local missionId = TGetMissionIdByIndex( missionIndex )
	local misIndex = GetMissionIndexByID( sceneId, selfId, missionId )

	local bComplete = GetMissionParam( sceneId, selfId, misIndex, x006668_g_IsMissionOkFail )
	if bComplete == 1 then
		return 1
	else
		return 0
	end
end

--**********************************
--�ύ
--**********************************
function x006668_OnSubmit( sceneId, selfId, targetId, selectRadioId, missionIndex )
	-- ����ǲ�������������������
	local missionId = TGetMissionIdByIndex( missionIndex )
	local missionName = TGetMissionName( missionIndex )

	if IsHaveMission( sceneId, selfId, missionId ) > 0 then
		if x006668_CheckSubmit( sceneId, selfId, missionIndex ) ~= 1 then
			return 0
		end

		local ItemCount, nAddItemNum = 0, 0
		local item, count = 1, 2
		local mi = { { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 }, { -1, 0 } }

		-- �������ӽ�����Ʒ
		BeginAddItem( sceneId )
		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetAwardItem( missionIndex )

		if ItemCount > 0 then											-- �̶�����
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetRadioItem( missionIndex )

		if ItemCount > 0 then											-- ѡ����
			for i = 1, ItemCount do
				if mi[i][item] > 0 and mi[i][item] == selectRadioId then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
					break
				end
			end
		end

		ItemCount, mi[1][1], mi[1][2], mi[2][1], mi[2][2], mi[3][1], mi[3][2],
			mi[4][1], mi[4][2], mi[5][1], mi[5][2] = TGetHideItem( missionIndex )

		if ItemCount > 0 then											-- ���ؽ���
			for i = 1, ItemCount do
				if mi[i][item] > 0 then
					AddItem( sceneId, mi[i][item], mi[i][count] )
					nAddItemNum = nAddItemNum + 1
				end
			end
		end
		
		if CallScriptFunction(x006668_g_duanyanqiId, "OnAddRewards", sceneId, selfId, missionIndex) == 1 then--[tx43452]
			nAddItemNum = nAddItemNum + 1			
		end--[/tx43452]
		
		local ret = EndAddItem( sceneId, selfId )
		if ret <= 0 then
			x006668_NotifyFailTips( sceneId, selfId, "��������,�޷��������" )
			return
		end

		if nAddItemNum > 0 then
			AddItemListToHuman( sceneId, selfId )
		end

		-- ���������
		local awardMoney = TGetAwardMoney( missionIndex )
		if awardMoney > 0 then
			AddMoney( sceneId, selfId, awardMoney )
		end

		local awardExp = TGetAwardExp( missionIndex )
		if awardExp > 0 then
			LuaFnAddExp( sceneId, selfId, awardExp )
		end

		-- ������ϵֵ
		CallScriptFunction( MOD_EVENT, "RewardRelationShip", sceneId, selfId, missionIndex, targetId )

		local mdLocation, _, _ = TGetRelationShipAwardInfo( missionIndex );
		if mdLocation == MD_RELATION_AZHU then
			CallScriptFunction(005001, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)
		elseif mdLocation == MD_RELATION_DUANYANQING then
			CallScriptFunction(x006668_g_duanyanqiId, "OnMissionSubmitionSuccess", sceneId, selfId, targetId, missionIndex) --[tx43452]
		elseif mdLocation == MD_RELATION_MUWANQING then --zchw
			CallScriptFunction(002010, "OnModEvent_Submit", sceneId, selfId, targetId, missionIndex)				
		end

		DelMission( sceneId, selfId, missionId )
		-- ���������Ѿ�����ɹ�
		MissionCom( sceneId, selfId, missionId )

		local strText = "#Y" .. missionName .. "��������ɡ�"
		x006668_NotifyFailTips( sceneId, selfId, strText )
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 0 )
		CallScriptFunction( SCENE_SCRIPT_ID, "PlaySoundEffect", sceneId, selfId, 66 )
		
		-- ��ú��������Index
		local NextMissIndex = GetNextMissionIndex( missionIndex )

		for i, MissType in x006668_g_MissionTypeList do
			if MissType.ScriptId ~= nil and MissType.ScriptId ~= 0 then
				if NextMissIndex ~= 0 and NextMissIndex >= MissType.StartIdx and NextMissIndex <= MissType.EndIdx then
					local missionId = TGetMissionIdByIndex( NextMissIndex )
					local szNpcName = GetName( sceneId, targetId )
					local AcceptNpcScene, AcceptNpcName = TGetAcceptNpcInfo( NextMissIndex )

					if sceneId == AcceptNpcScene and szNpcName == AcceptNpcName then
						if MissType.ScriptId == 006668 then
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								x006668_OnDefaultEvent( sceneId, selfId, targetId, NextMissIndex )
							end
						else
							if IsHaveMission( sceneId, selfId, missionId ) <= 0 then
								CallScriptFunction( MissType.ScriptId, "OnDefaultEvent", sceneId, selfId, targetId, NextMissIndex )
							end
						end
					end
					
					break;
				end
			end
		end
		
	end
end

--**********************************
--ɱ����������
--**********************************
function x006668_OnKillObject( sceneId, selfId, objdataId, objId, missionIndex )	-- ������˼�������š����objId�������λ�úš�����objId

end

--**********************************
--���߸ı�
--**********************************
function x006668_OnItemChanged( sceneId, selfId, itemdataId )

end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x006668_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x006668_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
