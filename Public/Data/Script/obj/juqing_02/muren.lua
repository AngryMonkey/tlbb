--万劫谷木人守卫

--脚本号
x118001_g_scriptId = 118001

--所拥有的事件ID列表
x118001_g_eventList={}

--**********************************
--事件列表
--**********************************
function x118001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{JQ_WJG_B_002}")
		AddNumText(sceneId, x118001_g_scriptId,"送我进去",9,0);
		AddNumText(sceneId, x118001_g_scriptId,"送我去大理",9,1);

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x118001_OnDefaultEvent( sceneId, selfId,targetId )
	x118001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x118001_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, sceneId,104,77)
	elseif GetNumText()==1	then
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,74,53)
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x118001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
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
function x118001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			x118001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x118001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x118001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x118001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x118001_OnDie( sceneId, selfId, killerId )
end
