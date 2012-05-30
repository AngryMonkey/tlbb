--��ҽ���һ�� area ʱ����
function x400921_OnEnterArea( sceneId, selfId )
	local sId = LuaFnGetCopySceneData_Param(sceneId, 11)
	local x = LuaFnGetCopySceneData_Param(sceneId, 12)
	local z = LuaFnGetCopySceneData_Param(sceneId, 13)
	
	NewWorld( sceneId, selfId, sId, x, z )
	
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400921_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400921_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400921_OnLeaveArea( sceneId, selfId )
end
