--������[ QUFEI 2008-04-18 10:27 UPDATE BugID 34369 ]
--��ʥ�𴫵ݻ��������֮�����¼��ű�
--���ÿ�쿪������,ÿ�����ÿ��ֻ�ܲμ�һ��

--MisDescBegin
--�ű���
x808100_g_ScriptId	= 808100

--��������NPC����
x808100_g_Position_X=207.4352
x808100_g_Position_Z=49.5008
x808100_g_SceneID=24
x808100_g_AccomplishNPC_Name="��Ң"

--��ǰ�����
x808100_g_MissionId			= 1006
--��һ�������ID
x808100_g_MissionIdNext	= 1007
--����Ŀ��npc
x808100_g_Name 					= "��Ң"
--�������
x808100_g_MissionKind			= 13
--����ȼ�
x808100_g_MissionLevel		= 10
--�Ƿ��Ǿ�Ӣ����
x808100_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x808100_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x808100_g_MissionName			= "ʥ�𴫵ݸ���"
--��������
x808100_g_MissionInfo			= "#{XSHCD_20080418_023}"
--����Ŀ��
x808100_g_MissionTarget		= "#{XSHCD_20080418_047}"
--δ��������npc�Ի�
x808100_g_ContinueInfo		= "#{XSHCD_20080418_024}"
--�������npc˵�Ļ�
x808100_g_MissionComplete	= "#{XSHCD_20080418_025}"
--ÿ�λ������ɵĴ���
x808100_g_MaxRound	= 3
--���ƽű�
x808100_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1,2λ
x808100_g_Custom	= { {id="�ѻ�������",num=5}, {id="�ѻ���С����",num=1} }
--MisDescEnd

--�����Ƿ����
x808100_g_Mission_IsComplete = 0		--��������ĵ�0λ
--��������ı��
x808100_g_KillBallIdx				 = 1		--��������ĵ�1λ
--����С����ı��
x808100_g_KillSunMMIdx 			 = 2		--��������ĵ�2λ

x808100_g_CompleteGengKuai_IDX	=	375	--ʥ�𴫵ݸ����ύ��������
x808100_g_MissionInfo_IDX			= 376	--���츱������˵������

--��ӵ�е��¼�ID�б�
x808100_g_EventList	= {}

x808100_g_Impact_Accept_Mission 	 = 47		-- ��������ʱ����ЧID
x808100_g_Impact_Transport_Mission = 113 	-- ����״̬��Ч
x808100_g_Impact_GodOfFireMan_Mission  = 5942 -- ʥ�𴫵��б�����Ч
x808100_g_Impact_GodOfFireGirl_Mission = 5943 -- ʥ�𴫵�Ů������Ч
x808100_g_Impact_DelGodOfFire_Mission  = 5944 -- ɾ��ʥ����Ч����Ч
x808100_g_PlayerSlow_LVL					 = 10		-- �����������͵ȼ�

x808100_g_Mission_StepNum					 = 4		-- ���������������ĵڼ���

x808100_g_ItemId = { id=40004447,num=1 }	-- ������Ʒ

-- ʥ��ʱ��
x808100_g_Activity_Day						 = { dstart=504,  dend=510 }
x808100_g_Activity_Time						 = { tstart=1945, tend=2245 }

-- 5��10�ź�Ļ����ʱ��,ÿ����
x808100_g_Activity_DayTime				 = 5

