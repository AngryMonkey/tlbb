--������[ QUFEI 2008-04-30 10:27 UPDATE BugID 34172 ]
--�����ʧ�����������¼��ű�
--������Ĺ��������_��ʦ���ڴ�10

--MisDescBegin
--�ű���
x500616_g_ScriptId	= 500616

--Ŀ������NPC����
x500616_g_Position_X=160.2399
x500616_g_Position_Z=134.1486
x500616_g_SceneID=0
x500616_g_AccomplishNPC_Name="����ʦ"

--ǰ�������
x500616_g_PreMissionId	=	479
--�����
x500616_g_MissionId			= 480
--��һ�������ID
x500616_g_MissionIdNext	= 481
--��һ�������Index
x500616_g_MissionIndexNext	= 1018726
--��һ�������ScriptId
x500616_g_NextScriptId	= 006668
--��ȡ����Ŀ�����ڳ���
x500616_g_AcceptNPC_SceneID	=	0
--��ȡ����npc
x500616_g_Name 					= "����ʦ"
--�������
x500616_g_MissionKind			= 11
--����ȼ�
x500616_g_MissionLevel		= 48
--�Ƿ��Ǿ�Ӣ����
x500616_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x500616_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x500616_g_MissionName			= "��ʦ���ڴ�(10)"
--��������
x500616_g_MissionInfo			= "#{YD_20080421_14}"
--����Ŀ��
x500616_g_MissionTarget		= "#{YD_20080421_143}"
--δ��������npc�Ի�
x500616_g_ContinueInfo		= "#{YD_20080421_15}"
--�������npc˵�Ļ�
x500616_g_MissionComplete	= "#{YD_20080421_16}"
--������ɵĻ���
x500616_g_MaxRound	= 1
--���ƽű�
x500616_g_ControlScript		= 001066

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ
x500616_g_Custom	= { {id="������50��",num=1} }
--MisDescEnd

--�����Ƿ����
x500616_g_Mission_IsComplete = 0		--��������ĵ�0λ
--�Ƿ�ﵽ�ȼ��ı��
x500616_g_RecordIdx 				 = 1		--��������ĵ�1λ
--����ű��ż�¼
x500616_g_MissScriptID_Idx	 = 2		--��������ĵ�2λ
--���񷢲�NPC���
x500616_g_AcceptNPC_Idx			 = 3		--��������ĵ�3λ 1.����NPC

x500616_g_AcceptMission_IDX		= 787	--������������
x500616_g_CompleteMission_IDX	= 788	--�ύ��������

--��ӵ�е��¼�ID�б�
x500616_g_EventList	= {}

x500616_g_PlayerSlow_LVL					 = 48		-- �����������͵ȼ�

--����
x500616_g_MoneyBonus					=	1666
x500616_g_ExpBonus						= 6665

--**********************************
--������ں���
--**********************************
--����������ִ�д˽ű�
function x500616_OnDefaultEvent( sceneId, selfId, targetId )

	local	key	= GetNumText()	
	if key == x500616_g_AcceptMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
			x500616_NotifyTip( sceneId, selfId, "��������ʧ��" )					
			return 0
		end
		-- �����Ƿ�����
		if IsMissionFull( sceneId, selfId ) == 1 then
			x500616_NotifyTip( sceneId, selfId, "#{QIANXUN_INFO_23}" )
			return 0
		end
		
		-- ��������������
		if x500616_CheckAccept( sceneId, selfId, targetId )<=0 then
			return 0
		end

		-- ��������������			
		x500616_AcceptMission( sceneId, selfId, targetId )				
	
	elseif key == x500616_g_CompleteMission_IDX then
		--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
		if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
			x500616_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
			return 0
		end
		-- ����Ѿ���������
		if IsHaveMission( sceneId, selfId, x500616_g_MissionId) > 0 then
												
			--���������������Ϣ
			BeginEvent(sceneId)
				AddText(sceneId, x500616_g_MissionName)
				AddText(sceneId, x500616_g_ContinueInfo)			
			EndEvent( )
			
			local bDone = x500616_CheckSubmit( sceneId, selfId, targetId )				
			DispatchMissionDemandInfo(sceneId, selfId, targetId, x500616_g_ScriptId, x500616_g_MissionId, bDone)
			
		else			
			x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
			return 0
		end
	else
		x500616_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

