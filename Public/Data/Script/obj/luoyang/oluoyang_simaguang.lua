--洛阳NPC
--司马光
--普通

--李工部

--脚本号
x000007_g_scriptId = 000007

--所拥有的事件ID列表
x000007_g_eventList={212129,212132}

--**********************************
--事件列表
--**********************************
function x000007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"#{OBJ_luoyang_0004}")
		for i, eventId in x000007_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		-- 领取称号
		if (IsMissionHaveDone(sceneId,selfId, 254) > 0 ) then
			AddNumText(sceneId, x000007_g_scriptId, "领取称号", 6, 999);
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000007_OnDefaultEvent( sceneId, selfId,targetId )
	x000007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000007_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==999  then
		LuaFnAwardTitle( sceneId, selfId,  10, 234)
		SetCurTitle(sceneId, selfId,  10, 234)
		LuaFnDispatchAllTitle(sceneId, selfId)
		return
	end

	for i, findId in x000007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000007_g_eventList do
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
function x000007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000007_g_eventList do
		if missionScriptId == findId then
			x000007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000007_OnDie( sceneId, selfId, killerId )
end
