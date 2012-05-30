--苏州NPC 采矿npc  学习采矿技能  升级采矿技能
--张小河
--普通

--脚本号
x001039_g_ScriptId = 001039

--商店编号
x001039_g_shoptableindex=73

--所拥有的事件Id列表
--estudy_caikuang = 713508
--elevelup_caikuang = 713567
--edialog_caikuang = 713607
--所拥有的事件ID列表
x001039_g_eventList={713508,713567,713607}
--**********************************
--事件列表
--**********************************
function x001039_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0013}")
	for i, eventId in x001039_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x001039_g_ScriptId,"购买工具",7,ABILITY_TEACHER_SHOP)
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001039_OnDefaultEvent( sceneId, selfId,targetId )
	x001039_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001039_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001039_g_shoptableindex )
	end
	for i, findId in x001039_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001039_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001039_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001039_g_eventList do
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
function x001039_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			x001039_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001039_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001039_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001039_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001039_OnDie( sceneId, selfId, killerId )
end
