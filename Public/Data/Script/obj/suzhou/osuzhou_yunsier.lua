--云思儿

--脚本号
x001083_g_scriptId = 001083

--商店编号
x001083_g_shoptableindex=102

--所拥有的事件ID列表
x001083_g_eventList={400918, 400963}	--	去玄武岛、去圣兽山}	

--**********************************
--事件列表
--**********************************
function x001083_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{YXZ_80917_01}")
	
	--AddNumText( sceneId, x001083_g_scriptId, "免费无敌", 6, 10 )	--去除免费无敌功能--del by Heanqi
	
	for i, eventId in x001083_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	AddNumText(sceneId,x001083_g_scriptId,"购买宠物技能书",7,2)
--	AddNumText(sceneId,x001083_g_scriptId,"查询珍兽成长率",6,3)
--	AddNumText(sceneId,x001083_g_scriptId,"灵兽丹合成",6,4)
	AddNumText(sceneId,x001083_g_scriptId,"#{XXWD_8916_07}",11,5)
--	AddNumText(sceneId,x001083_g_scriptId,"灵兽丹合成介绍",11,6)
--	AddNumText(sceneId,x001083_g_scriptId,"如何给珍兽快速升级",11,7)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001083_OnDefaultEvent( sceneId, selfId,targetId )
	x001083_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001083_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001083_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	if GetNumText() == 2 then
		DispatchShopItem( sceneId, selfId,targetId, x001083_g_shoptableindex )
--	elseif GetNumText() == 3 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "  查询珍兽的成长率，查询一次需要收取#{_MONEY100}的费用。" )
--		AddNumText( sceneId, x001083_g_scriptId, "确定", -1, 4 )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
--	elseif GetNumText() == 4 then
--		BeginUICommand( sceneId )
--			UICommand_AddInt( sceneId, targetId )
--			UICommand_AddInt( sceneId, 6 )				--珍兽查询分支
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 3 )	--调用珍兽界面
	elseif GetNumText() == 4 then --灵兽丹合成
--		BeginUICommand( sceneId )
--			UICommand_AddInt( sceneId, targetId )
--		EndUICommand( sceneId )
--		DispatchUICommand( sceneId, selfId, 19824 )	--调用灵兽丹合成界面
	elseif GetNumText() == 5 then
		BeginEvent( sceneId )
		AddText( sceneId, "#{XXWD_8916_08}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 6 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "#{JNHC_81015_12}" )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 7 then
--		BeginEvent( sceneId )
--		AddText( sceneId, "#{ZSKSSJ_081126_5}" )
--		EndEvent( sceneId )
--		DispatchEventList( sceneId, selfId, targetId )
	end
	if GetNumText() == 10 then
	    if eventId == x001083_g_scriptId then	
			--LuaFnSendSpecificImpactToUnit( sceneId, selfId, selfId, selfId, 50, 0 )	--去除免费无敌功能--del by Heanqi
			return
		end
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x001083_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001083_g_eventList do
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
function x001083_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			x001083_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001083_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001083_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001083_OnDie( sceneId, selfId, killerId )
end

--**********************************
--提交珍兽
--**********************************
function x001083_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
--注意，这里这样写省略了在eventlist中搜索scriptId这一部分，可能会有问题
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end
