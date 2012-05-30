--道具：宝石福袋<ID:30504054>
--脚本号 889033
--Author:xiehong 2009-02-11

x889033_g_scriptId = 889033
x889033_g_ColorSockPrize = {
					30501169,
					30900006,
					30008034,
					30008048,
					30502002,
					50613001,
					50613002,
					50613004,
					50613003,
					50613005,
					50603001,
					50604002,
					50614001,
					50713001,
					50713002,
					50713004,
					50713003,
					50713005,
					50703001,
					50704002,
					50714001,
					30008006,
					30008007,
					10141115,
					20109009,
					20109010,
					20109101,
					30509025,
					30509021,
					30509024
              } 
                 
x889033_g_strGongGaoInfo = {
	"#G#{_ITEM30504054}#c00FFFF瞬间放出一股强大的气息，幸好#{_INFOUSR%s}#c00FFFF功力深厚稳住身形，惊愕的发现手中多了一个#{_INFOMSG%s}。",
	"#G#{_ITEM30504054}#c00FFFF瞬间放出一股强大的气息，幸好#{_INFOUSR%s}#c00FFFF功力深厚稳住身形，惊愕的发现手中多了一个#{_INFOMSG%s}。",
	"#G#{_ITEM30504054}#c00FFFF瞬间放出一股强大的气息，幸好#{_INFOUSR%s}#c00FFFF功力深厚稳住身形，惊愕的发现手中多了一个#{_INFOMSG%s}。",
}

--日志
x889033_g_AuditIndex = 29

--掉落表在程序里的序号
x889033_g_DropTableIndex = 24

--背包、材料必须预留的格子
x889033_g_BagPreCount = { 1, 1 }


--**********************************
--事件交互入口   
--**********************************
function x889033_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end              
                 
--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889033_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end              
                 
--**********************************
--直接取消效果： 
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889033_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end              
                 
--**********************************
--条件检测入口： 
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889033_OnConditionCheck( sceneId, selfId )
	--校验使用的物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x889033_g_BagPreCount[1] ) then 
		local strNotice = "背包空间不足。"
			x889033_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < x889033_g_BagPreCount[2] ) then 
		local strNotice = "材料栏空间不足。"
			x889033_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
			
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x889033_OnDeplete( sceneId, selfId )
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
function x889033_OnActivateOnce( sceneId, selfId )

	--数据统计：转蛋的使用，转蛋脚本序号减一
	LuaFnAuditZhuanDanUsed(sceneId, selfId, x889033_g_AuditIndex, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, x889033_g_DropTableIndex )
    if( RandomBase > 0 ) then
    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, x889033_g_DropTableIndex )
        local PrizeNum = 1
        if (RandomID == x889033_g_ColorSockPrize[1]) then
			PrizeNum = 10
        elseif  (RandomID ==x889033_g_ColorSockPrize[2] or RandomID ==x889033_g_ColorSockPrize[29] or RandomID ==x889033_g_ColorSockPrize[30]) then
			PrizeNum = 2
        elseif  (RandomID ==x889033_g_ColorSockPrize[5]) then
			PrizeNum = 5
        else
			PrizeNum = 1
        end
        
        if( RandomID > 0 ) then
			BeginAddItem(sceneId)
			AddItem( sceneId, RandomID, PrizeNum )
			local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
			if Ret > 0 then
				LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
				if 1 == Notice then
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					x889033_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
				end
				      
				local ItemName = GetItemName(sceneId, RandomID)
				local strNotice = "您得到了"..ItemName
				x889033_ShowNotice( sceneId, selfId, strNotice)
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
			else
				local strNotice = "背包空间不足"
				x889033_ShowNotice( sceneId, selfId, strNotice)
			end
        end
    end
    
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x889033_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889033_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889033_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889033_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889033_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889033_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
