--洛阳NPC
--周然
--普通

--脚本号
x000154_g_scriptId = 000154

--所拥有的事件ID列表
x000154_g_eventList={402047}

x000154_g_ExchGoodsName={"#{BHXZ_081211_4}","#{BHXZ_081211_5}","#{BHXZ_081211_6}","#{BHXZ_081211_7}"}
x000154_g_ConsumeHonour={500,1000,10000,10000}
x000154_g_ExchGoodsIndex={30008018,30008005,30008004,30900014}

x000154_g_MenpaiName={"#{BHXZ_081211_20}","#{BHXZ_081211_21}","#{BHXZ_081211_22}","#{BHXZ_081211_23}","#{BHXZ_081211_24}",
											"#{BHXZ_081211_25}","#{BHXZ_081211_26}","#{BHXZ_081211_27}","#{BHXZ_081211_28}"}
x000154_g_MenpaiWantHonour = 5000 --门派时装需要的荣誉
x000154_g_MenpaiGoodsIndex={10124142,10124143,10124144,10124145,10124146,
														10124147,10124148,10124149,10124150}

x000154_g_WantHonour = 100 --需要的荣誉
x000154_g_GiveBanggong = 50 --给的帮贡

x000154_g_BuyLuoyangMoney = 10000000 --1000金

x000154_g_LuoyangOwnerIndex = 53 --洛阳城归属帮派ID在GlobalData里面的索引
x000154_g_BaseGuildIndex = 10000 --帮派ID的基础值，因为GlobalData里面初始值是0，而0是合法帮派ID，因此无法判断是否有人已经买了。帮派ID加上一个基础值，这样可以用0来判断是否购买

--称号奖励
x000154_g_PrizeTitle = {AwardPos = 18, SetPos = 42, Index = 255}--奖励的索引(脚本函数中的case索引)，设置位置的索引(_TITLE枚举中的值)，称号索引(CharTitle.txt表中的索引)

x000154_g_LuoyangCityMoneyJZ = 200000 --领取的洛阳城市工资 20金交子

--**********************************
--事件列表
--**********************************
function x000154_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{BHXZ_081103_114}")
		--AddNumText(sceneId,x000154_g_scriptId,"治疗",6,0)
	--EndEvent(sceneId)
	for i, eventId in x000154_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_1}", 6, 10);
	AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_2}", 11, 11);
	
	--AddNumText(sceneId, x000154_g_scriptId, "购买洛阳城", 6, 13); --购买洛阳城
	--AddNumText(sceneId, x000154_g_scriptId, "领取城主称号", 6, 14); --领取城主称号
	--AddNumText(sceneId, x000154_g_scriptId, "领取城市工资", 6, 15); --领取城市工资
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x000154_OnDefaultEvent( sceneId, selfId,targetId )
	x000154_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000154_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	if key == 10 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081211_3}" )
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_4}", 6, 100);
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_5}", 6, 200);
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_6}", 6, 300);
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_7}", 6, 400);
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_8}", 6, 500);
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_32}", 6, 600);
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end
	
	--介绍
	if key == 11 then
		x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_31}" )
		return
	end
	
	--取消
	if key == 12 then
		BeginUICommand( sceneId )
			UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	
	--购买洛阳城
	if key == 13 then
--		if x000154_CheckBuyLuoyang(sceneId, selfId, targetId) == 1 then
--			if CostMoney(sceneId, selfId, x000154_g_BuyLuoyangMoney) == 1 then
--				LuaFnSetWorldGlobalData(x000154_g_LuoyangOwnerIndex, x000154_g_BaseGuildIndex+GetHumanGuildID(sceneId, selfId))
--				
--				--local msg = GetName(sceneId, selfId).."#{BHXZ_090112_18}".. LuaFnGetGuildName(sceneId, selfId) .."#{BHXZ_090112_19}"
--				local msg = format("@*;SrvMsg;SCA:#{_INFOUSR%s}#{BHXZ_090112_18}%s#{BHXZ_090112_19}", GetName(sceneId, selfId), LuaFnGetGuildName(sceneId, selfId))
--				BroadMsgByChatPipe(sceneId, selfId, msg, 4)
--				x000154_NotifyFailBox(sceneId, selfId, targetId, "#{BHXZ_090112_06}")
--			else
--				x000154_NotifyFailBox(sceneId, selfId, targetId, "    扣除金钱失败！")
--			end
--		end
		
		return
	end
	
	--领取城主称号
	if key == 14 then
--		if x000154_CheckGetCityTitle(sceneId, selfId, targetId) == 1 then
--			LuaFnAwardTitle( sceneId, selfId, x000154_g_PrizeTitle.AwardPos, x000154_g_PrizeTitle.Index)
--			SetCurTitle(sceneId, selfId, x000154_g_PrizeTitle.SetPos, x000154_g_PrizeTitle.Index)
--			LuaFnDispatchAllTitle(sceneId, selfId)
--			
--			x000154_NotifyFailBox(sceneId, selfId, targetId, "#{BHXZ_090112_10}")
--		end
		
		return
	end
	
	--领取城市工资
	if key == 15 then
