--束河古镇NPC....
--缝纫大师....

--脚本号
x001199_g_ScriptId = 001199

--所拥有的事件Id列表
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--所拥有的事件ID列表
x001199_g_eventList={713506,713565,713605}

x001199_g_shoptableindex = 62

x001199_g_MsgInfo = { "#{SHGZ_0612_16}",
											"#{SHGZ_0620_46}",
											"#{SHGZ_0620_47}",
											"#{SHGZ_0620_48}",
										}

--**********************************
--事件列表
--**********************************
function x001199_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001199_g_MsgInfo))
		AddText(sceneId, x001199_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001199_g_ScriptId, "购买打造图", 7, 31 )          
		AddNumText( sceneId, x001199_g_ScriptId, "#{INTERFACE_XML_1195}", 7, 32 )
		for i, eventId in x001199_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001199_OnDefaultEvent( sceneId, selfId,targetId )
	x001199_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001199_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 31 then
  	DispatchShopItem( sceneId, selfId, targetId, x001199_g_shoptableindex )
  elseif arg == 32 then
  	DispatchShopItem( sceneId, selfId, targetId, 203 )
  	return 0
  end

	for i, findId in x001199_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001199_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001199_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001199_g_eventList do
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
function x001199_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			x001199_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001199_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001199_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001199_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
