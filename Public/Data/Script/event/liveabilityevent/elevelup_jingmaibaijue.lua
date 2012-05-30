--经脉百决技能升级

--脚本号
x713592_g_ScriptId = 713592

--此npc可以升到的最高等级
x713592_g_nMaxLevel = 100

--**********************************
--任务入口函数
--**********************************
function x713592_OnDefaultEvent( sceneId, selfId, targetId )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--玩家经脉百决技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_JINGMAIBAIJUE)
	--任务判断

	--判断是否是大理派弟子,不是大理派弟子不能学习
		if GetMenPai(sceneId,selfId) ~= MP_DALI then
			BeginEvent(sceneId)
        		AddText(sceneId,"你不是本派弟子，我不能教你。");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--如果还没有学会该生活技能
	if AbilityLevel < 1	then
		BeginEvent(sceneId)
			strText = "你还没有学会经脉百决技能！"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果生活技能等级已经超出该npc所能教的范围
	if AbilityLevel >= x713592_g_nMaxLevel then
		BeginEvent(sceneId)
			--[ QUFEI 2007-07-17 15:29 修改 ]
			strText = "目前此技能只能学习到100级"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713592_g_ScriptId, ABILITY_JINGMAIBAIJUE, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].Money, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_ASSISTANT[AbilityLevel+1].HumanLevelLimit)
		local tempScriptId = x713592_g_ScriptId;
		local tempAbilityId = ABILITY_JINGMAIBAIJUE;
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
function x713592_OnEnumerate( sceneId, selfId, targetId )
		--如果不到等级则不显示选项
		if 1 then
			AddNumText(sceneId,x713592_g_ScriptId,"升级经脉百决技能", 12, 1)
		end
		return
end

--**********************************
--检测接受条件
--**********************************
function x713592_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713592_OnAccept( sceneId, selfId, ABILITY_JINGMAIBAIJUE )
end
