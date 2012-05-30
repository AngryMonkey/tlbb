-- 终级还童丹


-- 宠物通用功能脚本
x334908_g_petCommonId = PETCOMMON

x334908_g_itemList = {}
x334908_g_itemList[30503016] = {minLevel = 1, maxLevel = 85}	--终级珍兽还童卷轴
x334908_g_itemList[30503017] = {minLevel = 1, maxLevel = 35}	--低级珍兽还童天书
x334908_g_itemList[30503018] = {minLevel = 1, maxLevel = 65}	--中级珍兽还童天书
x334908_g_itemList[30503019] = {minLevel = 1, maxLevel = 85}	--高级珍兽还童天书
x334908_g_itemList[30503020] = {minLevel = 1, maxLevel = 95}	--超级珍兽还童天书
--******************************************************************************
-- 以下部分需要是需要修改的部分
--******************************************************************************

--脚本号 （改成正确脚本号）
x334908_g_scriptId = 334908

--标准效果ID （改成宠物使用驯养道具的特效）
--g_ImpactID = 0

--******************************************************************************
-- 以上部分需要是需要修改的部分
--******************************************************************************

--脚本

--**********************************
--必须返回 1 才能正确执行以下流程
--**********************************
function x334908_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x334908_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end

	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local petItem = x334908_g_itemList[itemTblIndex];
	if not petItem then
		x334908_NotifyTip(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end

	local petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	local petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	if LuaFnPetCanReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1) == 0 then
		return 0
	end
	
	local petDataID = LuaFnGetPetDataIDByGUID(sceneId, selfId, petGUID_H, petGUID_L);
	if not petDataID or petDataID < 0 then
		x334908_NotifyTip(sceneId, selfId, "无法对指定珍兽进行还童。");
		return 0;
	end
	
	local petTakeLevel = GetPetTakeLevel(petDataID);
	if not petTakeLevel or petTakeLevel < 1 then
		x334908_NotifyTip(sceneId, selfId, "无法识别珍兽的携带等级。");
		return 0;
	end
	
	if petTakeLevel > petItem.maxLevel then
		if (petTakeLevel == 95) then
			x334908_NotifyTip(sceneId, selfId, "#{95ZSH_081121_01}");
			return 0;
		else
			x334908_NotifyTip(sceneId, selfId, "不能对携带等级为"..petItem.maxLevel.."级以上的珍兽进行还童。");
			return 0;
		end
	end

	return 1
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x334908_OnDeplete( sceneId, selfId )
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
function x334908_OnActivateOnce( sceneId, selfId )
	petGUID_H = LuaFnGetHighSectionOfTargetPetGuid( sceneId, selfId )
	petGUID_L = LuaFnGetLowSectionOfTargetPetGuid( sceneId, selfId )

	-- 珍兽还童
	local ret, perLevel = LuaFnPetReturnToChild( sceneId, selfId, petGUID_H, petGUID_L, 1, -1)
	if ret and ret == 1 then
		local szMsg = "珍兽还童成功！";
		x334908_NotifyTip( sceneId, selfId, szMsg );															-- 醒目提示
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);		-- 特效
		
		local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );			--by Vega 20080919
		local nGrowLevel = 0;
		if (itemTblIndex == 30503017 or itemTblIndex == 30503018 or itemTblIndex == 30503019 or itemTblIndex == 30503020 or itemTblIndex == 30503016) then		
			nGrowLevel = LuaFnGetPetGrowRateByGUID( sceneId, selfId, petGUID_H, petGUID_L )      
		end											--by Vega 20080919

		local selfName = LuaFnGetName(sceneId, selfId);
		local petTransfer = LuaFnGetPetTransferByGUID(sceneId, selfId, petGUID_H, petGUID_L);
		if perLevel and perLevel >= 6 and selfName and petTransfer then
			local strWorldChat = "#{_INFOUSR"..selfName.."}#H使用#Y还童天书#H后，#{_INFOMSG"..petTransfer.."}#H从天而降！";
			BroadMsgByChatPipe(sceneId, selfId, strWorldChat, 4);
		end
		
		-- 成长率在杰出（含）以上时播放系统公告
		-- add by WTT	20090116
		if (nGrowLevel >= 4) then
			local strTbl = {"普通","优秀","杰出","卓越","完美"};
			-- AAA很喜欢小动物，将珍兽还童后竟然意外的得到了成长率为CCC的BBB！爱心的回报果然丰厚。
			-- AAA为玩家链接  BBB为还童后珍兽的链接	 CCC为成长率（杰出及以上）。
			local Msg = "#W#{_INFOUSR%s}#{HT14}#Y"..strTbl[nGrowLevel].."#{HT15}#{_INFOMSG%s}#{HT16}"
			local szPetTrans = GetPetTransString ( sceneId, selfId, petGUID_H, petGUID_L )
			local str = format( Msg, selfName, szPetTrans )
				
			BroadMsgByChatPipe (sceneId, selfId, str, 4)
		end
		
	end
	return 1
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x334908_OnActivateEachTick( sceneId, selfId )
	return 1
end

-- 这个函数没有什么用，但是必须有
function x334908_CancelImpacts( sceneId, selfId )
	return 0
end


--**********************************
--醒目提示
--**********************************
function x334908_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
