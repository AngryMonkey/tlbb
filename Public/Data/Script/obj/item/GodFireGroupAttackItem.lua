--创建人:[ QUFEI 2008-03-10 10:41 UPDATE BugID 32708 ]

--龟兔赛跑传递活动群攻击道具使用脚本


--脚本号
x808088_g_scriptId = 808088

--需要的等级
--需要的任务ID
x808088_g_MissionID = 1000

--需要的效果ID	火把使者
x808088_g_ImpactID 	= 5929

--效果的ID	如果玩家身上有 SelfimpactID,则使用 impactId01,否则使用 impactId02
x808088_g_itemList = {}
x808088_g_itemList[30505213] = { SelfimpactID=5933, impactId01=0, impactId02=5940 }			-- 马蜂窝

--攻击范围
x808088_g_AttackRange = 5


--**********************************
--事件交互入口
--**********************************
function x808088_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x808088_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x808088_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x808088_OnConditionCheck( sceneId, selfId )

	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	--检测使用者有没有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x808088_g_MissionID ) <= 0 then
		x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_011}" )
		return 0
	end
	
	--检测使用者道具使用条件
	if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x808088_g_ImpactID) == 0 then
		x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_036}" )
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808088_g_itemList[itemTblIndex];
	if not itemCur then
		x808088_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end

	--检验攻击目标使用条件
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 0
	end

	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then				--打的是玩家....
		
		-- 检测是否打自己
		if selfId == targetId then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0
		end
		
		--检测被攻击者有没有龟兔赛跑任务
		if IsHaveMission( sceneId, targetId, x808088_g_MissionID ) <= 0 then
			x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
			return 0
		end
		
		--检测被攻击者道具使用条件
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, targetId, x808088_g_ImpactID) == 0 then
			x808088_NotifyFailTips( sceneId, selfId, "#{GodFire_Info_061}" )
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
function x808088_OnDeplete( sceneId, selfId )
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
function x808088_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x808088_g_itemList[itemTblIndex];
	if not itemCur then
		x808088_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end

	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if targetId < 0 then
		return 1
	end
	local objType = GetCharacterType( sceneId, targetId )

	if objType == 1 then--打的是其他玩家....
	
		--取得被攻击者的当前坐标	
		local PlayerX = GetHumanWorldX(sceneId,targetId)
		local PlayerY = GetHumanWorldZ(sceneId,targetId)
		
		-- 遍历场景中所有玩家,并给与被攻击者攻击范围内的玩家加Impact
		local nPlayerCnt = LuaFnGetCopyScene_HumanCount( sceneId )
		for i=0, nPlayerCnt-1 do
			local OtherPlayerId = LuaFnGetCopyScene_HumanObjId( sceneId, i )
			
			--取得被攻击者周围其他玩家的当前坐标	
			local OtherPlayerX = GetHumanWorldX(sceneId,OtherPlayerId)
			local OtherPlayerY = GetHumanWorldZ(sceneId,OtherPlayerId)
			
			local Distance = floor(sqrt((OtherPlayerX-PlayerX)*(OtherPlayerX-PlayerX)+(OtherPlayerY-PlayerY)*(OtherPlayerY-PlayerY)))
			if Distance < x808088_g_AttackRange then
				
				-- 检测被攻击者周围其他玩家Impact
				if IsHaveMission( sceneId, OtherPlayerId, x808088_g_MissionID ) > 0
					 and LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, x808088_g_ImpactID) ~= 0 then									
					if LuaFnHaveImpactOfSpecificDataIndex(sceneId, OtherPlayerId, itemCur.SelfimpactID) ~= 0 then
						if itemCur.impactId01 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, itemCur.impactId01, 0);
						end
					else
						if itemCur.impactId02 ~= 0 then
							LuaFnSendSpecificImpactToUnit(sceneId, OtherPlayerId, OtherPlayerId, OtherPlayerId, itemCur.impactId02, 0);
						end
					end
				end
			end			
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
function x808088_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目提示
--**********************************
function x808088_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