--		if x000154_CheckGetMoneyJZ(sceneId, selfId, targetId) == 1 then
--			local nowDate = GetDayTime()
--			SetMissionData(sceneId, selfId, MD_LUOYANG_CITYMONEY, nowDate)
--			AddMoneyJZ(sceneId, selfId, x000154_g_LuoyangCityMoneyJZ)
--			
--			x000154_NotifyFailBox(sceneId, selfId, targetId, "#{BHXZ_090112_14}")
--		end
		
		return
	end
	
	--四种物品的确定界面
	if key == 100 or key == 200 or key == 300 or key == 400 then
		key = floor(key/100)
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081211_13}"..x000154_g_ExchGoodsName[key].."#{BHXZ_081211_10}"..x000154_g_ConsumeHonour[key].."#{BHXZ_081211_14}")
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_15}", 8, key*1000 )--确定
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_16}", 8, 12 )--取消
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--四种物品兑换
	if key == 1000 or key == 2000 or key == 3000 or key == 4000 then
		key = floor(key/1000)
		local Honour = GetHonour(sceneId,selfId)
		
		if Honour < x000154_g_ConsumeHonour[key] then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_9}"..x000154_g_ExchGoodsName[key].."#{BHXZ_081211_10}"..x000154_g_ConsumeHonour[key].."#{BHXZ_081211_11}" )
			return
		end
		
		--检查背包空间
		BeginAddItem(sceneId)
			AddItem(sceneId, x000154_g_ExchGoodsIndex[key], 1)
		local bBagOk = EndAddItem(sceneId, selfId)
		if bBagOk < 1 then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_12}" )
			return
		end
		
		if SetHonour(sceneId,selfId,Honour-x000154_g_ConsumeHonour[key]) == 1 then
			local bagindex = TryRecieveItem( sceneId, selfId, x000154_g_ExchGoodsIndex[key], QUALITY_MUST_BE_CHANGE )
			if bagindex ~= -1 then
				LuaFnItemBind(sceneId, selfId, bagindex)
				local ItemInfo = GetBagItemTransfer(sceneId, selfId,bagindex)
				local message = format("#{BHXZ_081229_02}#{_INFOUSR%s}#{BHXZ_081229_03}%d#{BHXZ_081229_04}#{_INFOMSG%s}#{BHXZ_081229_05}",LuaFnGetName(sceneId, selfId),x000154_g_ConsumeHonour[key],ItemInfo)
				BroadMsgByChatPipe(sceneId, selfId, message, 4);
				
				local guid = LuaFnObjId2Guid(sceneId, selfId)
				local log = format("ItemIndex=%d,ConsumeHonour=%d,Honour=%d", x000154_g_ExchGoodsIndex[key], x000154_g_ConsumeHonour[key], (Honour-x000154_g_ConsumeHonour[key]))
				ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_EXCHANGEHONOUR, guid, log)
			end
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_17}"..x000154_g_ExchGoodsName[key].."#{BHXZ_081211_18}" )
		end
		
		return
	end
	
	--门派时装选择界面
	if key == 500 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081211_19}")
			for i = 1, getn(x000154_g_MenpaiName) do
				AddNumText(sceneId, x000154_g_scriptId, x000154_g_MenpaiName[i], 6, key+i*10 )
			end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--门派时装确定界面
	if key >= 510 and key < 600 then
		local type = floor((key-500)/10)
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081211_13}"..x000154_g_MenpaiName[type].."#{BHXZ_081211_30}")
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_15}", 8, 700+type*10 )--确定
			AddNumText(sceneId, x000154_g_scriptId, "#{BHXZ_081211_16}", 8, 12 )--取消
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--帮贡兑换
	if key == 600 then
		local Honour = GetHonour(sceneId,selfId)
		
		if GetHumanGuildID(sceneId, selfId) == -1 then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_35}" )
			return
		end
		
		if CityGetSelfCityID(sceneId, selfId) == -1 then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_36}" )
			return
		end
		
		if Honour < x000154_g_WantHonour then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_33}" )
			return
		end
		
		if SetHonour(sceneId,selfId,Honour-x000154_g_WantHonour) == 1 then
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, x000154_g_GiveBanggong )
			local message = format("@*;SrvMsg;GLD:#{_INFOUSR%s}#{BHXZ_081229_01}",LuaFnGetName(sceneId, selfId))
			BroadMsgByChatPipe(sceneId, selfId, message, 6);
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_34}" )
			
			local guid = LuaFnObjId2Guid(sceneId, selfId)
			local log = format("CONTRIB_POINT=%d,ConsumeHonour=%d,Honour=%d", x000154_g_GiveBanggong, x000154_g_WantHonour, (Honour-x000154_g_WantHonour))
			ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_EXCHANGEHONOUR, guid, log)
		end
		
		return
	end
	
	--门派时装兑换
	if key >= 710 and key < 800 then
		local type = floor((key-700)/10)
		local Honour = GetHonour(sceneId,selfId)
		
		if Honour < x000154_g_MenpaiWantHonour then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_9}"..x000154_g_MenpaiName[type].."#{BHXZ_081211_29}" )
			return
		end
		
		--检查背包空间
		BeginAddItem(sceneId)
			AddItem(sceneId, x000154_g_MenpaiGoodsIndex[type], 1)
		local bBagOk = EndAddItem(sceneId, selfId)
		if bBagOk < 1 then
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_12}" )
			return
		end
		
		if SetHonour(sceneId,selfId,Honour-x000154_g_MenpaiWantHonour) == 1 then
			local bagindex = TryRecieveItem( sceneId, selfId, x000154_g_MenpaiGoodsIndex[type], QUALITY_MUST_BE_CHANGE )
			if bagindex ~= -1 then
				LuaFnItemBind(sceneId, selfId, bagindex)
				local ItemInfo = GetBagItemTransfer(sceneId, selfId,bagindex)
				local message = format("#{BHXZ_081229_02}#{_INFOUSR%s}#{BHXZ_081229_03}%d#{BHXZ_081229_04}#{_INFOMSG%s}#{BHXZ_081229_05}",LuaFnGetName(sceneId, selfId),x000154_g_MenpaiWantHonour,ItemInfo)
				BroadMsgByChatPipe(sceneId, selfId, message, 4);
				
				local guid = LuaFnObjId2Guid(sceneId, selfId)
				local log = format("ItemIndex=%d,ConsumeHonour=%d,Honour=%d", x000154_g_MenpaiGoodsIndex[type], x000154_g_MenpaiWantHonour, (Honour-x000154_g_MenpaiWantHonour))
				ScriptGlobal_AuditGeneralLog(LUAAUDIT_BANGZHAN_EXCHANGEHONOUR, guid, log)
			end
			x000154_NotifyFailBox( sceneId, selfId, targetId, "#{BHXZ_081211_17}"..x000154_g_MenpaiName[type].."#{BHXZ_081211_18}" )
		end
		
		return
	end
	
	for i, findId in x000154_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()是addnumtext中最后的变量
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x000154_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000154_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000154_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000154_g_eventList do
		if missionScriptId == findId then
			x000154_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000154_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000154_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000154_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000154_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
