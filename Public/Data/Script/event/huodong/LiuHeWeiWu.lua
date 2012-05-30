-- 六合威武 20090512
-- 谢鉷

x889058_g_ScriptId = 889058;


-- 需求物品ID
x889058_g_NeedItemID		= {
													30504101,		-- 六合令牌(东)
													30504102,		-- 六合令牌(北)
													30504103,		-- 六合令牌(西)
													30504104,		-- 六合令牌(南)
													30504105,		-- 六合令牌(上)
													30504106,		-- 六合令牌(下)
													}

-- 奖励相关
x889058_g_AwradInfo		=	{
	{ItemId = 10422016, LackItemMsg = "#{LHZD_090513_03}", RetDlg = "#{LHZD_090513_04}", Notice = "#{LHZD_090513_05}", BagFullDlg = "#{LHZD_090513_06}"},	-- 重楼戒
--	{ItemId = 10423024, LackItemMsg = "#{LHZD_090513_07}", RetDlg = "#{LHZD_090513_08}", Notice = "#{LHZD_090513_09}", BagFullDlg = "#{LHZD_090513_17}"}	-- 重楼玉
}


--**********************************
--列举事件
--**********************************
function x889058_OnEnumerate( sceneId, selfId, targetId )
	
	AddNumText( sceneId, x889058_g_ScriptId, "#{LHZD_090513_13}", 6, 10 )					-- 按钮： 六合威武
	AddNumText( sceneId, x889058_g_ScriptId, "#{LHZD_090513_14}", 11, 11 )				-- 按钮： 六合威武介绍
	
end

--**********************************
--任务入口函数
--**********************************
function x889058_OnDefaultEvent( sceneId, selfId, targetId )

	local nNumText = GetNumText( )
	
	if( nNumText == 10 ) then
		-- 点击 六合威武
		-- BeginEvent( sceneId )
		-- AddText( sceneId, "#{LHZD_090513_01}#r" )
		-- for i, item in x889058_g_AwradInfo do
		-- 	AddRadioItemBonus( sceneId, item.ItemId, 1 )
		-- end
		-- EndEvent(sceneId)
		-- DispatchEventList( sceneId, selfId, targetId )
		-- DispatchMissionContinueInfo( sceneId, selfId, targetId, x889058_g_ScriptId, 0 )
		x889058_GiveGift( sceneId, selfId, targetId, 10422016 )
	elseif( nNumText == 11 ) then
		-- 点击 六合威武介绍
		BeginEvent( sceneId )	
			AddText( sceneId, "#{LHZD_090513_12}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		
	end
		
end


--**********************************
--返回对话
--**********************************
function x889058_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889058_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--接受
--**********************************
function x889058_OnAccept( sceneId, selfId )
	
end

--**********************************
--放弃
--**********************************
function x889058_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889058_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889058_CheckSubmit( sceneId, selfId )
	

	
end

--**********************************
--提交
--**********************************
function x889058_GiveGift( sceneId, selfId, targetId, selectRadioId )
	
	
	local LackItemMsg, RetDlg, Notice, BagFullDlg

	for i, ItemInfo in x889058_g_AwradInfo do
		if( ItemInfo.ItemId == selectRadioId ) then
			LackItemMsg		= ItemInfo.LackItemMsg
			RetDlg 				= ItemInfo.RetDlg
			Notice 				= ItemInfo.Notice
			BagFullDlg		= ItemInfo.BagFullDlg
			break
		end
	end
	
	-- 判断物品是否够
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnGetAvailableItemCount( sceneId, selfId, itemId ) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- 扣物品
	for i, itemId in x889058_g_NeedItemID do
		if( LuaFnDelAvailableItem( sceneId, selfId, itemId, 1) < 1 ) then
			x889058_ReturnDlg( sceneId, selfId, targetId, LackItemMsg )
			return
		end
	end
	
	-- 检查背包空间
	BeginAddItem(sceneId)
	AddItem(sceneId, selectRadioId, 1)
	local bBagOk = LuaFnEndAddItemIgnoreFatigueState(sceneId, selfId)
	if bBagOk < 1 then
		x889058_ReturnDlg( sceneId, selfId, targetId, BagFullDlg )
		return
	else
		-- 添加物品
		LuaFnAddItemListToHumanIgnoreFatigueState( sceneId, selfId )
		
		-- 通知
		x889058_Tips( sceneId, selfId, Notice )
		x889058_ReturnDlg( sceneId, selfId, targetId, RetDlg )
		
		-- 公告
		local playerName = GetName(sceneId,selfId)
		local itemTransInfo = GetItemTransfer( sceneId, selfId, 0 )
		broadcastMsg	=	"#{_INFOUSR"..playerName.."}".."#{LHZD_090513_10}".."#{_INFOMSG"..itemTransInfo.."}".."#{LHZD_090513_11}"
	end
	
	BroadMsgByChatPipe( sceneId, selfId, broadcastMsg, 4 )
end
	

--**********************************
--杀死怪物或玩家
--**********************************
function x889058_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x889058_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889058_OnItemChanged( sceneId, selfId, itemdataId )
end

