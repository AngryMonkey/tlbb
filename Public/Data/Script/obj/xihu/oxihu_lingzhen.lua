--中秋NPC
--凌振

x050203_g_scriptId = 050203

--所拥有的事件ID列表
x050203_g_eventList={050018, 050019}

--活动时间
x050203_g_StartDayTime = 8257   --活动开始时间 2008-9-14,包含当日
x050203_g_EndDayTime = 8282   --活动结束时间 2008-10-09,包含当日

--**********************************
--事件列表
--**********************************
function x050203_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId)
		AddText( sceneId, "    这夜西湖的景色实在是漂亮！若是在最赏心悦目的时间里，放那么几束美丽的节日烟花就更好了。" )
		if IsHaveMission(sceneId, selfId, 131) > 0 then
			CallScriptFunction( 050018, "OnEnumerate",sceneId, selfId, targetId )
		elseif IsHaveMission(sceneId, selfId, 132) > 0 then
			CallScriptFunction( 050019, "OnEnumerate",sceneId, selfId, targetId )
		else
			local randIndex = random(1, 2);
			if randIndex == 1 then
				CallScriptFunction( 050018, "OnEnumerate",sceneId, selfId, targetId )
			else
				CallScriptFunction( 050019, "OnEnumerate",sceneId, selfId, targetId )
			end
		end
		
		local check = x050203_IsMidAutumnPeriod(sceneId, selfId);
		if check and check == 1 then
			AddNumText(sceneId, x050203_g_scriptId, "关于赏月放烟花", 11, 1);
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x050203_OnDefaultEvent( sceneId, selfId,targetId )
	x050203_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x050203_OnEventRequest( sceneId, selfId, targetId, eventId )
	for i, findId in x050203_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			return
		end
	end
	
	local num = GetNumText()
	if num == 1 then
		BeginEvent(sceneId);
			AddText( sceneId, "#{FANGYIANHUA_ABOUT}");
		EndEvent(sceneId);
		DispatchEventList(sceneId, selfId, targetId);
		return
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x050203_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x050203_g_eventList do
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
function x050203_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			x050203_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x050203_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x050203_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x050203_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x050203_OnDie( sceneId, selfId, killerId )
end

--**********************************
--活动是否开启
--**********************************
function x050203_IsMidAutumnPeriod(sceneId, selfId)
	local curDay = GetDayTime();
	if not curDay then
		return 0;
	end

	if curDay < x050203_g_StartDayTime or curDay > x050203_g_EndDayTime then
		return 0;
	end

	return 1
end
