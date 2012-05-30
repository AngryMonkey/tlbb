--黄眉僧

--脚本号
x002007_g_scriptId = 002007

--所拥有的事件ID列表
x002007_g_eventList={210230, 210231, 210232}  --201103,201201,201202,201601,201602,210222

--**********************************
--事件列表
--**********************************
function x002007_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"#{OBJ_dali_0002}");
	for i, eventId in x002007_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	if IsHaveMission(sceneId,selfId,701) > 0 then
		AddNumText(sceneId,x002007_g_scriptId,"前往后花园",10,0)
	end
	if IsHaveMission(sceneId,selfId,711) > 0 then
		AddNumText(sceneId,x002007_g_scriptId,"前往小木人巷",10,1)
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002007_OnDefaultEvent( sceneId, selfId,targetId )
	x002007_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002007_OnEventRequest( sceneId, selfId, targetId, eventId )
	local BackGarden = { [2] = 62, [71] = 82, [72] = 182 }
	local WoodenLane = { [2] = 61, [71] = 50, [72] = 81 }
	local destScene

	if	GetNumText()==0	then
		destScene = BackGarden[sceneId]
		if not destScene then
			destScene = 82
		end

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene, 102, 109)
	elseif	GetNumText()==1	then
		destScene = WoodenLane[sceneId]
		if not destScene then
			destScene = 81
		end

		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene, 82, 76)
	end
	for i, findId in x002007_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002007_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002007_g_eventList do
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
function x002007_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			x002007_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002007_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002007_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002007_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002007_OnDie( sceneId, selfId, killerId )
end
