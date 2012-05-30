--������[ QUFEI 2008-04-18 10:27 UPDATE BugID 34369 ]
--��ʥ�𴫵ݻ֮�����ʥ���¼��ű�
--���ÿ�쿪������,ÿ�����ÿ��ֻ�ܲμ�һ��

--MisDescBegin
--�ű���
x808105_g_ScriptId	= 808105

--��������NPC����
x808105_g_Position_X=91.1844
x808105_g_Position_Z=84.0730
x808105_g_SceneID=1
x808105_g_AccomplishNPC_Name="ʥ��̳"

--�����
x808105_g_MissionId			= 1011
--��һ�������ID
x808105_g_MissionIdNext	= 1011
--����Ŀ�����ڳ���
x808105_g_AcceptNPC_SceneID	=	18
--����Ŀ��npc
x808105_g_Name 					= "����η"
--�������
x808105_g_MissionKind			= 13
--����ȼ�
x808105_g_MissionLevel		= 10
--�Ƿ��Ǿ�Ӣ����
x808105_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x808105_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x808105_g_MissionName			= "�����ʥ��"
--��������
x808105_g_MissionInfo			= "#{XSHCD_20080418_038}"
--����Ŀ��
x808105_g_MissionTarget		= "#{XSHCD_20080418_052}"
--δ��������npc�Ի�
x808105_g_ContinueInfo		= "#{XSHCD_20080418_039}"
--�������npc˵�Ļ�
x808105_g_MissionComplete	= "#{XSHCD_20080418_040}"
--ÿ�λ������ɵĴ���
x808105_g_MaxRound	= 3
--���ƽű�
x808105_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x808105_g_Custom	= { {id="�ѽ���潻�����ݵ�ʥ��̳",num=1} }
--MisDescEnd

--�����Ƿ����
x808105_g_Mission_IsComplete = 0		--��������ĵ�0λ
--ʥ�𽻸�ʥ��̳�ı��
x808105_g_RecordIdx 				 = 1		--��������ĵ�1λ
--����ű��ż�¼
x808105_g_MissScriptID_Idx	 = 2		--��������ĵ�2λ
--���񷢲�NPC���
x808105_g_AcceptNPC_Idx			 = 3		--��������ĵ�3λ 19.����NPC


x808105_g_AcceptMission_IDX		= 875	--�����ʥ�������������
x808105_g_CompleteMission_IDX	= 876	--�����ʥ���ύ��������
x808105_g_MissionInfo_IDX			= 877	--����˵������

--��ӵ�е��¼�ID�б�
x808105_g_EventList	= {}

x808105_g_Impact_Accept_Mission 	 = 47		-- ��������ʱ����ЧID
x808105_g_Impact_Transport_Mission = 113 	-- ����״̬��Ч
x808105_g_Impact_GodOfFireMan_Mission  = 5942 -- ʥ�𴫵��б�����Ч
x808105_g_Impact_GodOfFireGirl_Mission = 5943 -- ʥ�𴫵�Ů������Ч
x808105_g_Impact_DelGodOfFire_Mission  = 5944 -- ɾ��ʥ����Ч����Ч
x808105_g_PlayerSlow_LVL					 = 10		-- �����������͵ȼ�

x808105_g_Mission_StepNum					 = 7		-- ���������������ĵڼ���

x808105_g_ItemId = { id=40004447,num=1 }	-- ������Ʒ

-- ʥ��ʱ��
x808105_g_Activity_Day						 = { dstart=504,  dend=510 }
x808105_g_Activity_Time						 = { tstart=1945, tend=2245 }

-- 5��10�ź�Ļ����ʱ��,ÿ����
x808105_g_Activity_DayTime				 = 5

-- ��������ͽ�Ǯ(��ȼ��й�)
x808105_g_MoneyBonus_Param1				 = 30 
x808105_g_MoneyBonus_Param2				 = 320
x808105_g_ExpBonus_Param1				 	 = 160
x808105_g_ExpBonus_Param2				 	 = 500
x808105_g_Bonus_Param1				 	 	 = 2
x808105_g_Bonus_Param2				 	 	 = 1.5

-- ������Ʒ
x808105_g_ItemBonus_List 					 = { id=30505191,num=1 }

