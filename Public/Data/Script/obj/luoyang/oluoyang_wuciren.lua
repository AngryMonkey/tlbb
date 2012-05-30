--NPC
--
--脚本号
x000149_g_scriptId = 000149

--所拥有的事件ID列表
x000149_g_eventList={500600}

--普通

--**********************************
--事件交互入口
--**********************************
function x000149_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)

--**********************************
--NPC对话
--**********************************
		AddText(sceneId,"  在家靠父母，出门靠朋友。行走江湖个人修为自然重要，但有几个关系亲密的朋友却是必不可少的。或是志趣相投的好友，或是义结金兰的兄弟，或是同门同派的熟人。莫大的江湖，你总能找到几个可以携手同游、共同进退的知己。刀剑齐鸣，共赴江湖恩仇，岂非人生第一大快事！")
		
		for i, eventId in x000149_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x000149_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x000149_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000149_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x000149_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			x000149_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000149_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000149_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000149_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000149_OnDie( sceneId, selfId, killerId )
end
