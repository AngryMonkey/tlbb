--洛阳NPC
--狄文远
--普通

--脚本号
x000083_g_scriptId = 000083

x000083_g_missionName = "更改阵营"

--所拥有的事件ID列表
x000083_g_eventList={250503}
--**********************************
--事件列表
--**********************************
function x000083_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local  PlayerName=GetName(sceneId,selfId)
		AddText(sceneId,"  比武场上，生死由命，签了这生死状，就不能反悔了，你可考虑清楚了！");
		--如果玩家完成过这个任务
		if GetCurCamp (sceneId, selfId) == 1 then
			AddNumText(sceneId, x000083_g_scriptId,"回复初始阵营",6,0);
		--满足任务接收条件
		else
			AddNumText(sceneId,x000083_g_scriptId,"设置PK阵营",6,1);
		end
		for i, eventId in x000083_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


--**********************************
--事件交互入口
--**********************************
function x000083_OnDefaultEvent( sceneId, selfId,targetId )
	x000083_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x000083_OnEventRequest( sceneId, selfId, targetId, eventId )
	if	GetNumText()==0	then
			SetCurCamp (sceneId, selfId, 0)
		BeginEvent(sceneId)
  			AddText(sceneId,"你已经回复到初始阵营。");
  		EndEvent(sceneId)
  		DispatchMissionTips(sceneId,selfId)
	elseif	GetNumText()==1	then
		SetCurCamp (sceneId, selfId, 1 )
		BeginEvent(sceneId)
	  		AddText(sceneId,"你已经设置为PK阵营。");
		EndEvent(sceneId)
	  	DispatchMissionTips(sceneId,selfId)
	end
	for i, findId in x000083_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x000083_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000083_g_eventList do
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
function x000083_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			x000083_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x000083_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x000083_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x000083_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x000083_OnDie( sceneId, selfId, killerId )
end
