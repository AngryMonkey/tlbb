--��ҽ���һ�� area ʱ����
x808019_g_MissionId			= 1250
function x808019_OnEnterArea( sceneId, selfId )
	DelMission( sceneId, selfId, x808019_g_MissionId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 10, 92, 153)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x808019_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x808019_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x808019_OnLeaveArea( sceneId, selfId )
end
