--教师节大礼包 Created by zchw

--脚本号
x300101_g_scriptId = 300101

x300101_g_prize = {
										{id = 30501162, rate = 999200}, --师徒宝珠 道具栏 拾取绑定
										{id = 20307002, rate = 150},    --染发剂   材料栏
										{id = 10124056, rate = 644},    --才子佳人 道具栏 拾取绑定
										{id = 20310103, rate = 2},      --大风牙   材料栏
										{id = 20310104, rate = 2},      --大风爪
										{id = 20310105, rate = 2},			--大风翼
									}
--**********************************
-- 返回1：技能类似的物品，可以继续类似技能的执行；返回0：执行 OnDefaultEvent。
--**********************************
function x300101_IsSkillLikeScript( sceneId, selfId )
	return 1
end

--**********************************
-- 返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300101_CancelImpacts( sceneId, selfId )
	return 0
end

--**********************************
-- 条件检测入口：返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300101_OnConditionCheck( sceneId, selfId )
	-- 校验使用的物品
	if LuaFnVerifyUsedItem( sceneId, selfId ) ~= 1 then
		return 0
	end
	return 1
end

--**********************************
--消耗检测及处理入口，负责消耗的检测和执行：
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--**********************************
function x300101_OnDeplete( sceneId, selfId )
	return 1
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x300101_OnActivateOnce( sceneId, selfId )

	--删除前保存Trans....
	local BagPos = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local ItemInfo = GetBagItemTransfer( sceneId, selfId, BagPos )

	--得到奖励物品号
	local ranNum = random(1000000);
	local prizeIndex = 0;
	if (ranNum < 999200) then   --师徒宝珠 道具栏
		prizeIndex = x300101_g_prize[1].id;
	elseif (ranNum < 999200+150) then  --染发剂
		prizeIndex = x300101_g_prize[2].id;
	elseif (ranNum < 999200+150+644) then --才子佳人
		prizeIndex = x300101_g_prize[3].id;
	elseif (ranNum < 999200+150+644+2) then
		prizeIndex = x300101_g_prize[4].id;
	elseif (ranNum < 999200+150+644+2+2) then
		prizeIndex = x300101_g_prize[5].id;
	else
		prizeIndex = x300101_g_prize[6].id;
	end

	local spaceNum1 = LuaFnGetPropertyBagSpace(sceneId, selfId);
	local spaceNum2 = LuaFnGetMaterialBagSpace(sceneId, selfId);
	
	if spaceNum1 == 0 or spaceNum2 ==0 then
		x300101_NotifyFailTips(sceneId, selfId, "道具栏或材料栏空间不足！");
		return 0;
	end
	
	--删除大礼包
	if LuaFnDepletingUsedItem( sceneId, selfId ) <= 0 then
		return 0;
	end
	-- 给奖励
	local PrizePos = TryRecieveItem(sceneId, selfId, prizeIndex, QUALITY_MUST_BE_CHANGE );

	--拾取绑定 
	if (prizeIndex == x300101_g_prize[1].id) or (prizeIndex == x300101_g_prize[3].id) then
		if LuaFnItemBind(sceneId, selfId, PrizePos) ~= 1 then
				local bindmsg = "绑定失败"													
		  	BeginEvent( sceneId )
		    	AddText( sceneId, bindmsg )
		  	EndEvent( sceneId )
		  	DispatchMissionTips( sceneId, selfId )
		end
	end
	local PrizeItemInfo = GetBagItemTransfer(sceneId, selfId, PrizePos);

  -- add log
  AuditUseTeacherGift(sceneId, selfId, prizeIndex);
	-- add notify
	local msg = nil;
	local playerName = GetName(sceneId, selfId);

	if (prizeIndex == x300101_g_prize[2].id) or (prizeIndex == x300101_g_prize[3].id) then
		msg = format("#B#{_INFOUSR%s}#{STDLB_8725_1}#{_INFOMSG%s}#{STDLB_8725_2}#{_INFOMSG%s}#{JPN_3}", playerName, ItemInfo, PrizeItemInfo);
	elseif (prizeIndex == x300101_g_prize[4].id) or (prizeIndex == x300101_g_prize[5].id) or (prizeIndex == x300101_g_prize[6].id) then
		msg = format("#B#{_INFOUSR%s}#{STDLB_8725_1}#{_INFOMSG%s}#{STDLB_8725_3}#{_INFOMSG%s}#{STDLB_8725_4}", playerName, ItemInfo, PrizeItemInfo);
	end

	if msg ~= nil then
		AddGlobalCountNews( sceneId, msg )
	end
	-- set buff
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 8062, 0); --加效果
	return 1
end
----------------------
--失败提示
----------------------
function x300101_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能心跳时生效的入口
--**********************************
function x300101_OnActivateEachTick( sceneId, selfId )
	return 1
end

