--��ҽ���һ�� area ʱ����
x808024_g_MissionId			= 1250
function x808024_OnEnterArea( sceneId, selfId )
	DelMission( sceneId, selfId, x808024_g_MissionId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 12,93,182)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x808024_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x808024_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x808024_OnLeaveArea( sceneId, selfId )
end
