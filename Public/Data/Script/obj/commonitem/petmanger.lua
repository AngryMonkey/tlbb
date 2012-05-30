--petmanger.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本
--兽栏
--脚本号
x335805_g_ScriptId	= 335805

--效果的ID
x335805_g_Impact		= -1	--使用一个特定的特效编号

--应用单元
x335805_g_UseMax		= 4
x335805_g_UseUnit		=
{
	[30509500]				= 1,	--兽栏1级
	[30509501]				= 2,	--兽栏2级
	[30509502]				= 3,	--兽栏3级
	[30509503]				= 4,	--兽栏4级
}

--**********************************
--事件交互入口
--**********************************
function x335805_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x335805_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x335805_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x335805_OnConditionCheck( sceneId, selfId )
	--背包中的位置
	local	bagId			= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	numExtra	= x335805_g_UseUnit[ GetItemTableIndexByIndex( sceneId, selfId, bagId ) ]
	if numExtra == nil then
		return 0
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x335805_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return 0
	end

	--校验使用的物品
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end

	--判断玩家现在使用兽栏的情况
	if GetPetNumExtra( sceneId, selfId ) >= x335805_g_UseMax then
		x335805_MsgBox( sceneId, selfId, "宠物的携带空间已达上限，不能再增加新的空间。" )
		return 0
	end
	
	--modify by xindefeng
	--modify by dun.liu 2008-04-11
	local curShouLanLevel = GetPetNumExtra( sceneId, selfId )
	if curShouLanLevel ~= (numExtra - 1) then
		local szMsg = format("您当前兽栏已为%d级，如果想要增加宠物携带数量，请使用第%d级兽栏。", curShouLanLevel, curShouLanLevel+1)
		x335805_MsgBox( sceneId, selfId, szMsg)
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
function x335805_OnDeplete( sceneId, selfId )
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
function x335805_OnActivateOnce( sceneId, selfId )
	if( -1 ~= x335805_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x335805_g_Impact, 0 )
	end

	local	nBagIndex	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	local	numExtra	= x335805_g_UseUnit[ GetItemTableIndexByIndex( sceneId, selfId, nBagIndex ) ]
	local	szTran		= GetBagItemTransfer( sceneId, selfId, nBagIndex )
	if numExtra ~= nil and EraseItem( sceneId, selfId, nBagIndex ) == 1 then
		if SetPetNumExtra( sceneId, selfId, numExtra ) == 1 then
			if numExtra == 1 then	--modify by xindefeng
				x335805_MsgBox( sceneId, selfId, "您的宠物携带空间增加到"..GetPetNumMax(sceneId, selfId).."，如果想要再次增加宠物的携带空间请使用更高级的兽栏。" )	--modify by xindefeng
				strMsg = format("#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，#H显着改善了宠物们的住宿条件，#H可携带宠物的数量达到了#W%d#H个。", LuaFnGetName(sceneId, selfId), szTran, GetPetNumMax(sceneId, selfId))
			elseif numExtra == 2 then
				x335805_MsgBox( sceneId, selfId, "您的宠物携带空间增加到"..GetPetNumMax(sceneId, selfId).."，如果想要再次增加宠物的携带空间请使用更高级的兽栏。" )	--modify by xindefeng
				strMsg = format("#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，#H终于成功建成复式宠物屋，#H可携带宠物的数量达到了#W%d#H个。", LuaFnGetName(sceneId, selfId), szTran, GetPetNumMax(sceneId, selfId))
			elseif numExtra == 3 then
				x335805_MsgBox( sceneId, selfId, "您的宠物携带空间增加到"..GetPetNumMax(sceneId, selfId).."，如果想要再次增加宠物的携带空间请使用更高级的兽栏。" )	--modify by xindefeng
				strMsg = format("#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，#H宠物别墅成功落成，#H其可携带宠物的数量达到了#W%d#H个。", LuaFnGetName(sceneId, selfId), szTran, GetPetNumMax(sceneId, selfId))
			elseif numExtra == 4 then
				x335805_MsgBox( sceneId, selfId, "您的宠物携带空间增加到"..GetPetNumMax(sceneId, selfId).."，兽栏数量已经达到上限。" )	--modify by xindefeng
				strMsg = format("#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，#H终于完成了宠物圈地运动，#H可携带宠物的数量达到了#W%d#H个。", LuaFnGetName(sceneId, selfId), szTran, GetPetNumMax(sceneId, selfId))
			end
			AddGlobalCountNews( sceneId, strMsg )	--发系统公告
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
function x335805_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end

--**********************************
--信息提示
--**********************************
function x335805_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
