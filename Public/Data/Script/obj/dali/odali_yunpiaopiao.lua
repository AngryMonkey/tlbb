--云飘飘

--脚本号
x002051_g_scriptId = 002051

x002051_g_shoptableindex=27

--所拥有的事件ID列表
--x002051_g_eventList={210214,210215,210216,210220,210221,210223, 808090, 808091, 806020}	--808090:领取招牌活动	--add by xindefeng
x002051_g_eventList={210214,210215,210216,210220,210221,210223, 808091, 806020}	--808090:领取招牌活动	--add by xindefeng

--**********************************
--事件列表
--**********************************
function x002051_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0029}")
	AddNumText(sceneId,x002051_g_scriptId,"购买珍兽用品",7,0)
	for i, eventId in x002051_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002051_OnDefaultEvent( sceneId, selfId,targetId )
	x002051_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002051_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == 0	then
		DispatchShopItem( sceneId, selfId,targetId, x002051_g_shoptableindex )
	end
	for i, findId in x002051_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002051_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002051_g_eventList do
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
function x002051_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002051_g_eventList do
		if missionScriptId == findId then
			x002051_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002051_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002051_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002051_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002051_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002051_OnDie( sceneId, selfId, killerId )
end

--**********************************
--提交珍兽
--**********************************
function x002051_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
	for i, findId in x002051_g_eventList do
		if scriptId == findId then
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			return
		end
	end
end
