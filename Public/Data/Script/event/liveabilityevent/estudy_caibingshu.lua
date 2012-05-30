--采冰术技能学习

--脚本号
x713532_g_ScriptId = 713532

--此npc可以升到的最高等级
x713532_g_nMaxLevel = 30

--学习界面要说的话
x713532_g_MessageStudy = "只要你肯花费#{_EXCHG%d}就可以学会采冰术技能。你决定学习么？"


--**********************************
--任务入口函数
--**********************************
function x713532_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_CAIBINGSHU)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_CAIBINGSHU)
	--任务判断

	--判断是否是天山派弟子,不是天山弟子不能学习
		if GetMenPai(sceneId,selfId) ~= MP_TIANSHAN then
			BeginEvent(sceneId)
        		AddText(sceneId,"你不是本派弟子，我不能教你。");
        	EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
	--判断是否已经学会了采冰术,如果学会了,则提示已经学会了
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"你已经学会采冰术技能了");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--如果点击的是“学习技能”（即参数=0）
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_CAIBINGSHU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713532_g_MessageStudy)
			local addText = format(x713532_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--确定学习按钮
					AddNumText(sceneId,x713532_g_ScriptId,"我确定要学习", 6, 2)
			--取消学习按钮
					AddNumText(sceneId,x713532_g_ScriptId,"我只是来看看", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--如果点击的是“我确定要学习”
		local tempAbilityId = ABILITY_CAIBINGSHU;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			--检查玩家是否有一个银币的现金
			if GetMoney(sceneId,selfId)+GetMoneyJZ(sceneId,selfId) < demandMoney then			
				BeginEvent(sceneId)
					AddText(sceneId,"你的金钱不足");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--检查玩家等级是否达到要求
			if GetLevel(sceneId,selfId) < limitLevel then
				BeginEvent(sceneId)
					AddText(sceneId,"你的等级不够");
					EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
				return
			end
			--删除金钱
			LuaFnCostMoneyWithPriority(sceneId,selfId,demandMoney)
			--技能提升到1
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_CAIBINGSHU,1)
			--在npc聊天窗口通知玩家已经学会了
			BeginEvent(sceneId)
				AddText(sceneId,"你学会了采冰术技能")
			EndEvent( )
			DispatchEventList(sceneId,selfId,targetId)
		end
	else --如果点击“我只是来看看”
		CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
end

--**********************************
--列举事件
--**********************************
function x713532_OnEnumerate( sceneId, selfId, targetId )
		--如果不到等级则不显示选项
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713532_g_ScriptId,"学习采冰术技能", 12, 0)
		--end
		return
end

--**********************************
--检测接受条件
--**********************************
function x713532_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713532_OnAccept( sceneId, selfId, ABILITY_CAIBINGSHU )
end
