--苏州NPC		惩凶打图
--吴玠
--脚本号

x001058_g_ScriptId = 001058


--所拥有的事件ID列表
x001058_g_eventList={229020}

--**********************************

--事件列表

--**********************************

function x001058_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  凶徒四处作乱，你能不能帮我惩治他们？打败凶徒也许能得到藏宝图哦。")
	
	AddNumText( sceneId, x001058_g_ScriptId, "惩凶任务介绍", 11, 10 )
	
	for i, eventId in x001058_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end



--**********************************

--事件交互入口

--**********************************

function x001058_OnDefaultEvent( sceneId, selfId,targetId )

	x001058_UpdateEventList( sceneId, selfId, targetId )

end



--**********************************
--事件列表选中一项
--**********************************
function x001058_OnEventRequest( sceneId, selfId, targetId, eventId )

	if GetNumText() == 10 then
			BeginEvent(sceneId)	
					
				AddText( sceneId, "#{function_help_072}" )
								
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
	end


	for i, findId in x001058_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001058_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001058_g_eventList do
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
function x001058_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			x001058_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001058_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001058_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001058_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001058_OnDie( sceneId, selfId, killerId )
end
