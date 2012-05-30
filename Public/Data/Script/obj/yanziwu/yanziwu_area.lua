-- 402261
-- ������ ���ͳ�������ű�

x402261_g_SceneId = 4
x402261_g_X = 70
x402261_g_Z = 120

--��ҽ���һ�� area ʱ����
function x402261_OnEnterArea( sceneId, selfId )
	CallScriptFunction((400900), "TransferFunc",sceneId, 
																							selfId, 
																							x402261_g_SceneId,
																							x402261_g_X,
																							x402261_g_Z)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x402261_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x402261_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x402261_OnLeaveArea( sceneId, selfId )
	
end

