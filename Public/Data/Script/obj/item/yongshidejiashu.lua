--勇士的家书

--脚本号
x300000_g_scriptId = 300000


--所拥有的事件ID列表
x300000_g_eventList={212112}--212112

--**********************************
--事件交互入口
--**********************************
function x300000_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId, "勇士的家书")
		for i, eventId in x300000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, -1 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
	
end

--**********************************
--刷新事件
--**********************************
function x300000_OnEventRequest( sceneId, selfId, targetId, eventId )
end

--**********************************
--接受此NPC的任务
--**********************************
function x300000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x300000_g_eventList do
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
function x300000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x300000_g_eventList do
		if missionScriptId == findId then
			x300000_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

function x300000_IsSkillLikeScript( sceneId, selfId)
	return 0;
end
