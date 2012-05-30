-- 创建人[ QUFEI 2007-09-30 21:53 UPDATE BugID 25497 ]
-- 修改[褚少微 2008.5.22 添加新的27个神器]

-- 神器合成配方
-- ItemID = 10300000~10305005(神器配方)				10300100~10305202（102级神器）
-- ResourceID = 30505900~30505905(连戎神节)		30505906（连戎神节7级）
-- 335134
-- 通过连戎神节与神器配方合成神器
-- 材料可以使用1次
-- 使用完就删除材料

-- 该脚本有以下二个必备功能函数：
-- x335134_AbilityCheck		- 技能使用检查函数
-- x335134_AbilityProduce	-  合成成功，负责消耗以及产出产品

-- 脚本号
x335134_g_ScriptId	= 335134

-- 材料表 连戎神节
x335134_g_Stuff			= { 30505900, 30505901, 30505902, 30505903, 30505904, 30505905, 30505906 }		-- 褚少微 2008.5.22 添加连戎神节7级 30505906

-- 配方表
-- 索引为配方 ID
-- abilityId: 生活技能号
-- recipeLevel: 配方等级
-- matTbl: 该配方使用的材料组表
--		matList:某个档次的材料清单
--		count:使用该档次的材料需要的数量
-- Product: 产品
x335134_g_CompoundInfo			= {}
-- 神器配方表 熔金落日
x335134_g_CompoundInfo[419]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10300000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10300001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10300002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10300003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10300004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10300005, },
	},
}

-- 神器配方表 秋水无痕
x335134_g_CompoundInfo[420]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10302000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10302001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10302002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10302003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10302004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10302005, },
	},	
}

-- 神器配方表 碧海银涛
x335134_g_CompoundInfo[421]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10305000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10305001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10305002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10305003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10305004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10305005, },
	},	
}

-- 神器配方表 万壑松风
x335134_g_CompoundInfo[422]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[1], count = 1, Product = 10304000, },
		{ matList = x335134_g_Stuff[2], count = 1, Product = 10304001, },
		{ matList = x335134_g_Stuff[3], count = 1, Product = 10304002, },
		{ matList = x335134_g_Stuff[4], count = 1, Product = 10304003, },
		{ matList = x335134_g_Stuff[5], count = 1, Product = 10304004, },
		{ matList = x335134_g_Stuff[6], count = 1, Product = 10304005, },
	},
}

----------------------------------------------------------------------------------------
-- 褚少微 2008.5.22 添加7种102级神器
----------------------------------------------------------------------------------------
-- 神器配方表 大夏龙雀
x335134_g_CompoundInfo[980]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300100, },
	},
}
-- 神器配方表 大夏龙雀1
x335134_g_CompoundInfo[981]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300101, },
	},
}
-- 神器配方表 大夏龙雀2
x335134_g_CompoundInfo[982]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10300102, },
	},
}


-- 神器配方表 大商尘影
x335134_g_CompoundInfo[983]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302100, },
	},
}
-- 神器配方表 大商尘影1
x335134_g_CompoundInfo[984]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302101, },
	},
}
-- 神器配方表 大商尘影2
x335134_g_CompoundInfo[985]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10302102, },
	},
}

-- 神器配方表 大周岚夜
x335134_g_CompoundInfo[986]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303100, },
	},
}
-- 神器配方表 大周岚夜1
x335134_g_CompoundInfo[987]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303101, },
	},
}
-- 神器配方表 大周岚夜2
x335134_g_CompoundInfo[988]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303102, },
	},
}

-- 神器配方表 大秦锋镝
x335134_g_CompoundInfo[989]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301100, },
	},
}
-- 神器配方表 大秦锋镝1
x335134_g_CompoundInfo[990]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301101, },
	},
}
-- 神器配方表 大秦锋镝2
x335134_g_CompoundInfo[991]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301102, },
	},
}

-- 神器配方表 大汉弘纲
x335134_g_CompoundInfo[992]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305100, },
	},
}
-- 神器配方表 大汉弘纲1
x335134_g_CompoundInfo[993]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305101, },
	},
}
-- 神器配方表 大汉弘纲2
x335134_g_CompoundInfo[994]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305102, },
	},
}

-- 神器配方表 大晋星痕
x335134_g_CompoundInfo[995]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303200, },
	},
}
-- 神器配方表 大晋星痕1
x335134_g_CompoundInfo[996]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303201, },
	},
}
-- 神器配方表 大晋星痕2
x335134_g_CompoundInfo[997]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10303202, },
	},
}

-- 神器配方表 大隋凝霜
x335134_g_CompoundInfo[998]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305201, },
	},
}

-- Bug ID错误
-- 神器配方表 大隋凝霜1
x335134_g_CompoundInfo[999]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305200, },
	},
}
-- 神器配方表 大隋凝霜2
x335134_g_CompoundInfo[1000]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10305202, },
	},
}

-- 神器配方表 大唐昆岳
x335134_g_CompoundInfo[1001]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301200, },
	},
}
-- 神器配方表 大唐昆岳1
x335134_g_CompoundInfo[1002]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301201, },
	},
}
-- 神器配方表 大唐昆岳2
x335134_g_CompoundInfo[1003]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10301202, },
	},
}

