--活动——
--AMD
--MisDescBegin
--脚本号
x808059_g_ScriptId = 808059
x808059_g_ExchangeAMD_Active = 0   --默认关闭

x808059_g_ActiveStartTime = 7154  --7000   --7154
x808059_g_ActiveEndTime = 7192    --7200     --7192

x808059_g_AwardItem1 = 30505104  --奖品1,双核速龙令
x808059_g_AwardItem2 = 30505105  --奖品2,双核速龙丹

x808059_g_AMDTextList = { 30505093, 30505094, 30505095, 30505096, 30505097, 30505098, 30505099, 30505100, 30505101, 30505102, 30505103 }

x808059_g_HelpText000 = "#{EXCHANGE_AMD_HELP000}" --"我想兑换AMD双核速龙令"
x808059_g_HelpText001 = "#{EXCHANGE_AMD_HELP001}" --"兑换AMD双核速龙令需要我、为、双、核、狂、AMD、天、龙、争、霸、赛各一个，您身上的物品不全，请核对好之后再来找我"
x808059_g_HelpText002 = "#{EXCHANGE_AMD_HELP002}" --"我想兑换AMD双核速龙令"
x808059_g_HelpText003 = "#{EXCHANGE_AMD_HELP003}" --"物品栏空间不足，请整理物品栏后再试。"

x808059_g_HelpText004 = "#{EXCHANGE_AMD_HELP004}" --"在筹备AMD天龙争霸赛活动中，"
x808059_g_HelpText005 = "#{EXCHANGE_AMD_HELP005}" --"凑齐了我、为、双、核、狂、AMD、天、龙、争、霸、赛各一个，属实难得，特赠送"
x808059_g_HelpText006 = "#{EXCHANGE_AMD_HELP006}" --"一份，持有此物即可参加稍后的抽奖活动，同时附送"
x808059_g_HelpText007 = "#{EXCHANGE_AMD_HELP007}" --"2个，还没兑奖的玩家赶快行动呀！"

x808059_g_HelpText008 = "#{EXCHANGE_AMD_HELP008}" --"对不起，现在没有正在举行的活动。"
x808059_g_HelpText009 = "#{EXCHANGE_AMD_HELP009}" --"关于兑换AMD双核速龙令"
x808059_g_HelpText010 = "#{EXCHANGE_AMD_HELP010}" --"关于兑换AMD双核速龙令相关介绍"

--MisDescEnd

--**********************************
--检测是否有足够的物品用来交换
--**********************************
function x808059_CheckEnoughItem( sceneId, selfId )
    for i=1, 11 do
		local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, x808059_g_AMDTextList[ i ] )
		if ItemCount < 1 then
		    return 0
		end
	end
    
    return 1
end

--**********************************
--兑换天龙八部
--**********************************
function x808059_ExchangeAMD( sceneId, selfId, targetId )

    x808059_CheckRightTime()
    if 1 ~= x808059_g_ExchangeAMD_Active then	
		return       
    end
    
	local bEnough = x808059_CheckEnoughItem( sceneId, selfId )
	if( 1 ~= bEnough ) then
		BeginEvent(sceneId)
			AddText( sceneId, x808059_g_HelpText001 )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )   --提示东西不足
		return
	end
	
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 2 ) then
		BeginEvent( sceneId )
		    AddText( sceneId, x808059_g_HelpText003 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )   --提示背包不足
		
		return
	end

	--扣除物品,假如扣除失败,将不会给予物品
    for i=1, 11 do
		ret = LuaFnDelAvailableItem(sceneId, selfId, x808059_g_AMDTextList[ i ], 1)
		if ret ~= 1 then
			return   --假如删除操作有任何一个物品失败,则中断操作,不会给予玩家任何物品
		end
	end
	
	BeginAddItem(sceneId)        --给予玩家物品
		AddItem( sceneId, x808059_g_AwardItem1, 1 )
	local Ret = EndAddItem(sceneId,selfId)
	
	if Ret > 0 then
	    AddItemListToHuman(sceneId,selfId)
		local szItemTransfer1 = GetItemTransfer(sceneId,selfId,0)
		local PlayerName = GetName( sceneId, selfId )
		local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
		local ItemInfo1 = "#{_INFOMSG".. szItemTransfer1 .."}"
		
		local szItemTransfer2 = ""
		local ItemInfo2 = ""
		
			BeginAddItem(sceneId)        --给予玩家物品
				AddItem( sceneId, x808059_g_AwardItem2, 2 )
			local Ret = EndAddItem(sceneId,selfId)
			
			if Ret > 0 then
			    AddItemListToHuman(sceneId,selfId)
			    szItemTransfer2 = GetItemTransfer(sceneId,selfId,0)
			    ItemInfo2 = "#{_INFOMSG".. szItemTransfer2 .."}"
			end
		
		
		local SysStr = x808059_g_HelpText004..PlayerInfoName..x808059_g_HelpText005..ItemInfo1..x808059_g_HelpText006..ItemInfo2..x808059_g_HelpText007
		BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	end
	--关闭界面
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )
				
end

--**********************************
--任务入口函数
--**********************************
function x808059_OnDefaultEvent( sceneId, selfId, targetId )
    x808059_CheckRightTime()
    if 1 ~= x808059_g_ExchangeAMD_Active then
        return
    end

    local TextNum = GetNumText()

    if TextNum == 1 then
        x808059_ExchangeAMD( sceneId, selfId, targetId )
	end
    
    if TextNum == 2 then
        BeginEvent(sceneId)
            AddText( sceneId, x808059_g_HelpText010 )
        EndEvent()
        DispatchEventList( sceneId, selfId, targetId )
	end
		    
end


--**********************************
--列举事件
--**********************************
function x808059_CheckRightTime()
    local DayTime = GetDayTime()
 
    if DayTime < x808059_g_ActiveStartTime then
       x808059_g_ExchangeAMD_Active = 0
       return 0    --此前非活动时间
    end
    
    if DayTime > x808059_g_ActiveEndTime then
       x808059_g_ExchangeAMD_Active = 0
       return 0    --此后活动已经结束
    end
    
    x808059_g_ExchangeAMD_Active = 1
    return 1
    
end

--**********************************
--列举事件
--**********************************
function x808059_OnEnumerate( sceneId, selfId, targetId )
    x808059_CheckRightTime()
    
    if 1 == x808059_g_ExchangeAMD_Active then
		AddNumText(sceneId, x808059_g_ScriptId, x808059_g_HelpText000, 1, 1 )
		--AddNumText(sceneId, x808059_g_ScriptId, x808059_g_HelpText009, 11, 2 )
    end
    
end

--**********************************
--检测接受条件
--**********************************
function x808059_CheckAccept( sceneId, selfId )

end

--**********************************
--接受
--**********************************
function x808059_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808059_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808059_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808059_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808059_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808059_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x808059_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808059_OnItemChanged( sceneId, selfId, itemdataId )
end