end

--**********************************
--�о��¼�
--**********************************
function x500616_OnEnumerate( sceneId, selfId, targetId )

	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name
		 or sceneId ~= x500616_g_SceneID then
		 
		 return 0
	end

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) <= 0 then
		if IsMissionHaveDone( sceneId, selfId, x500616_g_MissionId ) <= 0
			 and LuaFnGetLevel( sceneId, selfId ) >= x500616_g_PlayerSlow_LVL then
			AddNumText( sceneId, x500616_g_ScriptId, x500616_g_MissionName, 1, x500616_g_AcceptMission_IDX )
		end
	else
		
		AddNumText( sceneId, x500616_g_ScriptId, x500616_g_MissionName, 2, x500616_g_CompleteMission_IDX )
	end

end

--**********************************
--������������Ҳ�����������
--**********************************
function x500616_CheckAccept( sceneId, selfId, targetId )
	
	--�������Ƿ���Ͻ������������
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
		x500616_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	--���ȼ�
	if LuaFnGetLevel( sceneId, selfId ) < x500616_g_PlayerSlow_LVL then
		local nStr = format( "#{YD_20080421_175}%d#{YD_20080421_176}", x500616_g_PlayerSlow_LVL )
		x500616_TalkInfo( sceneId, selfId, targetId, nStr )
		return 0
	end

	--�Ѿ��ӹ��򲻷�������
	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then
		-- x500616_TalkInfo( sceneId, selfId, targetId, "#{XSHCD_20080418_067}" )
		return 0
	end
	if IsMissionHaveDone( sceneId, selfId, x500616_g_MissionId ) > 0 then
		return 0
	end

	return 1
end

--**********************************
--���ܣ�����������������ù�������
--**********************************
function x500616_OnAccept( sceneId, selfId, targetId, scriptId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
 	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
 		x500616_NotifyTip( sceneId, selfId, "��������ʧ��" )					
		return 0
	end

	if x500616_CheckAccept( sceneId, selfId, targetId )<=0 then
		return 0
	end

	--������������б�
	local bAdd = AddMission( sceneId, selfId, x500616_g_MissionId, x500616_g_ScriptId, 0, 0, 0 )
	if bAdd >= 1 then

		--�õ���������к�
		local	misIndex		= GetMissionIndexByID( sceneId, selfId, x500616_g_MissionId )
		
		--�������кŰ���������ĵ�0λ��0 (����������)
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_Mission_IsComplete, 0 )
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_RecordIdx, 0 )
		--�������кŰ���������ĵ�2λ��Ϊ����ű���
		SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_MissScriptID_Idx, scriptId )		
		SetMissionByIndex(sceneId, selfId, misIndex, x500616_g_AcceptNPC_Idx, 1)

		local strText = "#{YD_20080421_229}" .. x500616_g_MissionName
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )

		-- �Ƿ�ﵽ50��
		local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	  if Playerlvl >= 50 then
			SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_Mission_IsComplete, 1 )
			SetMissionByIndex( sceneId, selfId, misIndex, x500616_g_RecordIdx, 1 )
			x500616_NotifyTip( sceneId, selfId, "#{YD_20080421_204}" )
		end

	end

	return 1

end

--**********************************
--�������������������
--**********************************
function x500616_OnAbandon( sceneId, selfId )

  if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then
	 	DelMission( sceneId, selfId, x500616_g_MissionId )
	end
	
	return 0

end

--**********************************
--����
--**********************************
function x500616_OnContinue( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	-- ��������Ƿ����
	if x500616_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then			
		return 0
	end
	
	BeginEvent(sceneId)
		AddText(sceneId,x500616_g_MissionName)
		AddText( sceneId, x500616_g_MissionComplete )				
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x500616_g_ScriptId,x500616_g_MissionId)
	
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x500616_CheckSubmit( sceneId, selfId, targetId )

	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) <= 0 then
		x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_178}" )
		return 0
	end

	-- �Ƿ�ﵽ50��
	local Playerlvl = LuaFnGetLevel( sceneId, selfId )
	if Playerlvl < 50 then
		x500616_TalkInfo( sceneId, selfId, targetId, "#{YD_20080421_205}" )
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x500616_g_MissionId)

	-- ��������Ƿ����	
	if GetMissionParam(sceneId, selfId, misIndex, x500616_g_Mission_IsComplete) > 0 then
		return 1
	end
	
	return 0
	
