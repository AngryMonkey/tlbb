--��ҽ���һ�� area ʱ����
function x400947_OnEnterArea( sceneId, selfId )
	PrintStr("dd");
	BeginEvent(sceneId)
		AddText(sceneId,"  �ó�����������...")
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400947_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400947_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400947_OnLeaveArea( sceneId, selfId )
end
