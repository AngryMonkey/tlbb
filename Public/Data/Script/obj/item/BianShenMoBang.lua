--谢鉷 2009-02-18

--参考JiaoZi.lua


------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x889032_g_scriptId = 889032

--buff的列表

x889032_g_Impact = {
					4846,
					4847,
					4855,
					4828,
					4842,
					4866,
					4867,
					4868,
					4861,
					4862,
					5707,	--呆呆牛
					5708,	--熊猫版李小龙
					5709,	--熊猫版超人
					5710,	--小狐仙
					}


--**********************************
--事件交互入口
--**********************************
function x889032_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889032_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889032_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889032_OnConditionCheck( sceneId, selfId )

	--检查是否可以被使用
	if x889032_ItemCheckAndNotice( sceneId, selfId ) ~=1 then
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
function x889032_OnDeplete( sceneId, selfId )
	--不消耗，因为后边还要使用存到物品上的信息
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x889032_OnActivateOnce( sceneId, selfId )

	--检查是否可以被使用
	if x889032_ItemCheckAndNotice( sceneId, selfId ) ~=1 then
		return
	end
	
	--扣物品
	if LuaFnDepletingUsedItem(sceneId, selfId) <= 0 then
		return
	end
	
	--加自己加变身BUFF
	local rollImpact = random( 1, getn( x889032_g_Impact ) )
	local impactId = x889032_g_Impact[rollImpact]
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactId, 0);
		
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889032_OnActivateEachTick( sceneId, selfId )
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889032_ItemCheckAndNotice( sceneId, selfId )
	
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--得到使用物品的背包位置
	local bagIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagIndex < 0 then
		return 0
	end
		
	return 1
end

--**********************************
--信息提示
--**********************************
function x889032_ShowMsg( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent()
	DispatchMissionTips( sceneId, selfId )
	
end
