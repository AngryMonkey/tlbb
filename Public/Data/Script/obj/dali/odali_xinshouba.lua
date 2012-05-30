--孙八爷

--脚本号
x002032_g_scriptId = 002032


x002032_g_DuanWuJieDay	= {start = 20090528, stop1 = 20090604, level = 30}
--所拥有的事件ID列表
x002032_g_eventList={210210,210211,210212,210246,808130,808124,889061}--del 889050 秦皇战神活动

--**********************************
--事件列表
--**********************************
function x002032_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "妹妹"
	else
		PlayerSex = "兄弟"
	end
	AddText(sceneId,"  "..PlayerName..PlayerSex.."#{OBJ_dali_0014}")
	for i, eventId in x002032_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	x002032_Help_Duanwujie( sceneId, selfId, targetId )--端午节活动，以后去掉	
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x002032_OnDefaultEvent( sceneId, selfId,targetId )
	x002032_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x002032_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x002032_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	x002032_SubHelp_Duanwujie( sceneId, selfId, targetId )--端午节活动，以后去掉	
end

--**********************************
--接受此NPC的任务
--**********************************
function x002032_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
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
function x002032_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			x002032_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002032_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002032_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002032_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002032_OnDie( sceneId, selfId, killerId )
end
--端午节活动的帮助（活动过后应去掉）
--**********************************
function x002032_Help_Duanwujie( sceneId, selfId, targetId )
	local curDayTime = GetTime2Day()
	if curDayTime >= x002032_g_DuanWuJieDay.start and curDayTime <= x002032_g_DuanWuJieDay.stop1 then
			AddNumText(sceneId, x002032_g_scriptId, "#{DWJ_090511_02}", 11, 5500)										
	end
end

--**********************************
--端午节活动子活动的帮助（活动过后应去掉）
--**********************************
function x002032_SubHelp_Duanwujie( sceneId, selfId, targetId )
	local numText = GetNumText();
	
	if numText == 5500 then
	 	BeginEvent(sceneId)
			AddText(sceneId, "#{DWJ_090511_03}")
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId)
	end
end
