--��ҽ���һ�� area ʱ����
function x809267_OnEnterArea( sceneId, selfId )
        
	local idScene = LuaFnGetCopySceneData_Param( sceneId, 3 )
 	local x,z
	x = LuaFnGetCopySceneData_Param( sceneId, 7 )
	z = LuaFnGetCopySceneData_Param( sceneId, 8 )

	NewWorld( sceneId, selfId, idScene, x, z )


end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x809267_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x809267_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x809267_OnLeaveArea( sceneId, selfId )
end

