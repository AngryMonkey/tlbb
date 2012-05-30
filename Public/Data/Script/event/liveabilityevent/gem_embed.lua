-- 宝石镶嵌

-- 脚本号
x701614_g_scriptId = 701614

-- 硬性设定的装备最大可镶嵌宝石数
x701614_g_MaxEquipGemCount = 3

-- 装备允许镶嵌的宝石类型表
x701614_g_EquipGemTable = {}
x701614_g_EquipGemTable[HEQUIP_WEAPON] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CAP] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_ARMOR] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_CUFF] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_BOOT] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_SASH] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_RING] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_NECKLACE] = { 1, 2, 3, 4, 11, 12, 13, 14, 21 }
x701614_g_EquipGemTable[HEQUIP_RING_2] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CHARM] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_CHARM_2] = { 1, 2, 3, 4, 21 }
x701614_g_EquipGemTable[HEQUIP_WRIST] = {1, 2, 3, 4, 21  }
x701614_g_EquipGemTable[HEQUIP_SHOULDER] = { 11, 12, 13, 14 }
x701614_g_EquipGemTable[HEQUIP_DARK] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21 }

-- 镶嵌不同等级宝石的金钱消耗表
x701614_g_EquipGemCost = {}
x701614_g_EquipGemCost[1] = 5000
x701614_g_EquipGemCost[2] = 6000
x701614_g_EquipGemCost[3] = 7000
x701614_g_EquipGemCost[4] = 8000
x701614_g_EquipGemCost[5] = 9000
x701614_g_EquipGemCost[6] = 10000
x701614_g_EquipGemCost[7] = 11000
x701614_g_EquipGemCost[8] = 12000
x701614_g_EquipGemCost[9] = 13000

-- 宝石镶嵌符表
x701614_g_AssisMat = { { idx = 30900009, odds = 50 }, { idx = 30900010, odds = 100 } }

-- 宝石强化符
x701614_g_FastenMat = 30900011

x701614_GemEmbed_four_ID = {
														50113004,50213004,50313004,50413004,50513004,50613004,50713004,50813004,50913004,50113006,
														50213006,50313006,50413006,50513006,50613006,50713006,50813006,50913006
													}		

--**********************************************************************
-- 任务入口函数
--**********************************************************************
function x701614_OnDefaultEvent( sceneId, selfId, targetId )
end

--**********************************************************************
-- 列举事件
--**********************************************************************
function x701614_OnEnumerate( sceneId, selfId, targetId )
end

--**********************************************************************
-- 判断是否宝石
--**********************************************************************
function x701614_IsGem( itemIndex )
	if floor( itemIndex / 10000000 ) == 5 then
		return 1
	end

	return 0
end

