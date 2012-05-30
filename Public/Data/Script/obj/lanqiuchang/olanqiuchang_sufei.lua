--ʥ�𴫵�NPC - ����

x050109_g_ScriptId = 050109; --�ű���
x050109_g_name	="�շ�";

--��ӵ�е��¼�ID�б�
x050109_g_eventId_yes = 0;
x050109_g_eventId_no = 1;

--**********************************
--�¼��������
--**********************************
function x050109_OnDefaultEvent( sceneId, selfId, targetId )
	x050109_UpdateEventList( sceneId, selfId, targetId );
end

--**********************************
--�¼��б�
--**********************************
function x050109_UpdateEventList( sceneId, selfId, targetId )
	BeginEvent(sceneId);
		AddText( sceneId, "�ҿ��Խ������ͳ�ȥ���Ƿ�Ҫ���ͣ�" );
		AddNumText( sceneId, x050109_g_ScriptId, "ȷ��", 9, x050109_g_eventId_yes);
		AddNumText( sceneId, x050109_g_ScriptId, "ȡ��", 8, x050109_g_eventId_no);
	EndEvent(sceneId);
	DispatchEventList(sceneId, selfId, targetId);
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x050109_OnEventRequest( sceneId, selfId, targetId, eventId )
	local selectEventId	= GetNumText();
	
	if selectEventId then
		if selectEventId == x050109_g_eventId_yes then
			NewWorld( sceneId, selfId, 30, 166, 264) ;
		else
			return 0;
		end
	end
end

--**********************************
--���ܴ�NPC������
--**********************************
function x050109_OnMissionAccept( sceneId, selfId, targetId, missionScriptId )
end

--**********************************
--�ܾ���NPC������
--**********************************
function x050109_OnMissionRefuse( sceneId, selfId, targetId, missionScriptId )
end
