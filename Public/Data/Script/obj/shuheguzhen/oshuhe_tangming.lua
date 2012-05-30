--束河古镇NPC....
--铸造技能大师....

--脚本号
x001181_g_ScriptId = 001181

--所拥有的事件Id列表
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--所拥有的事件ID列表
x001181_g_eventList={713505,713564,713604}

x001181_g_shoptableindex = 64

x001181_g_MsgInfo = { "#{SHGZ_0612_06}",
											"#{SHGZ_0620_16}",
											"#{SHGZ_0620_17}",
											"#{SHGZ_0620_18}",
										}

--**********************************
--事件列表
--**********************************
function x001181_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001181_g_MsgInfo))
		AddText(sceneId, x001181_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001181_g_ScriptId, "购买打造图", 7, 27 )           
		AddNumText( sceneId, x001181_g_ScriptId, "#{INTERFACE_XML_1194}", 7, 28 )
		for i, eventId in x001181_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001181_OnDefaultEvent( sceneId, selfId,targetId )
	x001181_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001181_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 27 then
  	DispatchShopItem( sceneId, selfId, targetId, x001181_g_shoptableindex )
  elseif arg == 28 then
  	DispatchShopItem( sceneId, selfId, targetId, 202 ) 
	 	return 0
  end

	for i, findId in x001181_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001181_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001181_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001181_g_eventList do
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
function x001181_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001181_g_eventList do
		if missionScriptId == findId then
			x001181_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001181_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001181_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001181_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001181_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
