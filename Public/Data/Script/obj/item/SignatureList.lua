--------------------------------------------
--签名录道具脚本
--Created By 左春伟
--------------------------------------------

--脚本ID
x335806_g_scriptId = 335806
--签名道具ID
x335806_g_signatureId = 40004452; 
--需收集数量
x335806_g_FullNum = 15;
-- 收集签名任务号
x335806_g_MissionId = 1130;

--**********************************
--事件交互入口
--**********************************
function x335806_OnDefaultEvent( sceneId, selfId, bagIndex )	

end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335806_IsSkillLikeScript( sceneId, selfId)
	return 1
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335806_CancelImpacts( sceneId, selfId )
	return 0;
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335806_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if 1 ~= LuaFnVerifyUsedItem(sceneId, selfId) then
		return 0;
	end
	if x335806_IsFitCondition(sceneId, selfId) == 0 then
		return 0;
	end
	-- 检测通过
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local myName = GetName(sceneId, selfId);
	BeginEvent(sceneId)
		local text = format("#{_INFOUSR%s}正在对你收集签名，请不要离开附近范围。", myName);
		AddText(sceneId, text);
	EndEvent()
	DispatchMissionTips(sceneId, targetId);
	return 1;
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x335806_OnDeplete( sceneId, selfId )	
	return 1;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x335806_OnActivateOnce( sceneId, selfId )
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		SetMissionByIndex(sceneId, selfId, misIndex, 2, 1);
	end	
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x335806_OnActivateEachTick( sceneId, selfId)
	--检测好友是否超距离
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_14}");
		return 0;	
	end
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 1 then
		local misIndex = GetMissionIndexByID(sceneId, selfId, x335806_g_MissionId);
		local tickCount = GetMissionParam(sceneId, selfId, misIndex, 2)
		if tickCount >= 60 then --1分钟时间到，进度条走完
			--条件检查
			if x335806_IsFitCondition(sceneId, selfId) == 0 then
				return 0;
			end		
			--给好友签名道具
			local bagPos = TryRecieveItem(sceneId, selfId, x335806_g_signatureId, QUALITY_MUST_BE_CHANGE);
			if bagPos == -1 then
				x335806_MsgBox(sceneId, selfId, "给好友签名道具失败！");
				return 0;
			end
			--签名
			local targetId = LuaFnGetTargetObjID(sceneId, selfId);
			local friendName = GetName(sceneId, targetId);
			LuaFnSetItemCreator(sceneId, selfId, bagPos, friendName);
			local num = GetItemCount(sceneId, selfId, x335806_g_signatureId);
			SetMissionByIndex(sceneId, selfId, misIndex, 1, num);
			if num >= x335806_g_FullNum then
				SetMissionByIndex(sceneId, selfId, misIndex, 0, 1);
			end
			local text = format("已经成功收集到%d/15个签名。", num);
			x335806_MsgBox(sceneId, selfId, text);	
		end		
		SetMissionByIndex(sceneId, selfId, misIndex, 2, tickCount+1);
	end		
	return 1;   
end

--**********************************
--信息提示
--**********************************
function x335806_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 条件检查 
-- 成功：1  失败：0
--**********************************
function x335806_IsFitCondition(sceneId, selfId)
	--收集已满？
	local text = "";
	if LuaFnGetItemCount(sceneId, selfId, x335806_g_signatureId) >= x335806_g_FullNum then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_09}");
		return 0;
	end
	--选择使用对象了？
	local targetId = LuaFnGetTargetObjID(sceneId, selfId);
	if targetId < 0 or targetId == selfId then
		x335806_MsgBox(sceneId, selfId, "#{YRJ_SelfUseTip}");	
		return 0;
	end	
	--只能给玩家使用
	local objType = GetCharacterType( sceneId, targetId )--对象类型
	if(objType ~= 1)then	--对象不是Human
		x335806_MsgBox( sceneId, selfId, "#{ResultText_8}")	--无效目标
		return 0
	end	
	--是好友？
	if LuaFnIsFriend(sceneId, selfId, targetId) == 1 then
		if LuaFnGetFriendPoint(sceneId, selfId, targetId) < 200 then --200友好度？
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_10}");
			return 0;
		end
	else --非好友
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_11}");
		return 0;
	end	
	--超过距离
	local cur_x, cur_y = LuaFnGetWorldPos(sceneId, selfId);
	local cur_x2, cur_y2 = LuaFnGetWorldPos(sceneId, targetId);
	if (cur_x2-cur_x)*(cur_x2-cur_x) + (cur_y2-cur_y)*(cur_y2-cur_y) > 30 then 	
		x335806_MsgBox(sceneId, selfId, "超出范围！");
		return 0;	
	end
	--已有该好友签名？
	local friendName = GetName(sceneId, targetId);
	local taskBagStartPos	= LuaFnGetMaterialEndBagPos(sceneId, selfId) + 1;
	for i=taskBagStartPos, taskBagStartPos+19 do
		local bSucc, Creator = LuaFnGetItemCreator(sceneId, selfId, i);
		if friendName == Creator then
			x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_12}");
			return 0;
		end
	end
	--任务栏有空间？
	if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
		x335806_MsgBox(sceneId, selfId, "#{SJQM_8815_13}");
		return 0;		
	end
	--放弃任务
	if IsHaveMission(sceneId, selfId, x335806_g_MissionId) == 0 then
		x335806_MsgBox(sceneId, selfId, "你已放弃签名任务，该道具不可用！");
		return 0;		
	end
	--OK
	return 1;
end
