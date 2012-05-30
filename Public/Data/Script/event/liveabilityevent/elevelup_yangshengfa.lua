--养生法技能升级

--脚本号
x713587_g_ScriptId = 713587

x713587_g_AbilityID = ABILITY_YANGSHENGFA
--此npc可以升到的最高等级
x713587_g_nMaxLevel = 30

x713587_g_AbilityName = "养生法"

--**********************************
--任务入口函数
--**********************************
function x713587_OnDefaultEvent( sceneId, selfId, targetId, nNum, npcScriptId, bid )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YANGSHENGFA)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YANGSHENGFA)
	--任务判断

	--如果还没有学会该生活技能
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "你还没有学会养生法技能！"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	--如果是在城市中升级
	if bid then
		--检查城市是否处于低维护状态
		if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
			return
		end
		local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713587_g_AbilityID, bid, 2)
		if ret > 0 then
			CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713587_g_AbilityID, bid, 2)
		end
		return
	end
	--如果生活技能等级已经超出该npc所能教的范围
	if AbilityLevel >= x713587_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "我只能教你1-"..x713587_g_nMaxLevel.."级的养生法技能,请到帮派中学习更高级的养生法"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713587_g_ScriptId, ABILITY_YANGSHENGFA, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713587_g_ScriptId;
		local tempAbilityId = ABILITY_YANGSHENGFA;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,tempScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x713587_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713587_g_AbilityID, bid, 6)
			if ret > 0 then AddNumText(sceneId,x713587_g_ScriptId,"升级"..x713587_g_AbilityName.."技能", 12, 1) end
			return
		end
		--如果不到等级则不显示选项
		if 1 then
			AddNumText(sceneId,x713587_g_ScriptId,"升级养生法技能", 12, 1)
		end
		return
end

--**********************************
--检测接受条件
--**********************************
function x713587_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713587_OnAccept( sceneId, selfId, ABILITY_YANGSHENGFA )
end
