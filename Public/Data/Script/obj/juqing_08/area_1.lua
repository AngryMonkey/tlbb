-- 120009 
-- ��������

--**********************************
--���������¼�
--**********************************
function x120009_OnEnterArea( sceneId, selfId, areaId)
	-- �������ǲ��ǵ��� 4
	if LuaFnGetCopySceneData_Param(sceneId, 8) == 4  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 5)
	end
	
end

--**********************************
--���������¼�
--**********************************
function x120009_OnLeaveArea( sceneId, selfId, areaId)
end
