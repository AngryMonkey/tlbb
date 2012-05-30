--石林 郑玄

--脚本号
x026000_g_scriptId = 026000

--所拥有的事件ID列表
x026000_g_eventList={212103, 212104}

--**********************************
--事件列表
--**********************************
function x026000_UpdateEventList( sceneId, selfId,targetId )
	
	BeginEvent(sceneId)
		AddText(sceneId, "  $N，我知道你，你的名字在大理已经传遍了，非常高兴能在石林这里看到你。但是，现在石林是个非常危险的地方，你凡事都要小心。")
		--AddNumText(sceneId, x026000_g_scriptId,"我想去盐湖", 9, 6)
		for i, eventId in x026000_g_eventList do
			CallScriptFunction( eventId, "OnEnumerate",sceneId, selfId, targetId )
		end

		if	IsHaveMission(sceneId,selfId,602) > 0	then
			AddNumText(sceneId, x026000_g_scriptId,"绝望之地的故事", 6, 1)
			x026000_nDescIndex = 1
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end

--**********************************
--事件交互入口
--**********************************
function x026000_OnDefaultEvent( sceneId, selfId,targetId )
	x026000_UpdateEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x026000_OnEventRequest( sceneId, selfId, targetId, eventId )
	local	arg	= GetNumText()
	if arg == 6 then
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 415, 45,34 )
		return
	end
	if eventId == x026000_g_scriptId  then
		BeginEvent(sceneId)
			if x026000_nDescIndex == 1 then
				AddText(sceneId, "#{Lua_Shilin_002}")
				AddNumText(sceneId, x026000_g_scriptId,"什么？恐怖的瘟疫！那后来呢？", 8, 1)
			elseif x026000_nDescIndex == 2 then
				AddText(sceneId, "#{Lua_Shilin_003}")
				AddNumText(sceneId, x026000_g_scriptId,"看来是偃师救了圆月村，对吗？", 8, 1)
			elseif x026000_nDescIndex == 3 then
				AddText(sceneId, "#{Lua_Shilin_004}")
			end
			x026000_nDescIndex = x026000_nDescIndex +1
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		
		if x026000_nDescIndex == 4 then
			-- 读到这里就算完成任务了
			local misIndex=GetMissionIndexByID(sceneId,selfId,602)
			local num0 = GetMissionParam(sceneId,selfId,misIndex,0)
			
			if num0 < 1 then				--如果不满足任务完成得条件
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)		--任务变量第一位增加1
				BeginEvent(sceneId)										--显示提示信息
					AddText(sceneId, "已经听完郑玄的故事：1/1");
				EndEvent(sceneId)
				DispatchMissionTips(sceneId,selfId)
			end
		end
	end
		
	if	IsHaveMission(sceneId,selfId,602) <= 0	then
		CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	
	for i, findId in x026000_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
		end
	end
end

--**********************************
--接受此NPC的任务
--**********************************
function x026000_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			ret = CallScriptFunction( missionScriptId, "CheckAccept", sceneId, selfId )
			if ret > 0 then
				CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId )
			end
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x026000_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，要返回NPC的事件列表
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			x026000_UpdateEventList( sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--继续（已经接了任务）
--**********************************
function x026000_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x026000_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x026000_g_eventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x026000_OnDie( sceneId, selfId, killerId )
end
