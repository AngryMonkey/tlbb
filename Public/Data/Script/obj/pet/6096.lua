-- 宠物通用功能脚本
x336096_g_petCommonId = PETCOMMON

--脚本号
x336096_g_scriptId = 336096


--脚本

--**********************************
-- 获取技能书ID
--**********************************
function x336096_GetPetBookId(sceneId, selfId)
	local ItemIndexInBag, PetBookId = nil, nil
	ItemIndexInBag = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)	--获取宠物技能书在背包中Index
	PetBookId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, ItemIndexInBag) --获取宠物技能书ID
	
	return PetBookId
end

--**********************************
--必须返回 1 才能正确执行以下流程
--**********************************
function x336096_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x336096_OnConditionCheck( sceneId, selfId )
	--检测Item是否有效
	if(LuaFnVerifyUsedItem(sceneId, selfId) == 0) then
		return 0;	--Item无效直接返回
	end
	
	--检测使用对象有效性
	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petGUID_H, petGUID_L);
	if checkAvailable and checkAvailable ~= 1 then
		return 0
	end

	return 1
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x336096_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x336096_OnActivateOnce( sceneId, selfId )

	local PetBookId = x336096_GetPetBookId(sceneId, selfId) --获取宠物技能书ID
	local SkillId = GetPetBookSkillID(sceneId,PetBookId)	--获取宠物技能书对应技能ID
	
	if -1 == SkillId then
		return 0
	end
	
	local PetGuidH = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local PetGuidL = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )
	local pgH , pgL = LuaFnGetCurrentPetGUID(sceneId, selfId)
	--是否出战
	if (PetGuidH == pgH) and (PetGuidL == pgL) then
		return 0
	end

	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		CallScriptFunction( x336096_g_petCommonId, "PetStudy", sceneId, selfId, SkillId )
		return 1
	end

	return 0

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x336096_OnActivateEachTick( sceneId, selfId)
	return 1
end

-- 这个函数没有什么用，但是必须有
function x336096_CancelImpacts( sceneId, selfId )
	return 0
end
