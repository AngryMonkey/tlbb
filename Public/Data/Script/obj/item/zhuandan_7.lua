--道具：少林锦囊<ID:30504008>
--脚本号 889006
--Author: 张壮 2008-9-22

x889006_g_scriptId = 889006

x889006_g_ShaoLinPrize = {
	                 10511007,
	                 10514007,
	                 10521007,
	                 10522007,
	                 10553007,
	                 10500008,
	                 10510008,
	                 10512008,
	                 10513008,
	                 10552008,
	                 10553008,
	                 31000002,
	                 31000001,
	                 31000000,
	                 31000003,
	                 30607001,
	                 30008007,
	                 30900006,
}	

x889006_g_strGongGaoInfo = {
  "#{_INFOUSR%s}#c00FFFF在#G#{_ITEM30504008}#c00FFFF中，翻出了一件#{_INFOMSG%s}#c00FFFF，阿弥陀佛，可喜可贺。",
  "#{_INFOUSR%s}#c00FFFF在#G#{_ITEM30504008}#c00FFFF中，翻出了一件#{_INFOMSG%s}#c00FFFF，阿弥陀佛，可喜可贺。",
 	"#{_INFOUSR%s}#c00FFFF在#G#{_ITEM30504008}#c00FFFF中，翻出了一件#{_INFOMSG%s}#c00FFFF，阿弥陀佛，可喜可贺。",
}
--**********************************
--事件交互入口
--**********************************
function x889006_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889006_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889006_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889006_OnConditionCheck( sceneId, selfId )

	--校验使用的物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

--因为转蛋本身消耗一个，会多出一个空格，且少林锦囊最多奖励5个所以判断剩余空间<4	
--因为少林锦囊奖励物品都在第一栏
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 4 ) then 
	        local strNotice = "背包空间不足。"
		      x889006_ShowNotice( sceneId, selfId, strNotice)
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
function x889006_OnDeplete( sceneId, selfId )
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
function x889006_OnActivateOnce( sceneId, selfId )

    --数据统计：转蛋的使用
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 6, 0)
	
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 6)
    
    if( RandomBase > 0 ) then    
       		
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 6 )
        
        local PrizeNum = 0
        if( RandomID == x889006_g_ShaoLinPrize[18] ) then
          PrizeNum = 5
        elseif (RandomID == x889006_g_ShaoLinPrize[17]) then
          PrizeNum = 3
        elseif (RandomID == x889006_g_ShaoLinPrize[16]) then
          PrizeNum = 2
        else
          PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
           BeginAddItem(sceneId)
				   AddItem( sceneId, RandomID, PrizeNum )
			     local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			     if Ret > 0 then
			       	LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
			       	
			       	if 1 == Notice then
			       	   local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					       x889006_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "您得到了"..ItemName
				      x889006_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "背包空间不足"
				      x889006_ShowNotice( sceneId, selfId, strNotice)
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
function x889006_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889006_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889006_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889006_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889006_g_strGongGaoInfo[2], PlayerName, strItemInfo)
	else
		str = format( x889006_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
