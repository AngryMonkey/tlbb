--��ҽ���һ�� area ʱ����
function x400006_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	--���Ӵ���2/3 ������ɽ2/3�Ĵ��ͽű��������	
	if sceneId ==2 then    -- ����1�͵�����ɽ1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 6,43,172)
	elseif sceneId ==71 then -- ����2�͵�����ɽ2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 73,43,172)		
	elseif sceneId ==72 then -- ����3�͵�����ɽ3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 74,43,172)			
	end

end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400006_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400006_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400006_OnLeaveArea( sceneId, selfId )
end
