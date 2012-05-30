--��ҽ���һ�� area ʱ����
function x400083_OnEnterArea( sceneId, selfId )
	local WoodenLane = { [61] = 2, [50] = 71, [81] = 72 }
	local destScene = WoodenLane[sceneId]
	if not destScene then
		destScene = 72
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene,275,50)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400083_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400083_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400083_OnLeaveArea( sceneId, selfId )
end
