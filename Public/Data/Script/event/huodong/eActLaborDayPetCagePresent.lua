--------------------------------------------
--Title��	2008 5.1��ű� ֮ ��������
--Author��	����
--Date��	2008-04-15
--------------------------------------------

--�ű���
x808092_g_ScriptId = 808092

--sceneId List
--9		������
--10	ؤ���ܶ�
--11	������
--12	�䵱ɽ
--13	������
--14	�貨��
--15	����ɽ
--16	���޺�
--17	��ɽ

--MenPaiId List
--0		����
--1		����
--2		ؤ��
--3		�䵱
--4		����
--5		����
--6		����
--7		��ɽ
--8		��ң
--9		��׼

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

function x808092_Scene2MenPaiID( sceneId )
	if (sceneId == 9) then
		return 0
	elseif (sceneId == 10) then
		return 2
	elseif (sceneId == 11) then
		return 1
	elseif (sceneId == 12) then
		return 3
	elseif (sceneId == 13) then
		return 6
	elseif (sceneId == 14) then
		return 8
	elseif (sceneId == 15) then
		return 4
	elseif (sceneId == 16) then
		return 5
	elseif (sceneId == 17) then
		return 7
	end
end

--**********************************
--������ں���
--**********************************
function x808092_OnDefaultEvent( sceneId, selfId, targetId )
	local ItemID = GetNumText()	
	if(ItemID == 808092000) then
		BeginEvent(sceneId)
			AddText(sceneId, "#{SL_20080416_12}")
			AddNumText( sceneId, x808092_g_ScriptId, "��Ҫ��ȡ����", 6, 808092002 )
			AddNumText( sceneId, x808092_g_ScriptId, "�������˰�", 11, 808092003 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif(ItemID == 808092001) then
		BeginEvent(sceneId)
			AddText(sceneId,"#{SL_20080416_11}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif(ItemID == 808092002) then
		--�һ�����
		local condition = x808092_CheckActivityCondition(sceneId, selfId, targetId)
		
		if (condition == 0) then
			if(x808092_PresentPetCage(sceneId, selfId) == 1) then
				--AuditPetCageActivity(sceneId, selfId)
				BeginEvent(sceneId)
					AddText(sceneId, "#{SL_20080416_19}")
				EndEvent( sceneId )
				DispatchEventList( sceneId, selfId, targetId )
				x808092_PresentPetCageBuffer(sceneId, selfId)
				SetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT, 1)
				AuditPetCagePresent(sceneId, selfId)
			end
			
		--��ȡ������ʱ���Ѿ�����
		elseif (condition == 1) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_14}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--�Ѿ��һ���������
		elseif(condition == 2) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_16}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--û��ǩ����
		elseif(condition == 3) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_13}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)

		--�Ǳ��ŵ���
		elseif(condition == 4) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_15}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
			
		--��Ч��δ��ʧ
		elseif(condition == 5) then
			BeginEvent(sceneId)
				AddText(sceneId, "#{SL_20080416_17}")
			EndEvent(sceneId)
			DispatchEventList(sceneId, selfId, targetId)
		end
		
	elseif(ItemID == 808092003) then
		--�رս���
		DispatchUICommand(sceneId, selfId, 1000)
	end	
end

--**********************************
--�о��¼�
--**********************************
function x808092_OnEnumerate( sceneId, selfId, targetId )
	if (x808092_IsActivityTimeOut() == 0) then
		AddNumText(sceneId, x808092_g_ScriptId, "��ů����ʦ������", 1, 808092000 )
		AddNumText(sceneId, x808092_g_ScriptId, "��ů����ʦ����������", 11, 808092001 )	
	end
end

--**********************************
--����Ƿ����
--**********************************
function x808092_IsActivityTimeOut( )
	local curDayTime = GetTime2Day()
	if (curDayTime < GlobalLaborDayActivityTable.PetCagePresentStartTime) then 
		return 1
	
	elseif (curDayTime > GlobalLaborDayActivityTable.PetCagePresentEndTime) then
		return 1
	end
	return 0
end

--**********************************
--��ȡ����
--**********************************
function x808092_PresentPetCage(sceneId, selfId, targetId)	
	--���߱�������
	local condition = x808092_CheckPresentCageCondition(sceneId, selfId)
	if (condition == 0) then
		--��ɾ���������
		LuaFnDelAvailableItem(sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID, 1)

		--����������....
		local bagIndex = TryRecieveItem( sceneId, selfId, GlobalLaborDayActivityTable.PetCageLv1, QUALITY_MUST_BE_CHANGE )
		if bagIndex > 0 then
			LuaFnItemBind( sceneId, selfId, bagIndex)
		end

		--��������Լ�
		BroadMsgByChatPipe( sceneId, selfId, "��ɹ��һ�һ��һ������", MSG2PLAYER_PARA )	
		
		--��Ŀ��ʾ
		BeginEvent( sceneId )
			AddText( sceneId, "��ɹ��һ�һ��һ������" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		
		x808092_PresentPetCageBuffer(sceneId, selfId)
		return 1
	elseif (condition == 1) then
		BeginEvent(sceneId)
			AddText(sceneId, "��ĵ��߱����Ѿ����ˣ�����һ��������")
		EndEvent(sceneId)
		DispatchEventList(sceneId, selfId, targetId)
		return 0
	end
	return 0
	
end


--**********************************
--�����������
--**********************************
function x808092_CheckActivityCondition(sceneId, selfId)
	--��ȡ������ʱ���Ѿ�����
	if (x808092_IsActivityTimeOut() == 1) then
		return 1
	end

	--�Ѿ��һ���������
	local flag = GetMissionFlag(sceneId, selfId, MF_LABORDAY_PETCAGE_GIFT)
	if(flag > 0) then
		return 2
	end

	--û��ǩ����
	local card_count = GetItemCount( sceneId, selfId, GlobalLaborDayActivityTable.PetCageCardID )
	if (card_count < 1) then
		return 3
	end

	--�Ǳ��ŵ���
	local menpaiId = GetMenPai(sceneId, selfId)
	local curSceneMenPaiId = x808092_Scene2MenPaiID(sceneId)
	if ( menpaiId ~= curSceneMenPaiId ) then
		return 4
	end
	
	--��Ч��δ��ʧ
	local hasImapct = LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, GlobalLaborDayActivityTable.PetCageDelayBuff)
	if ( hasImapct > 0 ) then
		return 5
	end

	return 0
end

--**********************************
--������������Ʒ���
--**********************************
function x808092_CheckPresentCageCondition(sceneId, selfId)
	--���߰����Ѿ�����
	if (LuaFnGetPropertyBagSpace(sceneId, selfId) < 1) then
		return 1
	end
	return 0
end

--**********************************
--�����ȡ�ɹ���Ч��
--**********************************
function x808092_PresentPetCageBuffer(sceneId, selfId)
	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 49, 0 )
end
