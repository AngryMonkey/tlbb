--徐惊雷

--脚本号
x113002_g_scriptId = 113002

--所拥有的事件ID列表
x113002_g_eventList={}

--**********************************
--事件列表
--**********************************
function x113002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_JXZ_Y_002}")
		AddNumText(sceneId, x113002_g_scriptId,"送我去洛阳",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x113002_OnDefaultEvent( sceneId, selfId,targetId )
	x113002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x113002_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 0, 209, 200)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x113002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113002_g_eventList do
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
function x113002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			x113002_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x113002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x113002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x113002_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x113002_OnDie( sceneId, selfId, killerId )
end
