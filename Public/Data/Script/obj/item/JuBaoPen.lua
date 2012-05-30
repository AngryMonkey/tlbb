--道具：聚宝盆<ID:30008038>
--脚本号 332204
--Author: Steven.Han 10:39 2007-5-24

x332204_g_scriptId = 332204

x332204_g_MultiJuBaoPenMaxUseCount = 11

x332204_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#H开启#G#{_ITEM30008038}#H时，竟然真的如愿获得了#{_INFOMSG%s}#H，真是令人羡慕啊！",
  "#{_INFOUSR%s}#H正在埋怨#G#{_ITEM30008038}#H太小时，竟然在里面发现了一个更大的#{_INFOMSG%s}！",
  "#{_INFOUSR%s}#H平日里勤俭节约，今日在#G#{_ITEM30008038}#H里得到了一个#{_INFOMSG%s}#H，终于不用在物品多的时候为扔掉哪个而发愁了！",
}

--**********************************
--事件交互入口
--**********************************
function x332204_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x332204_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x332204_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x332204_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "背包空间不足。"
		      x332204_ShowNotice( sceneId, selfId, strNotice)
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
function x332204_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1;
	end

	return 0;
end

function x332204_GetPos( DropList, RandomID )
    local ListSize = getn( DropList )
    for i=1, ListSize do
        if RandomID == DropList[i][1] then
            return i
        end
    end
    
    return 0
end

function x332204_OnTest( sceneId, selfId )

    local DropList = {}
    local RandomBase = GetDarkBoxItemDropCount( sceneId, selfId )
    
    --PrintNum( RandomBase )
    
    for ii = 1, RandomBase do
		if( RandomBase > 0 ) then    
			local RandomNum = random( 0, RandomBase - 1 )
			local RandomID, Notice = DarkBoxItemDropRandom( sceneId, selfId, RandomNum )
	        local Pos = x332204_GetPos( DropList, RandomID )
	        local ListSize = getn( DropList )
	       
	        if 0 == Pos then
	            DropList[ ListSize+1 ] = { RandomID, 1 }
	        else
	            DropList[ Pos ] = { RandomID, DropList[ Pos ][2] + 1 }
	        end
	        
		end
        
    end
    
    local ListSize = getn( DropList )
    local sysstr = "=====================#r"
    local TotalItem = 0
    sysstr = sysstr.."总共物品种类"..ListSize..",具体数据:"
	BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	
	for i=1, ListSize do
	    TotalItem = TotalItem + DropList[ i ][2]
	end
	
	for i=1, ListSize do
	    sysstr = DropList[ i ][1]..","..DropList[ i ][2]
	    local per = DropList[ i ][2] / TotalItem * 100
	    sysstr = sysstr.."     "
	    sysstr = sysstr..(per).."%"
	    BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	end
	
	sysstr = "总共物品数量"..TotalItem
	BroadMsgByChatPipe( sceneId, selfId, sysstr, 4 )
	
	
    
end


--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x332204_OnActivateOnce( sceneId, selfId )
    
    --x332204_OnTest( sceneId, selfId )
    
    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332204_g_MultiJuBaoPenMaxUseCount - UseValue
	
	--消耗一次聚宝盆
	if bagId >= 0 then
		local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if UseValue >= x332204_g_MultiJuBaoPenMaxUseCount then   --记录的使用次数大于等于最大可用次数,理论上不可能出现.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332204_g_MultiJuBaoPenMaxUseCount ) --设置最大次数
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --设置已用次数
		
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		if CheckParam1 ~= x332204_g_MultiJuBaoPenMaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	    
		if CurValue >= x332204_g_MultiJuBaoPenMaxUseCount then  --当使用次数达到最大次数时,将删除此物品
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			if EraseRet < 0 then      --如果删除失败,将不会给玩家物品
			    local strNotice = "需要聚宝盆"
				  x332204_ShowNotice( sceneId, selfId, strNotice)
				return 0
			end
			
		end
	else
		local strNotice = "需要聚宝盆"
		x332204_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
    
    --数据统计：暗金宝箱的使用
    local nRemain = x332204_g_MultiJuBaoPenMaxUseCount-UseValue-1;
    if(0>nRemain) then
    	nRemain = 0
    end
    
	LuaFnAuditJuBaoContainerUsed(sceneId, selfId, 1, nRemain);
		
    --消耗聚宝盆完毕,给予玩家物品
    local RandomBase = GetJuBaoContainerItemDropCount( sceneId, selfId )
    if( RandomBase > 0 ) then    
         
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = JuBaoContainerItemDropRandom( sceneId, selfId, RandomNum )
       
        if( RandomID > 0 ) then
          BeginAddItem(sceneId)
				  AddItem( sceneId, RandomID, 1 )
			    local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
			    if Ret > 0 then
			       LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
				
				     if 1 == Notice then
					      local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					      x332204_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				     end
				
				     local ItemName = GetItemName(sceneId, RandomID)
				     local strNotice = "您得到了"..ItemName
				     x332204_ShowNotice( sceneId, selfId, strNotice)
				     LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				
			else
				local strNotice = "背包空间不足"
				x332204_ShowNotice( sceneId, selfId, strNotice)
			end
    end
        
 end
    
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x332204_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x332204_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x332204_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x332204_g_strGongGaoInfo[1], PlayerName, strItemInfo )
	elseif nMsgIndex == 2 then
		str = format( x332204_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x332204_g_strGongGaoInfo[3], PlayerName, strItemInfo )
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
