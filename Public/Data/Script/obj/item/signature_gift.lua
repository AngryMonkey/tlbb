--收集签名奖励 大礼包 
--Created by zchw

--脚本号
x300102_g_scriptId = 300102
x300102_g_piece =
{
	[1] = 20501000,		--棉布碎片20501000；
	[2] = 20500000,		--精铁碎片20500000；
	[3] = 20502000,   --秘银碎片20502000
}

x300102_g_prizeInfo =
{
	{id = 30509020, rate = 78}, --烟花 天舞宝轮
	{id = 0, rate = 20}, 				--三精碎片
	{id = 10124112, rate = 2}, 	--学生时装 
}

--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x300102_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300102_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300102_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0;
	end
	if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 or LuaFnGetMaterialBagSpace(sceneId, selfId) == 0 then
		x300102_NotifyFailTips(sceneId, selfId, "#{SJQM_8819_21}");
		return 0;
	end
	return 1;
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x300102_OnDeplete( sceneId, selfId )
	--删除大礼包
	if LuaFnDepletingUsedItem( sceneId, selfId ) <= 0 then
		return 0;
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
function x300102_OnActivateOnce( sceneId, selfId )
	local rand = random(100);
	local PrizePos = "";
	local itemId = "";
	if rand < x300102_g_prizeInfo[1].rate then
		-- 给奖励
		itemId = x300102_g_prizeInfo[1].id;
		PrizePos = TryRecieveItem(sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE );
	elseif rand < x300102_g_prizeInfo[1].rate + x300102_g_prizeInfo[2].rate then
		local rdm = random(3);
		itemId = x300102_g_piece[rdm];
		PrizePos = TryRecieveItem(sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE );
	else
		itemId = x300102_g_prizeInfo[3].id;
		PrizePos = TryRecieveItem(sceneId, selfId, itemId, QUALITY_MUST_BE_CHANGE );
	end
	
	if PrizePos == -1 then
		x300102_NotifyFailTips(sceneId, selfId, "给奖励失败！");
		return 0;
	end
	--日志
	AuditExchangeFriendGift(sceneId, selfId, itemId);
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能心跳时生效的入口
--**********************************
function x300102_OnActivateEachTick( sceneId, selfId )
	return 1
end

----------------------
--失败提示
----------------------
function x300102_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

