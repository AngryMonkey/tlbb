--大理NPC		缝纫npc		1学习缝纫技能		2中医技能说明
--黄绫波
--生活技能npc

--脚本号
x002063_g_ScriptId = 002063

--商店编号
x002063_g_shoptableindex=62

--所拥有的事件Id列表
--estudy_fengren = 713506
--elevelup_fengren = 713565
--edialog_fengren = 713605
--所拥有的事件ID列表
x002063_g_eventList={713506,713565,713605}
--**********************************
--事件列表
--**********************************
function x002063_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_dali_0038}")
	for i, eventId in x002063_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x002063_g_ScriptId,"购买打造图",7,ABILITY_TEACHER_SHOP)
  AddNumText(sceneId,x002063_g_ScriptId,"#{INTERFACE_XML_1195}",7,12)     
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002063_OnDefaultEvent( sceneId, selfId,targetId )
	x002063_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002063_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x002063_g_shoptableindex )
	elseif	GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 200 )  
	end
	for i, findId in x002063_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x002063_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x002063_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002063_g_eventList do
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
function x002063_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			x002063_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002063_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002063_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002063_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002063_OnDie( sceneId, selfId, killerId )
end
