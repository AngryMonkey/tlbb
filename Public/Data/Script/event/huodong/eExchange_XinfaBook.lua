--活动——兑换心法、秘籍
--MisDescBegin
--脚本号
x808036_g_ScriptId = 808036
x808036_g_ExchangeXinfaBook_Active = 1

x808036_g_NeedItemCount_Miji = 7
x808036_g_NeedItemCount_Yaojue = 8
x808036_g_NeedItemID = 30505078
--MisDescEnd


--0少林 1明教 2丐帮 3武当 4峨嵋 5星宿 6大理 7天山 8消遥
--************************************
--取得奖励秘籍ID
--************************************
function x808036_GetAwardItemID_Miji( sceneId, selfId )
    local PlayerMenpai = GetMenPai( sceneId, selfId )
    local ItemID = -1;
    if 0 == PlayerMenpai then    --少林
        ItemID = 30308002
    end
    if 1 == PlayerMenpai then    --明教
        ItemID = 30308003
    end
    if 2 == PlayerMenpai then    --丐帮
        ItemID = 30308004
    end
    if 3 == PlayerMenpai then    --武当
        ItemID = 30308005
    end
    if 4 == PlayerMenpai then    --峨嵋
        ItemID = 30308006
    end
    if 5 == PlayerMenpai then    --星宿
        ItemID = 30308007
    end
    if 6 == PlayerMenpai then    --大理
        ItemID = 30308008
    end
    if 7 == PlayerMenpai then    --天山
        ItemID = 30308009
    end
    if 8 == PlayerMenpai then    --消遥
        ItemID = 30308010
    end

    return ItemID
end

--0少林 1明教 2丐帮 3武当 4峨嵋 5星宿 6大理 7天山 8消遥
--************************************
--取得奖励要诀ID
--************************************
function x808036_GetAwardItemID_Yaojue( sceneId, selfId )
    local PlayerMenpai = GetMenPai( sceneId, selfId )
    local ItemID = -1;
    if 0 == PlayerMenpai then    --少林
        ItemID = 30308011
    end
    if 1 == PlayerMenpai then    --明教
        ItemID = 30308012
    end
    if 2 == PlayerMenpai then    --丐帮
        ItemID = 30308013
    end
    if 3 == PlayerMenpai then    --武当
        ItemID = 30308014
    end
    if 4 == PlayerMenpai then    --峨嵋
        ItemID = 30308015
    end
    if 5 == PlayerMenpai then    --星宿
        ItemID = 30308016
    end
    if 6 == PlayerMenpai then    --大理
        ItemID = 30308017
    end
    if 7 == PlayerMenpai then    --天山
        ItemID = 30308018
    end
    if 8 == PlayerMenpai then    --消遥
        ItemID = 30308019
    end

    return ItemID
end


--**************************************
--设置变量,标记已经给予过秘籍或者要诀了
--**************************************
function x808036_SetExchangeCompleteFlag( sceneId, selfId )
    SetMissionData( sceneId, selfId, MD_EXCHANGE_MIJIORYAOJUE, 1 )
end
--********************************************
--取得是否已经给予过秘籍或者要诀了.0为没给予过
--********************************************
function x808036_GetExchangeCompleteFlag( sceneId, selfId )
    local CompleteFlag = GetMissionData( sceneId, selfId, MD_EXCHANGE_MIJIORYAOJUE ) --取出标志
    
    if CompleteFlag > 0 then
        return 1
    else
        return 0    
    end
    
end

--**********************************
--检测是否有足够的物品用来交换秘籍
--**********************************
function x808036_CheckEnoughItem_Miji( sceneId, selfId )
    local TianshuID = x808036_g_NeedItemID
    
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, TianshuID )
	if ItemCount < x808036_g_NeedItemCount_Miji then
		return 0
	end
    
    return 1
end
--**********************************
--检测是否有足够的物品用来交换要诀
--**********************************
function x808036_CheckEnoughItem_Yaojue( sceneId, selfId )
    local TianshuID = x808036_g_NeedItemID
    
	local ItemCount = LuaFnGetAvailableItemCount( sceneId, selfId, TianshuID )
	if ItemCount < x808036_g_NeedItemCount_Yaojue then
		return 0
	end

    return 1
end

