--城市NPC
--武大威

x805028_g_scriptId=805028
x805028_g_BuildingID16 = 11

--所拥有的事件ID列表
x805028_g_eventList = {600030} --zchw

-- 任务集事件 ID 列表，这类事件包含子事件
x805028_g_eventSetList = {600030}

x805028_TIME_2000_01_03_ = 946828868

x805028_g_BuffPalyer_25 = 60
x805028_g_BuffAll_15    = 62

x805028_g_BangGongLimit    = 20 --[tx43764]
x805028_g_Item = 40004426

--**********************************
--事件列表
--**********************************
function x805028_UpdateEventList( sceneId, selfId, targetId )
	local i = 1
	local eventId = 0
	local PlayerName = GetName( sceneId, selfId )

	--是否是本帮成员
	local guildid 		= GetHumanGuildID(sceneId,selfId)
	local cityguildid = GetCityGuildID(sceneId, selfId, sceneId)
	local strText

	if(guildid ~= cityguildid) then
		BeginEvent(sceneId)
			strText = "什么人！敢擅闯我帮！"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	BeginEvent( sceneId )
		strText = "老武乃本城武事官员，虽武某一介武夫，有机会可以与我比划比划，对了，还有何见教？"
		AddText(sceneId,strText);
		AddText(sceneId, "    " .. PlayerName .. "！ 来做点国防任务咯！")
		if CityGetSelfCityID( sceneId, selfId ) == sceneId then
			for i, eventId in x805028_g_eventList do
				--PrintStr("eventId" .. eventId)
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		AddNumText( sceneId, x805028_g_scriptId, "国防任务介绍", 11, 1 )
		AddNumText( sceneId, x805028_g_scriptId, "修建箭楼", 6, 3 )
		AddNumText( sceneId, x805028_g_scriptId, "修炼攻击", 6, 4 )
		AddNumText( sceneId, x805028_g_scriptId, "配方商店", 7, 5 )
		AddNumText( sceneId, x805028_g_scriptId, "武坊介绍", 11, 2 )

		-- 城市领双
		AddNumText( sceneId, x805028_g_scriptId, "领取双倍经验", 6, 6 )
		
		AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_01}", 6, 7 )--[tx43764]

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件交互入口
--**********************************
function x805028_OnDefaultEvent( sceneId, selfId,targetId )
	x805028_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
-- 判断某个事件是否可以通过此 NPC 执行
--**********************************
function x805028_IsValidEvent( sceneId, selfId, eventId )
	local i = 1
	local findId = 0
	local bValid = 0

	for i, findId in x805028_g_eventList do
		if eventId == findId then
			bValid = 1
			break
		end
	end

	if bValid == 0 then
		for i, findId in x805028_g_eventSetList do
			if CallScriptFunction( findId, "IsInEventList", sceneId, selfId, eventId ) == 1 then
				bValid = 1
				break
			end
		end
	end

	return bValid
end

