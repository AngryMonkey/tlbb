--洛阳NPC
--崔苇
--普通

--脚本号
x000153_g_scriptId = 000153

--所拥有的事件ID列表
x000153_g_eventList={}

x000153_g_SheepBuff = 31550											--变羊buff

--**********************************
--事件列表
--**********************************
function x000153_UpdateEventList( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,"#{BHXZ_081103_74}")
		AddNumText( sceneId, x000153_g_scriptId, "#{BHXZ_081103_75}", 4, 1 )
	EndEvent(sceneId)
	for i, eventId in x000153_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end

--**********************************
--事件交互入口
--**********************************
function x000153_OnDefaultEvent( sceneId, selfId,targetId )
	x000153_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000153_OnEventRequest( sceneId, selfId, targetId, eventId )

	local	key	= GetNumText()
	
	if key == 1 then
		if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, x000153_g_SheepBuff) == 1 then
			LuaFnCancelSpecificImpact(sceneId,selfId,x000153_g_SheepBuff)
			BeginEvent( sceneId )
				AddText( sceneId, "  我已经给你变回来了，以后可要好好做人。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		else
			LuaFnCancelSpecificImpact(sceneId,selfId,x000153_g_SheepBuff)
			BeginEvent( sceneId )
				AddText( sceneId, "  你并没有变成羊啊。" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
		return
	end

	for i, findId in x000153_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText() )	--GetNumText()是addnumtext中最后的变量
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x000153_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000153_g_eventList do
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
function x000153_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			x000153_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000153_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000153_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000153_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end
