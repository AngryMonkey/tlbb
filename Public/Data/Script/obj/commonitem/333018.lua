-- 创建人[ QUFEI 2007-11-07 09:53 UPDATE BugID 24671 ]

-- 人民币道具_先天归心丹 （改成正确名字）
-- ItemID = 31000004
-- 脚本号	333018
-- 按百分比增加玩家生命值
-- 物品可以使用20次
-- 以后每次使用扣一次，扣完就删除物品

x333018_g_scriptId = 333018
x333018_g_MinValue = 1000			-- HP最小增加值
x333018_g_MaxHPValue = 0			-- HP上限增加值
x333018_g_MaxUseCount = 20		-- 最大使用次数20次
x333018_g_HPValuePer = 0.1		-- HP恢复百分比

--**********************************
--事件交互入口
--**********************************
function x333018_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x333018_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x333018_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x333018_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerHP = GetHp(sceneId, selfId)
  local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    
  --PrintStr( ""..UseValue.."/"..ValidValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
  
  if PlayerHP >= PlayerMaxHP then
      LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
      return 0
  end
        
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x333018_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x333018_OnActivateOnce( sceneId, selfId )

   local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
   local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
   local ValidValue = x333018_g_MaxUseCount - UseValue      
   local PlayerHP = GetHp(sceneId, selfId)
   local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
   local NeedHP = floor(PlayerMaxHP * x333018_g_HPValuePer)   --需要恢复的HP量
   local IsDelete = 0		-- 物品是否删除
   
   if NeedHP < x333018_g_MinValue then
       NeedHP = x333018_g_MinValue
   end
   
   --PrintStr( ""..ValidValue.."/"..x333018_g_MaxUseCount.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
   
   if PlayerHP >= PlayerMaxHP then
       LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
       return 0
   end
   
   --消耗一次先天归心丹
	if bagId >= 0 then		
		
		if UseValue >= x333018_g_MaxUseCount then   --记录的使用次数大于等于最大可用次数,理论上不可能出现.
	    return 0
		end

		local CurValue = UseValue + 1
		
    IncreaseHp(sceneId, selfId, NeedHP ) --恢复需要的HP
    SetBagItemParam( sceneId, selfId, bagId, 4, 2, x333018_g_MaxUseCount ) --设置最大容量
    SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --设置已用容量
     
    --------------参数设置安全性检测,虽然理论上参数设置不会失败
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    
    if CheckParam1 ~= x333018_g_MaxUseCount then
	    return 0
		end
		if CheckParam2 ~= CurValue then
	    return 0
		end
     --------------参数设置安全性检测,虽然理论上参数设置不会失败      
     
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )	--刷新背包信息
     
    if CurValue >= x333018_g_MaxUseCount then		--当使用次数达到最大次数时,将删除此物品
        local bErased = EraseItem( sceneId, selfId, bagId )
        IsDelete = 1
         
      if bErased < 0 then      --如果删除失败,将不会产生任何效果
		 		local strMsg = "需要先天归心丹"
				x333018_ShowNotice( sceneId, selfId, strMsg)
				return 0
			end
		
   	end
   	
   	local szName = GetName( sceneId, selfId )
		local nGuid = LuaFnGetGUID( sceneId, selfId )
		
   	local szLog = "Use31000004, 名字=%s, Guid=%0X, 使用前药量=%d, 剩余药量=%d, 使用前HP=%d, 使用后HP=%d, 背包位置=%d, 是否已被删除=%d"
		local UseValue_log = x333018_g_MaxUseCount - CurValue	-- 剩余药量
		local PlayerNowHP = GetHp(sceneId, selfId)	-- 加血后玩家的HP
		
		local szDebugLog = format( szLog, szName, nGuid, ValidValue, UseValue_log, PlayerHP, PlayerNowHP, bagId, IsDelete )
		WriteDebugLog( sceneId, selfId, szDebugLog )  
   	
  else
		local strMsg = "需要先天归心丹"
		x333018_ShowNotice( sceneId, selfId, strMsg)
		return 0
	end

	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x333018_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x333018_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
