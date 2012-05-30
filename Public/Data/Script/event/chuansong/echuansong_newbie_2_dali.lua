--玩家进入一个 area 时触发
function x400084_OnEnterArea( sceneId, selfId )
	local BackGarden = { [62] = 2, [82] = 71, [182] = 72 }
	local destScene = BackGarden[sceneId]
	if not destScene then
		destScene = 71
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene,275,50)
end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400084_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400084_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400084_OnLeaveArea( sceneId, selfId )
end
