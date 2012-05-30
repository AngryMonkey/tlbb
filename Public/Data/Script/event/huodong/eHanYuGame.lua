--寒玉床小游戏

--脚本号
x808073_g_scriptId = 808073


function x808073_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	-- 如果刚走到最后一个点则放烟花....
	if patrolPointIndex == 12 and paopaoIndex == 0 then
		local posX,posZ = GetWorldPos(sceneId, objId)
		CreateSpecialObjByDataIndex(sceneId, objId, 6, posX, posZ, 0)
	end

end
