-- �����ӣ���Ҫʹ�õ��������
-- ���������գ�165��197�� ���Ϻڷ�

--�ű���
x300025_g_scriptId = 300025

x300025_g_MissionId = 552

--��ӵ�е��¼�ID�б�
x300025_g_eventList={212107}

--**********************************
--�¼��������
--**********************************
function x300025_OnDefaultEvent( sceneId, selfId, BagIndex )
	BeginEvent(sceneId)
		AddText(sceneId, "���Ϻڷ�")
		-- �������ǲ��ǵõ�����Ҫ���������ߣ�
		if GetItemCount( sceneId, selfId, 40002070 ) >= 1   then
			if GetItemCount( sceneId, selfId, 40002069 ) >= 1   then
				AddText(sceneId, "�������˺ڷ䣬�ɹ���")
				local misIndex = GetMissionIndexByID(sceneId,selfId,x300025_g_MissionId)
				SetMissionByIndex(sceneId,selfId,misIndex,0,1)
				SetMissionByIndex(sceneId,selfId,misIndex,1,1)
				-- ɾ���������
				DelItem( sceneId, selfId, 40002070, 1 )
				DelItem( sceneId, selfId, 40002069, 1 )
				
				-- ����һ��Ч��
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 139, 0)
				
			else
				AddText(sceneId, "����Ҫ���Ƿ�")
			end
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,-1)
end

--**********************************
--ˢ���¼�
--**********************************
function x300025_OnEventRequest( sceneId, selfId, targetId, eventId )
	--PrintStr("x300025_OnEventRequest")
end

--**********************************
--���ܴ�NPC������
--**********************************
function x300025_OnMissionAccept( sceneId, selfId, targetId )

end

--**********************************
--�ܾ���NPC������
--**********************************
function x300025_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
	--�ܾ�֮��Ҫ����NPC���¼��б�
	--for i, findId in x300025_g_eventList do
	--	if missionScriptId == findId then
	--		UpdateEventList( sceneId, selfId, targetId )
	--		return
	--	end
	--end
end

function x300025_IsSkillLikeScript( sceneId, selfId)
	return 0
end


