--生长点
--对应生活技能：-1
--梅岭宝物掉落器
--脚本号******(712517)

--一个宝箱里含有几个物品
x712517_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1个的几率
	{num = 2, odd = 0.4},	--2个的几率
	{num = 3, odd = 0.2},	--3个的几率
	{num = 4, odd = 0.15},	--4个的几率
	{num = 5, odd = 0.05},	--5个的几率
}

x712517_g_TickCreate_Msg = ""

--每种物品是哪类物品，且此类物品堆叠数量是几个
x712517_g_DropTable = {
	--血药类
	{
		itemType = 1, 	--血药类的类型标识
	 	odd = 0.284, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						30001004,30003007,30101037,
					},
	},
	--蓝药类
	{
		itemType = 2, 	--蓝药类的类型标识
	 	odd = 0.293, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						30002004,30101047,
					},
	},
	--口粮
	{
		itemType = 3, 	--口粮的类型标识
	 	odd = 0.2, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						30602007,30603007,30604007,30605007,
					},
	},
	--材料类
	{
		itemType = 4, 	--材料类的类型标识
	 	odd = 0.1, 			--出现几率
	 	numOdd = {
							{num = 2, odd = 0.2},				--2个的几率
							{num = 4, odd = 0.4},				--4个的几率
							{num = 6, odd = 0.2},				--6个的几率
							{num = 8, odd = 0.15},			--8个的几率
							{num = 10, odd = 0.05},			--10个的几率
						 },
		idx = {	--物品序列号表
						20101001,20101002,20102001,20102013,20103001,20104001,20105001,
					},
	},
	--伴生类
	{
		itemType = 12, 	--伴生类的类型标识
	 	odd = 0.02, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.3},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.3},				--3个的几率
						 },
		idx = {	--物品序列号表
						20102031,20103019,20103031,20103043,20103055,20105019,
					},
	},
	--白色武器类
	{
		itemType = 5, 	--白色武器类的类型标识
	 	odd = 0.045, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10100007,10101007,10102007,10103007,10104007,10105007,
					},
	},
	--蓝色武器类
	{
		itemType = 10, 	--蓝色武器类的类型标识
	 	odd = 0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						 10200007,10201007,10202007,10203007,10204007,10205007,
					},
	},
	--白色装备类
	{
		itemType = 6, 	--白色装备类的类型标识
	 	odd = 0.045, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10110018,10110019,10110020,10110021,10110022,10110023,10111018,10111019,10111020,10111021,10111022,10111023,10112018,10112019,10112020,10112021,10112022,10112023,10113018,10113019,10113020,10113021,10113022,10113023,10120007,10121007,10122007,
					},
	},
	--蓝色装备类
	{
		itemType = 11, 	--蓝色装备类的类型标识
	 	odd = 0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						 10210013,10211013,10212013,10213013,10220007,10221007,10222007,
					},
	},
	--宝石类
	{
		itemType = 7, 	--宝石类的类型标识
	 	odd = 0.001, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						50101001,50101002,50102001,50102002,50102003,50102004,50103001,50104002,50111001,50111002,50112001,50112002,50112003,50112004,50113001,50113002,50113003,50113004,50113005,50114001,
					},
	},
	--烹饪配方类
	{
		itemType = 8, 	--烹饪配方类的类型标识
	 	odd = 0.002, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						
					},
	},
	--制造配方类
	{
		itemType = 13, 	--制造配方类的类型标识
	 	odd = 0.01, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						30302200 ,30302205	,30302210	,30302215	,30302220	,30302225	,30302230	,30302235	,30302240	,30302245	,30302250	,30302255	,30302260	,30302265	,30302270	,30302275	,30302280	,30302285	,30302290	,30302295	,30302300	,30302305	,30302310	,30302315,
					},
	},
	--珍兽
	{
		itemType = 9, 	--珍兽的类型标识
	 	odd = -1.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 0.0},				--1个的几率
						 },
		idx = {	--珍兽序列号表
						3009,3019,3029,
					},
	},
}

--宝物回收时间2006-8-21 17:33 修改为由管理器传递进来

--根据本次随机数来找到表中对应的索引
function x712517_GetTableIndexByOdd(tb)
	local oddNow = random();
	
	local base = 0.0;
	for i = 1, getn(tb) do
		if(tb[i].odd + base >= oddNow) then
			return i;
		end
		base = base + tb[i].odd;
	end
	
	return nil;
end

--生成函数开始************************************************************************
--每个ItemBox中最多10个物品，返回值 -1 直接回收生长点，不占用
function x712517_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱或珍兽的消失时间
	
	-- 宝箱里有几个物品
	local numIdx = x712517_GetTableIndexByOdd(x712517_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712517_g_DropNumTable[numIdx].num do
			--这个物品是什么类型的物品
			local showIdx = x712517_GetTableIndexByOdd(x712517_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--这个类型的物品数量是几个
				dropNumIdx = x712517_GetTableIndexByOdd(x712517_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712517_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712517_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712517_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712517_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " 号场景 (" .. x .. ", " .. y .. ") 处长出一个物品箱。"..
											 "("..x712517_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712517_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712517_g_DropTable[showIdx].idx)))
					local petId = x712517_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712517_g_DropTable[showIdx].numOdd[dropNumIdx].num do
						local PetObjId = nil
						PetObjId = CreatePetOnScene( sceneId, petId, x, y )
						SetCharacterDieTime( sceneId, PetObjId, delDur )
						print( sceneId .. " 号场景 (" .. x .. ", " .. y .. ") 处长出一只珍兽 "..
									 GetName( sceneId, PetObjId ) .. "。" )
					end 
				end
			end --end of if(showIdx) then
			
			--记录物品掉落包所包含的内容
			if(showIdx and dropNumIdx and itemId ~= nil) then
				if(9 ~= x712517_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("物品箱里有(类型"..x712517_g_DropTable[showIdx].itemType..")"..
								x712517_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"个["..itemName.."]。")
					itemNum = x712517_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "由宝箱生成");
				end
			end
			
		end -- end of for i = 1, x712517_g_DropNumTable[numIdx].num do
		
		--设定回收时间
		if(ItemBoxId) then
			SetItemBoxMaxGrowTime( sceneId, ItemBoxId, delDur )
			return 0	--这个坐标被宝箱占用了
		end
	end
	
	return -1	--这个坐标没有被占用
end
--生成函数结束**********************************************************************

--一次创建多个宝箱的完成函数开始****************************************************
function x712517_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712517_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健的server对话平台
		print( sceneId .. " 号场景 "..x712517_g_TickCreate_Msg)
	end
end
--一次创建多个宝箱的完成函数结束****************************************************

--打开前函数开始
function x712517_OnOpen( sceneId, selfId, targetId )
--返回类型
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712517_OnRecycle( sceneId, selfId, targetId )
--返回1，生长点回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712517_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712517_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
