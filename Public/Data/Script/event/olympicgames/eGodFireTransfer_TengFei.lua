--������[ QUFEI 2008-04-18 10:27 UPDATE BugID 34369 ]
--��ʥ�𴫵ݻ֮�ڷɵ�ʥ���¼��ű�
--���ÿ�쿪������,ÿ�����ÿ��ֻ�ܲμ�һ��

--MisDescBegin
--�ű���
x808103_g_ScriptId	= 808103

--��������NPC����
x808103_g_Position_X=242.5412
x808103_g_Position_Z=73.5041
x808103_g_SceneID=18
x808103_g_AccomplishNPC_Name="����η"

--�����
x808103_g_MissionId			= 1009
--��һ�������ID
x808103_g_MissionIdNext	= 1010
--����Ŀ�����ڳ���
x808103_g_AcceptNPC_SceneID	=	0
--����Ŀ��npc
x808103_g_Name 					= "����"
--�������
x808103_g_MissionKind			= 13
--����ȼ�
x808103_g_MissionLevel		= 10
--�Ƿ��Ǿ�Ӣ����
x808103_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x808103_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x808103_g_MissionName			= "�ڷɵ�ʥ��"
--��������
x808103_g_MissionInfo			= "#{XSHCD_20080418_032}"
--����Ŀ��
x808103_g_MissionTarget		= "#{XSHCD_20080418_050}"
--δ��������npc�Ի�
x808103_g_ContinueInfo		= "#{XSHCD_20080418_033}"
--�������npc˵�Ļ�
x808103_g_MissionComplete	= "#{XSHCD_20080418_034}"
--ÿ�λ������ɵĴ���
x808103_g_MaxRound	= 3
--���ƽű�
x808103_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x808103_g_Custom	= { {id="�ѽ���潻�����ϵ�����η",num=1} }
--MisDescEnd

--�����Ƿ����
x808103_g_Mission_IsComplete = 0		--��������ĵ�0λ
--ʥ�𽻸�����η�ı��
x808103_g_RecordIdx 				 = 1		--��������ĵ�1λ
--����ű��ż�¼
x808103_g_MissScriptID_Idx	 = 2		--��������ĵ�2λ
--���񷢲�NPC���
x808103_g_AcceptNPC_Idx			 = 3		--��������ĵ�3λ 19.����NPC


x808103_g_AcceptMission_IDX		= 675	--�ڷɵ�ʥ�������������
x808103_g_CompleteMission_IDX	= 676	--�ڷɵ�ʥ���ύ��������
x808103_g_MissionInfo_IDX			= 677	--����˵������

--��ӵ�е��¼�ID�б�
x808103_g_EventList	= {}

x808103_g_Impact_Accept_Mission 	 = 47		-- ��������ʱ����ЧID
x808103_g_Impact_Transport_Mission = 113 	-- ����״̬��Ч
x808103_g_Impact_GodOfFireMan_Mission  = 5942 -- ʥ�𴫵��б�����Ч
x808103_g_Impact_GodOfFireGirl_Mission = 5943 -- ʥ�𴫵�Ů������Ч
x808103_g_Impact_DelGodOfFire_Mission  = 5944 -- ɾ��ʥ����Ч����Ч
x808103_g_PlayerSlow_LVL					 = 10		-- �����������͵ȼ�

x808103_g_Mission_StepNum					 = 6		-- ���������������ĵڼ���

x808103_g_ItemId = { id=40004447,num=1 }	-- ������Ʒ

-- ʥ��ʱ��
x808103_g_Activity_Day						 = { dstart=504,  dend=510 }
x808103_g_Activity_Time						 = { tstart=1945, tend=2245 }

-- 5��10�ź�Ļ����ʱ��,ÿ����
x808103_g_Activity_DayTime				 = 5

