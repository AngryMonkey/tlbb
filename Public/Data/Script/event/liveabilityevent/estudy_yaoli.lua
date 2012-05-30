--药理技能学习

--脚本号
x713527_g_ScriptId = 713527

--此npc可以升到的最高等级
x713527_g_nMaxLevel = 30

--学习界面要说的话
x713527_g_MessageStudy = "只要你肯花费#{_EXCHG%d}就可以学会药理技能。你决定学习么？"

x713527_g_AbilityName = "药理"

x713527_g_AbilityID = ABILITY_YAOLI

--**********************************
--任务入口函数
--**********************************
function x713527_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, ABILITY_YAOLI)
	--玩家加工技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, ABILITY_YAOLI)
	--任务判断

	--判断是否已经学会了药理,如果学会了,则提示已经学会了
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"你已经学会药理技能了");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--在城市里学习这个技能
	if bid then
		x713527_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--如果点击的是“学习技能”（即参数=0）
	if ButtomNum == 0 then
		
		local tempAbilityId = ABILITY_YAOLI;
		local tempAbilityLevel = 1;
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(tempAbilityId, tempAbilityLevel);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			--AddText(sceneId,x713527_g_MessageStudy)
			local addText = format(x713527_g_MessageStudy, demandMoney);
			AddText(sceneId,addText)
			--确定学习按钮
					AddNumText(sceneId,x713527_g_ScriptId,"我确定要学习", 6, 2)
			--取消学习按钮
					AddNumText(sceneId,x713527_g_ScriptId,"我只是来看看", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--如果点击的是“我确定要学习”
		local tempAbilityId = ABILITY_YAOLI;
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
			SetHumanAbilityLevel(sceneId,selfId,ABILITY_YAOLI,1)
			--在npc聊天窗口通知玩家已经学会了
			BeginEvent(sceneId)
				AddText(sceneId,"你学会了药理技能")
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
function x713527_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, ABILITY_YAOLI, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713527_g_ScriptId,"学习"..x713527_g_AbilityName.."技能", 12, 0) end
			return
		end
		--如果不到等级则不显示选项
		--if GetLevel(sceneId,selfId) >= 10 then
			AddNumText(sceneId,x713527_g_ScriptId,"学习药理技能", 12, 0)
		--end
		return
end

--**********************************
--检测接受条件
--**********************************
function x713527_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713527_OnAccept( sceneId, selfId, ABILITY_YAOLI )
end

--在城市里学习此生活技能时需要执行的函数
function x713527_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--检查城市是否处于低维护状态
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--添加条件显示内容
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, ABILITY_YAOLI, bid, 4)
			local studyMsg = format("如果你达到%d级并且肯花费#{_EXCHG%d}和%d点帮贡就可以学会"..x713527_g_AbilityName.."技能。你决定学习么？", lv, money, con)
			AddText(sceneId,studyMsg)
			--确定学习按钮
					AddNumText(sceneId,x713527_g_ScriptId,"我确定要学习", 6, 2)
			--取消学习按钮
					AddNumText(sceneId,x713527_g_ScriptId,"我只是来看看", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713527_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713527_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end
