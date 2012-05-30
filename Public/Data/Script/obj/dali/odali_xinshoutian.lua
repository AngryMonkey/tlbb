--赵天师

--脚本号
x002030_g_scriptId = 002030


--所拥有的事件ID列表
x002030_g_eventList={210200,210204,210205,210208,210210,210212,210213,210214,210216,210217,210220,210223, 210224, 210225, 210229, 210230, 210232, 210238, 210239, 210237, 210240, 200080, 200083, 200086, 200091, 200094,200095,210241,050022}

--**********************************
--事件列表
--**********************************
function x002030_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)

	local  PlayerName=GetName(sceneId,selfId)
	local  PlayerSex=GetSex(sceneId,selfId)
	local  nLevel=GetLevel(sceneId,selfId)
	
	if PlayerSex == 0 then
		PlayerSex = "妹妹"
	else
		PlayerSex = "兄弟"
	end
	local IsNew = GetMissionFlag( sceneId, selfId, MF_Dialog_01 )
	if IsNew == 0 then
		AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0011}") --#r  在你等级低的时候，你也可以来我这里帮我做些事情，我会给你经验以及金钱等不同的奖励，帮助你成为一个真正的大侠。
		SetMissionFlag( sceneId, selfId, MF_Dialog_01, 1 )
	elseif IsNew == 1 then
		if GetLevel( sceneId, selfId ) >= 10 and GetMenPai( sceneId, selfId ) == MP_WUMENPAI then
			AddText( sceneId, "  "..PlayerName..PlayerSex.."#{OBJ_dali_0054}" )
		else
			AddText( sceneId, "  "..PlayerName..PlayerSex.."#{OBJ_dali_0012}" )
		end
	end

	if nLevel >= 20 then
		AddNumText( sceneId, x002030_g_scriptId, "剧情任务介绍", 11, 10 )
	end

	if nLevel >= 50 then
		AddNumText( sceneId, x002030_g_scriptId, "天下武学", 6, 199 )
		AddNumText( sceneId, x002030_g_scriptId, "天下武学介绍", 11, 200 )
	end

	for i, eventId in x002030_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	
	
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002030_OnDefaultEvent( sceneId, selfId,targetId )
	x002030_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002030_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_073}" )
				AddNumText( sceneId, x002030_g_scriptId, "我现在进行到哪里了？", 11, 11 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end
	
	if GetNumText() == 11 then
		CallScriptFunction( 200098, "DispatchJuqintInfo",sceneId, selfId, targetId )
		return
	end

	--天下武学功能
	if GetNumText() == 198 then
		--检查善恶值
		local gbvalue = LuaFnGetHumanGoodBadValue( sceneId, selfId )
		if gbvalue < 100 then
			BeginEvent( sceneId )
				AddText( sceneId, "您没有足够的善恶值，我还不能把联名推荐信送给你。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end

		--检查任务栏空间
		LuaFnBeginAddItem( sceneId )
			LuaFnAddItem( sceneId, 40002108, 1)
		local retc = LuaFnEndAddItem( sceneId, selfId )
		if 1 ~= retc then
			BeginEvent( sceneId )
				AddText( sceneId, "您任务道具栏位置不够了。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		
		--加推荐信
		BeginAddItem(sceneId)
			AddItem( sceneId,40002108,1)
		local ret = EndAddItem(sceneId,selfId)
		if 1 == ret then
			AddItemListToHuman(sceneId,selfId)
			--扣善恶值
			gbvalue = gbvalue - 100
			LuaFnSetHumanGoodBadValue( sceneId, selfId, gbvalue )
			
			--屏幕中间提示信息
			BeginEvent(sceneId)
				AddText(sceneId,"您得到了联名推荐信")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			--发送特效
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
		end
		return
	end	
	
	--天下武学
	if GetNumText() == 199 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_100}" )
			AddNumText( sceneId, x002030_g_scriptId, "1百善恶值换取1封联名推荐信", 7, 198)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--天下武学介绍
	if GetNumText() == 200 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{function_help_100}" )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end

	for i, findId in x002030_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002030_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002030_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			x002030_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002030_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002030_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002030_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002030_OnDie( sceneId, selfId, killerId )
end

--**********************************
--时钟事件
--**********************************
function x002030_OnCharacterTimer( sceneId, selfId, dataId, nowtime )
--场景号，ObjID，怪物表号，时间值(毫秒)

end





