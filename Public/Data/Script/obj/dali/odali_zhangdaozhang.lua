--大理NPC
--张道长
--普通

x002075_g_ScriptId	= 002075

--咫尺天涯(技能编号、技能名称、消耗金钱)
x002075_g_Ability				= {}
x002075_g_Ability["aid"]= 39
x002075_g_Ability["nam"]= "咫尺天涯"
x002075_g_Ability["gld"]= 300000		--30G
x002075_g_LevMax				= 3					--可学习的最高等级

--操作集
x002075_g_Key				= {}
x002075_g_Key["nul"]= 0		--啥都没做
x002075_g_Key["stu"]= 1		--学习技能
x002075_g_Key["sty"]= 101	--确定学习
x002075_g_Key["stn"]= 100	--放弃学习
x002075_g_Key["lup"]= 2		--升级技能
x002075_g_Key["upy"]= 201	--确定升级
x002075_g_Key["upn"]= 200	--放弃升级
x002075_g_Key["des"]= 3		--定位符介绍


--**********************************
--事件交互入口
--**********************************
function x002075_OnDefaultEvent( sceneId, selfId, targetId )
	local	lev	= QueryHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"] )
	BeginEvent( sceneId )
		AddText( sceneId, "  我可以传授给你一种神奇的技能，利用这种技能制作出来的符文可以记录位置信息，以后你想再回到这个记录的地方，只要使用符文就可以了。" )
		AddText( sceneId, "  请注意，越高级的符文可以使用的次数也会越来越多。" )
		if GetLevel( sceneId, selfId ) >= 30 then
			if lev <= 0 then
				AddNumText( sceneId, x002075_g_ScriptId, "学习"..x002075_g_Ability["nam"], 6, x002075_g_Key["stu"] )
			else
				AddNumText( sceneId, x002075_g_ScriptId, "升级技能", 6, x002075_g_Key["lup"] )
			end			
			AddNumText( sceneId, x002075_g_ScriptId, "什么也不做", -1, x002075_g_Key["nul"] )
		end
		AddNumText( sceneId, x002075_g_ScriptId, "定位符介绍", 11, x002075_g_Key["des"] )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002075_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	key	= GetNumText()
	local	lev	= QueryHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"] )
	local exp = GetAbilityExp( sceneId, selfId, x002075_g_Ability["aid"] )	--熟练度
	local ret, demandMoney, _, limitAbilityExp, limitAbilityExpShow, _, limitLevel
		= LuaFnGetAbilityLevelUpConfig( x002075_g_Ability["aid"], lev + 1 )

	--定位符介绍
	if key == x002075_g_Key["des"]	then

		x002075_MsgBox( sceneId, selfId, targetId, "#{function_help_020}" )

	--学习技能
	elseif key == x002075_g_Key["stu"]	then
	
		if GetLevel( sceneId, selfId ) < 30 then--非法情况走到这里，也不需要提示了
			return 0
		end

		x002075_OnAsk( sceneId, selfId, targetId, x002075_g_Key["stu"], "  您学习这项技能需要消耗#{_EXCHG" .. demandMoney .. "}，是否继续？" )
	
	--确定学习
	elseif key == x002075_g_Key["sty"] then
	
		if GetLevel( sceneId, selfId ) < 30 then--非法情况走到这里，也不需要提示了
			return 0
		end

		if lev > 0 then
			x002075_MsgBox( sceneId, selfId, targetId, "  您已经学习过此技能了！" )
			return 0
		end

		if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < demandMoney then
			x002075_MsgBox( sceneId, selfId, targetId, "  您身上的现金不足，无法学习此技能！" )
			return 0
		end

		LuaFnCostMoneyWithPriority( sceneId, selfId, demandMoney )
		SetHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"], 1 )
		x002075_SetMyPrescription( sceneId, selfId, 1 )
		x002075_MsgBox( sceneId, selfId, targetId, "  恭喜您已经学会了"..x002075_g_Ability["nam"].."，不过如果想制作使用次数更多的定位符，请升级您的技能。" )

	--升级技能
	elseif key == x002075_g_Key["lup"] then
		if GetLevel( sceneId, selfId ) < 30 then--非法情况走到这里，也不需要提示了
			return 0
		end
		
		if lev >= x002075_g_LevMax then
			x002075_MsgBox( sceneId, selfId, targetId, "  您的技能等级已经足够，不需要再次升级。" )
			return 0
		end
		x002075_OnAsk( sceneId, selfId, targetId, x002075_g_Key["lup"], "  您升级这项技能需要消耗#{_EXCHG" .. demandMoney .. "}，是否继续？" )

	--确定升级
	elseif key == x002075_g_Key["upy"] then
		if ret ~= 1 then
			return 0
		end
		
		if GetLevel( sceneId, selfId ) < 30 then--非法情况走到这里，也不需要提示了
			return 0
		end

		if lev < 1 then
			x002075_MsgBox( sceneId, selfId, targetId, "  您还没有学习"..x002075_g_Ability["nam"].."，等学会了1级技能之后再找我升级吧。" )
			return 0
		end

		if lev >= x002075_g_LevMax then
			x002075_MsgBox( sceneId, selfId, targetId, "  您的技能等级已经足够，不需要再次升级。" )
			return 0
		end

		if exp < limitAbilityExp then
			x002075_MsgBox( sceneId, selfId, targetId, "  需要" .. limitAbilityExpShow .. "点熟练度才能再次升级。" )
			return 0
		end

		if LuaFnGetMoney( sceneId, selfId )+GetMoneyJZ( sceneId, selfId ) < demandMoney then
			x002075_MsgBox( sceneId, selfId, targetId, "  需要#{_EXCHG" .. demandMoney .. "}才能再次升级。" )
			return 0
		end

		--升级此技能
		LuaFnCostMoneyWithPriority( sceneId, selfId, demandMoney )
		SetHumanAbilityLevel( sceneId, selfId, x002075_g_Ability["aid"], lev+1 )
		x002075_SetMyPrescription( sceneId, selfId, lev+1 )
		x002075_MsgBox( sceneId, selfId, targetId, "  您的技能已经成功的升级，恭喜您可以制造更高级的符文了。" )

	else
		
		--关闭界面		
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )

	end

	return 1
end

--**********************************
--设置相应等级的配方
--**********************************
function x002075_SetMyPrescription( sceneId, selfId, lev )
	--每个等级对应6种配方：红色、蓝色、白色、绿色、黄色、紫色
	for i=0, 5 do
		SetPrescription( sceneId, selfId, 510+(lev-1)*6+i, 1 )
	end
end

--**********************************
--询问是否这样做
--**********************************
function x002075_OnAsk( sceneId, selfId, targetId, key, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
		AddNumText( sceneId, x002075_g_ScriptId, "是", -1, key*100+1 )
		AddNumText( sceneId, x002075_g_ScriptId, "否", -1, key*100 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002075_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
