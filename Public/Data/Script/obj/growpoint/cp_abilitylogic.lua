-- 通用生活技能逻辑脚本
-- 脚本号
x701601_g_ScriptId = 701601

-- 装备允许镶嵌的宝石类型表
x701601_g_EquipGemTable = {}

x701601_g_EquipGemCost = {}

x701601_g_EnergyCostTbl = {}
-- 采矿
x701601_g_EnergyCostTbl[ABILITY_CAIKUANG] = {
	3,4,5,6,7,8,9,10,11,12,13,14
}

-- 采药
x701601_g_EnergyCostTbl[ABILITY_CAIYAO] = {
	3,4,5,6,7,8,9,10,11,12,13,14
}
-- 种植
x701601_g_EnergyCostTbl[ABILITY_ZHONGZHI] = {
	10,10,10,20,20,20,30,30,30,30,30,30

}

---------------------------------------------------------------------
---------------------------------------------------------------------


-- 计算产品品质
function x701601_CalcQuality(sceneId, RecipeLevel, AbilityLevel, AbilityMaxLevel, ItemIndex)
	-- 随机出一个数 [0, 49]
	--Quality = random(0, 49)
	--return Quality
	if IsEquipItem(ItemIndex) == 1 then
		local lEquipPoint = GetItemEquipPoint(ItemIndex)
		local	lEquipLevel = GeEquipReqLevel(ItemIndex)
		if(lEquipPoint == -1) then
			return random(0, 49)
		elseif 	lEquipPoint == HEQUIP_WEAPON then
			return (lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CAP then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_ARMOR then
			return 10+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_CUFF then
			return 40+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_BOOT then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_SASH then
			return 20+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_RING then
			return 30+(lEquipLevel/10)-1
		elseif 	lEquipPoint == HEQUIP_NECKLACE then
			return 40+(lEquipLevel/10)-1
		end
	end
	return	random(0, 49)
end

---------------------------------------------------------------------
---------------------------------------------------------------------


-- 配方合成结束时的熟练度增长
function x701601_GainExperience(sceneId, selfId, AbilityID, RecipeLevel)
	-- 生活技能级别
	local AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	local MinLevelDisparity = 0
	local MaxLevelDisparity = 1
	local ExpGain = 0

	if AbilityLevel < 1 or AbilityLevel > 12 then
		return
	end

	--old
	--if AbilityID == ABILITY_PENGREN then
	--	ExpLimit = LEVELUP_ABILITY_PENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_DIAOYU then
	--	ExpLimit = LEVELUP_ABILITY_DIAOYU[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHONGZHI then
	--	ExpLimit = LEVELUP_ABILITY_ZHONGZHI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIYAO then
	--	ExpLimit = LEVELUP_ABILITY_CAIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHIYAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHIYAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_CAIKUANG then
	--	ExpLimit = LEVELUP_ABILITY_CAIKUANG[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_ZHUZAO then
	--	ExpLimit = LEVELUP_ABILITY_ZHUZAO[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_FENGREN then
	--	ExpLimit = LEVELUP_ABILITY_FENGREN[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_GONGYI then
	--	ExpLimit = LEVELUP_ABILITY_GONGYI[AbilityLevel].AbilityExpLimitTop
	--elseif AbilityID == ABILITY_XIANGQIAN then
	--	ExpLimit = LEVELUP_ABILITY_XIANGQIAN[AbilityLevel].AbilityExpLimitTop
	--else
	--	ExpLimit = LEVELUP_ABILITY_MENPAI[AbilityLevel].AbilityExpLimitTop
	--end
	--new
	local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(AbilityID, AbilityLevel);
	if ret and ret == 1 then
		ExpLimit = currentLevelAbilityExpTop;
	end

	ExpNow = GetAbilityExp(sceneId, selfId, AbilityID)

	if ExpLimit <= ExpNow then
		return
	end

	LevelDisparity = AbilityLevel - RecipeLevel
	if LevelDisparity < 0 then
		LevelDisparity = 0
	end

	if LevelDisparity <= MinLevelDisparity then
		ExpGain = 100
	elseif LevelDisparity <= MaxLevelDisparity then
		ExpGain = 100 / (LevelDisparity - MinLevelDisparity + 1)
	end

	Exp = ExpGain + ExpNow

	if Exp > ExpLimit then
		Exp = ExpLimit
	end

	SetAbilityExp(sceneId, selfId, AbilityID, Exp)
	--Msg2Player(sceneId,selfId,"熟练度增加到"..floor(Exp/100).."。",MSG2PLAYER_PARA)
end

---------------------------------------------------------------------------

--检查某项生活技能是否需要升级(根据熟练度自动升级)
--AbilityID 指生活技能 ID
--
function	x701601_CheckAbilityLevel(sceneId,selfId,AbilityID)
	--玩家加工技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, AbilityID)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, AbilityID)
	Flag = 0

	if AbilityLevel<=10 then
		if AbilityLevel*10<ExpPoint then
			Flag = 1
		end
	elseif AbilityLevel<=20 then
		if (10*10 + (AbilityLevel-10)*20)<ExpPoint then
			Flag = 1
		end
	--elseif ...
	end

	if Flag>0 then
		SetHumanAbilityLevel(sceneId, selfId, AbilityID, AbilityLevel+1)
		AddText(sceneId, selfId, 0, "生活技能升级了！")
	end

end

function	x701601_TooManyGems(sceneId,selfId, EquipPos)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipPos)

	if GemCount<3 then
		return 0
	end

	--返回 1 表示宝石镶嵌数量已满
	return 1
end

--宝石镶嵌接口 Gaoqi: 以前唐鹏的代码，经过胡繁修改过后，现在这段代码已经废弃
--GemIndex 宝石对应的物品唯一号(ItemIndex)
--selfId 指合成物品的玩家
--返回值 0:成功，其他失败 1:宝石消失 2:装备消失 3:宝石装备都消失 4:精力不足
function	x701601_EmbedProc(sceneId,selfId, EquipBagIndex, GemIndex, MatIndex1, MatIndex2)
	--玩家加工技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_XIANGQIAN)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_XIANGQIAN)
	--宝石等级(1~8)
	GemQual = GetItemQuality(GemIndex)
	--宝石类别
	GemType = GetItemIndex(GemIndex)

	--有多大几率生成，几率算法可以进行修改
	--odds = 90 - (GemQual - 1) * 5
	odds = 25
	if MatIndex1 == 30900009 then --低级宝石镶嵌符
		odds = 50
	end
	if MatIndex1 == 30900010 then --高级宝石镶嵌符
		odds = 75
	end
	rand = random(100)


	-- 计算精力消耗
	EnergyCost = GemQual * 2 + 1
	MyNewEnergy = GetHumanEnergy( sceneId, selfId ) - EnergyCost
	if MyNewEnergy < 0 then
		return 4
	end

	--消耗金钱
	local GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	local ret = LuaFnCostMoney( sceneId, selfId, need_money )
	if ret ~= 1 then
