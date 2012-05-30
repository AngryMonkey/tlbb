--束河古镇NPC....
--烹饪大师....

--脚本号
x001188_g_ScriptId = 001188

--所拥有的事件Id列表
--elevelup_pengren = 713561
--edialog_pengren = 713601
--所拥有的事件ID列表
x001188_g_eventList={713561,713601}

x001188_g_MsgInfo = { "#{SHGZ_0612_10}",
											"#{SHGZ_0620_28}",
											"#{SHGZ_0620_29}",
											"#{SHGZ_0620_30}",
										}

--**********************************
--事件列表
--**********************************
function x001188_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local msgidx = random(getn(x001188_g_MsgInfo))
	AddText(sceneId, x001188_g_MsgInfo[msgidx])
	for i, eventId in x001188_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001188_OnDefaultEvent( sceneId, selfId,targetId )
	x001188_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001188_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x001188_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001188_g_ScriptId )
		return
	end
end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001188_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId,ABILITY_PENGREN )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x001188_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			x001188_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001188_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001188_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001188_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
