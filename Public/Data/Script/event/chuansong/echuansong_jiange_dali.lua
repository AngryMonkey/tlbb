--��ҽ���һ�� area ʱ����
function x400019_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)
	if sceneId ==7 then    -- ����1�͵�����1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)
	elseif sceneId ==75 then -- ����2�͵�����2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)		
	elseif sceneId ==76 then -- ����3�͵�����3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,80,246)			
	end

end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400019_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400019_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400019_OnLeaveArea( sceneId, selfId )
end
