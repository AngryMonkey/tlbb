--��ҽ���һ�� area ʱ����
function x400084_OnEnterArea( sceneId, selfId )
	local BackGarden = { [62] = 2, [82] = 71, [182] = 72 }
	local destScene = BackGarden[sceneId]
	if not destScene then
		destScene = 71
	end

	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, destScene,275,50)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400084_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400084_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400084_OnLeaveArea( sceneId, selfId )
end
