--洛阳NPC
--漕运使
--漕运循环任务

--脚本号
x311006_g_scriptId = 311006

--所拥有的事件ID列表
x311006_g_eventList={311010}

--龟兔赛跑任务号
x311006_g_MissionId			= 1000
--龟兔赛跑任务事件列表
x311006_g_GodFireEventList={}   -- 808080
--每天龟兔赛跑活动开启时间
x311006_g_ActivityTime		= { {tstart=1230, tend=1330},
														  {tstart=1930, tend=2030},
														  {tstart=2130, tend=2230} }

--龟兔赛跑任务完成标记
x311006_g_Mission_IsComplete = 0	--任务参数的第0位
--龟兔赛跑洛阳打卡标记
x311006_g_LuoYang_RecordIdx = 1		--任务参数的第1位
--龟兔赛跑苏州打卡标记
x311006_g_SuZhou_RecordIdx = 2		--任务参数的第2位
--龟兔赛跑大理打卡标记
x311006_g_DaLi_RecordIdx = 3			--任务参数的第3位
--孔明灯完成数量标记
x311006_g_KongMing_Lighten = 4		--任务参数的第4位
--龟兔赛跑传递任务每天轮数标记
x311006_g_RoundIndex = 7					--任务参数的第7位

--需要点燃孔明灯的总数
x311006_g_KongMing_CntMax	 = 24

--**********************************
--事件列表
--**********************************
function x311006_UpdateEventList( sceneId, selfId, targetId )

	for i, eventId in x311006_g_eventList do
		CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
	end

end

--**********************************
--事件交互入口
--**********************************
function x311006_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		-- 点燃洛阳火源
		if x311006_OnIsFillPlayCard(sceneId, selfId, targetId) == 1 then

			local misIndex = GetMissionIndexByID(sceneId,selfId,x311006_g_MissionId)
			SetMissionByIndex(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx, 1)
			x311006_NotifyTip( sceneId, selfId, "#{GodFire_Info_002}" )
			
			-- 检测任务是否完成
			if GetMissionParam(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311006_g_SuZhou_RecordIdx) == 1
				 and GetMissionParam(sceneId, selfId, misIndex, x311006_g_DaLi_RecordIdx) == 1 then
				
				-- 检测是否点燃所有孔明灯
				if GetMissionParam(sceneId, selfId, misIndex, x311006_g_KongMing_Lighten) >= x311006_g_KongMing_CntMax then								
					-- 任务完成
					AddText( sceneId, "#{GodFire_Info_028}" )
					SetMissionByIndex( sceneId, selfId, misIndex, x311006_g_Mission_IsComplete, 1 )
				else
					AddText( sceneId, "#{GodFire_Info_037}" )
				end
			else
				-- 点燃火源
				AddText( sceneId, "#{GodFire_Info_010}" )
			end
			
		else
			AddText( sceneId, "#{function_caoyun_0}" )
			AddNumText( sceneId, x311006_g_scriptId, "了解漕运", 11, 1 )
			AddNumText( sceneId, x311006_g_scriptId, "开始漕运", 7, 2 )
		
			for i, eventId in x311006_g_GodFireEventList do
				CallScriptFunction( eventId, "OnEnumerate", sceneId, selfId, targetId )
			end
		end
		
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--事件列表选中一项
--**********************************
function x311006_OnEventRequest( sceneId, selfId, targetId, eventId )
	local NumText = GetNumText();
	if NumText == 1 then
		BeginEvent( sceneId )
			AddText( sceneId, "#{function_help_051}" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return
	elseif NumText == 2 then
		x311006_UpdateEventList( sceneId, selfId, targetId )
		return
	end

	for i, findId in x311006_g_eventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnHandle_QuestUI",sceneId, selfId, targetId, NumText )
			return
		end
	end
	
	for i, findId in x311006_g_GodFireEventList do
		if eventId == findId then
			CallScriptFunction( eventId, "OnDefaultEvent",sceneId, selfId, targetId )
			
			return 0
		end
	end
	
end

--**********************************
--接受此NPC的任务
--**********************************
function x311006_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnAccept", sceneId, selfId, targetId, missionScriptId )
			return
		end
	end
end

--**********************************
--拒绝此NPC的任务
--**********************************
function x311006_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--拒绝之后，关闭对话窗口
	return
end

--**********************************
--继续（已经接了任务）
--**********************************
function x311006_OnMissionContinue( sceneId, selfId, targetId, missionScriptId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnContinue", sceneId, selfId, targetId )
			return
		end
	end
end

--**********************************
--提交已做完的任务
--**********************************
function x311006_OnMissionSubmit( sceneId, selfId, targetId, missionScriptId, selectRadioId )
	for i, findId in x311006_g_GodFireEventList do
		if missionScriptId == findId then
			CallScriptFunction( missionScriptId, "OnSubmit", sceneId, selfId, targetId, selectRadioId )
			return
		end
	end
end

--**********************************
--死亡事件
--**********************************
function x311006_OnDie( sceneId, selfId, killerId )
end


-- 检测龟兔赛跑传递活动是否满足打卡条件
function x311006_OnIsFillPlayCard(sceneId, selfId, targetId)

  --玩家身上是否有龟兔赛跑任务
	if IsHaveMission( sceneId, selfId, x311006_g_MissionId ) <= 0 then				
		return 0
	end

	--检测玩家参加活动的时间
	local	nDayTime = GetMissionData( sceneId, selfId, MD_GODOFFIRE_DAYTIME )
	
	local nDay = LuaFnGetDayOfThisMonth()
	if nDayTime ~= nDay then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x311006_g_MissionId)
	
	--检测当天参加的是第几轮
	local nRoundIdx = GetMissionParam(sceneId, selfId, misIndex, x311006_g_RoundIndex)

	local nHour	 = GetHour()
	local nMinute = GetMinute()  
  local curHourTime = nHour*100+nMinute

	if curHourTime < x311006_g_ActivityTime[nRoundIdx].tstart or curHourTime > x311006_g_ActivityTime[nRoundIdx].tend then
		return 0
	end
	
	--检测是否在洛阳打过卡
	if GetMissionParam(sceneId, selfId, misIndex, x311006_g_LuoYang_RecordIdx) == 1 then
		return 0
	end
	
	return 0
end

--**********************************
--醒目提示
--**********************************
function x311006_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end