--**********************************
--兑换秘籍和要诀
--**********************************
function x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, ItemDesc, AddAward )
    --ItemDesc 1为秘籍2为要诀
    local Item_Miji = 1
    local Item_Yaojue = 2
    
    local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )
    if 1 == CompleteFlag then
        local strDirText05 = "对不起，兑换秘籍和要诀的机会只有1次。"
		BeginEvent(sceneId)
			AddText( sceneId, strDirText05 )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		return    
    end
    
    local strDirText00 = ""
    if Item_Miji == ItemDesc then
        local CanExchange = x808036_CheckEnoughItem_Miji( sceneId, selfId )
		if 1 ~= CanExchange then
	        strDirText00 = "兑换秘籍需要7张天书残页，您的数量不足，请凑齐之后再来找我。"    
		end
    end
    
    if Item_Yaojue == ItemDesc then
        local CanExchange = x808036_CheckEnoughItem_Yaojue( sceneId, selfId )
		if 1 ~= CanExchange then
		    strDirText00 = "兑换要诀需要8张天书残页，您的数量不足，请凑齐之后再来找我。"
		end        
    end
    
    if "" ~= strDirText00 then
        BeginEvent(sceneId)
				AddText( sceneId, strDirText00 )
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
		return
    end
    
    
    local PlayerLevel = GetLevel( sceneId, selfId )
    if PlayerLevel < 30 then
		BeginEvent( sceneId )
		    local strDirText04 = "只有等级大于等于30级之后才可以使用天书残页来兑换秘籍和要诀"
		    AddText( sceneId, strDirText04 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return    
    end
    
	local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	if( FreeSpace < 1 ) then
		BeginEvent( sceneId )
		    local strDirText01 = "您的背包空间不足，无法得到奖励的物品，请整理背包之后再来找我。"
		    AddText( sceneId, strDirText01 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
		return
	end
	
	if 0 == AddAward then  --不真正给予物品,只是做一次检查
		BeginEvent(sceneId)
			local strDirText02 = "兑换秘籍心法的机会只有1次，也就是说，兑换了心法或者秘籍当中的任意一种之后不能再兑换另外一种。您确认兑换吗？"
			local strDirText03 = "确定"
	        
			AddText( sceneId, strDirText02 )
	        
			if Item_Yaojue == ItemDesc then
				AddNumText(sceneId, x808036_g_ScriptId, strDirText03, 1, 4 )
			end
			if Item_Miji == ItemDesc then
				AddNumText(sceneId, x808036_g_ScriptId, strDirText03, 1, 3 )
			end
	        
		EndEvent()
		DispatchEventList( sceneId, selfId, targetId )
    end
    
    if 1 == AddAward then   --此时会给予物品
		if Item_Yaojue == ItemDesc then
			x808036_SetAward_Yaojue( sceneId, selfId, targetId )
		end
		if Item_Miji == ItemDesc then
		    x808036_SetAward_Miji( sceneId, selfId, targetId )
		end    
    end
        
end

--**********************************
--兑换秘籍
--**********************************
function x808036_Exchange_Miji( sceneId, selfId, targetId )
    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 1, 0 )	
end

--**********************************
--兑换要诀
--**********************************
function x808036_Exchange_Yaojue( sceneId, selfId, targetId )
    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 2, 0 )
end


--**********************************
--给玩家要诀
--**********************************
function x808036_SetAward_Yaojue( sceneId, selfId, targetId )
	local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )

	if( CompleteFlag ~= 1 ) then    --标志为1为成功
		x808036_SetExchangeCompleteFlag( sceneId, selfId )
		local Ret = LuaFnDelAvailableItem(sceneId, selfId, x808036_g_NeedItemID, x808036_g_NeedItemCount_Yaojue )
	    
	    if Ret > 0 then      --删除数量和要求数量一致	        	      
			local AwardID = x808036_GetAwardItemID_Yaojue( sceneId, selfId )			    
			if -1 ~= AwardID then
				BeginAddItem(sceneId)        --给予玩家要诀
					AddItem( sceneId, AwardID, 1 )
				local Ret = EndAddItem(sceneId,selfId)
				if Ret > 0 then
					AddItemListToHuman(sceneId,selfId)
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local PlayerName = GetName( sceneId, selfId )
					local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					
					local SysStr = PlayerInfoName.."使用了"..(x808036_g_NeedItemCount_Yaojue).."张天书残页，在大理龚彩云（170，122）处成功的兑换到了"..ItemInfo.."一本。"
					BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
				end
				
			end
		end
		
	end
end