-- 神器配方表 大宋君岑
x335134_g_CompoundInfo[1004]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304100, },
	},
}
-- 神器配方表 大宋君岑
x335134_g_CompoundInfo[1005]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304101, },
	},
}
-- 神器配方表 大宋君岑
x335134_g_CompoundInfo[1006]	= {
	abilityId = ABILITY_ZHUZAO,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x335134_g_Stuff[7], count = 1, Product = 10304102, },
	},
}
----------------------------------------------------------------------------------------
-- 褚少微 2008.5.22 添加7种102级神器
----------------------------------------------------------------------------------------

-- 背包需要的空间
x335134_g_BagSpace	= 1

-- 使用配方铸成神器时的特效ID
x335134_g_ImpactID = 152

----------------------------------------------------------------------------------------
--	技能使用检查函数
----------------------------------------------------------------------------------------
function x335134_AbilityCheck( sceneId, selfId, recipeId )
	-- PrintStr("AbilityCheck...")
	
	local CompoundInfo = x335134_g_CompoundInfo[recipeId]
	
	--PushDebugMessage("CompoundInfo ="..CompoundInfo)
	 
	if not CompoundInfo then
		return OR_ERROR
	end

	-- 检测背包是不是有空格，没有空格就不能进行
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < x335134_g_BagSpace then
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

	-- PrintStr("tblCount ="..tblCount)

	for i = 1, tblCount do
		
		Count = 0
		matInfo = CompoundInfo.matTbl[i]
		-- PrintStr("matInfo ="..matInfo.matList)
		if not matInfo then			
			print( "Exception: An unexpected value of the variable [i] in function [x335134_AbilityCheck], the value is ", i )
			-- PrintStr("not matInfo")
			return OR_STUFF_LACK
		end

		if not matInfo.matList then			
			print( "Exception: An unexpected value of the variable [matInfo] in function [x335134_AbilityCheck], the value is ", matInfo )
			--PrintStr("matInfo.matList")
			return OR_STUFF_LACK
		end		

		-- PrintStr("matList ="..matInfo.matList)
		
		MatSN = matInfo.matList
		-- PrintStr("MatSN ="..MatSN)
		Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )
		-- PrintStr("Count ="..Count)

		-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
		if Count >= matInfo.count then
			bMatEnoughFlag = 1			
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

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
function x335134_AbilityProduce( sceneId, selfId, recipeId )
	-- PrintStr("AbilityProduce...")
	local CompoundInfo = x335134_g_CompoundInfo[recipeId]
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
			print( "Exception: An unexpected value of the variable [i] in function [x335134_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x335134_AbilityCheck], the value is ", matInfo )
			return OR_STUFF_LACK
		end

		MatSN = matInfo.matList
		-- PrintStr("MatSN ="..MatSN)
		Count = Count + LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )

		-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
		if Count >= matInfo.count then
			bMatEnoughFlag = 1			
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

		if bMatEnoughFlag == 1 then
			Count = matInfo.count

			MatSN = matInfo.matList
			-- PrintStr("MatSN ="..MatSN)
			DelCount = LuaFnGetAvailableItemCount( sceneId, selfId, MatSN )
			-- PrintStr("DelCount ="..DelCount)
			if DelCount > 0 then
				if DelCount > Count then
					DelCount = Count
				end

				LuaFnDelAvailableItem( sceneId, selfId, MatSN, DelCount )
				Count = Count - DelCount
				-- PrintStr("Count ="..Count)

				-- 在这里进行判断，以减少循环次数（特别是当材料充裕时）
				if Count < 1 then
					bMatEnoughFlag = 2					
				end
			end
		end

		-- PrintStr("bMatEnoughFlag ="..bMatEnoughFlag)

		if bMatEnoughFlag == 1 then
			return OR_ERROR
		elseif bMatEnoughFlag == 2 then
			break
		end
	end
	
	if bMatEnoughFlag ~= 2 then
		return OR_STUFF_LACK
	end

	local bagidx = LuaFnTryRecieveItem( sceneId, selfId, matInfo.Product, QUALITY_MUST_BE_CHANGE )	-- 放不下就没有了							

	if bagidx < 0 then
		LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 0)
		return OR_ERROR
	end

	-- PrintStr("Product ="..matInfo.Product)
	-- PrintStr("abilityId ="..CompoundInfo.abilityId)

	LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335134_g_ImpactID, 0 )

	-- 记录统计信息				-- 褚少微，102神器。 这行代码是记录神器日志。
	LuaFnAuditShenQi(sceneId, selfId, matInfo.Product)
	local itemInfo = GetBagItemTransfer( sceneId, selfId, bagidx )

	local playername = GetName(sceneId, selfId)
	
	-- 发送系统公告				-- 褚少微，102神器。如果是102级神器，公告发生

	local shenJie = matInfo.matList
	local strText
	if shenJie == 30505906 then
		strText = format("#{DQSJ_20080512_09}#{_INFOMSG%s}#{DQSJ_20080512_10}#{_INFOUSR%s}#{DQSJ_20080512_11}", itemInfo, playername )	
	else
		strText = format("#{XYSB_92812}#{_INFOUSR%s}#P#{XYSB_92813}#{_INFOMSG%s}。", playername, itemInfo)	
	end	

	BroadMsgByChatPipe(sceneId,selfId, strText, 4)				 											

	-- 发送系统公告				-- 褚少微，102神器。如果是102级神器，公告发生 end

	LuaFnSendAbilitySuccessMsg( sceneId, selfId, CompoundInfo.abilityId, recipeId, matInfo.Product )
	LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 1)
	return OR_OK
end

function x335134_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
