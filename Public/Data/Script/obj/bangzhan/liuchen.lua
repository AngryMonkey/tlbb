--帮战副本NPC B帮
--神医 琉宸
--普通

--脚本号
x402299_g_scriptId = 402299

--所拥有的事件ID列表
x402299_g_eventList={701603}

--游医脚本编号
x402299_g_healScriptId = 000064

--治疗设定 参见脚本000064

--**********************************
--事件列表
--**********************************
function x402299_UpdateEventList( sceneId, selfId, targetId )
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 1 then
		BeginEvent(sceneId)
			AddText(sceneId,"#{BHXZ_081103_23}")
			AddNumText(sceneId,x402299_g_scriptId,"治疗",6,0)
		EndEvent(sceneId)
		for i, eventId in x402299_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		BeginEvent(sceneId);
			AddText( sceneId, "#{BHXZ_081103_20}" );
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
	end
end

--**********************************
--事件交互入口
--**********************************
function x402299_OnDefaultEvent( sceneId, selfId,targetId )
	x402299_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x402299_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
	
	if CallScriptFunction(402047, "IsCommonBGuild", sceneId, selfId ) == 0 then
		return
	end

	local	key	= GetNumText()

	if key == 1000 then	--不愿再治疗
		BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
		EndUICommand( sceneId )
		DispatchUICommand( sceneId, selfId, 1000 )
		return
	end
	if key == 1001 then	--确认要治疗
		gld =CallScriptFunction( x402299_g_healScriptId, "CalcMoney_hpmp",sceneId, selfId, targetId )* 0.1
		local money = GetMoney( sceneId, selfId )
		local JiaoZi = GetMoneyJZ( sceneId, selfId )
		gld = floor(gld)

		if money+JiaoZi < gld then
			BeginEvent( sceneId )
				AddText( sceneId, "#{BHXZ_081103_85}" )
				EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		else
			local jz, jb = LuaFnCostMoneyWithPriority(sceneId, selfId, gld);
			if jz ~= -1 then
				CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			end
		end
		return
	end
	
	--加血
	if key == 0 then
		if GetHp( sceneId, selfId ) == GetMaxHp( sceneId, selfId ) and
		GetRage( sceneId, selfId ) == GetMaxRage( sceneId, selfId ) and
		GetMp( sceneId, selfId ) == GetMaxMp( sceneId, selfId ) then
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_86}" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			
			--取消指定玩家身上的所有敌对可驱散驻留效果
			LuaFnDispelAllHostileImpacts( sceneId, selfId )
			return
		end
	
		if gld <= 0 then
			CallScriptFunction( x402299_g_healScriptId, "Restore_hpmp",sceneId, selfId, targetId )
			--x402299_Restore_hpmp( sceneId, selfId, targetId )
		else
			BeginEvent( sceneId )
			AddText( sceneId, "#{BHXZ_081103_87}#{_EXCHG"..gld.."}#{BHXZ_081103_88}" )
			AddNumText( sceneId, x402299_g_scriptId, "是", -1, 1001 )
			AddNumText( sceneId, x402299_g_scriptId, "否", -1, 1000 )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	else
		for i, findId in x402299_g_eventList do
			if eventId == findId then
				CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()是addnumtext中最后的变量
				return
			end
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x402299_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
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
function x402299_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			x402299_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x402299_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x402299_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x402299_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x402299_OnDie( sceneId, selfId, killerId )
end