--**********************************
--给玩家秘籍
--**********************************
function x808036_SetAward_Miji( sceneId, selfId, targetId )
	local CompleteFlag = x808036_GetExchangeCompleteFlag( sceneId, selfId )

	if( CompleteFlag ~= 1 ) then    --标志为1为成功
		x808036_SetExchangeCompleteFlag( sceneId, selfId )
		local Ret = LuaFnDelAvailableItem(sceneId, selfId, x808036_g_NeedItemID, x808036_g_NeedItemCount_Miji )
	    
	    if Ret > 0 then      --删除数量和要求数量一致	        	      
			local AwardID = x808036_GetAwardItemID_Miji( sceneId, selfId )			    
			if -1 ~= AwardID then
				BeginAddItem(sceneId)        --给予玩家秘籍
					AddItem( sceneId, AwardID, 1 )
				local Ret = EndAddItem(sceneId,selfId)
				if Ret > 0 then
					AddItemListToHuman(sceneId,selfId)
					local szItemTransfer = GetItemTransfer(sceneId,selfId,0)
					local PlayerName = GetName( sceneId, selfId )
					local PlayerInfoName = "#{_INFOUSR"..PlayerName .."}"
					local ItemInfo = "#{_INFOMSG".. szItemTransfer .."}"
					
					local SysStr = PlayerInfoName.."使用了"..(x808036_g_NeedItemCount_Miji).."张天书残页，在大理龚彩云（170，122）处成功的兑换到了"..ItemInfo.."一本。"
					BroadMsgByChatPipe( sceneId, selfId, SysStr, 4 )
	
				end
				
				
			end
		end
		
	end
	    
end


--**********************************
--任务入口函数
--**********************************
function x808036_OnDefaultEvent( sceneId, selfId, targetId )
    
    x808036_CheckRightTime()
    
    if 1 ~= x808036_g_ExchangeXinfaBook_Active then    --没活动的时候就不执行(容错处理,正确流程不应调用到这里)
        return
    end
    
    local TextNum = GetNumText()
    if TextNum == 1 then        --点了兑换秘籍
        x808036_Exchange_Miji( sceneId, selfId, targetId )
    end
    
    if TextNum == 2 then        --点了兑换要诀
        x808036_Exchange_Yaojue( sceneId, selfId, targetId )
	end
	
	if TextNum == 3 then        --点了兑换秘籍 --确定	    
	    x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 1, 1 )
    end
    
    if TextNum == 4 then        --点了兑换要诀 --确定
        x808036_Exchange_MijiAndYaojue( sceneId, selfId, targetId, 2, 1 )
	end
	
    if TextNum == 5 then
        local strContex = "#{EXCHANGEXFMJ_HELP_001}"
        BeginEvent(sceneId)
            AddText( sceneId, strContex )
        EndEvent()
        DispatchEventList( sceneId, selfId, targetId )
	end
end

--**********************************
--检测是否正确的活动时间
--**********************************
function x808036_CheckRightTime()
    local DayTime = GetDayTime()
    
    if DayTime < 7107 then      --07年107天(4月18号)
       x808036_g_ExchangeXinfaBook_Active = 0
       return 0    --此前非活动时间
    end
    
    if DayTime >= 7123 then      --07年114天(5月4号)
       x808036_g_ExchangeXinfaBook_Active = 0
       return 0    --此后活动已经结束
    end
    
    x808036_g_ExchangeXinfaBook_Active = 1
    return 1
    
end

--**********************************
--列举事件
--**********************************
function x808036_OnEnumerate( sceneId, selfId, targetId )
    
    x808036_CheckRightTime()
    
    if 1 ~= x808036_g_ExchangeXinfaBook_Active then
        return
    end
    
    local strMiji = "兑换35级秘籍"
    local strYaojue = "兑换65级要诀"
    
    AddNumText(sceneId, x808036_g_ScriptId, strMiji, 1, 1 )
    AddNumText(sceneId, x808036_g_ScriptId, strYaojue, 1, 2 )
    
    AddNumText(sceneId, x808036_g_ScriptId, "关于兑换秘籍，要诀", 11, 5 )
    
end

--**********************************
--检测接受条件
--**********************************
function x808036_CheckAccept( sceneId, selfId )

end

--**********************************
--接受
--**********************************
function x808036_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x808036_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x808036_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x808036_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x808036_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--杀死怪物或玩家
--**********************************
function x808036_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--进入区域事件
--**********************************
function x808036_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x808036_OnItemChanged( sceneId, selfId, itemdataId )
end
