-- 创建人: [ QUFEI 2007-09-12 21:51 UPDATE BugID 24674 ]
-- 金榜提名
--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--jinbangtiming.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x335133_g_scriptId = 335133 --临时写这个,真正用的时候一定要改.

--buff列表
x335133_g_Impact = {

		8040,
		8041,
		8042,
		8043,
		8044,
		8045,
		30181,
		30182,
		30183,
		30184,
		30185,
		30186,
}

--**********************************
--事件交互入口
--**********************************
function x335133_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335133_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335133_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335133_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local myLevel = GetLevel(sceneId, selfId)
    
  if myLevel < 20 then
     return 0
	end
	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335133_OnDeplete( sceneId, selfId )
		-- 消耗物品....
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335133_OnActivateOnce( sceneId, selfId )

	local myLevel = GetLevel(sceneId, selfId)

	-- 加金榜题名Buff....	
	local impactID = x335133_g_Impact[1]
	local PlayerMaxLevel = GetHumanMaxLevelLimit()

  if myLevel > PlayerMaxLevel then
		impactID = x335133_g_Impact[12]
  elseif myLevel > 140 then
		impactID = x335133_g_Impact[11]
  elseif myLevel > 130 then
		impactID = x335133_g_Impact[10]
	elseif myLevel > 120 then
		impactID = x335133_g_Impact[9]
	elseif myLevel > 110 then
		impactID = x335133_g_Impact[8]
	elseif myLevel > 100 then
		impactID = x335133_g_Impact[7]
	elseif myLevel > 90 then
		impactID = x335133_g_Impact[6]
	elseif myLevel > 80 then
		impactID = x335133_g_Impact[5]
	elseif myLevel > 70 then
		impactID = x335133_g_Impact[4]
	elseif myLevel > 60 then
		impactID = x335133_g_Impact[3]
	elseif myLevel > 50 then
		impactID = x335133_g_Impact[2]
	elseif myLevel > 40 then
		impactID = x335133_g_Impact[1]
	end

	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactID, 0);

	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335133_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
