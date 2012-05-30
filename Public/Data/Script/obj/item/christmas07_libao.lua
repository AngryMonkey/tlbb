--07圣诞元旦活动
--圣诞守夜活动
--礼包使用脚本


--脚本号
x300065_g_scriptId = 300065

--礼品概率表....
x300065_g_GiftTbl = {

	{ itemId=10124134, odds=10   },
	{ itemId=10141090, odds=10   },

	{ itemId=30509039, odds=20000},
	{ itemId=30505146, odds=10000},

	{ itemId=10141100, odds=4990 },
	{ itemId=10141101, odds=4990 },

	{ itemId=30501125, odds=15000},
	{ itemId=30501126, odds=15000},
	{ itemId=30501127, odds=15000},

	{ itemId=-999,     odds=15000},

}

--圣诞帽表....
x300065_g_HatTbl = {

	10410098,
	10410099,
	10410100,
	10410101,
	10410102,
	10410103,
	10410104,
	10410105,
	10410106,
	10410107

}

--特效表....
x300065_g_ImpactTbl = {

	[30505150] = 10483,
	[30505153] = 10484,
	[30505152] = 10485,
	[30505151] = 10486

}

--**********************************
--事件交互入口
--**********************************
function x300065_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300065_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300065_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300065_OnConditionCheck( sceneId, selfId )
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x300065_OnDeplete( sceneId, selfId )

	local bagpos = LuaFnGetBagIndexOfUsedItem(sceneId, selfId)
	local itemId = LuaFnGetItemTableIndexByIndex(sceneId, selfId, bagpos)
	local impactId = x300065_g_ImpactTbl[itemId]

	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		if impactId then
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, impactId, 0)
		end
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
function x300065_OnActivateOnce( sceneId, selfId )

	--给经验....( 0.1*x*x + 6*x + 20 ) *15 *5....
	--7.5*x*x + 450*x +1500
	local Level = GetLevel(sceneId,selfId)
	local exp = 7.5 * Level * Level + 450 * Level +1500
	LuaFnAddExp( sceneId, selfId, floor(exp))

	--给礼品....
	local GiftId = 0
	local randValue = random(100000);
	randValue = randValue - 1;

	for _, item in x300065_g_GiftTbl do
		if item.odds >= randValue then
			GiftId = item.itemId
			break;
		end
		randValue = randValue - item.odds;
	end

	if GiftId == 0 then
		return 1
	end

	--如果给的是圣诞帽....则自适应等级....强制绑定....
	if GiftId == -999 then

		local hatId = 1

		if Level < 10 then
			hatId = 1
		elseif Level < 100 then
			hatId = floor( Level/10 ) + 1
		else
			hatId = 10
		end

		GiftId = x300065_g_HatTbl[hatId]
		local BagPos = TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )
		if -1 ~= BagPos then
			LuaFnItemBind( sceneId, selfId, BagPos)
		end
		
		--日志统计
		local guid = LuaFnObjId2Guid(sceneId, selfId)
		local log = format("itemId=%d", GiftId)
		ScriptGlobal_AuditGeneralLog(LUAAUDIT_SNOW, guid, log)

	elseif GiftId == 30509039 or GiftId == 10124134 or GiftId == 10141090 then
	--烟花 服装 坐骑需要绑定....
	
		local BagIndex = TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )
		if BagIndex ~= -1 then
			LuaFnItemBind( sceneId, selfId, BagIndex)
		end

	else
	--其它则直接给....

		TryRecieveItem( sceneId, selfId, GiftId, QUALITY_MUST_BE_CHANGE )

	end

	--发恭喜邮件....
	if GiftId ~= 0 then
		LuaFnSendSystemMail(sceneId, GetName(sceneId, selfId), "    恭喜您获得圣诞礼物#Y#{_ITEM" ..GiftId.. "}#W。#r    《天龙八部》祝您圣诞快乐，愿您在《天龙八部》的世界中永远开心、愉快。 愿您与《天龙八部》一起茁壮成长，互相共勉，一同奔向美好、光明的前方。")
	end


	return 1;

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300065_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
