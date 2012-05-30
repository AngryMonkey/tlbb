--调整发型
--脚本号
x801010_g_ScriptId = 801010

--调整发型UI 21

--**********************************
--列举事件
--**********************************
function x801010_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整发型脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)		

	-- 为什么要 NPC 名字？
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 21)
	return

end


--**********************************
--调整发型
--**********************************
function x801010_FinishAdjust( sceneId, selfId, styleId)

	-- 发型未选中或选中无效
	if styleId < 0 then														
		BeginEvent(sceneId)
			AddText(sceneId, "您没有选择想要更换的发型。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 得到调整发型所需物品的id及其数量
	local ItemId, ItemCount = GetChangeHairItemIdAndItemCount(styleId)
	
	-- 返回值非法
	if ItemId < 0 or ItemCount < 0 then		
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- 物品是否够用或锁定
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "您没有发型图，或者发型图被锁定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 物品检测通过，再检查玩家金钱
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- 物品和金钱检测都通过
	if (moneyJZ + money >= 50000)	then
		-- 设置玩家新发型（会在这个过程中消耗物品和金钱）
		local ret = LuaFnChangeHumanHairModel( sceneId, selfId, styleId )
		if ret == 0 then	
			BeginEvent(sceneId)
				AddText(sceneId, "改变发型成功。")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
		-- 以下为操作失败时的错误信息
		elseif ret == 1  then														--所选的发型与玩家当前的发型一致
			BeginEvent(sceneId)
				AddText(sceneId, "请选择一种和你当前不同的发型。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then														--没有需要消耗的物品或该物品被锁定
			BeginEvent(sceneId)
				AddText(sceneId, "您没有发型图，或者发型图被锁定。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then														
			BeginEvent(sceneId)
				AddText(sceneId, "金钱不足。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		else
			return
		end

	-- 金钱不足
	else
		BeginEvent(sceneId)
			AddText(sceneId, "您身上携带的金钱不足。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	-- 发送一条随机的广播消息
	local message;	
	local randMessage = random(3);
		
	if randMessage == 1 then	
		message = format("#{FaXing_00}#{_INFOUSR%s}#{FaXing_01}", LuaFnGetName(sceneId, selfId));
	elseif randMessage == 2 then
		message = format("#{FaXing_02}#{_INFOUSR%s}#{FaXing_03}", LuaFnGetName(sceneId, selfId));
	else
		message = format("#{FaXing_04}#{_INFOUSR%s}#{FaXing_05}", LuaFnGetName(sceneId, selfId));
	end
		
	BroadMsgByChatPipe(sceneId, selfId, message, 4);
	
end
