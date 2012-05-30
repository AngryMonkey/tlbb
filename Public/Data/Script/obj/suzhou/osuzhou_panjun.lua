--苏州NPC
--潘浚
--一般

x001040_g_scriptId = 001040

--所拥有的事件ID列表
x001040_g_eventList={800115}

--**********************************
--事件列表
--**********************************
function x001040_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	--AddText(sceneId,"  以仇恨解决仇恨，只会带来更多的仇恨，你确认要开启仇杀么，那么你也将受到严厉的惩罚。")	
	for i, eventId in x001040_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	
	AddNumText( sceneId, x001040_g_scriptId, "决斗介绍", 11, 10 )
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001040_OnDefaultEvent( sceneId, selfId,targetId )
	x001040_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001040_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_068}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	for i, findId in x001040_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end
