--情人节活动

--爱神之箭使用脚本


--脚本号
x300071_g_scriptId = 300071

--最大使用次数
x300071_UseMaxCount = 3

--**********************************
--事件交互入口
--**********************************
function x300071_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300071_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300071_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300071_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--打的是玩家....

			--不能对自己使用....
		if selfId == targetId then
			x300071_MsgBox( sceneId, selfId, "#{QRJ_81009_19}" )
			return 0
		end
		
			--判断两人的性别
			
		if (LuaFnGetSex(sceneId,selfId) == LuaFnGetSex(sceneId,targetId)) then
			x300071_MsgBox( sceneId, selfId, "#{QRJ_81009_20}")
			return 0
		end
	
	else
		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
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
function x300071_OnDeplete( sceneId, selfId )
	if(LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x300071_OnActivateOnce( sceneId, selfId )
	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--打的是其他玩家....
		
			--背包中的位置
		local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
		if bagId < 0 then
			return 1
		end 
			--检测物品是否加锁
		if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
			x300071_MsgBox( sceneId, selfId, "此物品已被锁定！" )
			return 1
		end
		
		local	CurUseCount			--爱神之箭的剩余使用次数
		CurUseCount		= GetBagItemParam( sceneId, selfId, bagId, 8, 2 )	--获取剩余使用次数	
		if(CurUseCount == 0)then	--第一次使用
			CurUseCount = x300071_UseMaxCount		
		end
		
		if (CurUseCount>0) then
			CurUseCount = CurUseCount - 1
			if(CurUseCount <= 0) then
				local ret = EraseItem( sceneId, selfId, bagId )		
				if ret ~= 1 then
					return 0--删除失败
				end
			end
			--保存一下数据
			SetBagItemParam( sceneId, selfId, bagId, 4, 2, x300071_UseMaxCount )--保存最大使用次数
			SetBagItemParam( sceneId, selfId, bagId, 8, 2, CurUseCount )--保存还可以使用次数
			
			--刷新Client端的背包物品信息
			LuaFnRefreshItemInfo( sceneId, selfId, bagId )
			
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 74, 1500) 
			x300071_MsgBox( sceneId, targetId, LuaFnGetName(sceneId,selfId).."#{QRJ_81009_22}" )
		end 
		
	else

		LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
		return 1

	end



	return 1;

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300071_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
--信息提示
--**********************************
function x300071_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
