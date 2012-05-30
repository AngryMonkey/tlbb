--太湖NPC
--造反恶贼
--普通

--脚本号
x808017_g_ScriptId	= 808017

--所拥有的事件ID列表
x808017_g_EventList	= { 808016,808027,808028,808029,808030,808031,808032,808033,808034 }

--场景id到事件脚本号的映射表
x808017_g_Scene2EventList = {{9,808027}, {16,808028}, {13,808029}, {17,808030},{11,808031},{10,808032},{12,808033},{15,808034},{14,808016}}

--接取任务的最低等级
x808017_g_minLevel			= 20

--**********************************
--事件列表
--**********************************
function x808017_UpdateEventList( sceneId, selfId, targetId )
		for _,FindsceneId in x808017_g_Scene2EventList do
				if FindsceneId[1] == sceneId then
						CallScriptFunction( FindsceneId[2], "OnEnumerate", sceneId, selfId, targetId )
				end
		end
end

--**********************************
--事件交互入口
--**********************************
function x808017_OnDefaultEvent( sceneId, selfId, targetId )
	x808017_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x808017_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x808017_g_EventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x808017_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x808017_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId )
			return
		end
	end

end

--**********************************
--拒绝此NPC的任务
--**********************************
function x808017_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )

	--拒绝之后，要返回NPC的事件列表
	for i, findId in x808017_g_EventList do
		if missionScriptId == findId then
			x808017_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--继续（已经接了任务）
--**********************************
function x808017_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )

	for i, findId in x808017_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end

end

--**********************************
--提交已做完的任务
--**********************************
function x808017_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )

	for i, findId in x808017_g_EventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end

end

--**********************************
--死亡事件
--**********************************
function x808017_OnDie( sceneId, selfId, killerId )
end