-- ��������ͽ�Ǯ(��ȼ��й�)
x808103_g_MoneyBonus_Param1				 = 30 
x808103_g_MoneyBonus_Param2				 = 320
x808103_g_ExpBonus_Param1				 	 = 160
x808103_g_ExpBonus_Param2				 	 = 500

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x808103_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x808103_g_AcceptMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808103_g_Name then
			x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		-- �����Ƿ�����
		if IsMissionFull( sceneId, selfId ) == 1 then
			x808103_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ��������������
		if x808103_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ��������������			
		x808103_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x808103_g_CompleteMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808103_g_AccomplishNPC_Name then
			x808103_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
			return 0
		end
		-- ����Ѿ����������ڷɵ�ʥ��
		if IsHaveMission( sceneId, selfId, x808103_g_MissionId) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x808103_g_MissionName)
				AddText(sceneId, x808103_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x808103_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x808103_g_ScriptId, x808103_g_MissionId, bDone)
			
		else			
			x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_080}" )
			return 0
		end
	elseif key == x808103_g_MissionInfo_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x808103_g_Name then
			x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_007}" )		
		return 0

	else
		x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x808103_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) == x808103_g_Name
		 and sceneId == x808103_g_AcceptNPC_SceneID then
		 
		 if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) <= 0 then
		 		local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
				if nStepNum == x808103_g_Mission_StepNum then
					AddNumText( sceneId, x808103_g_ScriptId, "��Ҫ�μӣ��ڷɵ�ʥ��", 7, x808103_g_AcceptMission_IDX )
				end
		 end
		-- AddNumText( sceneId, x808103_g_ScriptId, "�ڷɵ�ʥ�����", 11, x808103_g_MissionInfo_IDX )
	elseif LuaFnGetName( sceneId, targetId ) == x808103_g_AccomplishNPC_Name
				 and sceneId == x808103_g_SceneID then
	
		if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) > 0 then
			local misIndex = GetMissionIndexByID(sceneId,selfId,x808103_g_MissionId)

			-- ��������Ƿ����	
			if GetMissionParam(sceneId, selfId, misIndex, x808103_g_Mission_IsComplete) <= 0 then
				SetMissionByIndex( sceneId, selfId, misIndex, x808103_g_Mission_IsComplete, 1 )
				SetMissionByIndex( sceneId, selfId, misIndex, x808103_g_RecordIdx, 1 )
				x808103_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_104}" )
				x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_098}" )
				return 0
			else
				AddNumText( sceneId, x808103_g_ScriptId, "���Ѿ���ɣ��ڷɵ�ʥ��", 7, x808103_g_CompleteMission_IDX )
			end
		end
	else
		return 0
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x808103_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_Name then
		x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end
	
	--����Ƿ����
	if x808103_CheckHuoDongTime() <= 0 then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_069}" )
		return 0
	end
	
	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x808103_g_PlayerSlow_LVL then		
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_064}" )
		return 0
	end

	--�������״̬פ��Ч��
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_Transport_Mission) ~= 0
		 or LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_DelGodOfFire_Mission) ~= 0 then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{GodFire_Info_014}" )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) > 0 then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end

	--�����Ҳμӱ��λ�������ڼ���
	local	nStepNum = GetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM )
	if nStepNum ~= x808103_g_Mission_StepNum then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_066}" )
		return 0
	end

	--����Ƿ���˫�����״̬
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{ResultText_117}" )
		return 0
	end
	
	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x808103_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_Name then
 		x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x808103_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	if LuaFnGetTaskItemBagSpace( sceneId, selfId ) < x808103_g_ItemId.num then
		x808103_NotifyTip( sceneId, selfId, "#{QX_20071129_027}" )		
		return 0
	end

	BeginAddItem(sceneId)
	AddItem(sceneId,x808103_g_ItemId.id, x808103_g_ItemId.num)
	local canAdd = EndAddItem(sceneId,selfId)						
	if canAdd > 0 then
		--������������б�
		local bAdd = AddMission( sceneId, selfId, x808103_g_MissionId, x808103_g_ScriptId, 0, 0, 0 )
		if bAdd >= 1 then				
			AddItemListToHuman(sceneId,selfId)
			
			--�õ���������к�
			local	misIndex		= GetMissionIndexByID( sceneId, selfId, x808103_g_MissionId )
			
			--�������кŰ���������ĵ�0λ��0 (����������)
			SetMissionByIndex( sceneId, selfId, misIndex, x808103_g_Mission_IsComplete, 0 )
			SetMissionByIndex( sceneId, selfId, misIndex, x808103_g_RecordIdx, 0 )
			--�������кŰ���������ĵ�2λ��Ϊ����ű���
			SetMissionByIndex( sceneId, selfId, misIndex, x808103_g_MissScriptID_Idx, scriptId )		
			SetMissionByIndex(sceneId, selfId, misIndex, x808103_g_AcceptNPC_Idx, 19)

			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808103_g_Impact_Transport_Mission, 0 )
			
			-- �����Ա������Buffer
			if GetSex( sceneId, selfId ) == 1 then
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808103_g_Impact_GodOfFireMan_Mission, 0 )
			else
				LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808103_g_Impact_GodOfFireGirl_Mission, 0 )
			end
			
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808103_g_Impact_DelGodOfFire_Mission, 0 )

			BeginEvent(sceneId)
				AddText(sceneId,x808103_g_MissionName)
				AddText(sceneId,x808103_g_MissionInfo)
				AddText(sceneId,"#{M_MUBIAO}#r")
				AddText(sceneId,"#{XSHCD_20080418_050}")				
				AddText(sceneId,"#{XSHCD_20080418_007}")				
			EndEvent( )					
			DispatchEventList(sceneId, selfId, targetId)
			
			-- LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x808103_g_Impact_Accept_Mission, 0 )
		end
	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x808103_OnAbandon( sceneId, selfId )
  
  --ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
  if HaveItem(sceneId, selfId, x808103_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808103_g_ItemId.id) >= x808103_g_ItemId.num then
  		DelItem( sceneId, selfId, x808103_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808103_g_ItemId.id) )
  	else
	  	x808103_NotifyTip( sceneId, selfId, "������Ʒ���ڲ����û��ѱ�������" )			
			return 0
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_Transport_Mission) ~= 0 then
  	-- �������������˻����̾Ͳ��������Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x808103_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x808103_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_AccomplishNPC_Name then
		x808103_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x808103_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x808103_g_MissionName)
		AddText( sceneId, x808103_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x808103_g_ScriptId,x808103_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x808103_CheckSubmit( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_AccomplishNPC_Name then
		x808103_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) <= 0 then
		x808103_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_080}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x808103_g_MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x808103_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x808103_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_AccomplishNPC_Name then
		x808103_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x808103_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x808103_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end
	
	local strText = ""

	local playerlvl = LuaFnGetLevel( sceneId, selfId )
	local nExpNum = x808103_g_ExpBonus_Param1*playerlvl+x808103_g_ExpBonus_Param2
	local nMoneyNum = x808103_g_MoneyBonus_Param1*playerlvl+x808103_g_MoneyBonus_Param2

	nExpNum = floor(nExpNum)
	nMoneyNum = floor(nMoneyNum)
	LuaFnAddExp( sceneId, selfId, nExpNum )
	AddMoney( sceneId, selfId, nMoneyNum )
	-- x808103_TalkInfo( sceneId, selfId, targetId, strText )
	
	-- �˳�����
	x808103_NotifyTip( sceneId, selfId, "#{XSHCD_20080418_091}" )

	x808103_DelMissionInfo( sceneId, selfId )
	
	-- ʥ��������߲����
	SetMissionData( sceneId, selfId, MD_GODOFFIRE_COMPLETE_STEPNUM, 7 )

	-- ֱ�Ӹ���Ҹ�������
	CallScriptFunction( 808104, "OnAccept", sceneId, selfId, targetId, x808103_g_ScriptId )

