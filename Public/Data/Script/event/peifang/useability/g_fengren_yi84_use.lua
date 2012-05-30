-- 缝纫配方脚本 用于使用技能制造物品
-- *******
-- 缝纫 10 级
-- 该脚本有以下三个必备功能函数：
-- x700944_AbilityCheck ——技能使用检查函数
-- x700944_AbilityConsume ——合成结束，进行相关消耗
-- x700944_AbilityProduce ——合成成功，产出产品

--------------------------------------------------------------------------------
-- 以下部分需要改写
--------------------------------------------------------------------------------
--脚本中文名
--2级帽配方 制造物品

-- 脚本号
x700944_g_ScriptId = 700944

-- 生活技能号
x700944_g_AbilityID = ABILITY_FENGREN

-- 该项生活技能的最大级别
x700944_g_AbilityMaxLevel = 12

-- 配方号
x700944_g_RecipeID = 118

-- 配方等级(需求技能的等级)
x700944_g_RecipeLevel = 10

-- 材料表
x700944_g_CaiLiao = {
	{ID = 20105010, Count = 20},
	{ID = 20107013, Count = 22},
	{ID = 20108106, Count = 32},
	{ID = 20308079, Count = 1},
}

-- 产品表
x700944_g_ChanPin = {
	{ID = 10213036, Odds = 2000},
	{ID = 10213037, Odds = 4000},
	{ID = 10213038, Odds = 6000},
	{ID = 10213039, Odds = 8000},
	{ID = 10213040, Odds = 10000},
}
--------------------------------------------------------------------------------
-- 以上部分需要改写
--------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	技能使用检查函数
----------------------------------------------------------------------------------------
function x700944_AbilityCheck(sceneId, selfId)

	-- 检测背包是不是有空格，没有空格就不能进行
	if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		return OR_BAG_OUT_OF_SPACE
	end

	-- 检查其他消耗
	VigorValue = x700944_g_RecipeLevel * 2 + 1
	if GetHumanVigor(sceneId, selfId) < VigorValue then
		return OR_NOT_ENOUGH_VIGOR
	end

	-- 检查是否材料足够

	for idx, Mat in x700944_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnGetAvailableItemCount(sceneId, selfId, Mat.ID)
		if ret < nCount then
			return OR_STUFF_LACK
		end
	end

	return OR_OK
end

----------------------------------------------------------------------------------------
--	合成结束，进行相关消耗
----------------------------------------------------------------------------------------
function x700944_AbilityConsume(sceneId, selfId)
	-- 首先进行其他消耗
	VigorCost = x700944_g_RecipeLevel * 2 + 1
	VigorValue = GetHumanVigor(sceneId, selfId) - VigorCost
	SetHumanVigor(sceneId, selfId, VigorValue)

	-- 然后进行材料消耗

	for idx, Mat in x700944_g_CaiLiao do
		nCount = Mat.Count

		ret = LuaFnDelAvailableItem(sceneId, selfId, Mat.ID, nCount)
		if ret ~= 1 then
			return 0
		end
	end

	return 1
end

----------------------------------------------------------------------------------------
--	合成成功，产出产品
----------------------------------------------------------------------------------------
function x700944_AbilityProduce(sceneId, selfId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x700944_g_AbilityID)

	-- 随机出一个数 [1, 10000]
	rand = random(10000)

	for i, item in x700944_g_ChanPin do
		if item.Odds >= rand then
			Quality = CallScriptFunction( ABILITYLOGIC_ID, "CalcQuality", sceneId, x700944_g_RecipeLevel, AbilityLevel, x700944_g_AbilityMaxLevel,item.ID )

			local pos = LuaFnTryRecieveItem(sceneId, selfId, item.ID, QUALITY_MUST_BE_CHANGE)
			if pos ~= -1 then
				LuaFnSetItemCreator( sceneId, selfId, pos, LuaFnGetName( sceneId, selfId ) )
			else
				return OR_ERROR
			end

			LuaFnAuditAbility( sceneId, selfId, x700944_g_AbilityID, x700944_g_RecipeID, Quality )
			LuaFnSendAbilitySuccessMsg( sceneId, selfId, x700944_g_AbilityID, x700944_g_RecipeID, item.ID )
			return OR_OK
		end
		LuaFnAuditAbility( sceneId, selfId, x700944_g_AbilityID, x700944_g_RecipeID, 0 )
	end

	return OR_ERROR
end
