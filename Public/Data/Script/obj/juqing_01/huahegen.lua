--万劫谷华和艮

--脚本号
x119005_g_scriptId = 119005

--所拥有的事件ID列表
x119005_g_eventList={}

--**********************************
--事件列表
--**********************************
function x119005_UpdateEventList( sceneId, selfId,targetId )
	
	--PrintStr("ddd")

	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_Y_001}")
		AddNumText(sceneId, x119005_g_scriptId,"送我到门口去",9,-1);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x119005_OnDefaultEvent( sceneId, selfId,targetId )
	x119005_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x119005_OnEventRequest( sceneId, selfId, targetId, eventId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,109,115)
end

--**********************************
--接受此NPC的任务
--**********************************
function x119005_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119005_g_eventList do
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
function x119005_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			x119005_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x119005_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x119005_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x119005_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x119005_OnDie( sceneId, selfId, killerId )
end
