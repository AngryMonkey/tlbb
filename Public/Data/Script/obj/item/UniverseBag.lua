--江湖干坤袋 Created by Dengxx
--脚本号
x300083_g_scriptId = 300083

x300083_ItemList = {
	{1,30008059},  --1
	{10,30008060}, --2
	{20,30008061}, --3
	{30,30008062}, --4
	{35,30008063}, --5
	{40,30008064}, --6
	{45,30008065}, --7
	{50,30504113}, --8
	{55,30504114}, --9
	{60,30504115}, --10
	{65,30504116}, --11
	{70,30504117}, --12
	{100,30504118}, --13 这个是补领的70级包
}
--modify by qds。 item :物品ID,num:给的物品数量，这里的都是不用程序进行绑定的。
x300083_GiftList = {}
x300083_GiftList[1]={{item=30008060,num=1},{item=30308021,num=1}}
x300083_GiftList[2]={{item=30008061,num=1},{item=10124153,num=1},{item=30008066,num=1}}
x300083_GiftList[3]={{item=30008062,num=1},{item=30607002,num=1},{item=31000006,num=1},{item=20309010,num=24}}
x300083_GiftList[4]={{item=30008063,num=1},{item=30008027,num=1},{item=20309018,num=32}}
x300083_GiftList[5]={{item=30008064,num=1},{item=31000005,num=1},{item=30008027,num=1}}
x300083_GiftList[6]={{item=30008065,num=1},{item=30008027,num=1},{item=20309012,num=50}}
x300083_GiftList[7]={{item=30504113,num=1},{item=30008027,num=1},{item=30504038,num=10},{item=20309012,num=8},{item=20310000,num=15}}
x300083_GiftList[8]={{item=30504114,num=1},{item=20309013,num=24},{item=20310000,num=15}}
x300083_GiftList[9]={{item=30504115,num=1}}
x300083_GiftList[10]={{item=30504116,num=1},{item=20310000,num=60}}
x300083_GiftList[11]={{item=30504117,num=1},{item=20310000,num=60}}
x300083_GiftList[12]={{item=30505192,num=1},{item=20310000,num=60}}
x300083_GiftList[13]={{item=30505192,num=1},{item=20310000,num=60}}

--这里的是要程序进行绑定的物品,必须一个一个地给,所以物品数量都是1,有多个的就写多个ID了。
x300083_BindGiftList = {}
x300083_BindGiftList[1]={30308035,10141805}
x300083_BindGiftList[2]={}
x300083_BindGiftList[3]={}
x300083_BindGiftList[4]={}
x300083_BindGiftList[5]={}
x300083_BindGiftList[6]={}
x300083_BindGiftList[7]={30309056}
x300083_BindGiftList[8]={30505076,50313004}
x300083_BindGiftList[9]={30505076,20500001,20501001,20502001}
x300083_BindGiftList[10]={30505076,30505076,10141108}
x300083_BindGiftList[11]={30505076,30505076}
x300083_BindGiftList[12]={50313004,50313004}
x300083_BindGiftList[13]={30505076,30505076,20500001,20501001,20502001,50313004}

x300083_FreeSpaceList = {
	{4,0},  --1
	{3,0},  --2
	{3,2},  --3
	{2,2},  --4
	{3,0},  --5
	{2,3},  --6
	{5,2},  --7
	{2,4},  --8
	{2,3},  --9
	{4,2},  --10
	{4,2},  --11
	{1,4},  --12
	{3,6},  --13
	}
x300083_SheliziID = 30900058
x300083_SheliziExp = 300000
x300083_SheliziExp65 = 6558342 --65级干坤袋给的舍利子经验

--干坤袋的数量
x300083_MaxBagID = 13
--**********************************
--事件交互入口
--**********************************
function x300083_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end


function x300083_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300083_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口
--**********************************
function x300083_OnConditionCheck( sceneId, selfId )

	--校验Item是否有效
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
--	--检测物品是否加锁
--	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	--背包中的位置
--	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
--		x300083_MsgBox( sceneId, selfId, "#{Item_Locked}" )	--物品已加锁
--		return 0
--	end

	--查找列表
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local i = 1
	while x300083_ItemList[i][2] ~= itemIndex do
		i = i + 1
		if i > x300083_MaxBagID then break end
	end
	if i > x300083_MaxBagID then 
		return 0
	end 

	--等级不够
	local CurLevel = LuaFnGetLevel( sceneId, selfId )
	if CurLevel < x300083_ItemList[i][1] then
		x300083_MsgBox(sceneId, selfId, "#{GMTripperObj_Resource_Info_Level_Not_Enough}")
		return 0
	end
  --道具物品栏空闲位置不够
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x300083_FreeSpaceList[i][1]-1 ) then
	   local msg = format("#{XRLB_90226_1}%d#{XRLB_90226_2}",x300083_FreeSpaceList[i][1]-1)
	   --
     if x300083_FreeSpaceList[i][2]>0 then
	   	 msg = format("#{XRLB_90226_4}%d#{XRLB_90226_6}%d#{XRLB_90226_7}",x300083_FreeSpaceList[i][1]-1,x300083_FreeSpaceList[i][2])
	   end
	   
		 x300083_MsgBox( sceneId, selfId, msg)
	   return 0
	end
	
	--材料栏没有位置
