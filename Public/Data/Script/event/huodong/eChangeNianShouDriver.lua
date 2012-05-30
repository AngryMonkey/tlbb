
-- �һ���Ʒ
x889051_g_scriptId = 889051

--�󶨵���Ƭ
x889051_g_SuiPian1ID = 30504022
--��ͨ����Ƭ
x889051_g_SuiPian2ID = 30504021
--�󶨵�ƴͼ��ID
x889051_g_FigureID1   = 30504024
--�ǰ󶨵�ƴͼ��ID
x889051_g_FigureID2   = 30504023
--�һ�ƴͼ��Ҫ����Ƭ����
x889051_g_FigureCount = 300

--�һ�����������Ҫ����Ƭ����
x889051_g_LowNianShouCount = 49

--�һ��м�������Ҫ��ƴͼ����
x889051_g_MiddleNianShouCount = 1

--�һ��߼�������Ҫ��ƴͼ����
x889051_g_HighNianShouCount = 15

--�ͼ�����ID
x889051_g_LowNianShouID = 10141800
--�м�����ID
x889051_g_MiddleNianShouID = 10141801
--�߼�����ID
x889051_g_HighNianShouID = 10141802

x889051_gGongGaoInfo ={
  "#{_INFOUSR%s}#cff99cc���ռ�����49��������Ƭ����#G������ʦ��81��117��#Y������#cff99cc���ϣ�һֻ#{_INFOMSG%s}#cff99cc�����ˡ�",
  "#{_INFOUSR%s}#cff99cc�ò�����˫�ֽ�1������ƴͼ����#G������ʦ��81��117��#Y������#cff99cc���ϣ�һֻ#{_INFOMSG%s}#cff99cc���������",
  "#{_INFOUSR%s}#cff99cc��15������ƴͼ����#G������ʦ��81��117��#Y������#cff99cc���ϣ�һֻ#{_INFOMSG%s}#cff99cc������ն�����",
}


--MisDescEnd

--�һ���������
function x889051_ChangeLowNianShou(sceneId, selfId, targetId)
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian1ID) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian2ID)
	--�����Ƿ�����Ʒ
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_02}")
		return
	end
	
	--�����Ƿ��㹻
	if (nCount<x889051_g_LowNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_03}")
		return
	end
	
	
		--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	
	--�۳���Ʒ
	-- ɾ����Ʒ ��ɾ���󶨵�
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889051_g_SuiPian1ID );
	if(BangdingNum >= x889051_g_LowNianShouCount) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian1ID, x889051_g_LowNianShouCount)
		if ret1 < 1  then
			return
		end
	elseif(BangdingNum == 0) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, x889051_g_LowNianShouCount)
		if ret1 < 1  then
			return
		end
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian1ID, BangdingNum)
		if ret1 < 1  then
			return
		end
		
		--ɾû�󶨵�
		local Delete = x889051_g_LowNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--����������Ʒ
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_LowNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,1)
	x889051_MsgBox( sceneId, selfId, "������������һ��ɹ�" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,1)
	x889051_CloseWindow(sceneId,selfId, targetId)
	
end
--�һ��������޵�����
function x889051_ChangeLowNianShouDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_PT_01}"
	--x889051_NotifyFailBox( sceneId, selfId, targetId, str)
	
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "ȷ��", 6, 11 )
		AddNumText( sceneId, x889051_g_scriptId, "ȡ��", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--�һ��м�����
function x889051_ChangeMiddleNianShou(sceneId, selfId, targetId)
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID1) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID2)
	--�����Ƿ�����Ʒ
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_06}")
		return
	end

	--�����Ƿ��㹻
	if (nCount<x889051_g_MiddleNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_07}")
		return
	end
	
		--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId, targetId,"#{NSDH_SP_04}" )
		return
	end
	--�۳���Ʒ
	-- ɾ����Ʒ ��ɾ���󶨵�
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889051_g_FigureID1 );

	if (BangdingNum >= x889051_g_MiddleNianShouCount) then
			
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID1, x889051_g_MiddleNianShouCount)
		if ret1 < 1  then
			return
		end
	elseif(BangdingNum == 0) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, x889051_g_MiddleNianShouCount)
		if ret1 < 1  then
			return
		end
			
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID1, BangdingNum)
		if ret1 < 1  then
			return
		end
		--ɾû�󶨵�
		local Delete = x889051_g_MiddleNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--����������Ʒ
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_MiddleNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,2)
	x889051_MsgBox( sceneId, selfId, "�м���������һ��ɹ�" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,2)
	x889051_CloseWindow(sceneId,selfId, targetId)
