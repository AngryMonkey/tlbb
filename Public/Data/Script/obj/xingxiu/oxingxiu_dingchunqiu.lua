--星宿NPC
--掌门人
--丁春秋
--普通

x016000_g_scriptId = 016000        
x016000_g_eventList={229009,229012,808092}

--**********************************
--事件交互入口
--**********************************
function x016000_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  老夫一直觉得，武林中人以刀斧枪棒相互搏杀，实在是残忍无比的事情。如果用毒功伤人，才能让人在平静、安逸、幸福、快乐之中死亡。所以这毒功真是功德无量的武功啊。")
		
		for i, eventId in x016000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件列表选中一项
--**********************************
function x016000_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x016000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_XINGSU )
			return
		end
	end
end