-- ʥ�������б�
x808105_g_GodFire_MissionList			 = { 1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010 }

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x808105_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x808105_g_AcceptMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808105_g_Name then
			x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		-- �����Ƿ�����
		if IsMissionFull( sceneId, selfId ) == 1 then
			x808105_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ��������������
		if x808105_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ��������������			
		x808105_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x808105_g_CompleteMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808105_g_AccomplishNPC_Name then
			x808105_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
			return 0
		end
		-- ����Ѿ��������������ʥ��
		if IsHaveMission( sceneId, selfId, x808105_g_MissionId) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x808105_g_MissionName)
				AddText(sceneId, x808105_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808105_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808105_g_ScriptId, x808105_g_MissionId, bDone)
			
		else			
			x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_082}" )
			return 0
		end
	elseif key == x808105_g_MissionInfo_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808105_g_Name then
			x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_007}" )		
		return 0

	else
		x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x808105_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) == x808105_g_Name
		 and sceneId == x808105_g_AcceptNPC_SceneID then
		 
		 if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) <= 0 then
		 		local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
				if nStepNum == x808105_g_Mission_StepNum then
					AddNumText( sceneId, x808105_g_ScriptId, "��Ҫ�μӣ������ʥ��", 7, x808105_g_AcceptMission_IDX )
				end
		 end
		-- AddNumText( sceneId, x808105_g_ScriptId, "�����ʥ�����", 11, x808105_g_MissionInfo_IDX )
	elseif LuaFnGetName( sceneId, targetId ) == x808105_g_AccomplishNPC_Name
				 and sceneId == x808105_g_SceneID then
	
		if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x808105_g_MissionId)

			-- ��������Ƿ����	
			if GetMissionParam(sceneId, selfId, misIndex, x808105_g_Mission_IsComplete) <= 0 then
				SetMissionByIndex( sceneId, selfId, misIndex, x808105_g_Mission_IsComplete, 1 )
				SetMissionByIndex( sceneId, selfId, misIndex, x808105_g_RecordIdx, 1 )
				x808105_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_105}" )
				x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_098}" )
				return 0
			else
				AddNumText( sceneId, x808105_g_ScriptId, "���Ѿ���ɣ������ʥ��", 7, x808105_g_CompleteMission_IDX )
			end
		end
	else
		return 0
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x808105_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_Name then
		x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	--����Ƿ����
	if x808105_CheckHuoDongTime() <= 0 then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_069}" )
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x808105_g_PlayerSlow_LVL then		
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_064}" )
		return 0
	end

	--�������״̬פ��Ч��
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_DelGodOfFire_Mission) ~= 0 then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) > 0 then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end

	--�����Ҳμӱ��λ�������ڼ���
	local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
	if nStepNum ~= x808105_g_Mission_StepNum then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_066}" )
		return 0
	end

	--����Ƿ���˫�����״̬
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x808105_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_Name then
 		x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x808105_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808105_g_ItemId.num then
		x808105_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

	BeginAddItem(sceneId)
	AddItem(sceneId,x808105_g_ItemId.id, x808105_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--������������б�
		local bAdd = AddMission( sceneId, selfId, x808105_g_MissionId, x808105_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--�õ���������к�
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808105_g_MissionId )
			
			--�������кŰ���������ĵ�0λ��0 (����������)
			SetMissionByIndex( sceneId, selfId, misIndex, x808105_g_Mission_IsComplete, 0 )
			SetMissionByIndex( sceneId, selfId, misIndex, x808105_g_RecordIdx, 0 )
			--�������кŰ���������ĵ�2λ��Ϊ����ű���
			SetMissionByIndex( sceneId, selfId, misIndex, x808105_g_MissScriptID_Idx, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x808105_g_AcceptNPC_Idx, 19)

			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808105_g_Impact_Transport_Mission, 0 )
			
			-- �����Ա������Buffer
			if GetSex( sceneId, selfId ) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808105_g_Impact_GodOfFireMan_Mission, 0 )
			else
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808105_g_Impact_GodOfFireGirl_Mission, 0 )
			end
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808105_g_Impact_DelGodOfFire_Mission, 0 )

			BeginEvent(sceneId)
				AddText(sceneId,x808105_g_MissionName)
				AddText(sceneId,x808105_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{XSHCD_20080418_052}")				
				AddText(sceneId,"#{XSHCD_20080418_007}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808105_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x808105_OnAbandon( sceneId, selfId )
  
  --ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
  if HaveItem(sceneId, selfId, x808105_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808105_g_ItemId.id) >= x808105_g_ItemId.num then
  		DelItem( sceneId, selfId, x808105_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808105_g_ItemId.id) )
  	else
	  	x808105_NotifyTip( sceneId, selfId, "������Ʒ���ڲ����û��ѱ�������" )			
			return 0
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_Transport_Mission) ~= 0 then
  	-- �������������˻����̾Ͳ��������Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808105_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x808105_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_AccomplishNPC_Name then
		x808105_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x808105_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808105_g_MissionName)
		AddText( sceneId, x808105_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808105_g_ScriptId,x808105_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808105_CheckSubmit( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_AccomplishNPC_Name then
		x808105_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) <= 0 then
		x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_082}" )
		return 0
	end

	for i, MissionId in x808105_g_GodFire_MissionList do
		if IsHaveMission( sceneId, selfId, MissionId) > 0 then
			x808105_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_107}" )
			return 0
		end
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808105_g_MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x808105_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x808105_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_AccomplishNPC_Name then
		x808105_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x808105_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808105_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end
	
	local strText = ""

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808105_g_Bonus_Param1*( x808105_g_ExpBonus_Param1*playerlvl+x808105_g_ExpBonus_Param2 )
	local nMoneyNum = x808105_g_Bonus_Param2*( x808105_g_MoneyBonus_Param1*playerlvl+x808105_g_MoneyBonus_Param2 )

	nExpNum = floor(nExpNum)
	nMoneyNum = floor(nMoneyNum)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	AddMoney( sceneId, selfId, nMoneyNum )
	-- x808105_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- �˳�����
	x808105_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_093}" )
	
	local nStr = format("#{XSHCD_20080418_041}#{_INFOUSR%s}#{XSHCD_20080418_106}", GetName(sceneId,selfId))
	BroadMsgByChatPipe( sceneId, selfId, nStr, 4 )

	x808105_DelMissionInfo( sceneId, selfId )

	local nItemId = 0
	-- ���轱����Ʒ
	BeginAddItem(sceneId)
	AddItem(sceneId,x808105_g_ItemBonus_List.id, x808105_g_ItemBonus_List.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		nItemId = x808105_g_ItemBonus_List.id
		AddItemListToHuman(sceneId,selfId)
	end
	
	-- ���־
	local nLevel = GetLevel(sceneId, selfId)
	AuditGodFire( sceneId, selfId, nItemId, x808105_g_MissionId, nLevel )
	
	-- ʥ������ڰ˲����,������ͷ��ʼ
	SetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM, 0 )

