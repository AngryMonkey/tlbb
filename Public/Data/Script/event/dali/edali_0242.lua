-- 210242
-- 暑期活动，兑换企鹅蛋

x210242_g_ScriptId = 210242

x210242_g_ItemId = {30505114,30505115,30505116,30505117,30505118,30505119,30505120,}

x210242_g_PetEggId = 30505121

-- 掉落七星碎片活动时间[2009/2/15, 2009/4/1]
x210242_g_Drop_QiXingSuiPian_StartDay = 9045 --2009/2/15开始
x210242_g_Drop_QiXingSuiPian_EndDay = 9090 --2009/4/1结束

-- 兑换企鹅蛋活动时间[2009/2/15, 2009/5/1]
x210242_g_ExchangePenguinEggStartDay	= 9045 --2009/2/15开始
x210242_g_ExchangePenguinEggEndDay		= 9120 --2009/5/1结束
	
--**********************************
--任务入口函数
--**********************************
function x210242_OnDefaultEvent( sceneId, selfId, targetId )
	
	-- 活动时间，只在这个活动时间内能显示这个对话
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y兑换企鹅" );
			AddText(sceneId, "    活动已经过期。" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetNumText() == 1   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y兑换企鹅" );
			AddText(sceneId, "  炎热的夏天里，你想不想要一阵凉风？想不想要一杯冷饮？想不想要一丝清爽？" );
			AddText(sceneId, "  只要有全部七颗七星碎片，你就都可以获得啦！" );
			AddText(sceneId, "  一位不知名的长者，可以使用这些碎片来让天龙八部的世界变得更加清爽，而作为奖励，他还托我送给收集七星碎片的人一件最清爽的礼物！" );
			AddText(sceneId, "  一只可爱的企鹅！" );
			AddText(sceneId, "  您确认要兑换企鹅蛋吗？" );
			AddNumText(sceneId, x210242_g_ScriptId,"确定", 8, 3);
			AddNumText(sceneId, x210242_g_ScriptId,"取消", 8, 4);
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	if GetNumText() == 4   then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		return
	end
	
	if GetNumText() == 3   then
		
		-- 1，检测玩家身上是不是有一套碎片，
		local HaveAllItem = 1
		for i, ItemId in x210242_g_ItemId  do
			if GetItemCount(sceneId, selfId, ItemId) < 1   then
				HaveAllItem = 0
			end
			if GetItemCount(sceneId, selfId, ItemId) == 1   then
				BagHavePos = 1
			end
		end
		
		if HaveAllItem == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    兑换企鹅蛋需要金、木、水、火、土、日、月七种碎片各一个，您身上的碎片不全，因此无法兑换。" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 2，检测玩家的这套碎片是不是都能够删除
		local AllItemCanDelete = 1
		for i, ItemId in x210242_g_ItemId  do
			if LuaFnGetAvailableItemCount(sceneId, selfId, ItemId) < 1   then
				AllItemCanDelete = 0
				break;
			end
		end
		
		if AllItemCanDelete == 0  then
			BeginEvent(sceneId)
				AddText(sceneId, "    扣除你身上的物品失败，请检测你是否对物品加锁，或者物品处于交易状态。" );
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- 3，检测玩家身上是不是有空间放奖励
	 	BeginAddItem(sceneId)
			AddItem( sceneId, x210242_g_PetEggId, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		local delret = 1
		if ret == 1  then
			for i, ItemId in x210242_g_ItemId  do
				if LuaFnDelAvailableItem(sceneId, selfId, ItemId, 1) == 0   then
					delret = 0
					break
				end
			end
			
			if delret == 1  then
				AddItemListToHuman(sceneId,selfId)
				-- 发世界公告
				local transfer = GetItemTransfer(sceneId,selfId,0)
				local str = format("#P #{_INFOUSR%s}经过一番努力，终于收集全了象征七曜的金星、木星、水星、火星、土星、月亮、太阳七颗碎片。作为酬谢，大理的龚彩云特赠送给其一颗#{_INFOMSG%s}。",GetName(sceneId,selfId), transfer)
				BroadMsgByChatPipe(sceneId, selfId, str, 4)
				LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)

				BeginUICommand(sceneId)
				EndUICommand(sceneId)
				DispatchUICommand(sceneId,selfId, 1000)
			end
		end
		return

	end
	
	if GetNumText() == 2   then
		BeginEvent(sceneId)
			AddText(sceneId, "#Y兑换企鹅" );
			AddText(sceneId, "#{duihuanqie_shuoming}" );
			
			--AddText(sceneId, "    炎热的夏天里，你想不想要一阵凉风？想不想要一杯冷饮？想不想要一丝清爽？" );
			--AddText(sceneId, "    只要有全部七颗七星碎片，你就都可以获得啦！" );
			--AddText(sceneId, "    一位不知名的长者，可以使用这些碎片来让天龙八部的世界变得更加清爽，而作为奖励，他还托我送给收集七星碎片的人一件最清爽的礼物！" );
			--AddText(sceneId, "    一只可爱的企鹅！" );
			--AddText(sceneId, "    碎片对应的星宿不同，其中最为难得的是太阳碎片。只有在采集草药或者采集矿石的时候，才有可能获得七星碎片当中的一种。" );
			--AddText(sceneId, "    当你凑齐金星碎片，木星碎片，水星碎片，火星碎片，土星碎片，月亮碎片，太阳碎片之后，把它们交给我。我就可以代那位长者送给你一枚天下罕见的企鹅蛋。企鹅蛋可以在你等级大于等于55级时使用，使用后将会召唤出一只企鹅宝宝作为你的珍兽。" );
			--AddText(sceneId, "    需要说明的是，七星碎片只有聚集在一起的时候才有价值。当然您多余的一些碎片可以出售给商店换取少量的金钱。" );
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
end

--**********************************
--列举事件
--**********************************
function x210242_OnEnumerate( sceneId, selfId, targetId )
	
	-- 活动有效时间判定
	if x210242_IsValidPenguinEggExchangeTime() == 0    then
		-- 活动如果已经过期，就不再显示这些内容
		return
	end

	AddNumText(sceneId, x210242_g_ScriptId,"我要兑换企鹅蛋", 6, 1);
	AddNumText(sceneId, x210242_g_ScriptId,"关于兑换企鹅蛋", 0, 2);

end

--**********************************
--检测接受条件
--**********************************
function x210242_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x210242_OnAccept( sceneId, selfId, targetId )
end

--**********************************
--放弃
--**********************************
function x210242_OnAbandon( sceneId, selfId )
end


--**********************************
--检测是否可以提交
--**********************************
function x210242_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x210242_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--进入区域事件
--**********************************
function x210242_OnEnterZone( sceneId, selfId, zoneId )
end


-- 是否合法兑换企鹅蛋活动时间
function x210242_IsValidPenguinEggExchangeTime()
	local theDay = GetDayTime()
	if theDay < x210242_g_ExchangePenguinEggStartDay or
		 theDay > x210242_g_ExchangePenguinEggEndDay then
		return 0 --非活动时间
	end
	
	return 1
end

--**********************************
--玩家获得太阳石 的时候，在掉落包内获得
--**********************************
function x210242_PickupItem( sceneId, selfId, itemId, bagidx )
	-- #P X刨出了一块怪石，擦干净泥土之后，才发现居然是一块Y。
	local transfer = GetBagItemTransfer(sceneId, selfId, bagidx)
	local str = format("#P #{_INFOUSR%s}刨出了一块怪石，擦干净泥土之后，才发现居然是一块#{_INFOMSG%s}。",GetName(sceneId,selfId), transfer)
	BroadMsgByChatPipe(sceneId, selfId, str, 4)
	
end

function x210242_CheckPercentOK( numerator, denominator )
  --参数为分子,分母. 例如 ( 100, 10000 ) 表示几率为 100 / 10000
  local roll = random( denominator )
  if roll <= numerator then
      return 1
  end
  return 0
end

--**********************************
--检测是否正确的活动时间(掉落七星碎片)
--**********************************
function x210242_IsValidDayToDrop_QiXingSuiPian()
    local DayTime = GetDayTime()
    if DayTime < x210242_g_Drop_QiXingSuiPian_StartDay or
    	 DayTime > x210242_g_Drop_QiXingSuiPian_EndDay	 then
       return 0    --非活动时间
    end
    
    return 1  
end

function x210242_DropStoneList(sceneId, LongzhuIndex) 
  --金	0.0200 	0.00667
	--木	0.0050 	0.00167
	--水	0.0020 	0.00067
	--火	0.0011 	0.00037
	--土	0.0007 	0.00023
	--月	0.0004 	0.00013
	--日	0.0002 	0.00007

  if 0 == x210242_IsValidDayToDrop_QiXingSuiPian()  then
  	return -1
  end
  
  if 1 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 667, 100000 )--0.00667
      if 1 == CheckOK then
          return 30505114
      end
  end
  
  if 2 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 167, 100000 )
      if 1 == CheckOK then
          return 30505115
      end
  end
  
  if 3 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 67, 100000 )
      if 1 == CheckOK then
          return 30505116
      end
  end
  
  if 4 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 37, 100000 )
      if 1 == CheckOK then
          return 30505117
      end
  end
  
  if 5 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 23, 100000 )
      if 1 == CheckOK then
          return 30505118
      end
  end
  
  if 6 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 13, 100000 )
      if 1 == CheckOK then
          return 30505119
      end
  end
  
  if 7 == LongzhuIndex then
      local CheckOK = x210242_CheckPercentOK( 7, 100000 )
      if 1 == CheckOK then
          return 30505120
      end
  end
  
  return -1
    
end
