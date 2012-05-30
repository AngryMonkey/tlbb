--������[ QUFEI 2008-04-30 10:27 UPDATE BugID 34171 ]
--�����ʧ�����������¼��ű�
--������������_��ʦ���ڴ�7

--MisDescBegin
--�ű���
x500613_g_ScriptId	= 500613

--Ŀ������NPC����
x500613_g_Position_X=160.2399
x500613_g_Position_Z=134.1486
x500613_g_SceneID=0
x500613_g_AccomplishNPC_Name="����ʦ"

--ǰ�������
x500613_g_PreMissionId	=	432
--�����
x500613_g_MissionId			= 433
--��һ�������ID
x500613_g_MissionIdNext	= 434
--��һ�������Index
x500613_g_MissionIndexNext	= 1018716
--��һ�������ScriptId
x500613_g_NextScriptId	= 006668
--��ȡ����Ŀ�����ڳ���
x500613_g_AcceptNPC_SceneID	=	0
--��ȡ����npc
x500613_g_Name 					= "����ʦ"
--�������
x500613_g_MissionKind			= 11
--����ȼ�
x500613_g_MissionLevel		= 40
--�Ƿ��Ǿ�Ӣ����
x500613_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x500613_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x500613_g_MissionName			= "��ʦ���ڴ�(7)"
--��������
x500613_g_MissionInfo			= "#{YD_20080421_14}"
--����Ŀ��
x500613_g_MissionTarget		= "#{YD_20080421_95}"
--δ��������npc�Ի�
x500613_g_ContinueInfo		= "#{YD_20080421_15}"
--�������npc˵�Ļ�
x500613_g_MissionComplete	= "#{YD_20080421_16}"
--������ɵĻ���
x500613_g_MaxRound	= 1
--���ƽű�
x500613_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x500613_g_Custom	= { {id="������42��",num=1} }
--MisDescEnd

--�����Ƿ����
x500613_g_Mission_IsComplete = 0		--��������ĵ�0λ
--�Ƿ�ﵽ�ȼ��ı��
x500613_g_RecordIdx 				 = 1		--��������ĵ�1λ
--����ű��ż�¼
x500613_g_MissScriptID_Idx	 = 2		--��������ĵ�2λ
--���񷢲�NPC���
x500613_g_AcceptNPC_Idx			 = 3		--��������ĵ�3λ 1.����NPC

x500613_g_AcceptMission_IDX		= 781	--������������
x500613_g_CompleteMission_IDX	= 782	--�ύ��������

--��ӵ�е��¼�ID�б�
x500613_g_EventList	= {}

x500613_g_PlayerSlow_LVL					 = 40		-- �����������͵ȼ�

--����
x500613_g_MoneyBonus					=	1397
x500613_g_ExpBonus						= 5589

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x500613_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500613_g_AcceptMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x500613_g_Name then
			x500613_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		-- �����Ƿ�����
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500613_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ��������������
		if x500613_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ��������������			
		x500613_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500613_g_CompleteMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x500613_g_AccomplishNPC_Name then
			x500613_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
			return 0
		end
		-- ����Ѿ���������
		if IsHaveMission( sceneId, selfId, x500613_g_MissionId) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x500613_g_MissionName)
				AddText(sceneId, x500613_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500613_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500613_g_ScriptId, x500613_g_MissionId, bDone)
			
		else			
			x500613_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500613_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x500613_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_Name
		 or sceneId ~= x500613_g_SceneID then
		 
		 return 0
	end

	if IsHaveMission( sceneId, selfId, x500613_g_MissionId ) <= 0 then
		if IsMissionHaveDone( sceneId, selfId, x500613_g_MissionId ) <= 0
			 and LuaFnGetLevel( sceneId, selfId ) >= x500613_g_PlayerSlow_LVL then
			AddNumText( sceneId, x500613_g_ScriptId, x500613_g_MissionName, 1, x500613_g_AcceptMission_IDX )
		end
	else
		
		AddNumText( sceneId, x500613_g_ScriptId, x500613_g_MissionName, 2, x500613_g_CompleteMission_IDX )
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x500613_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_Name then
		x500613_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x500613_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500613_g_PlayerSlow_LVL )
		x500613_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x500613_g_MissionId ) > 0 then
		-- x500613_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500613_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x500613_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_Name then
 		x500613_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x500613_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--������������б�
	local bAdd = AddMission( sceneId, selfId, x500613_g_MissionId, x500613_g_ScriptId, 0, 0, 0 )
	if bAdd >= 1 then

		--�õ���������к�
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500613_g_MissionId )
		
		--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex( sceneId, selfId, misIndex, x500613_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500613_g_RecordIdx, 0 )
		--�������кŰ���������ĵ�2λ��Ϊ����ű���
		SetMissionByIndex( sceneId, selfId, misIndex, x500613_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500613_g_AcceptNPC_Idx, 1)

		local strText = "#{YD_20080421_229}" .. x500613_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
		
		-- �Ƿ�ﵽ42��
		local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	  if Playerlvl >= 42 then
			SetMissionByIndex( sceneId, selfId, misIndex, x500613_g_Mission_IsComplete, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x500613_g_RecordIdx, 1 )
			x500613_NotifyTip( sceneId, selfId, "#{YD_20080421_198}" )
		end

	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x500613_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500613_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500613_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x500613_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_AccomplishNPC_Name then
		x500613_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x500613_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500613_g_MissionName)
		AddText( sceneId, x500613_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500613_g_ScriptId,x500613_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x500613_CheckSubmit( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_AccomplishNPC_Name then
		x500613_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500613_g_MissionId ) <= 0 then
		x500613_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	-- �Ƿ�ﵽ42��
	local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	if Playerlvl < 42 then
		x500613_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_199}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500613_g_MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x500613_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x500613_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_AccomplishNPC_Name then
		x500613_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x500613_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500613_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500613_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500613_g_ExpBonus )

	-- ����˳�����
	x500613_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500613_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500613_g_MissionId )
	 	-- ���������Ѿ�����ɹ�
	 	MissionCom( sceneId, selfId, x500613_g_MissionId )
	 	
	 	local strText = "#Y" .. x500613_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- ��������������ܽ���
	 	if IsHaveMission( sceneId, selfId, x500613_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500613_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500613_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500613_g_MissionIndexNext )
	 	end	 		 		 	
	end

end

--**********************************
--ɱ����������
--**********************************
function x500613_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x500613_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x500613_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500613_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500613_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x500613_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x500613_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x500613_GetEventMissionId( sceneId, selfId )	
	return x500613_g_MissionId
end

function x500613_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500613_g_Name then
		x500613_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x500613_g_MissionName)
		AddText( sceneId, x500613_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_95}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500613_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500613_g_ScriptId,x500613_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x500613_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--����ʹ��
--**********************************
function x500613_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x500613_OnDie( sceneId, selfId, killerId )
end
