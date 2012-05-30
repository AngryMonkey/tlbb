--��ҽ���һ�� area ʱ����
function x400071_OnEnterArea( sceneId, selfId )
	if (IsHaveMission(sceneId,selfId,1086) > 0)  then
		CallScriptFunction((225901), "OnAbandon",sceneId, selfId)
	else
		NewWorld( sceneId, selfId, 14, 61, 69 )
	end
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400071_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400071_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400071_OnLeaveArea( sceneId, selfId )
end

----**********************************
----�¼��б�ѡ��һ��
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 4013)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,4013)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 0, 268, 87 )
--			else
--				CallScriptFunction((231001), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
