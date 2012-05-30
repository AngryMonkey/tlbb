--NPC
--ʯɩ
--�䷽��Ʒ

x001157_g_scriptId = 001157
x001157_g_shoptableindex = 184

x001157_g_SegmentID = 30505706
x001157_g_JewelryID = 30501173
x001157_g_FractionSegmentID = 30501172

--**********************************
--�¼��������
--**********************************
function x001157_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		AddText( sceneId, "  ���������£����ռ�����Щ�䷽��" )
--**********************************
--NPC�԰�
--**********************************
		AddNumText( sceneId, x001157_g_scriptId, "���������Ķ���", 7, 0 )
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_01}", 6, 1 )--�������
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_02}", 6, 2 )--�ϳ����
		AddNumText( sceneId, x001157_g_scriptId, "����ϳ�", 6, 14 )
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_03}", 11, 16 )--������ڰ���
		--AddNumText( sceneId, x001157_g_scriptId, "#{SJHC_081106_04}", 11, 17 )--�ϳ���ڰ���
		AddNumText( sceneId, x001157_g_scriptId, "����ϳɽ���", 11, 15 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001157_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 0 then
		DispatchShopItem( sceneId, selfId, targetId, x001157_g_shoptableindex )
	end
	
	--������ڽ���
	--if GetNumText() == 1 then
		--BeginEvent(sceneId)						
			--AddText(sceneId,"#{SJHC_081106_05}")
			--AddNumText(sceneId, x001157_g_scriptId, "ȷ��", 8, 3 )
			--AddNumText(sceneId, x001157_g_scriptId, "ȡ��", 8, 4 )
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return
	--end
	
	--�ϳ���ڽ���
	--if GetNumText() == 2 then
		--BeginEvent(sceneId)						
			--AddText(sceneId,"#{SJHC_081106_09}")
			--AddNumText(sceneId, x001157_g_scriptId, "ȷ��", 8, 5 )
			--AddNumText(sceneId, x001157_g_scriptId, "ȡ��", 8, 4 )
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return
	--end
	
	--�������ȷ��
--	if GetNumText() == 3 then
		--x001157_FractionSegment( sceneId, selfId, targetId )
		--return
	--end
	
	--ȡ��
	--if GetNumText() == 4 then
	--	BeginUICommand( sceneId )
		--	UICommand_AddInt( sceneId, targetId )
		--EndUICommand( sceneId )
		--DispatchUICommand( sceneId, selfId, 1000 )
		--return
	--end
	
	--�ϳ����ȷ��
	--if GetNumText() == 5 then
		--x001157_ComposeSegment( sceneId, selfId, targetId )
		--return
	--end
	
	if GetNumText() == 15 then
		BeginEvent(sceneId)						
			AddText(sceneId,"#{HY_20080602_001}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end	
	
	if GetNumText() == 14 then
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 86021935 )
		return
	end
	
	--������ڰ���
	--if GetNumText() == 16 then
	--	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_15}" )
	--	return
	--end	
	
	--�ϳ���ڰ���
	--if GetNumText() == 17 then
		--x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_16}" )
	--	return
	--end	
	
end

--**********************************
--�������
--**********************************
function x001157_FractionSegment( sceneId, selfId, targetId )
	
	--�Ƿ������
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_SegmentID ) <= 0 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_06}" )
		return
	end
	
	--�Ƿ���������
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_JewelryID ) <= 0 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_07}" )
		return
	end
	
	--���ϵ���������
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		x001157_NotifyFailTips( sceneId, selfId, "#{STZDY_20080513_23}" )
		return
	end
	
	--��һ����ڵ���Ʒ���ӣ��ɲο�city0_building5.lua 606~613
	local SegmentInfo = ""
	local JewelryInfo = ""
	local MaxEquipIndex = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_SegmentID then
			SegmentInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	--��һ�����������Ʒ����
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_JewelryID then
			JewelryInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	
	--�۳���Ʒ
	if LuaFnDelAvailableItem( sceneId, selfId, x001157_g_SegmentID, 1 ) ~= 1 or
		LuaFnDelAvailableItem( sceneId, selfId, x001157_g_JewelryID, 1 ) ~= 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    �۳���Ʒʧ�ܣ�" )
		return
	end
	
	--����Ʒ
	local FractionSegmentIndex = TryRecieveItem( sceneId, selfId, x001157_g_FractionSegmentID, QUALITY_MUST_BE_CHANGE )
	if FractionSegmentIndex == -1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		return
	end
	local FractionSegmentInfo = GetBagItemTransfer( sceneId, selfId, FractionSegmentIndex )
	AuditSegment(sceneId, selfId, 1)
	
	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_08}" )
	
	local message = format("#{_INFOUSR%s}#{DSSJ_1}#{_INFOMSG%s}#{DSSJ_2}#{_INFOMSG%s}#{DSSJ_3}#{_INFOMSG%s}#{DSSJ_4}",LuaFnGetName(sceneId, selfId),JewelryInfo,SegmentInfo,FractionSegmentInfo)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
--�ϳ����
--**********************************
function x001157_ComposeSegment( sceneId, selfId, targetId )
	
	--�Ƿ��������Ƭ
	if LuaFnGetAvailableItemCount( sceneId, selfId, x001157_g_FractionSegmentID ) < 5 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_10}" )
		return
	end
	
	--���ϵ���������
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		x001157_NotifyFailTips( sceneId, selfId, "#{STZDY_20080513_23}" )
		return
	end
	
	--��һ����Ƭ����Ʒ���ӣ��ɲο�city0_building5.lua 606~613
	local FractionSegmentInfo = ""
	local MaxEquipIndex = LuaFnGetMaterialStartBagPos(sceneId, selfId)
	for i = 0, MaxEquipIndex - 1 do
		if LuaFnGetItemTableIndexByIndex( sceneId, selfId, i ) == x001157_g_FractionSegmentID then
			FractionSegmentInfo = GetBagItemTransfer( sceneId, selfId, i )
			break
		end
	end
	
	--�۳���Ʒ
	if LuaFnDelAvailableItem( sceneId, selfId, x001157_g_FractionSegmentID, 5 ) ~= 1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    �۳���Ʒʧ�ܣ�" )
		return
	end
	
	--����Ʒ
	local BagIndex = TryRecieveItem( sceneId, selfId, x001157_g_SegmentID, QUALITY_MUST_BE_CHANGE )
	if BagIndex == -1 then
		x001157_NotifyFailBox( sceneId, selfId, targetId, "    #{STZDY_20080513_23}" )
		return
	end
	local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
	AuditSegment(sceneId, selfId, 2)
	
	x001157_NotifyFailBox( sceneId, selfId, targetId, "#{SJHC_081106_11}" )
	
	local message = format("#{_INFOUSR%s}#{SJHC_081106_12}#{_INFOMSG%s}#{SJHC_081106_13}#{_INFOMSG%s}#{SJHC_081106_14}",LuaFnGetName(sceneId, selfId),FractionSegmentInfo,ItemInfo)
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x001157_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x001157_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
