--玩家进入一个 area 时触发
function x400019_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)
	if sceneId ==7 then    -- 剑阁1就到大理1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)
	elseif sceneId ==75 then -- 剑阁2就到大理2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)		
	elseif sceneId ==76 then -- 剑阁3就到大理3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)			
	end

end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400019_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400019_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400019_OnLeaveArea( sceneId, selfId )
end