--**********************************************************************
-- 进行宝石镶嵌
-- 程序中调用
--**********************************************************************
function x701614_GemEmbed( sceneId, selfId, GemBagIndex, EquipBagIndex, MatBagIndex1, MatBagIndex2 )
	local gemIdx, equipIdx, matIdx1, matIdx2 = -1, -1, -1, -1
	local odds = 25														-- 成功率
	local szTransferItem = ""
	local	GemIsBind = 0;
	local EquipIsBind = 0;
	local CharmIsBind = 0;
	local OddsIsBind = 0;

	
	--!!
	if(LuaFnGetItemBindStatus( sceneId, selfId, GemBagIndex ) == 1) then
		GemIsBind = 1;
	end
	
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	-- 褚少微，2008.7.1。重楼戒、重楼玉的机制修改：1、可以打孔；2、可以镶嵌宝石，但只能镶嵌不绑定的宝石
	if(GemIsBind == 1) then
	  	if(itemTableIndex == 10422016 or itemTableIndex == 10423024) then
	  		return OR_STUFF_LACK
	  	end
	end
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, EquipBagIndex ) == 1) then
		EquipIsBind = 1;
	end
  
  if MatBagIndex1 ~= -1 then
     if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex1 ) == 1) then
		    CharmIsBind = 1;
	   end
	end
	
	if MatBagIndex2 ~= -1 then
	   if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex2 ) == 1) then
		    OddsIsBind = 1;
		 end
	end
	
	
	-- 判断宝石合法性
	if LuaFnIsItemAvailable( sceneId, selfId, GemBagIndex ) < 1 then	-- 使用有问题的物品则退出流程
		return OR_STUFF_LACK
	else
		gemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemBagIndex )
		szTransferItem = GetBagItemTransfer(sceneId,selfId,GemBagIndex)
		if x701614_IsGem( gemIdx ) == 0 then
			return OR_STUFF_LACK
		end
	end

	-- 判断装备合法性
	local equipType = LuaFnGetBagEquipType( sceneId, selfId, EquipBagIndex )
	if LuaFnIsItemLocked( sceneId, selfId, EquipBagIndex ) ~= 0
	or equipType == -1 then												-- 使用有问题的物品则退出流程
		return OR_STUFF_LACK
	else
		equipIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	end
	
	-- 判断是否还可以镶嵌更多宝石
	local equipMaxGemCount = GetBagGemCount( sceneId, selfId, EquipBagIndex )
	local equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, EquipBagIndex )

	--modi:lby是否可以镶嵌
	if equipMaxGemCount > equipEmbededGemCount and equipEmbededGemCount >= x701614_g_MaxEquipGemCount then

		return OR_GEM_EMBED_LACK
	end
	
	if equipMaxGemCount <= equipEmbededGemCount or equipEmbededGemCount >= x701614_g_MaxEquipGemCount then
		return OR_GEM_SLOT_LACK
	end

	
	
	-- 判断和装备上的现有宝石是否有冲突
	local gemEmbededIdx = -1
	local gemType = LuaFnGetItemType( gemIdx )
	for i = 0, equipMaxGemCount - 1 do
		gemEmbededIdx = GetGemEmbededType( sceneId, selfId, EquipBagIndex, i )
		if gemEmbededIdx ~= -1 then
			-- 对比两颗宝石的类型（宝石大类）
			if gemType == LuaFnGetItemType( gemEmbededIdx ) then
				return OR_GEM_CONFLICT
			end
		end
	end

	-- 判断宝石和装备的匹配性
	if not x701614_g_EquipGemTable[equipType] then
		return OR_GEM_NOT_FIT_EQUIP
	end

	local passFlag = 0
	for i, gt in x701614_g_EquipGemTable[equipType] do
		if gt == gemType then
			passFlag = 1
			break
		end
	end

	if passFlag == 0 then
		return OR_GEM_NOT_FIT_EQUIP
	end

	-- 判断辅助材料的有效性
	if MatBagIndex1 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex1 ) < 1 then
		MatBagIndex1 = -1
	else
		local findFlag = 0
		matIdx1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex1 )
		for i, matInfo in x701614_g_AssisMat do
			if matInfo.idx == matIdx1 then
				findFlag = 1
				odds = matInfo.odds
				break
			end
		end

		if findFlag == 0 then													-- 这个东西不是镶嵌符
			MatBagIndex1 = -1
			matIdx1 = -1
		end
	end
	
	-- 必须镶嵌符
	if MatBagIndex1 == -1 then
		return OR_GEM_NEED_STUFF
	end

	if MatBagIndex2 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex2 ) < 1 then
		MatBagIndex2 = -1
	else
		matIdx2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex2 )

		if matIdx2 ~= x701614_g_FastenMat then											-- 这个东西不是强化符
			MatBagIndex2 = -1
			matIdx2 = -1
		end
	end

	-- 判断金钱数量
	local gemQual = GetItemQuality( gemIdx )
	local cost = x701614_g_EquipGemCost[gemQual]
	if not cost then
		cost = 0
	end

	-- 第一个孔原价，镶嵌第二个孔收费×2，镶嵌第三个孔收费×3
	cost = cost * ( equipEmbededGemCount + 1 )

	-- 按照规则进行消耗
	-- 不管成功失败都消耗金钱、特殊材料
	if GetMoney(sceneId, selfId) + GetMoneyJZ(sceneId, selfId) < cost then
		return OR_NOTENOUGH_MONEY
	end
	local ret1, ret2 = LuaFnCostMoneyWithPriority( sceneId, selfId, cost )
	if ret1 == -1 then
		return OR_NOTENOUGH_MONEY
	end

	if MatBagIndex1 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex1 )
	end

	if MatBagIndex2 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex2 )
	end

	-- 如果成功
	local randRet = LuaFnGemEmbedRandom();
	if odds >= randRet then
		local ret = GemEnchasing( sceneId, selfId, GemBagIndex, EquipBagIndex )
		if ret and ret == 0 then
		
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind( sceneId, selfId, EquipBagIndex);
			end
		
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, 3, -1, equipIdx )

			local name = GetName( sceneId, selfId )

			local szTransferEquip = GetBagItemTransfer( sceneId, selfId, EquipBagIndex )
			local message = format("#W#{_INFOUSR%s}#H向#W#{_INFOMSG%s}#H镶嵌了一颗#W#{_INFOMSG%s}#H，大幅的提升了装备的能力。", name, szTransferEquip, szTransferItem);
			
			--公告精简，小于3级的宝石镶嵌不发公告消息
			if (gemQual >= 3) then
				BroadMsgByChatPipe( sceneId, selfId, message, 4 )
			end

			--[重复提示]
			--x701614_MsgBox( sceneId, selfId, "#Y恭喜你，镶嵌成功！" )
			--Add Log
			LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),
				1,
				gemIdx,
				equipIdx,
				matIdx1,
				matIdx2,
				gemIdx )
			WriteDebugLog( sceneId, selfId, LogInfo )
		end
	-- 如果失败
	else
		-- 如果玩家有宝石强化符，镶嵌失败之后宝石将会降M=1级，为0就消失。
		local qualDec			= 1
		local	gemIdx_new	= -1

		-- 如果玩家没有宝石强化符，那么镶嵌失败之后宝石将会降N=2级，为0就消失。
		if MatBagIndex2 == -1 then
			qualDec = qualDec + 1
		end

		LuaFnEraseItem( sceneId, selfId, GemBagIndex )

		if gemQual - qualDec > 0 then
			gemIdx_new = gemIdx - 100000 * qualDec
			local GemBagIndex = LuaFnTryRecieveItem( sceneId, selfId, gemIdx_new, QUALITY_MUST_BE_CHANGE )
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind(sceneId, selfId, GemBagIndex)
			end
			x701614_MsgBox( sceneId, selfId, "#Y很遗憾，镶嵌失败，宝石降了"..qualDec.."级！" )
		else
			x701614_MsgBox( sceneId, selfId, "#Y很遗憾，镶嵌失败，宝石损坏！" )
		end
		--Add Log
		LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			0,
			gemIdx,
			equipIdx,
			matIdx1,
			matIdx2,
			gemIdx_new )
		WriteDebugLog( sceneId, selfId, LogInfo )
		
		if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
			LuaFnItemBind( sceneId, selfId, EquipBagIndex);
		end

		return OR_FAILURE
	end

	-- 按照成功率进行合成
	return OR_OK
