--��ҽ���һ�� area ʱ����
x808020_g_MissionId			= 1250

function x808020_OnEnterArea( sceneId, selfId )
	DelMission( sceneId, selfId, x808020_g_MissionId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 11, 98, 149)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x808020_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x808020_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x808020_OnLeaveArea( sceneId, selfId )
end
