--制蛊技能升级

--脚本号
x713575_g_ScriptId = 713575

--此npc可以升到的最高等级
x713575_g_nMaxLevel = 10

--**********************************
--任务入口函数
--**********************************
function x713575_OnDefaultEvent( sceneId, selfId, targetId )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_ZHIGU)
	--玩家制蛊技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_ZHIGU)
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
			strText = "你还没有学会制蛊技能！"
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	--如果生活技能等级已经超出该npc所能教的范围
	if AbilityLevel >= x713575_g_nMaxLevel then
		BeginEvent(sceneId)
			strText = "我只能教你1-10级的制蛊技能,请到帮派中学习更高级的制蛊."
			AddText(sceneId,strText)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		--DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, ABILITY_ZHIGU, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].Money, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanExp, LEVELUP_ABILITY_MENPAI[AbilityLevel+1].AbilityExpLimitShow,LEVELUP_ABILITY_MENPAI[AbilityLevel+1].HumanLevelLimit)
		local tempAbilityId = ABILITY_ZHIGU;
		local tempAbilityLevel = AbilityLevel + 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			DispatchAbilityInfo(sceneId, selfId, targetId,x713575_g_ScriptId, tempAbilityId, demandMoney, demandExp, limitAbilityExpShow, limitLevel);
		end
	end
end

--**********************************
--列举事件
--**********************************
function x713575_OnEnumerate( sceneId, selfId, targetId )
		--如果不到等级则不显示选项
		if 1 then
			AddNumText(sceneId,x713575_g_ScriptId,"升级制蛊技能", 12, 1)
		end
		return
end

--**********************************
--检测接受条件
--**********************************
function x713575_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713575_OnAccept( sceneId, selfId, ABILITY_ZHIGU )
end
