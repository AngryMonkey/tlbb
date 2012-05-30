--道具：仙露净瓶<ID:31000003>
--脚本号 332103
--Author: Steven.Han 17:50 2007-5-17

x332103_g_scriptId = 332103
x332103_g_MaxValue = 50000
x332103_g_IncPerAct = 2000

--**********************************
--事件交互入口
--**********************************
function x332103_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x332103_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x332103_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x332103_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerMP = GetMp(sceneId, selfId)
    local PlayerMaxMP  = GetMaxMp(sceneId, selfId)
      
    if PlayerMP == PlayerMaxMP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_MANA_IS_FULL )
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
function x332103_OnDeplete( sceneId, selfId )
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
function x332103_OnActivateOnce( sceneId, selfId )

    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332103_g_MaxValue - UseValue
    
    local PlayerMP = GetMp(sceneId, selfId)
    local PlayerMaxMP  = GetMaxMp(sceneId, selfId)
    local NeedMP = PlayerMaxMP - PlayerMP   --需要恢复的MP量
    
    if x332103_g_IncPerAct < NeedMP then
        NeedMP = x332103_g_IncPerAct
    end
     
    if PlayerMP == PlayerMaxMP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_MANA_IS_FULL )
    else
		local nCB = ValidValue   --使用前容量
		local nMPB = PlayerMP    --使用前玩家mp
		local bErased = -1       --物品是否被删除
		    
        if NeedMP >= ValidValue then  --可提供的MP不足恢复玩家定量MP
            --IncreaseMp
            IncreaseMp(sceneId, selfId, ValidValue ) --恢复可提供的MP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332103_g_MaxValue ) --设置最大容量
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, x332103_g_MaxValue ) --设置已用容量
            bErased = EraseItem( sceneId, selfId, bagId )
        else
            IncreaseMp(sceneId, selfId, NeedMP ) --恢复需要的MP,此时,玩家应该MP全满
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332103_g_MaxValue ) --设置最大容量
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + x332103_g_IncPerAct ) --设置已用容量
            
            if( ( UseValue + x332103_g_IncPerAct ) >= x332103_g_MaxValue ) then
                bErased = EraseItem( sceneId, selfId, bagId )
            end
            
        end
        
        local szName = GetName( sceneId, selfId )
        local nGuid = LuaFnGetGUID( sceneId, selfId )
		local nMPA = GetMp(sceneId, selfId)             --使用后玩家hp
		
        if bErased < 0 then
			--local szLog = "Use31000003, Name=%s, Guid=%d, CB=%d, CA=%d, HPB=%d, HPA=%d, BIDX=%d"
			local szLog = "Use31000003, 名字=%s, Guid=%d, 使用前药量=%d, 使用后药量=%d, 使用前MP=%d, 使用后MP=%d, 背包位置=%d"
			local UseValue_log = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
			local nCA = x332103_g_MaxValue - UseValue_log   --使用后容量
			
			local szDebugLog = format( szLog, szName, nGuid, nCB, nCA, nMPB, nMPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )  
        else
			local szLog = "Use31000003, 名字=%s, Guid=%d, 使用前药量=%d, 已被删除, 使用前MP=%d, 使用后MP=%d, 背包位置=%d"
			local szDebugLog = format( szLog, szName, nGuid, nCB, nMPB, nMPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        end
        
        --LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
        
    end
    
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x332103_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x332103_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
