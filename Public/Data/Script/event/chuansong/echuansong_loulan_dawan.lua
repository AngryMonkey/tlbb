--��ҽ���һ�� area ʱ����
function x400941_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<90 then
		BeginEvent(sceneId)
			strText = "��ĵȼ�����90��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 431,193,227, 90)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400941_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400941_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400941_OnLeaveArea( sceneId, selfId )
end
