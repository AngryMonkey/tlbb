--玩家进入一个 area 时触发
function x400914_OnEnterArea( sceneId, selfId )
--misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--num = GetMissionParam(sceneId,selfId,misIndex,0)
--if	num == 1 then
--	NewWorld( sceneId, selfId, 0, 234, 69 )
--else
--	CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--end

--	BeginEvent(sceneId)
--		AddText(sceneId,"  你确定要离开水牢吗？")
--		AddNumText(sceneId,g_scriptId,"确定",2,0)
--		AddNumText(sceneId,g_scriptId,"取消",2,1)
--	EndEvent( )
--	DispatchEventList(sceneId,selfId,targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,1213)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if	num == 1 then
		NewWorld( sceneId, selfId, 4, 52, 96 )
	else
		CallScriptFunction((232002), "OnAbandon",sceneId, selfId)
	end
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400914_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400914_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400914_OnLeaveArea( sceneId, selfId )
end

----**********************************
----事件列表选中一项
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4012)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 234, 69 )
--			else
--				CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
