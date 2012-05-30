--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


--Public\Data\Script\obj\commonitem\speaker.lua
------------------------------------------------------------------------------------------
--一般物品的默认脚本
--小喇叭
--脚本号
x330003_g_ScriptId	= 330003

--效果的ID
x330003_g_Impact		= -1	--使用一个特定的特效编号

--返回值处理集
x330003_g_WGCResult	=
{
	["SUC_SEND"]			= 36,		--小喇叭发送成功
	["FAL_SEND"]			= 37,		--小喇叭发送失败：未知
	["FAL_FULL"]			= 38,		--小喇叭发送失败：消息池已满
}


x330003_g_itemTabIdxList = { 30505107, 30505219 }

--**********************************
--事件交互入口
--**********************************
function x330003_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x330003_IsSkillLikeScript( sceneId, selfId )
	return 1	 --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x330003_CancelImpacts( sceneId, selfId )
	return 0	 --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x330003_OnConditionCheck( sceneId, selfId )

	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end

	--检测物品是否加锁
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x330003_MsgBox( sceneId, selfId, "此物品已被锁定！" )
		return 0
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
function x330003_OnDeplete( sceneId, selfId )
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
function x330003_OnActivateOnce( sceneId, selfId )

	if( -1 ~= x330003_g_Impact ) then
		LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x330003_g_Impact, 0 )
	end
	
	--背包中的位置
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--呼叫发送界面
	BeginUICommand( sceneId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 5422 )
	return 1

end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x330003_OnActivateEachTick( sceneId, selfId )
	return 1	 --不是引导性脚本, 只保留空函数。
end

--**********************************
--C++回调接口，严禁Client呼叫：
--小喇叭发布前检查
--**********************************
function x330003_CallBackSpeakerBefore( sceneId, selfId )

	--获取物品ID
	local ItemIndex = 0
	if LuaFnGetAvailableItemCount( sceneId, selfId, x330003_g_itemTabIdxList[2] ) > 0 then
		ItemIndex = x330003_g_itemTabIdxList[2]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[2] )		
	else
		ItemIndex = x330003_g_itemTabIdxList[1]
		SetMissionData( sceneId, selfId, MD_SPEAKER_STATE, x330003_g_itemTabIdxList[1] )
	end
			
	local	itmId	= ItemIndex;
	if itmId <= 0 then
		x330003_MsgBox( sceneId, selfId, "您的广播频率过快！" )
		return 0
	end
	if LuaFnDelAvailableItem( sceneId, selfId, itmId, 1 ) == 0 then
		x330003_MsgBox( sceneId, selfId, "没有此物品、此物品无法使用或被加锁！" )
		return 0
	end

	return 1
end

--**********************************
--C++回调接口，严禁Client呼叫：
--小喇叭发布后返回
--**********************************
function x330003_CallBackSpeakerAfter( sceneId, selfId, retType, retParam )

	--获取物品ID
	local ItemIndex = GetMissionData( sceneId, selfId, MD_SPEAKER_STATE )

	local ItemId = 0
	for i, ItemTabIdx in x330003_g_itemTabIdxList do
		if ItemIndex == ItemTabIdx then
			ItemId = ItemIndex
			break
		end
	end
	local	itmId	= ItemId;
	if itmId <= 0 then
		return 0
	end

	if retType == x330003_g_WGCResult["SUC_SEND"] then
		if retParam > 0 then
			nMin		= floor( retParam / 60 )
			nSec		= mod( retParam, 60 )
			szTim		= nil
			if nMin > 0 then
				szTim	= nMin.."分钟"..nSec.."秒"
			else
				szTim	= nSec.."秒"
			end
			x330003_MsgBox( sceneId, selfId, "小喇叭发送成功，您大约需要等待"..szTim.."。" )
		else
			x330003_MsgBox( sceneId, selfId, "小喇叭发送成功。" )
		end
	elseif retType == x330003_g_WGCResult["FAL_SEND"] then
		x330003_MsgBox( sceneId, selfId, "小喇叭发送失败！" )
	elseif retType == x330003_g_WGCResult["FAL_FULL"] then
		x330003_MsgBox( sceneId, selfId, "小喇叭消息池已满，请30秒钟后再试！" )
		TryRecieveItem( sceneId, selfId, itmId, QUALITY_CREATE_DEFAULT )
	end

	return 1
end

--**********************************
--信息提示
--**********************************
function x330003_MsgBox( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
