-- 120009 
-- 楚王逃跑

--**********************************
--进入区域事件
--**********************************
function x120009_OnEnterArea( sceneId, selfId, areaId)
	-- 看剧情是不是到了 4
	if LuaFnGetCopySceneData_Param(sceneId, 8) == 4  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 5)
	end
	
end

--**********************************
--进入区域事件
--**********************************
function x120009_OnLeaveArea( sceneId, selfId, areaId)
end
