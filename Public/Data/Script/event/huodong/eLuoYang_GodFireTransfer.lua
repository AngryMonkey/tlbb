--������[ QUFEI 2008-03-05 10:27 UPDATE BugID 32710 ]
--�����������������¼��ű�
--���ÿ�쿪������,ÿ�����ÿ��ֻ�ܲμ�һ��

--MisDescBegin
--�ű���
x808080_g_ScriptId	= 808080

--��������NPC����
x808080_g_Position_X=228.3477
x808080_g_Position_Z=175.7796
x808080_g_SceneID=0
x808080_g_AccomplishNPC_Name="������"

--�����
x808080_g_MissionId			= 1000
--��һ�������ID
x808080_g_MissionIdNext	= 1000
--����Ŀ��npc
x808080_g_Name 					= "������"
--�������
x808080_g_MissionKind			= 13
--����ȼ�
x808080_g_MissionLevel		= 20
--�Ƿ��Ǿ�Ӣ����
x808080_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x808080_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x808080_g_MissionName			= "������������"
--��������
x808080_g_MissionInfo			= "#{GodFire_Info_001}"
--����Ŀ��
x808080_g_MissionTarget		= "#{GodFire_Info_004}"
--δ��������npc�Ի�
x808080_g_ContinueInfo		= "#{GodFire_Info_007}"
--�������npc˵�Ļ�
x808080_g_MissionComplete	= "#{GodFire_Info_008}"
--ÿ�ι������ܻ��Ҫ�򿨵ĳ�������
x808080_g_MaxRound	= 3
--���ƽű�
x808080_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,�ֱ�ռ����������ĵ�1,2,3,4λ
x808080_g_Custom	= { {id="���������������϶Ի�",num=1}, {id="�������ݵ�½ʿԻ�",num=1}, {id="��������������Ի�",num=1}, {id="�ѵ�ȼȫ��������",num=24} }
--MisDescEnd

--�����Ƿ����
x808080_g_Mission_IsComplete = 0		--��������ĵ�0λ
--��������򿨱��
x808080_g_RecordIdx 				 = 1		--��������ĵ�1λ 1.���� 2.���� 3.����
--����������������
x808080_g_KongMing_Lighten	 = 4		--��������ĵ�4λ
--����ű��ż�¼
x808080_g_MissScriptID_Idx	 = 5		--��������ĵ�5λ
--���񷢲�NPC���
x808080_g_AcceptNPC_Idx			 = 6		--��������ĵ�6λ 1.����NPC 2.����NPC 3.����NPC
--������������ÿ���������
x808080_g_RoundIndex 				 = 7		--��������ĵ�7λ


x808080_g_AcceptMission_IDX		= 520	--�������ܽ�����������
x808080_g_CompleteMission_IDX	= 521	--����ύ��������
x808080_g_MissionInfo_IDX			= 522	--����˵������

x808080_g_Jion_Count = 0						--�����������
x808080_g_Join_CountMax = 50				--������������

x808080_g_KongMingLighten_MaxCnt	=	24	-- �������ܻ��Ҫ��ȼ�Ŀ���������

--��ӵ�е��¼�ID�б�
x808080_g_EventList	= {}

x808080_g_Impact_Accept_Mission 	= 47	-- ��������ʱ����ЧID
x808080_g_Impact_Light_Complete 	= 38	-- ����������ʱ����Ч
x808080_g_Impact_Transport_Mission = 113 -- ����״̬��Ч
x808080_g_Impact_GodOfFire_Mission = 5929 -- ��������״̬��Ч
x808080_g_PlayerSlow_LVL					= 20	-- �����������͵ȼ�

-- ��������ʱ��(����)
x808080_g_Along_Time							= 5
-- ÿ��������ܻ����ʱ��
x808080_g_ActivityTime						= { {tstart=1230, tend=1330},
																		  {tstart=1930, tend=2030},
																		  {tstart=2130, tend=2230} }

x808080_g_ItemId = { id=40004444,num=1 }				-- ������Ʒ

-- ����
x808080_g_GodFireMis_PaiMing = 0
-- �ϴ���������Ļ���
x808080_g_ClearPaiMing_Round = 0


