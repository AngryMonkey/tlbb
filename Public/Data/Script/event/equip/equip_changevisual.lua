--装备改变外形
--脚本号
x809264_g_ScriptId = 809264

--装备改变外形UI 1010

--**********************************
--列举事件
--**********************************
function x809264_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--装备改变外形
--**********************************
function x809264_ChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex)
	local text="改变外形成功！"

	local ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex1 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"请放入可变形的装备。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"请放入变形符。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	sy_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if sy_index ~= 30900004 then
		--变形符
		BeginEvent(sceneId)
		AddText(sceneId,"改变装备外形需要变形符。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	money = GetMoney( sceneId, selfId )
	need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 20000
	if money < need_money then
		text="强化该装备的外形需要#{_MONEY%d}，您身上的现金不足。"
		text=format( text, need_money )
		BeginEvent(sceneId)
		AddText(sceneId,text);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret, arg0 = LuaFnChangeVisual( sceneId, selfId, nItemIndex1, nItemIndex2, nVisualIndex )

	if ret == 0 then
		LuaFnCostMoney( sceneId, selfId, need_money )
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
	end
	
	if ret == -1 then
		text="该装备不可变形。"
	end

	if ret == -2 then
		text="装备不可用。"
	end
	
	if ret == -3 then
		text="变形符不可用。"
	end

	if ret == -4 then
		text="不能改变成相同外形。"
	end

	if ret == -5 then
		text="要改变的外形不存在。"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
