--云涵儿

--脚本号
x000118_g_scriptId = 000118

--商店编号
x000118_g_shoptableindex=102

--所拥有的事件ID列表
x000118_g_eventList={400918, 400963}	--	去玄武岛、去圣兽山

--兑换需求物品
x000118_g_change_needitem = {itemindex = 30501318, itennum = 200}
--兑换目标物品
x000118_g_change_targetitem = {item_1_index = 30402022, item_2_index = 30402021, item_3_index = 30402024, item_4_index = 30402023}


--**********************************
--事件列表
--**********************************
function x000118_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"我家小姐收集各种珍兽，人手不够，你要是能帮忙就可以得到酬劳的。")
	
	--AddNumText( sceneId, x000118_g_scriptId, "免费无敌", 6, 10 )	--去除免费无敌功能--del by Heanqi
	
	for i, eventId in x000118_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	
	AddNumText(sceneId,x000118_g_scriptId,"#{BBSX_081107_1}",6,11)
	AddNumText(sceneId,x000118_g_scriptId,"购买宠物技能书",7,2)
--	AddNumText(sceneId,x000118_g_scriptId,"查询珍兽成长率",6,3)
	AddNumText(sceneId,x000118_g_scriptId,"#{XXWD_8916_07}",11,5)
	AddNumText(sceneId,x000118_g_scriptId,"灵兽丹合成",6,6)
	AddNumText(sceneId,x000118_g_scriptId,"灵兽丹合成介绍",11,7)
--	AddNumText(sceneId,x000118_g_scriptId,"如何给珍兽快速升级",11,8)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000118_OnDefaultEvent( sceneId, selfId,targetId )
	x000118_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000118_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000118_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	if GetNumText() == 2 then
		DispatchShopItem( sceneId, selfId,targetId, x000118_g_shoptableindex )
	elseif GetNumText() == 3 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "  查询珍兽的成长率，查询一次需要收取#{_MONEY100}的费用。" )
--		AddNumText( sceneId, x000118_g_scriptId, "确定", -1, 4 )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
--	elseif GetNumText() == 4 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
			UICommand_AddInt( sceneId, 6 )				--珍兽查询分支
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 3 )	--调用珍兽界面
	elseif GetNumText() == 5 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{XXWD_8916_08}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 6 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 19824 )	--调用灵兽丹合成界面
	elseif GetNumText() == 7 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{JNHC_81015_12}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 8 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{ZSKSSJ_081126_5}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 10 then
	    if eventId == x000118_g_scriptId then	
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )	--去除免费无敌功能--del by Heanqi
			return
		end
	elseif GetNumText() == 11 then
		BeginEvent( sceneId )
		AddText(sceneId, "#{BBSX_081107_2}")
		AddText(sceneId, "#{BBSX_081107_3}")
		AddNumText(sceneId,x000118_g_scriptId,"#{BBSX_081107_4}",6,21)
		AddNumText(sceneId,x000118_g_scriptId,"#{BBSX_081107_5}",6,22)
		AddNumText(sceneId,x000118_g_scriptId,"#{BBSX_081107_6}",6,23)
		AddNumText(sceneId,x000118_g_scriptId,"#{BBSX_081107_7}",6,24)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 21 then
		x000118_ChangeItem(sceneId, selfId, targetId, 21)
	elseif GetNumText() == 22 then
		x000118_ChangeItem(sceneId, selfId, targetId, 22)
	elseif GetNumText() == 23 then
		x000118_ChangeItem(sceneId, selfId, targetId, 23)
	elseif GetNumText() == 24 then	
		x000118_ChangeItem(sceneId, selfId, targetId, 24)
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x000118_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000118_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000118_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000118_g_eventList do
		if missionScriptId == findId then
			x000118_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000118_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000118_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000118_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000118_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000118_OnDie( sceneId, selfId, killerId )
end

--**********************************
--提交珍兽
--**********************************
function x000118_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
--注意，这里这样写省略了在eventlist中搜索scriptId这一部分，可能会有问题
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end

function x000118_ChangeItem(sceneId, selfId, targetId, key)
	local nTargetitem = 0
	if key == 21 then
		nTargetitem = x000118_g_change_targetitem.item_1_index
	elseif key == 22 then
		nTargetitem = x000118_g_change_targetitem.item_2_index
	elseif key == 23 then
		nTargetitem = x000118_g_change_targetitem.item_3_index
	elseif key == 24 then
		nTargetitem = x000118_g_change_targetitem.item_4_index
	else
		return
	end
	
	local nHaveCount = GetItemCount(sceneId, selfId, x000118_g_change_needitem.itemindex)
	local nAvailableCount = LuaFnGetAvailableItemCount( sceneId, selfId,  x000118_g_change_needitem.itemindex)
	--PrintStr("nHaveCount "..nHaveCount.." nAvailableCount "..nAvailableCount)
	
	--拥有数量超过而可用数量不足说明是有已经加锁的。这个地方是特例判断，策划坚持要加这个提示，认为元宝摆摊物品提示要准确。add by hukai#40690
	if nHaveCount >= x000118_g_change_needitem.itennum and nAvailableCount < x000118_g_change_needitem.itennum then
		x000118_ShowMsgInFrame( sceneId, selfId, targetId, "#{JSTS_081119_1}" )
		return
	end
	
	if nAvailableCount < x000118_g_change_needitem.itennum then
		local strName = format("#H#{_ITEM%d}#W", nTargetitem)
		x000118_ShowMsgInFrame( sceneId, selfId, targetId, "#{BBSX_081107_8}"..strName )
		return
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		x000118_ShowNotice( sceneId, selfId, "#{BBSX_081107_9}")
		x000118_ShowMsgInFrame(sceneId,selfId,targetId, "#{BBSX_081107_9}")
	    return
	end
	
	if LuaFnDelAvailableItem( sceneId, selfId, x000118_g_change_needitem.itemindex, x000118_g_change_needitem.itennum ) == 1 then
		BeginAddItem(sceneId)
		AddItem( sceneId, nTargetitem, 1 )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			    local szItemTransfer = GetItemTransfer(sceneId,selfId, 0)
				x000118_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )

				local strNotice = format("兑换成功，你获得了#H#{_ITEM%d}#W", nTargetitem)
				x000118_ShowNotice( sceneId, selfId, strNotice)
				
				x000118_ShowMsgInFrame(sceneId,selfId,targetId, strNotice)
				
			else
				x000118_ShowNotice( sceneId, selfId, "#{BBSX_081107_9}")
				return
        	end
	else
    	x000118_ShowNotice( sceneId, selfId, "扣除物品失败！")
		return
	end
end


function x000118_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x000118_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#{_INFOUSR%s}#P历尽千辛万苦，终于收集齐200片#Y#{_ITEM30501318}#P，并成功在#G洛阳（182，155）#Y云涵儿#P处兑换到一本#{_INFOMSG%s}#P。", PlayerName, strItemInfo )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
end

function x000118_ShowMsgInFrame( sceneId, selfId, targetId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchEventList(sceneId,selfId,targetId)   
end