--	if i >= 3 and i <= 7 then
		FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
		if( FreeSpace < x300083_FreeSpaceList[i][2] ) then
		   local msg = format("#{XRLB_90226_4}%d#{XRLB_90226_6}%d#{XRLB_90226_7}",x300083_FreeSpaceList[i][1]-1,x300083_FreeSpaceList[i][2])
			 x300083_MsgBox( sceneId, selfId, msg)
		   return 0
		end
--  end
  
  return 1

end
		 
--**********************************
--消耗检测及处理入口：
--**********************************
function x300083_OnDeplete( sceneId, selfId )

	if(0 < LuaFnDepletingUsedItem(sceneId, selfId)) then
		
		local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
		local i = 1
		while x300083_ItemList[i][2] ~= itemIndex do
			i = i + 1
			if i > x300083_MaxBagID then break end
		end
		if i > x300083_MaxBagID then 
			return 0
		end 
		--记录日志
		local str = format("%d",x300083_ItemList[i][1]);
		local guid = LuaFnObjId2Guid(sceneId, selfId);
		
		if guid ~= nil then
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_UNIVERSEBAG, guid,str);
		end	
		return 1;
	end
	return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300083_OnActivateOnce( sceneId, selfId )
	
	local itemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local i = 1
	while x300083_ItemList[i][2] ~= itemIndex do
		i = i + 1
		if i > x300083_MaxBagID then break end
	end
	if i > x300083_MaxBagID then 
		return 0
	end 
	
	BeginAddItem( sceneId )
	for j=1,getn(x300083_GiftList[i]) do
	  AddItem( sceneId, x300083_GiftList[i][j].item, x300083_GiftList[i][j].num )
	end
	local ret = EndAddItem( sceneId, selfId )
	if ret > 0 then
	  AddItemListToHuman(sceneId,selfId)
	else 
		return 0
	end
	
	--给绑定的物品
	local BindNum =getn(x300083_BindGiftList[i])
	if BindNum>0 then
	  for j, itemID in x300083_BindGiftList[i] do
			local BindBagIndex = TryRecieveItem( sceneId, selfId, itemID, QUALITY_CREATE_DEFAULT )
			if BindBagIndex == -1 then
			  x300083_MsgBox(sceneId, selfId,"#{QRJ_81009_05}")
			  return 0
		  end
		  LuaFnItemBind( sceneId, selfId, BindBagIndex )
		end
	end
	
  
  --45级给个300000经验的珍兽舍利子,65级给一个
	if i==7 or i==11 then 
		local BagIndex = TryRecieveItem( sceneId, selfId, x300083_SheliziID, QUALITY_CREATE_DEFAULT )
		if BagIndex == -1 then
			x300083_MsgBox(sceneId, selfId,"#{QRJ_81009_05}")
			return 0
		end
		--强制绑定
		LuaFnItemBind( sceneId, selfId, BagIndex )
		--设置舍利子经验
		if i==7 then
		  SetBagItemParam	(sceneId, selfId,BagIndex,4 ,2 , x300083_SheliziExp)
		elseif i==11 then
		  SetBagItemParam	(sceneId, selfId,BagIndex,4 ,2 , x300083_SheliziExp65)
		end
		LuaFnRefreshItemInfo( sceneId, selfId, BagIndex )
	end 	

	--提示信息
	local msg = format("#{XRLB_81203_7}#{_ITEM%d}#{XRLB_81203_8}",x300083_ItemList[i][2])
	x300083_MsgBox( sceneId, selfId, msg)
	return 1;
end

--**********************************
--引导心跳处理入口：
--返回：1继续下次心跳；0：中断引导。
--**********************************
function x300083_OnActivateEachTick( sceneId, selfId)
	return 1; 
end

--**********************************
--醒目信息提示
--**********************************
function x300083_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
