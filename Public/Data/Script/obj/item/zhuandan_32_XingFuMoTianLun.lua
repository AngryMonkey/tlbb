--道具：幸福摩天轮<ID:>
--脚本号 889041
--Author:xiehong 2009-03-18

x889041_g_scriptId = 889041

x889041_g_ColorSockPrize = {
					10124104,
					50213006,
					50201001,
					50201002,
					50202001,
					50202002,
					50202003,
					50202004,
					50203001,
					50204002,
					50211001,
					50211002,
					50212001,
					50212002,
					50212003,
					50212004,
					50213001,
					50213002,
					50213003,
					50213004,
					50213005,
					50214001,
					30900015,
					30900006,
					30008003,
					30504037,					
              } 

x889041_g_strGongGaoInfo = {
	"#G#{_INFOUSR%s}#c00FFFF手中的#G#{_ITEM30504072}#c00FFFF好像受到了召唤，突然涌出令人战栗的王者气息，一件#G#{_INFOMSG%s}#c00FFFF突然出现在手中。",
	"#G#{_INFOUSR%s}#c00FFFF手中的#G#{_ITEM30504072}#c00FFFF好像受到了召唤，突然涌出令人战栗的王者气息，一件#G#{_INFOMSG%s}#c00FFFF突然出现在手中。",
	"#G#{_INFOUSR%s}#c00FFFF手中的#G#{_ITEM30504072}#c00FFFF好像受到了召唤，突然涌出令人战栗的王者气息，一件#G#{_INFOMSG%s}#c00FFFF突然出现在手中。",
}

--日志
x889041_g_AuditIndex = 31

--掉落表在程序里的序号
x889041_g_DropTableIndex = 26

--背包、材料必须预留的格子
x889041_g_BagPreCount = { 2, 2 }


--**********************************
--事件交互入口   
--**********************************
function x889041_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end              
                 
--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x889041_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end              
                 
--**********************************
--直接取消效果： 
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x889041_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end              
                 
--**********************************
--条件检测入口： 
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x889041_OnConditionCheck( sceneId, selfId )
	--校验使用的物
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < x889041_g_BagPreCount[1] ) then 
		local strNotice = "背包空间不足。"
			x889041_ShowNotice( sceneId, selfId, strNotice)
		return 0
	end
	
	FreeSpace = LuaFnGetMaterialBagSpace( sceneId, selfId )
	if( FreeSpace < x889041_g_BagPreCount[2] ) then 
		local strNotice = "材料栏空间不足。"
			x889041_ShowNotice( sceneId, selfId, strNotice)
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
function x889041_OnDeplete( sceneId, selfId )
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
function x889041_OnActivateOnce( sceneId, selfId )

	--数据统计：转蛋的使用，转蛋脚本序号减一
	LuaFnAuditZhuanDanUsed(sceneId, selfId, x889041_g_AuditIndex, 0)
		
    local RandomBase = GetZhuanDanItemDropCount( sceneId, selfId, x889041_g_DropTableIndex )
    
    if( RandomBase > 0 ) then
    
        local RandomNum = random( 0, RandomBase - 1 )
        local RandomID, Notice = ZhuanDanItemDropRandom( sceneId, selfId, RandomNum, x889041_g_DropTableIndex )
        local PrizeNum = 1
        if (RandomID == x889041_g_ColorSockPrize[26]) then
			PrizeNum = 5
        elseif  (RandomID ==x889041_g_ColorSockPrize[1] or RandomID ==x889041_g_ColorSockPrize[23] or RandomID ==x889041_g_ColorSockPrize[25]) then
			PrizeNum = 1
        else
			PrizeNum = 2
        end
        
        if( RandomID > 0 ) then
			
			if RandomID == x889041_g_ColorSockPrize[1] then
				
				BeginAddItem(sceneId)
				AddItem( sceneId, RandomID, PrizeNum )
				local Ret = LuaFnEndAddItemIgnoreFatigueState( sceneId, selfId )
				if Ret > 0 then
					LuaFnAddItemListToHumanIgnoreFatigueState(sceneId,selfId)
					if 1 == Notice then
						local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
						x889041_ShowRandomSystemNotice( sceneId, selfId, szItemTransfer )
					end
				end
				
			else
				for i = 1, PrizeNum do
					local bagpos = TryRecieveItem( sceneId, selfId, RandomID, QUALITY_MUST_BE_CHANGE )
					LuaFnItemBind( sceneId, selfId, bagpos )					
				end
			end
			
			local ItemName = GetItemName(sceneId, RandomID)
			local strNotice = "您得到了"..ItemName
			x889041_ShowNotice( sceneId, selfId, strNotice)
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
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
function x889041_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

function x889041_ShowNotice( sceneId, selfId, strNotice)
	BeginEvent( sceneId )
		AddText( sceneId, strNotice )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )    
end

function x889041_ShowRandomSystemNotice( sceneId, selfId, strItemInfo )
	
	local PlayerName = GetName(sceneId,selfId)
	local nMsgIndex = random( 1, 3 )
	local str
	if nMsgIndex == 1 then
		str = format( x889041_g_strGongGaoInfo[1], PlayerName, strItemInfo)
	elseif nMsgIndex == 2 then
		str = format( x889041_g_strGongGaoInfo[2], PlayerName, strItemInfo )
	else
		str = format( x889041_g_strGongGaoInfo[3], PlayerName, strItemInfo)
	end
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	
end
