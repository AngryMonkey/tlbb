--��ҽ���һ�� area ʱ����
function x400017_OnEnterArea( sceneId, selfId )
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,474,245)
	if sceneId ==6 then    -- ����ɽ1�͵�����1
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,474,245)
	elseif sceneId ==73 then -- ����ɽ2�͵�����2
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,474,245)		
	elseif sceneId ==74 then -- ����ɽ3�͵�����3
		CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 2,474,245)			
	end

end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400017_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400017_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400017_OnLeaveArea( sceneId, selfId )
end
