--西湖NPC
--老顾
--普通

--脚本号
x001062_g_scriptId = 001062

--所拥有的事件ID列表
x001062_g_eventList={200011,200014}


--**********************************
--事件交互入口
--**********************************
function x001062_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  沿这条路一直走就能到燕子坞。")

		for i, eventId in x001062_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
-- 选中一项
--**********************************
function x001062_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001062_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

end
