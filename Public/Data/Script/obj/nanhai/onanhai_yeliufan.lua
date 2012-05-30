--南海NPC
--叶流凡
--普通

--脚本号
x034001_g_scriptId = 34001

--所拥有的事件ID列表
x034001_g_eventList={212114}

--**********************************
--事件列表
--**********************************
function x034001_UpdateEventList( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		AddText(sceneId,"  究竟是谁干的！我一定会查出凶手来的，我要用他的头颅来祭拜师傅、师娘和南海剑派所有的人！#r  最可怜的就是九师妹了，她一定很伤心……她的心里，只有，大师兄啊……")
		for i, eventId in x034001_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x034001_OnDefaultEvent( sceneId, selfId,targetId )
	x034001_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x034001_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x034001_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x034001_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
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
function x034001_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			x034001_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x034001_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x034001_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x034001_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x034001_OnDie( sceneId, selfId, killerId )
end
