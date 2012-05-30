-- 范百灵 116004

--脚本号
x116004_g_scriptId = 116004

--所拥有的事件ID列表
x116004_g_eventList={}

--**********************************
--事件列表
--**********************************
function x116004_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"#{JQ_LGS_B_004}")
	AddNumText(sceneId, x116004_g_scriptId,"离开这里",9,999);
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x116004_OnDefaultEvent( sceneId, selfId,targetId )
	x116004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x116004_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==999	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 14,150,150)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x116004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x116004_g_eventList do
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
function x116004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x116004_g_eventList do
		if missionScriptId == findId then
			x116004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x116004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x116004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x116004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x116004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x116004_OnDie( sceneId, selfId, killerId )
end
