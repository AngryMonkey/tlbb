--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现


--脚本:

--以下是脚本样例:


--4918.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x334918_g_scriptId = 334918 --临时写这个,真正用的时候一定要改.

--需要的等级
x334918_g_levelRequire = 1
--AE范围半径
x334918_g_radiusAE = 3.0
--AE的目标关系标记
x334918_g_standFlag = 1 -- 2:队友， 1：友军， -1：敌军
--AE影响数目限制
x334918_g_effectCount = 4 -- -1:不限制
--效果的ID
x334918_g_Impact1 = 4918 --临时写这个
x334918_g_Impact2 = -1 --不用

--**********************************
--事件交互入口
--**********************************
function x334918_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x334918_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x334918_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x334918_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	if(0<=targetId) then
		-- 目标必须是友军的检测
		if LuaFnIsFriend(sceneId, targetId, selfId) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
		if LuaFnIsFriend(sceneId, selfId, targetId ) ~= 1 then
			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
			return 0;
		end
		
    local SelfSex = LuaFnGetSex(sceneId, selfId)
    local TargetSex = LuaFnGetSex(sceneId, targetId)                
    if( SelfSex == TargetSex ) then
      LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
      
      return 0;                                            
    end 
       
		-- 目标必须是敌军的检测
--		if(1~=LuaFnUnitIsEnemy(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- 目标必须是队友的检测
--		if(1~=LuaFnUnitIsPartner(sceneId, selfId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
		-- 目标级别的检测
--		if(g_LevelRequire<=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end
--		if(g_LevelRequire>=LuaFnGetLevel(sceneId, targetId)) then
--			LuaFnSendOResultToPlayer(sceneId, selfId, OR_INVALID_TARGET)
--			return 0;
--		end

	end
	
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x334918_OnDeplete( sceneId, selfId )
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)

	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
--		x334918_MsgBox( sceneId, selfId, "你没有足够的背包空间" )
--		return 0
	end

	if LuaFnGetPropertyBagSpace( sceneId, targetId ) < 1 then
		x334918_MsgBox( sceneId, selfId, "对方没有足够的背包空间" )
		return 0
	end
	
	local nItemBagIndex = GetBagPosByItemSn(sceneId, selfId, 30509011);
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemBagIndex);

	
	local targetId = LuaFnGetTargetObjID(sceneId, selfId)
	local szNameSelf = GetName( sceneId, selfId );
	local szNameTarget = GetName( sceneId, targetId );
	
	local randMessage = random(3);
	local message;

	if randMessage == 1 then
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_00}#{_INFOMSG%s}#{GiveRose_01}#{_INFOUSR%s}#{GiveRose_02}", szNameSelf, szTransfer, szNameTarget );
	elseif randMessage == 2 then		
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_04}#{_INFOUSR%s}#{GiveRose_05}", szNameSelf, szTransfer, szNameTarget );
	else		
		message = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{GiveRose_03}#{_INFOMSG%s}#{GiveRose_06}#{_INFOUSR%s}#{GiveRose_07}", szNameSelf, szTransfer, szNameTarget );
	end
	
	AddGlobalCountNews( sceneId, message )
			
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
function x334918_OnActivateOnce( sceneId, selfId )
	if(-1~=x334918_g_Impact1) then
		--给自己加效果
--		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x334918_g_Impact1, 0);
		--给目标加效果
		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
		if(0<=targetId) then
			if LuaFnIsFriend(sceneId, targetId, selfId) > 0 then
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, x334918_g_Impact1, 0);
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, targetId, 66, 0);
				
				local nFriendPoint = LuaFnGetFriendPoint( sceneId, selfId, targetId );
				if nFriendPoint >= 9999 then
			
					BeginEvent(sceneId)
						AddText(sceneId, "你与对方的好友度已经到达上限。");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)	
				
				else
				
					BeginEvent(sceneId)
					AddText(sceneId, "你与对方的友好度增加了5000");
					EndEvent(sceneId)
					DispatchMissionTips(sceneId,selfId)
					
				end
			  
			  local	namSelf		= GetName( sceneId, selfId )
			  local	namTarget	= GetName( sceneId, targetId )
			

			--给对方用光效
			LuaFnSendSpecificImpactToUnit(sceneId, targetId, targetId, targetId, 18, 0);			

					  
			  --奖励
				local	lstBounty	=
				{
					[0]	= { 10124021,	228, "玫瑰仙子" },		--女装
					[1]	= { 10124020,	227, "情圣" },				--男装
				}
			  local	untBounty
			  if GetSex( sceneId, selfId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, selfId, untBounty[1], 1 ) >= 0 then
			  	x334918_MsgBox( sceneId, selfId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			  end
				AwardTitle( sceneId, selfId, 8, untBounty[2] )
				LuaFnDispatchAllTitle( sceneId, selfId )		--更新所有称号到CLIENT
			  x334918_MsgBox( sceneId, selfId, "你得到了["..untBounty[3].."]称号。" )

			  if GetSex( sceneId, targetId ) == 0 then
			  	untBounty	= lstBounty[0]
			  else
			  	untBounty	= lstBounty[1]
			  end
			  if TryRecieveItem( sceneId, targetId, untBounty[1], 1 ) >= 0 then
			  	x334918_MsgBox( sceneId, targetId, "你得到了一件"..GetItemName( sceneId, untBounty[1] ) )
			  end
			  AwardTitle( sceneId, targetId, 8, untBounty[2] )
			  LuaFnDispatchAllTitle( sceneId, targetId )	--更新所有称号到CLIENT
			  x334918_MsgBox( sceneId, targetId, "你得到了["..untBounty[3].."]称号。" )

			end
		end
		--自己周围AE
--		local posX,posZ = LuaFnGetUnitPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--指定地点周围AE
--		local posX,posZ = LuaFnGetTargetPosition(sceneId, selfId)
--		LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
		--目标个体周围AE
--		local targetId = LuaFnGetTargetObjID(sceneId, selfId)
--		if(0<=targetId) then
--			local posX,posZ = LuaFnGetUnitPosition(sceneId, targetId)
--			LuaFnSendImpactAroundPosition(sceneId, selfID, posX, posZ, x334918_g_radiusAE, x334918_g_standFlag, x334918_g_levelRequire, x334918_g_effectCount, x334918_g_Impact1, 0)
--		end

	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x334918_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
--醒目提示
--**********************************
function x334918_MsgBox( sceneId, selfId, Msg )
	if Msg == nil then
		return
	end
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
