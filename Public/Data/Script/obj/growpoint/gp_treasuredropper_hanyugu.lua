--生长点
--对应生活技能：-1
--雁北宝物掉落器
--脚本号******(712532)

--一个宝箱里含有几个物品
x712532_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1个的几率
	{num = 2, odd = 0.4},	--2个的几率
	{num = 3, odd = 0.2},	--3个的几率
	{num = 4, odd = 0.15},	--4个的几率
	{num = 5, odd = 0.05},	--5个的几率
}

x712532_g_TickCreate_Msg = ""

--每种物品是哪类物品，且此类物品堆叠数量是几个
x712532_g_DropTable = {
	--材料类
	{
		itemType = 4, 	--材料类的类型标识
	 	odd = 0.42, 			--出现几率
	 	numOdd = {
							{num = 2, odd = 0.2},				--2个的几率
							{num = 4, odd = 0.4},				--4个的几率
							{num = 6, odd = 0.2},				--6个的几率
							{num = 8, odd = 0.15},			--8个的几率
							{num = 10, odd = 0.05},			--10个的几率
						 },
		idx = {	--物品序列号表
						20101011,20101012,20101013,20102005,20102017,20103005,20104005,20105005,
					},
	},
	--伴生类
	{
		itemType = 12, 	--伴生类的类型标识
	 	odd = 0.42, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 0.3},				--1个的几率
							{num = 2, odd = 0.4},				--2个的几率
							{num = 3, odd = 0.3},				--3个的几率
						 },
		idx = {	--物品序列号表
						20102029,20103017,20103029,20103041,20103053,20105017,
					},
	},
	--高价值奇物
	{
		itemType = 3, 	--伴生类的类型标识
	 	odd = 0.01, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						30505178,
					},
	},
	--白色武器类
	{
		itemType = 5, 	--白色武器类的类型标识
	 	odd = 0.05, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10100005,10101005,10102005,10103005,10104005,10105005,
					},
	},
	--白色装备类
	{
		itemType = 6, 	--白色装备类的类型标识
	 	odd = 0.05, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						10110012,10110013,10110014,10111012,10111013,10111014,10112012,10112013,10112014,10113012,10113013,10113014,10120005,10121005,10122005,
					},
	},
	--易容丹
	{
		itemType = 7, 	--伴生类的类型标识
	 	odd = 0.04, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						30501148,30501149,30501150,
					},
	},
	--古墓行功要诀
	{
		itemType = 8, 	--伴生类的类型标识
	 	odd = 0.01, 			--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						30700200,
					},
	},
}

--宝物回收时间2006-8-21 17:33 修改为由管理器传递进来

--根据本次随机数来找到表中对应的索引
function x712532_GetTableIndexByOdd(tb)
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
function x712532_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱或珍兽的消失时间
	
	-- 宝箱里有几个物品
	local numIdx = x712532_GetTableIndexByOdd(x712532_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712532_g_DropNumTable[numIdx].num do
			--这个物品是什么类型的物品
			local showIdx = x712532_GetTableIndexByOdd(x712532_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--这个类型的物品数量是几个
				dropNumIdx = x712532_GetTableIndexByOdd(x712532_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712532_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712532_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712532_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " 号场景 (" .. x .. ", " .. y .. ") 处长出一个物品箱。"..
											 "("..x712532_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712532_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712532_g_DropTable[showIdx].idx)))
					local petId = x712532_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712532_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("物品箱里有(类型"..x712532_g_DropTable[showIdx].itemType..")"..
								x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"个["..itemName.."]。")
					itemNum = x712532_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "由宝箱生成");
				end
			end
			
		end -- end of for i = 1, x712532_g_DropNumTable[numIdx].num do
		
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
function x712532_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712532_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健的server对话平台
		print( sceneId .. " 号场景 "..x712532_g_TickCreate_Msg)
	end
end
--一次创建多个宝箱的完成函数结束****************************************************

--打开前函数开始
function x712532_OnOpen( sceneId, selfId, targetId )
--返回类型
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712532_OnRecycle( sceneId, selfId, targetId )
--返回1，生长点回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712532_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712532_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
