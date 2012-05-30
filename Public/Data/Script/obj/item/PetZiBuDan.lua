-- 创建人[ QUFEI 2007-09-26 22:53 UPDATE BugID 25292 ]

-- 人民币宠粮_滋补丹 （改成正确名字）
-- ItemID = 30607000
-- 702000
-- 增加宠物生命值和快乐度
-- 物品可以使用100次
-- 以后每次使用扣一次，扣完就删除物品

-- 宠物通用功能脚本
x702000_g_petCommonId = PETCOMMON

--******************************************************************************
-- 以下部分需要是需要修改的部分
--******************************************************************************

--脚本号 （改成正确脚本号）
x702000_g_scriptId = 702000

-- 增加值 （根据要求改写具体数值）
x702000_g_HPValue = 5000			-- 生命值增加值
x702000_g_MaxHPValue = 0			-- 最大生命值增加值
x702000_g_LifeValue = 0				-- 寿命增加值
x702000_g_HappinessValue = 1	-- 快乐度增加值
x702000_g_MaxUseCount = 100		-- 最大使用次数100次

--标准效果ID （改成宠物吃宠粮的特效）
--g_ImpactID = 0

--******************************************************************************
-- 以上部分需要是需要修改的部分
--******************************************************************************

--脚本

--**********************************
--必须返回 1 才能正确执行以下流程
--**********************************
function x702000_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x702000_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	-- 得到当前正在使用的物品的背包位置
	nIndex = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )	
	ret = CallScriptFunction( x702000_g_petCommonId, "IsPetCanUseFood", sceneId, selfId, nIndex )
	return ret
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x702000_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		return 1
	end
	return 0
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x702000_OnActivateOnce( sceneId, selfId )

	local bagId	 = LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local UseValue = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
  local ValidValue = x702000_g_MaxUseCount - UseValue

	-- PrintNum(UseValue)
	
	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )	
	
	local valueHP = LuaFnGetPetHP( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHP = LuaFnGetPetMaxHP( sceneId, selfId, petGUID_H, petGUID_L )
	
	local valueHappy = LuaFnGetPetHappiness( sceneId, selfId, petGUID_H, petGUID_L )
	local MaxHappiness = 100
	
	-- PrintNum(valueHP)
	-- PrintNum(MaxHP)
	-- PrintNum(valueHappy)
	
	if valueHP == MaxHP and valueHappy == MaxHappiness then
		x702000_ShowMsg( sceneId, selfId, "该宠物不需要使用宠粮")
		return 0
	end

	--消耗一次珍兽滋补丹
	if bagId >= 0 then		
	
		if UseValue >= x702000_g_MaxUseCount then   --记录的使用次数大于等于最大可用次数,理论上不可能出现.
		    return 0
		end
		
		local CurValue = UseValue + 1
		
		-- PrintNum(CurValue)
		
		SetBagItemParam( sceneId, selfId, bagId, 4, 2, x702000_g_MaxUseCount ) --设置最大次数
		SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurValue ) --设置已用次数
				
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		local CheckParam1 = GetBagItemParam( sceneId, selfId, bagId, 4, 2 )   
		local CheckParam2 = GetBagItemParam( sceneId, selfId, bagId, 8, 2 )
		
		-- PrintNum(CheckParam1)
		-- PrintNum(CheckParam2)
		
		if CheckParam1 ~= x702000_g_MaxUseCount then
		    return 0
		end
		if CheckParam2 ~= CurValue then
		    return 0
		end
		--------------参数设置安全性检测,虽然理论上参数设置不会失败
		
		
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )	--刷新背包信息
	    
		if CurValue >= x702000_g_MaxUseCount then  --当使用次数达到最大次数时,将删除此物品
			local EraseRet = EraseItem( sceneId, selfId, bagId )
			
			-- PrintStr("删除")
			-- PrintNum(EraseRet)
			
			if EraseRet < 0 then      --如果删除失败,将不会产生任何效果
			  local strMsg = "需要宠物滋补丹"
				x702000_ShowMsg( sceneId, selfId, strMsg)
				return 0
			end
			
		end
	else
		local strMsg = "需要宠物滋补丹"
		x702000_ShowMsg( sceneId, selfId, strMsg)
		return 0
	end

	-- 消耗珍兽滋补丹完毕

	-- PrintNum(x702000_g_HPValue)

	if x702000_g_HPValue > 0 then
		CallScriptFunction( x702000_g_petCommonId, "IncPetHP", sceneId, selfId, x702000_g_HPValue )
	end

	if x702000_g_MaxHPValue > 0 then
		CallScriptFunction( x702000_g_petCommonId, "IncPetMaxHP", sceneId, selfId, x702000_g_MaxHPValue )
	end

	if x702000_g_LifeValue > 0 then
		CallScriptFunction( x702000_g_petCommonId, "IncPetLife", sceneId, selfId, x702000_g_LifeValue )
	end

	if x702000_g_HappinessValue > 0 then
		local happy = LuaFnGetPet_Happyness(sceneId, selfId, 0)
		
		-- PrintNum(happy)
		
		if valueHappy < 60 then
			local happyes = 61 - valueHappy
			
			-- PrintNum(happyes)
			
			CallScriptFunction( x702000_g_petCommonId, "IncPetHappiness", sceneId, selfId, happyes )
		else
			CallScriptFunction( x702000_g_petCommonId, "IncPetHappiness", sceneId, selfId, x702000_g_HappinessValue )
		end
	end

--	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, g_ImpactID, 0)
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x702000_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- 这个函数没有什么用，但是必须有
function x702000_CancelImpacts( sceneId, selfId )
	return 0
end

function x702000_ShowMsg( sceneId, selfId, strMsg)
	BeginEvent( sceneId )
		AddText( sceneId, strMsg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end
