--调整脸型
--脚本号
x805029_g_ScriptId = 805029

--调整脸型UI 21

--**********************************
--列举事件
--**********************************
function x805029_OnEnumerate( sceneId, selfId, targetId )
	-- 调试信息
	--BeginEvent(sceneId)
	--	AddText(sceneId, "进入调整脸型脚本");
	--EndEvent(sceneId)
	--DispatchMissionTips(sceneId,selfId)	
	
	-- 为什么要 NPC 名字？
	local TransportNPCName=GetName(sceneId,targetId);

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId,targetId)
		UICommand_AddString(sceneId,TransportNPCName)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 928)
	return
end

--**********************************
--调整脸型
--**********************************
function x805029_FinishAdjust( sceneId, selfId, styleId)

	-- 得到调整脸型所需物品的id及其数量
	local ItemId, ItemCount = GetChangeFaceItemIdAndItemCount(styleId)
		
	-- 返回值非法
	if ItemId < 0 or ItemCount < 0 then
		return
	end
	
	local nItemNum = LuaFnGetAvailableItemCount( sceneId, selfId, ItemId )

	-- 物品是否够用或锁定
	if ItemCount > nItemNum then
		BeginEvent(sceneId)
			AddText(sceneId, "您没有定颜珠，或者定颜珠被锁定。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
		-- 获得定颜珠在背包中的位置（定颜珠会在改变脸型的过程中被删除，所以需要先保存它的信息）
	local ItemPos = LuaFnGetItemPosByItemDataID(sceneId, selfId, ItemId, 0)
	local szItemTransfer = GetBagItemTransfer(sceneId, selfId, ItemPos)
	
	-- 物品检测通过，再检查玩家金钱
	local moneyJZ = GetMoneyJZ (sceneId, selfId)
	local money = GetMoney (sceneId, selfId)
	
	-- 物品和金钱检测都通过
	if (moneyJZ + money >= 50000)	then	
		-- 设置玩家新脸型（会在这个过程中消耗物品和金钱）
		local ret = ChangeHumanFaceModel( sceneId, selfId, styleId )
		if ret == 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"改变脸型成功。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
		
		-- 改变脸型失败
		elseif ret == 1 then
			BeginEvent(sceneId)
				AddText(sceneId,"请选择一种新脸型。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 3 then
			BeginEvent(sceneId)
				AddText(sceneId, "您没有定颜珠，或者定颜珠被锁定。");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			return
		elseif ret == 4 then	
			BeginEvent(sceneId)
				AddText(sceneId, "金钱不足");
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
	
	-- 发送广播
	local message;	
	local randMessage = random(3);
	local nsex = LuaFnGetSex(sceneId, selfId)
	local str1,str2
	if nsex == 0  then
		str1 = "她"
		str2 = "美"
	else
		str1 = "他"
		str2 = "帅"
	end
	
	if randMessage == 1 then
		message = format("#H人要面子树要皮，#W#{_INFOUSR%s}#H深知这个道理，今天用#W#{_INFOMSG%s}#H这一整容更不得了，简直就是气死潘安，羡煞貂蝉！", LuaFnGetName(sceneId, selfId), szItemTransfer);
	elseif randMessage == 2 then
		message = format("#H魔镜说这个世界上最" .. str2 .. "的人诞生了！那就是刚才让天上大雁掉下来的#W#{_INFOUSR%s}#H，快去看看" .. str1 .. "吧，这#W#{_INFOMSG%s}#H用完后果然效果出众！", LuaFnGetName(sceneId, selfId), szItemTransfer);
	else
		message = format("#H咦？怎么小溪中的鱼儿都翻了肚皮？难道是中毒身亡？不对，原来是#W#{_INFOUSR%s}#H刚刚走过去，鱼儿们羞得晕了过去。天呀！" .. str1 .. "用了#W#{_INFOMSG%s}#H以后竟然会有这样的绝世容颜！", LuaFnGetName(sceneId, selfId), szItemTransfer);
	end

	BroadMsgByChatPipe(sceneId, selfId, message, 4);
end
