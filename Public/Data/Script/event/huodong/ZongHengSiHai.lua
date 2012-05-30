--纵横四海
--谢鉷

x889056_g_ScriptId = 889056;

--活动开启日期 2009-4-8
x889056_g_BeginTime		= 20090408
x889056_g_EndTime		= 20090531

--纪念章部件
x889056_g_PartID		= 30504076
x889056_g_NeedPartCount	= 4

--纪念章
x889056_g_ItemID		= 10423050

--**********************************
--列举事件
--**********************************
function x889056_OnEnumerate( sceneId, selfId, targetId )
	
	if x889056_IsInActTime( sceneId, selfId ) > 0 then
		AddNumText(sceneId, x889056_g_ScriptId, "#{J_ZHSH_090317_1}", 6, 1);
	end
	
end

--**********************************
--任务入口函数
--**********************************
function x889056_OnDefaultEvent( sceneId, selfId, targetId )
	
	local opt = GetNumText();
	if opt == 1 then
		BeginEvent(sceneId)			
			AddText(sceneId, "#{J_ZHSH_090317_3}");
			AddNumText(sceneId, x889056_g_ScriptId, "#{J_ZHSH_090317_2}", 6, 11);		--还是算了吧
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	elseif opt == 11 then
		if x889056_IsJoined( sceneId, selfId ) == 1 then
			x889056_ReturnDlg(sceneId, selfId, targetId, "#{J_ZHSH_090317_4}")
		else
			x889056_GivePrize( sceneId, selfId, targetId )
		end
	end
	
end

--**********************************
-- 是否已经参加过活动
--**********************************
function x889056_IsJoined( sceneId, selfId )

	return GetMissionFlag( sceneId, selfId, MF_TW_ZONGHENGSIHAI_JOIN )
	
end

--**********************************
-- 设置已经参加过活动
--**********************************
function x889056_SetJoined( sceneId, selfId )

	return SetMissionFlag( sceneId, selfId, MF_TW_ZONGHENGSIHAI_JOIN, 1 )
	
end

--**********************************
--是否在活动时间内，是则返回当天日期，否则返回0
--**********************************
function x889056_IsInActTime( sceneId, selfId )

	local curDate = GetTime2Day()
	if curDate >= x889056_g_BeginTime and curDate <= x889056_g_EndTime then
		return curDate
	else
		return 0
	end
	
end

--**********************************
--奖励
--**********************************
function x889056_GivePrize( sceneId, selfId, targetId )

	-- 是否在活动时间内
	if x889056_IsInActTime( ) <= 0 then
		x889056_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- 物品是否够
	if LuaFnGetAvailableItemCount(sceneId, selfId, x889056_g_PartID) < x889056_g_NeedPartCount then
		x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_5}" )
		return
	end
	
	-- 检查背包空间
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
		x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_6}" )
		return
	end
	
	-- 删除物品失败，未知原因，关闭对话窗口
	if LuaFnDelAvailableItem(sceneId, selfId, x889056_g_PartID, x889056_g_NeedPartCount) == 0 then
		x889056_CloseDlg( sceneId, selfId, targetId )
		return
	end
	
	-- 给物品，关闭窗口
	TryRecieveItem( sceneId, selfId, x889056_g_ItemID, QUALITY_MUST_BE_CHANGE )
	
	x889056_SetJoined( sceneId, selfId )
	
	x889056_ReturnDlg( sceneId, selfId, targetId, "#{J_ZHSH_090317_7}" )
	
end

--**********************************
--关闭对话框
--**********************************
function x889056_CloseDlg(sceneId, selfId, targetId)
	BeginUICommand( sceneId )
	UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 1000 )	
end

--**********************************
--返回对话
--**********************************
function x889056_ReturnDlg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId)
end

--**********************************
--ReturnTips
--**********************************
function x889056_Tips(sceneId, selfId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId)
end

--**********************************
--接受
--**********************************
function x889056_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x889056_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889056_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889056_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889056_OnSubmit( sceneId, selfId, targetId,selectRadioId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x889056_OnKillObject( sceneId, selfId, objdataId )
end

--**********************************
--进入区域事件
--**********************************
function x889056_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889056_OnItemChanged( sceneId, selfId, itemdataId )
end

