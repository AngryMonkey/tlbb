--��ҽ���һ�� area ʱ����
function x400920_OnEnterArea( sceneId, selfId )
	NewWorld( sceneId, selfId, 2, 282, 227 )
end

--�����һ�� area ����һ��ʱ��û����ʱ����
function x400920_OnTimer( sceneId, selfId )
	-- ���룬������� area ͣ�������
	StandingTime = QueryAreaStandingTime( sceneId, selfId )
	-- 5�����δ����
	if StandingTime >= 5000 then
		x400920_OnEnterArea( sceneId, selfId )
		ResetAreaStandingTime( sceneId, selfId, 0 )
	end
end

--����뿪һ�� area ʱ����
function x400920_OnLeaveArea( sceneId, selfId )
end

----**********************************
----�¼��б�ѡ��һ��
----**********************************
--function OnEventRequest( sceneId, selfId, targetId, eventId )
--	if	GetNumText()==0	then
--		if	IsHaveMission( sceneId, selfId, 711)>0	 then
--			misIndex = GetMissionIndexByID(sceneId,selfId,711)
--			num = GetMissionParam(sceneId,selfId,misIndex,0)
--			if	num == 1 then
--				NewWorld( sceneId, selfId, 2, 275, 50 )
--			else
--				CallScriptFunction((210231), "OnAbandon",sceneId, selfId)
--			end
--		end
--	end
--end