--		BeginEvent(sceneId)
--		AddText(sceneId,"金钱不足。");
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
		return 4 --代码里面没有相关定义
	end

	-- 消耗精力
	SetHumanEnergy( sceneId, selfId, MyNewEnergy )

	if odds>rand then
		--增加熟练度
		--x701601_GainExperience(sceneId, selfId, ABILITY_XIANGQIAN, GemQual)
		return 0 --镶嵌成功
	else
		if MatIndex2 == 30900011 then --宝石强化符
			if GemQual <= 1 then
				return 1 --宝石没了
			else
				return 5 --宝石降1级
			end
		else
			if GemQual <= 2 then
				return 1 --宝石没了
			else
				return 6 --宝石降2级
			end
		end
	end
end

--宝石镶嵌时判断两个宝石是否冲突
--Gem1SerialNumber 宝石的序列号
--Gem2SerialNumber 宝石的序列号
--返回值 true 表示冲突，false 表示不冲突
function	x701601_IsGemConflict(sceneId, Gem1SerialNumber, Gem2SerialNumber)
	--得到物品的类型（宝石大类）
	return (LuaFnGetItemType(Gem1SerialNumber) == LuaFnGetItemType(Gem2SerialNumber))
end

function	x701601_IsGemFitEquip(sceneId, selfId, GemSerialNum, EquipBagIndex)
	EquipType = LuaFnGetBagEquipType(sceneId, selfId, EquipBagIndex)
	GemType = LuaFnGetItemType(GemSerialNum)
	GemQual = GetItemQuality(GemSerialNum)
	GemCount = GetGemEmbededCount(sceneId, selfId, EquipBagIndex)
	if GemQual <= 0 or GemQual > 9 then
		return 0
	end
	local need_money = x701601_g_EquipGemCost[GemQual]
	if GemCount == 1 then
		need_money = need_money * 2
	elseif GemCount == 2 then
		need_money = need_money * 3
	end
	
	local money = GetMoney( sceneId, selfId )
	if money < need_money then
		return 0
	end