end

--**********************************
--信息提示
--**********************************
function x701614_MsgBox( sceneId, selfId, str )

	--醒目提示
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
	--频道提示
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )

end


																						
--**********************************************************************
-- 进行第四个宝石镶嵌
-- 程序中调用
--**********************************************************************
function x701614_GemEmbed_Four( sceneId, selfId, GemBagIndex, EquipBagIndex, MatBagIndex1, MatBagIndex2 )
	local gemIdx, equipIdx, matIdx1, matIdx2 = -1, -1, -1, -1
	local odds = 25														-- 成功率
	local szTransferItem = ""
	local	GemIsBind = 0;
	local EquipIsBind = 0;
	local CharmIsBind = 0;
	local OddsIsBind = 0;
	local IsRedGem = 0;	
	--!!
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, GemBagIndex ) == 1) then
		GemIsBind = 1;
	end
	
	local itemTableIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	-- 褚少微，2008.7.1。重楼戒、重楼玉的机制修改：1、可以打孔；2、可以镶嵌宝石，但只能镶嵌不绑定的宝石
	if(GemIsBind == 1) then
	  	if(itemTableIndex == 10422016 or itemTableIndex == 10423024) then
	  		return OR_STUFF_LACK
	  	end
	end
	
	if(LuaFnGetItemBindStatus( sceneId, selfId, EquipBagIndex ) == 1) then
		EquipIsBind = 1;
	end
  
  if MatBagIndex1 ~= -1 then
     if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex1 ) == 1) then
		    CharmIsBind = 1;
	   end
	end
	
	if MatBagIndex2 ~= -1 then
	   if(LuaFnGetItemBindStatus( sceneId, selfId, MatBagIndex2 ) == 1) then
		    OddsIsBind = 1;
		 end
	end
	
	
	-- 判断宝石合法性
	if LuaFnIsItemAvailable( sceneId, selfId, GemBagIndex ) < 1 then	-- 使用有问题的物品则退出流程
		return OR_STUFF_LACK
	else
		gemIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, GemBagIndex )
		szTransferItem = GetBagItemTransfer(sceneId,selfId,GemBagIndex)
		
		if x701614_IsGem( gemIdx ) == 0 then
			return OR_STUFF_LACK
		end
		
	end

	-- 判断装备合法性
	local equipType = LuaFnGetBagEquipType( sceneId, selfId, EquipBagIndex )
	
	if LuaFnIsItemLocked( sceneId, selfId, EquipBagIndex ) ~= 0	or equipType == -1 then												-- 使用有问题的物品则退出流程
		return OR_STUFF_LACK
	else
		equipIdx = LuaFnGetItemTableIndexByIndex( sceneId, selfId, EquipBagIndex )
	end
	
	-- 判断是否还可以镶嵌更多宝石
	local equipMaxGemCount = GetBagGemCount( sceneId, selfId, EquipBagIndex )
	local equipEmbededGemCount = GetGemEmbededCount( sceneId, selfId, EquipBagIndex )


	if equipMaxGemCount < 4 then --打孔数不能小于4个
		return OR_GEM_NO_FOUR_SLOT
	end 
		
	if equipEmbededGemCount > 3 then --镶嵌宝石不能大于3
		return OR_GEM_ENCHASE_FOUR
	end
		
	if equipEmbededGemCount < 3 then --镶嵌宝石不能小于3
		return OR_GEM_MUST_ENCHASE_THREE
	end
	

	
	-- 如果是血精石或者红宝石，则放入失败
	for i, Data in x701614_GemEmbed_four_ID do
		if x701614_GemEmbed_four_ID[i] == gemIdx then
				
			IsRedGem = 1
		end
	end
		 
	if IsRedGem == 1 then
	 	return OR_GEM_NOT_ENCHASE
	end
	 
	
	-- 判断宝石和装备的匹配性
	if not x701614_g_EquipGemTable[equipType] then
		return OR_GEM_NOT_FIT_EQUIP
	end

	
	local gemType = LuaFnGetItemType( gemIdx )
	
	local passFlag = 0
	for i, gt in x701614_g_EquipGemTable[equipType] do
		if gt == gemType then
			passFlag = 1
			break
		end
	end

	if passFlag == 0 then
		return OR_GEM_NOT_FIT_EQUIP
	end


	
	-- 判断辅助材料的有效性
	if MatBagIndex1 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex1 ) < 1 then
		MatBagIndex1 = -1
	else
		local findFlag = 0
		matIdx1 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex1 )
		for i, matInfo in x701614_g_AssisMat do
			if matInfo.idx == matIdx1 then
				findFlag = 1
				odds = matInfo.odds
				break
			end
		end

		if findFlag == 0 then													-- 这个东西不是镶嵌符
			MatBagIndex1 = -1
			matIdx1 = -1
		end
	end
	
	-- 必须镶嵌符
	if MatBagIndex1 == -1 then
		return OR_GEM_NEED_STUFF
	end

	if MatBagIndex2 == -1 or LuaFnIsItemAvailable( sceneId, selfId, MatBagIndex2 ) < 1 then
		MatBagIndex2 = -1
	else
		matIdx2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatBagIndex2 )

		if matIdx2 ~= x701614_g_FastenMat then											-- 这个东西不是强化符
			MatBagIndex2 = -1
			matIdx2 = -1
		end
	end

	-- 判断金钱数量
	local gemQual = GetItemQuality( gemIdx )
	local cost = x701614_g_EquipGemCost[gemQual]
	if not cost then
		cost = 0
	end

	-- 第一个孔原价，镶嵌第二个孔收费×2，镶嵌第三个孔收费×3
	cost = cost * ( equipEmbededGemCount + 1 )

	local PlayerMoney = GetMoney( sceneId, selfId ) +  GetMoneyJZ(sceneId, selfId)  --交子普及 Vega
	if PlayerMoney < cost then
		return OR_NOTENOUGH_MONEY
	end
	-- 按照规则进行消耗
	-- 不管成功失败都消耗金钱、特殊材料
	local ret = LuaFnCostMoneyWithPriority( sceneId, selfId, cost )      --交子普及 Vega
	if ret < 0 then
		return OR_NOTENOUGH_MONEY
	end

	if MatBagIndex1 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex1 )
	end

	if MatBagIndex2 > -1 then
		LuaFnEraseItem( sceneId, selfId, MatBagIndex2 )
	end

	-- 如果成功
	local randRet = LuaFnGemEmbedRandom();
	if odds >= randRet then
		local ret = GemEnchasing( sceneId, selfId, GemBagIndex, EquipBagIndex )
		if ret and ret == 0 then
		
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind( sceneId, selfId, EquipBagIndex);
			end
		
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, 3, -1, equipIdx )

			local name = GetName( sceneId, selfId )

			local szTransferEquip = GetBagItemTransfer( sceneId, selfId, EquipBagIndex )
			local message = format("#W#{_INFOUSR%s}#H向#W#{_INFOMSG%s}#H镶嵌了一颗#W#{_INFOMSG%s}#H，大幅的提升了装备的能力。", name, szTransferEquip, szTransferItem);
			BroadMsgByChatPipe( sceneId, selfId, message, 4 )

			--[重复提示]
			--x701614_MsgBox( sceneId, selfId, "#Y恭喜你，镶嵌成功！" )
			--Add Log
			LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
				sceneId,
				LuaFnObjId2Guid( sceneId, selfId ),
				1,
				gemIdx,
				equipIdx,
				matIdx1,
				matIdx2,
				gemIdx )
			WriteDebugLog( sceneId, selfId, LogInfo )
		end
	-- 如果失败
	else
		-- 如果玩家有宝石强化符，镶嵌失败之后宝石将会降M=1级，为0就消失。
		local qualDec			= 1
		local	gemIdx_new	= -1

		-- 如果玩家没有宝石强化符，那么镶嵌失败之后宝石将会降N=2级，为0就消失。
		if MatBagIndex2 == -1 then
			qualDec = qualDec + 1
		end

		LuaFnEraseItem( sceneId, selfId, GemBagIndex )

		if gemQual - qualDec > 0 then
			gemIdx_new = gemIdx - 100000 * qualDec
			local GemBagIndex = LuaFnTryRecieveItem( sceneId, selfId, gemIdx_new, QUALITY_MUST_BE_CHANGE )
			if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
				LuaFnItemBind(sceneId, selfId, GemBagIndex)
			end
			x701614_MsgBox( sceneId, selfId, "#Y很遗憾，镶嵌失败，宝石降了"..qualDec.."级！" )
		else
			x701614_MsgBox( sceneId, selfId, "#Y很遗憾，镶嵌失败，宝石损坏！" )
		end
		--Add Log
		LogInfo	= format( "[EMBED]: sceneId=%d, GUID=%0X, bSuc=%d, idOldGem=%d, idEqp=%d, idMat0=%d, idMat1=%d, idNewGem=%d",
			sceneId,
			LuaFnObjId2Guid( sceneId, selfId ),
			0,
			gemIdx,
			equipIdx,
			matIdx1,
			matIdx2,
			gemIdx_new )
		WriteDebugLog( sceneId, selfId, LogInfo )
		
		if(GemIsBind == 1 or CharmIsBind == 1 or OddsIsBind == 1) then
			LuaFnItemBind( sceneId, selfId, EquipBagIndex);
		end

		return OR_FAILURE
	end

	-- 按照成功率进行合成
	return OR_OK
end
