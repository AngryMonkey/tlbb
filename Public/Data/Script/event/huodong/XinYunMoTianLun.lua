--性福摩天轮
--谢鉷

x889055_g_ScriptId = 889055;

--活动开启日期 2009-4-8
x889055_g_BeginTime		= 20090408
x889055_g_EndTime		= 20090531
--x889055_g_ExchangeEndTime	= 20090531

--兑换部件ID
x889055_g_PartID		= 
{
	30504083,	--庆
	30504082,	--年
	30504081,	--周
	30504079,	--天
	30504080,	--龙
}

--纪念章
x889055_g_ItemID		= 30504072

--兑换BUFF
x889055_g_BuffID		= 20005

--物品等级限制
x889055_g_LimitLevel	= 10
--**********************************
--列举事件
--**********************************
function x889055_OnEnumerate( sceneId, selfId, targetId )
	
	if x889055_IsInActTime( sceneId, selfId ) > 0 then
		AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_20}", 6, 1);
	end
	
end

--**********************************
--任务入口函数
--**********************************
function x889055_OnDefaultEvent( sceneId, selfId, targetId )
	
	local opt = GetNumText();
	if opt == 1 then
		BeginEvent(sceneId)			
			AddText(sceneId, "#{XFMTL_20090319_06}");
			AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_15}", 6, 11);		--领取幸福摩天轮大奖
			AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_16}", 6, 12);		--换取天龙周年庆BUFF
			AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_17}", 11, 13);		--幸福摩天轮帮助
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif opt == 11 then
		x889055_GivePrize( sceneId, selfId, targetId )
	elseif opt == 12 then
		BeginEvent(sceneId)			
			AddText(sceneId, "#{XFMTL_20090319_11}");
			AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_18}", 6, 121);	--进行兑换
			AddNumText(sceneId, x889055_g_ScriptId, "#{XFMTL_20090319_19}", 6, 122);	--还没准备好
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif opt == 13 then
		x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_14}" )
	elseif opt == 121 then
		x889055_AddBuff( sceneId, selfId, targetId )
	elseif opt == 122 then
		x889055_CloseDlg( sceneId, selfId, targetId )
	end
	
end

--**********************************
--是否在活动时间内，是则返回当天日期，否则返回0
--**********************************
function x889055_IsInActTime( sceneId, selfId )

	local curDate = GetTime2Day()
	if curDate >= x889055_g_BeginTime and curDate <= x889055_g_EndTime then
		return curDate
	else
		return 0
	end
	
end

--**********************************
--奖励
--**********************************
function x889055_GivePrize( sceneId, selfId, targetId )

	-- 是否在活动时间内
	if x889055_IsInActTime( ) <= 0 then
		x889055_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- 等级大于10
	local level = GetLevel( sceneId, selfId )
	if level < x889055_g_LimitLevel then
		x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_07}" )
		return	
	end
	
	-- 物品是否够
	for i, partID in x889055_g_PartID do
		if LuaFnGetAvailableItemCount(sceneId, selfId, partID) < 1 then
			x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_10}" )
			return
		end
	end
	
	-- 检查背包空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_08}" )
		return
	end
	
	-- 删除物品失败，未知原因，关闭对话窗口
	for j, partID in x889055_g_PartID do
		if LuaFnDelAvailableItem(sceneId, selfId, partID, 1) < 1 then
			x889055_CloseDlg( sceneId, selfId, targetId )
			return
		end
	end
	
	-- 给物品，关闭窗口
	TryRecieveItem( sceneId, selfId, x889055_g_ItemID, QUALITY_MUST_BE_CHANGE )
		
	x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_09}" )
	
end

--**********************************
--兑换BUFF
--**********************************
function x889055_AddBuff( sceneId, selfId, targetId )

	-- 是否在活动时间内
	if x889055_IsInActTime( ) <= 0 then
		x889055_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- 等级大于10
	local level = GetLevel( sceneId, selfId )
	if level < x889055_g_LimitLevel then
		x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_12}" )
		return	
	end

	-- 删除物品加BUFF
	for i, partID in x889055_g_PartID do
		if LuaFnDelAvailableItem(sceneId, selfId, partID, 1) > 0 then
			
			--加BUFF
			LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, x889055_g_BuffID, 0 )
			
			x889055_CloseDlg( sceneId, selfId, targetId )
			return
		end
	end
	
	x889055_ReturnDlg( sceneId, selfId, targetId, "#{XFMTL_20090319_13}" )
end

--**********************************
--给玩家发邮件
--**********************************
function x889055_OnPlayerLogin( sceneId, selfId )
	
	-- 是否在活动时间内
	local curDate = x889055_IsInActTime( )
	if curDate > 0 then
		local lastDate = GetMissionData( sceneId, selfId, MD_TW_XINGFUMOTIANLUN_LAST_MAIL_DATE )
		if lastDate < curDate then
			LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{XFMTL_20090319_01}" )
			SetMissionData(sceneId, selfId, MD_TW_XINGFUMOTIANLUN_LAST_MAIL_DATE, curDate)
		end
	end
	
end

--**********************************
--关闭对话框
--**********************************
function x889055_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--返回对话
--**********************************
function x889055_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889055_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--接受
--**********************************
function x889055_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x889055_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889055_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889055_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889055_OnSubmit( sceneId, selfId, targetId,selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x889055_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x889055_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889055_OnItemChanged( sceneId, selfId, itemdataId )
end

