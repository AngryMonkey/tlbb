x400027_g_ScriptId = 400027

x400027_left 	=90.0000
x400027_right	=101.0000

x400027_top  	=190.0000
x400027_bottom	=198.0000


--��ҽ���һ�� area ʱ����
function x400027_OnEnterArea( sceneId, selfId )
	if	GetLevel( sceneId, selfId)<20 then
		BeginEvent(sceneId)
			strText = "��ĵȼ�����20��"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	else

        BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, x400027_g_ScriptId);
		UICommand_AddString(sceneId, "GotoJinghu1");
		UICommand_AddString(sceneId, "����Ϊ����ɱ����������ע�ⰲȫ����ȷ��Ҫ������");
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 24)

	--CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,45,264, 20)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400027_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400027_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400027_OnLeaveArea( sceneId, selfId )
end

--**********************************
--������ں���
--**********************************
function x400027_GotoJinghu1( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	-- �������ǲ��ǻ��������Χ��
	if sceneId ~= 12   then
		--���Ѿ����ڿɴ�������
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	
	local targetX, targetZ = GetWorldPos(sceneId, selfId)
	
	if 	targetX < x400027_left or
			targetX > x400027_right or
			targetZ < x400027_top  or
			targetZ > x400027_bottom   then
		
		BeginEvent(sceneId)
			AddText(sceneId,"���Ѿ����ڿɴ�������")
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
			
	end
	
	CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 5,34,233, 20)
		
end
