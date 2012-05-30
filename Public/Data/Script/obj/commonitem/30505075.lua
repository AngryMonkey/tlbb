--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--3004.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x332000_g_scriptId = 332000 --临时写这个,真正用的时候一定要改.

--需要的等级

--效果的ID
x332000_g_Impact1 = 3004 --临时写这个
x332000_g_Impact2 = -1 --不用

--**********************************
--事件交互入口
--**********************************
function x332000_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x332000_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x332000_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x332000_OnConditionCheck( sceneId, selfId )

	if sceneId ~= 5 then
		return 0;
	end
	
	local targetX, targetZ;
	targetX = 268;
	targetZ = 241;
	local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
	local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
--	local MonsterId = LuaFnCreateMonster( sceneId, 473, nPlayerX, nPlayerZ, 3, 0, 808038);
--	SetCharacterDieTime(sceneId, MonsterId, 1000*10)
	local msg;
	
	if fDis > 5    then
		msg = "只有在镜湖的（268，241）附近方可进行炼制。";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
		
		--检验 有效性
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "已经过了有效期！";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end
	end
	
	--活动 有效
	local actId = 36;
	
	local LianYaoStatus = GetActivityParam( sceneId, actId, 0 );
	
	if LianYaoStatus <= 0 then
		DelItem (  sceneId, selfId, 40004414, 1);
		local msg = "已经过了22：00无法种植，仙草已经消失。";
		x332000_NotifyTip(sceneId, selfId, msg);
		return 0;
	end
	--生成点有效
	local QianNianCaoGen = GetActivityParam( sceneId, actId, 1 );
	if QianNianCaoGen <= 0 then
		return 0;
	end
	--确保 没有 药鼎
	local YaoDing_LianYao_Status = GetActivityParam( sceneId, actId, 2 );
	if YaoDing_LianYao_Status > 0 then
		return 0;
	end
	
	msg = "#{JingHu_LingYao_01}";
		
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,x332000_g_scriptId);		
		UICommand_AddInt(sceneId,1);
		UICommand_AddString(sceneId,"DoUseItemReal");
		UICommand_AddString(sceneId, msg);
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
		

	--加兰的满兰检查
	--if(GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId)) then
	--	return 0
	--end

	--加血和蓝的满血满蓝检查
	--if((GetHp(sceneId, selfId) >= GetMaxHp(sceneId, selfId)) and (GetMp(sceneId, selfId) >= GetMaxMp(sceneId, selfId))) then
	--	return 0
	--end

	return 0; --不需要任何条件，并且始终返回1。
end


function x332000_DoUseItemReal( sceneId, selfId, param1, param2 )
	if sceneId ~= 5 then
		return 0;
	end
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004414);
	if nItemBagIndex >= 0 then
	
		-- 检查是否在有效范围内
		local targetX, targetZ;
		targetX = 268;
		targetZ = 241;
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		local fDis = floor(sqrt((targetX-nPlayerX)*(targetX-nPlayerX)+(targetZ-nPlayerZ)*(targetZ-nPlayerZ)))
	
		if fDis > 5    then
			local msg;
			msg = "只有在镜湖的（268，241）附近方可进行炼制。";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;
		end
		
		--检验 有效性
		local nStartTime = GetBagItemParam( sceneId, selfId, nItemBagIndex, 4, 2 );
		local nCurTime = LuaFnGetCurrentTime();		
		local nDelta = nCurTime - nStartTime;
		
		if nDelta >= 4*60*60 then
			DelItem (  sceneId, selfId, 40004414, 1);
			local msg = "已经过了有效期！";
			x332000_NotifyTip(sceneId, selfId, msg);
			return 0;		
		end

		local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

		local message = format("#{JingHu_LingYao_02}#{_INFOMSG%s}#{JingHu_LingYao_03}", szTransfer);		

		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		DelItem (  sceneId, selfId, 40004414, 1);
		
		local nPlayerX, nPlayerZ = GetWorldPos(sceneId, selfId);
		
		nPlayerX = nPlayerX + 1;
		nPlayerZ = nPlayerZ + 1;
		
		
		local MonsterId = LuaFnCreateMonster( sceneId, 881, nPlayerX, nPlayerZ, 3, -1, 502000 );	
		
--		SetUnitReputationID(sceneId, selfId, MonsterId, GetUnitReputationID(sceneId, selfId, selfId))
		
		SetCharacterDieTime(sceneId, MonsterId, 1000*60*60)

		local nCurTime = LuaFnGetCurrentTime()
		local actId = 36;
		SetActivityParam( sceneId, actId, 4, nCurTime );
		SetActivityParam( sceneId, actId, 2, 1 );
		
		local selfGUID = LuaFnGetGUID(sceneId, selfId);
		
		SetActivityParam( sceneId, actId, 3, selfGUID );
		
		local szPlayerName = LuaFnGetName( sceneId, selfId );		
		JINGHU_YAODING_CREATER_NAME = szPlayerName;
		
		SetActivityParam( sceneId, actId, 5, MonsterId );
		
		--为了避免一个人有多个 药鼎任务道具
		DelItem (  sceneId, selfId, 40004415, 1);
		if TryRecieveItem( sceneId, selfId, 40004415, 1 ) >= 0 then
			local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 40004415);
						
			SetBagItemParam( sceneId, selfId, nItemBagIndex, 3, 2, nCurTime )			
			
		end
		
	end
	


end



--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x332000_OnDeplete( sceneId, selfId )
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
function x332000_OnActivateOnce( sceneId, selfId )
	if(-1~=x332000_g_Impact1) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x332000_g_Impact1, 0);
	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x332000_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end


--**********************************
--醒目提示
--**********************************
function x332000_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
