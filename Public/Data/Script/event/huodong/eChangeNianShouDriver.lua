
-- 兑换物品
x889051_g_scriptId = 889051

--绑定的碎片
x889051_g_SuiPian1ID = 30504022
--普通的碎片
x889051_g_SuiPian2ID = 30504021
--绑定的拼图的ID
x889051_g_FigureID1   = 30504024
--非绑定的拼图的ID
x889051_g_FigureID2   = 30504023
--兑换拼图需要的碎片数量
x889051_g_FigureCount = 300

--兑换初级年兽需要的碎片数量
x889051_g_LowNianShouCount = 49

--兑换中级年兽需要的拼图数量
x889051_g_MiddleNianShouCount = 1

--兑换高级年兽需要的拼图数量
x889051_g_HighNianShouCount = 15

--低级年兽ID
x889051_g_LowNianShouID = 10141800
--中级年兽ID
x889051_g_MiddleNianShouID = 10141801
--高级年兽ID
x889051_g_HighNianShouID = 10141802

x889051_gGongGaoInfo ={
  "#{_INFOUSR%s}#cff99cc将收集到的49个年兽碎片交到#G洛阳镖师（81，117）#Y贾威信#cff99cc手上，一只#{_INFOMSG%s}#cff99cc诞生了。",
  "#{_INFOUSR%s}#cff99cc用颤抖的双手将1个年兽拼图交到#G洛阳镖师（81，117）#Y贾威信#cff99cc手上，一只#{_INFOMSG%s}#cff99cc从天而降。",
  "#{_INFOUSR%s}#cff99cc将15个年兽拼图交到#G洛阳镖师（81，117）#Y贾威信#cff99cc手上，一只#{_INFOMSG%s}#cff99cc破碎虚空而来。",
}


--MisDescEnd

--兑换初级年兽
function x889051_ChangeLowNianShou(sceneId, selfId, targetId)
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian1ID) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian2ID)
	--身上是否有物品
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_02}")
		return
	end
	
	--数量是否足够
	if (nCount<x889051_g_LowNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_03}")
		return
	end
	
	
		--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	
	--扣除物品
	-- 删除物品 先删除绑定的
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
		
		--删没绑定的
		local Delete = x889051_g_LowNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--给玩家添加物品
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_LowNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,1)
	x889051_MsgBox( sceneId, selfId, "初级年兽坐骑兑换成功" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,1)
	x889051_CloseWindow(sceneId,selfId, targetId)
	
end
--兑换初级年兽的描述
function x889051_ChangeLowNianShouDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_PT_01}"
	--x889051_NotifyFailBox( sceneId, selfId, targetId, str)
	
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "确定", 6, 11 )
		AddNumText( sceneId, x889051_g_scriptId, "取消", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--兑换中级年兽
function x889051_ChangeMiddleNianShou(sceneId, selfId, targetId)
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID1) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID2)
	--身上是否有物品
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_06}")
		return
	end

	--数量是否足够
	if (nCount<x889051_g_MiddleNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_07}")
		return
	end
	
		--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId, targetId,"#{NSDH_SP_04}" )
		return
	end
	--扣除物品
	-- 删除物品 先删除绑定的
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
		--删没绑定的
		local Delete = x889051_g_MiddleNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--给玩家添加物品
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_MiddleNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,2)
	x889051_MsgBox( sceneId, selfId, "中级年兽坐骑兑换成功" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,2)
	x889051_CloseWindow(sceneId,selfId, targetId)
end

--兑换中级年兽的描述
function x889051_ChangeMiddleNianShouDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_PT_05}"
	--x889051_NotifyFailBox( sceneId, selfId, targetId, str)

	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "确定", 6, 12 )
		AddNumText( sceneId, x889051_g_scriptId, "取消", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--兑换高级年兽
function x889051_ChangeHighNianShou(sceneId, selfId, targetId, targetId)
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID1) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_FigureID2)
	--身上是否有物品
	if (nCount<=0) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_10}")
		return
	end
	
	--数量是否足够
	if (nCount<x889051_g_HighNianShouCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_PT_11}")
		return
	end
	
		--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	
	--扣除物品
	-- 删除物品 先删除绑定的
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
		
		--删没绑定的
		local Delete = x889051_g_HighNianShouCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_FigureID2, Delete)
		if ret1 < 1  then
			return
		end
		
	end
	
		--给玩家添加物品
	local bagpos01 = TryRecieveItem( sceneId, selfId, x889051_g_HighNianShouID, QUALITY_MUST_BE_CHANGE )
	LuaFnItemBind( sceneId, selfId, bagpos01 )
	Audit_ChangeNianShouDriver(sceneId,selfId,3)
	x889051_MsgBox( sceneId, selfId, "高级年兽坐骑兑换成功" )
	local szItemTransfer = GetBagItemTransfer(sceneId,selfId,bagpos01)
	x889051_ShowSystemNotice(sceneId, selfId, szItemTransfer,3)
	x889051_CloseWindow(sceneId,selfId, targetId)
