--束河古镇NPC....
--采药大师....

--脚本号
x001189_g_ScriptId = 001189

--所拥有的事件Id列表
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--所拥有的事件ID列表
x001189_g_eventList={713509,713568,713608}

x001189_g_shoptableindex = 73

x001189_g_MsgInfo = { "#{SHGZ_0612_11}",
											"#{SHGZ_0620_31}",
											"#{SHGZ_0620_32}",
											"#{SHGZ_0620_33}",
										}

--**********************************
--事件列表
--**********************************
function x001189_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local msgidx = random(getn(x001189_g_MsgInfo))
		AddText(sceneId, x001189_g_MsgInfo[msgidx])
		AddNumText( sceneId, x001189_g_ScriptId, "购买工具", 6, 29 )
		for i, eventId in x001189_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001189_OnDefaultEvent( sceneId, selfId,targetId )
	x001189_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001189_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	arg	= GetNumText()

  if arg == 29 then
  	DispatchShopItem( sceneId, selfId, targetId, x001189_g_shoptableindex )
  	return 0
  end

	for i, findId in x001189_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001189_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001189_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001189_g_eventList do
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
function x001189_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			x001189_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001189_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001189_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001189_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
