--道具：金丹葫芦<ID:31000000>
--脚本号 332100
--Author: Steven.Han 10:39 2007-5-17

x332100_g_scriptId = 332100
x332100_g_MaxValue = 500000
x332100_g_IncPerAct = 2500

--**********************************
--事件交互入口
--**********************************
function x332100_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x332100_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x332100_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x332100_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
	local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    
    --PrintStr( ""..UseValue.."/"..ValidValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
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
function x332100_OnDeplete( sceneId, selfId )
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
function x332100_OnActivateOnce( sceneId, selfId )

    local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
    local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
    local ValidValue = x332100_g_MaxValue - UseValue
    
    local PlayerHP = GetHp(sceneId, selfId)
    local PlayerMaxHP  = GetMaxHp(sceneId, selfId)
    local NeedHP = PlayerMaxHP - PlayerHP   --需要恢复的HP量
    
    if x332100_g_IncPerAct < NeedHP then
        NeedHP = x332100_g_IncPerAct
    end
    
    --PrintStr( ""..ValidValue.."/"..x332100_g_MaxValue.." "..PlayerHP.."/"..PlayerMaxHP.."".."")
    
    if PlayerHP == PlayerMaxHP then
        LuaFnSendOResultToPlayer( sceneId, selfId, OR_HEALTH_IS_FULL )
    else
		local nCB = ValidValue   --使用前容量
		local nHPB = PlayerHP    --使用前玩家hp
		local bErased = -1       --物品是否被删除
		
        if NeedHP >= ValidValue then  --可提供的HP不足恢复玩家定量HP
            --IncreaseHp
            IncreaseHp(sceneId, selfId, ValidValue ) --恢复可提供的HP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332100_g_MaxValue ) --设置最大容量
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, x332100_g_MaxValue ) --设置已用容量
            bErased = EraseItem( sceneId, selfId, bagId )
        else
            IncreaseHp(sceneId, selfId, NeedHP ) --恢复需要的HP
            SetBagItemParam( sceneId, selfId, bagId, 4, 2, x332100_g_MaxValue ) --设置最大容量
            SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + x332100_g_IncPerAct ) --设置已用容量
            --SetBagItemParam( sceneId, selfId, bagId, 8, 2, UseValue + NeedHP ) --设置已用容量
            
            if( x332100_g_MaxValue == ( UseValue + x332100_g_IncPerAct ) ) then
                bErased = EraseItem( sceneId, selfId, bagId )
            end
            
        end

		local szName = GetName( sceneId, selfId )
		local nGuid = LuaFnGetGUID( sceneId, selfId )
		local nHPA = GetHp(sceneId, selfId)             --使用后玩家hp
		        
        if bErased < 0 then
			--local szLog = "Use31000000, Name=%s, Guid=%d, CB=%d, CA=%d, HPB=%d, HPA=%d, BIDX=%d"
			local szLog = "Use31000000, 名字=%s, Guid=%d, 使用前药量=%d, 使用后药量=%d, 使用前HP=%d, 使用后HP=%d, 背包位置=%d"
			local UseValue_log = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
			local nCA = x332100_g_MaxValue - UseValue_log   --使用后容量
			
			local szDebugLog = format( szLog, szName, nGuid, nCB, nCA, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        else
			local szLog = "Use31000000, 名字=%s, Guid=%d, 使用前药量=%d, 已被删除, 使用前HP=%d, 使用后HP=%d, 背包位置=%d"
			local szDebugLog = format( szLog, szName, nGuid, nCB, nHPB, nHPA, bagId )
			WriteDebugLog( sceneId, selfId, szDebugLog )
        end
        
        --LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 18, 1000 )
        --SetMp( sceneId, selfId, 0 ) --测试蓝药用代码,一定要删了啊!
        
    end
    
    LuaFnRefreshItemInfo( sceneId, selfId, bagId )

	--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 3101, 0);
	--PrintStr( "x332100_OnActivateOnce" )
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x332100_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x332100_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
