--转蛋通用脚本
--脚本号 x889040
--Author: zchw 2009-3-17

x889040_g_scriptId = 889040

--**********************************
--事件交互入口
--**********************************
function x889040_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889040_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889040_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889040_OnConditionCheck( sceneId, selfId )

	--校验使用的物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0;
	end

	local ItemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local ZD_ID = LuaFnGetZhuanDanIndex(ItemIndex);
	if ZD_ID == -1 then
		return 0;
	end

	local BaseSpace, MaterialSpace, TaskSpace = LuaFnGetZhuandanSpace(ZD_ID);	
	if BaseSpace == -1 then
		return 0;
	end
	
	local FreeSpace1 = LuaFnGetPropertyBagSpace(sceneId, selfId);
	local FreeSpace2 = LuaFnGetMaterialBagSpace(sceneId, selfId);
	local FreeSpace3 = LuaFnGetTaskItemBagSpace(sceneId, selfId);
	
	if (FreeSpace1<BaseSpace) or (FreeSpace2<MaterialSpace) or (FreeSpace3<TaskSpace) then 
    x889040_ShowNotice( sceneId, selfId, "背包空间不足。");
    return 0;
	end
			
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x889040_OnDeplete( sceneId, selfId )
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
function x889040_OnActivateOnce( sceneId, selfId )
	local ItemIndex = LuaFnGetItemIndexOfUsedItem(sceneId, selfId);
	local ZD_ID = LuaFnGetZhuanDanIndex(ItemIndex);	
	if ZD_ID == -1 then
		return 0;
	end
	
	local PrizeItem, PrizeNum, IsBind, NoticeFormat = LuaFnGetZhuanDanInfo(ZD_ID);
	if PrizeItem == -1 then
		return 0;
	end
	
	local BagPos = nil;
	
	--获得物品
	for i=1, PrizeNum do
		BagPos = LuaFnTryRecieveItemIgnoreFatigueState(sceneId, selfId, PrizeItem, QUALITY_MUST_BE_CHANGE);
		if BagPos == -1 then
			x889040_ShowNotice( sceneId, selfId, "背包空间不足");
			return 0;
		end
		--强制绑定
		if(IsBind == 1) then
			LuaFnItemBind( sceneId, selfId, BagPos);
		end
	end
	
	--公告
	if NoticeFormat ~= nil then
 		local ItemTransfer = GetBagItemTransfer(sceneId, selfId, BagPos);
 	  local PlayerName = GetName(sceneId, selfId);
 	  local str = format(NoticeFormat, PlayerName, ItemTransfer)
    BroadMsgByChatPipe( sceneId, selfId, str, 4 )		  
  end  
  
  --消息	
  local ItemName = GetItemName(sceneId, PrizeItem)
  local strNotice = "您得到了"..ItemName
  x889040_ShowNotice( sceneId, selfId, strNotice)
  LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);	
  
	--数据统计：转蛋的使用
	LuaFnAuditZhuanDanUsed(sceneId, selfId, 100+ZD_ID, 0)
	    
	return 1;	
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889040_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889040_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end


	
