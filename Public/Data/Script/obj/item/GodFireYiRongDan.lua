--创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]
--注意：该脚本只限于龟兔赛跑活动使用

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


------------------------------------------------------------------------------------------
--龟兔赛跑活动道具的默认脚本

--脚本号
x808086_g_scriptId = 808086

--需要的等级
--需要的任务ID
x808086_g_MissionID = 1000

--需要的效果ID	火把使者
x808086_g_ImpactID 	= 5929

--效果的ID
x808086_g_itemList = {}
x808086_g_itemList[30505207] = {impactId=5933}			-- 乌龟壳
x808086_g_itemList[30505208] = {impactId=5934}			-- 兔子耳朵


--**********************************
--事件交互入口
--**********************************
function x808086_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x808086_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x808086_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x808086_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	--检测有没有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x808086_g_MissionID ) <= 0 then
		x808086_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--检测道具使用条件
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808086_g_ImpactID) == 0 then
		x808086_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808086_g_itemList[itemTblIndex];
	if not itemCur then
		x808086_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
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
function x808086_OnDeplete( sceneId, selfId )
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
function x808086_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808086_g_itemList[itemTblIndex];
	if not itemCur then
		x808086_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	if(-1~=itemCur.impactId) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, itemCur.impactId, 0);
	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x808086_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目失败提示
--**********************************
function x808086_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