-- �����ĳƺ� ��Ʒ��ë��
x808080_g_GodFire_Title = 241
-- �ƺ���Ч��(��)
x808080_GodFireTitle_AlongTime = 7


-- ������������ֵ(�������й�)
x808080_g_BonusEXP_ListEX = { 3.0000,2.9592,2.9184,2.8776,2.8367,2.7959,2.7551,2.7143,2.6735,2.6327,
															2.5918,2.5510,2.5102,2.4694,2.4286,2.3878,2.3469,2.3061,2.2653,2.2245,
															2.1837,2.1429,2.1020,2.0612,2.0204,1.9796,1.9388,1.8980,1.8571,1.8163,
															1.7755,1.7347,1.6939,1.6531,1.6122,1.5714,1.5306,1.4898,1.4490,1.4082,
															1.3673,1.3265,1.2857,1.2449,1.2041,1.1633,1.1224,1.0816,1.0408,1.0000 }
											  	
x808080_g_BonusEXP_List = { 0,0,0,0,0,0,0,0,0,0,
														0,0,0,0,0,0,0,0,0,19008,
														19872,20628,21384,22212,22968,23832,24588,25344,26208,30852,
														31788,32652,33588,34416,35388,36324,37188,38124,38988,44928,
														45972,46944,47952,48996,50040,51084,52020,53064,54108,61308,
														62460,63576,64728,65844,66996,68112,69264,70416,71532,79848,
														81180,82404,83664,84888,86112,87444,88668,89892,91116,100764,
														102204,103536,104868,106272,107604,109008,110340,111672,113076,123984,
														125496,126900,128412,129852,131364,132876,134280,135792,137232,141948,
														143460,144972,146484,147996,149508,151020,152460,153972,155484,159372,
														160992,162504,164016,165528,167040,168624,170172,171684,173196,176040,
														177552,179064,180648,182268,183780,185292,186804,188316,189936,191448,
														193068,194580,196092,197712,199224,200736,202248,203760,205380,206964,
														208476,209988,211500,213120,214632,216144,217656,219276,220896,222408,
														223920,225432,226944,228564,230076,231660,233208,234720,236304,236304 }

