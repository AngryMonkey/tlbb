--活动——
--圣诞节元旦活动-收集门派道具换奖励

--脚本号
x050026_g_ScriptId = 050026



x050026_g_HeKaId = {
	                 20310011,
	                 20310017,
	                 20310012,
	                 20310019,
	                 20310014,
	                 20310018,
	                 20310015,
	                 20310016,
	                 20310013,	
}			                                   --贺卡ID

x050026_g_GiftId = {
                   30501127,	--易容丹：糖果盒*1
                   30501126,	--易容丹：大铃铛*1
                   30501125,	--易容丹：圣诞树*1
                   30505146,	--幸福雪球*10
                   10141101,	--5格材料包（圣诞袜外型）
                   10141100,	--5格物品包（圣诞老人口袋外型）
                   10141105,	--坐骑：鸵鸟
                   10141106,	--坐骑：木牛流马
                   10141107,	--坐骑：熊
                   10141108,	--坐骑：兔子
                   10141109,	--坐骑：陆吾
                   10141110,	--坐骑：大象
                   10410108,  --圣诞帽(无属性时装)
                   10410098,  --欢乐圣诞帽（装备绑定）
                   10410099,  --欢乐圣诞帽（装备绑定）
                   10410100,  --欢乐圣诞帽（装备绑定）
                   10410101,  --欢乐圣诞帽（装备绑定）
                   10410102,  --欢乐圣诞帽（装备绑定）
                   10410103,  --欢乐圣诞帽（装备绑定）
                   10410104,  --欢乐圣诞帽（装备绑定）
                   10410105,  --欢乐圣诞帽（装备绑定）
                   10410106,  --欢乐圣诞帽（装备绑定）
                   10410107,  --欢乐圣诞帽（装备绑定）
}			                                   --奖品ID