-- ��������ͽ�Ǯ(��ȼ��й�)
x808100_g_MoneyBonus_Param1				 = 30 
x808100_g_MoneyBonus_Param2				 = 320
x808100_g_ExpBonus_Param1				 	 = 160
x808100_g_ExpBonus_Param2				 	 = 500

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x808100_OnDefaultEvent( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_Name then
		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
			
	local	key	= GetNumText()
	if key == x808100_g_CompleteGengKuai_IDX then		
		-- ����Ѿ���������ʥ�𴫵ݸ���
		if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x808100_g_MissionName)
				AddText(sceneId, x808100_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808100_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808100_g_ScriptId, x808100_g_MissionId, bDone)
			
		else			
			x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_077}" )
			return 0
		end

	elseif key == x808100_g_MissionInfo_IDX then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_007}" )		
		return 0

	else
		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x808100_OnEnumerate( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_Name
		 or sceneId ~= x808100_g_SceneID then
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) > 0 then
		local misIndex = GetMissionIndexByID(sceneId,selfId,x808100_g_MissionId)

		-- ��������Ƿ����	
		if GetMissionParam(sceneId, selfId, misIndex, x808100_g_Mission_IsComplete) > 0 then
			AddNumText( sceneId, x808100_g_ScriptId, "���Ѿ���ɣ�ʥ�𴫵ݸ���", 7, x808100_g_CompleteGengKuai_IDX )
			-- AddNumText( sceneId, x808100_g_ScriptId, "ʥ�𴫵ݸ������", 11, x808100_g_MissionInfo_IDX )
		end
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x808100_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_Name then
		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	--����Ƿ����
	if x808100_CheckHuoDongTime() <= 0 then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_069}" )
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x808100_g_PlayerSlow_LVL then		
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_064}" )
		return 0
	end

	--�������״̬פ��Ч��
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808100_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808100_g_Impact_DelGodOfFire_Mission) ~= 0 then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) > 0 then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end

	--�����Ҳμӱ��λ�������ڼ���
	local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
	if nStepNum ~= x808100_g_Mission_StepNum then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_066}" )
		return 0
	end

	--����Ƿ���˫�����״̬
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x808100_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_Name then
 		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x808100_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808100_g_ItemId.num then
		x808100_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

	BeginAddItem(sceneId)
	AddItem(sceneId,x808100_g_ItemId.id, x808100_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--������������б�
		local bAdd = AddMission( sceneId, selfId, x808100_g_MissionId, x808100_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--�õ���������к�
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808100_g_MissionId )
			
			--�������кŰ���������ĵ�0λ��0 (����������)
			SetMissionByIndex( sceneId, selfId, misIndex, x808100_g_Mission_IsComplete, 0 )

			SetMissionByIndex( sceneId, selfId, misIndex, x808100_g_KillBallIdx, 0 )		
			SetMissionByIndex( sceneId, selfId, misIndex, x808100_g_KillSunMMIdx, 0 )

			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808100_g_Impact_Transport_Mission, 0 )
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808100_g_Impact_DelGodOfFire_Mission, 0 )

			BeginEvent(sceneId)
				AddText(sceneId,x808100_g_MissionName)
				AddText(sceneId,x808100_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{XSHCD_20080418_047}")				
				AddText(sceneId,"#{XSHCD_20080418_007}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808100_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x808100_OnAbandon( sceneId, selfId )
  
  --ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
  if HaveItem(sceneId, selfId, x808100_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808100_g_ItemId.id) >= x808100_g_ItemId.num then
  		DelItem( sceneId, selfId, x808100_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808100_g_ItemId.id) )
  	else
	  	x808100_NotifyTip( sceneId, selfId, "������Ʒ���ڲ����û��ѱ�������" )			
			return 0
  	end
  end

  if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808100_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x808100_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_AccomplishNPC_Name then
		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x808100_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808100_g_MissionName)
		AddText( sceneId, x808100_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808100_g_ScriptId,x808100_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808100_CheckSubmit( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_AccomplishNPC_Name then
		x808100_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) <= 0 then
		x808100_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_077}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808100_g_MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x808100_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x808100_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_AccomplishNPC_Name then
		x808100_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x808100_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808100_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end
	
	local strText = ""

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808100_g_ExpBonus_Param1*playerlvl+x808100_g_ExpBonus_Param2
	local nMoneyNum = x808100_g_MoneyBonus_Param1*playerlvl+x808100_g_MoneyBonus_Param2

	nExpNum = floor(nExpNum)
	nMoneyNum = floor(nMoneyNum)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	AddMoney( sceneId, selfId, nMoneyNum )
	-- x808100_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- �˳�����
	x808100_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_088}" )

	x808100_DelMissionInfo( sceneId, selfId )

end

function x808100_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x808100_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x808100_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808100_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808100_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808100_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x808100_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x808100_GetEventMissionId( sceneId, selfId )	
	return x808100_g_MissionId
end

function x808100_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808100_g_Name then
		x808100_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x808100_g_MissionName)
		AddText( sceneId, x808100_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XSHCD_20080418_047}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{XSHCD_20080418_096}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808100_g_ScriptId,x808100_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x808100_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--���ʱ��
--**********************************
function x808100_CheckHuoDongTime()

	local nMonth = GetTodayMonth()+1
	local nDate	 = GetTodayDate()
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nThisDay = GetTodayWeek()
	local curDateTime = nMonth*100+nDate
  local curHourTime = nHour*100+nMinute
  
  if curHourTime >= x808100_g_Activity_Time.tstart and curHourTime <= x808100_g_Activity_Time.tend then
  	if curDateTime >= x808100_g_Activity_Day.dstart and curDateTime <= x808100_g_Activity_Day.dend then
  		return 1
 		elseif curDateTime > x808100_g_Activity_Day.dend and nThisDay == x808100_g_Activity_DayTime then
  		return 1
  	end
  end


	return 0

end

--**********************************
--����ʹ��
--**********************************
function x808100_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x808100_OnDie( sceneId, selfId, killerId )
end

--**********************************
--ɾ�����Ϣ
--ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
--**********************************
function x808100_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808100_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808100_g_ItemId.id) >= x808100_g_ItemId.num then
  		DelItem( sceneId, selfId, x808100_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808100_g_ItemId.id) )  	
  	end
  end

  if IsHaveMission( sceneId, selfId, x808100_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808100_g_MissionId )
	end
	
	return 0

end