end

--**********************************
--�ύ���������������
--**********************************
function x500616_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_AccomplishNPC_Name then
		x500616_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )					
		return 0
	end

  -- ��������Ƿ����
	if x500616_CheckSubmit( sceneId, selfId, targetId ) ~= 1 then
		x500616_NotifyTip( sceneId, selfId, "�ύ����ʧ��" )				
		return 0
	end

	AddMoney( sceneId, selfId, x500616_g_MoneyBonus )
	LuaFnAddExp( sceneId, selfId, x500616_g_ExpBonus )

	-- ����˳�����
	x500616_NotifyTip( sceneId, selfId, "#{YD_20080421_180}" )

	if IsHaveMission( sceneId, selfId, x500616_g_MissionId ) > 0 then  	
	 	DelMission( sceneId, selfId, x500616_g_MissionId )
	 	-- ���������Ѿ�����ɹ�
	 	MissionCom( sceneId, selfId, x500616_g_MissionId )
	 	
	 	local strText = "#Y" .. x500616_g_MissionName .. "#{YD_20080421_230}"
		Msg2Player( sceneId, selfId, strText, MSG2PLAYER_PARA )
	 	
	 	-- ��������������ܽ���
	 	if IsHaveMission( sceneId, selfId, x500616_g_MissionIdNext ) <= 0 and IsMissionHaveDone( sceneId, selfId, x500616_g_MissionIdNext ) <= 0 then
	 		CallScriptFunction( x500616_g_NextScriptId, "OnDefaultEvent", sceneId, selfId, targetId, x500616_g_MissionIndexNext )
	 	end	 		 		 	
	end

end

--**********************************
--ɱ����������
--**********************************
function x500616_OnKillObject( sceneId, selfId, objdataId ,objId)--������˼�������š����objId�������λ�úš�����
end

--**********************************
--���������¼�
--**********************************
function x500616_OnEnterArea( sceneId, selfId, zoneId )	
end

--**********************************
--���߸ı�
--**********************************
function x500616_OnItemChanged( sceneId, selfId, itemdataId )
end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500616_AcceptDialog(sceneId, selfId, rand, g_Dialog, targetId )

	BeginEvent( sceneId )
		AddText( sceneId, g_Dialog )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

end

--**********************************
--���������ʾ�Ľ���
--**********************************
function x500616_SubmitDialog( sceneId, selfId, rand )
end

--**********************************
--��Ŀ��ʾ
--**********************************
function x500616_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

--**********************************
--��NPC�Ի�
--**********************************
function x500616_TalkInfo( sceneId, selfId, targetId, msg )

	BeginEvent(sceneId)
		AddText( sceneId, msg )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--ȡ�ñ��¼���MissionId������obj�ļ��жԻ��龰���ж�
--**********************************
function x500616_GetEventMissionId( sceneId, selfId )	
	return x500616_g_MissionId
end

function x500616_AcceptMission( sceneId, selfId, targetId )
	
	--�жϸ�npc�Ƿ��Ƕ�Ӧ�����npc
	if LuaFnGetName( sceneId, targetId ) ~= x500616_g_Name then
		x500616_NotifyTip( sceneId, selfId, "��������ʧ��" )
		return 0
	end

	local  PlayerName=GetName(sceneId,selfId)		
	
	--�����������ʱ��ʾ����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x500616_g_MissionName)
		AddText( sceneId, x500616_g_MissionInfo )
		AddText(sceneId,"#{M_MUBIAO}")
		AddText(sceneId,"#{YD_20080421_143}")
		AddText(sceneId,"#{M_SHOUHUO}")
		AddMoneyBonus( sceneId, x500616_g_MoneyBonus)
		
	EndEvent( )
	DispatchMissionInfo(sceneId,selfId,targetId,x500616_g_ScriptId,x500616_g_MissionId)	

end

--/////////////////////////////////////////////////////////////////////////////////////////////////////
--��ȡ����item����ϸ��Ϣ
function x500616_GetItemDetailInfo(itemId)
	return 0
end	

--**********************************
--����ʹ��
--**********************************
function x500616_OnUseItem( sceneId, selfId, bagIndex )	
end

--**********************************
--�����¼�
--**********************************
function x500616_OnDie( sceneId, selfId, killerId )
end
