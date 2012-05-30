x400938_g_ScriptId = 400938

x400938_left 	=100.0000
x400938_right	=106.0000

x400938_top  	=211.0000
x400938_bottom	=217.0000

--��ҽ���һ�� area ʱ����
function x400938_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400938_g_ScriptId);
		UICommand_AddString(sceneId, "GotoTKLMG");
		UICommand_AddString(sceneId, "���������Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
		
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400938_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400938_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400938_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400938_GotoTKLMG( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	-- �������ǲ��ǻ��������Χ��
	if sceneId ~= 425   then
		--���Ѿ����ڿɴ�������
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400938_left or
			targetX > x400938_right or
			targetZ < x400938_top  or
			targetZ > x400938_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 427,38,24)
		
end
