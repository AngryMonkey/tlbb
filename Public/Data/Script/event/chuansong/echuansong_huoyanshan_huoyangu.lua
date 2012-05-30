x400932_g_ScriptId = 400932

x400932_left 	=25.0000
x400932_right	=31.0000

x400932_top =100.0000
x400932_bottom	=106.0000

--��ҽ���һ�� area ʱ����
function x400932_OnEnterArea( sceneId, selfId,a,b )

	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400932_g_ScriptId);
		UICommand_AddString(sceneId, "GotoHuoyangu");
		UICommand_AddString(sceneId, "�����Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400932_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400932_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400932_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400932_GotoHuoyangu( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	-- �������ǲ��ǻ��������Χ��
	if sceneId ~= 423   then
		--���Ѿ����ڿɴ�������
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400932_left or
			targetX > x400932_right or
			targetZ < x400932_top  or
			targetZ > x400932_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 519,71,29)
		
end
