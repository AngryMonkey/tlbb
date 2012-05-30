-- 125021
-- ������ �������ܣ��һ�����
x125021_g_ScriptId = 125021

--����֮ӡ		Buff6_1		30505143
--ͭ����		Girdle3_4		10421018
--������		Girdle3_3		10421019
--������		Girdle3_2		10421020
--�߱�����	Girdle3_1		10421021

x125021_g_StoneId = 30505143

x125021_g_Item_1 = 10421018
x125021_g_Item_2 = 10421019
x125021_g_Item_3 = 10421020
x125021_g_Item_4 = 10421021

x125021_g_Exp = 50000

--**********************************
--�о��¼�
--**********************************
function x125021_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText( sceneId, x125021_g_ScriptId, "����ͭ�����һ�����֮ӡ", 12, 1 )
	AddNumText( sceneId, x125021_g_ScriptId, "�����������һ�����֮ӡ", 12, 2 )
	AddNumText( sceneId, x125021_g_ScriptId, "�����������һ�����֮ӡ", 12, 3 )

	AddNumText( sceneId, x125021_g_ScriptId, "����Ϊ����ͭ����", 6, 7 )
	AddNumText( sceneId, x125021_g_ScriptId, "����Ϊ����������", 6, 4 )
	AddNumText( sceneId, x125021_g_ScriptId, "����Ϊ����������", 6, 5 )
	AddNumText( sceneId, x125021_g_ScriptId, "����Ϊ�����߱�����", 6, 6 )
end

--**********************************
--������ں���
--**********************************
function x125021_OnDefaultEvent( sceneId, selfId, targetId )
	local Num = GetNumText()
	if Num == 1  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B����ͭ�����һ�����֮ӡ");
      AddText(sceneId,"  1������ͭ�������Զһ�1������֮ӡ");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 10 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
	
	elseif Num == 2  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B�����������һ�����֮ӡ");
      AddText(sceneId,"  1���������������Զһ�10������֮ӡ");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 11 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
		
	elseif Num == 3  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B�����������һ�����֮ӡ");
      AddText(sceneId,"  1���������������Զһ�100������֮ӡ");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 12 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 4  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B����Ϊ����������");
      AddText(sceneId,"  ������Ϊ������������Ҫ���ģ�#r#G    1������ͭ����#r    9������֮ӡ#r    ��ȷ��Ҫ������");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 13 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 5  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B����Ϊ����������");
      AddText(sceneId,"  ������Ϊ������������Ҫ���ģ�#r#G    1������������#r    90������֮ӡ#r    #{_EXCHG"..tostring(500000).."}#W#r  ��ȷ��Ҫ������");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 14 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 6  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B����Ϊ�����߱�����");
      AddText(sceneId,"  ������Ϊ�����߱�������Ҫ���ģ�#r#G    1������������#r    400������֮ӡ#r    #{_EXCHG"..tostring(1000000).."}#W#r  ��ȷ��Ҫ������");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 15 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 7  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B����Ϊ����ͭ����");
      AddText(sceneId,"  ������Ϊ����ͭ������Ҫ���ģ�#r#G    40������ͭ������Ƭ#W#r  ��ȷ��Ҫ������");
      AddNumText( sceneId, x125021_g_ScriptId, "ȷ��", 8, 16 )
      AddNumText( sceneId, x125021_g_ScriptId, "ȡ��", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
	end
		
	if Num == 10  then
    x125021_ChangeItem( sceneId, selfId, 1 )
	elseif Num == 11  then
    x125021_ChangeItem( sceneId, selfId, 2 )
	elseif Num == 12  then
		x125021_ChangeItem( sceneId, selfId, 3 )
	end
	
	if Num == 13  then
		x125021_UpdateItem( sceneId, selfId, 1 )
	elseif Num == 14  then
		x125021_UpdateItem( sceneId, selfId, 2 )
	elseif Num == 15  then
		x125021_UpdateItem( sceneId, selfId, 3 )
	end	
	
	if Num == 16  then
		x125021_StoneToItem(sceneId, selfId)
	end
	
	if Num == 20  then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end

end

--**********************************
-- ��Ƭ������
--**********************************
function x125021_StoneToItem(sceneId, selfId)
	
	BeginAddItem(sceneId)
		AddItem( sceneId, x125021_g_Item_1, 1 )
	local ret = EndAddItem(sceneId,selfId)
	
	-- ������Ƭ��ID
	local nStoneId = 40004434
	if ret > 0  then
		if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=40 then
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,40)
			AddItemListToHuman(sceneId,selfId)
			x125021_DispatchTips(sceneId,selfId,1)
			-- ���һ���һ���־
			LuaFnAuditPlayerBehavior(sceneId, selfId, "��Ƭ������");
		else
			x125021_DispatchTips(sceneId,selfId,0)
		end
		
	else
		x125021_DispatchTips(sceneId,selfId,-2)
	end
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end

