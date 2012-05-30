--玩家进入一个 area 时触发
function x400921_OnEnterArea( sceneId, selfId )
	local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
	local x = LuaFnGetCopySceneData_Param(sceneId, 12)
	local z = LuaFnGetCopySceneData_Param(sceneId, 13)
	
	NewWorld( sceneId, selfId, sId, x, z )
	
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400921_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400921_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400921_OnLeaveArea( sceneId, selfId )
end