end

--**********************************
--ɱ����������
--**********************************
function x808103_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x808103_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x808103_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808103_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x808103_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x808103_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x808103_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x808103_GetEventMissionId( sceneId, selfId )	
	return x808103_g_MissionId
end

function x808103_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x808103_g_Name then
		x808103_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x808103_g_MissionName)
		AddText( sceneId, x808103_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{XSHCD_20080418_050}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddText(sceneId,"#{XSHCD_20080418_096}")
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x808103_g_ScriptId,x808103_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x808103_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--���ʱ��
--**********************************
function x808103_CheckHuoDongTime()

	local nMonth = GetTodayMonth()+1
	local nDate	 = GetTodayDate()
	local nHour	 = GetHour()
	local nMinute = GetMinute()
	local nThisDay = GetTodayWeek()
	local curDateTime = nMonth*100+nDate
  local curHourTime = nHour*100+nMinute
  
  if curHourTime >= x808103_g_Activity_Time.tstart and curHourTime <= x808103_g_Activity_Time.tend then
  	if curDateTime >= x808103_g_Activity_Day.dstart and curDateTime <= x808103_g_Activity_Day.dend then
  		return 1
 		elseif curDateTime > x808103_g_Activity_Day.dend and nThisDay == x808103_g_Activity_DayTime then
  		return 1
  	end
  end


	return 0

end

--**********************************
--����ʹ��
--**********************************
function x808103_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x808103_OnDie( sceneId, selfId, killerId )
end

--**********************************
--ɾ�����Ϣ
--ɾ����������б��ж�Ӧ������,��Ʒ��פ��Ч��
--**********************************
function x808103_DelMissionInfo( sceneId, selfId )

  if HaveItem(sceneId, selfId, x808103_g_ItemId.id) > 0 then
  	if LuaFnGetAvailableItemCount(sceneId, selfId, x808103_g_ItemId.id) >= x808103_g_ItemId.num then
  		DelItem( sceneId, selfId, x808103_g_ItemId.id, LuaFnGetAvailableItemCount(sceneId, selfId, x808103_g_ItemId.id) )  	
  	end
  end

  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_Transport_Mission) ~= 0 then
  	-- �������������˻����̾Ͳ��������Buff
  	if IsHaveMission( sceneId, selfId, 4021 ) <= 0
  		 and GetItemCount(sceneId, selfId, 40002000) <= 0 then  	
  		LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_Transport_Mission )
  	end
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_GodOfFireMan_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_GodOfFireMan_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_GodOfFireGirl_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_GodOfFireGirl_Mission )
  end
  
  if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808103_g_Impact_DelGodOfFire_Mission) ~= 0 then
  	LuaFnCancelSpecificImpact( sceneId, selfId, x808103_g_Impact_DelGodOfFire_Mission )
  end
  
  if IsHaveMission( sceneId, selfId, x808103_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x808103_g_MissionId )
	end
	
	return 0

end
