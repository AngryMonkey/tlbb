--生长点
--对应生活技能：-1
--大理宝物掉落器
--脚本号******(712501)

--一个宝箱里含有几个物品
x712501_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1个的几率
	{num = 2, odd = 0.4},	--2个的几率
	{num = 3, odd = 0.2},	--3个的几率
	{num = 4, odd = 0.15},	--4个的几率
	{num = 5, odd = 0.05},	--5个的几率
}

x712501_g_TickCreate_Msg = "天女散花！！大理城会落下物品送给大家！"

--每种物品是哪类物品，且此类物品堆叠数量是几个
x712501_g_DropTable = {
	--血药类
	{
		itemType = 1, 	--血药类的类型标识
	 	odd = 0.5, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						30001001,30003001,30101031,
					},
	},
	--蓝药类
	{
		itemType = 2, 	--蓝药类的类型标识
	 	odd = 0.3, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						30002001,30101041,
					},
	},
	--口粮
	{
		itemType = 3, 	--口粮的类型标识
	 	odd = 0.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 0.2},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.2},				--3个的几率
							{num = 4, odd = 0.15},			--4个的几率
							{num = 5, odd = 0.05},			--5个的几率
						 },
		idx = {	--物品序列号表
						20103001,20103002,20103003,20103004,20103005,		--矿石
						20103006,20103007,20103008,20103009,20103010,
					},
	},
	--材料类
	{
		itemType = 4, 	--材料类的类型标识
	 	odd = 0.0, 			--出现几率
	 	numOdd = {
							{num = 2, odd = 0.2},				--2个的几率
							{num = 4, odd = 0.4},				--4个的几率
							{num = 6, odd = 0.2},				--6个的几率
							{num = 8, odd = 0.15},			--8个的几率
							{num = 10, odd = 0.05},			--10个的几率
						 },
		idx = {	--物品序列号表
						20104001,20104002,20104003,20104004,20104005,		--小麦
						20104006,20104007,20104008,20104009,20104010,
					},
	},
	--白色武器类
	{
		itemType = 5, 	--白色武器类的类型标识
	 	odd = 0.1, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10100001,10101001,10102001,10103001,10104001,10105001,
					},
	},
	--蓝色武器类
	{
		itemType = 10, 	--蓝色武器类的类型标识
	 	odd = 0.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
					},
	},
	--白色装备类
	{
		itemType = 6, 	--白色装备类的类型标识
	 	odd = 0.1, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10110001,10110002,10110003,10111001,10111002,10111003,10112001,
						10112002,10112003,10113001,10113002,10113003,10120001,10121001,
						10122001,
					},
	},
	--蓝色装备类
	{
		itemType = 11, 	--蓝色装备类的类型标识
	 	odd = 0.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
					},
	},
	--宝石类
	{
		itemType = 7, 	--宝石类的类型标识
	 	odd = 0.0, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						20107001,20107002,20107003,20107004,20107005,		--草皮革
						20107006,20107007,20107008,20107009,20107010,
					},
	},
	--配方类
	{
		itemType = 8, 	--配方类的类型标识
	 	odd = 0.0, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						20108001,20108002,20108003,20108004,20108005,		--残缺、坏掉
						20108006,20108007,20108008,20108009,20108010,
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
function x712501_GetTableIndexByOdd(tb)
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
function x712501_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱或珍兽的消失时间
	
	-- 宝箱里有几个物品
	local numIdx = x712501_GetTableIndexByOdd(x712501_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712501_g_DropNumTable[numIdx].num do
			--这个物品是什么类型的物品
			local showIdx = x712501_GetTableIndexByOdd(x712501_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--这个类型的物品数量是几个
				dropNumIdx = x712501_GetTableIndexByOdd(x712501_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712501_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712501_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712501_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " 号场景 (" .. x .. ", " .. y .. ") 处长出一个物品箱。"..
											 "("..x712501_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712501_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712501_g_DropTable[showIdx].idx)))
					local petId = x712501_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712501_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("物品箱里有(类型"..x712501_g_DropTable[showIdx].itemType..")"..
								x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"个["..itemName.."]。")
					itemNum = x712501_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "由宝箱生成");
				end
			end
			
		end -- end of for i = 1, x712501_g_DropNumTable[numIdx].num do
		
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
function x712501_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712501_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健的server对话平台
		print( sceneId .. " 号场景 "..x712501_g_TickCreate_Msg)
	end
end
--一次创建多个宝箱的完成函数结束****************************************************

--打开前函数开始
function x712501_OnOpen( sceneId, selfId, targetId )
--返回类型
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712501_OnRecycle( sceneId, selfId, targetId )
--返回1，生长点回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712501_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712501_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
