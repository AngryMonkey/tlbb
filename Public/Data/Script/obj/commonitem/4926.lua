--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--4926.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x334926_g_scriptId = 334926 --临时写这个,真正用的时候一定要改.

--需要的等级

--**********************************
--事件交互入口
--**********************************
function x334926_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数

	if sceneId and selfId and bagIndex then
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		local targetGUID = GetBagItemParam(sceneId, selfId, bagIndex, 0, 2);
		if selfGUID and targetGUID then
			BeginEvent(sceneId);
				if selfGUID == targetGUID then
					AddText(sceneId, "此为你自已的结婚请帖。凭此可以参加你的婚礼，快发给你的朋友吧。");
				else
					local ret, targetName = LuaFnGetItemCreator(sceneId, selfId, bagIndex);
					if ret and targetName and ret == 1 then
						AddText(sceneId, "此为"..targetName.."发送给您的请帖。可以凭此请帖去#G洛阳（177，94）#R喜来乐#W处参加婚礼。#r在婚礼结束前，可以在婚礼会场内找喜来乐用请帖兑换礼品哦。");
					else
						AddText(sceneId, "此为未知角色发送给您的请帖。可以凭此参加婚礼，记得婚礼结束之后可以用请帖兑换。");
					end
				end
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, selfId);
		end
	end
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x334926_IsSkillLikeScript( sceneId, selfId)
	return 0; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x334926_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x334926_OnConditionCheck( sceneId, selfId )
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x334926_OnDeplete( sceneId, selfId )
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
function x334926_OnActivateOnce( sceneId, selfId )
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x334926_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
