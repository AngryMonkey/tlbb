--道具：密银炼剂<ID:30501167>
--脚本号 300074
--Author:zhangzhuang 2008-10-20

x300074_g_scriptId = 300074
x300074_g_KuangShi = 30501168
x300074_g_MiYin  = 20502001

--**********************************
--事件交互入口
--**********************************
function x300074_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300074_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300074_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300074_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x300074_g_KuangShi )
	if ItemCount < 1 then
		local strNotice = "#{MYKS_081021_2}" --密银矿石检测
		x300074_ShowNotice( sceneId, selfId, strNotice)
	    return 0
	end
	
	local FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
	        local strNotice = "#{MYKS_081021_3}"
		    x300074_ShowNotice( sceneId, selfId, strNotice)
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
function x300074_OnDeplete( sceneId, selfId )
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
function x300074_OnActivateOnce( sceneId, selfId )

    --消耗一个密银矿石
  ret = LuaFnDelAvailableItem(sceneId, selfId, x300074_g_KuangShi, 1)
	if ret ~= 1 then
		return   --假如删除操失败,则中断操作,不会给予玩家任何物品
	end
	
  --数据统计：密银溶剂的使用
	LuaFnAuditMiYinKuangShiUsed(sceneId, selfId)
	Msg2Player(sceneId, selfId, "#你获得了一个#H1级秘银", MSG2PLAYER_PARA )
	BeginAddItem(sceneId)
			AddItem( sceneId, x300074_g_MiYin, 1 )
	local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			
	if Ret > 0 then
		LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
		x300074_ShowNotice( sceneId, selfId, "#{MYKS_081021_4}")
	end 
	
   
    
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300074_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x300074_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

