-- 食材配方、合成配方

-- 该脚本有以下二个必备功能函数：
-- x700901_AbilityCheck		- 技能使用检查函数
-- x700901_AbilityProduce	-  合成成功，负责消耗以及产出产品

-- 脚本号
x700901_g_ScriptId	= 700901

-- 原料表
x700901_g_Stuff			= {}
-- 初级食材原料
x700901_g_Stuff[1]	= { 20102001, 20102013, 20102002, 20102014, 20102003, 20102015, 20106001, 20106002, 20106003 }
-- 中级食材原料
x700901_g_Stuff[2]	= { 20102004, 20102016, 20102005, 20102017, 20102006, 20102018, 20106004, 20106005, 20106006 }
-- 高级食材原料
x700901_g_Stuff[3]	= { 20102007, 20102008, 20102009, 20102010, 20102011, 20102012, 20102019, 20102020, 20102021,20102022,20102023,20102024,20102040,20102041,20102042,20102043,20102044,20102045,20102046,20102047,20106007,20106008,20106009,20106010,20106011,20106012 }


-- 配方表
-- 索引为配方 ID
-- abilityId: 生活技能号
-- recipeLevel: 配方等级
-- matTbl: 该配方使用的材料组表
--		matList:某个档次的材料清单
--		count:使用该档次的材料需要的数量
-- Product: 产品
x700901_g_CompoundInfo			= {}
-- 初级食材
x700901_g_CompoundInfo[558]	= {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[1], count = 10 },
	},
	Product = 20102037,
}
-- 中级食材
x700901_g_CompoundInfo[559] = {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[2], count = 10 },
	},
	Product = 20102038,
}
-- 高级食材
x700901_g_CompoundInfo[560] = {
	abilityId = ABILITY_PENGREN,
	recipeLevel = 1,
	matTbl = {
		{ matList = x700901_g_Stuff[3], count = 10 },
	},
	Product = 20102039,
}

-- 背包需要的空间
x700901_g_BagSpace	= 1

----------------------------------------------------------------------------------------
--	技能使用检查函数
----------------------------------------------------------------------------------------
function x700901_AbilityCheck( sceneId, selfId, recipeId )
	local CompoundInfo = x700901_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- 检测背包是不是有空格，没有空格就不能进行
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < x700901_g_BagSpace then
		return OR_BAG_OUT_OF_SPACE
	end

	local abilityLevel = QueryHumanAbilityLevel( sceneId, selfId, CompoundInfo.abilityId )
	if abilityLevel < CompoundInfo.recipeLevel then
		return OR_NO_LEVEL
	end

	-- 判断身上的材料是否足够
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0

	for i = 1, tblCount do
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		if not matInfo then
			print( "Exception: An unexpected value of the variable [i] in function [x700901_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700901_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		for idx, MatSN in matInfo.matList do
			Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

			-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
			if Count >= matInfo.count then
				bMatEnoughFlag = 1
				break
			end
		end

		if bMatEnoughFlag == 1 then
			break
		end
	end

	if bMatEnoughFlag == 1 then
		return OR_OK
	end

	return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	产出产品
----------------------------------------------------------------------------------------
function x700901_AbilityProduce( sceneId, selfId, recipeId )
	local CompoundInfo = x700901_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- 消耗材料
	local i, matInfo, tblCount, bMatEnoughFlag, idx, MatSN, Count, DelCount

	tblCount = getn( CompoundInfo.matTbl )
	bMatEnoughFlag = 0
	DelCount = 0

	for i = 1, tblCount do
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		if not matInfo then
			print( "Exception: An unexpected value of the variable [i] in function [x700901_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700901_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		for idx, MatSN in matInfo.matList do
			Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

			-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
			if Count >= matInfo.count then
				bMatEnoughFlag = 1
				break
			end
		end

		if bMatEnoughFlag == 1 then
			Count = matInfo.count

			for idx, MatSN in matInfo.matList do
				DelCount = LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

				if DelCount > 0 then
					if DelCount > Count then
						DelCount = Count
					end

					LuaFnDelAvailableItem( sceneId, selfId, MatSN, DelCount )
					Count = Count - DelCount

					-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
					if Count < 1 then
						bMatEnoughFlag = 2
						break
					end
				end
			end
		end

		if bMatEnoughFlag == 1 then
			return OR_ERROR
		elseif bMatEnoughFlag == 2 then
			break
		end
	end

	if bMatEnoughFlag ~= 2 then
		return OR_STUFF_LACK
	end

	if LuaFnTryRecieveItem( sceneId, selfId, CompoundInfo.Product, QUALITY_MUST_BE_CHANGE ) < 0 then
		LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 0)
		return OR_ERROR
	end

	LuaFnSendAbilitySuccessMsg( sceneId, selfId, CompoundInfo.abilityId, recipeId, CompoundInfo.Product )
	LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 1)
	return OR_OK
end
