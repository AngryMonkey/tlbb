--道具：GF礼包<ID:30504042>
--脚本号 889021
--Author:zhangzhuang 2008-12-27

x889021_g_scriptId = 889021
x889021_g_GFPrize = {
	               10141087,	
						30501132,
						30501133,
						30501153,
						30501151,
						31000001,
						31000003,
						30607000,
						30008011,
						30900006,
						30502002,
						30008002,
						30402026,
						30402092,
						30402046,
						30402094,
						30402072,
						30402036,
						30402076,
						30402078,
						30402025,
						30402030,
						30402034,
						30402040,
						30402042,
						30402044,
						30402048,
						30402050,
						30402012,
						30402014,
						30402016,
						30402018,
						30402020,
						30402056,
						30402060,
						30402062,
						30402064,
						30402066,
						30402068,
						30402070,
						30402074,
						30402080,
						30402091,
						30402093,
						30402051,
						30402052,
						30402053,
						30402054,
						30402045,
						30402029,
						30402035,
						30402055,
						30402059,
						30402047,
						30402049,
						30402061,
						30402063,
						30402065,
						30402067,
						30402069,
						30402073,
						30402033,
						30402039,
						30402041,
						30402043,
						30402075,
						30402077,
						30402079,
						30008034,
						30008048,
						30008009,
						30309619,
						10124063,
						10124066,
						10141091,
						30700203,
						30501169
	              } 

x889021_g_strGongGaoInfo = {
	"#{_INFOUSR%s}#c00FFFF看着如此精致的#G#{_ITEM30504042}#c00FFFF，按耐不住的打开，强大的气息涌出，得到一个#{_INFOMSG%s}#c00FFFF。",
 "#{_INFOUSR%s}#c00FFFF看着如此精致的#G#{_ITEM30504042}#c00FFFF，按耐不住的打开，强大的气息涌出，得到一个#{_INFOMSG%s}#c00FFFF。",
  "#{_INFOUSR%s}#c00FFFF看着如此精致的#G#{_ITEM30504042}#c00FFFF，按耐不住的打开，强大的气息涌出，得到一个#{_INFOMSG%s}#c00FFFF。",
}
--**********************************
--事件交互入口
--**********************************
function x889021_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889021_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889021_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889021_OnConditionCheck( sceneId, selfId )
	--校验使用的物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
--因为转蛋本身消耗一个，会多出一个空格，且好运礼盒最多奖励3个所以判断剩余空间<2	
--因为神秘彩袜励物品有的在道具栏，有的在材料栏
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then 
	        local strNotice = "背包空间不足。"
		      x889021_ShowNotice( sceneId, selfId, strNotice)
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
function x889021_OnDeplete( sceneId, selfId )
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
function x889021_OnActivateOnce( sceneId, selfId )

    --数据统计：转蛋的使用
	  LuaFnAuditZhuanDanUsed(sceneId, selfId, 20, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, 18)
    if( RandomBase > 0 ) then    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, 18 )
        local PrizeNum = 0
         if (RandomID == x889021_g_GFPrize[77]) then
          PrizeNum = 22
        elseif (RandomID == x889021_g_GFPrize[76]) then
          PrizeNum = 4
        elseif (RandomID == x889021_g_GFPrize[9] or RandomID == x889021_g_GFPrize[10] or 
        	RandomID == x889021_g_GFPrize[11] or RandomID == x889021_g_GFPrize[12]) then
        	PrizeNum = 3
        elseif (RandomID == x889021_g_GFPrize[71] or RandomID == x889021_g_GFPrize[69]) then
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
					       x889021_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				      end
				      
				      local ItemName = GetItemName(sceneId, RandomID)
				      local strNotice = "您得到了"..ItemName
				      x889021_ShowNotice( sceneId, selfId, strNotice)
				      LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
				   else
				      local strNotice = "背包空间不足"
				      x889021_ShowNotice( sceneId, selfId, strNotice)
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
function x889021_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889021_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889021_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889021_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889021_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889021_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
