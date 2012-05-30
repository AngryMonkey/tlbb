--龚彩云

--脚本号
x002089_g_scriptId = 002089

--所拥有的事件ID列表
x002089_g_eventList={ 808036, 
					  808035, 
					  808058, 
					  808059, 
					  808060, 
					  210242, 
--					  808062, 
					  808063, 
					  210243, 
					  050022, 
					  808074, 
					  808075,
					  808077,
--					 808078,
					  808079,
					  808038,    -- zchw signature
					  889052,
					  889053,
					  808129,    -- 补领干坤袋
					}

--**********************************
--事件列表
--**********************************
function x002089_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	local  strNpcDefault = "#{OBJ_DALI_GONGCAIYUN_DEFAULT}"
	AddText(sceneId, strNpcDefault );
	for i, eventId in x002089_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002089_OnDefaultEvent( sceneId, selfId,targetId )
	x002089_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002089_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002089_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002089_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002089_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--继续（已经接了任务）
--**********************************
function x002089_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

end

--**********************************
--提交已做完的任务
--**********************************
function x002089_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

end

--**********************************
--死亡事件
--**********************************
function x002089_OnDie( sceneId, selfId, killerId )
end
