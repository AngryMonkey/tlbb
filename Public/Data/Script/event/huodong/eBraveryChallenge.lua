--活动——
--天使校服计划

--脚本号
x889057_g_ScriptId = 889057

--活动时间
x889057_g_startTime = 09097 --活动开始时间
x889057_g_EndTime   = 09150 --活动结束时间

--任务所需的物品
x889057_Task1Item = 20600005 --兽牙之王
x889057_Task2Item = 20600006 --佳人垂青
x889057_Task3Item = {20600007,20600008,20600009}

x889057_Exp = {250000,600000,700000}

--超级大奖礼物
x889057_GiftId = 30504078


--**********************************
--任务入口函数
--**********************************
function x889057_OnDefaultEvent( sceneId, selfId, targetId )
		
		--检测时间是否正确
		if x889057_CheckRightTime() == 0 then
			return 
		end
		
		if GetNumText() == 0 then
			x889057_Reset_Init(sceneId, selfId, targetId)
		elseif GetNumText() == 1 then
			x889057_Task1(sceneId, selfId, targetId)
		elseif GetNumText() == 2 then
			x889057_Task2(sceneId, selfId, targetId)
		elseif GetNumText() == 3 then
			x889057_Task3(sceneId, selfId, targetId)
		elseif GetNumText() == 4 then
			x889057_Reset(sceneId, selfId, targetId)
		elseif GetNumText() == 5 then
			x889057_GiveGift(sceneId, selfId, targetId)
		elseif GetNumText() == 6 then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_24}")
		elseif GetNumText() == 41 then
			x889057_Reset_OK(sceneId, selfId, targetId)
		elseif GetNumText() == 42 then
			BeginUICommand( sceneId )
				UICommand_AddInt( sceneId, targetId )
				EndUICommand( sceneId )
			DispatchUICommand( sceneId, selfId, 1000 )
		end

end


--**********************************
--检测是否是活动时间
--**********************************
function x889057_CheckRightTime()
	local curDayTime = GetDayTime()
	if curDayTime >= x889057_g_startTime and curDayTime <= x889057_g_EndTime then
		return 1
	else
		return 0
	end
end

--**********************************
--列举事件
--**********************************
function x889057_OnEnumerate( sceneId, selfId, targetId )
		if x889057_CheckRightTime() == 0 then
			return 
		end
		
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_26}", 6, 0)
		
end

function x889057_GiveGift(sceneId, selfId, targetId)

	--是否三个任务已经完成
	if (GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1) ==0 
		or GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22) ==0 
		or GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3) ==0) then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_18}")
			return
	end
	
	local weekTime = GetWeekTime();
	local diJiTian = GetTodayWeek();
	if diJiTian == 0 then  -- 星期一作为一周开始
		weekTime = weekTime - 1;
	end
	--本周是否重置过
	if GetMissionData(sceneId, selfId, MD_TW_BRAVERYCHALLENGE_GIFT) == weekTime then
			x889057_NotifyFailBox(sceneId, selfId, targetId, "#{J_YZGSC_090317_19}");
			return					
	end

	--道具栏是否足够  
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 1 then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_20}")
			return
	end

	--重置标志位
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1,0)
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22,0)
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3,0)

	SetMissionData(sceneId, selfId, MD_TW_BRAVERYCHALLENGE_GIFT, weekTime);

	--给玩家东西，完成
	local	bagpos = -1
	bagpos = TryRecieveItem( sceneId, selfId, x889057_GiftId, QUALITY_MUST_BE_CHANGE )
		--对话框提示
	x889057_NotifyFailBox(sceneId,selfId,targetId,"#{J_YZGSC_090317_21}")
	if (bagpos ~= -1) then
		 local ItemInfo = GetBagItemTransfer( sceneId, selfId, bagpos )
		 local str = format("#{J_ZDGG_090331_7}#{_INFOUSR%s}#{J_ZDGG_090331_8}#{_INFOMSG%s}#{J_ZDGG_090331_9}",GetName(sceneId, selfId),ItemInfo)
		 BroadMsgByChatPipe( sceneId, selfId, str, 4 )
	end 


	--统计日志
	AuditBravertChallenge(sceneId, selfId,5)
	
end
--**********************************
-- 参加挑战任务一
--**********************************
function x889057_Task1(sceneId, selfId, targetId)
	
	--是否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1)
	if (bHave == 1) then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_8}")
			return
	else
		if LuaFnGetAvailableItemCount( sceneId, selfId, x889057_Task1Item ) < 20 then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_9}")
		else
			if LuaFnDelAvailableItem(sceneId, selfId, x889057_Task1Item, 20) ==1 then
				AddExp( sceneId, selfId, x889057_Exp[1] )
				x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_10}")
				SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1, 1)
				AuditBravertChallenge(sceneId, selfId,1)
			end
		end
		
	end