end

--�һ��м����޵�����
function x889051_ChangeMiddleNianShouDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_PT_05}"
	--x889051_NotifyFailBox( sceneId, selfId, targetId, str)

	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "ȷ��", 6, 12 )
		AddNumText( sceneId, x889051_g_scriptId, "ȡ��", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--�һ��߼�����
function x889051_ChangeHighNianShou(sceneId, selfId, targetId, targetId)
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID1) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID2)
	--�����Ƿ�����Ʒ
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_10}")
		return
	end
	
	--�����Ƿ��㹻
	if (nCount<x889051_g_HighNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_11}")
		return
	end
	
		--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	
	--�۳���Ʒ
	-- ɾ����Ʒ ��ɾ���󶨵�
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889051_g_FigureID1 )
	if(BangdingNum >= x889051_g_HighNianShouCount) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID1, x889051_g_HighNianShouCount)
		if ret1 < 1  then
			return
		end
	elseif(BangdingNum == 0) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, x889051_g_HighNianShouCount)
		if ret1 < 1  then
			return
		end
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID1, BangdingNum)
		if ret1 < 1  then
			return
		end
		
		--ɾû�󶨵�
		local Delete = x889051_g_HighNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--����������Ʒ
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_HighNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,3)
	x889051_MsgBox( sceneId, selfId, "�߼���������һ��ɹ�" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,3)
	x889051_CloseWindow(sceneId,selfId, targetId)
end

--�һ��߼����޵�����
function x889051_ChangeHighNianShouDescript(sceneId, selfId,targetId)
	local str = "#{NSDH_PT_09}"
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "ȷ��", 6, 13 )
		AddNumText( sceneId, x889051_g_scriptId, "ȡ��", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--�������ƴͼ
function x889051_CompositeFigure(sceneId, selfId, targetId)
	--LuaFnItemBind( sceneId, selfId, bagpos01 )
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian1ID) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian2ID)
	--�����Ƿ�����Ʒ
	
	if (nCount<=0) then
		
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_SP_02}" )
		return
	end
	
	--�����Ƿ��㹻
	if (nCount<x889051_g_FigureCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_SP_03}" )
		return
	end
	--��ⱳ���Ƿ��еط�....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	local IsBind = 0
	
	--�۳���Ʒ
	-- ɾ����Ʒ ��ɾ���󶨵�
	local BangdingNum = LuaFnGetAvailableItemCount( sceneId, selfId, x889051_g_SuiPian1ID );
	if(BangdingNum >= x889051_g_FigureCount) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian1ID, x889051_g_FigureCount)
		if ret1 < 1  then
			return
		end
		IsBind = 1
	elseif(BangdingNum == 0) then
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, x889051_g_FigureCount)
		if ret1 < 1  then
			return
		end
	else
		local ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian1ID, BangdingNum)
		if ret1 < 1  then
			return
		end
		
		--ɾû�󶨵�
		local Delete = x889051_g_FigureCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, Delete)
		if ret1 < 1  then
			return
		end
		
		IsBind = 1
	end
	
	--����������Ʒ
	BeginAddItem(sceneId)
		--�а󶨵ĸ�����Ʒ��û�а󶨵ĸ���ͨƴͼ
		if IsBind == 1 then
			AddItem( sceneId, x889051_g_FigureID1, 1 )
		else
			AddItem( sceneId, x889051_g_FigureID2, 1 )
		end
	local ret = EndAddItem(sceneId,selfId)
	if (ret<1) then
		return
	end
	AddItemListToHuman(sceneId,selfId)
	AuditCompositeFigure(sceneId,selfId)
	x889051_MsgBox( sceneId, selfId, "�������ƴͼ�ɹ�" )
	x889051_CloseWindow(sceneId,selfId, targetId)
