x400018_g_ScriptId = 400018

x400018_left 	=283.0000
x400018_right	=289.0000

x400018_top  	=74.0000
x400018_bottom	=83.0000


--��ҽ���һ�� area ʱ����
function x400018_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<10 then
		BeginEvent(sceneId)
			strText = "��ĵȼ�����10��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else
        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400018_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu2");
		UICommand_AddString(sceneId, "����Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)
	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,46,278, 10)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400018_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400018_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400018_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400018_GotoJinghu2( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	-- �������ǲ��ǻ��������Χ��
	if sceneId ~= 6   then
		--���Ѿ����ڿɴ�������
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400018_left or
			targetX > x400018_right or
			targetZ < x400018_top  or
			targetZ > x400018_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,46,278, 10)
		
end