-- 对话窗口信息提示
--**********************************
function x000154_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- 屏幕中间信息提示
--**********************************
function x000154_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
-- 是否能购买洛阳城
--**********************************
function x000154_CheckBuyLuoyang( sceneId, selfId, targetId )
	--安全时间
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return 0
	end
	
	--是否具有帮会
	if GetHumanGuildID(sceneId, selfId) == -1 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_01}")
		return 0
	end
	
	--是否具有帮会城市
	if CityGetSelfCityID(sceneId, selfId) == -1 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_02}")
		return 0
	end
	
	--洛阳城已经被占据
	if LuaFnGetWorldGlobalData(x000154_g_LuoyangOwnerIndex) > 0 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_04}")
		return 0
	end
	
	--金钱是否小于1000
	if GetMoney(sceneId, selfId) < x000154_g_BuyLuoyangMoney then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_05}")
		return 0
	end
	
	return 1
end

--**********************************
-- 是否领取城主称号
--**********************************
function x000154_CheckGetCityTitle( sceneId, selfId, targetId )
	--安全时间
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return 0
	end
	
	--是否具有帮会
	local GuildID = GetHumanGuildID(sceneId, selfId)
	if GuildID == -1 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_07}")
		return 0
	end
	
	--洛阳城的主帮会
	if (GuildID+x000154_g_BaseGuildIndex) ~= LuaFnGetWorldGlobalData(x000154_g_LuoyangOwnerIndex) then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_08}")
		return 0
	end
	
	--是否已经领取过城主称号
	if GetTitle(sceneId, selfId, x000154_g_PrizeTitle.AwardPos) == x000154_g_PrizeTitle.Index then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_09}")
		return 0
	end
	
	return 1
end

--**********************************
-- 是否领取城市工资
--**********************************
function x000154_CheckGetMoneyJZ( sceneId, selfId, targetId )
	--安全时间
	if IsPilferLockFlag(sceneId, selfId) <= 0 then
		return 0
	end
	
	--是否具有帮会
	local GuildID = GetHumanGuildID(sceneId, selfId)
	if GuildID == -1 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_07}")
		return 0
	end
	
	--洛阳城的主帮会
	if (GuildID+x000154_g_BaseGuildIndex) ~= LuaFnGetWorldGlobalData(x000154_g_LuoyangOwnerIndex) then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_11}")
		return 0
	end
	
	--领取工资的时间范围 周日的0：00到24：00
	if GetTodayWeek() ~= 0 then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_12}")
		return 0
	end
	
	--是否领取过城市工资
	if GetMissionData(sceneId, selfId, MD_LUOYANG_CITYMONEY) >= GetDayTime() then
		x000154_NotifyFailTips(sceneId, selfId, "#{BHXZ_090112_13}")
		return 0
	end
	
	return 1
end
