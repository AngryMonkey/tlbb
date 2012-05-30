---------------------------------------------------
--Name��	2008 5.1��ű� ֮ ǩ���ƶһ�
--Author��	����
--Date��	2008-04-15
---------------------------------------------------

--�ű���
x808091_g_ScriptId = 808091

--��ȡ����Ч��ID

--GlobalLaborDayActivityTable = {
--	PetCageCardID					= 40004446,
--	PetCageLv1 						= 30509500,
--	PetCageDelayBuff 				= 30187,
--	PetCagePresentStartTime 		= 20080415, --�һ�������ʼʱ��
--	PetCagePresentEndTime 			= 20080417, --�һ���������ʱ��
--	CardPresentStartTime 			= 20080417,	--ǩ���ƿ�ʼ�һ�ʱ��
--	CardPresentEndTime 				= 20080417,	--ǩ���ƽ����һ�ʱ��
--	MailStartDayTime 				= 20080415,	--�����ʼ���ʼʱ��
--	MailEndDayTime 					= 20080418	--�����ʼ�����ʱ��
--}

--**********************************
--������ں���
--**********************************
function x808091_OnDefaultEvent( sceneId, selfId, targetId )

	local ItemID = GetNumText()
	if(ItemID == 808091001) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SL_20080416_06}")
			AddNumText( sceneId, x808091_g_ScriptId, "��Ҫ�μ�", 6, 808091003 )
			AddNumText( sceneId, x808091_g_ScriptId, "�������˰�", 13, 808091004 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	--�����
	elseif(ItemID == 808091002) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SL_20080416_11}")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)

	elseif(ItemID == 808091003) then
	
		local condition = x808091_CheckActivityCondition(sceneId, selfId)
		
		--���Ŷһ�ǩ���ƣ�����һ��50���ӵ�buf
		if condition == 0 then
			local is_suc = x808091_PresentPetCageCard(sceneId, selfId, targetId)
			if(is_suc == 1) then
				BeginEvent(sceneId)
					AddText(sceneId, "#{SL_20080416_10}")
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
			end

		--�һ�ǩ���Ƶ�ʱ���Ѿ�����
		elseif(condition == 1) then
			BeginEvent(sceneId)
				AddText(sceneId, "�Բ���ʦ�������Ѿ������һ�ǩ�����˰�")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			
		--�Ѿ��μӹ��һ�ǩ���ƵĻ��, �����Ѿ��һ�������
		elseif(condition == 2) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_09}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
	
		--�Ѿ��μӣ��������ϻ�����ǩ����
		elseif(condition == 3) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_08}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
				
		--�㻹û�м���������
		elseif(condition == 4) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_07}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)	
		end

	elseif(ItemID == 808091004) then
		--�رս���
		DispatchUICommand(sceneId, selfId, 1000)
	end
end

--**********************************
--�о��¼�
--**********************************
function x808091_OnEnumerate( sceneId, selfId, targetId )
	if (x808091_IsActivityTimeOut() == 0) then
		AddNumText( sceneId, x808091_g_ScriptId, "��ů����ʦ������", 6, 808091001 )
		AddNumText( sceneId, x808091_g_ScriptId, "��ů����ʦ����������", 11, 808091002 )
	end
end

--**********************************
--�����������
--**********************************
function x808091_CheckActivityCondition(sceneId, selfId)
	--�һ�ǩ���Ƶ�ʱ���Ѿ�����
	if (x808091_IsActivityTimeOut() == 1) then
		return 1
	end
		
	--�Ѿ��һ���������
	local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT)
	if(flag > 0) then
		return 2
	end
	
	--���ϻ�����ǩ����
	local card_count = GetItemCount(sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID)
	if (card_count >= 1) then
		return 3
	end
	
	--�㻹û�м���������
	local mp_id = GetMenPai(sceneId, selfId)
	if (mp_id == 9) then
		return 4
	end
		
	return 0
end

--**********************************
--������Ͷһ��Ƶ����
--**********************************
function x808091_CheckPresentCardCondition(sceneId, selfId)
	--������񱳰��Ƿ��еط�
	if (LuaFnGetTaskItemBagSpace( sceneId, selfId ) < 1 ) then
		return 1
	end	
	return 0
end

--**********************************
--������Buff�����
--**********************************
function x808091_CheckBuffCondition(sceneId, selfId)
	return 0
end


--**********************************
--����Ƿ����
--**********************************
function x808091_IsActivityTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.CardPresentStartTime) then 
		return 1
	
	elseif (curDayTime > GlobalLaborDayActivityTable.CardPresentEndTime) then
		return 1
	end
	return 0
end

--**********************************
--����ʼ�֪ͨʱ���Ƿ����
--**********************************
function x808091_IsMailTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.MailStartDayTime) then
		return 1
	elseif (curDayTime > GlobalLaborDayActivityTable.MailEndDayTime) then
		return 1
	end
	return 0
end

--**********************************
--���Ͷһ��ƣ���buff
--**********************************
function x808091_PresentPetCageCard(sceneId, selfId, targetId)

	local present_card_condition = x808091_CheckPresentCardCondition(sceneId, selfId)

	--������Ӷһ���
	if (present_card_condition == 0) then
		--����һ��"��ҽ���"
		BeginAddItem(sceneId)
			AddItem(sceneId, GlobalLaborDayActivityTable.PetCageCardID, 1)
		EndAddItem(sceneId, selfId)
		AddItemListToHuman(sceneId, selfId)--����Ʒ�����
		
		--��������Լ�
		BroadMsgByChatPipe( sceneId, selfId, "����һ����������ǩ����", MSG2PLAYER_PARA )	
		
		--��Ŀ��ʾ
		BeginEvent( sceneId )
			AddText( sceneId, "����һ����������ǩ���ơ�" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		--���50���ӵ���Ч
		x808091_PresentPetCageBuffer(sceneId, selfId)
		return 1
	
	--������Ʒ�����ռ䲻��
	elseif(present_card_condition == 1) then		
		BeginEvent(sceneId)
			AddText(sceneId, "������񱳰��Ѿ�������������һ�°�")
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return 0
	end
	
end

--**********************************
--�������Ӷһ�Buff
--**********************************
function x808091_PresentPetCageBuffer(sceneId, selfId)
	LuaFnCancelSpecificImpact( sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff )
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff, 100 )
end

--**********************************
--������ҷ��ʼ�
--**********************************
function x808091_OnPlayerLogin( sceneId, selfId )
	if ( x808091_IsMailTimeOut() == 0 ) then
		local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL)
		if (flag == 0) then
			LuaFnSendSystemMail( sceneId, GetName( sceneId, selfId ), "#{SL_20080416_01}" )
			SetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_MAIL, 1)
		end
	end
end
