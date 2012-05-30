--苏州NPC 工艺技能NPC   包含功能：1工艺技能的学习 2讲解工艺技能
--曾三省
--普通

--脚本号
x001047_g_ScriptId = 001047

--商店编号
x001047_g_shoptableindex=69

--所拥有的事件Id列表
--estudy_gongyi = 713507
--elevelup_gongyi = 713566
--edialog_gongyi = 713606
--所拥有的事件ID列表
x001047_g_eventList={713507,713566,713606}
--**********************************
--事件列表
--**********************************
function x001047_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0018}")
	for i, eventId in x001047_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x001047_g_ScriptId,"购买打造图",7,ABILITY_TEACHER_SHOP)
	AddNumText(sceneId,x001047_g_ScriptId,"#{INTERFACE_XML_1196}",7,12)      
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001047_OnDefaultEvent( sceneId, selfId,targetId )
	x001047_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001047_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001047_g_shoptableindex )
	elseif GetNumText()==12	then
		DispatchShopItem( sceneId, selfId,targetId, 201 )
	end
	for i, findId in x001047_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001047_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001047_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001047_g_eventList do
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
function x001047_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			x001047_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001047_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001047_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001047_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001047_OnDie( sceneId, selfId, killerId )
end
