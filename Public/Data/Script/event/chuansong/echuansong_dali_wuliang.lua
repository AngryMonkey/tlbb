--玩家进入一个 area 时触发
function x400006_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	--增加大理2/3 到无量山2/3的传送脚本相关内容	
	if sceneId ==2 then    -- 大理1就到无量山1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	elseif sceneId ==71 then -- 大理2就到无量山2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 73,43,172)		
	elseif sceneId ==72 then -- 大理3就到无量山3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 74,43,172)			
	end

end

--玩家在一个 area 呆了一段时间没走则定时触发
function x400006_OnTimer( sceneId, selfId )
	-- 毫秒，看在这个 area 停留多久了
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5秒后仍未传送
	if StandingTime >= 5000 then
		x400006_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--玩家离开一个 area 时触发
function x400006_OnLeaveArea( sceneId, selfId )
end
