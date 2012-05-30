-- 125021
-- 竞技场 辅助功能，兑换腰带
x125021_g_ScriptId = 125021

--盟主之印		Buff6_1		30505143
--铜腰带		Girdle3_4		10421018
--银腰带		Girdle3_3		10421019
--金腰带		Girdle3_2		10421020
--七宝腰带	Girdle3_1		10421021

x125021_g_StoneId = 30505143

x125021_g_Item_1 = 10421018
x125021_g_Item_2 = 10421019
x125021_g_Item_3 = 10421020
x125021_g_Item_4 = 10421021

x125021_g_Exp = 50000

--**********************************
--列举事件
--**********************************
function x125021_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText( sceneId, x125021_g_ScriptId, "盟主铜腰带兑换盟主之印", 12, 1 )
	AddNumText( sceneId, x125021_g_ScriptId, "盟主银腰带兑换盟主之印", 12, 2 )
	AddNumText( sceneId, x125021_g_ScriptId, "盟主金腰带兑换盟主之印", 12, 3 )

	AddNumText( sceneId, x125021_g_ScriptId, "升级为盟主铜腰带", 6, 7 )
	AddNumText( sceneId, x125021_g_ScriptId, "升级为盟主银腰带", 6, 4 )
	AddNumText( sceneId, x125021_g_ScriptId, "升级为盟主金腰带", 6, 5 )
	AddNumText( sceneId, x125021_g_ScriptId, "升级为盟主七宝腰带", 6, 6 )
end

--**********************************
--任务入口函数
--**********************************
function x125021_OnDefaultEvent( sceneId, selfId, targetId )
	local Num = GetNumText()
	if Num == 1  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B盟主铜腰带兑换盟主之印");
      AddText(sceneId,"  1个盟主铜腰带可以兑换1个盟主之印");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 10 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
	
	elseif Num == 2  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B盟主银腰带兑换盟主之印");
      AddText(sceneId,"  1个盟主银腰带可以兑换10个盟主之印");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 11 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)
		
	elseif Num == 3  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B盟主金腰带兑换盟主之印");
      AddText(sceneId,"  1个盟主金腰带可以兑换100个盟主之印");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 12 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 4  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B升级为盟主银腰带");
      AddText(sceneId,"  升级成为盟主银腰带需要消耗：#r#G    1个盟主铜腰带#r    9个盟主之印#r    你确定要升级吗？");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 13 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 5  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B升级为盟主金腰带");
      AddText(sceneId,"  升级成为盟主金腰带需要消耗：#r#G    1个盟主银腰带#r    90个盟主之印#r    #{_EXCHG"..tostring(500000).."}#W#r  你确定要升级吗？");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 14 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 6  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B升级为盟主七宝腰带");
      AddText(sceneId,"  升级成为盟主七宝腰带需要消耗：#r#G    1个盟主金腰带#r    400个盟主之印#r    #{_EXCHG"..tostring(1000000).."}#W#r  你确定要升级吗？");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 15 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
    EndEvent(sceneId)
    DispatchEventList(sceneId,selfId,targetId)

	elseif Num == 7  then
    BeginEvent(sceneId)
      AddText(sceneId,"#B升级为盟主铜腰带");
      AddText(sceneId,"  升级成为盟主铜腰带需要消耗：#r#G    40个盟主铜腰带碎片#W#r  你确定要升级吗？");
      AddNumText( sceneId, x125021_g_ScriptId, "确定", 8, 16 )
      AddNumText( sceneId, x125021_g_ScriptId, "取消", 8, 20 )
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
-- 碎片换腰带
--**********************************
function x125021_StoneToItem(sceneId, selfId)
	
	BeginAddItem(sceneId)
		AddItem( sceneId, x125021_g_Item_1, 1 )
	local ret = EndAddItem(sceneId,selfId)
	
	-- 腰带碎片的ID
	local nStoneId = 40004434
	if ret > 0  then
		if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=40 then
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,40)
			AddItemListToHuman(sceneId,selfId)
			x125021_DispatchTips(sceneId,selfId,1)
			-- 添加一个兑换日志
			LuaFnAuditPlayerBehavior(sceneId, selfId, "碎片换腰带");
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
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "铜腰带换银腰带");

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
				
				-- 扣G
				--CostMoney(sceneId,selfId,500000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 500000 )  
				
				AddItemListToHuman(sceneId,selfId)
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "银腰带换金腰带");

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
				
				-- 扣G
				--CostMoney(sceneId,selfId,1000000)
				LuaFnCostMoneyWithPriority( sceneId, selfId, 1000000 )  
				AddItemListToHuman(sceneId,selfId)
				
				
				-- 添加装备升级日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "金腰带换七宝腰带");
	    	x125021_DispatchTips(sceneId,selfId,1)
		    	
		    -- 发送世界公告
				local szTransferEquip = GetItemTransfer(sceneId,selfId,0)
		    
				local str = ""
				str = format("#P于九莲大喊：天下英雄们！伟大的英雄#{_INFOUSR%s}多年来在封禅台上浴血奋战，终于赢得了武林盟主真正的标志！#{_INFOMSG%s}！", GetName(sceneId,selfId), szTransferEquip)
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
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "铜腰带换1盟主印");
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
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "银腰带换10盟主印");
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
				--添加兑换日志
				LuaFnAuditPlayerBehavior(sceneId, selfId, "金腰带换100盟主印");
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
	    AddText(sceneId,"兑换失败，请检查物品是否足够兑换。");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -1  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"金钱不足");    
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	elseif bOk == -2  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"你的背包没有空间了。");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	else
	  BeginEvent(sceneId)
	    AddText(sceneId,"兑换成功。");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,selfId)
	end
	
	BeginUICommand(sceneId)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 1000)
end
