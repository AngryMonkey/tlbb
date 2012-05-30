--李工部

--脚本号
x002033_g_scriptId = 002033


--所拥有的事件ID列表
x002033_g_eventList={210233,210234,210235,210236,212128,212129,212130,212134}

--**********************************
--事件列表
--**********************************
function x002033_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0015}")
	for i, eventId in x002033_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end

		-- 领取称号
		if (IsMissionHaveDone(sceneId,selfId, 256) > 0 ) then
			AddNumText(sceneId, x002033_g_scriptId, "领取称号", 6, 999);
		end

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002033_OnDefaultEvent( sceneId, selfId,targetId )
	x002033_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002033_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText()==999  then
		LuaFnAwardTitle( sceneId, selfId,  12, 236)
		SetCurTitle(sceneId, selfId,  12, 236)
		LuaFnDispatchAllTitle(sceneId, selfId)
		return
	end

	for i, findId in x002033_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002033_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002033_g_eventList do
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
function x002033_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002033_g_eventList do
		if missionScriptId == findId then
			x002033_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002033_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002033_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002033_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002033_OnDie( sceneId, selfId, killerId )
end
