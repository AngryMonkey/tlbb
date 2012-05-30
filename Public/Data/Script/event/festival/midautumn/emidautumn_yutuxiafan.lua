-- 兑换玉兔铃铛

-- 脚本号
x050017_g_ScriptId = 050017

x050017_g_eventId_cancel = 0;		-- 取消
x050017_g_eventId_redeem = 1;		-- 兑换
x050017_g_eventId_redeem_5 = 2;		-- 兑换5级
x050017_g_eventId_redeem_45 = 3;	-- 兑换45级
x050017_g_eventId_redeem_55 = 4;	-- 兑换55级
x050017_g_eventId_redeem_65 = 5;	-- 兑换65级
x050017_g_eventId_about = 10;		-- 关于

--兑换列表
x050017_g_redeemList = {};
 x050017_g_redeemList[x050017_g_eventId_redeem_5] = {count=10, level=5, item=30505126, petName="玉兔"}
x050017_g_redeemList[x050017_g_eventId_redeem_45] = {count=45, level=45, item=30505127, petName="皓月玉兔"}
x050017_g_redeemList[x050017_g_eventId_redeem_55] = {count=55, level=55, item=30505128, petName="蟾宫玉兔"}
x050017_g_redeemList[x050017_g_eventId_redeem_65] = {count=65, level=65, item=30505129, petName="嫦娥玉兔"}

--需求道具
x050017_g_redeemItemId = 30505125;

--活动时间
x050017_g_StartDayTime = 8257   --活动开始时间 2008-9-14,包含当日
x050017_g_EndDayTime = 8304   --活动结束时间 2008-10-31,包含当日

--**********************************
--列举事件
--**********************************
function x050017_OnEnumerate( sceneId, selfId, targetId )
	local check = x050017_IsMidAutumnPeriod(sceneId, selfId);
	if not check or check ~= 1 then
		return
	end
	AddNumText(sceneId, x050017_g_ScriptId, "我要兑换玉兔", 6, x050017_g_eventId_redeem);
	--AddNumText(sceneId, x050017_g_ScriptId, "关于兑换玉兔铃铛", 11, x050017_g_eventId_about);
end

--**********************************
--任务入口函数
--**********************************
function x050017_OnDefaultEvent( sceneId, selfId, targetId )	--点击该任务后执行此脚本
	local selEventId = GetNumText();
	if selEventId then
		if selEventId == x050017_g_eventId_redeem then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_DB1}");
				AddNumText(sceneId, x050017_g_ScriptId, "兑换携带等级5级的玉兔", 6, x050017_g_eventId_redeem_5);
				AddNumText(sceneId, x050017_g_ScriptId, "兑换携带等级45级的皓月玉兔", 6, x050017_g_eventId_redeem_45);
				AddNumText(sceneId, x050017_g_ScriptId, "兑换携带等级55级的蟾宫玉兔", 6, x050017_g_eventId_redeem_55);
				AddNumText(sceneId, x050017_g_ScriptId, "兑换携带等级65级的嫦娥玉兔", 6, x050017_g_eventId_redeem_65);
				AddNumText(sceneId, x050017_g_ScriptId, "暂时不兑换玉兔", 6, x050017_g_eventId_cancel);
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		elseif selEventId == x050017_g_eventId_redeem_5
			or selEventId == x050017_g_eventId_redeem_45
			or selEventId == x050017_g_eventId_redeem_55
			or selEventId == x050017_g_eventId_redeem_65 then
			local redeemItem = x050017_g_redeemList[selEventId];
			if not redeemItem then
				x050017_NotifyBox(sceneId, selfId, targetId, "未开放道具，不能兑换！");
				return 0;
			end
			
			local redeemItemName = GetItemName(sceneId, x050017_g_redeemItemId);
			local itemCount = LuaFnGetAvailableItemCount(sceneId, selfId, x050017_g_redeemItemId);
			if not itemCount or itemCount < redeemItem.count then
				x050017_NotifyBox(sceneId, selfId, targetId, "兑换"..GetItemName(sceneId, redeemItem.item).."需要"..redeemItem.count.."个"..redeemItemName.."，您身上的"..redeemItemName.."不够，不能兑换！");
				return 0;
			end
			
			local addItemIndex;
			BeginAddItem(sceneId);
				addItemIndex = AddItem(sceneId, redeemItem.item, 1);
			local ret = EndAddItem(sceneId, selfId);
			if not ret or ret ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "对不起，您的物品栏已经没有空间或者你正处于疲劳状态！");
				return 0;
			end
			
			local delRet = LuaFnDelAvailableItem(sceneId, selfId, x050017_g_redeemItemId, redeemItem.count);
			if not delRet or delRet ~= 1 then
				x050017_NotifyBox(sceneId, selfId, targetId, "无法扣除"..GetItemName(sceneId, redeemItem.item).."！");
				return 0;
			end
			
			AddItemListToHuman(sceneId, selfId);
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
			
			local itemTransfer;
			if addItemIndex and addItemIndex  > -1 then
				itemTransfer = GetItemTransfer(sceneId, selfId, addItemIndex);
			end
			
			if itemTransfer then
				if selEventId == x050017_g_eventId_redeem_45 then
					msg = "#Y岳常圆：#P各位观众，#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l即将用他兑换的#{_INFOMSG"..itemTransfer.."}#P请出我们可爱的#G皓月玉兔#P，大家敬请期待吧！";
				elseif selEventId == x050017_g_eventId_redeem_55 then
					msg = "#Y岳常圆：#P娘子，快出来看#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l又用#{_INFOMSG"..itemTransfer.."}召唤#G蟾宫玉兔#P了！";
				elseif selEventId == x050017_g_eventId_redeem_65 then
					msg = "#Y岳常圆：#P我的老天爷啊！难道是传说中的玉兔总动员不成，#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l也兑换#{_INFOMSG"..itemTransfer.."}召唤#G嫦娥玉兔#P咧！";
				else
					msg = "#Y岳常圆：#P打雷啦！下雨啦！玉兔又下凡啦！#W#{_INFOUSR"..GetName(sceneId, selfId).."}#l得到了传说中的#{_INFOMSG"..itemTransfer.."}，终于可以召唤#G玉兔#P啦！";
				end
				
				if msg then
					BroadMsgByChatPipe(sceneId, selfId, msg, 4);
				end
			end
			
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
			return 1;
		elseif selEventId == x050017_g_eventId_cancel then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
			EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		elseif selEventId == x050017_g_eventId_about then
			BeginEvent(sceneId);
				AddText( sceneId, "#{YUTUXIAFAN_ABOUT}");
			EndEvent(sceneId);
			DispatchEventList(sceneId, selfId, targetId);
			return 1;
		end
	end
end

--**********************************
--对话窗口信息提示
--**********************************
function x050017_NotifyBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--醒目信息提示
--**********************************
function x050017_NotifyTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--活动是否开启
--**********************************
function x050017_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050017_g_StartDayTime or curDay > x050017_g_EndDayTime then
		return 0;
	end

	return 1
end