end


--�������ƴͼ
function x889051_CompositeFigureDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_SP_01}"
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "ȷ��", 6, 14 )
		AddNumText( sceneId, x889051_g_scriptId, "ȡ��", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x889051_CloseWindow(sceneId,selfId, targetId)
	BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
end

--**********************************
--������ں���
--**********************************
function x889051_OnDefaultEvent( sceneId, selfId, targetId )

	local nNum = GetNumText()

	--�һ���������ĶԻ�
	if (nNum == 1 ) then
		x889051_ChangeLowNianShouDescript(sceneId, selfId, targetId)
	--�һ��м�����ĶԻ�
	elseif nNum == 2 then
		x889051_ChangeMiddleNianShouDescript(sceneId, selfId, targetId)
	--�һ��߼�����ĶԻ�
	elseif nNum == 3 then
		x889051_ChangeHighNianShouDescript(sceneId, selfId, targetId)
	--�������ƽͼ�ĶԻ�
	elseif nNum == 4 then
		x889051_CompositeFigureDescript(sceneId, selfId, targetId)
	--�һ���������
	elseif nNum == 11 then
		x889051_ChangeLowNianShou(sceneId, selfId, targetId)
	--�һ��м�����
	elseif nNum == 12 then
		x889051_ChangeMiddleNianShou(sceneId, selfId, targetId)
	--�һ��߼�����
	elseif nNum == 13 then
		x889051_ChangeHighNianShou(sceneId, selfId, targetId)
	--���ƴͼ
	elseif nNum == 14 then
		x889051_CompositeFigure(sceneId, selfId, targetId)
	elseif nNum == 21 then
		x889051_CloseWindow(sceneId, selfId, targetId)
	elseif nNum == 5 then
			local str = "#{NSDH_SM_01}"
			x889051_NotifyFailBox( sceneId, selfId, targetId, str )
	end 
end

--**********************************
--�о��¼�
--**********************************
function x889051_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x889051_g_scriptId, "�һ�������������̤��", 6, 1 )
	AddNumText( sceneId, x889051_g_scriptId, "�һ��м�������������", 6, 2 )
	AddNumText( sceneId, x889051_g_scriptId, "�һ��߼�������������", 6, 3 )
	AddNumText( sceneId, x889051_g_scriptId, "�������ƴͼ",     6, 4 )
	AddNumText( sceneId, x889051_g_scriptId, "������������һ���Ľ���", 11, 5 )
	
end

--**********************************
--����������
--**********************************
function x889051_CheckAccept( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889051_OnAccept( sceneId, selfId )

end

--**********************************
--����
--**********************************
function x889051_OnAbandon( sceneId, selfId )
end

--**********************************
--����
--**********************************
function x889051_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x889051_CheckSubmit( sceneId, selfId )
end

--**********************************
--�ͳ����ﵰ�Ĺ���
--**********************************
function x889051_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
	
	local PlayerName = GetName(sceneId,selfId)
	local str
	str = format( x889051_gGongGaoInfo[iIndex], PlayerName, strItemInfo)
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x889051_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--��Ŀ��Ϣ��ʾ
--**********************************
function x889051_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ύ
--**********************************
function x889051_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		
end

--**********************************
--ɱ����������
--**********************************
function x889051_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--���������¼�
--**********************************
function x889051_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x889051_OnItemChanged( sceneId, selfId, itemdataId )
end


