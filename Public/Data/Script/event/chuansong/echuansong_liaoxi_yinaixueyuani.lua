x400925_g_ScriptId = 400925

x400925_left 	=284.0000
x400925_right	=288.0000

x400925_top  	=41.0000
x400925_bottom	=47.0000


--��ҽ���һ�� area ʱ����
function x400925_OnEnterArea( sceneId, selfId )

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400925_g_ScriptId);
		UICommand_AddString(sceneId, "GotoYinaixueyuan");
		UICommand_AddString(sceneId, "����ѩԭΪ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400925_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400925_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400925_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400925_GotoYinaixueyuan( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	-- �������ǲ��ǻ��������Χ��
	if sceneId ~= 21   then
		--���Ѿ����ڿɴ�������
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400925_left or
			targetX > x400925_right or
			targetZ < x400925_top  or
			targetZ > x400925_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 188,60,222)
		
end
