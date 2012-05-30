--乔致广

--脚本号
x000126_g_scriptId 				= 000126
x000126_g_shoptableindex 	= 34

--所拥有的事件ID列表
x000126_g_eventList={}

--**********************************
--事件交互入口
--**********************************
function x000126_OnDefaultEvent( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		AddText( sceneId, "#{QZG_80919_1}" )
		AddNumText( sceneId, x000126_g_scriptId, "商人介绍", 11, 1 )
		AddNumText( sceneId, x000126_g_scriptId, "打开商店", 7, 2 )

		for i, eventId in x000126_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
	
end

--**********************************
--事件列表选中一项
--**********************************
function x000126_OnEventRequest( sceneId, selfId, targetId, eventId )
	--特产商店
	if GetNumText() == 1 then
		BeginEvent(sceneId)
			AddText( sceneId, "#{SHANGREN_JIESHAO_02}" )		
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 2 then
		if(LuaFnGetAvailableItemCount(sceneId, selfId, 40002000) == 1 ) then
			DispatchShopItem( sceneId, selfId,targetId, x000126_g_shoptableindex )
		else
			BeginEvent(sceneId)
				AddText( sceneId, "阁下并无商人银票，你我交易从何谈起？" )		
			EndEvent(sceneId)
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
	
	for i, findId in x000126_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x000126_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000126_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			x000126_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000126_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000126_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000126_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000126_OnDie( sceneId, selfId, killerId )
end
