--石林  可怕的真相

--脚本号

x300018_g_scriptId = 300018

--所拥有的事件ID列表
x300018_g_eventList={212104}

--**********************************
--事件交互入口
--**********************************
function x300018_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId, "可怕的真相")
		for i, eventId in x300018_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, -1 )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--刷新事件
--**********************************
function x300018_OnEventRequest( sceneId, selfId, targetId, eventId )
end

--**********************************
--接受此NPC的任务
--**********************************
function x300018_OnMissionAccept( sceneId, selfId, targetId )
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x300018_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x300018_g_eventList do
		if missionScriptId == findId then
			x300018_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

function x300018_IsSkillLikeScript( sceneId, selfId)
	return 0;
end