end

--兑换高级年兽的描述
function x889051_ChangeHighNianShouDescript(sceneId, selfId,targetId)
	local str = "#{NSDH_PT_09}"
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "确定", 6, 13 )
		AddNumText( sceneId, x889051_g_scriptId, "取消", 6, 21 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--组合年兽拼图
function x889051_CompositeFigure(sceneId, selfId, targetId)
	--LuaFnItemBind( sceneId, selfId, bagpos01 )
	
	local nCount =LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian1ID) + LuaFnGetAvailableItemCount(sceneId, selfId,x889051_g_SuiPian2ID)
	--身上是否有物品
	
	if (nCount<=0) then
		
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_SP_02}" )
		return
	end
	
	--数量是否足够
	if (nCount<x889051_g_FigureCount) then
		x889051_NotifyFailBox( sceneId, selfId, targetId, "#{NSDH_SP_03}" )
		return
	end
	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889051_NotifyFailBox( sceneId, selfId,targetId, "#{NSDH_SP_04}" )
		return
	end
	local IsBind = 0
	
	--扣除物品
	-- 删除物品 先删除绑定的
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
		
		--删没绑定的
		local Delete = x889051_g_FigureCount - BangdingNum;
		ret1 = LuaFnDelAvailableItem(sceneId,selfId, x889051_g_SuiPian2ID, Delete)
		if ret1 < 1  then
			return
		end
		
		IsBind = 1
	end
	
	--给玩家添加物品
	BeginAddItem(sceneId)
		--有绑定的给绑定物品，没有绑定的给普通拼图
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
	x889051_MsgBox( sceneId, selfId, "组合年兽拼图成功" )
	x889051_CloseWindow(sceneId,selfId, targetId)
end


--组合年兽拼图
function x889051_CompositeFigureDescript(sceneId, selfId, targetId)
	local str = "#{NSDH_SP_01}"
	BeginEvent(sceneId)
		AddText(sceneId,str)
		AddNumText( sceneId, x889051_g_scriptId, "确定", 6, 14 )
		AddNumText( sceneId, x889051_g_scriptId, "取消", 6, 21 )
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
--任务入口函数
--**********************************
function x889051_OnDefaultEvent( sceneId, selfId, targetId )

	local nNum = GetNumText()

	--兑换初级坐骑的对话
	if (nNum == 1 ) then
		x889051_ChangeLowNianShouDescript(sceneId, selfId, targetId)
	--兑换中级坐骑的对话
	elseif nNum == 2 then
		x889051_ChangeMiddleNianShouDescript(sceneId, selfId, targetId)
	--兑换高级坐骑的对话
	elseif nNum == 3 then
		x889051_ChangeHighNianShouDescript(sceneId, selfId, targetId)
	--组合年兽平图的对话
	elseif nNum == 4 then
		x889051_CompositeFigureDescript(sceneId, selfId, targetId)
	--兑换初级坐骑
	elseif nNum == 11 then
		x889051_ChangeLowNianShou(sceneId, selfId, targetId)
	--兑换中级坐骑
	elseif nNum == 12 then
		x889051_ChangeMiddleNianShou(sceneId, selfId, targetId)
	--兑换高级坐骑
	elseif nNum == 13 then
		x889051_ChangeHighNianShou(sceneId, selfId, targetId)
	--组合拼图
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
--列举事件
--**********************************
function x889051_OnEnumerate( sceneId, selfId, targetId )
	AddNumText( sceneId, x889051_g_scriptId, "兑换初级坐骑年兽踏风", 6, 1 )
	AddNumText( sceneId, x889051_g_scriptId, "兑换中级坐骑年兽逐日", 6, 2 )
	AddNumText( sceneId, x889051_g_scriptId, "兑换高级坐骑年兽雷霆", 6, 3 )
	AddNumText( sceneId, x889051_g_scriptId, "组合年兽拼图",     6, 4 )
	AddNumText( sceneId, x889051_g_scriptId, "关于年兽坐骑兑换活动的介绍", 11, 5 )
	
end

--**********************************
--检测接受条件
--**********************************
function x889051_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x889051_OnAccept( sceneId, selfId )

end

--**********************************
--放弃
--**********************************
function x889051_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889051_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889051_CheckSubmit( sceneId, selfId )
end

--**********************************
--送出宠物蛋的公告
--**********************************
function x889051_ShowSystemNotice( sceneId, selfId, strItemInfo,iIndex )
	
	local PlayerName = GetName(sceneId,selfId)
	local str
	str = format( x889051_gGongGaoInfo[iIndex], PlayerName, strItemInfo)
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x889051_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x889051_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889051_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		
end

--**********************************
--杀死怪物或玩家
--**********************************
function x889051_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x889051_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889051_OnItemChanged( sceneId, selfId, itemdataId )
end