-- �������е�������ƷID
x808080_g_ItemBox_ItemID = 40004445

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x808080_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
			
	local	key	= GetNumText()	
	if key == x808080_g_AcceptMission_IDX then		
		-- �����Ƿ�����
		if IsMissionFull( sceneId, selfId ) == 1 then
			x808080_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end

		-- ��ⱨ��ʱ��
		if x808080_CheckApplyTime() == 0 then
			x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_018}" )					
			return 0
		end
		
		-- ��������������
		if x808080_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ��������������			
		x808080_AcceptMission( sceneId, selfId, targetId )				

	elseif key == x808080_g_CompleteMission_IDX then
		-- ����Ѿ���������
		if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x808080_g_MissionName)
				AddText(sceneId, x808080_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808080_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808080_g_ScriptId, x808080_g_MissionId, bDone)
			
		else			
			x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_011}" )
			return 0
		end
		
	elseif key == x808080_g_MissionInfo_IDX then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_009}" )		
		return 0

	else
		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x808080_OnEnumerate( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		return 0
	end
	
	AddNumText( sceneId, x808080_g_ScriptId, "��Ҫ�μӹ�������", 7, x808080_g_AcceptMission_IDX )
	AddNumText( sceneId, x808080_g_ScriptId, "���Ѿ�����˹�������", 7, x808080_g_CompleteMission_IDX )
	AddNumText( sceneId, x808080_g_ScriptId, "�������ܻ����", 11, x808080_g_MissionInfo_IDX )

end

--**********************************
--������������Ҳ�����������
--**********************************
function x808080_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x808080_g_PlayerSlow_LVL then		
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_013}" )
		return 0
	end

	--�������״̬פ��Ч��
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	local nTimePoint = x808080_CheckHuoDongTime()
	-- �������
	if x808080_g_ClearPaiMing_Round ~= nTimePoint then
		x808080_g_Jion_Count = 0
		x808080_g_GodFireMis_PaiMing = 0
		x808080_g_ClearPaiMing_Round = nTimePoint
	end

	--��ⱨ����������
	if x808080_g_Jion_Count >= x808080_g_Join_CountMax then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_015}" )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_016}" )
		return 0
	end
	
	--�����Ҳμӻ��ʱ��
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime == nDay then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_017}" )
		return 0
	end
	
	--�������Ƿ���Ӹ���
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GCTeamFollowErrorHandler_Info_In_Mis_GodOfFire}" )		
		return 0
	end
	
	--����Ƿ���˫�����״̬
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x808080_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
 		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x808080_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808080_g_ItemId.num then
		x808080_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

  local nDay   = LuaFnGetDayOfThisMonth()

	BeginAddItem(sceneId)
	AddItem(sceneId,x808080_g_ItemId.id, x808080_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--������������б�
		local bAdd = AddMission( sceneId, selfId, x808080_g_MissionId, x808080_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--�õ���������к�
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808080_g_MissionId )
			
			--�������кŰ���������ĵ�0λ��0 (����������)
			SetMissionByIndex( sceneId, selfId, misIndex, x808080_g_Mission_IsComplete, 0 )
			--�������кŰ���������ĵ�1λ��Ϊ����ű���
			SetMissionByIndex( sceneId, selfId, misIndex, x808080_g_MissScriptID_Idx, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_RecordIdx, 1)
			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_KongMing_Lighten, 0)

			local nTimePoint = x808080_CheckHuoDongTime()

			SetMissionByIndex(sceneId, selfId, misIndex, x808080_g_RoundIndex, nTimePoint)
			
			SetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME, nDay )

			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_Transport_Mission, 0 )
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_GodOfFire_Mission, 0 )

			x808080_g_Jion_Count = x808080_g_Jion_Count + 1

			-- ֪ͨ�ͻ���			
			BeginEvent(sceneId)				
				AddText(sceneId, "#{GodFire_Info_002}")				
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)

			BeginEvent(sceneId)
				AddText(sceneId,x808080_g_MissionName)
				AddText(sceneId,x808080_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{GodFire_Info_004}")				
				AddText(sceneId,"#{GodFire_Info_019}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808080_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x808080_OnAbandon( sceneId, selfId )
  
  --ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
  if HaveItem(sceneId, selfId, x808080_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) >= x808080_g_ItemId.num then
  		DelItem( sceneId, selfId, x808080_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) )
  	else
	  	x808080_NotifyTip( sceneId, selfId, "������Ʒ���ڲ����û��ѱ�������" )			
			return 0
  	end
  end
  
  if HaveItem(sceneId, selfId, x808080_g_ItemBox_ItemID) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) >= 1 then
  		DelItem( sceneId, selfId, x808080_g_ItemBox_ItemID, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) )
  	else
	  	x808080_NotifyTip( sceneId, selfId, "������Ʒ���ڲ����û��ѱ�������" )			
			return 0
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_Transport_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_GodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x808080_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x808080_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808080_g_MissionName)
		AddText( sceneId, x808080_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808080_g_ScriptId,x808080_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808080_CheckSubmit( sceneId, selfId, targetId )

	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) <= 0 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_011}" )
		return 0
	end

	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x808080_g_PlayerSlow_LVL then		
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_013}" )
		return 0
	end

	--�����Ҳμӻ��ʱ��
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_017}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808080_g_MissionId)
	local nTimePoint = x808080_CheckHuoDongTime()
	if nTimePoint ~= GetMissionParam(sceneId, selfId, misIndex, x808080_g_RoundIndex) then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_024}" )
		return 0
	end
	
	-- ����ǲ������񷢲�NPC
	if GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) == 2 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_026}" )
		return 0	
	elseif GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) == 3 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_027}" )
		return 0
	elseif GetMissionParam(sceneId, selfId, misIndex, x808080_g_AcceptNPC_Idx) ~= 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_025}" )
		return 0
	end
	
	--�������Ƿ���Ӹ���
	if IsTeamFollow( sceneId, selfId ) == 1 then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{GCTeamFollowErrorHandler_Info_In_Mis_GodOfFire}" )		
		return 0
	end
	
	--����Ƿ���˫�����״̬
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808080_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x808080_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x808080_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x808080_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808080_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end
	
	local strText = ""
	x808080_g_GodFireMis_PaiMing = x808080_g_GodFireMis_PaiMing + 1

	if x808080_g_GodFireMis_PaiMing <= 3 then
		strText = format("#{_INFOUSR%s}#{GodFire_Info_029}%d#{GodFire_Info_030}", GetName(sceneId,selfId), x808080_g_GodFireMis_PaiMing )
		BroadMsgByChatPipe( sceneId, 0, strText, 4 )
		
		-- ���ü�Ʒ��ë�ȳƺ�
		if x808080_g_GodFire_Title == GetTitle( sceneId, selfId, 14 ) then
			DeleteTitle( sceneId, selfId, 14 )			
		end
		AwardTitle( sceneId, selfId, 14, x808080_g_GodFire_Title, 24 * x808080_GodFireTitle_AlongTime )
		SetCurTitle( sceneId, selfId, 14, x808080_g_GodFire_Title )
		DispatchAllTitle( sceneId, selfId )
	end

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808080_g_BonusEXP_List[playerlvl]
	local nExpEx = x808080_g_BonusEXP_ListEX[x808080_g_GodFireMis_PaiMing]

	nExpNum = floor(nExpNum * nExpEx)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	strText = format("#{_INFOUSR%s}#{GodFire_Info_031}%d#{GodFire_Info_032}%d��#{GodFire_Info_033}", GetName(sceneId,selfId), x808080_g_GodFireMis_PaiMing, nExpNum )
	x808080_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- �˳�����
	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_063}" )
	BroadMsgByChatPipe( sceneId, selfId, "#{GodFire_Info_063}", 8 )
	
	if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	x808080_DelMissionInfo( sceneId, selfId )