end

--**********************************
--ɱ����������
--**********************************
function x808105_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x808105_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x808105_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808105_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808105_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808105_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x808105_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x808105_GetEventMissionId( sceneId, selfId )	
	return x808105_g_MissionId
end

function x808105_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808105_g_Name then
		x808105_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x808105_g_MissionName)
		AddText( sceneId, x808105_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XSHCD_20080418_052}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{XSHCD_20080418_097}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808105_g_ScriptId,x808105_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x808105_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--���ʱ��
--**********************************
function x808105_CheckHuoDongTime()

	local nMonth = GetTodayMonth()+1
	local nDate	 = GetTodayDate()
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nThisDay = GetTodayWeek()
	local curDateTime = nMonth*100+nDate
  local curHourTime = nHour*100+nMinute
  
  if curHourTime >= x808105_g_Activity_Time.tstart and curHourTime <= x808105_g_Activity_Time.tend then
  	if curDateTime >= x808105_g_Activity_Day.dstart and curDateTime <= x808105_g_Activity_Day.dend then
  		return 1
 		elseif curDateTime > x808105_g_Activity_Day.dend and nThisDay == x808105_g_Activity_DayTime then
  		return 1
  	end
  end


	return 0

end

--**********************************
--����ʹ��
--**********************************
function x808105_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x808105_OnDie( sceneId, selfId, killerId )
end

--**********************************
--ɾ�����Ϣ
--ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
--**********************************
function x808105_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808105_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808105_g_ItemId.id) >= x808105_g_ItemId.num then
  		DelItem( sceneId, selfId, x808105_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808105_g_ItemId.id) )  	
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_Transport_Mission) ~= 0 then
  	-- �������������˻����̾Ͳ��������Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808105_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808105_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808105_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x808105_g_MissionId )
	end
	
	return 0

end
