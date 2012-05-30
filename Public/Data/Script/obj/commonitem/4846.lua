--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--4846.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本
--定位符（红色、蓝色、白色、绿色、黄色、紫色）
--脚本号
x334846_g_ScriptId	= 334846

--效果的ID
x334846_g_Impact		= -1	--使用一个特定的特效编号

--操作集
x334846_g_Key				= {}
x334846_g_Key["nul"]= 0		--啥都没做
x334846_g_Key["log"]= 1		--记录坐标
x334846_g_Key["bus"]= 2		--成功传送

--不同等级的定位符使用次数不同
x334846_g_UseTim		= { 8, 13, 20,30 }

x334846_g_Yinpiao = 40002000

x334846_g_Impact_NotTransportList = { 5929 } -- 禁止传送的Impact
x334846_g_TalkInfo_NotTransportList = { "#{GodFire_Info_062}" } -- 禁止传送的Impact提示信息

--禁止传送到楼兰场景等级上限	--add by xindefeng
x334846_g_LimitTransLevel = 75

--**********************************
--事件交互入口
--**********************************
function x334846_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x334846_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x334846_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x334846_OnConditionCheck( sceneId, selfId )

	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--判断当前状态是否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "您处于不允许传送的状态，不能使用定位符！" )
		return 0
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return 0
	end

	--检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "您处于跑商状态，不能使用定位符！")
		return 0
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	local	opx, opy	--记忆坐标
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )
	local osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )--已定位场景ID
	--若未记录过定位信息
	if opx <= 0 and opy <= 0 then
		--判断当前场景是否可使用定位符
		if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--楼兰也是主城--modify by xindefeng
			x334846_MsgBox( sceneId, selfId, "除了苏州、洛阳、大理、楼兰外，不可在其他场景使用定位符！" )
			return 0
		end		
	else	
		--已经定位,并且定位到楼兰,则判断级别,<90级禁入!--add by xindefeng
		if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
			local szMsg = format("楼兰需要%d级以上方可入内", x334846_g_LimitTransLevel)
			x334846_MsgBox( sceneId, selfId, szMsg )
			return 0
		end
	end

	--校验使用的物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
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
function x334846_OnDeplete( sceneId, selfId )
--if( 0 < LuaFnDepletingUsedItem( sceneId, selfId ) ) then
--	return 1
--end
--return 0

	return 1
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x334846_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x334846_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x334846_g_Impact, 0 )
	end
	
	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	key, tim	= x334846_OnUse( sceneId, selfId )
	
	--判断是否销毁物品
	if key == x334846_g_Key["bus"] and tim <= 0 then
--	LuaFnDepletingUsedItem( sceneId, selfId )
		if bagId >= 0 then
			EraseItem( sceneId, selfId, bagId )
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
function x334846_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end

--**********************************
--使用，返回操作指令以及剩余使用次数
--**********************************
function x334846_OnUse( sceneId, selfId )

	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return x334846_g_Key["nul"]
	end

	--判断当前状态是否可使用定位符
	if IsHaveMission( sceneId, selfId, 4021 ) > 0 then
		x334846_MsgBox( sceneId, selfId, "您处于不允许传送的状态，不能使用定位符！" )
		return x334846_g_Key["nul"]
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x334846_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return x334846_g_Key["nul"]
	end

	--检测玩家身上是不是有“银票”这个东西，有就不能使用这里的功能
	if GetItemCount(sceneId, selfId, x334846_g_Yinpiao) >= 1  then
		x334846_MsgBox(sceneId, selfId, "您处于跑商状态，不能使用定位符！")
		return x334846_g_Key["nul"]
	end
	
	--检测Impact状态驻留效果
	for i, ImpactId in x334846_g_Impact_NotTransportList do
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, ImpactId) ~= 0 then
			BeginEvent(sceneId)			
				AddText(sceneId, x334846_g_TalkInfo_NotTransportList[i]);
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return 0
		end
	end
	
	--定位符的最大使用次数
	local	oid		= LuaFnGetItemTableIndexByIndex( sceneId, selfId, bagId )
	local	olev	= GetCommonItemGrade( oid )
	local	omax	= x334846_g_UseTim[olev]

	--获取记录在物品身上的数据结构
	local	otim			--定位符的剩余使用次数
	local	osid			--场景编号
	local	opx, opy	--记忆坐标
	otim	= GetBagItemParam( sceneId, selfId, bagId, 3, 0 )
	osid	= GetBagItemParam( sceneId, selfId, bagId, 4, 1 )
	opx		= GetBagItemParam( sceneId, selfId, bagId, 6, 1 )
	opy		= GetBagItemParam( sceneId, selfId, bagId, 8, 1 )

	--若已记录过定位信息则传送，否则记录当前信息
	--同时可使用次数减1，当其值为0时删除该物品
	if opx > 0 and opy > 0 then
		if sceneId == osid then
			--同一场景传送
			SetPos( sceneId, selfId, opx, opy )
		else
			--楼兰<90级禁入--add by xindefeng
			if (osid == SCENE_LOULAN) and (GetLevel(sceneId, selfId) < x334846_g_LimitTransLevel) then
				local szMsg = format("楼兰需要%d级以上方可入内", x334846_g_LimitTransLevel)
				x334846_MsgBox( sceneId, selfId, szMsg )
				return x334846_g_Key["nul"]
			end
			--检测是否可以切换到目标场景
			if IsCanNewWorld( sceneId, selfId, osid, opx, opy ) ~= 1 then
				return x334846_g_Key["nul"]
			end
			--不同场景传送
			NewWorld( sceneId, selfId, osid, opx, opy )
		end
		SetBagItemParam( sceneId, selfId, bagId, 3, 0, (otim-1) )
		--记录统计信息
		LuaFnAuditGPS(sceneId, selfId, 0)

		--刷新Client端的背包物品信息
		LuaFnRefreshItemInfo( sceneId, selfId, bagId )
		return x334846_g_Key["bus"], (otim-1)
	end

	--记录定位信息	
	--判断当前场景是否可使用定位符
	if sceneId ~= SCENE_DALI and sceneId ~= SCENE_LUOYANG and sceneId ~= SCENE_SUZHOU and sceneId ~= SCENE_LOULAN then	--楼兰也是主城--modify by xindefeng
		x334846_MsgBox( sceneId, selfId, "除了苏州、洛阳、大理、楼兰外，不可在其他场景使用定位符！" )
		return x334846_g_Key["nul"]
	end	

	--获取玩家的当前坐标
	osid			= sceneId
	opx, opy	= LuaFnGetUnitPosition( sceneId, selfId )
	opx	= floor( opx )
	opy	= floor( opy )

	SetBagItemParam( sceneId, selfId, bagId, 0, 1, 10 )		--Key，这位标识操作集合，也是Client修正Tooltips的依据
	SetBagItemParam( sceneId, selfId, bagId, 2, 0, omax )	--最大使用次数
	SetBagItemParam( sceneId, selfId, bagId, 3, 0, omax )	--剩余使用次数
	SetBagItemParam( sceneId, selfId, bagId, 4, 1, osid )	--场景编号
	SetBagItemParam( sceneId, selfId, bagId, 6, 1, opx )	--X坐标
	SetBagItemParam( sceneId, selfId, bagId, 8, 1, opy )	--Y坐标
	--刷新Client端的背包物品信息
	LuaFnRefreshItemInfo( sceneId, selfId, bagId )
	--记录统计信息
	LuaFnAuditGPS(sceneId, selfId, 1)

	return x334846_g_Key["log"], omax
end

--**********************************
--信息提示
--**********************************
function x334846_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
