-- �������� 20090512
-- л�p

x889058_g_ScriptId = 889058;


-- ������ƷID
x889058_g_NeedItemID		= {
													30504101,		-- ��������(��)
													30504102,		-- ��������(��)
													30504103,		-- ��������(��)
													30504104,		-- ��������(��)
													30504105,		-- ��������(��)
													30504106,		-- ��������(��)
													}

-- �������
x889058_g_AwradInfo		=	{
	{ItemId = 10422016, LackItemMsg = "#{LHZD_090513_03}", RetDlg = "#{LHZD_090513_04}", Notice = "#{LHZD_090513_05}", BagFullDlg = "#{LHZD_090513_06}"},	-- ��¥��
--	{ItemId = 10423024, LackItemMsg = "#{LHZD_090513_07}", RetDlg = "#{LHZD_090513_08}", Notice = "#{LHZD_090513_09}", BagFullDlg = "#{LHZD_090513_17}"}	-- ��¥��
}


--**********************************
--�о��¼�
--**********************************
function x889058_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText( sceneId, x889058_g_ScriptId, "#{LHZD_090513_13}", 6, 10 )					-- ��ť�� ��������
	AddNumText( sceneId, x889058_g_ScriptId, "#{LHZD_090513_14}", 11, 11 )				-- ��ť�� �����������
	
end

--**********************************
--������ں���
--**********************************
function x889058_OnDefaultEvent( sceneId, selfId, targetId )

	local nNumText = GetNumText( )
	
	if( nNumText == 10 ) then
		-- ��� ��������
		-- BeginEvent( sceneId )
		-- AddText( sceneId, "#{LHZD_090513_01}#r" )
		-- for i, item in x889058_g_AwradInfo do
		-- 	AddRadioItemBonus( sceneId, item.ItemId, 1 )
		-- end
		-- EndEvent(sceneId)
		-- DispatchEventList( sceneId, selfId, targetId )
		-- DispatchMissionContinueInfo( sceneId, selfId, targetId, x889058_g_ScriptId, 0 )
		x889058_GiveGift( sceneId, selfId, targetId, 10422016 )
	elseif( nNumText == 11 ) then
		-- ��� �����������
		BeginEvent( sceneId )	
			AddText( sceneId, "#{LHZD_090513_12}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end
		
end


--**********************************
--���ضԻ�
--**********************************
function x889058_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889058_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--����
--**********************************
function x889058_OnAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x889058_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889058_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889058_CheckSubmit( sceneId, selfId )
	

	
end

--**********************************
--�ύ
--**********************************
function x889058_GiveGift( sceneId, selfId, targetId, selectRadioId )
	
	
	local LackItemMsg, RetDlg, Notice, BagFullDlg

	for i, ItemInfo in x889058_g_AwradInfo do
		if( ItemInfo.ItemId == selectRadioId ) then
			LackItemMsg		= ItemInfo.LackItemMsg
			RetDlg 				= ItemInfo.RetDlg
			Notice 				= ItemInfo.Notice
			BagFullDlg		= ItemInfo.BagFullDlg
			break
		end
	end
	
	-- �ж���Ʒ�Ƿ�
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnGetAvailableItemCount( sceneId, selfId, itemId ) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- ����Ʒ
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnDelAvailableItem( sceneId, selfId, itemId, 1) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- ��鱳���ռ�
	BeginAddItem(sceneId)
	AddItem(sceneId, selectRadioId, 1)
	local bBagOk = LuaFnEndAddItemIgnoreFatigueState(sceneId, selfId)
	if bBagOk < 1 then
		x889058_ReturnDlg( sceneId, selfId, targetId, BagFullDlg )
		return
	else
		-- �����Ʒ
		LuaFnAddItemListToHumanIgnoreFatigueState( sceneId, selfId )
		
		-- ֪ͨ
		x889058_Tips( sceneId, selfId, Notice )
		x889058_ReturnDlg( sceneId, selfId, targetId, RetDlg )
		
		-- ����
		local playerName = GetName(sceneId,selfId)
		local itemTransInfo = GetItemTransfer( sceneId, selfId, 0 )
		broadcastMsg	=	"#{_INFOUSR"..playerName.."}".."#{LHZD_090513_10}".."#{_INFOMSG"..itemTransInfo.."}".."#{LHZD_090513_11}"
	end
	
	BroadMsgByChatPipe( sceneId, selfId, broadcastMsg, 4 )
end
	

--**********************************
--ɱ����������
--**********************************
function x889058_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--���������¼�
--**********************************
function x889058_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889058_OnItemChanged( sceneId, selfId, itemdataId )
end

