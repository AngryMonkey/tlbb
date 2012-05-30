--玩家进入一个 area 时触发
function x400913_OnEnterArea( sceneId, selfId )
	if	IsHaveMission( sceneId, selfId, 702)>0	then
		CallScriptFunction((210222), "OnAbandon",sceneId, selfId)
	elseif	IsHaveMission( sceneId, selfId, 711)>0	then
		misIndex = GetMissionIndexByID(sceneId,selfId,711)
		num = GetMissionParam(sceneId,selfId,misIndex,0)
		if	num == 1 then
			NewWorld( sceneId, selfId, 2, 275, 50 )
		else
			CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
		end

		--BeginEvent(sceneId)
		--	AddText(sceneId,"  你确定要离开木人二巷吗？")
		--	AddNumText(sceneId,g_scriptId,"确定",2,0)
		--	AddNumText(sceneId,g_scriptId,"取消",2,1)
		--EndEvent( )
		--DispatchEventList(sceneId,selfId,targetId)
	end
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400913_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400913_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400913_OnLeaveArea( sceneId, selfId )
end

----**********************************
----事件列表选中一项
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 711)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,711)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 2, 275, 50 )
--			else
--				CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
