--寇封

--脚本号
x018001_g_scriptId = 018001


--所拥有的事件ID列表
x018001_g_eventList={}--210902}

--**********************************
--事件列表
--**********************************
function x018001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  宦官监军马承倩总是在雁门集市上抢夺百姓的东西，他手下的宦官将军骆奉先还经常带兵去抢劫契丹平民百姓，管这叫“打草谷”，有时候，还打汉族百姓的草谷。时间一长，我们的军队在百姓心目中有如恶鬼。")
	for i, eventId in x018001_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x018001_OnDefaultEvent( sceneId, selfId,targetId )
	x018001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x018001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x018001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x018001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
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
function x018001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			x018001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x018001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x018001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x018001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x018001_OnDie( sceneId, selfId, killerId )
end
