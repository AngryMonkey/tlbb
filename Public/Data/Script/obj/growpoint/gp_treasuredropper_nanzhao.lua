--生长点
--对应生活技能：-1
--南诏宝物掉落器
--脚本号******(712521)

--一个宝箱里含有几个物品
x712521_g_DropNumTable  = {
	{num = 1, odd = 0.2},	--1个的几率
	{num = 2, odd = 0.4},	--2个的几率
	{num = 3, odd = 0.2},	--3个的几率
	{num = 4, odd = 0.15},	--4个的几率
	{num = 5, odd = 0.05},	--5个的几率
}

x712521_g_TickCreate_Msg = ""

--每种物品是哪类物品，且此类物品堆叠数量是几个
x712521_g_DropTable = {
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
						30001004,30003009,30101039,
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
						30002004,30101049,
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
						30602009,30603009,30604009,30605009,
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
						10100009,10101009,10102009,10103009,10104009,10105009,
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
						 10200009,10201009,10202009,10203009,10204009,10205009,
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
						10110036,10110037,10110038,10110039,10110040,10110041,10110042,10110043,10110044,10111036,10111037,10111038,10111039,10111040,10111041,10111042,10111043,10111044,10112036,10112037,10112038,10112039,10112040,10112041,10112042,10112043,10112044,10113036,10113037,10113038,10113039,10113040,10113041,10113042,10113043,10113044,10120009,10121009,10122009,
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
						 10210017,10211017,10212017,10213017,10220009,10221009,10222009,
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
						30304067,30304068,30304069,30304070,30304080,30304081,30304082,30304083,30304084,30304085,30304086,30304087,30304088,
					},
	},
	--制造配方类
	{
		itemType = 13, 	--烹饪配方类的类型标识
	 	odd = 0.01, 		--出现几率
	 	numOdd = {
							{num = 1, odd = 1.0},				--1个的几率
						 },
		idx = {	--物品序列号表
						 30302202	 ,30302207	 ,30302212	 ,30302217	 ,30302222	 ,30302227	 ,30302232	 ,30302237	 ,30302242	 ,30302247	 ,30302252	 ,30302257	 ,30302262	 ,30302267	 ,30302272	 ,30302277	 ,30302282	 ,30302287	 ,30302292	 ,30302297	 ,30302302	 ,30302307	 ,30302312	 ,30302317,

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
function x712521_GetTableIndexByOdd(tb)
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
function x712521_OnCreate( sceneId, growPointType, x, y, dur)
	local ItemBoxId = nil
	local delDur = dur - 60000;	--宝箱或珍兽的消失时间
	
	-- 宝箱里有几个物品
	local numIdx = x712521_GetTableIndexByOdd(x712521_g_DropNumTable)
	if(numIdx) then
		for i = 1, x712521_g_DropNumTable[numIdx].num do
			--这个物品是什么类型的物品
			local showIdx = x712521_GetTableIndexByOdd(x712521_g_DropTable)
			local dropNumIdx = nil
			local itemId = nil
			if(showIdx) then
				--这个类型的物品数量是几个
				dropNumIdx = x712521_GetTableIndexByOdd(x712521_g_DropTable[showIdx].numOdd)
				if(dropNumIdx and 9 ~= x712521_g_DropTable[showIdx].itemType) then
					local itemNum = getn(x712521_g_DropTable[showIdx].idx)
					if(itemNum and 1<=itemNum) then
						local itemIdx = floor(random(1, itemNum))
						itemId = x712521_g_DropTable[showIdx].idx[itemIdx]
						--添加掉落箱和物品到场景
						for k = 1, x712521_g_DropTable[showIdx].numOdd[dropNumIdx].num do
							if(nil == ItemBoxId) then
								ItemBoxId = ItemBoxEnterScene( x, y, growPointType, sceneId, QUALITY_MUST_BE_CHANGE,1, itemId )
								print( sceneId .. " 号场景 (" .. x .. ", " .. y .. ") 处长出一个物品箱。"..
											 "("..x712521_g_DropNumTable[numIdx].num..")" )
							else
								AddItemToBox( sceneId, ItemBoxId, QUALITY_MUST_BE_CHANGE,1, itemId )
							end
						end
					end
				elseif(dropNumIdx and 9 == x712521_g_DropTable[showIdx].itemType) then
					local petIdx = floor(random(1, getn(x712521_g_DropTable[showIdx].idx)))
					local petId = x712521_g_DropTable[showIdx].idx[petIdx]
					--添加珍兽到场景
					for k = 1, x712521_g_DropTable[showIdx].numOdd[dropNumIdx].num do
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
				if(9 ~= x712521_g_DropTable[showIdx].itemType) then
					local itemName;
					_,itemName,_ = GetItemInfoByItemId(itemId)
					print("物品箱里有(类型"..x712521_g_DropTable[showIdx].itemType..")"..
								x712521_g_DropTable[showIdx].numOdd[dropNumIdx].num..
								"个["..itemName.."]。")
					itemNum = x712521_g_DropTable[showIdx].numOdd[dropNumIdx].num;
					LuaFnAuditItemCreate(sceneId, -1, itemNum, itemId, itemName, "由宝箱生成");
				end
			end
			
		end -- end of for i = 1, x712521_g_DropNumTable[numIdx].num do
		
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
function x712521_OnTickCreateFinish( sceneId, growPointType, tickCount )
	if(strlen(x712521_g_TickCreate_Msg) > 0) then
		--2006-8-22 14:37 等待晓健的server对话平台
		print( sceneId .. " 号场景 "..x712521_g_TickCreate_Msg)
	end
end
--一次创建多个宝箱的完成函数结束****************************************************

--打开前函数开始
function x712521_OnOpen( sceneId, selfId, targetId )
--返回类型
-- 0 表示打开成功
end
--打开前函数结束


--回收函数开始
function x712521_OnRecycle( sceneId, selfId, targetId )
--返回1，生长点回收
	return 1
end
--回收函数结束

--打开后函数开始
function x712521_OnProcOver( sceneId, selfId, targetId )
end

--打开后函数结束
function x712521_OpenCheck( sceneId, selfId, AbilityId, AblityLevel )
	return OR_OK
end
