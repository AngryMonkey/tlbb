--装备升级
--脚本号
x809263_g_ScriptId = 809263

--装备升级UI 1003

--**********************************
--列举事件
--**********************************
function x809263_OnEnumerate( sceneId, selfId, targetId )

end


--**********************************
--装备升级
--**********************************
function x809263_EquipLevelUp( sceneId, selfId, nItemIndex1, nItemIndex2)
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex1 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"该装备不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = LuaFnIsItemAvailable( sceneId, selfId, nItemIndex2 )
	if ret ~= 1 then
		BeginEvent(sceneId)
		AddText(sceneId,"升级宝石不可用。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	equip_level = GetBagItemLevel( sceneId, selfId, nItemIndex1 )
	if equip_level < 60 then
		BeginEvent(sceneId)
		AddText(sceneId,"60级以下的装备不能升级。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	gem_index = LuaFnGetItemTableIndexByIndex( sceneId, selfId, nItemIndex2 )
	if gem_index ~= 30900008 then
		--升级宝石
		BeginEvent(sceneId)
		AddText(sceneId,"装备升级需要升级宝石。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	money = GetMoney( sceneId, selfId )
	need_money = GetBagItemLevel( sceneId, selfId, nItemIndex1 ) * 20000
	if money < need_money then
		BeginEvent(sceneId)
		AddText(sceneId,"金钱不足。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	ret = GetGemEmbededCount( sceneId, selfId, nItemIndex1 )
	if ret ~= 0 then
		BeginEvent(sceneId)
		AddText(sceneId,"镶嵌宝石的装备不能升级。");
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end

	ret, arg0 = LuaFnEquipLevelUp( sceneId, selfId, nItemIndex1, nItemIndex2 )
	
	local text="装备升级成功！"
	if ret == 0 then
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
		LuaFnCostMoney( sceneId, selfId, need_money )
		if arg0 == 0 then
			text="恭喜！！装备成功升级，快看看升级过后的新装备吧。"
		else
			text="恭喜！装备成功升级，但是强化等级减1，现在装备的强化等级为"..tostring(arg0)
		end
	end

	if ret == -1 then
		text="未知错误。"
	end

	if ret == -2 then
		text="装备不可用。"
	end
	
	if ret == -3 then
		text="升级宝石不可用。"
	end

	if ret == -6 then
		text="未知错误。"
	end

	if ret == -7 then
		LuaFnEraseItem( sceneId, selfId, nItemIndex2 )
		LuaFnCostMoney( sceneId, selfId, need_money )
		text="太不走运了，您的装备升级失败了！"
	end

	if ret == -8 then
		text="该装备无法升级。"
	end

	BeginEvent(sceneId)
	AddText(sceneId,text)
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
