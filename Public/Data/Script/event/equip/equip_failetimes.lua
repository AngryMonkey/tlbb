--装备减少修理失败次数
--脚本号
x809265_g_ScriptId = 809265

--减少修理失败次数UI 1005

--**********************************
--列举事件
--**********************************
function x809265_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--减少修理失败次数
--**********************************
function x809265_EquipFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2)

	local ret = LuaFnIsItemLocked( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"该装备不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"润物露不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local szTransfer = GetBagItemTransfer(sceneId,selfId, nItemIndex2);


	local sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900007 and sy_index ~= 30900000   then
		BeginEvent(sceneId)
		AddText(sceneId,"减少修理失败次数需要润物露。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local	text	= "修理成功"
	local money = GetMoney( sceneId, selfId )
	local jiaozi = GetMoneyJZ(sceneId, selfId);
	local need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 200
	if money+jiaozi < need_money then
		text="降低该装备修理失败次数需要#{_EXCHG%d}，您身上的现金不足。"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	local szMsg;
	local szName;
	szName = GetName( sceneId, selfId );		
	
	if sy_index == 30900007  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 1 )
		szMsg = format( "#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，装备的可修理次数成功增加1次，避免了装备修理失败3次后碎裂。", szName, szTransfer );
	elseif sy_index == 30900000  then
		ret = LuaFnFaileTimes( sceneId, selfId, nItemIndex1, nItemIndex2, 0 )
		szMsg = format( "#W#{_INFOUSR%s}#H使用了#W#{_INFOMSG%s}#H之后，装备的可修理次数成功的恢复成为3次，避免了装备修理失败3次后碎裂。", szName, szTransfer );
	end

	if ret == 0 then
		LuaFnCostMoneyWithPriority( sceneId, selfId, need_money ) --zchw
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);

		
		AddGlobalCountNews( sceneId, szMsg )
		
	end
	
	if ret == -1 then
		text="未知错误。"
	end

	if ret == -2 then
		text="装备不可用。"
	end
	
	if ret == -3 then
		text="润物露不可用。"
	end

	if ret == -4 then
		text="修理失败次数已经最低了。"
	end

	BeginEvent(sceneId)
		AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