end

--**********************************
-- 参加挑战任务二 
--**********************************
function x889057_Task2(sceneId, selfId, targetId)

	--是否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22)
	if (bHave == 1) then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_8}")
			return
	else
		if LuaFnGetAvailableItemCount( sceneId, selfId, x889057_Task2Item ) < 8 then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_11}")
		else
			if LuaFnDelAvailableItem(sceneId, selfId, x889057_Task2Item, 8) ==1 then
				AddExp( sceneId, selfId, x889057_Exp[2] )
				x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_12}")
				SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22, 1)
				AuditBravertChallenge(sceneId, selfId,2)
			end
		end
		
	end
end

--**********************************
-- 参加挑战任务三 
--**********************************
function x889057_Task3(sceneId, selfId, targetId)

	--是否参加过该活动
	local bHave = GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3)
	if (bHave == 1) then
			x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_8}")
	else
		local ListSize = getn( x889057_Task3Item )
		for i=1, ListSize do
			if LuaFnGetAvailableItemCount( sceneId, selfId, x889057_Task3Item[i] ) < 1 then
					x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_13}")
			    return
			end
		end
		for i=1,ListSize do
			if LuaFnDelAvailableItem(sceneId, selfId, x889057_Task3Item[i], 1) ~= 1 then
					return
			end
		end
		AddExp( sceneId, selfId, x889057_Exp[3] )
		x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_14}")
		SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3, 1)
		AuditBravertChallenge(sceneId, selfId,3)
	end
end

--**********************************
-- 重置 
--**********************************
function x889057_Reset(sceneId, selfId, targetId)
	BeginEvent( sceneId )
		AddText( sceneId,"#{J_YZGSC_090317_15}")
		AddNumText(sceneId, x889057_g_ScriptId, "确定", 6, 41)
		AddNumText(sceneId, x889057_g_ScriptId, "取消", 6, 42)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 重置
--**********************************
function x889057_Reset_OK(sceneId, selfId, targetId)
	local weekTime = GetWeekTime();
	local diJiTian = GetTodayWeek();
	if diJiTian == 0 then  -- 星期一作为一周开始
		weekTime = weekTime - 1;
	end
	--本周是否重置过
	if GetMissionData(sceneId, selfId, MD_TW_BRAVERYCHALLENGE_RESET) == weekTime then
			x889057_NotifyFailBox(sceneId, selfId, targetId, "#{J_YZGSC_090317_16}");
			return					
	end
	if (GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1) == 0 
		and GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22) == 0 
		and GetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3) == 0) then
		x889057_NotifyFailBox(sceneId, selfId,targetId,"#{J_YZGSC_090317_17}")
		return
	end 
	--重置
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE1, 0)
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE22, 0)
	SetMissionFlag(sceneId, selfId, MF_TW_BRAVERYCHALLENGE3, 0)
	-- 设置兑奖时间
	SetMissionData(sceneId, selfId, MD_TW_BRAVERYCHALLENGE_RESET, weekTime);
	AuditBravertChallenge(sceneId, selfId, 4)
	x889057_NotifyFailBox(sceneId, selfId, targetId, "#{J_YZGSC_090317_25}");
end

function x889057_Reset_Init(sceneId, selfId, targetId)
	BeginEvent( sceneId )
		AddText( sceneId, "#{J_YZGSC_090317_1}")
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_2}", 6, 1)
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_3}", 6, 2)
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_4}", 6, 3)
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_5}", 6, 4)
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_6}", 6, 5)
		AddNumText(sceneId, x889057_g_ScriptId, "#{J_YZGSC_090317_7}", 11,6)
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x889057_NotifySucessBox( sceneId, selfId,msg )
	--醒目提示
		BeginEvent(sceneId) 
			AddText( sceneId,msg)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
end


--**********************************
-- 对话窗口信息提示
--**********************************
function x889057_NotifyFailBox( sceneId, selfId,targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--检测接受条件
--**********************************
function x889057_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x889057_OnAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x889057_OnAbandon( sceneId, selfId )
end

--**********************************
--继续
--**********************************
function x889057_OnContinue( sceneId, selfId, targetId )
end

--**********************************
--检测是否可以提交
--**********************************
function x889057_CheckSubmit( sceneId, selfId )
end

--**********************************
--提交
--**********************************
function x889057_OnSubmit( sceneId, selfId, targetId, selectRadioId )
end

--**********************************
--杀死怪物或玩家
--**********************************
function x889057_OnKillObject( sceneId, selfId, objdataId ,objId )
end

--**********************************
--进入区域事件
--**********************************
function x889057_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--道具改变
--**********************************
function x889057_OnItemChanged( sceneId, selfId, itemdataId )
end
