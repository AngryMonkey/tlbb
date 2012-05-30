--丐帮NPC
--掌门人
--宋长老
--普通

x010005_g_scriptId = 010005
x010005_g_eventList = {229009,229012,808092}

--**********************************
--事件交互入口
--**********************************
function x010005_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"丐帮想要发展壮大，还真不能只招收乞丐。我最近收了一个弟子，他以前是个和尚。")
		for i, findId in x010005_g_eventList do
			CallScriptFunction( x010005_g_eventList[i], "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件列表选中一项
--**********************************
function x010005_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x010005_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, MP_GAIBANG )
			return
		end
	end
end

