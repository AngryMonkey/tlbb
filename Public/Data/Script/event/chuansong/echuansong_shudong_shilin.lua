--��ҽ���һ�� area ʱ����
function x400149_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 26,106,262)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400149_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400149_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400149_OnLeaveArea( sceneId, selfId )
end