--**********************************
--事件列表选中一项
--**********************************
function x805028_OnEventRequest( sceneId, selfId, targetId, eventId )
	if x805028_IsValidEvent( sceneId, selfId, eventId ) == 1 then
		CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
		return
	end
	if GetNumText() == 1 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Defance_Mission_Help}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		BeginEvent(sceneId)
		AddText( sceneId, "#{City_Intro_WuFang}" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	 elseif GetNumText() == 3 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 4 then
		BeginEvent(sceneId)
		AddText( sceneId, "这个功能即将开放" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 5 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )								--调用城市商店界面
			UICommand_AddInt( sceneId, x805028_g_BuildingID16 )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 104 )

	elseif GetNumText() == 6 then
		-- 检测帮会是不是处于低维护状态，
		-- 1，看玩家城市是不是处于低维护状态中
		if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "  当前本帮处在低维护状态，所有福利都无法提供给诸位，还是同舟共济尽可能为本城赚取更多的资金为好。" )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		BeginEvent(sceneId)
			AddText( sceneId, " 在江湖上闯荡，讲究的是效率，是否要领些双倍经验时间呢？" )
			AddNumText( sceneId, x805028_g_scriptId, "我要领取一小时双倍经验", 6, 111 )
			AddNumText( sceneId, x805028_g_scriptId, "我要领取二小时双倍经验", 6, 222 )
			AddNumText( sceneId, x805028_g_scriptId, "我要领取四小时双倍经验", 6, 333 )
			AddNumText( sceneId, x805028_g_scriptId, "我想查询我本周双倍经验时间", 6, 444 )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
	elseif GetNumText() == 7 then
	
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_02}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityGetAttr(sceneId, selfId, 6) < x805028_g_BangGongLimit   then --[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_03}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_04}" )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_05}", 6, 8 )--[tx43764]
			AddNumText( sceneId, x805028_g_scriptId, "#{YPLJ_090116_06}", 6, 9 )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
		
	elseif GetNumText() == 8 then
		if GetItemCount(sceneId, selfId, x805028_g_Item) >= 3  then
			return
		end

		local nGuildPoint = CityGetAttr(sceneId, selfId, 6)
		if nGuildPoint<x805028_g_BangGongLimit then --[tx43764]
			return
		end
		
		-- 添加物品
		BeginAddItem(sceneId)
			AddItem( sceneId, x805028_g_Item, 1 )
		local ret = EndAddItem(sceneId,selfId)
		
		if ret ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_07}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		if CityChangeAttr(sceneId, selfId, 6, -x805028_g_BangGongLimit) ~= 1  then--[tx43764]
			BeginEvent(sceneId)
				AddText( sceneId, "#{YPLJ_090116_08}" )--[tx43764]
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		AddItemListToHuman(sceneId,selfId)
		
		BeginEvent(sceneId)
			AddText( sceneId, "#{YPLJ_090116_09}" )--[tx43764]
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	
	elseif GetNumText() == 9 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	
	elseif GetNumText() == 111 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 1)

	elseif GetNumText() == 222 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 2)

	elseif GetNumText() == 333 then
		x805028_DoubleExpTime(sceneId, selfId, targetId, 4)

	elseif GetNumText() == 444 then
		-- 查询本周的双倍经验时间
		local _,nCount = DEGetCount(sceneId, selfId)
		if nCount==0  then
			BeginEvent(sceneId)
				AddText(sceneId,"  真是遗憾，我能提供你本周的双倍经验时间为#R 0小时#W了。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		else
			BeginEvent(sceneId)
				AddText(sceneId,"  我能提供你本周的双倍经验时间为#R" .. nCount .. "小时#W，快好好利用吧。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)

		end

	elseif GetNumText() == 201 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 202 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 204 then
		x805028_DealDoubleExpTime(sceneId, selfId, targetId, GetNumText()-200)
		
	elseif GetNumText() == 300 then
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)

		return
	end
end

function x805028_DealDoubleExpTime(sceneId, selfId, targetId, nPoint)

	-- 获得玩家在帮会中的等级
	-- 帮主可以不用消耗帮贡，副帮主半价
	local nGuildPos = GetGuildPos(sceneId, selfId)
	
	local BasePoint = 25
	if nGuildPos == 8  then
		BasePoint = 12.5
	elseif nGuildPos == 9  then
		BasePoint = 0
	else
		BasePoint = 25
	end
	
	local bTimeOk = 1
	
	-- 帮主是不是当够时间的检测
	if nGuildPos==8 or nGuildPos==9  then
		local isPosLongEnough = IsGuildPosLongEnough(sceneId, selfId)
		if isPosLongEnough < 1 then
			bTimeOk = 0
			BasePoint = 25
		end
	else
		bTimeOk = -1
	end

	-- 检测玩家是不是有足够的帮会贡献值
	local nCity = CityGetAttr(sceneId, selfId, 6)
	if nCity < floor(BasePoint*nPoint)   then
		BeginEvent(sceneId)
			AddText(sceneId,"  你没有足够的帮会贡献度可以消耗。")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if BasePoint ~= 0  then
		if CityChangeAttr( sceneId, selfId, 6, -(floor(BasePoint*nPoint)) ) ~= 1  then
			BeginEvent(sceneId)
				AddText( sceneId, " 扣除帮会贡献度失败，请稍后尝试。" )
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
	end
	
	local _,nCount = DEGetCount(sceneId, selfId)
	if nCount < nPoint    then
		return
	end

	local nCurHave = DEGetFreeTime(sceneId, selfId)
	nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)

	local nFreeTime = DEGetFreeTime(sceneId, selfId)

	-- 先计算下当前玩家身上剩下的时间
	local nTrueTime = nCurHave;

	if nTrueTime < 0 then
		nTrueTime = 0
	end

	-- 换个新的接口
	WithDrawFreeDoubleExpTime(sceneId, selfId, 0, nPoint, 0 )

	local nCurTime = LuaFnGetCurrentTime()

	BeginEvent(sceneId)
		AddText(sceneId,"  你已成功领取了#R".. nPoint .."小时#W的双倍经验时间。现在你一共拥有#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "分钟#W的双倍经验时间")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

	BeginEvent(sceneId)
		AddText(sceneId,"  你已成功领取了#R".. nPoint .."小时#W的双倍经验时间。现在你一共拥有#Y".. tostring(floor((nTrueTime + nPoint*3600)/60)) .. "分钟#W的双倍经验时间")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)

	if bTimeOk == 1  then
		if nGuildPos == 8  then -- 副帮主
			BeginEvent(sceneId)
				AddText(sceneId,"  由于你担任副帮主超过一周，本次领双消耗帮贡减半。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		elseif nGuildPos == 9  then  --帮主
			BeginEvent(sceneId)
				AddText(sceneId,"  由于你担任帮主超过一周，本次领双不消耗帮贡。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		end
	end

	-- 同步数据到客户端
	SendDoubleExpToClient(sceneId,selfId)

end

--**********************************
--处理领双的函数
--**********************************
function x805028_DoubleExpTime(sceneId, selfId, targetId, nTime)

	-- 1，看玩家城市是不是处于低维护状态中
	if CityGetMaintainStatus(sceneId, selfId, sceneId) == 1  then
		BeginEvent(sceneId)
			AddText( sceneId, "  当前本帮处在低维护状态，所有福利都无法提供给诸位，还是同舟共济尽可能为本城赚取更多的资金为好。" )
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	-- 检测是不是需要从新刷新数据
	-- 现在时间
	local nCurTime = LuaFnGetCurrentTime()
	-- 上次刷新数据的时间
	local nPreTime = DEGetPreTime(sceneId, selfId)

	if (nCurTime - nPreTime  >= 3600*24*7)  or
		 (floor((nCurTime-x805028_TIME_2000_01_03_)/(3600*24*7)) ~= floor((nPreTime-x805028_TIME_2000_01_03_)/(3600*24*7)))   then
		----DESetLock(sceneId, selfId, 0)
		----DESetBeginTime(sceneId, selfId, 0)
		--DESetFreeTime(sceneId, selfId, 0)
		--DESetPreTime(sceneId, selfId, nCurTime)
		--DESetCount(sceneId, selfId, 5, 4, 0)

		DEResetWeeklyFreeTime(sceneId, selfId)
	end

	--
	x805028_AddDETime( sceneId, selfId, targetId, nTime, nCurTime, nPreTime )

end

function x805028_AddDETime(sceneId, selfId, targetId, nPoint, nCurTime, nPreTime)
		local nCurHave = DEGetFreeTime(sceneId, selfId)
		nCurHave = nCurHave + DEGetMoneyTime(sceneId, selfId)
		-- 先计算下当前玩家身上剩下的时间
		local nTrueTime = nCurHave;

		local nFreeTime = DEGetFreeTime(sceneId, selfId)

		if nTrueTime < 0 then
			nTrueTime = 0
		end

		-- 看还有没有时间可以领取
		local _,nCount = DEGetCount(sceneId, selfId)
		if(nCount <= 0)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你本周的双倍经验时间似乎已经用完了。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		if nCount < nPoint   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你没有这么多的时间可以领取了")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 看身上是不是已经有比较多的时间了，2小时
		if nFreeTime >= 120*60   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你在三大城市和自建城市中获得的双倍经验时间已经达到可领取的上限")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 检测玩家不能拥有超过4个小时的时间
		if nFreeTime + nPoint*3600 > 3600*4   then
			BeginEvent(sceneId)
				AddText(sceneId,"  你在三大城市和自建城市中获得的双倍经验时间已经达到可领取的上限")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- 看身上是不是有冻结了的时间
		if DEIsLock(sceneId,selfId)  > 0    then
			BeginEvent(sceneId)
				AddText(sceneId,"  你还有冻结的双倍经验时间，还是先解冻再领取新的双倍经验时间吧。")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		BeginEvent(sceneId)
			if (nTrueTime/60) > 0 then
				AddText(sceneId,"  你本周双倍经验时间剩余#R" .. tostring(floor(nCount)) .. "小时#W，当前已有双倍经验时间#Y" .. tostring(floor(nTrueTime/60)) .. "分钟#W，你确认要领取#Y" .. tostring(floor(nPoint*60)) .. "分钟#W双倍经验时间并同时消耗帮派贡献度" .. tostring(floor(nPoint*25)) .. "吗？#r  如果你担任了一周以上的帮主，可以不用消耗帮贡，副帮主可以减半。");
			else
				AddText(sceneId,"  你本周双倍经验时间剩余#R" .. tostring(floor(nCount)) .. "小时#W，你确认要领取#Y" .. tostring(floor(nPoint*60)) .. "分钟#W双倍经验时间并同时消耗帮派贡献度" .. tostring(floor(nPoint*25)) .. "吗？#r  如果你担任了一周以上的帮主，可以不用消耗帮贡，副帮主可以减半。");
			end
			-- 如果这个时候玩家身上有双倍经验药水效果，需要给玩家提示
			if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffPalyer_25) == 1   
					or  LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x805028_g_BuffAll_15) == 1
					then
				AddText(sceneId,"  #r  #R请注意:您身上已经存在了多倍经验时间，是否确认领取？");
			end
			AddNumText(sceneId, x805028_g_scriptId, "是的，我要领取。", -1,200+nPoint )
			AddNumText(sceneId, x805028_g_scriptId, "不了，我点错了。", -1,300 )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

end


--**********************************
--接受此NPC的任务
--**********************************
function x805028_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		local ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
		if ret > 0 then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
		elseif ret == -1 then
			x805028_NotifyFailTips( sceneId, selfId, "你现在不能领取这个任务" )
		elseif ret == -2 then
			x805028_NotifyFailTips( sceneId, selfId, "无法接受更多任务" )
		end

		return
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x805028_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		x805028_UpdateEventList( sceneId, selfId, targetId )
		return
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x805028_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
		return
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x805028_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	if x805028_IsValidEvent( sceneId, selfId, missionScriptId ) == 1 then
		CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
		return
	end
end

--**********************************
--死亡事件
--**********************************
function x805028_OnDie( sceneId, selfId, killerId )
end

function x805028_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
