--少室山NPC
--丁春秋
--如意小子策划

--脚本号
x002953_g_ScriptId = 002953

--所拥有的事件ID列表
x002953_g_eventList={250507}
--**********************************
--事件列表
--**********************************
function x002953_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  #72这不是"..PlayerName..PlayerSex.."吗，老夫一直觉得，武林中人以刀斧枪棒相互搏杀，实在是残忍无比的事情。如果用毒功伤人，才能让人在平静、安逸、幸福、快乐之中死亡，毒功真是功德无量的武功啊！")
		for i, eventId in x002953_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002953_OnDefaultEvent( sceneId, selfId,targetId )
	x002953_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002953_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002953_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002953_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002953_g_eventList do
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
function x002953_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			x002953_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002953_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002953_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002953_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002953_OnDie( sceneId, selfId, killerId )
end
