-- 辅材转化配方

-- 该脚本有以下二个必备功能函数：
-- x700959_AbilityCheck		- 技能使用检查函数
-- x700959_AbilityProduce	- 合成成功，负责消耗以及产出产品

-- 脚本号
x700959_g_ScriptId	= 700959

-- 原料表
x700959_g_Stuff			=
{
	-- 铸造
	[ 1]	= { 20103037, 20103013, 20103025, 20103049, },
	[ 2]	= { 20103038, 20103014, 20103026, 20103050, },
	[ 3]	= { 20103039, 20103015, 20103027, 20103051, },
	[ 4]	= { 20103040, 20103016, 20103028, 20103052, },
	[ 5]	= { 20103041, 20103017, 20103029, 20103053, },
	[ 6]	= { 20103042, 20103018, 20103030, 20103054, },
	[ 7]	= { 20103043, 20103019, 20103031, 20103055, },
	[ 8]	= { 20103044, 20103020, 20103032, 20103056, },
	[ 9]	= { 20103045, 20103021, 20103033, 20103057, 20103122,	20103126,	20103130,	20103134,	},
	[10]	= { 20103046, 20103022, 20103034, 20103058, 20103123,	20103127,	20103131,	20103135,	},
	[51]	= { 20103023,	20103035,	20103047,	20103059,	20103124,	20103128,	20103132,	20103136,	},
	[52]	= { 20103024,	20103036,	20103048,	20103060,	20103125,	20103129,	20103133,	20103137,	},

	-- 缝纫
	[11]	= { 20107001, 20107002, },
	[12]	= { 20107003, 20107004, },
	[13]	= { 20107005, 20107006, },
	[14]	= { 20107007, 20107008, },
	[15]	= { 20107009, 20107010, },
	[16]	= { 20107011, 20107012, },
	[17]	= { 20107013, 20107014, },
	[18]	= { 20107015, 20107016, },
	[19]	= { 20107017, },
	[20]	= { 20107018, },
	[53]	= { 20107020, },
	[54]	= { 20107019, },
	
	-- 工艺
	[21]	= { 20108133, 20108145, 20108121, },
	[22]	= { 20108134, 20108146, 20108122, },
	[23]	= { 20108135, 20108147, 20108123, },
	[24]	= { 20108136, 20108148, 20108124, },
	[25]	= { 20108137, 20108149, 20108125, },
	[26]	= { 20108138, 20108150, 20108126, },
	[27]	= { 20108139, 20108151, 20108127, },
	[28]	= { 20108140, 20108152, 20108128, },
	[29]	= { 20108141, 20108153, 20108129, },
	[30]	= { 20108142, 20108154, 20108130, },
	[55]	= { 20108131,	20108143,	20108155,	},
	[56]	= { 20108132,	20108144,	20108156, },

	-- 低级铸铁
	[31]	= { 20108001, 20108002, 20108003, 20108013, 20108014, 20108015, 20108025, 20108026, 20108027, 20108037, 20108038, 20108039, 20108049, 20108050, 20108051, 20108061, 20108062, 20108063,},
	
	-- 中级铸铁
	[32]	= { 20108004, 20108005, 20108006, 20108016, 20108017, 20108018, 20108028, 20108029, 20108030, 20108040, 20108041, 20108042, 20108052, 20108053, 20108054, 20108064, 20108065, 20108066,},

	-- 高级铸铁
	[33]	= { 20108007, 20108008, 20108009, 20108010, 20108011, 20108012, 20108019, 20108020, 20108021, 20108022, 20108023, 20108024, 20108031, 20108032, 20108033, 20108034, 20108035, 20108036,20108043,20108044,20108045,20108046,20108047,20108048,20108055,20108056,20108057,20108058,20108059,20108060,20108067,20108068,20108069,20108070,20108071,20108072,},
	
	-- 低级布片
	[34]	= { 20108073, 20108074, 20108075, 20108109, 20108110, 20108111, 20108085, 20108086, 20108087, 20108097, 20108098, 20108099, },

	-- 中级布片
	[35]	= {	20108076, 20108077, 20108078, 20108112, 20108113, 20108114, 20108088, 20108089, 20108090, 20108100, 20108101, 20108102, },

	-- 高级布片
	[36]	= {	20108079,	20108080,	20108081,	20108082,	20108083,	20108084,	20108091,	20108092,	20108093,	20108094,20108095,	20108096,	20108103,	20108104,	20108105,	20108106,	20108107,	20108108,	20108115,	20108116,	20108117,	20108118,	20108119,	20108120, },

	--衣服
	[37]	= {	20103103,	20103106,	20103109,	20308151},
	
	-- 普通布料原料
	[38]	= { 20105001, 20105002, 20105003, },
	-- 优质布料原料
	[39]	= { 20105004, 20105005, 20105006, },
	-- 极品布料原料
	[40]	= { 20105007, 20105008, 20105009, 20105010,	20105011,	20105012,	},
	
	-- 1级线团
	[41]	=	{20103106,},
	-- 2级线团
	[42]	= {20103107,},
	-- 3级线团
	[43]	= {20103108,},
	-- 1级染料
	[44]	= {20103109,},
	-- 2级染料
	[45]	= {20103110,},
	-- 3级染料
	[46]	= {20103111,},
}

