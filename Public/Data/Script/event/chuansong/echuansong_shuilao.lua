--��ҽ���һ�� area ʱ����
function x400914_OnEnterArea( sceneId, selfId )
--misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--num = GetMissionParam(sceneId,selfId,misIndex,0)
--if	num == 1 then
--	NewWorld( sceneId, selfId, 0, 234, 69 )
--else
--	CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--end

--	BeginEvent(sceneId)
--		AddText(sceneId,"  ��ȷ��Ҫ�뿪ˮ����")
--		AddNumText(sceneId,g_scriptId,"ȷ��",2,0)
--		AddNumText(sceneId,g_scriptId,"ȡ��",2,1)
--	EndEvent( )
--	DispatchEventList(sceneId,selfId,targetId)

	misIndex = GetMissionIndexByID(sceneId,selfId,1213)
	num = GetMissionParam(sceneId,selfId,misIndex,0)
	if	num == 1 then
		NewWorld( sceneId, selfId, 4, 52, 96 )
	else
		CallScriptFunction((232002), "OnAbandon",sceneId, selfId)
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400914_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400914_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400914_OnLeaveArea( sceneId, selfId )
end

----**********************************
----�¼��б�ѡ��һ��
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4012)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 234, 69 )
--			else
--				CallScriptFunction((231000), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
