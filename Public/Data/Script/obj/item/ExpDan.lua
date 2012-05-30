--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


------------------------------------------------------------------------------------------
--经验滋补丹使用脚本

--脚本号
x889035_g_scriptId = 889035 

x889035_ExpDan = {{ID =30504067,Exp =5355,flag =MF_TW_EXPDAN10},
		{ID =30504055,Exp =21665,flag =MF_TW_EXPDAN20},
		{ID =30504056,Exp =105080,flag =MF_TW_EXPDAN30},
		{ID =30504057,Exp =348381,flag =MF_TW_EXPDAN40},
		{ID =30504058,Exp =700000,flag =MF_TW_EXPDAN50},
	}

--**********************************
--事件交互入口
--**********************************
function x889035_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889035_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889035_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889035_OnConditionCheck( sceneId, selfId )

	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		
		--获得物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end

	if (iIndex ==-1) then
		return 0
	end
		
	--是否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag)
	if (bHave ==1) then
		BeginEvent( sceneId )
			AddText( sceneId, "#{TSJH_090224_27}" )
		EndEvent( sceneId )
		DispatchMissionTips( sceneId, selfId )
		return 0
	end

	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x889035_OnDeplete( sceneId, selfId )
	
		--获得物品ID
	local Item = LuaFnGetItemIndexOfUsedItem(sceneId, selfId)
	local iIndex = -1
	for i=1,getn(x889035_ExpDan) do
		if (x889035_ExpDan[i].ID == Item) then
			iIndex = i
		end
	end
	if (iIndex ==-1) then
		return 0
	end

	local ExpBonus = x889035_ExpDan[iIndex].Exp;
	AddExp( sceneId, selfId, ExpBonus )
	SetMissionFlag(sceneId, selfId, x889035_ExpDan[iIndex].flag, 1)
	if (Item == 30504058) then
		local szTransfer;
	
		local szPlayerName = LuaFnGetName( sceneId, selfId );
	
		local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30504058);
		if nItemBagIndex >= 0 then		
			szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);
		end

		local message = format("#{_INFOUSR%s}#{TSJH_090224_28}#{_INFOMSG%s}#{TSJH_090224_29}", szPlayerName, szTransfer );	
		AddGlobalCountNews( sceneId, message )
	end
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
function x889035_OnActivateOnce( sceneId, selfId )

	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889035_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end


--**********************************
--醒目提示
--**********************************
function x889035_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