-- 配方表
-- 索引为配方 ID
-- abilityId: 生活技能号
-- recipeLevel: 配方等级
-- matTbl: 该配方使用的材料组表
--		matList:某个档次的材料清单
--		count:使用该档次的材料需要的数量
-- Product: 产品
x700959_g_CompoundInfo			= {}
-- 铸造辅材转化配方
x700959_g_CompoundInfo[399]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[ 1], count = 1, Product = 20103061, },
		{ matList = x700959_g_Stuff[ 2], count = 1, Product = 20103062, },
		{ matList = x700959_g_Stuff[ 3], count = 1, Product = 20103063, },
		{ matList = x700959_g_Stuff[ 4], count = 1, Product = 20103064, },
		{ matList = x700959_g_Stuff[ 5], count = 1, Product = 20103065, },
		{ matList = x700959_g_Stuff[ 6], count = 1, Product = 20103066, },
		{ matList = x700959_g_Stuff[ 7], count = 1, Product = 20103067, },
		{ matList = x700959_g_Stuff[ 8], count = 1, Product = 20103068, },
		{ matList = x700959_g_Stuff[ 9], count = 1, Product = 20103069, },
		{ matList = x700959_g_Stuff[10], count = 1, Product = 20103070, },
		{ matList = x700959_g_Stuff[51], count = 1, Product = 20103071, },
		{ matList = x700959_g_Stuff[52], count = 1, Product = 20103072, },
	},
}
-- 缝纫辅材转化配方
x700959_g_CompoundInfo[406]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[11], count = 1, Product = 20103073, },
		{ matList = x700959_g_Stuff[12], count = 1, Product = 20103074, },
		{ matList = x700959_g_Stuff[13], count = 1, Product = 20103075, },
		{ matList = x700959_g_Stuff[14], count = 1, Product = 20103076, },
		{ matList = x700959_g_Stuff[15], count = 1, Product = 20103077, },
		{ matList = x700959_g_Stuff[16], count = 1, Product = 20103078, },
		{ matList = x700959_g_Stuff[17], count = 1, Product = 20103079, },
		{ matList = x700959_g_Stuff[18], count = 1, Product = 20103080, },
		{ matList = x700959_g_Stuff[19], count = 1, Product = 20103081, },
		{ matList = x700959_g_Stuff[20], count = 1, Product = 20103082, },
		{ matList = x700959_g_Stuff[53], count = 1, Product = 20103083, },
		{ matList = x700959_g_Stuff[54], count = 1, Product = 20103084, },
	},
}
-- 工艺辅材转化配方
x700959_g_CompoundInfo[407]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[21], count = 1, Product = 20103085, },
		{ matList = x700959_g_Stuff[22], count = 1, Product = 20103086, },
		{ matList = x700959_g_Stuff[23], count = 1, Product = 20103087, },
		{ matList = x700959_g_Stuff[24], count = 1, Product = 20103088, },
		{ matList = x700959_g_Stuff[25], count = 1, Product = 20103089, },
		{ matList = x700959_g_Stuff[26], count = 1, Product = 20103090, },
		{ matList = x700959_g_Stuff[27], count = 1, Product = 20103091, },
		{ matList = x700959_g_Stuff[28], count = 1, Product = 20103092, },
		{ matList = x700959_g_Stuff[29], count = 1, Product = 20103093, },
		{ matList = x700959_g_Stuff[30], count = 1, Product = 20103094, },
		{ matList = x700959_g_Stuff[55], count = 1, Product = 20103095, },
		{ matList = x700959_g_Stuff[56], count = 1, Product = 20103096, },
	},
}
-- 低级铸铁转化配方
x700959_g_CompoundInfo[400]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[31], count = 1, Product = 20103097, },
	},
}
-- 中级铸铁转化配方
x700959_g_CompoundInfo[401]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[32], count = 1, Product = 20103098, },
	},
}
-- 高级铸铁转化配方
x700959_g_CompoundInfo[402]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[33], count = 1, Product = 20103099, },
	},
}
-- 低级布片转化配方
x700959_g_CompoundInfo[403]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[34], count = 1, Product = 20103100, },
	},
}
-- 中级布片转化配方
x700959_g_CompoundInfo[404]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[35], count = 1, Product = 20103101, },
	},
}
-- 高级布片转化配方
x700959_g_CompoundInfo[405]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[36], count = 1, Product = 20103102, },
	},
}


