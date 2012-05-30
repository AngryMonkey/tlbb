--苏州NPC   学习铸造技能  升级铸造技能
--薛烛
--一般

--脚本号
x001043_g_ScriptId = 001043

--商店编号
x001043_g_shoptableindex=67

--所拥有的事件Id列表
--estudy_zhuzao = 713505
--elevelup_zhuzao = 713564
--edialog_zhuzao = 713604
--所拥有的事件ID列表
x001043_g_eventList={713505,713564,713604}
--**********************************
--事件列表
--**********************************
function x001043_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	AddText(sceneId,"#{OBJ_suzhou_0016}")
	for i, eventId in x001043_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--商店选项
	AddNumText(sceneId,x001043_g_ScriptId,"购买打造图",7,ABILITY_TEACHER_SHOP)
  AddNumText(sceneId,x001043_g_ScriptId,"#{INTERFACE_XML_1194}",7,12)	  
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x001043_OnDefaultEvent( sceneId, selfId,targetId )
	x001043_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x001043_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==ABILITY_TEACHER_SHOP	then
		DispatchShopItem( sceneId, selfId,targetId, x001043_g_shoptableindex )
	elseif GetNumText()== 12 	then
    DispatchShopItem( sceneId, selfId,targetId, 199 ) 
	end
	for i, findId in x001043_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId, GetNumText(),x001043_g_ScriptId )
		return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x001043_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001043_g_eventList do
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
function x001043_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			x001043_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x001043_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x001043_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x001043_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x001043_OnDie( sceneId, selfId, killerId )
end