--每个孔当中的镶嵌的宝石必须不同类型	
	local i
	for i=0, GemCount-1 do
		GemEmbededType = GetGemEmbededType(sceneId, selfId, EquipBagIndex, i)
		if GemEmbededType == GemType then
			return 0
		end
	end
	
	if EquipType == -1 then
		return 0
	end

	for i, gem in x701601_g_EquipGemTable[EquipType] do
		if gem == GemType then
			return 1
		end
	end

	return 0
end

--采集类生活技能的精力消耗处理
function x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	if not x701601_g_EnergyCostTbl[AbilityID] then
		return
	end

	local energyCost = x701601_g_EnergyCostTbl[AbilityID][BaseLevel]
	if not energyCost then
		energyCost = 0
	end

	return energyCost
end

--采集类生活技能的精力消耗处理
function x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
	local energyCost = x701601_CalcEnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)

	if energyCost > 0 then
		local curEnergy = GetHumanEnergy( sceneId, selfId )
		curEnergy = curEnergy - energyCost
		if curEnergy < 0 then
			curEnergy = 0
		end

		--设置消耗后的精力
		SetHumanEnergy( sceneId, selfId, curEnergy )
	end
end

--种植技能的精力消耗处理
function x701601_EnergyCostZhongZhi(sceneId, selfId, AbilityID, BaseLevel)
	x701601_EnergyCostCaiJi(sceneId, selfId, AbilityID, BaseLevel)
end

--制药技能活力消耗
function x701601_VigorCostZhiYao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--烹饪技能活力消耗
function x701601_VigorCostPengRen( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	if RecipeLevel < 8 then
		cost = 5 + 5 * RecipeLevel
	else
		cost = 40
	end

	return cost
end

--打造技能活力消耗
function x701601_VigorCostDazao( sceneId, selfId, AbilityID, RecipeLevel )
	local cost = 0

	cost = 5 + 15 * RecipeLevel

	return cost
end

--宝石摘除接口
--返回值 0:成功（低级宝石摘除符） 1:无此装备 2:宝石位置错误 3:装备上没有宝石 4:装备非法 8:需要宝石摘除符 9:成功（高级宝石摘除符）
function	x701601_ReomveProc(sceneId,selfId, EquipIndex, GemIndex, MatIndex)
	local equip_point = LuaFnGetBagEquipType(sceneId,selfId, EquipIndex)
	if equip_point == -1 then
		return 1
	end
	
	local gem_type = GetGemEmbededType(sceneId,selfId, EquipIndex, GemIndex)
	if gem_type == 0 then
		return 3
	end
	if gem_type == -1 then
		return 4
	end
	local gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatIndex )
	
	if gem_index == 30900012 then  --低级宝石摘除符
		return 0
	elseif (gem_index >= 30900036 and gem_index <= 30900044) then  --高级宝石摘除符
		return 9
	else
	  return 8
	end

end

--宝石摘除接口
--宝石摘除后的相关处理（发送世界公告）
function	x701601_SplitGemSucceed(sceneId,selfId, EquipPos, GemPos, MatPos)

    --增加特效
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		
    local CharmId = LuaFnGetItemTableIndexByIndex( sceneId, selfId, MatPos )
    --大于等于3级以上高级宝石摘除符使用摘除成功发出世界公告
    if (CharmId >= 30900038 and CharmId <= 30900044) then  --高级宝石摘除符
		   local PlayerName = GetName(sceneId,selfId)
		   local GemInfo = GetBagItemTransfer( sceneId, selfId, GemPos )
		   local MatInfo = GetBagItemTransfer( sceneId, selfId, MatPos )
	     str = format( "#H#{_INFOUSR%s}拿着#{_INFOMSG%s}嘴里念念有词，只见#{_INFOMSG%s}慢慢剥落，竟毫无损伤，真是极品之符啊！", PlayerName, MatInfo, GemInfo)
	     BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	  end

end
