-- 范百龄 117026

--脚本号
x117026_g_scriptId = 117026

--所拥有的事件ID列表
x117026_g_eventList={}

--**********************************
--事件列表
--**********************************
function x117026_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_LGS_Y_025}")
	AddNumText(sceneId, x117026_g_scriptId,"离开这里",9,999);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x117026_OnDefaultEvent( sceneId, selfId,targetId )
	x117026_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x117026_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==999	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 14,150,150)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x117026_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117026_g_eventList do
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
function x117026_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			x117026_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x117026_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x117026_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x117026_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x117026_OnDie( sceneId, selfId, killerId )
end
