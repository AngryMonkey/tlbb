--����С��Ϸ

--�ű���
x808073_g_scriptId = 808073


function x808073_OnPatrolPoint( sceneId, objId, patrolPathIndex, patrolPointIndex, paopaoIndex	)

	-- ������ߵ����һ��������̻�....
	if patrolPointIndex == 12 and paopaoIndex == 0 then
		local posX,posZ = GetWorldPos(sceneId, objId)
		CreateSpecialObjByDataIndex(sceneId, objId, 6, posX, posZ, 0)
	end

end
