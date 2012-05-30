--采矿技能学习

--脚本号
x713508_g_ScriptId = 713508

--学习界面要说的话
x713508_g_MessageStudy = "如果你达到%d级并且肯花费#{_EXCHG%d}就可以学会采矿技能。你决定学习么？"

--技能编号
x713508_g_AbilityID = ABILITY_CAIKUANG

--技能名称
x713508_g_AbilityName = "采矿"

--**********************************
--任务入口函数
--**********************************
function x713508_OnDefaultEvent( sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid )
	--玩家技能的等级
	AbilityLevel = QueryHumanAbilityLevel(sceneId, selfId, x713508_g_AbilityID)
	--玩家采矿技能的熟练度
	ExpPoint = GetAbilityExp(sceneId, selfId, x713508_g_AbilityID)
	--任务判断

	--判断是否已经学会了采矿,如果学会了,则提示已经学会了
	if AbilityLevel >= 1 then
		BeginEvent(sceneId)
        	AddText(sceneId,"你已经学会"..x713508_g_AbilityName.."技能了");
        	EndEvent(sceneId)
        DispatchMissionTips(sceneId,selfId)
		return
	end

	--在城市里学习这个技能
	if bid then
		x713508_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
		return
	end

	--如果点击的是“学习技能”（即参数=0）
	if ButtomNum == 0 then
		
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_CAIKUANG, 1);
		if ret and ret == 1 then
			BeginEvent(sceneId)
			local addText = format(x713508_g_MessageStudy, limitLevel, demandMoney);
			AddText(sceneId,addText)
			--确定学习按钮
					AddNumText(sceneId,x713508_g_ScriptId,"我确定要学习", 6, 2)
			--取消学习按钮
					AddNumText(sceneId,x713508_g_ScriptId,"我只是来看看", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
	elseif ButtomNum == 2 then			--如果点击的是“我确定要学习”
		local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_CAIKUANG, 1);
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
			SetHumanAbilityLevel(sceneId,selfId,x713508_g_AbilityID,1)
			--在npc聊天窗口通知玩家已经学会了
			BeginEvent(sceneId)
				AddText(sceneId,"你学会了"..x713508_g_AbilityName.."技能")
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
function x713508_OnEnumerate( sceneId, selfId, targetId, bid )
		if bid then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713508_g_AbilityID, bid, 5)
			if ret > 0 then AddNumText(sceneId,x713508_g_ScriptId,"学习"..x713508_g_AbilityName.."技能", 12, 0) end
			return
		end
	--如果不到等级则不显示选项
	--if GetLevel(sceneId,selfId) >= LEVELUP_ABILITY_CAIKUANG[1].HumanLevelLimit then
	local ret, demandMoney, demandExp, limitAbilityExp, limitAbilityExpShow, currentLevelAbilityExpTop, limitLevel = LuaFnGetAbilityLevelUpConfig(ABILITY_CAIKUANG, 1);
	--if ret and ret == 1 and GetLevel(sceneId,selfId) >= limitLevel then
	if ret and ret == 1 then
		AddNumText(sceneId,x713508_g_ScriptId,"学习"..x713508_g_AbilityName.."技能", 12, 0)
	end
	return
end

--**********************************
--检测接受条件
--**********************************
function x713508_CheckAccept( sceneId, selfId )
end

--**********************************
--接受
--**********************************
function x713508_OnAccept( sceneId, selfId, x713508_g_AbilityID )
end

--在城市里学习此生活技能时需要执行的函数
function x713508_StudyInCity(sceneId, selfId, targetId, ButtomNum,g_Npc_ScriptId,bid)
	if bid then
		if 0 == ButtomNum then
			--检查城市是否处于低维护状态
			if CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "CheckCityStatus",sceneId, selfId,targetId) < 0 then
				return
			end
			--添加条件显示内容
			BeginEvent(sceneId)
			local lv,money,con
			lv,money,con = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713508_g_AbilityID, bid, 4)
			local studyMsg = format("如果你达到%d级并且肯花费#{_EXCHG%d}和%d点帮贡就可以学会"..x713508_g_AbilityName.."技能。你决定学习么？", lv, money, con)
			AddText(sceneId,studyMsg)
			--确定学习按钮
					AddNumText(sceneId,x713508_g_ScriptId,"我确定要学习", 6, 2)
			--取消学习按钮
					AddNumText(sceneId,x713508_g_ScriptId,"我只是来看看", 8, 3)
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		elseif 2 == ButtomNum then
			local ret = CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityCheck",sceneId, selfId, x713508_g_AbilityID, bid, 1)
			if ret > 0 then
				CallScriptFunction( CITY_BUILDING_ABILITY_SCRIPT, "OnCityAction",sceneId, selfId, targetId, x713508_g_AbilityID, bid, 1)
			end
		else
			CallScriptFunction( g_Npc_ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end
