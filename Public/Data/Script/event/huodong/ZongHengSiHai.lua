--�ݺ��ĺ�
--л�p

x889056_g_ScriptId = 889056;

--��������� 2009-4-8
x889056_g_BeginTime		= 20090408
x889056_g_EndTime		= 20090531

--�����²���
x889056_g_PartID		= 30504076
x889056_g_NeedPartCount	= 4

--������
x889056_g_ItemID		= 10423050

--**********************************
--�о��¼�
--**********************************
function x889056_OnEnumerate( sceneId, selfId, targetId )
	
	if x889056_IsInActTime( sceneId, selfId ) > 0 then
		AddNumText(sceneId, x889056_g_ScriptId, "#{J_ZHSH_090317_1}", 6, 1);
	end
	
end

--**********************************
--������ں���
--**********************************
function x889056_OnDefaultEvent( sceneId, selfId, targetId )
	
	local opt = GetNumText();
	if opt == 1 then
		BeginEvent(sceneId)			
			AddText(sceneId, "#{J_ZHSH_090317_3}");
			AddNumText(sceneId, x889056_g_ScriptId, "#{J_ZHSH_090317_2}", 6, 11);		--�������˰�
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif opt == 11 then
		if x889056_IsJoined( sceneId, selfId ) == 1 then
			x889056_ReturnDlg(sceneId, selfId, targetId, "#{J_ZHSH_090317_4}")
		else
			x889056_GivePrize( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
-- �Ƿ��Ѿ��μӹ��
--**********************************
function x889056_IsJoined( sceneId, selfId )

	return GetMissionFlag( sceneId, selfId, MF_TW_ZONGHENGSIHAI_JOIN )
	
end

--**********************************
-- �����Ѿ��μӹ��
--**********************************
function x889056_SetJoined( sceneId, selfId )

	return SetMissionFlag( sceneId, selfId, MF_TW_ZONGHENGSIHAI_JOIN, 1 )
	
end

--**********************************
--�Ƿ��ڻʱ���ڣ����򷵻ص������ڣ����򷵻�0
--**********************************
function x889056_IsInActTime( sceneId, selfId )

	local curDate = GetTime2Day()
	if curDate >= x889056_g_BeginTime and curDate <= x889056_g_EndTime then
		return curDate
	else
		return 0
	end
	
end

--**********************************
--����
--**********************************
function x889056_GivePrize( sceneId, selfId, targetId )

	-- �Ƿ��ڻʱ����
	if x889056_IsInActTime( ) <= 0 then
		x889056_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- ��Ʒ�Ƿ�
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889056_g_PartID) < x889056_g_NeedPartCount then
		x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_5}" )
		return
	end
	
	-- ��鱳���ռ�
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_6}" )
		return
	end
	
	-- ɾ����Ʒʧ�ܣ�δ֪ԭ�򣬹رնԻ�����
	if LuaFnDelAvailableItem(sceneId, selfId, x889056_g_PartID, x889056_g_NeedPartCount) == 0 then
		x889056_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- ����Ʒ���رմ���
	TryRecieveItem( sceneId, selfId, x889056_g_ItemID, QUALITY_MUST_BE_CHANGE )
	
	x889056_SetJoined( sceneId, selfId )
	
	x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_7}" )
	
end

--**********************************
--�رնԻ���
--**********************************
function x889056_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--���ضԻ�
--**********************************
function x889056_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889056_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--����
--**********************************
function x889056_OnAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889056_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889056_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889056_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x889056_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--ɱ����������
--**********************************
function x889056_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x889056_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889056_OnItemChanged( sceneId, selfId, itemdataId )
end

