--��ҽ���һ�� area ʱ����
function x002950_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "��ĵȼ�����10��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 1,196,214, 10)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x002950_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x002950_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x002950_OnLeaveArea( sceneId, selfId )
end
