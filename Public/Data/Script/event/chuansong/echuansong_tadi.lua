--玩家进入一个 area 时触发
function x400073_OnEnterArea( sceneId, selfId )
	if (IsHaveMission(sceneId,selfId,1081) > 0)  then
		CallScriptFunction((224901), "OnAbandon",sceneId, selfId)
	else
		NewWorld( sceneId, selfId, 13, 37, 86 )
	end
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400073_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400073_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400073_OnLeaveArea( sceneId, selfId )
end

----**********************************
----事件列表选中一项
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4013)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 268, 87 )
--			else
--				CallScriptFunction((231001), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
