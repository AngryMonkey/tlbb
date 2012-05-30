--灵触散配方脚本
--对应生活技能 制药

--脚本号
x700212_g_scriptId = 700212

--需要的等级
x700212_g_AbilityNeedLevel = 9
--配方的ID
x700212_g_RecipeId = 212
--顺发特效ID
x700212_g_SpecialEffectID = 18;
--**********************************
--事件交互入口
--**********************************
function x700212_OnDefaultEvent( sceneId, selfId, bagIndex )
--	--获得玩家生活技能等级
--	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId ,ABILITY_PENGREN)

--	if AbilityLevel < x700212_g_AbilityNeedLevel then
--		BeginEvent(sceneId)
--			strText = "技能等级不足"
--			AddText(sceneId,strText);
--		EndEvent(sceneId)
--		DispatchMissionTips(sceneId,selfId)
--		return
--	end
--	-- 调用通用配方学习
--	SelfDestructFlag = CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x700212_g_RecipeId )
--
--	-- 学完以后自我摧毁
--	if SelfDestructFlag > 0 then
--		EraseItem(sceneId, selfId, bagIndex)
--	end
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x700212_IsSkillLikeScript( sceneId, selfId)
	return 1;
end
--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x700212_CancelImpacts( sceneId, selfId )
	return 0;
end
--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x700212_OnConditionCheck( sceneId, selfId )
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId ,ABILITY_ZHIYAO)
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	--如果技能不够使用要求
	if AbilityLevel < x700212_g_AbilityNeedLevel then
		BeginEvent(sceneId)
			strText = "技能等级不足"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId);
		return 0;
	end
	if (0<LuaFnIsPrescrLearned( sceneId, selfId, x700212_g_RecipeId)) then
		BeginEvent(sceneId)
			strText = "这个配方已经学会了"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId);
		return 0;		
	end
	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x700212_OnDeplete( sceneId, selfId )
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
function x700212_OnActivateOnce( sceneId, selfId )
	-- 调用通用配方学习
	CallScriptFunction( USERECIPE_SCRIPT, "ReadRecipe", sceneId, selfId, x700212_g_RecipeId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x700212_g_SpecialEffectID, 0);
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x700212_OnActivateEachTick( sceneId, selfId)
	return 1;
end
