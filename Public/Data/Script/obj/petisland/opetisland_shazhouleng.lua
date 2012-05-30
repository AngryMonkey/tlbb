--沙洲冷
--脚本号
x112002_g_scriptId = 112002

--所拥有的事件ID列表
x112002_g_eventList={ 250000 }	

--**********************************
--事件列表
--**********************************
function x112002_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"我这边可以收购各种各样的珍兽，你有需要出售的珍兽吗？")
	for i, eventId in x112002_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		
	end
	
	AddNumText( sceneId, x112002_g_scriptId, "珍兽岛收珍兽介绍", 11, 10 )
	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x112002_OnDefaultEvent( sceneId, selfId,targetId )
	x112002_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x112002_OnEventRequest( sceneId, selfId, targetId, eventId )


	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_076}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end

	for i, findId in x112002_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x112002_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x112002_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--继续（已经接了任务）
--**********************************
function x112002_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
 
end

--**********************************
--提交已做完的任务
--**********************************
function x112002_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
 
end

--**********************************
--死亡事件
--**********************************
function x112002_OnDie( sceneId, selfId, killerId )
end

--**********************************
--检测任务接受条件
--**********************************
function x112002_OnMissionCheck( sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
			CallScriptFunction( scriptId, "OnMissionCheck", sceneId, selfId, npcid, scriptId, index1, index2, index3, indexpet )
end
