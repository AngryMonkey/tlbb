--装备资质鉴定
--脚本号
x809261_g_ScriptId = 809261

--装备资质鉴定UI 1001

--**********************************
--列举事件
--**********************************
function x809261_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--装备资质鉴定
--**********************************
function x809261_FinishAdjust( sceneId, selfId, nItemIndex)
	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex)
	
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"该装备不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsJudgeApt( sceneId, selfId, nItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"该物品不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"该物品已经进行过资质鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 2 then
		BeginEvent(sceneId)
		AddText(sceneId,"该物品还没有鉴定，所以不能进行资质鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
		AddText(sceneId,"该物品没有资质，所以不能进行资质鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nItemIndex )
	need_money = 20000
	if equip_level < 10 then
		need_money = 10
	elseif equip_level < 20 then
		need_money = 100
	elseif equip_level < 30 then
		need_money = 1000
	elseif equip_level < 40 then
		need_money = 3000
	elseif equip_level < 50 then
		need_money = 4000
	elseif equip_level < 60 then
		need_money = 5000
	elseif equip_level < 70 then
		need_money = 6000
	elseif equip_level < 80 then
		need_money = 7000
	elseif equip_level < 90 then
		need_money = 8000
	elseif equip_level < 100 then
		need_money = 10000
	elseif equip_level < 110 then
		need_money = 20000
	elseif equip_level < 120 then
		need_money = 30000
	else
		need_money = 40000
	end
	
	if money < need_money then
		BeginEvent(sceneId)
		AddText(sceneId,"金钱不足。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local jiaoZi, jinBi = LuaFnCostMoneyWithPriority( sceneId, selfId, need_money )
	if jiaoZi == -1 then
		BeginEvent(sceneId)
		AddText(sceneId,"未知错误。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnJudgeApt( sceneId, selfId, nItemIndex )
	if ret == 1 then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		BeginEvent(sceneId)
		AddText(sceneId,"装备资质鉴定成功。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	else
		BeginEvent(sceneId)
		AddText(sceneId,"未知错误。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
end




--**********************************
--重新鉴定装备资质(洗资质)
--**********************************
function x809261_FinishReAdjust( sceneId, selfId, nEquItemIndex )

	-- 检测装备是否可用....
	local ret = LuaFnIsItemLocked( sceneId, selfId, nEquItemIndex)
	if ret ~= 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"该装备不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检测是否有金刚砂....
	itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, 30008034)
	itemCount2 = LuaFnGetAvailableItemCount(sceneId, selfId, 30008048)
	if itemCount < 1 and itemCount2 < 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"您缺少金刚砂或金刚锉。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检测装备资质的鉴定情况....
	ret = LuaFnIsJudgeApt( sceneId, selfId, nEquItemIndex )
	if ret == -1 then
		BeginEvent(sceneId)
			AddText(sceneId,"该物品不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 0 then
		BeginEvent(sceneId)
			AddText(sceneId,"该物品还没有鉴定过资质，请先进行装备资质鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	--if ret == 1 then
	-- 1 代表已经鉴定过资质....
	--end
	if ret == 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"该物品还没有鉴定过，请先进行装备鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	if ret == 3 then
		BeginEvent(sceneId)
			AddText(sceneId,"该物品没有资质，所以不能进行资质鉴定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 检测金钱是否够....
	money = GetMoney( sceneId, selfId )+GetMoneyJZ(sceneId, selfId);
	equip_level = GetBagItemLevel( sceneId, selfId, nEquItemIndex )
	need_money = 20 * equip_level + 50
	
	if money < need_money then
		BeginEvent(sceneId)
			AddText(sceneId,"你携带的金钱不足。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--检查装备是否是绑定
	ret = LuaFnGetItemBindStatus( sceneId, selfId, nEquItemIndex )
	--扣除规则是：绑定优先，然后是金刚砂优先。也就扣除次序是绑定金刚砂，绑定金刚锉，金刚砂，金刚锉
	--找绑定金刚砂
	local ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(1) )
	
	local needBind = 0
	
	if ret == 0 then
		if ShaPos ~= -1 then
			needBind = 1
		end
	end
	
	local ShaPos2 = -1
	if ShaPos == -1 then --找绑定金刚锉
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(1))
	end
	
	if ret == 0 then
		if ShaPos2 ~= -1 then
			needBind = 1
		end
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --找金刚砂
		ShaPos = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008034, tonumber(0))
	end
	
	if ShaPos == -1 and ShaPos2 == -1 then --找金刚锉
		ShaPos2 = GetBagPosByItemSnAvailableBind(sceneId, selfId, 30008048, tonumber(0))
	end

	local ShaInfo = 0
	-- 扣金刚砂或金刚锉....
	if ShaPos ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos )
	
		ret = LuaFnEraseItem(sceneId, selfId, ShaPos)
		if ret ~= 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"金刚砂不可用。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif ShaPos2 ~= -1 then
		ShaInfo = GetBagItemTransfer( sceneId, selfId, ShaPos2 )

		local r, t = LuaFnEraseItemTimes( sceneId, selfId, ShaPos2, 11 )

			BeginEvent(sceneId)
			local	szMsg				= format( "金刚锉剩余使用次数%d/%d", tonumber(t), tonumber(11) );
			AddText(sceneId,szMsg);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
	end
	
	-- 重新鉴定装备资质....
	
	ret = LuaFnReSetItemApt( sceneId, selfId, nEquItemIndex )
	if ret == 1 then

		-- 扣钱....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- 加鉴定成功特效....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--绑定
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"装备资质重新鉴定成功");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	elseif ret == 2 or ret == 3 then -- zchw for notice
		
		-- [ QUFEI 2007-09-17 17:22 UPDATE BugID 25245 ]
		-- 扣钱....
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw

		-- 加鉴定成功特效....
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
		--绑定
		if needBind == 1 then
			LuaFnItemBind( sceneId, selfId, nEquItemIndex )
		end

		BeginEvent(sceneId)
			AddText(sceneId,"装备资质重新鉴定成功");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)

		--发公告....
		x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

		return

	else
	
		BeginEvent(sceneId)
		AddText(sceneId,"未知错误。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return

	end

end


--**********************************
--重新鉴定装备资质公告
--**********************************
function x809261_ReAdjustNotify( sceneId, selfId, ret, ShaPos, ShaPos2, ShaInfo, nEquItemIndex )

	local Name = GetName(sceneId, selfId)		
	local itemInfo = GetBagItemTransfer( sceneId, selfId, nEquItemIndex )
	local strText
	local nEquipID = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nEquItemIndex )

	--只有特定几类的装备洗出了250以上的资质时....允许发洗出超级装备的公告....
	--1帽子 2衣服 3手套 4鞋 15护肩
	-- 添加 0武器、6，11戒指（2个）、12,13护符（2个）
	if ret == 3 then
		local EquipPoint = GetItemEquipPoint( nEquipID )
		if EquipPoint~= 1 and EquipPoint~= 2 and EquipPoint~= 3 and EquipPoint~= 4 and EquipPoint~= 15  and EquipPoint ~= 0 and EquipPoint ~= 6 and EquipPoint ~= 11 and EquipPoint ~= 12 and EquipPoint ~= 13 and EquipPoint ~= 17 then
			ret = 2
		end
	end


	--如果资质洗到了250以上就会发洗出超级装备的公告....
	if ret == 3 then

		if ShaPos ~= -1 then
			strText = format("#W#{_INFOUSR%s}#{AQ_16}#{_INFOMSG%s}#{AQ_17}#{_INFOMSG%s}#{AQ_18}", Name, ShaInfo, itemInfo);
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			strText = format("#W#{AQ_28}#{_INFOUSR%s}#H用#{_INFOMSG%s}#{AQ_29}#{_INFOMSG%s}#{AQ_30}", Name, ShaInfo, itemInfo);
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


	--如果资质没有洗到了250以上....但也已经达到优秀....就会发洗出普通装备的公告....
	if ret == 2 then

		if ShaPos ~= -1 then
			local rand = random( 4 )
			if rand == 1 then
				strText = format("#W#{_INFOUSR%s}#{AQ_1}#{_INFOMSG%s}#{JinGangSha_1B}#{_INFOMSG%s}#{AQ_6}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				strText = format("#W#{_INFOUSR%s}#{AQ_3}#{_INFOMSG%s}#{JinGangSha_2B}#{_INFOMSG%s}#{AQ_8}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				strText = format("#W#{_INFOUSR%s}#{AQ_5}#{_INFOMSG%s}#{JinGangSha_3B}#{_INFOMSG%s}#{AQ_2}", Name, ShaInfo, itemInfo )
			elseif rand == 4 then
				strText = format("#W#{_INFOUSR%s}#{AQ_7}#{_INFOMSG%s}#{JinGangSha_4B}#{_INFOMSG%s}#{AQ_4}", Name, ShaInfo, itemInfo )
			end
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		elseif ShaPos2 ~= -1 then
			local rand = random( 3 )
			if rand == 1 then
				strText = format("#W#{_INFOUSR%s}#{AQ_19}#{_INFOMSG%s}#{AQ_20}#{_INFOMSG%s}#{AQ_21}", Name, ShaInfo, itemInfo )
			elseif rand == 2 then
				strText = format("#W#{_INFOUSR%s}#{AQ_22}#{_INFOMSG%s}#{AQ_23}#{_INFOMSG%s}#{AQ_24}", Name, ShaInfo, itemInfo )
			elseif rand == 3 then
				strText = format("#W#{AQ_25}#{_INFOUSR%s}#{AQ_26}#{_INFOMSG%s}#{AQ_27}#{_INFOMSG%s}。", Name, ShaInfo, itemInfo )
			end
			BroadMsgByChatPipe(sceneId,selfId, strText, 4)
		end

	end


end
