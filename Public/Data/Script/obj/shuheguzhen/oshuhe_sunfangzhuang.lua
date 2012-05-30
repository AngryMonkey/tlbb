--束河古镇NPC....
--钓鱼大师....

--脚本号
x001198_g_ScriptId = 001198


--所拥有的事件Id列表
--estudy_diaoyu = 713510
--elevelup_diaoyu = 713569
--edialog_diaoyu = 713609
--所拥有的事件ID列表
x001198_g_eventList={713510,713569,713609}

x001198_g_shoptableindex = 73

x001198_g_MsgInfo = { "#{SHGZ_0612_15}",
											"#{SHGZ_0620_43}",
											"#{SHGZ_0620_44}",
											"#{SHGZ_0620_45}",
										}

--**********************************
--事件列表
--**********************************
function x001198_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001198_g_MsgInfo))
		AddText(sceneId, x001198_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001198_g_ScriptId, "购买工具", 7, 30 )
		for i, eventId in x001198_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001198_OnDefaultEvent( sceneId, selfId,targetId )
	x001198_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001198_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 30 then
  	DispatchShopItem( sceneId, selfId, targetId, x001198_g_shoptableindex )
  	return 0
  end

	for i, findId in x001198_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001198_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001198_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001198_g_eventList do
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
function x001198_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			x001198_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001198_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001198_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001198_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
