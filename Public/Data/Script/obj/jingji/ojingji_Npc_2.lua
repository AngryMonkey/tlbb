-- 125012
-- 复活设定

--脚本号
x125012_g_scriptId = 125012

--所拥有的事件ID列表
x125012_g_eventList={}

x125012_g_Position = {
				{x=143,z=151,name="范钟离"},
				{x=28, z=152,name="石世崇"},
				{x=149,z=80,name="邓定通"},
				{x=36, z=49,name="梁万冀"},
}

--**********************************
--事件列表
--**********************************
function x125012_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"你要把你的复活点设置到我这里吗？");
		for i, eventId in x125012_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
		
		AddNumText( sceneId, x125012_g_scriptId, "把我的复活点设在这里" ,9 ,1  )
		
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x125012_OnDefaultEvent( sceneId, selfId,targetId )
	x125012_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x125012_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText()==1  then
		local nIndex = 0
		for i=1, 4  do
			if GetName(sceneId, targetId) == x125012_g_Position[i].name  then
				nIndex = i
			end
		end

		--SetPlayerDefaultReliveInfo( sceneId, selfId, "%100", "%100", "0", 
		--			sceneId, x125012_g_Position[nIndex].x, x125012_g_Position[nIndex].z )
		
		SetPlayerDefaultReliveInfoEx( sceneId, selfId, "%100", "%100", "0", 
						sceneId, 
						x125012_g_Position[nIndex].x, 
						x125012_g_Position[nIndex].z, 
						125020 )
					
		BeginEvent(sceneId)
			AddText(sceneId,"你的复活点已经设置在我这里了。");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		-- 给一个特效
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, 
										selfId, 152, 100 )
		
		return
	end
	for i, findId in x125012_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x125012_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125012_g_eventList do
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
function x125012_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			x125012_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x125012_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x125012_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x125012_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x125012_OnDie( sceneId, selfId, killerId )
end
