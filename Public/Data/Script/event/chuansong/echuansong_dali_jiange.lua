--��ҽ���һ�� area ʱ����
function x400007_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	--���ӽ���2/3 ������2/3�Ĵ��ͽű��������	
	if sceneId ==2 then    -- ����1�͵�����1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 7,40,278)
	elseif sceneId ==71 then -- ����2�͵�����3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 75,40,278)		
	elseif sceneId ==72 then -- ����3�͵�����3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 76,40,278)			
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400007_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400007_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400007_OnLeaveArea( sceneId, selfId )
end
