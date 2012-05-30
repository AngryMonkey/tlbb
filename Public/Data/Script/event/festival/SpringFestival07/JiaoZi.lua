--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--JiaoZi.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x050057_g_scriptId = 050057 --临时写这个,真正用的时候一定要改.

--buff的列表
x050057_g_Impact = {

		3004,
}

x050057_g_Impact1 = {
					10490,
					10491,
					10492,
					10493,
}

--吃到好东西的公告
x050057_g_strGetItem = {

	"",
	"",
	"",
}

x050057_g_GetItem =
{
	30505167,
	30505168,
	30505169,
}
--**********************************
--事件交互入口
--**********************************
function x050057_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x050057_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x050057_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x050057_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "礼品饺子只能交易给别人使用。" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{LLFB_80821_6}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	
	--local id = selfId
	--local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
		--	SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
	--	end	
	--end
	--加血的满血检查
	--if(GetHp(sceneId, id) >= GetMaxHp(sceneId, id)) then
	--	LuaFnSendOResultToPlayer(sceneId, selfId, OR_HEALTH_IS_FULL)
	--	return 0
	--end
	

	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x050057_OnDeplete( sceneId, selfId )
	--不消耗....后边还要使用存到物品上的信息呢....
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x050057_OnActivateOnce( sceneId, selfId )

	--自己不能使用....
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return
	end
	
	local OwnGUID	= GetBagItemParam( sceneId, selfId, bagId, 4, 2 )
	OwnGUID = OwnGUID + 2147483648
	local SelfGUID = LuaFnGetGUID( sceneId, selfId )
	if OwnGUID == SelfGUID then
		BeginEvent( sceneId )
			AddText( sceneId, "礼品饺子只能交易给别人使用。" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--扣物品....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end

	--加buff....增加特效
	local id = selfId
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId )
	
	--if 30001035 < itemTblIndex then
		--id = LuaFnGetTargetObjID(sceneId, selfId)
		--if(1~=LuaFnUnitIsFriend(sceneId, selfId, id)) then
			--SendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			--return 0;
		--end
		
	--end
	
	local impactID = x050057_g_Impact[1]
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, impactID, 0);

	local randImpact = random(4)
	LuaFnSendSpecificImpactToUnit(sceneId, id, id, id, x050057_g_Impact1[randImpact], 0);
	
	local level = GetLevel( sceneId, selfId )
	local rand10 = random(10)
	
	if level < 30 and rand10 > 1 then
			return 0
	end
	
	--随机产生不同的金币
	local GoodLuck = random(4000)
	
	
	if GoodLuck < 5 then
	
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[1], QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			--发公告....
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P在热腾腾的饺子咬到一个硬物，吐出一看竟是一枚#cB3DB35#{_INFOMSG%s}#P，不禁喜笑颜开。祝牛年财源滚滚，万事如意。", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 1500 and GoodLuck < 1511 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[2], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagIndex )
			local str = format("#W#{_INFOUSR%s}#P在热腾腾的饺子咬到一个硬物，吐出一看竟是一枚#cB3DB35#{_INFOMSG%s}#P，不禁喜笑颜开。祝牛年财源滚滚，万事如意。", GetName(sceneId,selfId), ItemInfo)
			BroadMsgByChatPipe( sceneId, selfId, str, 4 )
		end
	elseif GoodLuck > 2500 and GoodLuck < 2901 then
		local BagIndex = TryRecieveItem( sceneId, selfId, x050057_g_GetItem[3], QUALITY_MUST_BE_CHANGE )
		
		if BagIndex ~= -1 then
			--local str = format("#W#{_INFOUSR%s}#P在热腾腾的饺子咬到一个硬物，吐出一看竟是一枚#H#{_ITEM%d}#P，不禁喜笑颜开。祝牛年财源滚滚，万事如意。", GetName(sceneId,selfId), x050057_g_GetItem[3])
			--BroadMsgByChatPipe( sceneId, selfId, str, 4 )
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
function x050057_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