--**********************************
--x125021_UpdateItem
--**********************************
function x125021_UpdateItem( sceneId, selfId, nIndex )
	if nIndex == 1  then
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_2, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=9 and
				LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_1)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,9)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_1,1)
				
				AddItemListToHuman(sceneId,selfId)
				-- ���װ��������־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "ͭ������������");

		    	x125021_DispatchTips(sceneId,selfId,1)
				return
			end
		end
		
	elseif nIndex == 2  then
		
		if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId) < 500000   then  
			x125021_DispatchTips(sceneId,selfId,-1)
			return
		end
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_3, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=90 and
				LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_2)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,90)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_2,1)
				
				-- ��G
				--CostMoney(sceneId,selfId,500000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 500000 )  
				
				AddItemListToHuman(sceneId,selfId)
				-- ���װ��������־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "��������������");

		    	x125021_DispatchTips(sceneId,selfId,1)
				return
			end
		end
		
	elseif nIndex == 3  then
		
		if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId)< 1000000   then
			x125021_DispatchTips(sceneId,selfId,-1)
			return
		end
	
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_Item_4, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_StoneId)>=400 and
					LuaFnGetAvailableItemCount(sceneId,selfId,x125021_g_Item_3)>=1  then
				
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_StoneId,400)
				LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_3,1)
				
				-- ��G
				--CostMoney(sceneId,selfId,1000000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 1000000 )  
				AddItemListToHuman(sceneId,selfId)
				
				
				-- ���װ��������־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "���������߱�����");
	    	x125021_DispatchTips(sceneId,selfId,1)
		    	
		    -- �������繫��
				local szTransferEquip = GetItemTransfer(sceneId,selfId,0)
		    
				local str = ""
				str = format("#P�ھ����󺰣�����Ӣ���ǣ�ΰ���Ӣ��#{_INFOUSR%s}�������ڷ���̨��ԡѪ��ս������Ӯ�����������������ı�־��#{_INFOMSG%s}��", GetName(sceneId,selfId), szTransferEquip)
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
		    
				return
			end
		end
		
	end
	
  x125021_DispatchTips(sceneId,selfId,0)
  
end

--**********************************
--x125021_ChangeItem
--**********************************
function x125021_ChangeItem( sceneId, selfId, nIndex )
	if nIndex == 1  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_1,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--��Ӷһ���־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "ͭ������1����ӡ");
			    x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	elseif nIndex == 2  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 10 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_2,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--��Ӷһ���־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "��������10����ӡ");
			    x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	elseif nIndex == 3  then
		BeginAddItem(sceneId)
			AddItem( sceneId, x125021_g_StoneId, 100 )
		local ret = EndAddItem(sceneId,selfId)
		if ret > 0  then
			if LuaFnDelAvailableItem(sceneId,selfId,x125021_g_Item_3,1) == 1  then
				AddItemListToHuman(sceneId,selfId)
				--��Ӷһ���־
				LuaFnAuditPlayerBehavior(sceneId, selfId, "��������100����ӡ");
			  	x125021_DispatchTips(sceneId,selfId,1)
			    return
			end
		end
		
	end
	
 	x125021_DispatchTips(sceneId,selfId,0)  
  return
  
end

function x125021_DispatchTips(sceneId,selfId,bOk)
	if bOk == 0  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"�һ�ʧ�ܣ�������Ʒ�Ƿ��㹻�һ���");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -1  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"��Ǯ����");    
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -2  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"��ı���û�пռ��ˡ�");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	else
	  BeginEvent(sceneId)
	    AddText(sceneId,"�һ��ɹ���");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	end
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
