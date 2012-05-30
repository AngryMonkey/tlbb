--萧蔷

--脚本号
x020003_g_scriptId = 020003

--所拥有的事件ID列表
x020003_g_eventList={212125}--211102,211103,211104,211107,211106}	--211108,211105

--**********************************
--事件列表
--**********************************
function x020003_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	local IsStepDone1 = IsHaveMission(sceneId,selfId,542)
	local IsStepDone2 = IsHaveMission(sceneId,selfId,543)
	local IsStepDone3 = IsHaveMission(sceneId,selfId,544)
	local IsStepDone4 = IsHaveMission(sceneId,selfId,548)
	
	--完成“灵魂的呼唤”任务之后
	if IsStepDone4 == 1 then
		AddText(sceneId,"  "..PlayerName.."#{OBJ_caoyuan_0004}")
	--没有完成“郡主的命令”、“马匪首领”、“英雄的证明”任务之前
	elseif IsStepDone1 == 0 and IsStepDone2 == 0 and IsStepDone3 == 0 then
		AddText(sceneId,"  你就是"..PlayerName.." ？#r  哥哥从#G雁北#W来信说你是个英雄，让我好好招待。我看你也不是很像个英雄嘛。")
	--完成“灵魂的呼唤”任务之前
	else
		AddText(sceneId,"  我可不是别人说什么我就信什么的人哦，你如果真的是英雄，我自然会好好的款待你。")
	end
	for i, eventId in x020003_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x020003_OnDefaultEvent( sceneId, selfId,targetId )
	x020003_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x020003_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x020003_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x020003_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x020003_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x020003_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x020003_g_eventList do
		if missionScriptId == findId then
			x020003_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x020003_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x020003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x020003_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x020003_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x020003_OnDie( sceneId, selfId, killerId )
end
