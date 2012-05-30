--童贯

--脚本号
x000004_g_scriptId = 000004

--所拥有的事件ID列表
x000004_g_eventList={402040}		

--**********************************
--事件列表
--**********************************
function x000004_UpdateEventList( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
	local  PlayerName=GetName(sceneId,selfId)
	AddText(sceneId,"  "..PlayerName..PlayerSex.."，见到你真高兴啊！我现在负责蹴鞠大赛的工作。每天可刷4次。6小时刷一次。");
	for i, eventId in x000004_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
	end
	--[tx45411]AddNumText(sceneId, x000004_g_scriptId, "#{NSRQ_081110_2}", 11, 999);    
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x000004_OnDefaultEvent( sceneId, selfId,targetId )
	x000004_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000004_OnEventRequest( sceneId, selfId, targetId, eventId )
	--[tx45411]if GetNumText() == 999 then                                           
		--BeginEvent(sceneId)					
		--	AddText( sceneId, "#{NSRQ_081110_3}" )						
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
		--return		
	--[/tx45411]end
	for i, findId in x000004_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000004_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000004_g_eventList do
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
function x000004_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000004_g_eventList do
		if missionScriptId == findId then
			x000004_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000004_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000004_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000004_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000004_OnDie( sceneId, selfId, killerId )
end
