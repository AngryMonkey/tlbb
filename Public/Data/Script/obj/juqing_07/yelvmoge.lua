-- 苍茫山 121005

--脚本号
x121005_g_scriptId = 121005

--所拥有的事件ID列表
x121005_g_eventList={}

--**********************************
--事件列表
--**********************************
function x121005_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_CMS_Y_004}")
		AddNumText(sceneId, x121005_g_scriptId,"送我去雁南",9,1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x121005_OnDefaultEvent( sceneId, selfId,targetId )
	x121005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x121005_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 18, 128, 51)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x121005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121005_g_eventList do
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
function x121005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			x121005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x121005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x121005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x121005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x121005_OnDie( sceneId, selfId, killerId )
end
