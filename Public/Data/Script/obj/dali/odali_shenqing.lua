--大理NPC
--申情
--珍兽指导

--脚本号
x002069_g_ScriptId = 002069

--所拥有的事件ID列表
x002069_g_eventList={808097, 808098, 808099, 808093}

--**********************************
--事件交互入口
--**********************************
function x002069_OnDefaultEvent( sceneId, selfId,targetId )
    local  PlayerName=GetName(sceneId,selfId)	
	local  PlayerSex=GetSex(sceneId,selfId)
	if PlayerSex == 0 then
		PlayerSex = "姑娘"
	else
		PlayerSex = "少侠"
	end
	BeginEvent(sceneId)
		AddText(sceneId,"  "..PlayerName..PlayerSex.."，要好好对待自己的珍兽哦。操作上有什么不明白的地方，我可以帮你解答哦。")
		
		for i, eventId in x002069_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText(sceneId,x002069_g_ScriptId,"宠物生命值不足怎么办",11,0)
		AddNumText(sceneId,x002069_g_ScriptId,"珍兽快乐度不足怎么办",11,1)
		AddNumText(sceneId,x002069_g_ScriptId,"怎样提升宠物等级",11,2)
		AddNumText(sceneId,x002069_g_ScriptId,"怎样捕捉宠物",11,3)

	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

function x002069_OnEventRequest( sceneId, selfId, targetId, eventId )

	for i, findId in x002069_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end

	if	GetNumText() == 0	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0041}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 1	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0042}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)		
	elseif	GetNumText() == 2	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0043}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif	GetNumText() == 3	then
		BeginEvent(sceneId)
			AddText(sceneId,"#{OBJ_dali_0044}")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end

end

--**********************************
--接受此NPC的任务
--**********************************
function x002069_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId, targetId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x002069_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			x002069_OnDefaultEvent( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x002069_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x002069_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x002069_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x002069_OnDie( sceneId, selfId, killerId )
end