-- 普通布料
x700959_g_CompoundInfo[408]	= 
{
	abilityId = ABILITY_CAILIAOHECHENG,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x700959_g_Stuff[38], count = 16, Product = 20103103,},
	},
}
-- 优质布料
x700959_g_CompoundInfo[409] =
{
	abilityId = ABILITY_CAILIAOHECHENG,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x700959_g_Stuff[39], count = 22, Product = 20103104, },
	},
	
}
-- 极品布料
x700959_g_CompoundInfo[410] = 
{
	abilityId = ABILITY_CAILIAOHECHENG,
	recipeLevel = 1,
	matTbl = 
	{
		{ matList = x700959_g_Stuff[40], count = 29 , 	Product = 20103105,},
	},
}

--线团
x700959_g_CompoundInfo[411]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[41], count = 40, Product = 20103112, },
		{ matList = x700959_g_Stuff[42], count = 40, Product = 20103113, },
		{ matList = x700959_g_Stuff[43], count = 40, Product = 20103114, },
	},
}
--染剂
x700959_g_CompoundInfo[412]	=
{
	abilityId		= ABILITY_CAILIAOHECHENG,
	recipeLevel	= 1,
	matTbl			=
	{
		{ matList = x700959_g_Stuff[44], count = 20, Product = 20103115, },
		{ matList = x700959_g_Stuff[45], count = 20, Product = 20103116, },
		{ matList = x700959_g_Stuff[46], count = 20, Product = 20103117, },
	},
}

-- 背包需要的空间
x700959_g_BagSpace		= 1

----------------------------------------------------------------------------------------
--	技能使用检查函数
----------------------------------------------------------------------------------------
function x700959_AbilityCheck( sceneId, selfId, recipeId )
	local CompoundInfo	= x700959_g_CompoundInfo[recipeId]
	if not CompoundInfo then
		return OR_ERROR
	end

	-- 检测背包是不是有空格，没有空格就不能进行
	if LuaFnGetMaterialBagSpace( sceneId, selfId ) < x700959_g_BagSpace then
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
			print( "Exception: An unexpected value of the variable [i] in function [x700959_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700959_AbilityCheck], the value is ", matInfo )
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
function x700959_AbilityProduce( sceneId, selfId, recipeId )
	local CompoundInfo = x700959_g_CompoundInfo[recipeId]
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
			print( "Exception: An unexpected value of the variable [i] in function [x700959_AbilityCheck], the value is ", i )
			return OR_STUFF_LACK
		end

		if not matInfo.matList then
			print( "Exception: An unexpected value of the variable [matInfo] in function [x700959_AbilityCheck], the value is ", matInfo )
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

	if LuaFnTryRecieveItem( sceneId, selfId, matInfo.Product, QUALITY_MUST_BE_CHANGE ) < 0 then
		LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 0)
		return OR_ERROR
	end

	LuaFnSendAbilitySuccessMsg( sceneId, selfId, CompoundInfo.abilityId, recipeId, matInfo.Product )
	LuaFnAuditAbility(sceneId, selfId, CompoundInfo.abilityId, recipeId, 1)
	return OR_OK
end
