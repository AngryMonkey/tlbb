--洛阳NPC 采药技能NPC   包含功能：1采药技能的学习 2讲解采药技能
--严百草
--普通

--脚本号
x000103_g_ScriptId = 000103

--商店编号
x000103_g_shoptableindex=73

--所拥有的事件Id列表
--estudy_caiyao = 713509
--elevelup_caiyao = 713568
--edialog_caiyao = 713608
--所拥有的事件ID列表
x000103_g_eventList={713509,713568,250501}--,713608
--**********************************
--事件列表
--**********************************
function x000103_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"  想学习和提高采药技能就经常来我这里看看，要得到更多稀有的药草，目前这样是不行的。")
	AddText(sceneId,"  采药镰是每个草药人必备的物品，等你收集了足够的药草，就知道该从什么地方去找到他们了。")
	for i, eventId in x000103_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x000103_g_ScriptId,"购买工具",7,ABILITY_TEACHER_SHOP)
	AddNumText( sceneId, x000103_g_ScriptId, "采药介绍", 11, 100 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000103_OnDefaultEvent( sceneId, selfId,targetId )
	x000103_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000103_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 100 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_006}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	end

	if	GetNumText() == ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x000103_g_shoptableindex )
	end
	for i, findId in x000103_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x000103_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000103_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
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
function x000103_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			x000103_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000103_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000103_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000103_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000103_OnDie( sceneId, selfId, killerId )
end
