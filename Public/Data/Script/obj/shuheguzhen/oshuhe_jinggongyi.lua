--束河古镇NPC....
--工艺大师....

--脚本号
x001200_g_ScriptId = 001200

--所拥有的事件Id列表
--estudy_gongyi = 713507
--elevelup_gongyi = 713566
--edialog_gongyi = 713606
--所拥有的事件ID列表
x001200_g_eventList={713507,713566,713606}

x001200_g_shoptableindex = 69

x001200_g_MsgInfo = { "#{SHGZ_0612_17}",
											"#{SHGZ_0620_49}",
											"#{SHGZ_0620_50}",
											"#{SHGZ_0620_51}",
										}

--**********************************
--事件列表
--**********************************
function x001200_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001200_g_MsgInfo))
		AddText(sceneId, x001200_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001200_g_ScriptId, "购买打造图", 7, 32 )
		AddNumText( sceneId, x001200_g_ScriptId, "#{INTERFACE_XML_1196}", 7, 33 )

		for i, eventId in x001200_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001200_OnDefaultEvent( sceneId, selfId,targetId )
	x001200_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001200_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 32 then
  	DispatchShopItem( sceneId, selfId, targetId, x001200_g_shoptableindex )
  elseif arg == 33 then
    DispatchShopItem( sceneId, selfId, targetId, 204 ) 	
    return 0
  end

	for i, findId in x001200_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001200_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001200_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001200_g_eventList do
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
function x001200_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001200_g_eventList do
		if missionScriptId == findId then
			x001200_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001200_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001200_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001200_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001200_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