--**********************************
--任务入口函数
--**********************************
function x050026_OnDefaultEvent( sceneId, selfId, targetId )

	local isTime = x050026_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	local NumText = GetNumText()


	if NumText == 111 then
	  BeginEvent(sceneId)
			AddText(sceneId, "#{CHRISTMAS_LUOYANG_HTJS_2}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 112 then
	  BeginEvent(sceneId)
	    local nGetgiftcount = x050026_GetGiftCount(sceneId, selfId) + 1
	    local str
	    if nGetgiftcount > 6 then
	       str = "#{SDYD_081007_010}"
	       AddText(sceneId, str);
	    else
	       str = format("#{SDYD_081007_021}%d#{SDYD_081007_022}", nGetgiftcount);
	       AddText(sceneId, str);
	       AddNumText(sceneId, x050026_g_ScriptId,"确定", 8, 113);
				AddNumText(sceneId, x050026_g_ScriptId,"取消", 8, 114);
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif NumText == 113 then
	  x050026_GivePlayerGift( sceneId, selfId, targetId )	
	elseif NumText == 114 then
	  -- 关闭窗口
	  BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
	end
	
end

--**********************************
--列举事件
--**********************************
function x050026_OnEnumerate( sceneId, selfId, targetId )
  
  --检测时间是否正确
	local isTime = x050026_CheckRightTime()
	if 1 ~= isTime then
		return
	end

	AddNumText(sceneId, x050026_g_ScriptId, "节日贺贴兑换礼品", 6, 112 )	
	AddNumText(sceneId, x050026_g_ScriptId, "节日贺贴兑换礼品介绍", 11, 111 )												
end

--**********************************
--检测活动时间是否正确
--**********************************
function x050026_CheckRightTime( sceneId )
	  
	local today = GetDayTime()						--当前时间
		local firstDay = 8357								-- 2008年 12 月 23 日
		local lastDay = 9007								-- 2009年 1  月 8  日
	  
	-- 12 月 31 日 0 时 ~ 1 月 7 日 24 时
	if today <= firstDay or today >= lastDay then
		return 0
	end

	return 1

end

--**********************************
--给玩家新年贺帖
--**********************************
function x050026_GivePlayerGift( sceneId, selfId, targetId )

	--关闭对话窗口....
	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )

	--如果玩家等级小于25不予换取贺卡
	if	GetLevel( sceneId, selfId) < 25 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_008}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	--否有1个新年符节....
	local ShaoLinHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[1])
	local MingJiaoHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[2])
	local GaiBangHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[3])
	local WuDangHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[4])
	local EMeiHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[5])
	local XingSuHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[6])
	local DaLiHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[7])
	local TianShanHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[8])
  local XiaoYaoHeKaCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050026_g_HeKaId[9])

  local result = 1
  if ShaoLinHeKaCount < 1 then
    result = 0
  elseif MingJiaoHeKaCount < 1 then
    result = 0
  elseif GaiBangHeKaCount < 1 then
    result = 0
  elseif WuDangHeKaCount < 1 then
    result = 0
  elseif EMeiHeKaCount < 1 then
    result = 0
  elseif XingSuHeKaCount < 1 then
    result = 0
  elseif DaLiHeKaCount < 1 then
    result = 0
  elseif TianShanHeKaCount < 1 then
    result = 0
  elseif XiaoYaoHeKaCount < 1 then
    result = 0
  end    
    
  if result == 0 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_009}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end
	
	local td = GetDayTime()
	local LastGetGiftTime = GetMissionData(sceneId,selfId,MD_GETGIFT_TIME)
	if (td<LastGetGiftTime) then
		return
	end
	if td > LastGetGiftTime then
	    SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, 0 )
	    SetMissionData( sceneId, selfId, MD_GETGIFT_TIME, td )
	end
	
	local nGetGiftCount = GetMissionData(sceneId,selfId,MD_GETGIFT_COUNT)
	
	if nGetGiftCount >= 6 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_010}" )
		EndEvent(sceneId)
		DispatchMissionTips( sceneId, selfId )
		return
	end	
	
	--检测背包是否有地方....
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SDYD_081007_011}" )
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	--是否删除失败....
	for i, v in x050026_g_HeKaId do
	  if LuaFnDelAvailableItem(sceneId, selfId, v, 1) == 0 then
			 BeginEvent(sceneId)
			 AddText( sceneId, "#{SDYD_081007_009}" )
		   EndEvent(sceneId)
		   DispatchMissionTips( sceneId, selfId )
		   return
		 end
	 end
	    
	    
	local odds = random(1,1000)
	local GiftId = 0   --礼物ID
	local GiftNum = 0  --礼物数量
	local strtext

	--随机发放礼物
	  if( odds >= 1 and odds <= 81 ) then       --81
	    GiftId = x050026_g_GiftId[1]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物易容丹：糖果盒，祝您游戏愉快！"
	  elseif( odds >= 82 and odds <= 162 ) then          --81
	    GiftId = x050026_g_GiftId[2]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物易容丹：大铃铛，祝您游戏愉快！"
	  elseif( odds >= 163 and odds <= 281 ) then                  --119
	    GiftId = x050026_g_GiftId[3]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物易容丹：圣诞树，祝您游戏愉快！"
	  elseif( odds >= 282 and odds <= 371 ) then                  --90
	    GiftId = x050026_g_GiftId[4]
	    GiftNum = 10
	    strtext = "恭喜您获得礼物幸福雪球，祝您游戏愉快！"
	  elseif( odds >= 372 and odds <= 450 ) then                 --79
	    GiftId = x050026_g_GiftId[5]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物5格材料包（圣诞袜外型），祝您游戏愉快！"
	  elseif( odds >= 451 and odds <= 529 ) then                 --79
	    GiftId = x050026_g_GiftId[6]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物5格物品包（圣诞老人口袋外型），祝您游戏愉快！"
	  elseif( odds >= 530 and odds <= 553 ) then                 --24
	    GiftId = x050026_g_GiftId[7]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：鸵鸟，祝您游戏愉快！"
	  elseif( odds >= 554 and odds <= 577 ) then                 --24
	    GiftId = x050026_g_GiftId[8]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：木牛流马，祝您游戏愉快！"
	  elseif( odds >= 578 and odds <= 601 ) then                 --24
	    GiftId = x050026_g_GiftId[9]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：熊，祝您游戏愉快！"
	  elseif( odds >= 602 and odds <= 625 ) then                 --24
	    GiftId = x050026_g_GiftId[10]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：兔子，祝您游戏愉快！"
	  elseif( odds >= 626 and odds <= 636 ) then                 --11
	    GiftId = x050026_g_GiftId[11]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：陆吾，祝您游戏愉快！"
	  elseif( odds >= 637 and odds <= 647 ) then                 --11
	    GiftId = x050026_g_GiftId[12]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物坐骑：大象，祝您游戏愉快！"
	  elseif( odds >= 648 and odds <= 655 ) then                 --8
	    GiftId = x050026_g_GiftId[13]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物圣诞帽(无属性时装)，祝您游戏愉快！"
	  elseif( odds >= 656 and odds <= 656 ) then                 --1
	    GiftId = x050026_g_GiftId[14]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 657 and odds <= 661 ) then                 --5
	    GiftId = x050026_g_GiftId[15]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 662 and odds <= 666 ) then                 --5
	    GiftId = x050026_g_GiftId[16]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 667 and odds <= 684 ) then                 --18
	    GiftId = x050026_g_GiftId[17]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 685 and odds <= 714 ) then                 --30
	    GiftId = x050026_g_GiftId[18]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 715 and odds <= 760 ) then                 --46
	    GiftId = x050026_g_GiftId[19]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 761 and odds <= 814 ) then                 --54
	    GiftId = x050026_g_GiftId[20]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 815 and odds <= 892 ) then                 --78
	    GiftId = x050026_g_GiftId[21]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 893 and odds <= 966 ) then                 --74
	    GiftId = x050026_g_GiftId[22]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  elseif( odds >= 967 and odds <= 1000 ) then                 --34
	    GiftId = x050026_g_GiftId[23]
	    GiftNum = 1
	    strtext = "恭喜您获得礼物欢乐圣诞帽（装备绑定），祝您游戏愉快！"
	  end
	
	BeginAddItem( sceneId )
		nIndex = AddItem( sceneId, GiftId, GiftNum )
	local ret = EndAddItem( sceneId, selfId )
	if ret <= 0 then 
		return
	end
	AddItemListToHuman(sceneId,selfId)
	SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, nGetGiftCount+1 )
	
	--日志统计
	local guid = LuaFnObjId2Guid(sceneId, selfId)
	log = format("ItemId=%d,Num=%d", GiftId, GiftNum)
	ScriptGlobal_AuditGeneralLog(LUAAUDIT_MPCARD_PRIZE, guid, log)
	
	BeginEvent( sceneId )
		AddText( sceneId, strtext )
	EndEvent( sceneId )
  DispatchMissionTips( sceneId, selfId )
  
	--系统公告
	local	bagpos = -1
	bagpos = GetBagPosByItemSn(sceneId, selfId, GiftId)
		
  local ItemInfo
	if bagpos ~= -1 then
	  ItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
	end
	local PlayerName = GetName(sceneId,selfId)
	local str = format( "#{SDYD_16}洛阳#{SDYD_17}#{_INFOUSR%s}#{SDYD_18}#{_INFOMSG%s}#{SDYD_19}#{_INFOUSR%s}#{SDYD_20}", PlayerName, ItemInfo, PlayerName )
	BroadMsgByChatPipe( sceneId, selfId, str, 4 )

end

--**********************************
--获得今日领取奖品次数
--**********************************
function x050026_GetGiftCount( sceneId, selfId )
	  
	local td = GetDayTime()
	local LastGetGiftTime = GetMissionData(sceneId,selfId,MD_GETGIFT_TIME)

	if td > LastGetGiftTime then
	    SetMissionData( sceneId, selfId, MD_GETGIFT_COUNT, 0 )
	    SetMissionData( sceneId, selfId, MD_GETGIFT_TIME, td )
	end
		
	local nGetGiftCount = GetMissionData(sceneId,selfId,MD_GETGIFT_COUNT)

	return nGetGiftCount

end

--**********************************
--检测接受条件
--**********************************
function x050026_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x050026_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x050026_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x050026_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x050026_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x050026_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x050026_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x050026_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x050026_OnItemChanged( sceneId, selfId, itemdataId )
end