end

--**********************************
--ɱ����������
--**********************************
function x808080_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x808080_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x808080_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808080_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808080_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808080_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x808080_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x808080_GetEventMissionId( sceneId, selfId )	
	return x808080_g_MissionId
end

function x808080_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808080_g_Name then
		x808080_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x808080_g_MissionName)
		AddText( sceneId, x808080_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{GodFire_Info_004}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{GodFire_Info_012}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808080_g_ScriptId,x808080_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x808080_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--�������ʱ��
--**********************************
function x808080_CheckApplyTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	for i=1, getn(x808080_g_ActivityTime) do
	  if curHourTime >= x808080_g_ActivityTime[i].tstart and curHourTime < (x808080_g_ActivityTime[i].tstart+x808080_g_Along_Time) then
	  	return 1		
	  end
	end

	return 0
end

--**********************************
--���ʱ��
--**********************************
function x808080_CheckHuoDongTime()

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute


	for i=1, getn(x808080_g_ActivityTime) do
	  if curHourTime >= x808080_g_ActivityTime[i].tstart and curHourTime <= x808080_g_ActivityTime[i].tend then
	  	return i		
	  end
	end

	return 0

end

--**********************************
--����ʹ��
--**********************************
function x808080_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x808080_OnDie( sceneId, selfId, killerId )
	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_034}" )
	x808080_DelMissionInfo( sceneId, selfId )
end

--**********************************
--ɾ�����Ϣ
--ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
--**********************************
function x808080_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808080_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) >= x808080_g_ItemId.num then
  		DelItem( sceneId, selfId, x808080_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemId.id) )  	
  	end
  end
  
  if HaveItem(sceneId, selfId, x808080_g_ItemBox_ItemID) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) >= 1 then
  		DelItem( sceneId, selfId, x808080_g_ItemBox_ItemID, LuaFnGetAvailableItemCount(sceneId, selfId, x808080_g_ItemBox_ItemID) )  	
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_Transport_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_Transport_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808080_g_Impact_GodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808080_g_Impact_GodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808080_g_MissionId ) > 0 then
  	x808080_NotifyTip( sceneId, selfId, "#{GodFire_Info_034}" )
	 	DelMission( sceneId, selfId, x808080_g_MissionId )
	end
	
	return 0

end

--**********************************
-- �����Ч��Ч�ڵ�ʱ�Զ�ɾ��������Ϣ
--**********************************
function x808080_OnImpactFadeOut( sceneId, selfId, impactId )

	if impactId == x808080_g_Impact_GodOfFire_Mission then
		x808080_DelMissionInfo( sceneId, selfId )
	end

end
